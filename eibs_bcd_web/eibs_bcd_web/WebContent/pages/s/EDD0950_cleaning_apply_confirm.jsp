<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Confirmacion</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<!--meta http-equiv="Refresh" CONTENT="3;url='javascript:goExit()'"-->
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "applyList" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT language="javascript">
  function goExit(){
<%
	if ( applyList != null && applyList.getNoResult() ) {
%>  
    	checkClose();
<%
	} else {
%>    
		window.location.href="<%=request.getContextPath()%>/pages/s/EDD0950_cleaning_apply.jsp";
<%
	} 
%>    
  }


 </SCRIPT>
</head>

<body>

<h3 align="center">Aplicación de Camara Saliente
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cleaning_apply_confirm, EDD0950"></h3> 
<hr size="4">
 <form method="post">
  <table class=tbenter height=50%>
    <tr > 
      <td width=100% align=center><b>
      La informacion  ha sido procesada satisfactoriamente.<br>
      Por favor espere... </b>
    </td>
    </tr>
  </table>
  <div align="center"> 
    <p>&nbsp;</p>
    </div>
</form>
<script>
   setTimeout("goExit()", 7000);
</script>
</body>
</html>
