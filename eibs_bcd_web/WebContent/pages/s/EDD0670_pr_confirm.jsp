<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Ordenes de Pago</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Refresh" CONTENT="10;url='javascript:document.forms[0].submit();">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
 function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
 }
 
</SCRIPT>
</head>

<jsp:useBean id="prBasic" class="datapro.eibs.beans.EDD067001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />




   
<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
}
 %>
<h3 align="center">Confirmación de Ordenes de pago <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pr_confirm.jsp,EDD0600" width="32" height="32" ></h3>
<hr size="4">


<form method="post" >

  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  <h4>&nbsp;</h4>
  
     
  <table class="tableinfo" >
    <tr id="trclear"> 
      <td nowrap colspan="3" > 
        <div align="center"><font size="2">Esta orden de Pago ha sido satisfactoriamente 
          procesada </font></div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <h4>&nbsp;</h4>
  <p align="center">&nbsp;</p>
  </form>
</body>
</html>
