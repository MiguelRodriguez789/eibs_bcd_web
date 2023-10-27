<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Suspensión de Productos y Servicios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ECL0190DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript">
function setCard() {
	var x = document.getElementById("CARDSEL");
	for (i = 0; i < x.length; i++)
	{
		if (x.options[i].selected == true) {
			document.forms[0].E01NROTAR.value = x.options[i].value;
			refillLeftField(' ',20,'E01NROTAR');
		}
	}
}

function getCard() {
	var x = document.getElementById("CARDSEL");
	if (document.forms[0].E01NROTAR.value.trim() != "" || document.forms[0].E01NROTAR.value != "0") {
		for (i = 0; i < x.length; i++)
		{
			if (x.length == 1 && x.options[i].value == "") {
				alert("Tarjeta(s) cerrada(s), bloqueada(s), inactiva(s) o restringida(s).");
				break;
			}
			if (x.options[i].value == document.forms[0].E01NROTAR.value) {
				x.options[i].selected = true;
			}
		}
	}
}

</script>
</head>
<body >
<h3 align="center">Suspensión de Productos y Servicios<br>Suspensión de Tarjeta de Débito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_suspend.jsp, ECL0190"> 
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
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0190" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

  <h4>Información de la Suspensión</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Identificación :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01TIPIDE" size="2" maxlength="1" value="<%= msgCD.getE01TIPIDE().trim() %>" readonly>
                <input type="text" name="E01USRIDN" size="10" maxlength="9" value="<%= msgCD.getE01USRIDN().trim() %>" readonly onBlur="refillLeftField('0',9,'E01USRIDN');">
              </div>
            </td>
            <td nowrap width="16%"> 
            </td>
            <td nowrap width="20%"> 
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Número de Tarjeta :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="hidden" name="E01NROTAR" value="<%= msgCD.getE01NROTAR().trim()%>">
				<select name="CARDSEL" onChange="setCard()">
					<OPTION value="">****************</OPTION>
				<%
					String cardnum = "";
					String cardMask = "";
					prodList.initRow();
					while (prodList.getNextRow()) {
             			datapro.eibs.beans.ECL000001Message msg = (datapro.eibs.beans.ECL000001Message) prodList.getRecord();
             			if (msg.getE02DESPRO().equals("TDDA")) {
             				cardnum = msg.getE02NROPRO();
							cardMask = msg.getE02NROPRO().substring(0,4) + "XXXXXXXX" + msg.getE02NROPRO().substring(12,16);
							out.print("<OPTION value=\"" + cardnum + "\">" + cardMask + "</OPTION>");
			          	}
					}
				%> 
				</select>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Motivo de Suspensión :</div>
            </td>
            <td nowrap width="16%"> 
				<DIV align="left">
					<INPUT type="text" name="E01MOTSUS" size="3" maxlength="2" value="<%= msgCD.getE01MOTSUS().trim()%>" readonly>
					<a href="javascript:GetPlasticStatus('E01MOTSUS','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
				</DIV>
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
        refillLeftField('0',9,'E01USRIDN');
        getCard();
</SCRIPT>

</form>
</body>
</html>
