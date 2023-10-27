<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0948?SCREEN=100'">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<title>Confirmacion </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="msgFL" class="datapro.eibs.beans.EDD094801Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
 
<h3 align="center">
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="camara_trans_confirm_bco, EDD0948" ></h3>
<hr size="4">

  <table width="100%" height="30%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="30%">        
          <tr>             
	          	<td align=center> Archivo de Camara Saliente (BCO077) ha sido Transmitido, revisar reportes en el spool del usuario</td>
          </tr>
          <tr>
          </tr>
          <tr>
    			<td align=center><b>EDD0948A</b> Reporte de Registros Procesados </tr>
          
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
