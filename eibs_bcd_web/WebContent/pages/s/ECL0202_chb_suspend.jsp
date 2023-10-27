<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Suspensión de Productos y Servicios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgChb" class= "datapro.eibs.beans.ECL0202DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "prodList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript">
function setAccount() {
	var x = document.getElementById("ACCSEL");
	for (i = 0; i < x.length; i++)
	{
  		if (x.options[i].selected == true) {
			document.forms[0].E01NROCTA.value = x.options[i].value;
		}
	}
}

function getAccount() {
	var x = document.getElementById("ACCSEL");
	if (document.forms[0].E01NROCTA.value.trim() != "" || document.forms[0].E01NROCTA.value != "0") {
		for (i = 0; i < x.length; i++)
		{
			if (x.length == 1 && x.options[i].value == "") {
				alert("Cuenta(s) cerrada(s), bloqueada(s), inactiva(s) o restringida(s).");
				break;
			}
			if (x.options[i].value == document.forms[0].E01NROCTA.value) {
				x.options[i].selected = true;
			}
		}
	}
}

</script>
</head>
<body >
<h3 align="center">Suspensión de Productos y Servicios<br>Suspensión de Cheques y Chequeras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_suspend.jsp, ECL0202"> 
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
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0202" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <input type="hidden" name="E01MTOSUS" value="<%= msgChb.getE01MTOSUS().trim()%>">
  <INPUT type="hidden" name="E01CHEFIN" value="<%= msgChb.getE01CHEFIN().trim()%>">
  <INPUT type="hidden" name="E01NROSER" value="<%= msgChb.getE01NROSER().trim()%>">

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
              	<input type="text" name="E01TIIDCL" size="2" maxlength="1" value="<%= msgChb.getE01TIIDCL().trim()%>" readonly>
              	<input type="text" name="E01NRIDCL" size="10" maxlength="9" value="<%= msgChb.getE01NRIDCL().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01NOMCLI" size="36" maxlength="35" value="<%= msgChb.getE01NOMCLI().trim()%>" readonly>
              </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <h4>Información de la Suspensión</h4>
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
              	<input type="hidden" name="E01NROCTA" value="<%= msgChb.getE01NROCTA().trim()%>">
				<select name="ACCSEL" onChange="setAccount()">
					<OPTION value="">********************</OPTION>
				<%
					String accnum = "";
					String accMask = "";
					prodList.initRow();
					while (prodList.getNextRow()) {
             			datapro.eibs.beans.ECL000001Message msg = (datapro.eibs.beans.ECL000001Message) prodList.getRecord();
             			if (msg.getE02DESPRO().equals("0300")) {
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
              <div align="right">Motivo de Suspensión :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<SELECT name="E01MOTISU">
					<OPTION value="" <% if (msgChb.getE01MOTISU().equals("")) out.print("selected");%>></OPTION>
					<OPTION value="22PERDIDA" <% if (msgChb.getE01MOTISU().equals("22PERDIDA")) out.print("selected");%>>Pérdida</OPTION>
					<OPTION value="24ROBADA" <% if (msgChb.getE01MOTISU().equals("24ROBADA")) out.print("selected");%>>Robo</OPTION>
				</SELECT>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Opción de Suspensión :</div>
            </td>
            <td nowrap width="16%"> 
				<DIV align="left">
					<INPUT type="radio" name="E01FLGSUS" value="1" <% if(!msgChb.getE01FLGSUS().equals("2")) out.print("checked");%>>Cheque
					<INPUT type="radio" name="E01FLGSUS" value="2" <% if(msgChb.getE01FLGSUS().equals("2")) out.print("checked");%>>Chequera
				</DIV>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Número de Cheque :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01CHEINI" size="13" maxlength="11" value="<%= msgChb.getE01CHEINI().trim() %>" onBlur="refillLeftField('0',10,'E01CHEINI');">
              </div>
            </td>
          </tr>    
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Observaciones :</div>
            </td>
            <td nowrap width="16%" colspan="3"> 
              <div align="left"> 
              	<input type="text" name="E01OBSSUS" size="60" maxlength="50" value="<%= msgChb.getE01OBSSUS().trim() %>" onBlur="refillRightField(' ',50,'E01OBSSUS');">
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
        refillLeftField('0',9,'E01NRIDCL');
        refillRightField(' ',35,'E01NOMCLI');
        getAccount();
</SCRIPT>

</form>
</body>
</html>
