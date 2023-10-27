<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta http-equiv="Refresh" CONTENT="5;url='<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0063?SCREEN=100'">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<title>Confirmacion </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id="msgFL" class="datapro.eibs.beans.EIE006301Message"  scope="session" /> 

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
 
 <h3 align="center">Interfaz para carga de precios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="prices_transfer_confirm.jsp, EIE0063"></h3>
<hr size="4">
  
  <br>
  <table width="100%" height="0%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="10%">        
          <tr>             
	          	<td align=center> El archivo de precios ha sido transferido.<br>  Por favor verifique el reporte <b>IE0063A</b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
