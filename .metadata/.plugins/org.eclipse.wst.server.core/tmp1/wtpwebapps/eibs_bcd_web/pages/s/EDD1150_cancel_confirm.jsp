<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Confirmación de Cancelación </title>
<%-- <meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/pages/background.jsp'"> --%>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="rtCancel" class="datapro.eibs.beans.EDD115001Message"  scope="session" />

<SCRIPT type="text/javascript">
 function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
 }

 setTimeout("document.forms[0].submit();", 7000);
 
</SCRIPT>
</head>


<body>
 
<h3 align="center">Confirmación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cancel_confirm, EDD1150" ></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1150">
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" value="400">
  <INPUT TYPE=HIDDEN NAME="ACMACD" id="ACMACD" value="<%= rtCancel.getE01ACMACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMACC" id="ACMACC" value="<%= rtCancel.getE01ACMACC().trim()%>">

  <table width="100%" height="30%" border="1" >
    <tr > 
      <td> 
        <table width="100%" height="10%">
          <tr> 
          <td align=center> La cuenta número <%= rtCancel.getE01ACMACC().trim()%> 
            , a nombre de  <%= rtCancel.getE01CUSNA1().trim()%> ha sido satisfactoriamente
            cancelada por el oficial <%= rtCancel.getE01ACMOFC().trim()%> - <%= rtCancel.getE01DSCOFC().trim()%>. 
          </td>
          </tr>
          <tr>
          <td align=center>Por favor espere...</td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
