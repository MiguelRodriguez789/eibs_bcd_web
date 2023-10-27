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

</head>
<body >
<h3 align="center">Conformación de Cheques<br>Reverso de Conformación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_check_reversal.jsp, ECL0100"> 
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
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0100">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <input type="hidden" name="E01NROCTA" value="<%= msgCheck.getE01NROCTA().trim()%>">
  <input type="hidden" name="E01NROCHE" value="<%= msgCheck.getE01NROCHE().trim()%>">
  <input type="hidden" name="E01MTOCHE" value="<%= msgCheck.getE01MTOCHE().trim()%>">
  <input type="hidden" name="E01NOMBEN" value="<%= msgCheck.getE01NOMBEN().trim()%>">
  <input type="hidden" name="E01OBSERV" value="<%= msgCheck.getE01OBSERV().trim()%>">
  <input type="hidden" name="E01AUTCCH" value="<%= msgCheck.getE01AUTCCH().trim()%>">

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
  <h4>Validación del Supervisor</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
			<TD nowrap width="50%">
				<DIV align="right">Usuario :</DIV>
			</TD>
			<TD nowrap width="50%">
				<DIV align="left">
					<INPUT type="text" name="E01USUSUP" size="14" maxlength="10" value="">
				</DIV>
			</TD>
          </tr>            
          <tr id="trclear"> 
			<TD nowrap width="50%">
				<DIV align="right">Clave :</DIV>
			</TD>
			<TD nowrap width="50%">
				<DIV align="left">
					<INPUT type="password" name="E01CLASUP" size="14" maxlength="10" value="">
				</DIV>
			</TD>
          </tr>            
        </table>
      </td>
    </tr>
  </table>
<BR>
<DIV align="center">
	<INPUT type="submit" name="EIBSBTNOK" id="EIBSBTN" value="Enviar">
</DIV>
</form>
</body>
</html>
