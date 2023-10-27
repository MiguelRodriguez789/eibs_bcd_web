<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>MQ Test</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="msgRcd" class="datapro.eibs.beans.EMQ0000DSMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckFile(op){
	if ( document.forms[0].FILENAME.value.length < 1) {
  		alert("Se necesita un nombre de archivo valido!!!");
  		document.forms[0].FILENAME.value='';
  		document.forms[0].FILENAME.focus();
	} else {
		document.forms[0].EIBSBTN.disabled = true;
  		document.forms[0].SCREEN.value = op;
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
    
    String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >"; 
 	%>

 <h3 align="center">Procesar Archivo con mensajes de Prueba para Servicios por MQ<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="incoming_file, EMQ0000"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.mq.JSEMQ0000" ENCTYPE="multipart/form-data">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    
	<table  class="tbenter" width="100%" height="20%" border="0" cellspacing=0 cellpadding=2>
		<tr>
     		<td align="center">Archivo : 
            	<input type=file name="FILENAME" size="50" maxlength="255" >
 			</td>
		</tr>
		<tr>
			<td align="center"> 
				Esta opción tomará el Archivo en formato TEXTO, lo validará y si esta correcto colocara el mensaje en la cola de MQ.<br>
				El archivo Texto debe tener el cuerpo del mensaje sin el encabezado general (este se toma de esta pantalla).<br>
				El resultado será enviado a la cola de salida y logs de servicios (SISMSI / SISMSO).
 			</td>      
	   	</tr>
  	</table>
  	
  	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Servicio : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="HDRSTART" maxlength="3" size="4" readonly value="<%= msgRcd.getHDRSTART().trim()%>">
           		<fieldset><legend></legend>
              		<SELECT class="inputs" name="HDRSERVICE" size="1"></SELECT>
              	</fieldset>
           		<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Secuencia Unica : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="HDRSEQ" maxlength="12" size="14" value="<%= msgRcd.getHDRSEQ().trim()%>" onkeypress="enterInteger(event)">
            	<%=mandatory %>
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="HDRDATE" size="10" readonly value="<%= msgRcd.getHDRDATE().trim()%>">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Hora : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="HDRTIME" size="6" readonly value="<%= msgRcd.getHDRTIME().trim()%>">
            	<%=mandatory %>
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Proveedor : </td>
			<td nowrap align="left" width="35%">
				<eibsinput:cnofc name="msgRcd" property="HDRVENDOR" value="<%=msgRcd.getHDRVENDOR()%>" required="true" flag="BT" fn_code="HDRVENDOR" fn_description="D01VENDOR" maxlength="4"/>
				<INPUT type="hidden" name="D01VENDOR" >
			</td>
            <td nowrap width="15%" align="right">Canal : </td>
            <td nowrap width="35%" align="left"> 
            	<input type="text" name="HDRCHANNEL" size="5" maxlength="2" value="<%= msgRcd.getHDRCHANNEL() %>"><%=mandatory %>
            	<a href="javascript:GetChannelDef('HDRCHANNEL','D01CHANNEL',' ');">
            		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				<INPUT type="hidden" name="D01CHANNEL" >
            </td>
          </tr>
          <tr id="trclear"  > 
              <td nowrap width="15%" align="right">Terminal :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="HDRTERMINA" size="30" maxlength="25" value="<%= msgRcd.getHDRTERMINA() %>">
              </td>
              <td nowrap width="15%" align="right">IP :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="HDRIP" size="30" maxlength="25" value="<%= msgRcd.getHDRIP() %>">
              </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Numero de Registros a Devolver : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="HDRNUMREC" maxlength="4" size="6" value="<%= msgRcd.getHDRNUMREC().trim()%>" onkeypress="enterInteger(event)">
			</td>
			<td nowrap width="15%" align="right"></td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="HDREND" maxlength="3" size="4" readonly value="<%= msgRcd.getHDREND().trim()%>">
			</td>
          </tr>
          
        </table> 
      </td>  
    </tr>
  </table>
  	
	<table width="100%">		
  		<tr>
  			<td width="100%"> 
  		  		<div align="center"> 
     				<input id="EIBSBTN" type="button" name="Process" value="Procesar" onClick="javascript:CheckFile('5');">
					<% userPO.setPurpose("PROCESS"); %>
     	  		</div>	
  			</td>
  		</tr>	
  </table>

 </FORM>
 <SCRIPT type="text/javascript">

  // Clases de vias
  tobox = document.forms[0].HDRSERVICE;
  tobox.options.length = 0;
  tobox.options[tobox.options.length] = new Option(' ',' ',true,'selected');
  tobox.options[tobox.options.length] = new Option('SER001','SER001');
  tobox.options[tobox.options.length] = new Option('SER002','SER002');
  tobox.options[tobox.options.length] = new Option('SER003','SER003');
  tobox.options[tobox.options.length] = new Option('SER004','SER004');
  tobox.options[tobox.options.length] = new Option('SER005','SER005');
  tobox.options[tobox.options.length] = new Option('SER006','SER006');
  tobox.options[tobox.options.length] = new Option('SER007','SER007');
  tobox.options[tobox.options.length] = new Option('SER008','SER008');
  tobox.options[tobox.options.length] = new Option('SER009','SER009');
  tobox.options[tobox.options.length] = new Option('SER010','SER010');
  tobox.options[tobox.options.length] = new Option('SER011','SER011');
  tobox.options[tobox.options.length] = new Option('SER012','SER012');
  tobox.options[tobox.options.length] = new Option('SER013','SER013');
  tobox.options[tobox.options.length] = new Option('SER014','SER014');
  tobox.options[tobox.options.length] = new Option('SER015','SER015');
  tobox.options[tobox.options.length] = new Option('SER016','SER016');
  tobox.options[tobox.options.length] = new Option('SER017','SER017');
  tobox.options[tobox.options.length] = new Option('SER018','SER018');
  tobox.options[tobox.options.length] = new Option('SER019','SER019');
  tobox.options[tobox.options.length] = new Option('SER020','SER020');
  tobox.options[tobox.options.length] = new Option('SER021','SER021');
  tobox.options[tobox.options.length] = new Option('SER021A','SER021A');
  tobox.options[tobox.options.length] = new Option('SER022','SER022');
  tobox.options[tobox.options.length] = new Option('SER023','SER023');
  tobox.options[tobox.options.length] = new Option('SER024','SER024');
  tobox.options[tobox.options.length] = new Option('SER025','SER025');
  tobox.options[tobox.options.length] = new Option('SER026','SER026');
  tobox.options[tobox.options.length] = new Option('SER027','SER027');
  tobox.options[tobox.options.length] = new Option('SER028','SER028');
  tobox.options[tobox.options.length] = new Option('SER029','SER029');
  tobox.options[tobox.options.length] = new Option('SER030','SER030');
  tobox.options[tobox.options.length] = new Option('SER031','SER031');
  tobox.options[tobox.options.length] = new Option('SER032','SER032');
  tobox.options[tobox.options.length] = new Option('SER033','SER033');
  tobox.options[tobox.options.length] = new Option('SER034','SER034');
  tobox.options[tobox.options.length] = new Option('SER035','SER035');
  tobox.options[tobox.options.length] = new Option('SER036','SER036');
  tobox.options[tobox.options.length] = new Option('SER037','SER037');
  tobox.options[tobox.options.length] = new Option('SER038','SER038');
  tobox.options[tobox.options.length] = new Option('SER039','SER039');
  tobox.options[tobox.options.length] = new Option('SER040','SER040');
  tobox.options[tobox.options.length] = new Option('SER041','SER041');
  tobox.options[tobox.options.length] = new Option('SER042','SER042');
  tobox.options[tobox.options.length] = new Option('SER043','SER043');
  tobox.options[tobox.options.length] = new Option('SER044','SER044');
  tobox.options[tobox.options.length] = new Option('SER045','SER045');
  tobox.options[tobox.options.length] = new Option('SER046','SER046');
  tobox.options[tobox.options.length] = new Option('SER047','SER047');
  tobox.options[tobox.options.length] = new Option('SER048','SER048');
  tobox.options[tobox.options.length] = new Option('SER049','SER049');
  tobox.options[tobox.options.length] = new Option('SER050','SER050');
  tobox.options[tobox.options.length] = new Option('SER051','SER051');
  tobox.options[tobox.options.length] = new Option('SER052','SER052');
  tobox.options[tobox.options.length] = new Option('SER053','SER053');
  tobox.options[tobox.options.length] = new Option('SER054','SER054');
  tobox.options[tobox.options.length] = new Option('SER055','SER055');
  tobox.options[tobox.options.length] = new Option('SER056','SER056');
  tobox.options[tobox.options.length] = new Option('SER057','SER057');
  tobox.options[tobox.options.length] = new Option('SER058','SER058');
  tobox.options[tobox.options.length] = new Option('SER059','SER059');
  tobox.options[tobox.options.length] = new Option('SER060','SER060');
  tobox.options[tobox.options.length] = new Option('SER061','SER061');
  tobox.options[tobox.options.length] = new Option('SER062','SER062');
  tobox.options[tobox.options.length] = new Option('SER063','SER063');
  tobox.options[tobox.options.length] = new Option('SER064','SER064');
  tobox.options[tobox.options.length] = new Option('SER065','SER065');
  tobox.options[tobox.options.length] = new Option('SER066','SER066');
  tobox.options[tobox.options.length] = new Option('SER067','SER067');
  tobox.options[tobox.options.length] = new Option('SER068','SER068');
  tobox.options[tobox.options.length] = new Option('SER069','SER069');
  tobox.options[tobox.options.length] = new Option('SER070','SER070');
  tobox.options[tobox.options.length] = new Option('SER071','SER071');
  tobox.options[tobox.options.length] = new Option('SER072','SER072');
  tobox.options[tobox.options.length] = new Option('SER073','SER073');
  tobox.options[tobox.options.length] = new Option('SER074','SER074');
  tobox.options[tobox.options.length] = new Option('SER075','SER075');  
  document.forms[0].FILENAME.focus(); 
 
 </SCRIPT>
</BODY>
</HTML>
 