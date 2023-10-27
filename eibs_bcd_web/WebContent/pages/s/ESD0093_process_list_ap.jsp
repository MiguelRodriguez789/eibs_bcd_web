<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="26";
	if (!confirm("Se generara el reporte SD0093 en la bandeja de impresion. Desea procesar?")) {
		return;
	}
	document.forms[0].submit();
}

function goReport() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="10";
	if (!confirm("Se generara el reporte SD0093 en la bandeja de impresion.")) {
		return;
	}
	document.forms[0].submit();
} 

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el Registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="9";
	if (!confirm("Desea borrar el Registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
        		break;
			}
      	}
    }
}


function setKey(via,typ,mm,dd,yy,seq,fnm) {
	getElement("E01CUCVIA").value = via;
	getElement("E01CUCTYP").value = typ;
	getElement("E01CUCDTY").value = yy;
	getElement("E01CUCDTM").value = mm;
	getElement("E01CUCDTD").value = dd;
	getElement("E01CUCSEQ").value = seq;
	getElement("E01CUCFNM").value = fnm;
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
%>

<h3 align="center">Cambio Masivo en Clientes - Aprobación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="process_list_ap.jsp, ESD0093"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0093">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
  <INPUT TYPE=HIDDEN NAME="H01SCRCOD" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goProcess()"><b>Aprobar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goReport()"><b>Consultar</b></a>
      	</TD>
      	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%  
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Registros.</h4></div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <table  class="tableinfo" width="100%">
  
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<TD nowrap align="center" width="20%"><B>Via</B></TD>
		<TD nowrap align="center" width="20%"><B>Proceso</B></TD>
		<TD nowrap align="center" width="15%"><B>Fecha</B></TD>
		<TD nowrap align="center" width="10%"><B>Secuencia</B></TD>
		<TD nowrap align="center" width="15%"><B>Nombre <br> Archivo</B></TD>
		<TD nowrap align="center" width="15%"><B>Usuario <br>Operación</B></TD>
	</TR> 
        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
            ESD009301Message msgRcd = (ESD009301Message) msgList.getRecord(); 
		%>              
    <TR id=trclear>
    
		<td NOWRAP align="center" width="5%"> 
            <INPUT type="radio" name="ROW" value="<%= msgList.getCurrentRow() %>" onClick="setKey('<%=msgRcd.getE01CUCVIA()%>','<%= msgRcd.getE01CUCTYP() %>','<%= msgRcd.getE01CUCPMM() %>','<%= msgRcd.getE01CUCPMD() %>','<%= msgRcd.getE01CUCPMY() %>','<%= msgRcd.getE01CUCSEQ() %>','<%= msgRcd.getE01CUCFNM() %>')">
		</td>
		<td NOWRAP align="center" width="20%"><% 
				if(msgRcd.getE01CUCVIA().equals("O"))
					out.print("EN LINEA");
			    else
			    	out.print("ARCHIVO");
			%></td>
		<td NOWRAP align="left" width="20%" ><%if(msgRcd.getE01CUCTYP().equals("O")){
													out.print("MASIVO ASESOR CLIENTE Y PRODUCTO");
												}else if(msgRcd.getE01CUCTYP().equals("S")){
													out.print("MASIVO ASESOR SEGMENTO CLIENTE");
												}else if(msgRcd.getE01CUCTYP().equals("C")){
													out.print("MASIVO ASESOR CLIENTE");
												}else if(msgRcd.getE01CUCTYP().equals("P")){
													out.print("MASIVO ASESOR/OFICINA PRODUCTO");
												}
												%> </td>
		<td NOWRAP align="center" width="15%" ><%= 
		 datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01CUCDTM()),Integer.parseInt(msgRcd.getE01CUCDTD()),Integer.parseInt(msgRcd.getE01CUCDTY()))
		%> </td>
		<td NOWRAP align="left" width="10%" ><%= msgRcd.getE01CUCSEQ()%> </td>
		<td NOWRAP align="center" width="15%" ><%= msgRcd.getE01CUCFNM()%></td>
		<td NOWRAP align="center" width="15%" ><%= msgRcd.getCUSCUSUSR()%></td>
		
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
 
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= msgList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= msgList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
