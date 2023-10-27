<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV116501Message" %>
<%@ page import="com.datapro.constants.EibsFields,java.math.*" %>

<html> 
<head>
<title>Cargos Adicionales</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV116501List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

function goAction(op) {

    var appType = getElement("appType").value;
    // LN = Prestamos
    // LR = Prestamos Renovaciones
    // BG = Documentarias (Boletas de Garantia)
    // CP = Credilineas

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
        var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN="+op+"&appType="+appType;
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
		if (isValidObject(document.getElementById("menuCA"))) {
		  document.getElementById("menuCA").style.display = 'none';
        }
	}
}

function updateTotal(tax, com, ded, iva, othrCrg) {
  try {
	<%--Update Values in Distribution Section, Argument Notifies that 
		Cargos Addicionals called the function.
	  --%>	
		if (isValidObject(parent.document.forms[0].CAIMP)) {
			parent.document.forms[0].CAIMP.value = formatCCY(tax);
			parent.document.forms[0].CACOM.value = formatCCY(com);
			parent.document.forms[0].CADED.value = formatCCY(ded);
			parent.document.forms[0].CAIVA.value = formatCCY(iva);
			parent.document.forms[0].CAOTH.value = formatCCY(othrCrg);
			parent.updateDist("CA");
		}
  } catch(e) {
     scriptLog("updateTotal: "+ e, false);
  }
}

function hideMenu() {
    if (isValidObject(document.getElementById("menuCA"))) {
	    if (document.getElementById("menuCA").style.display == 'none') {
	        document.getElementById("menuCA").style.display = '';
	        resizeIFrame(true);
	    } else {
	        document.getElementById("menuCA").style.display = 'none';
	        resizeIFrame(false);
	    }
    }
}

function showMenu(firstTime) {
	if(isValidObject(document.getElementById("menuCA") && !firstTime)){
		if (document.getElementById("menuCA").style.display == 'none') {
			document.getElementById("menuCA").style.display = '';
			resizeIFrame(true);
		} 
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempca"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempca").height = nHeight;
	}	
}
 	
</script>

</head>

