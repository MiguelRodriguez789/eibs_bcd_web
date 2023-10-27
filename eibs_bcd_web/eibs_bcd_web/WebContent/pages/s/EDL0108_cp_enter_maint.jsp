<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Maintenance of Commercial Paper</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

	function CheckACC() {
		if (isNaN(document.forms[0].E01DEAACC.value)) {
			alert("A Certificate valid number must be entered");
			document.forms[0].E01DEAACC.value = '';
			document.forms[0].E01DEAACC.focus();
		} else {
  			document.forms[0].submit();
		}
	}

</SCRIPT>

</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "cpMant" class= "datapro.eibs.beans.EDL010801Message"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<body bgcolor="#FFFFFF">

<h3 align="center">Ingreso de Compras y Ventas Adicionales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cp_enter_maint, EDL0108"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0108">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  </p>
  <table class="tbenter" width="100%" border="0">
    <tr>
       <td nowrap >
        	<div align="right">Número de Cuenta :</div>
	    </td>
       <td nowrap >          	
          <INPUT type="text" name="E01DEAACC" size="13" maxlength="12" onkeypress="enterInteger(event)" value="<%= cpMant.getE01DEAACC() %>">
          <a href="javascript:GetAccount('E01DEAACC','','13','<%= client %>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
	    </td>
	</tr>
    <tr>
       <td nowrap >
        	<div align="right">Contraparte :</div>
	    </td>
       <td nowrap >          	
          <INPUT type="text" name="E01DLICUS" size="10" maxlength="9" value="<%= cpMant.getE01DLICUS() %>">
          <a href="javascript:GetCustomerDescId('E01DLICUS','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
	    </td>
	</tr>
    <tr>
       <td nowrap >
        	<div align="right">Tipo de Transacción:</div>
	    </td>
       <td nowrap >          	
          <select name="E01DLIOPT">
            <option value="0" <% if (cpMant.getE01DLIOPT().equals("0")) out.print("selected"); %>>Compra Adicional</option>
            <option value="1" <% if (cpMant.getE01DLIOPT().equals("1")) out.print("selected"); %>>Disponible a la Venta</option>
            <option value="2" <% if (cpMant.getE01DLIOPT().equals("2")) out.print("selected"); %>>Re-Venta</option>
            <option value="3" <% if (cpMant.getE01DLIOPT().equals("3")) out.print("selected"); %>>Re-Compra</option>
            <option value="4" <% if (cpMant.getE01DLIOPT().equals("4")) out.print("selected"); %>>Liberar Custodia</option>
          </select>
	    </td>
	</tr>
  </table>
	<br>
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="CheckACC()">
  </div>
      
  </form>
<script type="text/javascript">
document.forms[0].E01DEAACC.focus();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</body>
</html>
