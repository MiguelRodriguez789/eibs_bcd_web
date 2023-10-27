<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML>
<HEAD>
<jsp:useBean id="error"   class="datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT SRC="<%= request.getContextPath() %>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<TITLE>Subida de Archivo</TITLE>
</HEAD>

<script type="text/javascript"> 

function dateValidation(date1, date2, date3 ){
	var objDate;
<%
	if ( currUser.getE01DTF().equals("MDY") ) {
%>
		objDate = new Date(date3, date1-1, date2);
<%
	} else if ( currUser.getE01DTF().equals("DMY") ) {
%>
		objDate = new Date(date3, date2-1, date1);
<%
	} else {
%>
		objDate = new Date(date1, date2-1, date3);
<%
	}
%>
	var today = new Date();

	if( today > objDate ){
		return false;
	}
	return true;
}


function upload() {

	var errMsg = "";

	if(document.getElementById('TYPE').value == 'ID' 
		&& document.getElementById('DATE').value == ''){
		errMsg += "La fecha de expiración es requerida para este tipo de documento.";
	}else if( false && !dateValidation(document.getElementById('DATE1').value, document.getElementById('DATE2').value, document.getElementById('DATE3').value) ){
		errMsg += "Fecha Inválida. Debe ser mayor a la fecha actual.";
	}
	
	if( document.getElementById('UFILE').value == "" ){
		errMsg += "Archivo Inválido.";
	}
	
	if( errMsg != "" ){
		alert( errMsg );
		return false ;
	}
	
	document.getElementById("ibsForm").submit(); 
	//top.opener.document.getElementById("ibsForm").submit();
	//window.close();
}

<% 
if (!error.getERRNUM().equals("0")) {
%>
	showErrors();
<%
}
%>
</script>

<div id="contenedorInternoIbs">
<div id="inputsContainer">
<form  id="ibsForm" name="ibsForm" method="post" ACTION="<%= request.getContextPath()%>/servlet/datapro.eibs.tools.JSUploadDocuments" enctype='multipart/form-data'>
<% String ext = request.getParameter("EXT") != null ? request.getParameter("EXT") : ""; %>
	<input type="hidden" id="EXT" name="EXT" value="<%= ext %>">
	<input type="hidden" id="TYPE" name="TYPE" value="<%= request.getParameter("TYPE") %>">
	
	<h3 align="center">Documentos Digitales</h3>
<br />	
<br />
  <table class="tableinfo">

  <tr>
  	<td width="35%" align="right" nowrap="nowrap">Subir Archivo <%= (ext.equals("") ? "" : " (*."+ext+")")%> :</td>
  	<td width="65%" align="left"> 
  		<input type="FILE" id="UFILE" name="UFILE" > 
  	</td>
  </tr>
  <tr>
    <td align="right" ></td>
    <td align="left">
    	Adicionar a la secuencia actual
    	<input type="checkbox" id="addSEQ" name="addSEQ" value="true"/>
    </td>
  </tr>
  <% if(false){  %>
  <tr>
    <td align="right" >Fecha de Expiración : </td>
    <td align="left">
    	<input type="text" accept="text" id="DATE1" name="DATE1" value="" size="3" maxlength="2" />
    	<input type="text" accept="text" id="DATE2" name="DATE2" value="" size="3" maxlength="2" />
    	<input type="text" accept="text" id="DATE3" name="DATE3" value="" size="3" maxlength="2" /> 
		<a href="javascript:DOBPicker(document.forms[0].DATE1,document.forms[0].DATE2,document.forms[0].DATE3)">
		<img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="middle" border="0"></a>
		<% if(request.getParameter("TYPE").equals("ID")){ %>
		<img src="<%= request.getContextPath() %>/images/Check.gif" />
		<% } %>
    </td>
  </tr>
  <% } %>
</table>  
  <p>
  <%-- ----- SUBMIT BUTTONS ----- --%>
  	<table align="center" width="100%" style="background-color:  white;">
	  <tr>
		    <td width="33%" align="center" nowrap="nowrap">
				<button type="button" id="EIBSBTN" name="Guardar" value="1" 
					onclick="javascript:upload()" >
		    		Subir Archivo
		    	</button>
		    </td>
	  </tr>
	</table>

</form>
</div>
</div>
