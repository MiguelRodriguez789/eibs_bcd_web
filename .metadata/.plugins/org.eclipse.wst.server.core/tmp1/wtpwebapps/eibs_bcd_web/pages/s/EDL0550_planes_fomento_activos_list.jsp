<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Tablas de Menu de EIBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EDL055001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	if (op == '400') {
		if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();
		}
	} else {
		if (op =='300'){
			clickElement("key");
		}
		document.forms[0].submit();		
	}
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	var hiddenDivNew = document.getElementById("hiddenDivNew");
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

<h3 align="center">Paquetes de Redescuentos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="planes_fomento_activos_list.jsp,EDL0550">
</h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0550">
<input type="hidden" id="SCREEN" name="SCREEN" value="500"> 

<div id="hiddenDivNew" class="hiddenDiv">
	<table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
		<tr id="trdark"> 
			<td align=CENTER width="100px"> 
				<div align="right">Nuevo Paquete :</div>
			</td>
			<td align=CENTER width="100px"> 
				<div align="left"> 
					<input type="text" id="E01PDSCOD" name="E01PDSCOD" size="5" maxlength="4">
				</div>
			</td>
		</tr>
		<tr id="trclear"> 
			<td align=center nowrap colspan="2"> 
				<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('200')">
			</td>
		</tr>
	</table>
</div>

<table class="tbenter" width="100%" height="10%">
	<tr>
	<% if( "1".equals( currUser.getH01WK1() ) ){ %>
		<td class=TDBKG width="10%"> 
			<div align="center"><a href="javascript:goAction(300)"><b>Consultar</b></a></div>
		</td>     
	<% } else { %>
		<td align="center" id="NewPlan" class="tdbkg" width="10%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="10%"><a	href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="10%"><a	href="javascript:goAction('700')"> <b>Detalle</b> </a></td>
		<td align="center" class="tdbkg" width="10%"><a	href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
	<% } %>
		<td align="center" class="tdbkg" width="10%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<table id="mainTable" class="tableinfo" style="height:340px;" width="100%">
	<tr  height="5%"> 
		<td NOWRAP valign="top" width="100%"> 
			<table id="headTable" width="100%">
				<tr id="trdark">
					<th align="CENTER" nowrap width="2%" > </th>
					<th align="CENTER" nowrap width="8%" >C&oacute;digo </th>
					<th align="CENTER" nowrap width="25%">Descripci&oacute;n</th>
					<th align="CENTER" nowrap width="25%">Entidad</th>			
					<th align="CENTER" nowrap width="10%">Estado</th>			
					<th align="CENTER" nowrap width="15%">Nro. Prestamos </th>
					<th align="CENTER" nowrap width="15%">Monto Paquete</th>
				</tr>
			</table>
		</td>
	</tr>    
	<tr  height="100%">    
		<td nowrap="nowrap">      
			<div id="dataDiv1" style="height:340px; overflow:auto; width:100%"> 
				<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
				<%
				   EDL055001List.initRow();
				   int k = 0;
				   boolean firstTime = true;
				   String chk = "";
				   while (EDL055001List.getNextRow()) {
				     if (firstTime) {
				       firstTime = false;
				       chk = "checked";
				     } else {
				       chk = "";
				     }
				     EDL055001Message list = (EDL055001Message) EDL055001List.getRecord();
				%>
					<tr id="dataTable<%= EDL055001List.getCurrentRow() %>">
						<td nowrap align="center" width="2%" ><input type="radio" id="key" name="key" value="<%=EDL055001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EDL055001List.getCurrentRow() %>)"/></td>
						<td nowrap align="center" width="8%" ><%=Util.formatCell(list.getE01PDSCOD())%></td>
						<td nowrap align="left"   width="25%"><%=Util.formatCell(list.getE01PDSNME())%></td>
						<td nowrap align="left"   width="25%"><%=Util.formatCell(list.getE01CUSNA1())%></td>
						<td nowrap align="center" width="10%"><%=Util.formatCell(list.getE01DSCSTS())%></td>
						<td nowrap align="right"  width="15%"><%=Util.formatCell(list.getE01PDSSEQ())%></td>
						<td nowrap align="right"  width="15%"><%=list.getE01PDSAMA()%></td>
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
		   if ( EDL055001List.getShowPrev() ) {
		     int pos = EDL055001List.getFirstRec() - 51;
		     out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEDL0550?SCREEN=500&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
		   }
		%> 
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT>
			<%       
			   if ( EDL055001List.getShowNext() ) {
			     int pos = EDL055001List.getLastRec();
			     out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSEDL0550?SCREEN=500&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
			   }
			%> 
		</TD>
	</TR>
</TABLE>

</form>
<SCRIPT type="text/javascript">
	showChecked("key");
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("NewPlan").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>
