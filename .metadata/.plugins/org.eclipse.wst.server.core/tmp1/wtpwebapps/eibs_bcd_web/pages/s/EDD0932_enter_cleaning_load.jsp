<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Carga de Camara Saliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) 
 {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }


%> 
<h3 align="center">Carga de C&aacute;mara Saliente
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_cleaning_load, EDD0932"></h3> 
<hr size="4">
 <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0932" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <table class="tbenter" height=50%>
    <tr > 
      <td width=45% align=right>Fecha Proceso :
      </td>
      <td nowrap> 
                <input type="text" name="E01CNTFE1" size="3" maxlength="2" onkeypress="enterInteger(event)">
                <input type="text" name="E01CNTFE2" size="3" maxlength="2" onkeypress="enterInteger(event)">
                <input type="text" name="E01CNTFE3" size="5" maxlength="4" onkeypress="enterInteger(event)">
                <a href="javascript:DatePicker(document.forms[0].E01CNTFE1,document.forms[0].E01CNTFE2,document.forms[0].E01CNTFE3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="bottom" border="0" ></a> 
      </td>      
    </tr>
  </table>
   
  <p align="center"> 
   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
 </p>
 
</form>
</body>
</html>
