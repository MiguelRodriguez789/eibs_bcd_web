<html>
<head>
<title>Confirmacion</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<body>
		
<h3 align="center"> Confirmacion
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="confirm_message, ERC0040"></h3>
<hr size="4">
<form METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0040" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

	<table class="tableinfo">
   		<tr > 
     		<td nowrap> 
       			<table cellspacing=0 cellpadding=2 width="100%" border="0">
       				<tr id="trdark">
         				<td nowrap><div align="center"><b>Operacion Exitosa </b></div></td>
       				</tr>
       				<tr id="trdark">
         				<td nowrap><div align="center"><b>Cierre esta ventana para continuar </b></div></td>
       				</tr>
       			</table>
     		</td>
   		</tr>
 	</table>
 	<table class="tableinfo">
  		<tr>
  			<td align="center"> 
   				<input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="checkClose()" >
 			</td>
  		</tr>
 	</table>
 	
</form>
</body>
</html>
