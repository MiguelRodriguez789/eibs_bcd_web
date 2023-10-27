<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EUT011501Message" %>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Tablas de Opciones de la Paginas e-IBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="msglst" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/sortTables.js"> </SCRIPT>

<script type="text/javascript">

  function goAction(op,row) {
	var ok = false;
	var cun = "";
	var pg = "";
	
	clickElement("key", row);

	getElement("SCREEN").value = op;
    
    if (op == '3') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
		document.forms[0].submit();		
	}		
}

function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

addEventHandler(document, 'click' , closeHiddenDivNew);


</SCRIPT>  

</head>

<body>
<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Tabla de Opciones de las Paginas
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="eibs_paginas_list.jsp,EUT0115"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0115">
<input type="hidden" id="SCREEN" name="SCREEN" value="2"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Nuevo Opcion :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01MOIDEN" name="E01MOIDEN" size="5" maxlength="6">
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('1')">
        </td>
      </tr>
    </table>
  </div>
  
  
<table class="tbenter" width="100%" height="10%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('2')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('8')"> <b>Opciones</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('3')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<%
	if (msglst.getNoResult()) {
%>
<table class="tbenter" width=100% height=80%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%>

  <table  id=cfTable class="tableinfo sortable" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="20%">
						Opcion
				</th>
				<th align="left" nowrap width="55%">
						Descripci&oacute;n
				</th>
				<th align="left" nowrap width="20%">
						Codigo Interno
				</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">       
		       <div id="dataDiv1"  style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			msglst.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (msglst.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EUT011501Message menu = (EUT011501Message) msglst.getRecord();
		%>
		<tr id="dataTable<%= msglst.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="key" name="key"	value="<%=msglst.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= msglst.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('8',<%= msglst.getCurrentRow()%>);"><%=menu.getE01MOIDEN()%></a></td>
			<td nowrap align="left" width="54%"><a href="javascript:goAction('8',<%= msglst.getCurrentRow()%>);"><%=menu.getE01MOENDS()%></a></td>
			<td nowrap align="left" width="20%"><a href="javascript:goAction('8',<%= msglst.getCurrentRow()%>);"><%=menu.getE01MOCODE()%></a></td>
		</tr>
		<%
			}
		%>
             </table>
             </div>
             </td>
             </tr>
</table>

  <TABLE class="tbenter" WIDTH="90%" ALIGN=CENTER height="10%">
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
<%
        if ( msglst.getShowPrev() ) {
 			int pos = msglst.getFirstRec() - 51;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.tools.JSEUT0115?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( msglst.getShowNext() ) {
      			int pos = msglst.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.tools.JSEUT0115?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
        }
%> 
 	</TD>
	 </TR>
	 </TABLE>
<%
	}
%>
</form>
<SCRIPT type="text/javascript">
	showChecked("key");
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

