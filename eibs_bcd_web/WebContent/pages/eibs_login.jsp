<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<TITLE>eIBS Log In</TITLE>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
	function createTarget(form, args) {
		if(args == null || typeof(args)=="undefined") {
			args = "";
		}
		_win = window.open(form.action,form.target,args);
		if(typeof(focus)=="function")
			_win.focus();
	}
	function OpenWin() {
		var form = document.forms[0];
		var args = 'status=no,toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no';
		if(validate()){
			//createTarget(form, args);
			return true;
		}
		return false; 
	}
	
	function validate() {
		//Validate
		var ok = true;
		var err = "";
		if (document.forms[0].newPassword && document.forms[0].confirmPassword 
			&& document.forms[0].newPassword.value != document.forms[0].confirmPassword.value) {
			err = "Clave de acceso: \n\tLa nueva clave y la confirmación de la clave \n\ttienen que ser iguales.\n";
			ok = false;
		}
		if ((document.forms[0].userPassword && document.forms[0].newPassword
			&& document.forms[0].userPassword.value != '' && document.forms[0].newPassword.value == '') 
				|| (document.forms[0].confirmPassword && document.forms[0].confirmPassword.value == '')) {
			err += "Clave de acceso: \n\tTiene que entrar los tres campos.\n";
			ok = false;
		}
		if (!ok) {
			alert(err);
		}
		//Complete
		document.forms[0].j_username.value = document.forms[0].j_username.value.toUpperCase();
		return ok;
	}
	
	function clearInputFields(){
		var inps = document.getElementsByTagName('INPUT');
		for(var ind = 0; inps[ind]; ind++ ) {
			var elem = inps[ind];
			if (elem.type != 'hidden'){
				elem.value = '';
		    } 
		}
	}
	
</SCRIPT>
<%
	String j_username = request.getParameter("j_username");
	if (j_username == null)
		j_username = "";

	String message = (String) request.getAttribute("javax.servlet.error.message");
	Integer e = (Integer) request.getAttribute("javax.servlet.error.status_code");
	int errorCode = 0;
	if (e != null)
		errorCode = e.intValue();
%>
	
