<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Conformación de Cheques</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCheck" class= "datapro.eibs.beans.ECL0100DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
function concat() {
	document.forms[0].E01NROCTA.value =
		document.forms[0].E01NROCTA1.value +
		document.forms[0].E01NROCTA2.value +
		document.forms[0].E01NROCTA3.value +
		document.forms[0].E01NROCTA4.value;
}

function validate() {
	if(confirm("Se procederá a conformar el cheque con los datos ingresados. ¿Está seguro que desea realizar esta operación?")){
		return true;
	} else {
		return false;
	}
}	

</script>
</head>
<body >
<h3 align="center">Conformación de Cheques<br>Datos de Conformación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_check_holding.jsp, ECL0100"> 
</h3>
<hr size="4">
<% 
	String bnk = "";
	String brn = "";
	String dv = "";
	String acc = "";
	
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

	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0100" onSubmit="return validate();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="E01FLAGPR" VALUE="1">

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
              	<input type="text" name="E01TIIDCL" size="2" maxlength="1" value="<%= msgCheck.getE01TIIDCL().trim()%>" readonly>
              	<input type="text" name="E01IDNCLI" size="10" maxlength="9" value="<%= msgCheck.getE01IDNCLI().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Nombre del Cliente :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01NOMCLI" size="36" maxlength="35" value="<%= msgCheck.getE01NOMCLI().trim()%>" readonly>
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
            <td nowrap width="16%" colspan="3"> 
              <div align="left"> 
              	<input type="hidden" name="E01NROCTA" value="<%= msgCheck.getE01NROCTA().trim()%>">
              	<input type="text" name="E01NROCTA1" size="5" maxlength="4" value="<%= bnk %>" onBlur="refillLeftField('0',4,'E01NROCTA1');concat();">
              	<input type="text" name="E01NROCTA2" size="5" maxlength="4" value="<%= brn %>" onBlur="refillLeftField('0',4,'E01NROCTA2');concat();">
              	<input type="text" name="E01NROCTA3" size="3" maxlength="2" value="<%= dv %>" onBlur="refillLeftField('0',2,'E01NROCTA3');concat();">
              	<input type="text" name="E01NROCTA4" size="11" maxlength="10" value="<%= acc %>" onBlur="refillLeftField('0',10,'E01NROCTA4');concat();">
              </div>
            </td>
          </tr>    
        </table>
      </td>
    </tr>
  </table>
  <h4>Información del Cheque</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Número de Cheque :</div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01NROCHE" size="11" maxlength="10" value="<%= msgCheck.getE01NROCHE().trim()%>" onBlur="refillLeftField('0',10,'E01NROCHE');">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Monto del Cheque :</div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01MTOCHE" size="20" maxlength="19" value="<%= msgCheck.getE01MTOCHE().trim()%>" onKeyPress="enterDecimal()">
			  </div>
            </td>
          </tr>    
          <tr id="trclear"> 
            <td nowrap width="16%"> 
              <div align="right">Nombre del Beneficiario :</div>
            </td>
            <td nowrap width="16%" colspan="3"> 
              <div align="left"> 
              	<input type="text" name="E01NOMBEN" size="65" maxlength="60" value="<%= msgCheck.getE01NOMBEN().trim()%>" onBlur="refillRightField(' ',60,'E01NOMBEN');">
              </div>
            </td>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
  <h4>Información de la Conformación</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right">Observaciones :</div>
            </td>
            <td nowrap width="20%" colspan="3"> 
              <div align="left"> 
                <input type="text" name="E01OBSERV" size="55" maxlength="50" value="<%= msgCheck.getE01OBSERV().trim()%>" onBlur="refillRightField(' ',50,'E01OBSERV');">
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
        refillLeftField('0',9,'E01IDNCLI');
        refillRightField(' ',35,'E01NOMCLI');
</SCRIPT>

</form>
</body>
</html>
