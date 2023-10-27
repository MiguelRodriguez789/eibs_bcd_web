<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA000001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	submitForm();
}

function chgTipo(p) {

 	if (p == "M") {
		MQ.style.display='block';
		SOCKETS.style.display='none';
		IFS.style.display='none';
		ARCHIVO.style.display='none';
		FTP.style.display='none';
	} else if (p == "S") {
		MQ.style.display='none';
		SOCKETS.style.display='block';
		IFS.style.display='none';
		ARCHIVO.style.display='none';
		FTP.style.display='none';
	} else if (p == "I") {
		MQ.style.display='none';
		SOCKETS.style.display='none';
		IFS.style.display='block';
		ARCHIVO.style.display='none';
		FTP.style.display='none';
	} else if (p == "A") {
		MQ.style.display='none';
		SOCKETS.style.display='none';
		IFS.style.display='none';
		ARCHIVO.style.display='block';	
		FTP.style.display='none';
	}
	else if (p == "F") {
		MQ.style.display='none';
		SOCKETS.style.display='none';
		IFS.style.display='none';
		ARCHIVO.style.display='none';	
		FTP.style.display='block';
	}
 }
 
</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 	String read = " ";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
	}
%>

<h3 align="center">Mantenimiento de Interfaces y Canales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="interfaces_channels.jsp, ECA0000"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0000" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="trdark">
				<td nowrap width=10% align="right">Código Canal / Interface : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01ICANOE" size="12" maxlength="10" value="<%= msgRcd.getE01ICANOE() %>" <%= read %>><%=mandatory %>
				</td>
            	<td nowrap width=10% align="right">Descripción : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="E01ICADSC" size="50" maxlength="45" value="<%= msgRcd.getE01ICADSC() %>"><%=mandatory %>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Via : </td>
				<td nowrap width=40% align="left">
					<select name="E01ICAVIA" onchange="chgTipo(this.value)" >
          	  		<option value="M" <% if (msgRcd.getE01ICAVIA().equals("M")) out.print("selected"); %> >MQ</option>
                	<option value="S" <% if (msgRcd.getE01ICAVIA().equals("S")) out.print("selected"); %>>Sockets</option>
                	<option value="I" <% if (msgRcd.getE01ICAVIA().equals("I")) out.print("selected"); %>>IFS</option>
                	<option value="A" <% if (msgRcd.getE01ICAVIA().equals("A")) out.print("selected"); %>>Archivo AS/400</option>
                	<option value="F" <% if (msgRcd.getE01ICAVIA().equals("F")) out.print("selected"); %>>FTP</option>
           			</select><%=mandatory %>	
				</td>
				<td nowrap width=10% align="right">Usuario IBS Asociado : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01ICAUSR" size="12" maxlength="10" value="<%=msgRcd.getE01ICAUSR()%>">
            		<input type="text" name="D01USRDSC" size="50" maxlength="45"  value="<%=msgRcd.getD01USRDSC()%>" readonly><%=mandatory %>
            	<a href="javascript:GetUser('E01ICAUSR','D01USRDSC',' ');">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Usuarios" align="bottom" border="0" ></a>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width=10% align="right">Periodicidad : </td>
				<td  nowrap width=40% align="left">
					<select name="E01ICAPER" >
					    <option value="N" <% if (msgRcd.getE01ICAPER().equals("N")) out.print("selected"); %>>No Aplica</option>
	          	  		<option value="D" <% if (msgRcd.getE01ICAPER().equals("D")) out.print("selected"); %>>Diario</option>
	                	<option value="S" <% if (msgRcd.getE01ICAPER().equals("S")) out.print("selected"); %>>Semanal</option>
	                	<option value="Q" <% if (msgRcd.getE01ICAPER().equals("Q")) out.print("selected"); %>>Quincenal</option>
	                	<option value="M" <% if (msgRcd.getE01ICAPER().equals("M")) out.print("selected"); %>>Mensual</option>
	                	<option value="T" <% if (msgRcd.getE01ICAPER().equals("T")) out.print("selected"); %>>Trimestral</option>
	                	<option value="E" <% if (msgRcd.getE01ICAPER().equals("E")) out.print("selected"); %>>Semestral</option>
	                	<option value="A" <% if (msgRcd.getE01ICAPER().equals("A")) out.print("selected"); %>>Anual</option>
	                	<option value="P" <% if (msgRcd.getE01ICAPER().equals("P")) out.print("selected"); %>>Por Demanda</option>
           			</select><%=mandatory %>
				</td>
            	<td nowrap width=10% align="right">Estado : </td>
            	<td  nowrap width=40% align="left">
            		<select name="E01ICAEST">
          	  		<option value="A" <% if (msgRcd.getE01ICAEST().equals("A")) out.print("selected"); %> >ACTIVO</option>
                	<option value="I" <% if (msgRcd.getE01ICAEST().equals("I")) out.print("selected"); %>>INACTIVO</option>
           			</select><%=mandatory %>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Código Interno IBS : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01ICANOI" size="12" maxlength="10" value="<%=msgRcd.getE01ICANOI()%>" <%= read %>>
					<%=mandatory %> (Usado en los programas para validar la Interface)
				</td>
				<td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
				</td>
			</tr>
	  		<tr id="trdark">
				<td nowrap width=10% align="right">Estructura de Datos : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01ICADDS" size="12" maxlength="10" value="<%=msgRcd.getE01ICADDS()%>">
				</td>
				<td nowrap width=10% align="right">Programa que Procesa : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01ICAPGM" size="12" maxlength="10" value="<%= msgRcd.getE01ICAPGM() %>"><%=mandatory %>
				</td>
			</tr>
			<tr id="trclear"  > 
             <td nowrap width="10%" align="right" colspan="1">Instrucciones :</td>
              <td nowrap width="40%" align="left">
              	<textarea name="E01ICAINS" cols="50" rows="6" ><%=msgRcd.getE01ICAINS()%></textarea>
              </td>
              <td nowrap width=10% align="right"></td>
				<td  nowrap width=40% align="left">
				</td>
          </tr>
   		</table> 
      </td>  
    </tr>
  </table>
	

	<div id="SOCKETS" style="position:relative; display:none;">
	<h4>Informacion de Sockets</h4> 
   	<table class="tableinfo" width=80%  height="10%">
   		<tr>
			<td nowrap width=30% align="right"></td>
			<td>Es Obligatorrio la Estructura de Datos y el Programa. No se requiere informacion adicional.</td>
		</tr>
   	</table>
   	</div>

	<div id="MQ" style="position:relative; display:block;">
	<h4>Informacion de MQ</h4> 
   	<table class="tableinfo" width=80% height="10%">
   		<tr>
			<td nowrap width=30% align="right">Nombre del Gestor : </td>
			<td >
				<input type="text" name="E01ICAGES" size="125" maxlength="124" value="<%= msgRcd.getE01ICAGES() %>" ><%=mandatory %>
			</td>
			<td></td>
			<td></td>	
			<tr>
				<td nowrap width=30% align="right">Nombre Cola de Entrada : </td>
				<td>
					<input type="text" name="E01ICAQIN" size="125" maxlength="124" value="<%= msgRcd.getE01ICAQIN() %>" ><%=mandatory %>
				</td>
				<td nowrap width=30% align="right"></td>
				<td>
				</td>
			</tr>
			<tr>
				<td nowrap width=30% align="right">Nombre Cola de Salida : </td>
				<td>
					<input type="text" name="E01ICAQOU" size="125" maxlength="124" value="<%= msgRcd.getE01ICAQOU() %>" ><%=mandatory %>
				</td>
				<td nowrap width=30% align="right"></td>
				<td>
				</td>
			</tr>
   	</table>
   	</div>

	<div id="ARCHIVO" style="position:relative; display:none;">
	<h4>Informacion de Archivo</h4>
   	<table class="tableinfo" width=80% height="10%">
   			<tr>
				<td nowrap width=30% align="right">Librería AS/400 : </td>
				<td>
				<input type="text" name="E01ICALIB" size="10" maxlength="10" value="<%= msgRcd.getE01ICALIB() %>" ><%=mandatory %>
				</td>
			</tr>
			<tr>
			<td nowrap width=30% align="right">Nombre Archivo AS/400 : </td>
			<td>
				<input type="text" name="E01ICAARC" size="10" maxlength="10" value="<%= msgRcd.getE01ICAARC() %> " ><%=mandatory %>
			</td>
			</tr>
   	</table>
   	</div>

	<div id="IFS" style="position:relative; display:none;">
	<h4>Informacion de IFS</h4>
   	<table class="tableinfo" width=80% height=10%>
   		<tr id="trdark">
				<td nowrap width=20% align="right">Ruta en IFS de iSeries : <br>(Empezar y terminar con /)</td>
				<td nowrap width=80% align="left">
					<input type="text" name="E01ICARUT" size="124" maxlength="256" value="<%=msgRcd.getE01ICARUT()%>"><%=mandatory %>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width=20% align="right">Nombre de Archivo en IFS : <br>(Solo si el nombre es fijo) : </td>
				<td  nowrap width=80% align="left">
					<input type="text" name="E01ICAARI" size="65" maxlength="60" value="<%= msgRcd.getE01ICAARI() %>">
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width=20% align="right">eIBS Menú  : <br>(Solo si es por Demanda) : </td>
				<td  nowrap width=80% align="left">
					<input type="text" name="E01ICAMNU" size="8" maxlength="6" value="<%= msgRcd.getE01ICAMNU() %>">
              		<a href="javascript:GetWebMnu('E01ICAMNU',' ')" >
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width=20% align="right">eIBS Opción  : <br>(Solo si es por Demanda) : </td>
				<td  nowrap width=80% align="left">
					<input type="text" name="E01ICADEN" size="5" maxlength="3" value="<%= msgRcd.getE01ICADEN() %>" onkeypress="enterInteger(event)">
					<a href="javascript:GetWebMnuOpt(document.forms[0].E01ICAMNU.value,' ',' ')" >
                	<img src="<%=request.getContextPath()%>/images/1aquire.gif" title="Consulta" align="bottom" border="0" ></a>
				</td>
			</tr>
   	</table>
   	</div>
   	
   	<div id="FTP" style="position:relative; display:none;">
	<h4>Información de FTP</h4>
   	<table class="tableinfo" width=80% height="10%">
   		<tr>
			<td nowrap width=30% align="right">IP : </td>
			<td>
				<input type="text" name="E01ICADIP" size="30" maxlength="25" value="<%= msgRcd.getE01ICADIP() %> " ><%=mandatory %>
			</td>	
		</tr>	
		<tr>
			<td nowrap width=30% align="right">Usuario : </td>
			<td>
				<input type="text" name="E01ICAUSU" size="40" maxlength="40" value="<%= msgRcd.getE01ICAUSU() %> " ><%=mandatory %>
			</td>			
		</tr>
		<tr><td nowrap width=30% align="right">Password : </td>
			<td>
				<input type="text" name="E01ICAPAS" size="40" maxlength="64" value="<%= msgRcd.getE01ICAPAS() %> " ><%=mandatory %>
			</td>
		</tr>
		<tr>
			<td nowrap width=29% align="right">Ruta del archivo : </td>
			<td>
				<input type="text" name="E01ICAFTP" size="130" maxlength="256" value="<%= msgRcd.getE01ICAFTP() %> " ><%=mandatory %>
			</td>	
		</tr>		
   	</table>
   	</div>
   	
<br>
	
	<table width="100%">		
  	<tr>
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= msgRcd.getE01CUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01MUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01CDM()),Integer.parseInt(msgRcd.getE01CDD()),Integer.parseInt(msgRcd.getE01CDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01MDM()),Integer.parseInt(msgRcd.getE01MDD()),Integer.parseInt(msgRcd.getE01MDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01CTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01MTM()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
</form>
</body>

	<SCRIPT type="text/javascript">
		chgTipo('<%= msgRcd.getE01ICAVIA().trim()%>');
	</SCRIPT>

</html>