</HEAD>
<BODY onLoad="setLayout()">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/j_security_check" onSubmit="return OpenWin();">
<INPUT TYPE="hidden" NAME="locale" VALUE="es">
<INPUT TYPE="hidden" NAME="realm-name" VALUE="<%= application.getInitParameter("realm") %>">
<%
	if (errorCode == HttpServletResponse.SC_EXPECTATION_FAILED) {
%>
<INPUT TYPE="hidden" NAME="j_username" VALUE="<%= j_username %>">
<H3 align="center">Cambio de Clave<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="eibs_login"></H3>
<hr size="4">
<%
	Object errors = request.getAttribute("errors");
	if(errors != null){
%>
    <table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter" align="center">
      <tr>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
        <td valign="bottom"> 
          <table class="tbenter" width="100%" border="1" cellspacing="0" cellpadding="2" align="center" bordercolor="#FF0033">
            <tr valign="top"> 
              <td valign="middle">
                <div align="center">
					<font color="red"><B> <%= errors.toString() %></B></font>
    			</div>
              </td>
            </tr>
          </table>
        </td>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
      </tr>
    </table>
    <br>
<%
	}
%>
	<TABLE WIDTH="100%" class="tbenter" BORDER=0>
		<TR>
			<TD ALIGN=right width="50%"><b>Clave : </b></TD>
			<TD width="50%">
				<INPUT TYPE="password" ID="userPassword" SIZE=15 MAXLENGTH=10 NAME="userPassword">
			</TD>
		</TR>
		<TR>
			<TD ALIGN=right width="50%"><b>Nueva Clave : </b></TD>
	
			<TD width="50%">
				<INPUT TYPE="password" ID="newPassword" SIZE=15 MAXLENGTH=10 NAME="j_password">
			</TD>
		</TR>
		<TR>	
			<TD ALIGN=right width="50%"><b>Confirmación de Clave :</b></TD>
	
			<TD width="50%">
				<INPUT TYPE="password" ID="confirmPassword" SIZE=15 MAXLENGTH=10 NAME="confirmPassword">
			</TD>
		</TR>
	</TABLE>
	
	<script language="JavaScript">
	  function setLayout() {
			setCenterSize(470,320);
	  }  
	  document.forms[0].userPassword.focus();
	  document.forms[0].userPassword.select();
	</script>
<%
	} else if(errorCode == HttpServletResponse.SC_PRECONDITION_FAILED){
%> 
    <table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter" align="center">
      <tr>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
        <td valign="bottom"> 
          <table class="tbenter" width="100%" border="1" cellspacing="0" cellpadding="2" align="center" bordercolor="#FF0033">
            <tr valign="top"> 
              <td valign="middle">
                <div align="center">
					<font color="red"><B>No está autorizado desde esta estación.</B></font>
    			</div>
              </td>
            </tr>
          </table>
        </td>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
      </tr>
    </table>
    <br>
	<script language="JavaScript">
	  function setLayout() {
		setCenterSize(420,320);
	  }
	</script>
<%
	} else if(errorCode > 0){
%> 
    <table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter" align="center">
      <tr>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
        <td valign="bottom"> 
          <table class="tbenter" width="100%" border="1" cellspacing="0" cellpadding="2" align="center" bordercolor="#FF0033">
            <tr valign="top"> 
              <td valign="middle">
                <div align="center">
<%
					Object errors = request.getAttribute("errors");
					if(errors != null){
%>
					<font color="red"><B> <%= errors.toString() %></B></font>
<%
					} else {
%>
					<font color="red"><B> Usuario o clave de acceso incorrecto. Favor verifique</B></font>
<%
					}
%>
    			</div>
              </td>
            </tr>
          </table>
        </td>
        <td width="33"><img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32"></td>
      </tr>
    </table>
    <br>

	<TABLE WIDTH="100%" class="tbenter" BORDER=0>
		<TR>
			<TD ALIGN=right width="40%" valign="middle"><B>Usuario :</B></TD>
			<TD width="60%">
				<INPUT SIZE=15 MAXLENGTH=255 NAME="j_username" value="<%=j_username%>" autocomplete="off">
			</TD>
		</TR>
		<TR>
			<TD ALIGN=right width="40%"><b>Clave :</b></TD>
			<TD width="60%">
				<INPUT TYPE="password" SIZE=15 MAXLENGTH=255 NAME="j_password" autocomplete="off">
			</TD>
		</TR>
	</TABLE>
	
	<script language="JavaScript">
	  function setLayout() {
		setCenterSize(420,320);
	  }
	  document.forms[0].j_username.focus();
	  document.forms[0].j_username.select();
	</script>
<%
	} else {
%> 
	<TABLE WIDTH="100%" class="tbenter" BORDER=0>
		<TR>
			<TD ALIGN=right width="40%" valign="middle"><B>Usuario :</B></TD>
			<TD width="60%">
				<INPUT SIZE=15 MAXLENGTH=255 NAME="j_username" value="<%=j_username%>" autocomplete="off">
			</TD>
		</TR>
		<TR>
			<TD ALIGN=right width="40%"><b>Clave :</b></TD>
			<TD width="60%">
				<INPUT TYPE="password" SIZE=15 MAXLENGTH=255 NAME="j_password" autocomplete="off">
			</TD>
		</TR>
	</TABLE>
	
	<script language="JavaScript">
	  function setLayout() {
		setCenterSize(310,200);
	  }
	  document.forms[0].j_username.focus();
	  document.forms[0].j_username.select();
	</script>
<%
	}
%>
<BR>
     
	<TABLE class="tbenter" WIDTH="100%" BORDER=0>      
      <TR> 
        <TD vALIGN=middle> 
          <div align="center"> 
            <input type=image name="imgLogin" src="<%=request.getContextPath()%>/images/s/login.gif" title="Login" 
            	onClick="imgDown('imgLogin', 'login_over.gif')">
          </div>
        </TD>
      </TR>
    </TABLE>
		 
 </FORM>
	<script language="JavaScript">
		setTimeout("clearInputFields()", 100);
	</script>
</BODY>
</HTML>
