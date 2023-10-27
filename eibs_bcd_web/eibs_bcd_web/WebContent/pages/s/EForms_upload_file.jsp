<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>ACH Incoming</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckFile(){
	if ( document.forms[0].FILENAME.value.length < 1) {
  		alert("Se necesita un nombre de archivo valido!!!");
  		document.forms[0].FILENAME.value='';
  		document.forms[0].FILENAME.focus();
	} else {
		document.forms[0].submit();
  	}
}

function GoNext(){
	document.forms[0].action = '<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEIBSFormsChecker';
	document.forms[0].submit();
}

</SCRIPT>

</HEAD>

<body>

 <h3 align="center">Subir Formulario<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="upload_file, EForms"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEIBSFormsUploader" ENCTYPE="multipart/form-data">	
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
	
	<table  class="tbenter" width="100%" height="40%" border="0" cellspacing=0 cellpadding=2>
		<tr>
     		<td align="center">Archivo : 
            	<input type=file name="FILENAME" size="50" maxlength="255" >
 			</td>
		</tr>
		<tr>
			<td align="center">
				<br>
				Esta opción tomará el formulario y lo almacenará en el repositorio.
				<br>
 			</td>      
	   	</tr>
		<tr>
			<td align="left">
				<br>
				(*) En caso que el nombre del archivo contenga espacios en blanco estos serán sustituidos por el caracter de subrayado.
				<br>
				(*) El nombre resultante del formulario será completamente en letras mayúsculas.
 			</td>      
	   	</tr>
  		<tr>
  			<td width="100%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="button" name="Process" value="Procesar" onClick="javascript:CheckFile()">
     				<input id="EIBSBTN" type="button" name="Continuar" value="Continuar" onClick="javascript:GoNext()">
     	  		</div>	
  			</td>
  		</tr>	
  </table>

<script type="text/javascript">
  document.forms[0].FILENAME.focus();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
 </FORM>
</BODY>
</HTML>
 