<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Procesar Reportes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
 function finish(){
 	window.location.href = "<%=request.getContextPath()%>/pages/s/ERP0010_report_demand.jsp";
 }
</script>



</head>

   
<body>

<h3 align="center">Procesar Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="report_demand_confirm.jsp,ERP0010" width="32" height="32" ></h3>
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
        <div align="center"><font size="2">El Proceso ha sido satisfactoriamente ejecutado.</font></div>
      </td>
    </tr>
    <tr>
       <td width="100%">&nbsp;</td>
    </tr>
    <tr>
       <td width="100%"> 
         <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="finish()" ></div>
       </td>
    </tr>
    
  </table>
  <p>&nbsp;</p>
  <h4>&nbsp;</h4>
  <p align="center">&nbsp;</p>
  </form>
</body>
</html>
