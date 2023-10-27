<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%><html>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="java.math.BigDecimal"%>

<head>
<title>IFS File Utility</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "fileInfo" class= "datapro.eibs.beans.EIFS10001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<SCRIPT type="text/javascript">

function goAction(opt) {

	var xx = document.forms[0].ARCHIVO.value;
	if (typeof xx == "undefined" || xx == null || xx == "") {
		if (opt == 2) {
			opt = 0;
		}
	}
		
	if (opt == 1) {
		var fileName = document.forms[0].FILENAME.value;
		var ext = fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase();
		if ( document.forms[0].FILENAME.value.length < 1 || (ext != "TXT" && ext != "XML")  ){
  			if (document.forms[0].FILENAME.value.length < 1) {
  				alert("Localización, o Nombre de Archivo no Válidos");
  			} else {
  				alert("Extencion no permitida");
  			}
  			document.forms[0].FILENAME.value='';
  			document.forms[0].FILENAME.focus();
		} else {
		var fileName = document.forms[0].FILENAME.value;
		var ext = fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase();
			document.getElementById("SCREEN").value = "200";
		}
		document.forms[0].submit();
	}
	if (opt == 2) {

		try {
			window.opener.submitFile(document.forms[0].ARCHIVO.value, document.forms[0].DIRECTORIO.value);
		} catch (Exception) {
		}
		top.close();
		//top.opener.document.forms[0].submit();
	}
	if (opt == 3) {
		window.close();
	}
}



</SCRIPT>

</head>
<body onload="goAction(2)">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center"> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_upload_file.jsp, EIFS100"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEIFS100" ENCTYPE="multipart/form-data">
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="FILEFLAG" ID="FILEFLAG" VALUE="">
  <INPUT TYPE=HIDDEN NAME="FILEFIELD" ID="FILEFIELD" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ARCHIVO" ID="ARCHIVO" VALUE="<%=fileInfo.getE01FILE()%>">
  <INPUT TYPE=HIDDEN NAME="DIRECTORIO" ID="DIRECTORIO" VALUE="<%=fileInfo.getE01DIREC()%>">





<TABLE class="tableinfo">
       
		<TR align="center">
			<TD align="right"><h3>Archivo : </h3></TD>
			<TD align="left">
				<H3>

				<input type=file name="FILENAME" height="20" size="100" maxlength="255">


				</H3>
			</TD>
		</TR>

</TABLE>



<div align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction('1')">
	<input id="EIBSBTN" type="button" name="Regresar" value="Regresar" onClick="goAction('3')">
  </div>


  </form>

</body>
</html>
