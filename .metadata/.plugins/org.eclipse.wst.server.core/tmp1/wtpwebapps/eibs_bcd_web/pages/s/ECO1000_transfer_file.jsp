<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Carga de Cuadraturas automaticas</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function CheckFile(){
	if ( document.forms[0].FILENAME.value.length < 1) {
	  	alert("Localizaci�n o Nombre de Archivo no V�lidos");
	  	document.forms[0].FILENAME.value='';
	  	document.forms[0].FILENAME.focus();
	} else {	
	  	alert("Este procedimiento puede tardar varios minutos.\r\nPor favor espere que muestre la pantalla de confirmaci�n.");
	  	getElement("wait").style.visibility = 'visible';
	  	getElement("EIBSBTN").disabled = true;	
		document.forms[0].submit();
	}
}

</SCRIPT>
</HEAD>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<h3 align="center"> Carga de Cuadraturas automaticas
 	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transfer_file.jsp, ECO1000"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1000" ENCTYPE="multipart/form-data">	
    <p>
    	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
    </p>

  <table class="tableinfo">
    <tr > 
      <td nowrap height="143"> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="32%"> 
              <div align="right">Ingrese datos del archivo a procesar</div>
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%">&nbsp;</td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%">&nbsp;</td>
          </tr>
        </table>
		<table id="tbenter" align="center" style="width:85%" border="1">  
		   <tr> 
		     <td> 
		       <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">		
		          <tr id="trdark">
		     		<td align="center"> 
				      <input type=file name="FILENAME" size="100" maxlength="255" >
		     		</td>        
		    	  </tr>		
			   </table>
		     </td>
		   </tr>
		 </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="CheckFile()"> 
  </p> 

  	<br>
  	<br>
  	
  	<div id="wait" align="center" style="visibility: hidden">
  		<img align="bottom" border="0" src="<%=request.getContextPath()%>/images/gears7.gif"/>
  		<span><font color="#d0122c" size="2"><i>Actualizando Planilla .... </i></font></span>
  	</div> 

<script type="text/javascript">
  document.forms[0].FILENAME.focus();
</script>
 </FORM>
</BODY>
</HTML>
