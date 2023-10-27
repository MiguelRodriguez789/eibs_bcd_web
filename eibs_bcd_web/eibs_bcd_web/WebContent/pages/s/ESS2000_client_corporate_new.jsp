<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Corporate User</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="cusdata" class="datapro.eibs.beans.ESS200001Message" scope="session" />

</head>

<body>
<%  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
 <h3 align="center">Nuevo Usuario Corporativo Internet<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_corporate_new, ESS2000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESS2000">
  <p>
    <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="102">
    <INPUT TYPE=HIDDEN id="TYPE" NAME="TYPE" VALUE="1">
  </p>
  <h4 align="center">Entre Usuario Corporativo Internet</h4>
  <p>&nbsp; </p>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right"  width="50%">Usuario :</td>
            <td nowrap align="left" width="50%">
            	<INPUT type="text" id="CUSID" name="CUSID" value="<%= cusdata.getE01EUSUSR().trim()%>" maxlength="10" size="10">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
<script type="text/javascript">
  document.forms[0].document.getElementById('CUSID').focus();
  document.forms[0].document.getElementById('CUSID').select();
</script>

</form>
</body>
</html>
