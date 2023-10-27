<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Cambio de Producto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "account" 	class= "datapro.eibs.beans.ESD300001Message"  	scope="session" />

<SCRIPT type="text/javascript">

function CheckACC(){
	if(document.getElementById("E01OLDACC").value.length < 1){
		alert("A valid account number must be entered");
		document.getElementById("E01OLDACC").value='';
		document.getElementById("E01OLDACC").focus();
	} else {
  		document.forms[0].submit();
	}
}

function GetProduct08(name,desc,app,bank)
{
	page= "${pageContext.request.contextPath}/pages/s/EWD0008_client_help_container.jsp"
	fieldName=name;
	fieldAux1 = desc; 
	AppCode = app;
	ProductBank = bank;				
	CenterWindow(page,600,400,1);
}

</SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>
<h3 align="center">Cambio de Producto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ESD3000_acc_product_change.jsp"></h3>
<hr size="4">

<form method="post" name="product_change" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD3000">
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="100">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="1">
    <INPUT TYPE=HIDDEN NAME="Type" id="Type" VALUE="<%= userPO.getType()%>">

  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
	<tr>
    	<td align="right"> 
            N&uacute;mero de Cuenta : 
        </td>
    	<td align="left"> 
            <input type="text" name="E01OLDACC" id="E01OLDACC" size="14" maxlength="12" onkeypress="enterInteger(event)" value="<%= account.getE01OLDACC()%>">
        	<a href="javascript:GetAccountAndProduct('E01OLDACC','E01OLDPRD','','<%= userPO.getType()%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
    	</td>
    </tr>
	<tr>
    	<td align="right"> 
              Producto Previo :
        </td>
    	<td align="left"> 
			<input type="text" name="E01OLDPRD" id="E01OLDPRD" size="5" maxlength="4"value="<%= account.getE01OLDPRD()%>">
        </td>
    </tr>
	<tr>
    	<td align="right"> 
              Nuevo Producto :
        </td>
    	<td align="left"> 
              <input type="text" name="E01NEWPRD" id="E01NEWPRD" size="5" maxlength="4" value="<%= account.getE01NEWPRD()%>">
              <input type="text" name="E01PRDDSC" id="E01PRDDSC" size="45" readonly value="<%= userPO.getHeader10()%>">
              <a href="javascript:GetProduct08('E01NEWPRD','E01PRDDSC','<%= userPO.getType()%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
        </td>
    </tr>
	<tr>
    	<td align="center" colspan="2"> 
			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="CheckACC()">
    	</td>
    </tr>
   </table>
      
<script type="text/javascript">
  document.getElementById("E01OLDACC").focus();
  document.getElementById("E01OLDACC").select();
</script>

</form>
</body>
</html>
