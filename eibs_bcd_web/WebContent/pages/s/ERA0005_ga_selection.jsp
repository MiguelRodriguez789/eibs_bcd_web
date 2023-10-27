<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Collaterals Assignment</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "gaBasic" class= "datapro.eibs.beans.ERA000501Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<SCRIPT type="text/javascript">

	function updateAccount(key) {
		document.getElementById("help1").style.visibility = "hidden";
		getElement("ACCOUNT1").disabled = true;
		getElement("ACCOUNT1").value = "";
		document.getElementById("help2").style.visibility = "hidden";
		getElement("ACCOUNT2").disabled = true;
		getElement("ACCOUNT2").value = "";
		document.getElementById("helpc").style.visibility = "hidden";
		getElement("CUSTOMER").disabled = true;
		getElement("CUSTOMER").value = "";
		document.getElementById("help3").style.visibility = "hidden";
		getElement("ACCOUNT3").disabled = true;
		getElement("ACCOUNT3").value = "";
		document.getElementById("help4").style.visibility = "hidden";
		getElement("ACCOUNT4").disabled = true;
		getElement("ACCOUNT4").value = "";

		switch (key) {
		case '1':
			document.getElementById("help1").style.visibility = "visible";
			getElement("ACCOUNT1").disabled = false;
			break;
		case '2':
			document.getElementById("help2").style.visibility = "visible";
			getElement("ACCOUNT2").disabled = false;
			break;
		case '3':
			document.getElementById("helpc").style.visibility = "visible";
			getElement("CUSTOMER").disabled = false;
			document.getElementById("help3").style.visibility = "visible";
			getElement("ACCOUNT3").disabled = false;
			break;
		case '4':
			document.getElementById("help4").style.visibility = "visible";
			getElement("ACCOUNT4").disabled = false;
			break;
		default:
			break;
		}
	}	

	function CheckACC() {
		var key = getElementChecked("OPTION").value;
		switch (key) {
		case '1':
			getElement("ACCOUNT").value = getElement("ACCOUNT1").value;
			break;
		case '2':
			getElement("ACCOUNT").value = getElement("ACCOUNT2").value;
			break;
		case '4':
			getElement("ACCOUNT").value = getElement("ACCOUNT4").value;
			break;
		default:
			getElement("ACCOUNT").value = "";
			break;
		}

		var acc = getElementChecked("OPTIONACC").value;
		if (acc == 2) {
			getElement("OTHERACC").value = getElement("DEPOSITACC").value;
		} else {
			getElement("OTHERACC").value = getElement("NONEACC").value;
		}
		
		return true;
	}
	
	function updateWarranty(value) {
		if (value == 2) {
			document.getElementById("helpNo").style.visibility = "hidden";
			getElement("NONEACC").disabled = true;
			getElement("NONEACC").value = "";
			document.getElementById("helpYes").style.visibility = "visible";
			getElement("DEPOSITACC").disabled = false;
		} else {
			document.getElementById("helpYes").style.visibility = "hidden";
			getElement("DEPOSITACC").disabled = true;
			getElement("DEPOSITACC").value = "";
			document.getElementById("helpNo").style.visibility = "visible";
			getElement("NONEACC").disabled = false;
		}
	}

</SCRIPT>

</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>


<body>

