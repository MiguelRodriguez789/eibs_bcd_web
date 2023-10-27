<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
<SCRIPT Language="javascript">
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>
	
	
</head>
<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<body>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
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

<H3 align="center">C&oacute;digos de Referencia del Sistema - Paquetes<img src="<%=request.getContextPath()%>/images/e_ibs.gif"
	align="left" name="EIBS_GIF"
	title="cnof_paquetes_details_mp.jsp, ESD0030"></H3>
<hr size="4">
<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">

<%int row = 0; %>

<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%">
					<div align="right">Clasificaci&oacute;n :</div>
				</td>
				<td nowrap>
					<div align="left"><input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>"></div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">C&oacute;digo :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
					<input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>">
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Paquete Activo :</div>
	            </td>
	            <td nowrap height="19"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOCPF" value="Y" <%if (refCodes.getE02CNOCPF().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOCPF" value="N" <%if (refCodes.getE02CNOCPF().equals("N")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>

	          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
	            <td nowrap width="25%"> 
                   <div align="right">Código de Comision :</div>
    	        </td>
    	        <td nowrap> 
                   <div align="left"> 
                      <input type="text" name="E02CNOUS1" size="4" maxlength="5" value="<%=refCodes.getE02CNOUS1().trim()%>" readonly>
                      <a href="javascript:GetCommDef('E02CNOUS1','E02DSCUS1')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                      <input type="text" name="E02DSCUS1" readonly size="60" maxlength="60" value="<%=refCodes.getE02DSCUS1().trim()%>">
                   </div>
    	        </td>
	          </tr>



		</table>
		</td>
	</tr>
</table>

   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  
	    
</form>
</body>
</html>
