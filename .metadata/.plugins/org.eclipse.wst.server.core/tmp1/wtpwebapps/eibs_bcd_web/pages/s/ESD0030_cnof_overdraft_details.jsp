<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>


<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT Language="javascript">
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>

</head>
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

<H3 align="center">C&oacute;digos de Referencia del Sistema - Causales Cupo no Contratado<img src="<%=request.getContextPath()%>/images/e_ibs.gif"
	align="left" name="EIBS_GIF"
	title="cnof_overdraft_details, ESD0030"></H3>
<hr size="4">
<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
<table class="tableinfo">
   <tr bordercolor="#FFFFFF">
      <td nowrap>
         <table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="trdark">
			   <td nowrap width="30%">
			      <div align="right">Clasificaci&oacute;n :</div>
			   </td>
			   <td nowrap>
			      <div align="left"><input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>"></div>
			   </td>
			</tr>
			<tr id="trclear">
			   <td nowrap width="30%" height="23">
			      <div align="right">C&oacute;digo Causal :</div>
			   </td>
			   <td nowrap height="23">
			      <div align="left">
					<input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
					<input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>">
			      </div>
			   </td>
			</tr>
			<tr id="trdark">
			   <td nowrap width="30%" height="19">
			      <div align="right">Banca :</div>
			   </td>
			   <td nowrap height="19">
			      <div align="left">
			         <eibsinput:cnofc name="refCodes" property="E02CNODCC" value="<%=refCodes.getE02CNODCC()%>" required="false" flag="TB" fn_code="E02CNODCC" fn_description="E02BANCA"  />
                     <input type="text" name="E02BANCA" size="36" maxlength="35" readonly>
                 </div>
			   </td>
			</tr>
			<tr id="trclear">
			   <td nowrap width="30%" height="19">
			      <div align="right">Naturaleza :</div>
			   </td>
			   <td nowrap height="19">
			      <div align="left"> 
			         <eibsinput:cnofc name="refCodes" property="E02CNOAPC" value="<%=refCodes.getE02CNOAPC()%>" required="false" flag="81" fn_code="E02CNOAPC" fn_description="E02NATURA"  />
                     <input type="text" name="E02NATURA" size="36" maxlength="35" readonly>
			      </div>
			   </td>
			</tr>
			<tr id="trdark">
			   <td nowrap width="30%" height="19">
			      <div align="right">Control :</div>
			   </td>
			   <td nowrap height="19">
			      <input type="radio" name="E02CNOCPF" value="Y" <%if (refCodes.getE02CNOCPF().equals("Y")) out.print("checked"); %>>
			      Sí 
			      <input type="radio" name="E02CNOCPF" value="N" <%if (refCodes.getE02CNOCPF().equals("N")) out.print("checked"); %>>
			      No
			   </td>
			</tr>
			<tr id="trclear">
			   <td nowrap width="30%" height="19">
			      <div align="right">% Cupo :</div>
			   </td>
			   <td nowrap height="19">
			      <input type="text" name="E02CNOCST" size="17" maxlength="15" value="<%= refCodes.getE02CNOCST().trim()%>" onkeypress="enterDecimal()">
			   </td>
			</tr>
			<tr id="trdark">
			   <td nowrap width="30%" height="19">
			      <div align="right">Monto Maximo :</div>
			   </td>
			   <td nowrap height="19">
			      <input type="text" name="E02CNOCHG" size="17" maxlength="15" value="<%= refCodes.getE02CNOCHG().trim()%>" onkeypress="enterDecimal()">				
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
