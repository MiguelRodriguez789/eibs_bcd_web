<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Transacciones de Cuentas Conformadas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCheck" class= "datapro.eibs.beans.ECL0110DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
function concat() {
	document.forms[0].E01NROCTA.value =
		document.forms[0].E01NROCTA1.value +
		document.forms[0].E01NROCTA2.value +
		document.forms[0].E01NROCTA3.value +
		document.forms[0].E01NROCTA4.value;
	document.forms[0].E01FECDES.value =
		document.forms[0].E01FECDES1.value +
		document.forms[0].E01FECDES2.value +
		document.forms[0].E01FECDES3.value;
	document.forms[0].E01FECHAS.value =
		document.forms[0].E01FECHAS1.value +
		document.forms[0].E01FECHAS2.value +
		document.forms[0].E01FECHAS3.value;
}

function validate() {
	if (document.forms[0].E01BUSFEC.checked == true) {
		if (document.forms[0].E01FECDES1.value == "" ||
			document.forms[0].E01FECDES2.value == "" ||
			document.forms[0].E01FECDES3.value == "" ||
			document.forms[0].E01FECHAS1.value == "" ||
			document.forms[0].E01FECHAS2.value == "" ||
			document.forms[0].E01FECHAS3.value == "") {
			alert("Por favor, introduzca el intervalo de fechas completo.");
			return false;
		}
	}
	else if (document.forms[0].E01BUSMTO.checked == true) {
		if (document.forms[0].E01MTODES.value == "0,00" ||
			document.forms[0].E01MTOHAS.value == "0,00") {
			alert("Por favor, introduzca el intervalo de montos completo, distintos de cero.");
			return false;
		}
		else if (document.forms[0].E01MTODES.value > document.forms[0].E01MTOHAS.value) {
			alert("El intervalo de montos está incorrecto.");
			return false;
		}
	}
	else {
		return true;
	}
}
</script>
</head>
<body >
<h3 align="center">Transacciones de Cuentas Conformadas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_check_holding_inq_enter.jsp, ECL0110"> 
</h3>
<hr size="4">
<% 
	String bnk = "";
	String brn = "";
	String dv = "";
	String acc = "";
	String d1 = "";
	String d2 = "";
	String d3 = "";
	String h1 = "";
	String h2 = "";
	String h3 = "";
	
	try {
		bnk = msgCheck.getE01NROCTA().substring(0,4);
	}
	catch (Exception e) {}
	try {
		brn = msgCheck.getE01NROCTA().substring(4,8);
	}
	catch (Exception e) {}
	try {
		dv = msgCheck.getE01NROCTA().substring(8,10);
	}
	catch (Exception e) {}
	try {
		acc = msgCheck.getE01NROCTA().substring(10);
	}
	catch (Exception e) {}
	try {
		d1 = msgCheck.getE01FECDES().substring(0,2);
	}
	catch (Exception e) {}
	try {
		d2 = msgCheck.getE01FECDES().substring(2,4);
	}
	catch (Exception e) {}
	try {
		d3 = msgCheck.getE01FECDES().substring(4,8);
	}
	catch (Exception e) {}
	try {
		h1 = msgCheck.getE01FECHAS().substring(0,2);
	}
	catch (Exception e) {}
	try {
		h2 = msgCheck.getE01FECHAS().substring(2,4);
	}
	catch (Exception e) {}
	try {
		h3 = msgCheck.getE01FECHAS().substring(4,8);
	}
	catch (Exception e) {}

	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0110" onSubmit="return validate();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Número de Cuenta :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
              	<input type="hidden" name="E01NROCTA" value="<%= msgCheck.getE01NROCTA().trim()%>">
              	<input type="text" name="E01NROCTA1" size="5" maxlength="4" value="<%= bnk %>" onBlur="refillLeftField('0',4,'E01NROCTA1');concat();">
              	<input type="text" name="E01NROCTA2" size="5" maxlength="4" value="<%= brn %>" onBlur="refillLeftField('0',4,'E01NROCTA2');concat();">
              	<input type="text" name="E01NROCTA3" size="3" maxlength="2" value="<%= dv %>" onBlur="refillLeftField('0',2,'E01NROCTA3');concat();">
              	<input type="text" name="E01NROCTA4" size="11" maxlength="10" value="<%= acc %>" onBlur="refillLeftField('0',10,'E01NROCTA4');concat();">
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">
				<input type="checkbox" name="E01BUSFEC" value="X">
                Fecha :
              </div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
              	<input type="hidden" name="E01FECDES" value="<%= msgCheck.getE01FECDES().trim()%>">
              	<input type="hidden" name="E01FECHAS" value="<%= msgCheck.getE01FECHAS().trim()%>">Desde
                <input type="text" name="E01FECDES1" size="3" maxlength="2" value="<%= d1 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECDES1');concat();">
                <input type="text" name="E01FECDES2" size="3" maxlength="2" value="<%= d2 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECDES2');concat();">
                <input type="text" name="E01FECDES3" size="5" maxlength="4" value="<%= d3 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',4,'E01FECDES3');concat();"> Hasta 
                <input type="text" name="E01FECHAS1" size="3" maxlength="2" value="<%= h1 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECHAS1');concat();">
                <input type="text" name="E01FECHAS2" size="3" maxlength="2" value="<%= h2 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECHAS2');concat();">
                <input type="text" name="E01FECHAS3" size="5" maxlength="4" value="<%= h3 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',4,'E01FECHAS3');concat();"> (dd/mm/aaaa)
			  </div>
            </td>
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">
				<input type="checkbox" name="E01BUSMTO" value="X">
                Monto :
              </div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                Desde <input type="text" name="E01MTODES" size="20" maxlength="19" value="<%= msgCheck.getE01MTODES().trim()%>" onKeyPress="enterDecimal()">
                Hasta <input type="text" name="E01MTOHAS" size="20" maxlength="19" value="<%= msgCheck.getE01MTOHAS().trim()%>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Estado :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
              	<SELECT name="E01ESTADO">
					<OPTION value=" " <% if (!msgCheck.getE01ESTADO().equals("A") && !msgCheck.getE01ESTADO().equals("R")) { out.println("selected"); }%>></OPTION>
					<OPTION value="A" <% if (msgCheck.getE01ESTADO().equals("A")) { out.println("selected"); }%>>Activo</OPTION>
					<OPTION value="R" <% if (msgCheck.getE01ESTADO().equals("R")) { out.println("selected"); }%>>Reversado</OPTION>
				</SELECT>
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
