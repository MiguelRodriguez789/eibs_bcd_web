<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Errores - Advertencias</title>
<meta http-equiv="X-UA-Compatible" content="IE=11" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<%@ page import="datapro.eibs.master.*" %>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jsplayer/jquery.jplayer.min.js"></script>

<script type="text/javascript">

function cerrarVentana(){
		if(window.name != "main"){
			top.close();
		}
	}

</script>

</head>
<body>
<table id="tbhelp" width=100% align=center>
	<tr>
    	<td align=center colspan=3 >
      		<table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter">
      		<tr>
					<td width="75" align="right" valign="top">
						<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="middle" name="EIBS_GIF" title="EDI0010_doc_viewer_container_help_empty">
					</td>
					<td colspan="2" align="left" valign="bottom">
						<hr size="4" align="right">
					</td>
				</tr>
        		<tr>
        			<td width="75">
          				<div align="left">
          					<font color="red"><img src="<%=request.getContextPath()%>/images/warning.gif"></font>
          				</div>	
          			</td>
          			<td>
            			<div align="center">
            				<font face="Verdana, Arial, Helvetica, Sans-serif" size="3">
            				<b>No existe informacion de imagenes de Firmas para la cuenta <%= userPO.getAccNum() %>.</b>
            				</font>
            			</div>
          			</td>
          		</tr>	
          </table>
   		</td>
	</tr>
</table>
<br>

  <p align="center"> 
    <input id="EIBSBTN" type="button" name="close" value="Cerrar" onclick="cerrarVentana()" >
  </p>

</body>
</html>	