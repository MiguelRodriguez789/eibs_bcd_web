<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Officer Change Processing</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ESD0093List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
var ok = false;

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un proceso!!!");
		return;	 
	}
	if (getElement("E01CUCVIA").value == 'F') {
		if (getElement("E01CUCFNM").value == '') {
			alert("Favor Digitar Nombre de Archivo!!!");
		return;
		}
	}
	document.forms[0].SCREEN.value="7";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el proceso a borrar!!!");
		return;	 
	}
	if (getElement("E01CUCVIA").value == 'F') {
		if (getElement("E01CUCFNM").value == '') {
			alert("Favor Digitar Nombre de Archivo!!!");
		return;
		}
	}
	document.forms[0].SCREEN.value="4";
	if (!confirm("Desea borrar el proceso seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
        		break;
			}
      	}
    }

}

function setKey(via,yy,mm,dd,seq) {
	getElement("E01CUCVIA").value = via;
	getElement("E01CUCDTY").value = yy;
	getElement("E01CUCDTM").value = mm;
	getElement("E01CUCDTD").value = dd;
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

<h3 align="center">Proceso de Archivos de 
	<%if(userPO.getOption().equals("T")) 
		out.print("Masivo Asesor y Segmento");
	  else if(userPO.getOption().equals("C"))
	    out.print("Masivo Asesor Clientes");
	  else out.print("Masivo Asesor/Oficina Productos");  
		%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="process_list.jsp, ESD0093"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0093">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="7">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01CUCVIA" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01CUCDTY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01CUCDTM" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01CUCDTD" VALUE="">
  
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goProcess()"><b>Procesar</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

  <TABLE class="tableinfo" id="dataTable"> 
    <TR id=trdark> 
    	<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>VIA</B></td>
		<td NOWRAP align="center" width="10%"><B>Fecha</B></td>
		<td NOWRAP align="center" width="10%"><B>Secuencia</B></td>
		<td NOWRAP align="center" width="65%"><B>Descripción o Nombre de Archivo</B></td>
	</TR>
        <%
    	  int i = 0;
          ESD0093List.initRow();    
          while (ESD0093List.getNextRow()) {
            ESD009301Message msgList = (ESD009301Message) ESD0093List.getRecord(); 
		%>              
    <TR id=trclear>

		<td NOWRAP align="center" width="5%"> 
            <input type="radio" id="CODE" name="CODE" value="<%=ESD0093List.getCurrentRow()%>" class="highlight" 
				onClick="setKey('<%=msgList.getE01CUCVIA()%>',
								'<%=msgList.getE01CUCDTY()%>',
								'<%=msgList.getE01CUCDTM()%>',
								'<%=msgList.getE01CUCDTD()%>');"/>
		</td>

		<td NOWRAP align="center" width="10%" >
			<% if (msgList.getE01CUCVIA().equals("O")) out.print("EN LINEA") ;
			    else out.print("ARCHIVO");
			%>
		</td>
		<td NOWRAP align="center" width="10%" > <%= Util.formatCustomDate(currUser.getE01DTF(),
															msgList.getBigDecimalE01CUCDTM().intValue(),
															msgList.getBigDecimalE01CUCDTD().intValue(),
															msgList.getBigDecimalE01CUCDTY().intValue()) 
													%>
		</td>
		<% if (msgList.getE01CUCVIA().equals("O")) { %>	
			<td NOWRAP align="center" width="10%" ><%= msgList.getE01CUCSEQ() %></td>	
		<% } else { %>
			<td nowrap align="center" width="10%" >
				<eibsinput:text name="msgList" property="E01CUCSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="9" required="true" readonly="false"/>
			</td>
		<% } %>		
		<% if (msgList.getE01CUCVIA().equals("O")) { %>																	
			<td NOWRAP align="left" width="65%" ><%= msgList.getE01CUCFNM() %></td>
		<% } else { %>
			<td nowrap align="left" width="65%" >
				<%= msgList.getD01NA1() %>
				<eibsinput:text name="msgList" property="E01CUCFNM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT %>" size="62" maxlength="60" required="true" readonly="false"/>
			</td>
		<% } %>																		
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
		int screen = 6;
		if ( ESD0093List.getShowPrev() ) {
  			int pos = ESD0093List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0093?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (ESD0093List.getShowNext()) {
  			int pos = ESD0093List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0093?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD0093List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD0093List.getFirstRec()%>;
</SCRIPT>
</form>
</body>
</html>
