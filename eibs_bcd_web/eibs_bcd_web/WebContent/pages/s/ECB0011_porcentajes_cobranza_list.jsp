<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECB001101Message"%>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Porcentaje de Cobranza</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ECB001101List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>

<script type="text/javascript">

  function goAction(op, row) {
	var ok = false;
	var cun = "";
	var pg = "";

	getElement("SCREEN").value = op;
    
    if (op == '400') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
  	
  	if(op =='300'){
		clickElement("key", row);
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

addEventHandler(document, 'click', closeHiddenDivNew );


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

<h3 align="center">Porcentaje de Cobranza
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="porcentajes_cobranza_list.jsp,ECB0011"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECB0011">
<input type="hidden" id="SCREEN" name="SCREEN" value="500"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="100px"> 
          <div align="right">Nuevo C&oacute;digo :</div>
        </td>
        <td align=CENTER width="200px"> 
          <div align="left"> 
            <input type="text" id="E01PCZCDE" name="E01PCZCDE" size="5" maxlength="4">
            @GEN = Tabla Generica
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
      <% if( "1".equals( currUser.getH01WK1()) ){ %>
	      <td class=TDBKG width="25%"> 
	        <div align="center"><a href="javascript:goAction('300')"><b>Consultar</b></a></div>
	      </td>     
      <% } else if(!ECB001101List.isEmpty()){ %>
		<td align="center" id="NewPlan" class="tdbkg" width="25%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="25%"><a	href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="25%"><a	href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
      <% } else {%>
		<td align="center" id="NewPlan" class="tdbkg" width="25%"><b>Crear</b></td>
      <% } %>
		<td align="center" class="tdbkg" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>

	</tr>
</table>
<br>
<br>
  <TABLE  id="mainTable" class="tableinfo" style="height:340px;" width="100%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="CENTER" nowrap width="4%"> </th>
				<th align="CENTER" nowrap width="16%">C&oacute;digo </th>
				<th align="LEFT"   nowrap width="40%">Descripci&oacute;n</th>
				<th align="CENTER" nowrap width="40%">Estado </th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="100%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:340px; overflow:auto; width:100%"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			ECB001101List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ECB001101List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECB001101Message list = (ECB001101Message) ECB001101List.getRecord();
		%>
		<tr id="dataTable<%= ECB001101List.getCurrentRow() %>">
			<td nowrap align="center" width="4%"><input type="radio" id="key" name="key" value="<%=ECB001101List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ECB001101List.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width ="16%"><a href="javascript:goAction('300',<%=ECB001101List.getCurrentRow()%>);"><%=Util.formatCell(list.getE01PCZCDE())%></a></td>
			<td nowrap align="LEFT" width="40%"><a href="javascript:goAction('300',<%=ECB001101List.getCurrentRow()%>);"><%=Util.formatCell(list.getE01PCZDSC())%></a></td>
			<td nowrap align="center" width="40%"><a href="javascript:goAction('300',<%=ECB001101List.getCurrentRow()%>);"><%= Util.formatCell(list.getE01PCZSTS().equals("A") ? "ACTIVO" : "INACTIVO")%></a></td>
			
		</tr>
		<%
			}
		%>
             </table>
             </div>
             </td>
             </tr>
</table>

</form>
<SCRIPT type="text/javascript">
	showChecked("key");
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("NewPlan").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