<h3 align="center">Asignación de Garantías
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ga_selection, ERA0005"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0005" onsubmit="return CheckACC()">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
	<INPUT TYPE=HIDDEN NAME="ACCOUNT" VALUE="">
	<INPUT TYPE=HIDDEN NAME="OTHERACC" VALUE="">
  
  <br>
  
  <table class="tableinfo" align="center" style="width: 70%">
  	<tr> 
    	<td nowrap> 
        	<table width="100%" cellpadding="0" cellspacing="0">
          		<tr id="trdark" > 
            		<td width="5%" valign="bottom"> 
              			<div align="right">
                			<input type="radio" name="OPTION" value="1" checked onclick="updateAccount(this.value)">
                		</div>
            		</td>
            		<td width="70%" align="left"> 
              			<p>1. Préstamos, Aceptaciones, Inversiones, Etc : &nbsp;&nbsp; 
                		<input type="text" name="ACCOUNT1" size="13" maxlength="12" 
                			value="<%= userPO.getHeader1().trim()%>">
                		<a id="help1" href="javascript:GetAccount('ACCOUNT1','','AS','<%= client %>')" style="visibility: visible;">
                			<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
               			</p>
            		</td>
            		<td width="25%">&nbsp;</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="5%" valign="bottom"> 
              			<div align="right"> 
                			<input type="radio" name="OPTION" value="2" onclick="updateAccount(this.value)">
              			</div>
            		</td>
            		<td width="70%" align="left"> 
              			<p>2. Cartas de Crédito, Cobranzas : &nbsp;&nbsp;  
                		<input type="text" size="13" maxlength="12" onKeyPress="enterInteger(event)" name="ACCOUNT2" 
                			value="<%= userPO.getHeader2().trim()%>" disabled>
                		<a id="help2" href="javascript:GetAccount('ACCOUNT2','','LC','<%= client %>')" style="visibility: hidden;">
                			<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              			</p>
            		</td>
            		<td width="25%">&nbsp;</td>
          		</tr>
          		<tr id="trdark"> 
            		<td width="5%" valign="bottom"> 
              			<div align="right">
                			<input type="radio" name="OPTION" value="3" onclick="updateAccount(this.value)">
                		</div>
            		</td>
            		<td width="70%" align="left"> 
              			<p>3. Garantías a Líneas de Crédito : &nbsp;&nbsp;   
                			(Cliente)&nbsp;&nbsp;<input type="text" name="CUSTOMER" size="10" maxlength="9" onKeyPress="enterInteger(event)" 
                				value="<%= userPO.getCusNum().trim().equals("") ? client : userPO.getHeader3().trim()%>" disabled>
                			<a id="helpc" href="javascript:GetCustomer('CUSTOMER')" style="visibility: hidden;">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
                			(Línea)&nbsp;&nbsp;<input type="text" name="ACCOUNT3" size="06" maxlength="4" onKeyPress="enterInteger(event)" 
                				value="<%= userPO.getHeader3().trim()%>" disabled>
                			<a id="help3" href="javascript:GetCreditLine('ACCOUNT3',document.forms[0].CUSTOMER.value)" style="visibility: hidden;">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              			</p>
            		</td>
            		<td width="25%">&nbsp;</td>
          		</tr>
          		<tr id="trclear" > 
            		<td width="5%" valign="bottom"> 
              			<div align="right">
                			<input type="radio" name="OPTION" value="4" onclick="updateAccount(this.value)">
                		</div>
            		</td>
            		<td width="60%" align="left"> 
              			<p>4. Garantías a Productos Externos : &nbsp;&nbsp; 
                			<input type="text" name="ACCOUNT4" size="13" maxlength="12" 
                				value="<%= userPO.getHeader4().trim()%>" disabled>
                			<a id="help4" href="javascript:GetAccount('ACCOUNT4','','70','<%= client %>')" style="visibility: hidden;">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
               			</p>
            		</td>
            		<td width="35%">&nbsp;</td>
          		</tr>
          	</table>
       	</td>
   	</tr>
  </table>  		
  <br>
  <table class="tableinfo" align="center" style="width: 70%">
  	<tr> 
    	<td nowrap> 
        	<table width="100%" cellpadding="0" cellspacing="0">
          		<tr id="trdark"> 
            		<td width="5%" valign="bottom"> 
              			<div align="right">
                			<input type="radio" name="OPTIONACC" value="1" checked onclick="updateWarranty(this.value)">
                		</div>
            		</td>
            		<td nowrap align="center"  width="70%"> 
              			<div align="left">Numero de Garantía <b>&nbsp; (Cuenta No Depósito) &nbsp;</b>
                			<input type="text" name="NONEACC" size="13" maxlength="12"  value="<%= userPO.getHeader6().trim()%>">
                			<a id="helpNo" href="javascript:GetAccount('NONEACC','','91','')" style="visibility: visible;"> 
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                		</div>
            		</td>
            		<td nowrap align="center"  width="25%">&nbsp;</td>
          		</tr>
          		<tr id="trclear"> 
            		<td width="5%" valign="bottom"> 
              			<div align="right">
                			<input type="radio" name="OPTIONACC" value="2" onclick="updateWarranty(this.value)">
                		</div>
            		</td>
            		<td nowrap align="center"  width="70%"> 
              			<div align="left">Número de Garantía <b>&nbsp; (Con Cuenta Depósito) &nbsp;</b> 
                			<input type="text" name="DEPOSITACC" size="13" maxlength="12" value="<%= userPO.getHeader7().trim()%>" disabled>
                			<a id="helpYes" href="javascript:GetAccount('DEPOSITACC','','LI','<%= client %>')" style="visibility: hidden;">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
                		</div>
            		</td>
            		<td nowrap align="center"  width="25%">&nbsp;</td>
          		</tr>
        	</table>
      </td>
    </tr>
  </table>
  
  <p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
<script type="text/javascript">
   radioClick("OPION", <%=gaBasic.getE01RCLTIPO()%>);
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
%> 
    <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
<%
      error.setERRNUM("0");
 }
%> 

  
</form>
</body>
</html>
