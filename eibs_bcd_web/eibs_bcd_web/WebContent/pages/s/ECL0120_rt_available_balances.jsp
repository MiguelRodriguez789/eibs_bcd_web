<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Disponibilidad de Saldos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "msgBal" class= "datapro.eibs.beans.ECL0120DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
function concat() {
	document.forms[0].E01NROCTA.value =
		document.forms[0].E01NROCTA1.value +
		document.forms[0].E01NROCTA2.value +
		document.forms[0].E01NROCTA3.value +
		document.forms[0].E01NROCTA4.value;
	document.forms[0].E01FECHA.value =
		document.forms[0].E01FECHA1.value +
		document.forms[0].E01FECHA2.value +
		document.forms[0].E01FECHA3.value;
}

</script>
</head>
<body >
<h3 align="center">Disponibilidad de Saldos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_available_balances.jsp, ECL0120"> 
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
	
	try {
		bnk = msgBal.getE01NROCTA().substring(0,4);
	}
	catch (Exception e) {}
	try {
		brn = msgBal.getE01NROCTA().substring(4,8);
	}
	catch (Exception e) {}
	try {
		dv = msgBal.getE01NROCTA().substring(8,10);
	}
	catch (Exception e) {}
	try {
		acc = msgBal.getE01NROCTA().substring(10);
	}
	catch (Exception e) {}
	try {
		d1 = msgBal.getE01FECHA().substring(0,2);
	}
	catch (Exception e) {}
	try {
		d2 = msgBal.getE01FECHA().substring(2,4);
	}
	catch (Exception e) {}
	try {
		d3 = msgBal.getE01FECHA().substring(4,8);
	}
	catch (Exception e) {}

	if (d1.equals("") && d2.equals("") && d3.equals("")) {
		d1 = currUser.getE01RDD();
		if (d1.length() == 1) {
			d1 = "0" + d1;
		}
		d2 = currUser.getE01RDM();
		if (d2.length() == 1) {
			d2 = "0" + d2;
		}
		d3 = currUser.getE01RDY();
		if (d3.length() == 1) {
			d3 = "200" + d3;
		}
		else if (d3.length() == 2) {
			d3 = "20" + d3;
		}
	}

	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (userPO.getHeader23().equals("AVAILABLE")) {
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       alert(\"La cuenta especificada contiene saldo disponible para el monto ingresado.\")");
		out.println("</SCRIPT>");
	}
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0120">
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
              	<input type="hidden" name="E01NROCTA" value="<%= msgBal.getE01NROCTA().trim()%>">
              	<input type="text" name="E01NROCTA1" size="5" maxlength="4" value="<%= bnk %>" onBlur="refillLeftField('0',4,'E01NROCTA1');concat();">
              	<input type="text" name="E01NROCTA2" size="5" maxlength="4" value="<%= brn %>" onBlur="refillLeftField('0',4,'E01NROCTA2');concat();">
              	<input type="text" name="E01NROCTA3" size="3" maxlength="2" value="<%= dv %>" onBlur="refillLeftField('0',2,'E01NROCTA3');concat();">
              	<input type="text" name="E01NROCTA4" size="11" maxlength="10" value="<%= acc %>" onBlur="refillLeftField('0',10,'E01NROCTA4');concat();">
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Identificación :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" name="E01TIPIDE" size="2" maxlength="1" value="<%= msgBal.getE01TIPIDE().trim() %>" readonly>
				<a href="javascript:GetCode('E01TIPIDE','STATIC_client_help_id_type.jsp?clientType=CORPORATIVE')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
                <input type="text" name="E01NROIDN" size="11" maxlength="10" value="<%= msgBal.getE01NROIDN().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',10,'E01NROIDN');">
              </div>
            </td>
          </tr>            
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
              	<input type="hidden" name="E01FECHA" value="<%= msgBal.getE01FECHA().trim() %>">
              	<input type="text" name="E01FECHA1" size="3" maxlength="2" value="<%= d1 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECHA1');concat();">
                <input type="text" name="E01FECHA2" size="3" maxlength="2" value="<%= d2 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01FECHA2');concat();">
                <input type="text" name="E01FECHA3" size="5" maxlength="4" value="<%= d3 %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',4,'E01FECHA3');concat();">
			  </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
                <input type="text" name="E01MONTO" size="20" maxlength="19" value="<%= msgBal.getE01MONTO().trim()%>" onKeyPress="enterDecimal()">
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
