<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Reporte de Operaciones Procesadas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgReport" class= "datapro.eibs.beans.ECL0210DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
function clickIE() {
	if (document.all) {
		return false;
	}
} 
function clickNS(e) {
	if (document.layers||(document.getElementById&&!document.all)) { 
		if (e.which==2||e.which==3) {
			return false;
		}
	}
}

if (document.layers) {
	document.captureEvents(Event.MOUSEDOWN);
	document.onmousedown=clickNS;
} 
else {
	document.onmouseup=clickNS;
	document.oncontextmenu=clickIE;
} 
document.oncontextmenu=new Function("return false");

function concat() {
	if (document.forms[0].SEL[0].selected == true) {
		document.forms[0].E01NROINS.value =
			document.forms[0].E01NROINS1.value +
			document.forms[0].E01NROINS2.value +
			document.forms[0].E01NROINS3.value +
			document.forms[0].E01NROINS4.value;
	}
	else if (document.forms[0].SEL[1].selected == true) {
		document.forms[0].E01NROINS.value =
			document.forms[0].E01NROINS0.value;
	}
	else {
		document.forms[0].E01NROINS.value = "";
	}
}

function validate() {
	if (document.forms[0].E01FECDDI.value == "" ||
		document.forms[0].E01FECDME.value == "" ||
		document.forms[0].E01FECDAN.value == "" ||
		document.forms[0].E01FECHDI.value == "" ||
		document.forms[0].E01FECHME.value == "" ||
		document.forms[0].E01FECHAN.value == "") {
		alert("Por favor, introduzca el intervalo de fechas completo.");
		return false;
	}
}

