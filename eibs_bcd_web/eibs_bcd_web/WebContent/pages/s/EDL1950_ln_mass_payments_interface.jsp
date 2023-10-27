<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Pagos Masivos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EDL195001Message" scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT Language="Javascript">

function cancel() {
	getElement("SCREEN").value = 4;
	document.forms[0].submit();
}

function fileGen() {
  if (document.forms[0].FILENAME.value.length < 1) {
    alert("Nombre de Archivo no Válidos");
    document.forms[0].FILENAME.value='';
    document.forms[0].FILENAME.focus();
  } else {	
    document.forms[0].submit();
  }
}

</SCRIPT>

</head>
<body>
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
%>

<h3 align="center">Pagos Masivos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_mass_payments_interface.jsp, EDL1950"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1950?SCREEN=2" ENCTYPE="multipart/form-data" >

  <table class="tableinfo">
    <tr > 
      <td width="40%">&nbsp;</td>
      <td width="60%">&nbsp;</td>
    </tr>
    <tr > 
      <td width="40%">
        <div align="right">Seleccione Archivo :</div>
      </td>
      <td width="60%">
        <input type="file" name="FILENAME" size="50" >
      </td>
    </tr>
    <tr > 
      <td width="40%">&nbsp;</td>
      <td width="60%">&nbsp;</td>
    </tr>
    <tr > 
      <td width="40%">&nbsp;</td>
      <td width="60%">&nbsp;</td>
    </tr>
  </table>

  <table class="tbenter" >
	<tr > 
	  <td width="25%"></td> 
	  <td width="25%" align="center"><input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="fileGen()"></td>
	  <td width="25%" align="center"><input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="cancel()"></td>
	  <td width="25%"></td>
    </tr>
  </table>

</form>
  
</body>
</html>
 