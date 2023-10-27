<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV116601Message" %>
<%@ page import="com.datapro.constants.EibsFields,java.math.*" %>

<html> 
<head>
<title>Cargos Adicionales</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV116601List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {

    // LN=Prestamos LR=PrestamosRenovaciones BG=Documentarias CP=Credilineas
    var appType = getElement("appType").value;

    if ((op != '200') && (!isValidObject(getElement("key")))) {
        alert("Debe seleccionar un registro.");
        return;
    }
    if ((op == '202') || (op == '300')) {
        if (op == '202') chk = confirm("Desea eliminar el registro seleccionado?");
        if (!chk) return;
        getElement("SCREEN").value = op;
        document.forms[0].submit(); 
    } else {
        var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1166?SCREEN="+op+"&appType="+appType;
        if (op != '200') {
            url += "&key=" + getElementChecked('key').value;
        }
        CenterWindow(url, 880, 400, 2);
    }
    hideMenu();
}

function setRow(table, row, seq, opc) {
	// Selecciona la fila
	highlightRow(table, row);
	// Marca el radio
	var ctrl = document.forms[0].key;
	if (!ctrl) return;
	var ctrlLen = ctrl.length;
	if (ctrlLen == undefined) {
		ctrl.checked = (ctrl.value == row.toString());
	}
	for (var i = 0; i < ctrlLen; i++) {
		ctrl[i].checked = false;
		if (ctrl[i].value == row.toString()) {
			ctrl[i].checked = true;
		}
	}
	// Asigna la secuencia	
	try {
	  document.forms[0].seqNum.value = seq;
	} catch(e){
	}
	// goAction
	if (opc != undefined) {
		goAction(opc);
		if (isValidObject(document.getElementById("menuCU"))) {
		  document.getElementById("menuCU").style.display = 'none';
        }
	}
}

function hideMenu() {
    if (isValidObject(document.getElementById("menuCU"))) {
	    if (document.getElementById("menuCU").style.display == 'none') {
	        document.getElementById("menuCU").style.display = '';
	        resizeIFrame(true);
	    } else {
	        document.getElementById("menuCU").style.display = 'none';
	        resizeIFrame(false);
	    }
    }
}

function showMenu(firstTime) {
	if(isValidObject(document.getElementById("menuCU") && !firstTime)){
		if (document.getElementById("menuCU").style.display == 'none') {
			document.getElementById("menuCU").style.display = '';
			resizeIFrame(true);
		} 
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempcu"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempcu").height = nHeight;
	}	
}
 	
</script>

</head>

<%
  String appType = "";
  if (request.getParameter("appType") != null) {
    // LN=Prestamos LR=PrestamosRenovaciones BG=Documentarias CP=Cupo Rotativo
    appType = request.getParameter("appType");
  }
%>


<body>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>
<%		
	//si es blanco viene llamado por menu, sino viene llamdo desde la una pantalla 
	//Determines if a Header is Shown.
	String emp = (String)session.getAttribute("EMPCU");
	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
