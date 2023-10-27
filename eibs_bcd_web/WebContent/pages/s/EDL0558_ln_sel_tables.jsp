<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="datapro.eibs.master.Util,datapro.eibs.beans.EDL055801Message"%>

<html>
<head>
<title>Tabla Monitoreo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="EDL0558Help" class="datapro.eibs.beans.JBObjList" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>

<script language="JavaScript">

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

document.onclick= closeHiddenDivNew;

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == '104') {
		if (confirm("Desea eliminar este registro seleccionado?")) {
			//enableDeleteAuthorization( ) ;
			document.forms[0].submit();
		}
	} else {
		document.forms[0].submit();    
	}
}

</SCRIPT>  

</head>

<BODY>

<% 
 if (!error.getERRNUM().equals("0")) {
		 error.setERRNUM("0");
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
 }
%>

<h3 align="center">Tabla de Monitoreo
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_sel_tables.jsp, EDL0558"></h3>
<hr size="4">

<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0558" >
	<input type=HIDDEN name="SCREEN" id="SCREEN" value="2">
	<input type="HIDDEN" name="H01FLGMAS"  >
		
	<div id="hiddenDivNew" class="hiddenDiv">
		<%int row = 0; %>
		<table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
			border-color: #0b23b5;
			border-style : solid solid solid solid;
			filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
				<td align=CENTER width="18%"> 
					<div align="right">Condici&oacute;n :</div>
				</td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<select name="E01MNPCON">
							<option value="C" selected >Consumo </OPTION>
							<option value="L" >Comercial </OPTION>
							<option value="H" >Vivienda </OPTION>
							<option value="M" >Microcredito </OPTION>
						</select>
					</div>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
				<td align=center nowrap colspan="2"> 
					<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(102)">
				</td>
			</tr>
		</table>
	</div>

	<% if ( EDL0558Help.getNoResult() ) { %>
	<p>&nbsp;</p>
	<table class="tbenter" width="100%" >
		<tr>
			<td> 
				<div align="center"> 
					<p><b>No hay resultados para su b&uacute;squeda</b></p>
					<table class="tbenter" width=100% align=center>
						<tr>
							<td class=TDBKG>
								<div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
							</td>
							<td class=TDBKG>
								<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<% } else { %>
	<p>&nbsp;</p>
	<table class="tbenter" width=100% align=center>
		<tr>
			<% if("1".equals(currUser.getH01WK1())){ %>
			<td class=TDBKG width="25%"> 
				<div align="center"><a href="javascript:goAction(103)"><b>Consultar</b></a></div>
			</td>     
			<% } else { %>
			<td class=TDBKG width="25%"> 
				<div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div>
			</td>
			<td class=TDBKG width="25%"> 
				<div align="center"><a href="javascript:goAction(103)"><b>Modificar</b></a></div>
			</td>
			<td class=TDBKG width="25%"> 
				<div align="center"><a id="EIBSBTNDEL" href="javascript:goAction(104);" ><b>Borrar</b></a></div>
			</td>
			<% } %>
			<td class=TDBKG width="25%"> 
				<div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
			</td>      
		</tr>
	</table>
	 
	<br>
	<table id="mainTable" class="tableinfo" style="height:400px;">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align=CENTER nowrap width="5%">&nbsp;</th>
						<th align=CENTER nowrap width="20%">Condici&oacute;n</th>
						<th align=CENTER nowrap width="25%">Validar Modificaci&oacute;n</th>
						<th align=CENTER nowrap width="25%">Monitorear Modificaci&oacute;n</th>
						<th align=CENTER nowrap width="25%">Monitorear Reestructuraci&oacute;n</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr  height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:400px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
						 EDL0558Help.initRow();
						 boolean firstTime = true;
						 String chk = "";
						 while (EDL0558Help.getNextRow()) {
							 if (firstTime) {
								 firstTime = false;
								 chk = "checked";
							 } else {
								 chk = "";
							 }  
							 EDL055801Message list = (EDL055801Message) EDL0558Help.getRecord();
					%>
						<tr id="dataTable<%=EDL0558Help.getCurrentRow()%>">
							<td nowrap align="center" width="5%"> <input type="radio" name="key" value="<%=EDL0558Help.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%=EDL0558Help.getCurrentRow()%>)" /></td>
							 <td nowrap align="center" width="20%"><% if (list.getField("E01MNPCON").getString().equals("C")) {
												out.print(Util.formatCell("Consumo"));
											} else if (list.getField("E01MNPCON").getString().equals("L")) {
												out.print(Util.formatCell("Comercial"));
											} else if (list.getField("E01MNPCON").getString().equals("H")) {
												out.print(Util.formatCell("Vivienda"));
											} else if (list.getField("E01MNPCON").getString().equals("M")) {
												out.print(Util.formatCell("Microcredito"));
											} else  {out.print(Util.formatCell("Consumo"));
											}%></td>
							<td nowrap align="center" width="25%"><%=list.getE01MNPMDT()%> / <%=list.getE01MNPMDD()%></td>
							<td nowrap align="center" width="25%"><%=list.getE01MNPMDC()%> / <%=list.getE01MNPMDM()%></td>
							<td nowrap align="center" width="25%"><%=list.getE01MNPREC()%> / <%=list.getE01MNPREM()%></td>
						</tr>
					<%
						 }
					%>
					</table>
				</div>
			</td>
		</tr>
	</table>

	<% } %>

<SCRIPT language="JavaScript">
	showChecked("key");
	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=showHiddenDivNew;
</SCRIPT>

</form>
</body>
</html>
