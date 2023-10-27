<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Conformación de Cheques</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCust" class= "datapro.eibs.beans.ECL0000DSMessage"  scope="session" />
<jsp:useBean id= "msgCheck" class= "datapro.eibs.beans.ECL0100DSMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript">
function validate() {
	var i;
	var x = 0;
	var tries = document.forms[0].E01CCLINT.value;
	var err = document.forms[0].E01CCLERR.value;
	var answer = "";
	var realanswer = "";
	for (i=0; i<=99; i++) {
		answer = document.getElementById("CCLANS" + i);
		if (answer == null) {
			break;
		}
		else {
			answer.value = answer.value.toUpperCase();
			realanswer = document.getElementById("E01CCLANS" + i);
			if (answer.value != realanswer.value) {
				x++;
			}
		}
	}
	
	if (x > err) {
		tries--;
		document.forms[0].E01CCLINT.value = tries;
		if (tries != 0) {
		 	alert("Se ha excedido el máximo de errores permitidos. No se puede validar el cliente. Intentos restantes: " + tries);
		 	document.forms[0].SCREEN.value = 200;
		 	return true;
		}
		else {
			document.forms[0].SCREEN.value = 400;
			return true;
		}
	}
	else {
		return true;
	}
}
</script>

</head>

<body >
<h3 align="center">Conformación de Cheques<BR>Validación del Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_check_holding_validate.jsp, ECL0100"> 
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
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0100" onSubmit="return validate()">
  <INPUT TYPE="hidden" NAME="SCREEN" VALUE="2">
  <INPUT TYPE="hidden" NAME="E01FLAGPR" VALUE="2">
  <input type="hidden" name="E01TIIDCL" value="<%= msgCust.getE01CCLIDT().trim()%>">
  <input type="hidden" name="E01IDNCLI" value="<%= msgCust.getE01CCLIDN().trim()%>">
  <input type="hidden" name="E01NOMCLI" value="<%= msgCust.getE01CCLNA1().trim()%>">
  <input type="hidden" name="E01NROCTA" value="<%= msgCheck.getE01NROCTA().trim()%>">
  <input type="hidden" name="E01NROCHE" value="<%= msgCheck.getE01NROCHE().trim()%>">
  <input type="hidden" name="E01MTOCHE" value="<%= msgCheck.getE01MTOCHE().trim()%>">
  <input type="hidden" name="E01NOMBEN" value="<%= msgCheck.getE01NOMBEN().trim()%>">
  <input type="hidden" name="E01OBSERV" value="<%= msgCheck.getE01OBSERV().trim()%>">
  <INPUT TYPE="hidden" NAME="E01CCLINT" VALUE="<%= msgCust.getE01CCLINT().trim()%>">
  <INPUT TYPE="hidden" NAME="E01CCLERR" VALUE="<%= msgCust.getE01CCLERR().trim()%>">

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
              	<input type="text" name="E01CCLIDT" size="2" maxlength="1" value="<%= msgCust.getE01CCLIDT().trim()%>" readonly>
              	<input type="text" name="E01CCLIDN" size="10" maxlength="9" value="<%= msgCust.getE01CCLIDN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CCLNA1" size="36" maxlength="35" value="<%= msgCust.getE01CCLNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <h4>Dirección</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Dirección 1 :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<input type="text" name="E01CCLAD1" size="45" maxlength="40" value="<%= msgCust.getE01CCLAD1().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CCLCTY" size="35" maxlength="30" value="<%= msgCust.getE01CCLCTY().trim()%>" readonly>
              </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%" > 
              <div align="right">Dirección 2 :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01CCLAD2" size="45" maxlength="40" value="<%= msgCust.getE01CCLAD2().trim()%>" readonly>
			  </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Código Postal :</div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"> 
                <input type="text" name="E01CCLZPC" size="6" maxlength="5" value="<%= msgCust.getE01CCLZPC().trim()%>" readonly>
              </div>
            </td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
  <h4>Preguntas de Desafío</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY> 
     	  <%
     	  int row = 0;
          msgList.initRow(); 
          while (msgList.getNextRow()) {
             datapro.eibs.beans.ECL0000DSMessage msgPart = (datapro.eibs.beans.ECL0000DSMessage) msgList.getRecord();
     	  %>               
          <TR id="trdark"> 
            <TD nowrap width="25%"> 
              <DIV align="right"><%= msgPart.getE01CCLDSC() %> :</DIV>
            </TD>
            <TD nowrap width="25%">
              <DIV align="left">
                <INPUT type="hidden" id="E01CCLANS<%= row %>" name="E01CCLANS<%= row %>" value="<%= msgPart.getE01CCLANS() %>">
                <INPUT type="text" id="CCLANS<%= row %>" name="CCLANS<%= row %>" size="3" maxlength="2" value="">
              </DIV>
            </TD>
            <TD nowrap width="50%"> 
              <DIV align="left"><%= msgPart.getE01CCLEXP() %></DIV>
            </TD>
          </TR>
          <%
          	  row++;
          		}
          %>
        </TBODY></TABLE>
      </td>
    </tr>
  </table>
  <br>
  <div align="center"> 
	   <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </div>

<SCRIPT type="text/javascript">;
        refillLeftField('0',9,'E01CCLIDN');
</SCRIPT>

  </form>
</body>
</html>
