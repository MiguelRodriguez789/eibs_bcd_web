<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Reemisión de Estado de Cuenta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "stBalances" class= "datapro.eibs.beans.ECL018001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript">
function setAccount() {
	var x = document.getElementById("ACCSEL");
	for (i = 0; i < x.length; i++)
	{
  		if (x.options[i].selected == true) {
			document.forms[0].E01STBACC.value = x.options[i].value;
		}
	}
}

function getAccount() {
	var x = document.getElementById("ACCSEL");
	if (document.forms[0].E01STBACC.value.trim() != "" || document.forms[0].E01STBACC.value != "0") {
		for (i = 0; i < x.length; i++)
		{
			if (x.length == 1 && x.options[i].value == "") {
				alert("Cuenta(s) cerrada(s), bloqueada(s), inactiva(s) o restringida(s).");
				break;
			}
			if (x.options[i].value == document.forms[0].E01STBACC.value) {
				x.options[i].selected = true;
			}
		}
	}
}

</script>
</head>
<body >
<h3 align="center">Operaciones del Cliente<br>Reemisión de Estado de Cuenta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="account_st_enter.jsp, ECL0180"> 
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
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0180">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <input type="hidden" name="E01STBUSR" value="<%= stBalances.getE01STBUSR().trim()%>">

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
              	<input type="text" name="E01STBTID" size="2" maxlength="1" value="<%= stBalances.getE01STBTID().trim()%>" readonly>
              	<input type="text" name="E01STBIDN" size="10" maxlength="9" value="<%= stBalances.getE01STBIDN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01STBNA1" size="36" maxlength="35" value="<%= stBalances.getE01STBNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <h4>Información de la Cuenta</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Número de Cuenta :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              	<input type="hidden" name="E01STBACC" value="<%= stBalances.getE01STBACC().trim()%>">
				<select name="ACCSEL" onChange="setAccount()">
					<OPTION value="">********************</OPTION>
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
				</select>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">
                Período :
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
              	<input type="text" name="E01MESEEC" size="3" maxlength="2" value="<%= stBalances.getE01MESEEC().trim()%>" onBlur="refillLeftField('0',2,'E01MESEEC');">
              	<input type="text" name="E01ANOEEC" size="5" maxlength="4" value="<%= stBalances.getE01ANOEEC().trim()%>" onBlur="refillLeftField('0',2,'E01ANOEEC');"> (mm/aa)
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

<SCRIPT type="text/javascript">
        refillLeftField('0',9,'E01STBIDN');
        refillRightField(' ',35,'E01STBNA1');
		refillLeftField('0',10,'E01STBUSR');
        refillLeftField('0',20,'E01STBACC');
        getAccount();
</SCRIPT>

</form>
</body>
</html>
