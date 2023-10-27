<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Mantenimiento de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="lnChgSts" class="datapro.eibs.beans.EDL013501Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function CheckACC(){
  var pass = false;
  if (document.forms[0].E01DEAACC.value.length < 1) {
    alert("Teclee una cuenta valida");
    document.forms[0].E01DEAACC.value='';
    document.forms[0].E01DEAACC.focus();
  } else {
    radioobj = document.forms[0].E01FLGOPE;
    if (typeof radioobj.length == 'undefined' && typeof radioobj != 'undefined' ) { 
      radioobj.checked = true; 
      pass = true;
    } else { 
      for ( var i=0; i < radioobj.length; i++ ) { 
        if (radioobj[i].checked) { 
          pass = true;
          break;
        } 
      } 
    }
    if (!pass) alert("Seleccione una operacion antes de continuar");
  }
  return(pass);
}

</SCRIPT>

</head>

<%
  
  // FLGOPE
  //  1 -> Cambio de Estado
  //  2 -> Gestion Cobranza
  //  3 -> Suspension de Devengos
  //  4 -> Levantar Suspension de Devengos
  //  5 -> Aceleracion
  //  6 -> Cartera Sustitutiva
  //  7 -> Marcacion de Seguros
  //  8 -> Periodo Muerto de Interes
  //  9 -> Monitoreo
  boolean[] flpope = new boolean[9];
	int accOpt = Integer.parseInt(userPO.getAccOpt() != null && userPO.getAccOpt() != "" ? userPO.getAccOpt() : "0");
  boolean onlyOne = false;
	
	for (int i = 0; i < flpope.length; i++) {
		flpope[i] = true;
		if (accOpt > 0) {
			onlyOne = true;
			if (i != (accOpt - 1)) {
				flpope[i] = false;
			}
		}
	}
     
%>

<body>

<h3 align="center">Condiciones del Pr&eacute;stamo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_chg_status,EDL0135"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0135" onsubmit="return(CheckACC())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="ACCOPT" id="ACCOPT" VALUE="<%=userPO.getAccOpt()%>">
 
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" height="80%" border="0">
    <tr> 
      <td nowrap colspan=2 align="center">Número de Cuenta :            
        <INPUT type="text" name="E01DEAACC" size="14" maxlength="12" onkeypress="enterInteger(event)" value="<%= lnChgSts.getE01DEAACC() %>">
        <a href="javascript:GetAccount('E01DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
      </td>
    </tr>
    <tr>            
      <td nowrap colspan=2 align="center">  
        <p align="center"> <b>Seleccione la condici&oacute;n que desee modificar</b></p> 
      </td>
    </tr>
    <% if (flpope[1-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >                
        <INPUT type="radio" name="E01FLGOPE" value="1" <% if (lnChgSts.getE01FLGOPE().equals("1") || onlyOne) out.print("checked"); %>><b>Cambio de Estado</b>              
      </td> 
    </tr>
    <% } %>
    <% if (flpope[2-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >                
        <INPUT type="radio" name="E01FLGOPE" value="2" <% if (lnChgSts.getE01FLGOPE().equals("2") || onlyOne) out.print("checked"); %>>
        <b>Gesti&oacute;n Cobranza</b> 
      </td>
    </tr>
    <% } %>
    <% if (flpope[3-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >                 
        <INPUT type="radio" name="E01FLGOPE" value="3" <% if (lnChgSts.getE01FLGOPE().equals("3") || onlyOne) out.print("checked"); %>>
        <b>Suspensi&oacute;n de Devengos</b>
      </td>
    </tr>
    <% } %>
    <% if (flpope[5-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >
        <INPUT type="radio" name="E01FLGOPE" value="5" <% if (lnChgSts.getE01FLGOPE().equals("5") || onlyOne) out.print("checked"); %>>
        <b>Levantar Suspensi&oacute;n de Devengos</b>
      </td>
    </tr>
    <% } %>
    <% if (flpope[4-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >                 
        <INPUT type="radio" name="E01FLGOPE" value="4" <% if (lnChgSts.getE01FLGOPE().equals("4") || onlyOne) out.print("checked"); %>>
        <b>Aceleraci&oacute;n</b>
      </td>
    </tr>
    <% } %>
    <% if (flpope[6-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >                 
        <INPUT type="radio" name="E01FLGOPE" value="6" <% if (lnChgSts.getE01FLGOPE().equals("6") || onlyOne) out.print("checked"); %>>
        <b>Cartera Sustitutiva</b>
      </td>
    </tr>
    <% } %>
    <% if (flpope[7-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >                 
        <INPUT type="radio" name="E01FLGOPE" value="7" <% if (lnChgSts.getE01FLGOPE().equals("7") || onlyOne) out.print("checked"); %>>
        <b>Marcacion de Seguros</b>
      </td>
    </tr>
    <% } %>
    <% if (flpope[8-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >                 
        <INPUT type="radio" name="E01FLGOPE" value="8" <% if (lnChgSts.getE01FLGOPE().equals("8") || onlyOne) out.print("checked"); %>>
        <b>Periodo Muerto de Interes</b>
      </td>
    </tr>
    <% } %>
    <% if (flpope[9-1]){ %>
    <tr>
      <td nowrap width="40%" align="right"></td>
      <td nowrap >                 
        <INPUT type="radio" name="E01FLGOPE" value="9" <% if (lnChgSts.getE01FLGOPE().equals("9") || onlyOne) out.print("checked"); %>>
        <b>Monitoreo</b>
      </td>
    </tr>
    <% } %>
    <tr> 
      <td nowrap colspan =2 align="center">      
        <p align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
        </p> 
      </td>
    </tr>
  </table>
     
  <script type="text/javascript">
  document.forms[0].E01DEAACC.focus();
  document.forms[0].E01DEAACC.select();
  </script>

  <% 
     if ( !error.getERRNUM().equals("0")  ) {
       error.setERRNUM("0");
  %>
  <SCRIPT type="text/javascript">
    showErrors();
  </SCRIPT>
  <%
     }
  %>
</form>
</body>
</html>
