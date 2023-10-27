<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>FEP Incoming</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckFile(op){
	if ( document.forms[0].FILENAME.value.length < 1) {
  		alert("Se necesita un nombre de archivo valido!!!");
  		document.forms[0].FILENAME.value='';
  		document.forms[0].FILENAME.focus();
	} else { 
  		document.forms[0].SCREEN.value = op;
		document.forms[0].submit();
  	}
}

</SCRIPT>

</HEAD>

<body>

 <h3 align="center">Procesar Archivo Entrante de Originador<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="incoming_file, EACH400"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH401" ENCTYPE="multipart/form-data">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
    
	<table  class="tbenter" width="100%" height="50%" border="0" cellspacing=0 cellpadding=2>
		<tr>
     		<td align="center">Archivo : 
            	<input type=file name="FILENAME" size="50" maxlength="255" >
 			</td>
		</tr>
		<tr>
			<td align="center">
				<br>
				Esta opción tomará el archivo en formato FEP o CSV, lo validará y si esta correcto lo procesará<br>
				generando las transacciones correctas para posterior Transmisión Vía ACH o Transferencia Interna.<br><br>
				El reporte ACH401 con el resultado del proceso estará disponible en el Spool del usuario. <br>
 			</td>       
	   	</tr>
  	</table>
	<table width="100%">		
  		<tr>
  			<td width="50%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="button" name="Process" value="Procesar" onClick="javascript:CheckFile('5');">
					<% userPO.setPurpose("PROCESS"); %>
     	   		</div>	
  			</td>
			<td width="50%"> 
  		  		<div align="center"> 
				<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
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
 