<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Desglose de Cheques</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/e/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckFile(){
if ( document.forms[0].FILENAME.value.length < 1) {
  alert("Ingrese la ruta y el nombre de archivo");
  document.forms[0].FILENAME.value='';
  document.forms[0].FILENAME.focus();
}
else {
  document.forms[0].SCREEN.value = '200';	
  document.forms[0].submit();
  }
}

</SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
</HEAD>
<body>

 <h3 align="center">Carga de Archivo de Desglose de Cheques<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="checks_breakdown_file.jsp, EDD0947"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0947" ENCTYPE="multipart/form-data">	
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    </p>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
			<tr>
     			<td align="center"> 
             		Nombre de Archivo : 
		            <input type=file name="FILENAME" size="50" maxlength="255" >
     			</td>        
    		</tr>
	  </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="CheckFile()"> 
  </p> 
	  

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
