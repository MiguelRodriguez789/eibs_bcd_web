<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Aplicación de Camara Saliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
  function goAction(op){
    document.forms[0].E01ACTION.value = op;    
    if (confirm("Esta seguro de la operación a realizar ?")) 
    	document.forms[0].submit();
  }    
</script>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) 
 {
     
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     error.setERRNUM("0");
 }


%> 
<h3 align="center">Aplicaci&oacute;n de C&aacute;mara Saliente
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_cleaning_apply, EDD0950"></h3> 
<hr size="4">
 <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0950" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <table class="tbenter" height=50%>
    <tr > 
      <td width=45% align=right>Fecha Proceso :
      </td>
      <td nowrap> 
			<eibsinput:date  fn_year="E01CNTFEY" fn_month="E01CNTFEM" fn_day="E01CNTFED" />
      </td>      
    </tr>
  </table>
   
  <p align="center"> 
   <input class="EIBSBTN" type=submit name="Submit" value="Enviar">
 </p>
 
 
  
 
</form>
</body>
</html>
