<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<head>
<title>Registro de Usuarios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="userRegistry" class="com.datapro.security.UserRegistryPasswordEntry"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">

function del() {
	ok = confirm("Esta seguro que desea eliminar el usuario seleccionado?");
	if (ok){
		document.forms[0].del.value='Y';
		document.forms[0].submit();
	}
}

function toNext() {
	document.forms[0].role.value='Y';
	document.forms[0].submit(); 
}

function changeRole(role) {
	if (document.forms[0].role_0.checked 
		|| document.forms[0].role_1.checked
		|| document.forms[0].role_10.checked
		|| document.forms[0].role_11.checked){
		document.forms[0].Next.disabled = false;
	} else {
		document.forms[0].Next.disabled = true;
	}
}

</script>

</head>
<body bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }
%>
<h3 align="center">Registro de Usuarios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Users_registy_basic" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersManagement" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
    <INPUT TYPE=HIDDEN NAME="role" VALUE="">
  </p>

  <h4>Definición de Usuario </h4>
  
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap>
              <div align="right">Identificador :</div>
            </td>
            <td nowrap>
              	<input type="text" name="uid" size="12" maxlength="10" value="<%= userRegistry.getUid()%>" 
              		<%= userRegistry.getUid().equals("") ? "" : " readonly" %>>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >
             </td>
            <td nowrap>
              <div align="right">Usuario :</div>
            </td>
            <td nowrap>
              	<input type="text" id="name" name="name" size="12" maxlength="10" value="<%= userRegistry.getName()%>"
              		<%= userRegistry.getName().equals("") ? "" : " readonly" %>>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >              	
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Nombre :</div>
            </td>
            <td nowrap>
              	<input type="text" id="givenName" name="givenName" size="35" maxlength="50" value="<%= userRegistry.getGivenName()%>" 
              		onkeyup="document.getElementById('displayName').value = this.value + ' ' + document.getElementById('surname').value;">
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >
             </td>
            <td nowrap>
              <div align="right">Apellido :</div>
            </td>
            <td nowrap>
             	<input type="text" id="surname" name="surname" size="35" maxlength="50" value="<%= userRegistry.getSurname()%>" 
             		onkeyup="document.getElementById('displayName').value = document.getElementById('givenName').value + ' ' + this.value;">
             </td> 
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Nombre completo :</div>
            </td>
            <td nowrap colspan="3">
              	<input type="text" id="displayName" name="displayName" size="60" maxlength="100" value="<%= userRegistry.getDisplayName()%>" readonly="readonly">
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">E-mail :</div>
            </td>
            <td nowrap>
            	<input type="text" name="mail" size="35" maxlength="50" value="<%= userRegistry.getMail()%>">
              </td>
            <td nowrap>
              <div align="right">Teléfono :</div>
            </td>
            <td nowrap>
            	<input type="text" name="telephoneNumber" size="13" maxlength="12" value="<%= userRegistry.getTelephoneNumber()%>" 
            		onkeypress="enterInteger(event)">
             </td>  
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">Descripción :</div>
            </td>
            <td nowrap>
              	<input type="text" name="description" size="35" maxlength="50" value="<%= userRegistry.getDescription()%>">
             </td>
            <td nowrap>
              <div align="right">Referencias :</div>
            </td>
            <td nowrap>
             	<input type="text" name="seeAlso" size="35" maxlength="15" value="<%= userRegistry.getSeeAlso()%>" >
             </td> 
          </tr>

         </table>
      </td>
    </tr>
  </table>
