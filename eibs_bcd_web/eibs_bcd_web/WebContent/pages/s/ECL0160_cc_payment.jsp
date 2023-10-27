<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Pago de Tarjeta de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCC" class= "datapro.eibs.beans.ECL0160DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript">
function setAccount() {
	var x = document.getElementById("ACCSEL");
	for (i = 0; i < x.length; i++)
	{
  		if (x.options[i].selected == true) {
			document.forms[0].E01CTAORI.value = x.options[i].value;
		}
	}
}

function getAccount() {
	var x = document.getElementById("ACCSEL");
	if (document.forms[0].E01CTAORI.value.trim() != "" || document.forms[0].E01CTAORI.value != "0") {
		for (i = 0; i < x.length; i++)
		{
			if (x.length == 1 && x.options[i].value == "") {
				alert("Cuenta(s) cerrada(s), bloqueada(s), inactiva(s) o restringida(s).");
				break;
			}
			if (x.options[i].value == document.forms[0].E01CTAORI.value) {
				x.options[i].selected = true;
			}
		}
	}
}

function setCard() {
	var x = document.getElementById("CARDSEL");
	for (i = 0; i < x.length; i++)
	{
		if (x.options[i].selected == true) {
			document.forms[0].E01TARCRE.value = x.options[i].value;
			refillLeftField(' ',20,'E01TARCRE');
		}
	}
}

function getCard() {
	var x = document.getElementById("CARDSEL");
	if (document.forms[0].E01TARCRE.value.trim() != "" || document.forms[0].E01TARCRE.value != "0") {
		for (i = 0; i < x.length; i++)
		{
			if (x.length == 1 && x.options[i].value == "") {
				alert("Tarjeta(s) cerrada(s), bloqueada(s), inactiva(s) o restringida(s).");
				break;
			}
			if (x.options[i].value == document.forms[0].E01TARCRE.value) {
				x.options[i].selected = true;
			}
		}
	}
}

</script>
</head>
<body >
<h3 align="center">Operaciones del Cliente<br>Pago de Tarjeta de Crédito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_payment.jsp, ECL0160"> 
</h3>
<hr size="4">
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0160" onSubmit="document.forms[0].EIBSBTNOK.disabled=true;">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <input type="hidden" name="E01CODCLI" value="<%= msgCC.getE01CODCLI().trim()%>">

  <h4>Información del Cliente</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Identificación del Cliente :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01TIIDCL" size="2" maxlength="1" value="<%= msgCC.getE01TIIDCL().trim()%>" readonly>
              	<input type="text" name="E01IDNCLI" size="10" maxlength="9" value="<%= msgCC.getE01IDNCLI().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01NOMCLI" size="36" maxlength="35" value="<%= msgCC.getE01NOMCLI().trim()%>" readonly>
              </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <h4>Información del Pago</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Número de Cuenta Origen :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="hidden" name="E01CTAORI" value="<%= msgCC.getE01CTAORI().trim()%>">
				<select name="ACCSEL" onChange="setAccount()">
					<OPTION value="">********************</OPTION>
				</select>
				<%
					String accnum = "";
					String accMask = "";
					prodList.initRow();
					while (prodList.getNextRow()) {
             			datapro.eibs.beans.ECL000001Message msg = (datapro.eibs.beans.ECL000001Message) prodList.getRecord();
             			if (msg.getE02DESPRO().equals("0300") || msg.getE02DESPRO().equals("0400")) {
             				accnum = msg.getE02NROPRO();
							accMask = msg.getE02DESPRO() + "XXXXXXXXXXXX" + msg.getE02NROPRO().substring(16,20);
							out.print("<OPTION value=\"" + accnum + "\">" + accMask + "</OPTION>");
			          	}
					}
				%> 
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Número de Tarjeta :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="hidden" name="E01TARCRE" value="<%= msgCC.getE01TARCRE().trim()%>">
				<select name="CARDSEL" onChange="setCard()">
					<OPTION value="">****************</OPTION>
				</select>
				<%
					String cardnum = "";
					String cardMask = "";
					prodList.initRow();
					while (prodList.getNextRow()) {
             			datapro.eibs.beans.ECL000001Message msg = (datapro.eibs.beans.ECL000001Message) prodList.getRecord();
             			if (!(msg.getE02DESPRO().equals("0300")) && !(msg.getE02DESPRO().equals("0400")) && !(msg.getE02DESPRO().equals("TDDA")) && !(msg.getE02DESPRO().equals("TDDI")) && !(msg.getE02DESPRO().equals("TDDY"))) {
             				cardnum = msg.getE02NROPRO();
							cardMask = msg.getE02NROPRO().substring(0,4) + "XXXXXXXX" + msg.getE02NROPRO().substring(12,16);
							out.print("<OPTION value=\"" + cardnum + "\">" + cardMask + "</OPTION>");
			          	}
					}
				%> 
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Monto a Pagar :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01MTOPAG" size="20" maxlength="19" value="<%= msgCC.getE01MTOPAG().trim()%>" onKeyPress="enterDecimal()">
			  </div>
            </td>
            <td nowrap width="16%"> 
            </td>
            <td nowrap width="20%"> 
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

<SCRIPT type="text/javascript">;
        refillLeftField('0',9,'E01IDNCLI');
        refillRightField(' ',35,'E01NOMCLI');
        refillLeftField('0',10,'E01CODCLI');
        getAccount();
        getCard();
</SCRIPT>

</form>
</body>
</html>
