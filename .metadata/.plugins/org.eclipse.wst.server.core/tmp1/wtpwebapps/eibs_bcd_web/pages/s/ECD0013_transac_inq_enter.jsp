<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Transacciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">

function validate() {
	if (document.forms[0].E02CDRTAR.value == "") {
		alert("Por favor, coloque el n�mero de tarjeta.");
		return false;
	}
	else if (document.forms[0].E02FDESDE1.value == "" ||
			document.forms[0].E02FDESDE2.value == "" ||
			document.forms[0].E02FDESDE3.value == "" ||
			document.forms[0].E02FHASTA1.value == "" ||
			document.forms[0].E02FHASTA2.value == "" ||
			document.forms[0].E02FHASTA3.value == "") {
		alert("Por favor, introduzca el intervalo de fechas completo.");
		return false;
	}
	else {
		return true;
	}
}
</script>

</head>
<body>
<h3 align="center">Consulta de Transacciones
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transac_inq_enter.jsp, ECD0013"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECD0013" onSubmit="return validate();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

  <table class="tableinfo" align="center">
    <tr >
    	<td nowrap> 

	<table cellspacing="0" cellpadding="2" width="100%" border="0">
    <tr id="trclear"> 
        <td nowrap colspan="2" width="50%"> 
        	<div align="right">N�mero de Tarjeta :</div>
		</td>
		<TD nowrap colspan="2" width="50%">
			<div align="left">
				<INPUT type="text" name="E02CDRTAR" size="22" maxlength="20" value="">
        	</div>
		</TD>
	<tr id="trdark"> 
        <td nowrap width="25%"> 
          <div align="right">Desde :</div>
        </td>
        <td nowrap width="25%"> 
          <div align="left"> 
                <input type="text" size="3" maxlength="2" name="E02FDESDE1" onKeyPress="enterInteger(event)">
                <input type="text" size="3" maxlength="2" name="E02FDESDE2" onKeyPress="enterInteger(event)">
                <input type="text" size="5" maxlength="4" name="E02FDESDE3" onKeyPress="enterInteger(event)">
                (dd/mm/aaaa)
          </div>
        </td>
		<TD nowrap width="25%"> 
          <DIV align="right">Hasta :</DIV>
        </TD>
        <TD nowrap width="25%"> 
          <DIV align="left"> 
                <INPUT type="text" size="3" maxlength="2" name="E02FHASTA1" onkeypress="enterInteger(event)">
                <INPUT type="text" size="3" maxlength="2" name="E02FHASTA2" onkeypress="enterInteger(event)">
                <INPUT type="text" size="5" maxlength="4" name="E02FHASTA3" onkeypress="enterInteger(event)">
                (dd/mm/aaaa)
		  </DIV>
        </TD>
				
	</tr>
	</table>

        </td>
    </tr>
  </table>
    
  <BR>
  <div align="center"> 
	   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
  
</body>
</html>
