<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Lista de Credilinea</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "HeadInfo" class="datapro.eibs.beans.EPV015301Message" scope="session" />
<jsp:useBean id= "EPV015307List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

<% if(userPO.getHeader22().equals("CreditLines")) {%>
		builtNewMenu(cuplus_inq_opt);
		initMenu();
<% } %>

function goAction(op) {
	getElement("opt").value = op;
	document.forms[0].submit();
}

</SCRIPT>  

</head>

<BODY>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	} 	
%>

<h3 align="center">Eventos Hist&oacute;ricos - Credilinea<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cuplus_eventos_list.jsp, EPV0153"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0153" >
	<input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
	<%int row = 0; %>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%" > 
							<div align="left">
								<eibsinput:text property="E01DEACUN" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01CUSNA1" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEATYP" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<eibsinput:text property="E01DEAACC" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01DEACCY" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEAPRO" name="HeadInfo" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>

	<TABLE  id="mainTable" class="tableinfoList" style="max-height:400px;">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%" >
					<tr id="trdark">
						<th align=CENTER nowrap width="15%">Fecha</th>
						<th align=LEFT nowrap width="25%">&nbsp;&nbsp;Evento</th>
						<th align=CENTER nowrap width="13%">&nbsp;&nbsp;Aumento</th>
						<th align=CENTER nowrap width="13%">&nbsp;&nbsp;Disminucion</th>
						<th align=CENTER nowrap width="13%" colspan="2">&nbsp;&nbsp;Saldo Disponible</th>
						<th align=CENTER nowrap width="5%">&nbsp;&nbsp;Tasa</th>
						<th align=CENTER nowrap width="6%">&nbsp;&nbsp;Status</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr  height="100%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="max-height:400px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
						EPV015307List.initRow();
						boolean firstTime = true;
						String chk = "";
						while (EPV015307List.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
							datapro.eibs.beans.EPV015307Message msgList = (datapro.eibs.beans.EPV015307Message) EPV015307List.getRecord();
					%>
						<tr id="dataTable<%= EPV015307List.getCurrentRow() %>"> 
							<td NOWRAP  align=CENTER width="15%"><%= Util.formatCustomDate(currUser.getE01DTF(),msgList.getE07HEVRDM(),msgList.getE07HEVRDD(),msgList.getE07HEVRDY())%></td>
							<td NOWRAP align=LEFT width="25%">&nbsp;
								<%= msgList.getE07HEVTYP().equals("A") ? "APERTURA" : "" %>
								<%= msgList.getE07HEVTYP().equals("M") ? "MANTENIMIENTO" : "" %>
								<%= msgList.getE07HEVTYP().equals("D") ? "DESEMBOLSOS" : "" %>
								<%= msgList.getE07HEVTYP().equals("I") ? "INCREMENTO CUPO" : "" %>
								<%= msgList.getE07HEVTYP().equals("N") ? "DECREMENTO CUPO" : "" %>
								<%= msgList.getE07HEVTYP().equals("R") ? "APERTURA" : "" %>
								<%= msgList.getE07HEVTYP().equals("S") ? "CAMBIO DE ESTATUS" : "" %>
								<% if (msgList.getE07HEVTYP().equals("S")){%>
								<%-- <a href="javascript:showStatusReason('<%=msgList.getE07HEVRMK().trim()%>','','','credit','<%=msgList.getE07HEVMTV().trim()%>','<%=msgList.getE07DSCMTV().trim()%>');">&nbsp;CAMBIO DE ESTATUS</a> --%>
								<% } %>	
							</td>
							<!--Aumento -->
							<td NOWRAP align=RIGHT width="13%">&nbsp;
								<%= msgList.getE07HEVTYP().equals("A") || msgList.getE07HEVTYP().equals("R") ||  msgList.getE07HEVTYP().equals("I") ? Util.formatCCY(msgList.getE07HEVAMT()) : "-" %>
							</td>             
							<!-- Disminucion -->
							<td NOWRAP  align=RIGHT width="13%">
								<%= msgList.getE07HEVTYP().equals("D") || msgList.getE07HEVTYP().equals("N") ? Util.formatCCY(msgList.getE07HEVAMT()) : "-" %>
							</td>             
							<!--Saldo Disponible-->
							<td NOWRAP  align=RIGHT width="13%"><%= Util.formatCCY(msgList.getE07HEVDIS())%></td>             
							<!--RATE -->
							<td NOWRAP  align=CENTER width="5%">&nbsp;
								<%= msgList.getE07HEVTYP().equals("R")  || msgList.getE07HEVTYP().equals("A") || msgList.getE07HEVTYP().equals("M") ? msgList.getE07HEVRTE() : "-" %>
							</td>            
							<!--STATUS -->
							<td NOWRAP  align=CENTER width="6%">&nbsp;
								<% if(msgList.getE07HEVTYP().equals("S")  || msgList.getE07HEVTYP().equals("A") || msgList.getE07HEVTYP().equals("M")) { %>
								<%= msgList.getE07HEVSTS().equals(" ") ? "Pendiente" : "" %>
								<%= msgList.getE07HEVSTS().equals("1") ? "Activo" : "" %>
								<%= msgList.getE07HEVSTS().equals("2") ? "Inactivo" : "" %>
								<%= msgList.getE07HEVSTS().equals("3") ? "Bloqueado" : "" %>
								<%= msgList.getE07HEVSTS().equals("4") ? "Bloqueo DEF" : "" %>
								<%= msgList.getE07HEVSTS().equals("5") ? "Cancelado" : "" %>
								<%= msgList.getE07HEVSTS().equals("6") ? "Cancelado" : "" %>
								<%}%>          		 
							</td>   
						</tr>
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	
	<TABLE  class="tbenter" WIDTH="98%" ALIGN="center"  height="10%">
		<TR>
			<TD WIDTH="50%" ALIGN=LEFT height="25">
			<% 
				if ( EPV015307List.getShowPrev() ) {
					int pos = EPV015307List.getFirstRec() - 51;
					out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.salesplatform.JSEPV0153DADC?SCREEN=700&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
				}
			%>
			</TD>
			<TD WIDTH="50%" ALIGN=RIGHT height="25">
			<% 
				if ( EPV015307List.getShowNext() ) {
					int pos = EPV015307List.getLastRec();
					out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.salesplatform.JSEPV0153DADC?SCREEN=700&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
				}
			%>
			</TD>
		</TR>
	</TABLE>

</form>
</body>
</html>
