<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<TITLE>eIBS Log In</TITLE>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>
<BODY>
<H3 align="center">Verificación de Autoridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="approval_enter_password, Users"></H3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersManagement">
  <input type="HIDDEN" name="SCREEN" value="8">
  <br>
  <CENTER>
    <table width="100%" height="20%" border="0" cellspacing="2" cellpadding="2" class="tbenter" align="center">
      <tr>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
%> 
        <td width="33">
        <img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32">
        </td>
        <td valign="bottom"> 
          <table class="tbenter" width="100%" border="1" cellspacing="0" cellpadding="2" align="center">
            <tr valign="top"> 
              <td valign="middle">
                <div align="center">
       						<font color="red"><B>Clave no válida. Intente de nuevo.</B></font>
    				 </div>
              </td>
            </tr>
          </table>
        </td>
        <td width="33">
        <img src="<%=request.getContextPath()%>/images/warning.gif" width="32" height="32">
        </td>
<% 
	}
%> 
      </tr>
    </table>
    <br>
    <TABLE height="30%" WIDTH="100%"  class="tbenter" BORDER=0>
      <TR>  
	 <TD ALIGN=right width="50%" > 
        		Entre su Clave : 
        </TD>
        <TD width="50%"> 
          <INPUT TYPE="password" SIZE=5 MAXLENGTH=4 NAME="userPassword">
        </TD>
   	</TR>
     </TABLE>
   </CENTER>  
   <BR>
   <CENTER>  
     
    <TABLE class="tbenter" height="20%" WIDTH="100%" BORDER=0>
      <TR> 
        <TD ALIGN=center> 
          <p>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>

        </TD>
      </TR>
    </TABLE>
    </CENTER>
		 
 </FORM>  
<script type="text/javascript">
  document.forms[0].userPassword.focus();
  document.forms[0].userPassword.select();
</script>
</BODY>
</HTML>
