<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL030504Message"%>

<html>
<head>
<title>Comisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cifPos" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

<%
if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
%>
	builtNewMenu(ln_i_1_opt);
<%   
}  else  {
	 if(!userPO.getHeader22().equals("CreditLines")) {%>
		builtNewMenu(ln_i_2_opt);
		initMenu();
	<%}else{%>
		builtNewMenu(cuplus_inq_opt);
		initMenu();
<% } 
	}
 %>

function showComDetail(account, code, sequence) {
	var op = getElement("SCREEN").value;
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0305?SCREEN="+op+"&ACCOUNT="+account+"&CODE="+code+"&SEQUENCE="+sequence;
	CenterWindow(url, 700, 450, 2);
}

</script>


</head>

<BODY>

<script> initMenu(); </SCRIPT>

<h3 align="center">Consulta de Comisiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_com.jsp,EDL0305" width="32" height="32"></h3>
<hr size="4">
	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JEDL0305" >
	<input TYPE=HIDDEN NAME="SCREEN" value="6">
	<input TYPE=HIDDEN NAME="ACCOUNT" VALUE="">
	<input TYPE=HIDDEN NAME="CODE" VALUE="">
	<input TYPE=HIDDEN NAME="SEQUENCE" VALUE="">

<% if (cifPos.getNoResult()) { %>
	<table class="tbenter" width=100% height=100%>
		<tr>
			<td> 
				<div align="center"><font size="3"><b>No hay resultados que correspondan a su criterio de búsqueda</b></font></div>
			</td>
		</tr>
	</table>
<% } else { %> 
	<table align="center" class="tableinfo" style="width: 100%">
		<tr> 
			<td nowrap> 
				<table cellspacing="0"  align="center" cellpadding="2" width="100%" class="tbhead" style="border: 0px">
					<tr id="trdark"> 
						<td nowrap width="16%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="20%" > 
							<div align="left"> 
								<input type="text" name="E02CUN2" size="14" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
							</div>
						</td>
						<td nowrap width="16%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap colspan="3" > 
							<div align="left"> 
								<input type="text" name="E02NA12" size="60" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
							</div>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="16%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="20%"> 
							<div align="left"> 
								<input type="text" name="E02ACC" size="14" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="16%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="16%"> 
							<div align="left">
								<b><input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly></b>
							</div>
						</td>
						<td nowrap width="16%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="16%"> 
							<div align="left">
								<b><input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>"></b>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Comisiones</h4>
	<table id="mainTable" align="center" class="tableinfo" style="height: 400px; width: 100%">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="80%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">  
						<th ALIGN=CENTER width="6%">C&oacute;digo</th>
						<th ALIGN=CENTER width="24%">Nombre</th>
						<th ALIGN=CENTER width="10%">Tipo</th>
						<th ALIGN=CENTER width="14%">Base</th>
						<th ALIGN=CENTER width="14%">Factor</th>
						<th ALIGN=CENTER width="18%">Forma Pago</th>
						<th ALIGN=CENTER width="14%">Medio Pago</th>
					</TR>
				</table>
			</td>
			<tr height="95%">    
				<td nowrap="nowrap">      
					<div id="dataDiv1" style="height:400px; overflow:auto;"> 
						<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
						<%
						   cifPos.initRow();
						   while (cifPos.getNextRow()) {
						     EDL030504Message msgList = (EDL030504Message) cifPos.getRecord();
						%> 
							<tr> 
								<td NOWRAP  align="center" width="06%"><a href="javascript:showComDetail('<%= msgList.getE04DCOACC()%>','<%= msgList.getE04DCOCDE()%>','<%= msgList.getE04DCOSEQ()%>')"><%= msgList.getE04DCOCDE() %></a></td>
								<td NOWRAP  align="left"   width="24%"><a href="javascript:showComDetail('<%= msgList.getE04DCOACC()%>','<%= msgList.getE04DCOCDE()%>','<%= msgList.getE04DCOSEQ()%>')"><%= msgList.getE04DCONAR() %></a></td>
								<td NOWRAP  align="center" width="10%">
									<a href="javascript:showComDetail('<%= msgList.getE04DCOACC()%>','<%= msgList.getE04DCOCDE()%>','<%= msgList.getE04DCOSEQ()%>')">
									<%= msgList.getE04DCOAPC().equals("1") ? "IMPUESTO" : "" %>
									<%= msgList.getE04DCOAPC().equals("2") ? "COMISION" : "" %>
									<%= msgList.getE04DCOAPC().equals("6") ? "NOTARIOS" : "" %>
									<%= msgList.getE04DCOAPC().equals("7") ? "OTROS" : "" %>
									</a>
								</td>
								<td NOWRAP  align="center" width="14%">
									<a href="javascript:showComDetail('<%= msgList.getE04DCOACC()%>','<%= msgList.getE04DCOCDE()%>','<%= msgList.getE04DCOSEQ()%>')">
									<%= msgList.getE04DCOBSC().equals("O") ? "MONTO ORIGINAL" : "" %>
									<%= msgList.getE04DCOBSC().equals("B") ? "SALDO CAPITAL" : "" %>
									<%= msgList.getE04DCOBSC().equals("I") ? "SALDO TEORICO" : "" %>
									<%= msgList.getE04DCOBSC().equals("T") ? "TOTAL DEUDA" : "" %>
									</a>
								</td>
								<td NOWRAP  align="center" width="14%">
									<a href="javascript:showComDetail('<%= msgList.getE04DCOACC()%>','<%= msgList.getE04DCOCDE()%>','<%= msgList.getE04DCOSEQ()%>')">
									<%= msgList.getE04DCOTVA().equals("F") ? "MONTO FIJO" : "" %>
									<%= msgList.getE04DCOTVA().equals("P") ? "PORCENTAJE" : "" %>
									<%= msgList.getE04DCOTVA().equals("1") ? "TASA/PERIODO" : "" %>
									</a>
								</td>
								<td NOWRAP  align="center" width="18%">
									<a href="javascript:showComDetail('<%= msgList.getE04DCOACC()%>','<%= msgList.getE04DCOCDE()%>','<%= msgList.getE04DCOSEQ()%>')">
									<%= msgList.getE04DCOPVI().equals("1") ? "APERTURA" : "" %>
									<%= msgList.getE04DCOPVI().equals("2") ? "EN CUOTAS" : "" %>
									<%= msgList.getE04DCOPVI().equals("3") ? "TODAS LAS CUOTAS" : "" %>
									<%= msgList.getE04DCOPVI().equals("4") ? "APERTURA Y CUOTAS" : "" %>
									<%= msgList.getE04DCOPVI().equals("5") ? "APERTURA PERIODICA" : "" %>
									</a>
								</td>
								<td NOWRAP  align="center" width="14%">
									<a href="javascript:showComDetail('<%= msgList.getE04DCOACC()%>','<%= msgList.getE04DCOCDE()%>','<%= msgList.getE04DCOSEQ()%>')">
									<%= msgList.getE04DCOMPG().equals("D") ? "DESEMBOLSO" : "" %>
									<%= msgList.getE04DCOMPG().equals("A") ? "CUENTA CLIENTE" : "" %>
									<%= msgList.getE04DCOMPG().equals("G") ? "CUENTA COTABLE" : "" %>
									</a>
								</td>
							</tr>          
						<% } %>
						</table>
					</div>
				</td>
			</tr>
		</table>
<% } %>
</form>
</body>
</html>
