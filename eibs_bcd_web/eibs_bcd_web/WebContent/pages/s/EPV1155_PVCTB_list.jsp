<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV115501Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Plataforma de Venta</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="EPV115501List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";

	document.forms[0].SCREEN.value = op;
	if (op != '200') {	//Checks something is selected
		document.getElementById("E01PVBIDN").value = getElementChecked("NUMIDE").value;
    }
      
  	if (op == '202') {
    	if (confirm("Desea Eliminar este Registro Seleccionado?")) {
			document.forms[0].submit();		
      	}
	} else {
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

addEventHandler(document, 'click', closeHiddenDivNew);

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

<h3 align="center">Beneficiarios Cheques a Terceros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="PVCTB_list.jsp,EPV1155"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1155">
<input type="hidden" name="SCREEN" value="201"> 

<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark"> 
        <td align=CENTER width="18%"> 
          <div align="right">Identificacion :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <input type="text" id="E01PVBIDN" name="E01PVBIDN" size="25" maxlength="25">
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
 
<table class="tbenter" width="100%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<%
	if (EPV115501List.getNoResult()) {
%>
<table class="tbenter" width=100% height=90%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de b�squeda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%>

  <table  id=cfTable class="tableinfo" height="70%">
    <tr height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
	<table id="headTable" width="98%">
		<tr id="trdark">
			<th align="center" nowrap width="10%">&nbsp;</th>
			<th align="center" nowrap width="30%">Identificacion</th>
			<th align="left" nowrap width="60%">Nombre</th>
		</tr>
        </table>
      </td>
    </tr>    
		  <tr height="95%">    
		    <td>       
		       <div id="dataDiv1" style="width:100%; height:100%; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			EPV115501List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (EPV115501List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EPV115501Message pvctb = (EPV115501Message) EPV115501List
							.getRecord();
		%>
		<tr id="dataTable<%= EPV115501List.getCurrentRow() %>">
			<td nowrap align="center" width="10%"><input type="radio" name="NUMIDE"	value="<%=pvctb.getE01PVBIDN()%>" <%=chk%> onClick="highlightRow('dataTable', <%= EPV115501List.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="30%"><a href="javascript:goAction('203');"><%=Util.formatCell(pvctb.getE01PVBIDN())%></a></td>
			<td nowrap align="left" width="60%"><a href="javascript:goAction('203');"><%=pvctb.getE01PVBNME()%></a></td>
		</tr>
		<%
			}
		%>
        </table>
        </div>
        </td>
        </tr>
	</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (EPV115501List.getShowPrev()) {
					int pos = EPV115501List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSEPV1155?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (EPV115501List.getShowNext()) {
					int pos = EPV115501List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSEPV1155?SCREEN=100&codNum="
									+ request.getAttribute("codNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>
<%
	}
%>
</form>
<SCRIPT type="text/javascript">
	showChecked("NUMIDE");
 	document.getElementById("hiddenDivNew").onclick=cancelBub;
	document.getElementById("eibsNew").onclick=showHiddenDivNew;  
	function resizeDoc() {
	 	divResize();
	    adjustEquTables(document.getElementById('headTable'), document.getElementById('dataTable'), document.getElementById('dataDiv1'), 1, false);
	}
	resizeDoc();   			
	window.onresize=resizeDoc;        
</SCRIPT>
</body>
</html>

