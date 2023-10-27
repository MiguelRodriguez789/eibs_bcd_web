<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EUT011002Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Tablas de Opciones de Menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

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
	
	clickElement("key1", row);

	document.forms[0].SCREEN.value = op;
    
    if (op == '13') {
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

function getParams(bnk,acd,tar) {

    document.forms[0].BANK.value = bnk;
	document.forms[0].ACD.value = acd;
	document.forms[0].TABLEN.value = tar;
    
}

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

<h3 align="center">Tabla de Opciones
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="eibs_menu_option_list.jsp,EUT0110"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0110">
<input type="hidden" id="SCREEN" name="SCREEN" value="12"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Numero de Opcion :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E02CMIDEN" name="E02CMIDEN" size="5" maxlength="3"  onKeypress="enterInteger(event)" >
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('11')">
        </td>
      </tr>
    </table>
  </div>
  
  <table  class="tableinfo" height="10%">
    <tr bordercolor="#FFFFFF">   
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="10%" align="right"> Menu : 
              </td>
             <td nowrap width="10%" align="left">
                <input type="text" id="menu" name="menu" size="8" maxlength="3" value="<%= userPO.getHeader10().trim()%>" readonly>
             </td>
             <td nowrap width="10%" align="right"> Descripcion : 
               </td>
             <td nowrap width="70%"align="left">
                <input type="text" id="descri" name="descri" size="45" maxlength="40" value="<%= userPO.getHeader11().trim()%>" readonly>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
<table class="tbenter" width="100%" height="10%">
	<tr>
		<% 	if (userPO.getOption().trim().equals("Y") ){ %>
		<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
		<% } %>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('12')"> <b>Modificar</b> </a></td>
		<% 	if (userPO.getOption().trim().equals("Y") ){ %>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('13')"> <b>Borrar</b> </a></td>
		<% } %>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('200')"> <b>Menu</b> </a></td>	
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

  <table  id=cfTable class="tableinfo sortable" style="height:360px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="20%">Codigo</th>
				<th align="left" nowrap width="45%">Descripci&oacute;n</th>
				<th align="left" nowrap width="30%">Tipo</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">       
		       <div id="dataDiv1"  style="height:360px; overflow:auto;"> 
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
					EUT011002Message menu = (EUT011002Message) msglst.getRecord();
		%>
		<tr id="dataTable<%= msglst.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="key1"	value="<%=msglst.getCurrentRow()%>" <%=chk%> class="highlight"  onClick="highlightRow('dataTable', <%= msglst.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('12',<%=msglst.getCurrentRow()%>);"><%=menu.getE02CMIDEN()%></a></td>
			<td nowrap align="left" width="45%"><a href="javascript:goAction('12',<%=msglst.getCurrentRow()%>);"><%=menu.getE02CMENDS()%></a></td>
			<td nowrap align="left" width="30%"><a href="javascript:goAction('12',<%=msglst.getCurrentRow()%>);">
				<% if (menu.getE02CMIMFL().equals("I")) out.print("Consulta");
    	           if (menu.getE02CMIMFL().equals("M")) out.print("Mantenimiento");
    	           if (menu.getE02CMIMFL().equals("N")) out.print("Creación");
    	           if (menu.getE02CMIMFL().equals("A")) out.print("Aprobación");
    	           if (menu.getE02CMIMFL().equals("R")) out.print("Reporte");
    	           if (menu.getE02CMIMFL().equals("P")) out.print("Proceso");
    	           if (menu.getE02CMIMFL().equals("D")) out.print("Administración");
    	        %>    
				</a>
			</td>
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
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.tools.JSEUT0110?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> 
	</TD>
 	<TD WIDTH="50%" ALIGN=RIGHT>
<%       
        if ( msglst.getShowNext() ) {
      			int pos = msglst.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.tools.JSEUT0110?SCREEN=200&Pos=" + pos +"\"><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
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
	showChecked("key1");
 	getElement("hiddenDivNew").onclick=cancelBub;
 	if (isValidObject(document.getElementById("eibsNew")))
		getElement("eibsNew").onclick=showHiddenDivNew;  
</SCRIPT>
</body>
</html>

