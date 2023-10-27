<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Clave Control de Codigo de Barras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msg" class= "datapro.eibs.beans.ECO107301Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">
   function enterCode() {           	  
	if (trim(document.forms[0].E01CCLCCO.value).length > 0) {
	    return true;
	}else{
		alert("Coloque clave de control para continuar..!!!");
		document.forms[0].E01CCLCCO.focus();
		return false;
	}
   }
</script>
</head>
<body>

<H3 align="center">Clave Control de Codigo de Barras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="control_cod_barra.jsp,ECO1073"></H3>
<hr size="4">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECO1073" onsubmit="enterCode()">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
    <INPUT TYPE=HIDDEN NAME="H01OPECOD" VALUE="<%=msg.getE01CCLCCO().equals("")?"0005":"0003" %>">
    
    <INPUT TYPE=HIDDEN NAME="E01CCLBNK" VALUE="<%=currUser.getE01UBK()%>">
    

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
		<tr>
	      <td nowrap width="50%"><div align="right">&nbsp;</div></td>
	      <td nowrap width="50%"><div align="left">&nbsp;</div></td>
     	</tr>        	     	     	        
		<tr>
	      <td nowrap><div align="right">Clave de Control :</div></td>
	      <td nowrap>	       
	      	<input type="text" name="E01CCLCCO" maxlength="25" size="30" value="<%=msg.getE01CCLCCO()%>" >	      
	      </td>
     	</tr>  
     	 <tr>
	      <td nowrap>&nbsp;</td>
	      <td nowrap>&nbsp;</td>
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
