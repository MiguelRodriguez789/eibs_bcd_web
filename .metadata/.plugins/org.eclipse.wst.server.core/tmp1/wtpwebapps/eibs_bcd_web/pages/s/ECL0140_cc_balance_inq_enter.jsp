<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Saldos de Tarjeta de Cr�dito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgBal" class= "datapro.eibs.beans.ECL0140DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript">
function setCard() {
	var x = document.getElementById("CARDSEL");
	for (i = 0; i < x.length; i++)
	{
		if (x.options[i].selected == true) {
			document.forms[0].E01TARNRO.value = x.options[i].value;
			refillLeftField(' ',20,'E01TARNRO');
		}
	}
}

function getCard() {
	var x = document.getElementById("CARDSEL");
	if (document.forms[0].E01TARNRO.value.trim() != "" || document.forms[0].E01TARNRO.value != "0") {
		for (i = 0; i < x.length; i++)
		{
			if (x.length == 1 && x.options[i].value == "") {
				alert("Tarjeta(s) cerrada(s), bloqueada(s), inactiva(s) o restringida(s).");
				break;
			}
			if (x.options[i].value == document.forms[0].E01TARNRO.value) {
				x.options[i].selected = true;
			}
		}
	}
}

</script>

</head>
<body >
<h3 align="center">Operaciones del Cliente<br>Consulta de Saldos de Tarjeta de Cr�dito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_balance_inq_enter.jsp, ECL0140"> 
</h3>
<hr size="4">
<% 

	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	
	String card = "";
	if (msgBal.getE01TARNRO().length() == 20) {
		card = msgBal.getE01TARNRO().substring(4);
	}
	else {
		card = msgBal.getE01TARNRO();
	}
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0140">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <input type="hidden" name="E01CODCLI" value="<%= msgBal.getE01CODCLI().trim() %>">

  <h4>Informaci�n del Cliente</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Identificaci�n del Cliente :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01IDETIP" size="2" maxlength="1" value="<%= msgBal.getE01IDETIP().trim()%>" readonly>
              	<input type="text" name="E01IDECLI" size="10" maxlength="9" value="<%= msgBal.getE01IDECLI().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01NOMCLI" size="36" maxlength="35" value="<%= msgBal.getE01NOMCLI().trim()%>" readonly>
              </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci�n de la Tarjeta</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">N�mero de Tarjeta :</div>
            </td>
            <td nowrap width="70%"> 
              <div align="left"> 
              	<input type="hidden" name="E01TARNRO" value="<%= card %>">
				<select name="CARDSEL" onChange="setCard()">
					<OPTION value="">****************</OPTION>
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
				</select>
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

<SCRIPT type="text/javascript">;
        refillLeftField('0',9,'E01IDECLI');
        refillRightField(' ',35,'E01NOMCLI');
        refillLeftField('0',10,'E01CODCLI');
        getCard();
</SCRIPT>

</form>
</body>
</html>
