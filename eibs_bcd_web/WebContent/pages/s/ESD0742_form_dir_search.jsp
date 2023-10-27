<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page	language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/style.css" type="text/css" rel="stylesheet">
<title>Busqueda de Directorio de Formas para e-IBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<h3 align="center">Busqueda de Directorio de Formas para e-IBS
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="form_dir_search.jsp, ESD0742"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSESD0742">
<INPUT TYPE=HIDDEN NAME="SCREEN" value="200">

<%int row = 0; %>
<table class="tableinfo">
	<tr>
		<td nowrap>
			<table cellspacing="0" cellpadding="2" width="100%" border="0">
          		<tr id="trclear">
            		<td nowrap width="40%"><div align="right">Código de Producto :</div></td>
            		<td nowrap width="60%"> 
              			<div align="left"> 
                			<input type="text" name="E01APFPRO" size="6" maxlength="4" value="">
                			<input type="text" readonly name="E01APFDSC" size="40" maxlength="35" value="">
		    				<A HREF="javascript:GetProductFamily('E01APFPRO','','E01APFDSC')"> 
		    					<IMG SRC="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" BORDER="0"></A>
              			</div>
            		</td>
				</tr>
          		<tr id="trclear"> 
            		<td nowrap width="40%"><div align="right">Tipo de Forma :</div></td>
            		<td nowrap width="60%"> 
              			<div align="left"> 
                			<input type="text" readonly name="E01APFFTY" size="4" maxlength="2" value="">
		    				<A HREF="javascript:GetFormType('E01APFFTY')"> 
		    					<IMG SRC="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" BORDER="0"></A>
              			</div>
            		</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<br>
   
<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>

</form>
</body>
</html>