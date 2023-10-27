<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Incoming</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
 function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
 }

 setTimeout("document.forms[0].submit();", 7000);
 
</SCRIPT>
</HEAD>

<body>

 <h3 align="center">Generar Archivo Lote Contable NIIF 9 - Provisiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="input_file_confirmation, EDL1540"></h3>
<hr size="4">
 <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL1540">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="49">
    
	<table  class="tbenter" width="100%" height="50%" border="0" cellspacing=0 cellpadding=2>
		<tr>
     		<td align="center">
 			</td>
		</tr>
		<tr>
			<td align="center">
				<br>
				El Archivo fue procesado por la interfaz EDL154004, verifique el archivo en la ruta configurada.<br><br>
				<br>  
 			</td>      
	   	</tr>
  	</table>
	<table width="100%">		
  		<tr>
  			<td width="100%"> 
  			</td>
  		</tr>	
  </table>

 </FORM>
</BODY>
</HTML>
 