<%  if(currUser.getE01LGM().equals("2")){ %>
  <h4>Estación de Trabajo </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
			<tr id="trdark"> 
            <td nowrap> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap> 
				<input type="text" name="ipHostName" size="35" maxlength="50" value="<%= userRegistry.getIpHostName()%>">
             </td> 
            <td nowrap> 
              <div align="right">Número :</div>
            </td>
            <td nowrap> 
				<input type="text" name="ipHostNumber" size="35" maxlength="50" value="<%= userRegistry.getIpHostNumber()%>">
             </td> 
			</tr>
		</table>
		</td>
	</tr>
  </table>
  <h4>Credenciales </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
			<tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Permitir al usuario cambiar la Contraseña :</div>
            </td>
            <td nowrap width="50%"> 
				<select id="pwdAllowUserChange" name="pwdAllowUserChange">
					<option <%= userRegistry.getPwdAllowUserChange().toString().equals("0") ? "selected" : "" %> value="0">No</option>
					<option <%= userRegistry.getPwdAllowUserChange().toString().equals("1") ? "selected" : "" %> value="1">Sí</option>
				</select>
             </td> 
			</tr>
			<tr id="trclear"> 
            <td nowrap width="50%"> 
 				<div align="right">
				Reestablecer Contraseña :
				<input type="checkbox" name="pwdReset" value="1" <% if(userRegistry.getPwdReset().toString().equals("1")){ out.print("checked");} %>>
 				</div>
             </td>
            <td nowrap width="50%">
				<div align="left"> : 
				<input type="password" name="userPassword" size="12" maxlength="10" value="">
				</div>
             </td>            
			</tr>
			<tr id="trdark"> 
            <td nowrap width="50%"> 
 				<div align="right">
				Usuario Bloqueado :
				<input type="checkbox" name="pwdLockout" value="1" <% if(userRegistry.getPwdLockout().toString().equals("1")){ out.print("checked");} %>>
 				</div>
             </td>
            <td nowrap width="50%">
             </td>            
			</tr>
		</table>
		</td>
	</tr>
  </table>
<%  } %>
  <h4>Roles </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
		<input type="hidden" name="rolesLength" value="12">
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
			<tr id="trdark"> 
            <td nowrap width="50%"> 
              <div align="right">Plataforma :</div>
            </td>
            <td nowrap width="50%"> 
       			<input type="checkbox" name="role_0" value="1" <% if(userRegistry.hasRole(0)){ out.print("checked");} %>
       				onclick="changeRole()">
			</td>
			</tr>
			<tr id="trclear"> 
			<td nowrap> 
              <div align="right">Caja :</div>
            </td>
            <td nowrap> 
       			<input type="checkbox" name="role_1" value="2" <% if(userRegistry.hasRole(1)){ out.print("checked");} %>
       				onclick="changeRole()">
			</td> 
			</tr>
			<tr id="trdark"> 
			<td nowrap> 
              <div align="right">Almacén de Datos :</div>
            </td>
            <td nowrap> 
       			<input type="checkbox" name="role_10" value="<%=userRegistry.hasRole(10)?userRegistry.getRole(10):"1" %>" <% if(userRegistry.hasRole(10)){ out.print("checked");} %>
       				onclick="changeRole()">
			</td> 
			</tr>
			<tr id="trclear"> 
			<td nowrap> 
              <div align="right">Generador de Reportes :</div>
            </td>
            <td nowrap> 
       			<input type="checkbox" name="role_11" value="<%=userRegistry.hasRole(11)?userRegistry.getRole(11):"1" %>" <% if(userRegistry.hasRole(11)){ out.print("checked");} %>
       				onclick="changeRole()">
			</td> 
			</tr>
		</table>
		</td>
	</tr>
  </table>
  <br>
   <p align="center">
    		<input id="EIBSBTN" type=submit name="Submit" value="Actualizar">
			<input id="EIBSBTN" type=submit name="Next" value="Siguiente" onclick="toNext()">
            <%if (currUser.getH01OPE().trim().equals("0002")) { %>
    		<input id="EIBSBTN" type=submit name="Delete" value="Eliminar" onclick="del()">
			<% } %>
  </p>

</form>
<SCRIPT type="text/javascript">
	window.onload=changeRole;
 </SCRIPT>
</body>
</html>

