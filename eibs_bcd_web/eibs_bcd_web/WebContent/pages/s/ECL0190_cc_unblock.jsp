<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Activación de Productos y Servicios</title>
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
function validate() {
	if(confirm("Se procederá a desbloquear la tarjeta de débito. ¿Está seguro que desea realizar esta operación?")){
		return true;
	} else {
		return false;
	}
}	

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

</SCRIPT>  

</head>
<body >
<h3 align="center">Activación de Productos y Servicios<br>Desbloqueo de Tarjeta de Débito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cc_unblock.jsp, ECL0190"> 
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
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0190" onSubmit="return validate();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <input type="hidden" name="E01TIPPRO" value="2">

  <h4>Información del Cliente</h4>
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
            	<input type="text" name="E01TIPIDE" value="<%= msgCD.getE01TIPIDE().trim() %>" maxlength="1" size="1" readonly>
            	<input type="text" name="E01USRIDN" value="<%= msgCD.getE01USRIDN().trim() %>" maxlength="9" size="10" readonly onBlur="refillLeftField('0',9,'E01USRIDN');">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01STBNA1" size="36" maxlength="35" value="<%= msgCD.getE01STBNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <h4>Información del Desbloqueo</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
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
             			if (msg.getE02DESPRO().equals("TDDY")) {
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
              <div align="right">Fecha de Vencimiento de la Tarjeta :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01MESVCT" size="3" maxlength="2" value="<%= msgCD.getE01MESVCT().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01MESVCT');">
                <input type="text" name="E01ANOVCT" size="5" maxlength="4" value="<%= msgCD.getE01ANOVCT().trim() %>" onKeyPress="enterInteger(event)" onBlur="refillLeftField('0',2,'E01ANOVCT');">
                (mm/aa)
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
        refillLeftField('0',2,'E01MESVCT');
        refillLeftField('0',2,'E01ANOVCT');
        refillLeftField('0',9,'E01USRIDN');
        getCard();
</SCRIPT>

</form>
</body>
</html>
