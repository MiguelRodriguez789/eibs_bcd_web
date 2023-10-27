<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<title>Carga de Calificaciones</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
 
<h3 align="center"> Carga de Calificaciones
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transfer_file_confirm, EDL0999" ></h3>
<hr size="4">

  <table width="100%" height="30%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="30%">        
          <tr>             
	          	<td align=center> El archivo ha sido transferido al eIBS exitosamente. </td>
          </tr>
          <tr>
	          	<td align=center> Revisar Reporte de proceso </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
