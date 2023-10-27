<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>File Incoming</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckFile(){
	var modes = ['H', 'M', 'C', 'L'];
	var concs = ['C', 'I', 'O']; 
	if ( modes.indexOf(document.forms[0].MODE.value) <= -1){ 
		alert("Se necesita una Modalidad de Credito!!!");
  		document.forms[0].MODE.value='';
  		document.forms[0].MODE.focus();
  	}else if ( concs.indexOf(document.forms[0].CONC.value) <= -1){ 
		alert("Se necesita un Concepto para Contabilidad!!!");
  		document.forms[0].CONC.value='';
  		document.forms[0].CONC.focus();	
	} else if ( document.forms[0].FILENAME.value.length < 1) {
  		alert("Se necesita un nombre de archivo valido!!!");
  		document.forms[0].FILENAME.value='';
  		document.forms[0].FILENAME.focus();
	} else {
		document.forms[0].EIBSBTN.disabled = true;
  		document.forms[0].submit();
  	}
}

</SCRIPT>

</HEAD>

<body>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
 %>

 <h3 align="center">Cargue de Archivo NIIF 9 - Provision<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="file_request, EDL1540"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL1540" ENCTYPE="multipart/form-data">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
    
	<table  class="tbenter" width="100%" height="50%" border="0" cellspacing=0 cellpadding=2>
		<tr>
     		<td align="center"><b>Modalidad de Cr&eacute;dito :</b> 
            	<select name="MODE">
						<option value=" "> </option>
						<option value="H">Hipotecario</option>
						<option value="M">Microcredito</option>
						<option value="C">Consumo</option>
						<option value="L">Comercial</option>
				</select>
 			</td>
		</tr>
		<tr>
     		<td align="center"><b>Concepto :</b> 
            	<select name="CONC">
						<option value=" "> </option>
						<option value="C">Capital</option>
						<option value="I">Interes</option>
						<option value="O">Otros</option>
				</select>
 			</td>
		</tr>
		<tr>
     		<td align="center"><b>Periodo Año/Mes:</b> 
            	<input type="text" name="PYEAR" value="" size="4" maxlength="4"/>/<input type="text" name="PMONTH" value="" size="2" maxlength="2"/>
 			</td>
		</tr>
		<tr>
     		<td align="center"><b>Archivo :</b> 
            	<input type=file name="FILENAME" size="50" maxlength="255" >
 			</td>
		</tr>
		<tr>
			<td align="center">
				<!-- <br>
				Esta opción tomará el Archivo en formato NACHA, lo validará y si esta correcto lo procesará.<br><br>
				El reporte ACH400 con el resultado del proceso estará disponible en el Spool del usuario. <br>
				Las transacciones contables se ven en los reportes GL0020/GL0021 y GL0016 (Futuras). Estos <br>
				reportes estarán en el Spool del Usuario si tiene definido aprobación automática o deben<br>
				ser generados una vez apruebe el lote respectivo.<br>  -->
 			</td>      
	   	</tr>
  	</table>
	<table width="100%">		
  		<tr>
  			<td width="100%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="button" name="Process" value="Procesar" onClick="javascript:CheckFile();">
					<% userPO.setPurpose("PROCESS"); %>
     	  		</div>	
  			</td>
  		</tr>	
  </table>

<script type="text/javascript">
  document.forms[0].FILENAME.focus();
</script>

 </FORM>
</BODY>
</HTML>
 