<%
  String appType = "";
  
  if (request.getParameter("appType") != null) {
    appType = request.getParameter("appType");
    // LN = Prestamos
    // LR = Prestamos Renovaciones
    // BG = Documentarias
    // CP = Credilineas
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
	String emp = (String)session.getAttribute("EMPCA");
	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
%>
<% if ("".equals(emp)){ %>
<h3 align="center">Listado de Cargos Adicionales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="cargos_list.jsp,EPV1165"></h3>
<hr size="4">
<% } %>
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165">
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
			<td align="center" class="tdbkg" width="20%" style="display: <%= (EPV116501List.isEmpty()) ? "none": "" %>"><a href="javascript:goAction('202')"> <b>Borrar</b></a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
		</tr>
	</table>
	<% } else if ("A".equals(emp)){ %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<h4>Cargos Adicionales</h4>
	<% } else { %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<a href="#" onclick="hideMenu();"><b>Cargos Adicionales</b></a>
	<br><br>
	<table id="menuCA" class="tbenter" width="100%">
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
						<th align="center" nowrap width="8%">Tipo</th>
						<th align="center" nowrap width="10%">Forma Pago</th>
						<th align="center" nowrap width="10%">Codigo</th>
						<th align="center" nowrap width="25%">Descripcion</th>
						<th align="center" nowrap width="10%">Monto</th>
						<th align="center" nowrap width="10%">IVA</th>
					<% if (!appType.equals("BG") && currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("COL"))) { %>
						<th align="center" nowrap width="10%">GMF</th>
				    <% } %>
						<th align="center" nowrap width="10%">Equivalente (${userPO.currency})</th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:80px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<% 
					   double sumAmt = 0; double sumIvl = 0; double sumGml = 0; double sumTot = 0;
					   double sumTax = 0; double sumCom = 0; double sumDed = 0; double sumIva = 0;
					   double sumOthrCrg = 0;
					   EPV116501List.initRow();
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (EPV116501List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					   EPV116501Message convObj = (EPV116501Message) EPV116501List.getRecord();
					   sumAmt += convObj.getBigDecimalE01PVHAMT().doubleValue();
					   sumIvl += convObj.getBigDecimalE01PVHIVL().doubleValue();
					   sumGml += convObj.getBigDecimalE01PVHGML().doubleValue();
					   sumTot += convObj.getBigDecimalE01PVHTOT().doubleValue();
					   
					   // Si FormaPago=Apertura
					   if (convObj.getE01PVHPVI().equals("1") || convObj.getE01PVHPVI().equals("4") || convObj.getE01PVHPVI().equals("5")) {
					     // Si MedioPago=ConDesembolso
					     if (convObj.getE01PVHMPG().equals("D")) {
					       // Suma por TipoCargo
					       if (convObj.getE01PVHAPC().equals("4")) { // IVA 
					         sumCom += convObj.getBigDecimalE01PVHEQV().doubleValue();
					       } else {
					         sumTax += convObj.getE01PVHAPC().equals("1") ? convObj.getBigDecimalE01PVHEQV().doubleValue() : 0;   //Impuestos
					         sumCom += convObj.getE01PVHAPC().equals("2") ? convObj.getBigDecimalE01PVHEQV().doubleValue() : 0;   //Comision
					         sumDed += convObj.getE01PVHAPC().equals("3") ? convObj.getBigDecimalE01PVHEQV().doubleValue() : 0;   //Deduccion
					         sumIva += convObj.getBigDecimalE01PVHIVL().doubleValue();                                            //IVA
					         sumOthrCrg += convObj.getE01PVHAPC().equals("6") || convObj.getE01PVHAPC().equals("7") ?  convObj.getBigDecimalE01PVHEQV().doubleValue() : 0;  //Other Type of Charge
					       }
					     }
					   }
					%>
						<tr id="dataTable<%= EPV116501List.getCurrentRow() %>">
							<td nowrap align="center" width="2%"><input type="radio" id="key" name="key" value="<%=EPV116501List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu(false);setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>)"/></td>
							<%-- <td nowrap align="center" width="3%"><a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')"><%=Util.formatCell(convObj.getE01PVHSEQ())%></a></td> --%>							
							<td nowrap align="center" width="8%">
								<a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')">
								<% if (convObj.getE01PVHAPC().equals("1")) { out.print("IMPUESTO");
									 } else if (convObj.getE01PVHAPC().equals("2")) { out.print("COMISION");
									 } else if (convObj.getE01PVHAPC().equals("3")) { out.print("DEDUCCION");
									 } else if (convObj.getE01PVHAPC().equals("4")) { out.print("I.V.A.");
									 } else {out.print("OTROS");}
							%>
								</a>
							</td>
                            <td nowrap align="center" width="10%">
                                <a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')">
                                    <% if (convObj.getE01PVHPVI().equals("1")) out.print("APERTURA");%>
                                    <% if (convObj.getE01PVHPVI().equals("2")) out.print("EN CUOTAS");%>
                                    <% if (convObj.getE01PVHPVI().equals("3")) out.print("TODAS LAS CUOTAS");%>
                                    <% if (convObj.getE01PVHPVI().equals("4")) out.print("APERTURA Y CUOTAS");%>
                                    <% if (convObj.getE01PVHPVI().equals("5")) out.print("APERTURA PERIODICA");%>
                                </a>
                            </td>
							<td nowrap align="center" width="10%"><a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')"><%=convObj.getE01PVHCDE()%></a></td>
							<td nowrap align="left"   width="25%"><a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')"><%=convObj.getE01PVHNAR()%></a></td>
							<td nowrap align="right"  width="10%"><a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')"><%=convObj.getE01PVHAMT()%></a></td>
							<td nowrap align="right"  width="10%"><a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')"><%=convObj.getE01PVHIVL()%></a></td>
							<% if (!appType.equals("BG") && currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("COL"))) { %>
							<td nowrap align="right"  width="10%"><a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')"><%=convObj.getE01PVHGML()%></a></td>
							<% } %>
							<td nowrap align="right"  width="10%"><a href="javascript:setRow('dataTable',<%=EPV116501List.getCurrentRow()%>,<%=convObj.getE01PVHSEQ()%>,'203')"><%=convObj.getE01PVHEQV()%> </a></td>
						</tr>
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>

	<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
		<tr bgcolor="#FFFFFF">
			<td align="center" nowrap width="2%">&nbsp;</td>
			<td align="center" nowrap width="2%">&nbsp;</td>
			<td align="center" nowrap width="2%">&nbsp;</td>
			<td align="center" nowrap width="8%">&nbsp;</td>
			<td align="center" nowrap width="18%">&nbsp;</td>
			<td align="center" nowrap width="18%">&nbsp;</td>
			<td align="center" nowrap width="10%">&nbsp;</td>
			<td nowrap align="right" width="10%"> </td> 
			<td nowrap align="right" width="10%"><b>TOTAL : </b></td>
			<% if (!appType.equals("BG") && currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("COL"))) { %>
			<td nowrap align="right" width="10%"><b><%=datapro.eibs.master.Util.formatCCY(sumTot)%></b></td>
		<% } else { %>
			<td nowrap align="right" width="10%"></td>
		<% } %>		
			<td nowrap align="right" width="10%"><b><%=datapro.eibs.master.Util.formatCCY(sumCom)%></b></td>
		</tr>
	</table>
	
</form>

<% if (!EPV116501List.getNoResult()) { %>
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
	updateTotal(<%=sumTax%>,<%=sumCom%>,<%=sumDed%>,<%=sumIva%>, <%= sumOthrCrg%>);	   	   
</SCRIPT>
<% } %>  

<SCRIPT type="text/javascript">
<%-- CSS of Iframe. Adjusts Height of frame. --%>
    if (isValidObject(document.getElementById("menuCA"))) {
        document.getElementById("menuCA").style.display = 'none';
    }
	if (isValidObject(parent.document.getElementById("ifrempca"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempca").height;
	}
</SCRIPT>   
  
</body>
</html>