%>
<% if ("".equals(emp)){ %>
<h3 align="center">Listado de Condiciones <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cargos_list.jsp,EPV1166"></h3>
<hr size="4">
<% } %>
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1166">
	<input type="hidden" name="SCREEN" id="SCREEN" value="201">
	<input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value="">
	<input type="hidden" name="seqNum" id="seqNum" value="0">
	<input type="hidden" name="appType" id="appType" value="<%=request.getParameter("appType")%>">
     
	<% if ("".equals(emp)){ %>
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr>
						<td nowrap width="10%" align="right"> Cliente : </td>
						<td nowrap width="10%" align="left">
							<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
						</td>
						<td nowrap width="10%" align="right"> Propuesta : </td>
						<td nowrap width="50%"align="left">
							<input type="text" name="Header23" size="13" maxlength="12" value="<%= userPO.getHeader23()%>" readonly>
						</td>
				 </tr>
				</table>
			</td>
		</tr>
	</table>
	<table class="tbenter" width="100%">
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%" style="display: <%= (EPV116601List.isEmpty()) ? "none": "" %>"><a href="javascript:goAction('202')"> <b>Borrar</b></a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
		</tr>
	</table>
	<% } else if ("A".equals(emp)){ %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<h4>Condiciones</h4>
	<% } else { %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<a href="#" onclick="hideMenu();"><b>Condiciones </b></a>
	<br><br>
	<table id="menuCU" class="tbenter" width="100%">
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('202')"> <b>Borrar</b></a></td> 
		</tr>
	</table>
	<% } %>  

	<table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="2%">&nbsp;</th>
						<!-- <th align="center" nowrap width="3%">Sec</th>	 -->					
						<th align="center" nowrap width="8%">Banco</th>
						<th align="center" nowrap width="10%">Moneda</th>
						<th align="center" nowrap width="20%">Condicion</th>
						<th align="center" nowrap width="10%">Producto</th>
						<th align="center" nowrap width="30%">Descripcion</th>
						<th align="center" nowrap width="10%">Destino</th>
						<th align="center" nowrap width="10%">Revolvente</th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:80px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<% 
					   EPV116601List.initRow();
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (EPV116601List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					   EPV116601Message convObj = (EPV116601Message) EPV116601List.getRecord();
					%>
						<tr id="dataTable<%= EPV116601List.getCurrentRow() %>">
							<td nowrap align="center" width="02%"><input type="radio" id="key" name="key" value="<%=EPV116601List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu(false);setRow('dataTable',<%=EPV116601List.getCurrentRow()%>,<%=convObj.getE01TYPSEQ()%>)"/></td>
							<td nowrap align="center" width="08%"><a href="javascript:setRow('dataTable',<%=EPV116601List.getCurrentRow()%>,<%=convObj.getE01TYPSEQ()%>,'203')"><%=convObj.getE01TYPBNK()%></a></td>
							<td nowrap align="center" width="10%"><a href="javascript:setRow('dataTable',<%=EPV116601List.getCurrentRow()%>,<%=convObj.getE01TYPSEQ()%>,'203')"><%=convObj.getE01TYPCCY()%></a></td>
							<td nowrap align="center" width="20%">
								<a href="javascript:setRow('dataTable',<%=EPV116601List.getCurrentRow()%>,<%=convObj.getE01TYPSEQ()%>,'203')">
								<% if (convObj.getE01TYPAPC().equals("1")) { out.print("AVANCES");
									 } else if (convObj.getE01TYPAPC().equals("2")) { out.print("COMPRAS");
									 } else if (convObj.getE01TYPAPC().equals("3")) { out.print("TRANSFERENCIAS");
									 } else {out.print("OTROS");}
							%>
								</a>
							</td>
							<td nowrap align="center" width="10%"><a href="javascript:setRow('dataTable',<%=EPV116601List.getCurrentRow()%>,<%=convObj.getE01TYPSEQ()%>,'203')"><%=convObj.getE01TYPPRO()%></a></td>
							<td nowrap align="center" width="30%"><a href="javascript:setRow('dataTable',<%=EPV116601List.getCurrentRow()%>,<%=convObj.getE01TYPSEQ()%>,'203')"><%=convObj.getE01TYPNAR()%></a></td>
							<td nowrap align="center" width="10%"><a href="javascript:setRow('dataTable',<%=EPV116601List.getCurrentRow()%>,<%=convObj.getE01TYPSEQ()%>,'203')"><%=convObj.getE01TYPDST()%></a></td>
							<td nowrap align="center" width="10%"><a href="javascript:setRow('dataTable',<%=EPV116601List.getCurrentRow()%>,<%=convObj.getE01TYPSEQ()%>,'203')"><%=convObj.getE01TYPREV()%></a></td>
						</tr>
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>

	
	
</form>

<% if (!EPV116601List.getNoResult()) { %>
<SCRIPT type="text/javascript">
	showChecked("key");  
</SCRIPT>
<% } %>

<%-- Server sends "S" in "ACT" to signify change in iframe section. 
	 Frame calls to upate Distribution in parent.
	 *Note only Values paid through "Desembolso are reflected.
 --%>
<% if ("S".equals(request.getAttribute("ACT"))){ %>
<SCRIPT type="text/javascript">
  //Totales
</SCRIPT>
<% } %>  

<SCRIPT type="text/javascript">
<%-- CSS of Iframe. Adjusts Height of frame. --%>
    if (isValidObject(document.getElementById("menuCU"))) {
        document.getElementById("menuCU").style.display = 'none';
    }
	if (isValidObject(parent.document.getElementById("ifrempcu"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempcu").height;
	}
</SCRIPT>   
  
</body>
</html>
