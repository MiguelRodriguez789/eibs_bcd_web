<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Customer Bills &amp; Account Payable Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT> 

<script type="text/javascript">

function consulta() {
	if (document.forms[0].E01DBAUSR.value > '') {
		document.forms[0].SCREEN.value = "5";	
		var susr = document.forms[0].E01DBAUSR.value;
    	pg = "${pageContext.request.contextPath}/servlet/datapro.eibs.security.JSESD0008?SCREEN=5&E01DBAUSR=" + susr;
   		CenterWindow(pg,650,500,2);
	} else {
		ok1 = confirm("Debe ingresar datos del usuario");
	}
}


function delaut() {
	document.forms[0].SCREEN.value = "2";	
  	if (confirm("Seguro que desea eliminar registro seleccionado?")) {
  		document.forms[0].E01OPETYP.value = '0004';
  		document.forms[0].submit();
  	} else {
  		document.forms[0].E01OPETYP.value = '1000';
  		document.forms[0].submit();
  	}
}

function save() {
	document.forms[0].SCREEN.value = "2";	
  	document.forms[0].E01OPETYP.value = '0001';
  	document.forms[0].submit();
}

function disable() {
    document.getElementById('E01DBABRN').value = "0";
    document.getElementById('E01DBABRN').disabled = true;
    document.getElementById('lupa').style.display ='none';
}

function enable() {
	document.getElementById('lupa').style.display = '';
    document.getElementById('E01DBABRN').disabled = false;
}



</SCRIPT>

</head>

<jsp:useBean id="user" class="datapro.eibs.beans.ESD000801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body bgcolor="#FFFFFF">

<H3 align="center">Autorización Acceso Banco Agencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bank_branch_access, ESD0008"></H3>

<hr size="4">
<%
	String chkAll = "";
	String chkSlt = "";
	if (user.getE01DBAALL().equals("*")) {
		chkAll = "checked";
		chkSlt = "";
	} else {
		chkAll = "";
		chkSlt = "checked";	
	}
%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0008">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE="HIDDEN" NAME="E01OPETYP" VALUE="0002" />

  <table class="tableinfo"  cellspacing="0" cellpadding="2" width="100%" border="0">
    <tr id="trdark"> 
      <td nowrap width="40%"> 
      	<div align="right"> Identificación Usuario :</div>
      </td> 
      <td nowrap width="60%"> 
        <INPUT type="text" name="E01DBAUSR" size="16" maxlength="15" value="<%= user.getE01DBAUSR().trim()%>">
        <INPUT type="hidden" name="E01DSC" >
        <a href="javascript:GetUser('E01DBAUSR','E01DSC',document.forms[0].E01DBAUSR.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
      </td>
    </tr> 
    <tr id="trclear"> 
      <td nowrap width="40%"> 
      	<div align="right"> Banco :</div>
      </td> 
      <td nowrap width="60%"> 
        <INPUT type="text" name="E01DBABNK" size="3" maxlength="2" value="<%= user.getE01DBABNK().trim()%>">
      </td>
    </tr>       
    <tr id="trdark"> 
      <td nowrap width="40%"> 
      	<div align="right">  Agencia :</div>
      </td> 
      <td nowrap width="60%"> 
        <input type="radio" name="E01DBAALL" value="*" <%= chkAll%> onclick="disable();" > Todas las Agencias
      </td>
    </tr>       
    <tr id="trclear"> 
      <td nowrap width="40%"> 
      	<div align="right"> </div>
      </td> 
      <td nowrap width="60%"> 
        <input type="radio" name="E01DBAALL" value="N" <%= chkSlt%> onclick="enable();" > Seleccione Sucursal
    	<input type="text" name="E01DBABRN" id="E01DBABRN" size="5" maxlength="4" value="<%= user.getE01DBABRN().trim()%>" onkeypress="enterInteger(event)" >

    	<a id="lupa" href="javascript:GetBranch('E01DBABRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"  ></a>   

      </td>
    </tr>       
          
  </table>
 
 <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="save()">
   <INPUT  type=button id="EIBSBTN" name="Delete" value="Eliminar" onclick="delaut()">
   <INPUT  type=button id="EIBSBTN" name="Inquiry" value="Consulta" onclick="consulta()">
  </p>  
 
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
</form>
</body>
</html>
