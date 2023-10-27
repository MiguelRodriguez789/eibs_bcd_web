<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"
	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />

<body>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">C&oacute;digos de Referencia del Sistema -Subtipos de
Papel Valor<img src="<%=request.getContextPath()%>/images/e_ibs.gif"
	align="left" name="EIBS_GIF"
	title="cnof_papel_valor_subtype_detail.jsp, ESD0030"></H3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> 
<INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
	
<%int row = 0; %>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%">
				<div align="right">Clasificaci&oacute;n :</div>
				</td>
				<td nowrap>
				<div align="left">
					<input type="text" name="E02CNOCFL" readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
				</div>
				</td>
			</tr>
			
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="23">
				<div align="right">C&oacute;digo :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
				 </div>
				</td>
		  </tr>
			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="23">
				<div align="right">Descripci&oacute;n :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
				 	<input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>">
				 </div>
				</td>
			</tr>
			
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">C�digo Insrumento :</div>
				</td>
				<td nowrap height="19">
				<div align="left">
					<input type="text" name="E02CNOCPC" size="5" maxlength="45" value="<%= refCodes.getE02CNOCPC().trim()%>">
					<A href="javascript:GetCodeCNOFC('E02CNOCPC','YJ')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">
					</A>
				</div>
				</td>
			</tr>
			
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">Valor Referencial :</div>
				</td>
				<td nowrap height="19">
				<div align="left">
					<input type="text" name="E02CNOCHG" size="16" maxlength="15" value="<%= refCodes.getE02CNOCHG().trim()%>">
				</div>
				</td>
			</tr>
			
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="16%" height="19"> 
              <div align="right">Cuenta Contable de Control :</div>
            </td>
            <td nowrap width="34%" align="left">
            	<input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                <a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,'','')"> 
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            </td>
          </tr>
			
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
					<div align="right">C�digo de Producto :</div>
				</td>
				<td nowrap height="19">
					<div align="left">
						<input type="text" name="E02CNOMID" size="5" maxlength="4" value="<%= refCodes.getE02CNOMID().trim()%>">
					</div>
				</td>
			</tr>
			
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
					<div align="right">Tipo de Chequera :</div>
				</td>
				<td nowrap height="19">
					<div align="left">
						<input type="text" name="E02CNOMIC" size="3" maxlength="2" value="<%= refCodes.getE02CNOMIC().trim()%>">
						<a href="javascript:GetTypCHK('E02CNOMIC','',document.forms[0].E02CNOMID.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></div>

</form>
</body>
</html>
