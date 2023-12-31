<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>General Ledger Change</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos" 			scope="session" />
<jsp:useBean id= "account" 	class= "datapro.eibs.beans.ESD300001Message"  	scope="session" />

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
<h3 align="center">Cambio de Cuenta Contable<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ESD3000_acc_ledger_change.jsp"></h3>
<hr size="4">

<form method="post" name="ledger_change" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD3000">
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="100">
    <INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="Type" id="Type" VALUE="<%= userPO.getType()%>">
    <INPUT TYPE=HIDDEN NAME="APC" id="APC" >

  <table  class="tbenter" width="100%" border="0" cellspacing=0 cellpadding=2>
	<tr>
    	<td align="right"> 
        	N&uacute;mero de Cuenta : 
        </td>
    	<td align="left"> 
            <input type="text" name="E01OLDACC" id="E01OLDACC" size="15" maxlength="12" onkeypress="enterInteger(event)" value="<%= account.getE01OLDACC()%>">
            <a href="javascript:GetAccount('E01OLDACC','','<%= userPO.getType()%>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
    	</td>
    </tr>
	<tr>
    	<td align="right"> 
              Nuevo Banco :
        </td>
    	<td align="left"> 
    		<eibsinput:text property="E01NEWBNK" name="account" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
        </td>
    </tr>
	<tr>
    	<td align="right"> 
              Nueva Sucursal :
        </td>
    	<td align="left"> 
              <input type="text" name="E01NEWBRN" id="E01NEWBRN" size="5" maxlength="4" value="<%if (account.getE01NEWBRN().equals("0")) {out.println("");} else {out.println(account.getE01NEWBRN());}%>">
			  <a href="javascript:GetBranch('E01NEWBRN',document.forms[0].E01NEWBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
        </td>
    </tr>
	<tr>
    	<td align="right"> 
              Nueva Cuenta Contable :
        </td>
    	<td align="left"> 
              <input type="text" name="E01NEWGLN" id="E01NEWGLN" size="18" maxlength="16" value="<%= account.getE01NEWGLN()%>">
              <a href="javascript:GetLedger('E01NEWGLN',document.forms[0].E01NEWBNK.value,'',document.forms[0].APC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
        </td>
    </tr>
	<tr>
    	<td align="center" colspan="2"> 
			<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
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
