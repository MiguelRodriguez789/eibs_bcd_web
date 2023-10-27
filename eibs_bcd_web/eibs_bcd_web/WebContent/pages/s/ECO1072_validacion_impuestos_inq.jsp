<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Control de validacion de Impuestos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO107201Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">
   function enterCode() {           	  
	if (trim(document.forms[0].E01IMPCNV.value).length > 0) {
	    return true;
	}else{
		alert("Es requerido que un Convenio para continuar...");
		document.forms[0].E01IMPCNV.focus();
		return false;
	}
   }
</script>
</head>
<body>

<H3 align="center">Control de validacion de Impuestos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="validacion_impuestos_inq,ECO1072"></H3>
<hr size="4">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1072" onsubmit="enterCode()">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
    <INPUT TYPE=HIDDEN NAME="BNK" VALUE="<%=currUser.getE01UBK()%>">
    <INPUT TYPE=HIDDEN NAME="CUNNUM" VALUE="0">
    

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
		<tr>
	      <td nowrap width="46%"><div align="right">&nbsp;</div></td>
	      <td nowrap width="54%"><div align="left">&nbsp;</div></td>
     	</tr>        	     	     	
        <tr >
          <td nowrap>
              <div align="right">Codigo de Convenio : </div>
          </td>
          <td nowrap>
           	  <eibsinput:help name="msgMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" 
 				help="<%= HelpTypes.COLLECT_DEAL_REQUEST %>"  
 				property="E01IMPCNV" fn_param_one="E01IMPCNV" fn_param_two="document.forms[0].CUNNUM.value"/>         
          </td>          
		</tr>         
		<tr>
	      <td nowrap><div align="right">Formato :</div></td>
	      <td nowrap>
	      	<eibsinput:cnofc name="msgMT" property="E01IMPTFR" value="<%=msgMT.getE01IMPTFR()%>" required="true" flag="VU" fn_code="E01IMPTFR"/>
	      </td>
     	</tr>  
     	 <tr>
	      <td nowrap>&nbsp;</td>
	      <td nowrap>
	      	&nbsp;
	      </td>
     	</tr> 
 		<tr align="center" >
			<td nowrap colspan="2" align="center">
			<div id="DIVSUBMIT" align="center">
				<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
			</div>
			</td>
		</tr>
     </table>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <% } %>
</form>
</body>
</html>
