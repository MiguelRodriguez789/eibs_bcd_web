<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Carga de Calificaciones</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="EDL0999Record" class="datapro.eibs.beans.EDL099901Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">

function CheckFile(){
	if ( document.forms[0].FILENAME.value.length < 1) {
	  	alert("Localización o Nombre de Archivo no Válidos");
	  	document.forms[0].FILENAME.value='';
	  	document.forms[0].FILENAME.focus();
	} else {	
	  	alert("Este procedimiento puede tardar varios minutos.\r\nPor favor espere que muestre la pantalla de confirmación.");
	  	document.getElementById("wait").style.visibility = 'visible';
	  	document.getElementById("EIBSBTN").disabled = true;	
	  	document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0999?CRITERIO="+document.forms[0].CRITERIO.value;
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

<h3 align="center"> Carga de Calificaciones
 	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="transfer_file.jsp, EDL0999"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0999" ENCTYPE="multipart/form-data">	
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap height="143"> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Criterio :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <select id="criterio" NAME="CRITERIO" disabled>
                		<option></option>
						<option value="1"
						<% if(request.getParameter("CRITERIO").trim().equals("1")){ out.print("selected"); } %>
						>1-Otorgamiento</option>
						<option value="2"
						<% if(request.getParameter("CRITERIO").trim().equals("2")){ out.print("selected"); } %>
						>2-Reestructurado</option>
						<option value="3"
						<% if(request.getParameter("CRITERIO").trim().equals("3")){ out.print("selected"); } %>
						>3-Documentacion por papeles</option>
						<option value="4" 
						<% if(request.getParameter("CRITERIO").trim().equals("4")){ out.print("selected"); } %>
						>4-Evaluacion y Calificacion de Cartera</option>
						<option value="5" 
						<% if(request.getParameter("CRITERIO").trim().equals("5")){ out.print("selected"); } %>
						>5-Adicional</option>
						<option value="6" 
						<% if(request.getParameter("CRITERIO").trim().equals("6")){ out.print("selected"); } %>
						>6-Score</option>						
						<option value="7" 
						<% if(request.getParameter("CRITERIO").trim().equals("7")){ out.print("selected"); } %>
						>7-Excepción</option>												
				</select>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%"> 
            </td>
            <td nowrap width="3%">&nbsp;</td>
            <td nowrap width="23%">&nbsp;</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%">&nbsp;
              <div align="right">INGRESE DATOS DEL ARCHIVO A PROCESAR</div>
            </td>
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
  		<span><font color="#d0122c" size="2"><i>Actualizando Cargue .... </i></font></span>
  	</div> 

<script language="JavaScript">
  document.forms[0].FILENAME.focus();
</script>
 </FORM>
</BODY>
</HTML>
