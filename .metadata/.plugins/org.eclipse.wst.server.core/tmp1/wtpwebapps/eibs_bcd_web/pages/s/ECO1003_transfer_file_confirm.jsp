<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<title>Carga de Cuadraturas automaticas</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
</script>
</head>

<body>
 
<h3 align="center"> Carga de Cuadraturas automaticas
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transfer_file_confirm, ECO1003" ></h3>
<hr size="4">

  <table width="100%" height="30%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="30%">        
          <tr>             
	          	<td align=center> El archivo ha sido transferido al eIBS exitosamente. </td>
          </tr>
          <tr>
	          	<td align=center> Número de registros transferidos:  <%= request.getAttribute("rows") %></td>
          </tr>
                    <tr>
            <td width="100%">&nbsp;</td>
          </tr>
          <tr>
            <td width="100%"> 
              <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="checkClose()" ></div>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