function instrument() {
	if (document.forms[0].SEL[0].selected == true) {
		document.forms[0].E01NROINS0.value = "";
		document.forms[0].E01NROINS1.focus();
	}
	else if (document.forms[0].SEL[1].selected == true) {
		document.forms[0].E01NROINS1.value = "";
		document.forms[0].E01NROINS2.value = "";
		document.forms[0].E01NROINS3.value = "";
		document.forms[0].E01NROINS4.value = "";
		document.forms[0].E01NROINS0.focus();
	}
}
</script>
</head>
<body >
<h3 align="center">Reporte de Operaciones Procesadas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="operations_report_enter.jsp, ECL0210"> 
</h3>
<hr size="4">
<% 
	String bnk = "";
	String brn = "";
	String dv = "";
	String acc = "";
	
	try {
		bnk = msgReport.getE01NROINS().substring(0,4);
	}
	catch (Exception e) {}
	try {
		brn = msgReport.getE01NROINS().substring(4,8);
	}
	catch (Exception e) {}
	try {
		dv = msgReport.getE01NROINS().substring(8,10);
	}
	catch (Exception e) {}
	try {
		acc = msgReport.getE01NROINS().substring(10);
	}
	catch (Exception e) {}

	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0210" onSubmit="return validate();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Tipo de Operación :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
              	<SELECT name="E01TIPOPE">
					<OPTION value="00" <% if (msgReport.getE01TIPOPE().equals("00")) { out.println("selected"); }%>>[00] - Todas</OPTION>
					<OPTION value="01" <% if (msgReport.getE01TIPOPE().equals("01")) { out.println("selected"); }%>>[01] - Conformación de Cheques</OPTION>
					<OPTION value="02" <% if (msgReport.getE01TIPOPE().equals("02")) { out.println("selected"); }%>>[02] - Transacciones de Cuentas Conformadas</OPTION>
					<OPTION value="03" <% if (msgReport.getE01TIPOPE().equals("03")) { out.println("selected"); }%>>[03] - Disponibilidad de Saldos (Ctas. Jurídicas)</OPTION>
					<OPTION value="04" <% if (msgReport.getE01TIPOPE().equals("04")) { out.println("selected"); }%>>[04] - Consulta de Saldos</OPTION>
					<OPTION value="05" <% if (msgReport.getE01TIPOPE().equals("05")) { out.println("selected"); }%>>[05] - Consulta de Saldos de Tarjeta de Crédito</OPTION>
					<OPTION value="06" <% if (msgReport.getE01TIPOPE().equals("06")) { out.println("selected"); }%>>[06] - Transferencias entre Cuentas</OPTION>
					<OPTION value="07" <% if (msgReport.getE01TIPOPE().equals("07")) { out.println("selected"); }%>>[07] - Pago de Tarjeta de Crédito</OPTION>
					<OPTION value="08" <% if (msgReport.getE01TIPOPE().equals("08")) { out.println("selected"); }%>>[08] - Avance de Efectivo de Tarjeta de Crédito</OPTION>
					<OPTION value="09" <% if (msgReport.getE01TIPOPE().equals("09")) { out.println("selected"); }%>>[09] - Reemisión de Estado de Cuenta</OPTION>
					<OPTION value="10" <% if (msgReport.getE01TIPOPE().equals("10")) { out.println("selected"); }%>>[10] - Suspensión de Tarjeta de Débito</OPTION>
					<OPTION value="11" <% if (msgReport.getE01TIPOPE().equals("11")) { out.println("selected"); }%>>[11] - Activación de Tarjeta de Débito</OPTION>
					<OPTION value="12" <% if (msgReport.getE01TIPOPE().equals("12")) { out.println("selected"); }%>>[12] - Consulta de Chequeras</OPTION>
					<OPTION value="13" <% if (msgReport.getE01TIPOPE().equals("13")) { out.println("selected"); }%>>[13] - Detalle de Chequeras</OPTION>
					<OPTION value="14" <% if (msgReport.getE01TIPOPE().equals("14")) { out.println("selected"); }%>>[14] - Suspensión de Cheques y Chequeras</OPTION>
					<OPTION value="14" <% if (msgReport.getE01TIPOPE().equals("15")) { out.println("selected"); }%>>[15] - Desbloqueo de Tarjeta de Débito</OPTION>
				</SELECT>
              </div>
            </td>
          </tr>            
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Usuario :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" name="E01USERID" size="11" maxlength="10" value="<%= msgReport.getE01USERID().trim()%>">
              </div>
            </td>
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Tipo de Instrumento :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left">
				<input type="radio" name="SEL" value="ACC" onClick="instrument()">
              	Cuenta
              	<input type="hidden" name="E01NROINS" value="<%= msgReport.getE01NROINS().trim()%>">
              	<input type="text" name="E01NROINS1" size="3" maxlength="2" value="<%= bnk %>" onClick="document.forms[0].SEL[0].click()" onBlur="refillLeftField('0',4,'E01NROINS1');concat();">
              	<input type="text" name="E01NROINS2" size="5" maxlength="4" value="<%= brn %>" onClick="document.forms[0].SEL[0].click()" onBlur="refillLeftField('0',4,'E01NROINS2');concat();">
              	<input type="text" name="E01NROINS3" size="4" maxlength="3" value="<%= dv %>" onClick="document.forms[0].SEL[0].click()" onBlur="refillLeftField('0',2,'E01NROINS3');concat();">
              	<input type="text" name="E01NROINS4" size="13" maxlength="12" value="<%= acc %>" onClick="document.forms[0].SEL[0].click()" onBlur="refillLeftField('0',10,'E01NROINS4');concat();">
                <br>
				<input type="radio" name="SEL" value="CRD" onClick="instrument()">
              	Tarjeta
              	<input type="text" name="E01NROINS0" size="21" maxlength="20" value="<%= msgReport.getE01NROINS().trim() %>" onClick="document.forms[0].SEL[1].click()" onBlur="refillLeftField(' ',20,'E01NROINS0');concat();">
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left">
              	Desde 
                <input type="text" name="E01FECDDI" size="3" maxlength="2" value="<%= msgReport.getE01FECDDI().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECDDI');concat();">
                <input type="text" name="E01FECDME" size="3" maxlength="2" value="<%= msgReport.getE01FECDME().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECDME');concat();">
                <input type="text" name="E01FECDAN" size="5" maxlength="4" value="<%= msgReport.getE01FECDAN().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',4,'E01FECDAN');concat();"> Hasta 
                <input type="text" name="E01FECHDI" size="3" maxlength="2" value="<%= msgReport.getE01FECHDI().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECHDI');concat();">
                <input type="text" name="E01FECHME" size="3" maxlength="2" value="<%= msgReport.getE01FECHME().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECHME');concat();">
                <input type="text" name="E01FECHAN" size="5" maxlength="4" value="<%= msgReport.getE01FECHAN().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',4,'E01FECHAN');concat();"> (dd/mm/aaaa)
			  </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
<BR>
<DIV align="center">
	<INPUT type="submit" name="EIBSBTNOK" id="EIBSBTN" value="Enviar">
</DIV>
</form>
</body>
</html>
