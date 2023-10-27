<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="com.datapro.security.RealmEntry"%><html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Mantenimiento Control de Parámetros para Contraseña eIBS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="realm" class="com.datapro.security.RealmEntry"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<% 
boolean isNew = !"MAINTENANCE".equals(userPO.getPurpose());
if ( !error.getERRNUM().equals("0")  ) {
	error.setERRNUM("0") ;
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

<h3 align="center">Mantenimiento Control de Parámetros para Contraseña eIBS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Users_realms_basic.jsp" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersManagement" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="<%= isNew ? "102" : "103" %>">
  </p>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Ambiente :</div>
            </td>
            <td nowrap> 
              <input type="text" name="realm" size="4" maxlength="3" value="<%= realm.getRealm()%>" <% if (!isNew) out.print("readonly");%>>
             </td>  
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap> 
              <input type="text" name="description" size="40" maxlength="35" value="<%= realm.getDescription()%>" >
               
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Cuenta de Usuario</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">			
          <tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">No. de Días para Accesar e-IBS :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="shadowExpireAge" size="5" maxlength="4" value="<%= realm.getShadowExpireAge()%>" onkeypress="enterInteger(event)">
              <b>(0=Indefinido)</b>
             </td>  
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. de Días Inactivo para Cambio de Estado :</div>
            </td>
            <td nowrap> 
              <input type="text" name="shadowInactive" size="5" maxlength="4" value="<%= realm.getShadowInactive()%>" onkeypress="enterInteger(event)">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <h4>Parámetros para Contraseña </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
		<input type="hidden" name="pwdCheckQuality" size="2" maxlength="1" value="<%= RealmEntry.TRUE %>" onkeypress="enterInteger(event)">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Número de contraseñas previas en el histórico :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="pwdInHistory" size="4" maxlength="3" value="<%= realm.getPwdInHistory()%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
 		<tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. Mínimo de Caracteres en Contraseña :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdMinLength" size="4" maxlength="3" value="<%= realm.getPwdMinLength()%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
		<tr id="trdark"> 
			<td nowrap> 
              <div align="right">No. de Caracteres Repetidos Permitidos :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdCheckRepeatedChars" size="4" maxlength="3" value="<%= realm.getPwdCheckRepeatedChars()%>" onkeypress="enterInteger(event)">
              <b>(0=No Repeticiones Permitidas)</b>
            </td>
		</tr>
		<tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. de Letras Permitidas :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdCheckMinLetters" size="4" maxlength="3" value="<%= realm.getPwdCheckMinLetters()%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
		<tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. Mínimo de Caracteres numéricos :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdCheckMinNumbers" size="4" maxlength="3" value="<%= realm.getPwdCheckMinNumbers()%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
		<tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. Máximo de Caracteres numéricos :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdCheckMaxNumbers" size="4" maxlength="3" value="<%= realm.getPwdCheckMaxNumbers()%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
		<tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. Mínimo de Caracteres Especiales :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdCheckMinSpecialChars" size="4" maxlength="3" value="<%= realm.getPwdCheckMinSpecialChars()%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
		<tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. Máximo de Caracteres Especiales :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdCheckMaxSpecialChars" size="4" maxlength="3" value="<%= realm.getPwdCheckMaxSpecialChars()%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
		<tr id="trdark"> 
            <td nowrap> 
              <div align="right">No. de Días para Expiración de Contraseña :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdMaxAgeDays" size="4" maxlength="3" value="<%= realm.secondsToDays(realm.getPwdMaxAge())%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
		<tr id="trclear"> 
            <td nowrap> 
              <div align="right">No. de Accesos Fallidos Permitidos :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdMaxFailure" size="4" maxlength="3" value="<%= realm.getPwdMaxFailure()%>" onkeypress="enterInteger(event)">
            </td>
		</tr>
		<tr id="trdark"> 
            <td nowrap> 
              <div align="right">Intervalo en segundos para reiniciar el contador de accesos fallidos :</div>
            </td>
            <td nowrap> 
              <input type="text" name="pwdFailureCountInterval" size="4" maxlength="3" value="<%= realm.getPwdFailureCountInterval()%>" onkeypress="enterInteger(event)">
              <b>(0=El contador no se reiniciará por tiempo)</b>
            </td>
		</tr>
		</table>
      </td>
    </tr>
  </table>
  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>

