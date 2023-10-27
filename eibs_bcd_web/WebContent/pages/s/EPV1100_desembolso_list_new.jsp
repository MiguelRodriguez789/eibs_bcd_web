<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV110002Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Desembolso</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV1100List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op ,seq, org) {
	
	var productCode = getElement('prdCode').value;
	if(org == "R"){
		dir = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1110?SCREEN=301&cusNum="+document.forms[0].cusNum.value+"&PorfNum="+document.forms[0].PorfNum.value+ "&E01PRLSEQ=" + seq + "&ACT=N&appType=LN";
	}else if (org == "I"){
		dir = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=" +op+"&cusNum="+document.forms[0].cusNum.value+"&PorfNum="+document.forms[0].PorfNum.value+ "&E01PSGSEQ=" + seq + "&ACT=N&appType=LN";
	}else if (org == "C"){
		dir = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=" +op+"&cusNum="+document.forms[0].cusNum.value+"&PorfNum="+document.forms[0].PorfNum.value+ "&E01PVHSEQ=" + seq + "&ACT=N&appType=LN";
	}else if (org == "D"){
		dir = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=301&cusNum="+document.forms[0].cusNum.value+"&PorfNum="+document.forms[0].PorfNum.value+ "&E01PVBSEQ=" + seq + "&ACT=S";
	}else if (org == "O"){
		dir = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1120?SCREEN=301&cusNum="+document.forms[0].cusNum.value+"&PorfNum="+document.forms[0].PorfNum.value+ "&E01ORLSEQ=" + seq + "&ACT=S";
	} else {
		dir = "<%=request.getContextPath()%>/pages/s/MISC_under_construction.jsp";
	}
	
	CenterWindow(dir,1000,500,2);
}

function updateTotal(nSuma, sumaGrav) {  
  try {
		if (isValidObject(parent.document.forms[0].DSTOT)) {
			parent.document.forms[0].DSTOT.value = formatCCY(nSuma);
			parent.document.forms[0].DSGMF.value = formatCCY(sumaGrav);
			parent.updateDist("DS");
		}	
		
  } catch(e) {
    alert("updateTotal: "+e);
  }
}

function hideMenu() {
	if(isValidObject(document.getElementById("menuDS"))){
		if (document.getElementById("menuDS").style.display == 'none') {
			document.getElementById("menuDS").style.display = '';
			resizeIFrame(true);
		} else {
			document.getElementById("menuDS").style.display = 'none';
			resizeIFrame(false);
		}
	}
}

function showMenu(firstTime) {
	if(isValidObject(document.getElementById("menuDS") && !firstTime)){
		if (document.getElementById("menuDS").style.display == 'none') {
			document.getElementById("menuDS").style.display = '';
			resizeIFrame(true);
		} 
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempds"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempds").height = nHeight;
	}	
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
<% 
	String emp = (String)session.getAttribute("EMPDS");
	emp = (emp == null) ? "": emp;	//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV0150
%>

<%if ("".equals(emp)){ %>
<h3 align="center">Lista de Desembolso<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="desembolso_list_new.jsp,EPV1100"></h3>
<hr size="4">
<%}%>
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100">
<input type="hidden" name="SCREEN" id="SCREEN" value="300">
<input type="hidden" name="prdCode" id="prdCode" value="<%=request.getAttribute("prdCode")%>">  
<input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value="">  

<%if ("".equals(emp)){ %>
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
							<input type="text" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
						</td>
					</tr>
				</table>
			</td>
    </tr>
	</table>
	<table class="tbenter" style="width: 100%">
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
			<td align="center" class="tdbkg" width="20%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
		</tr>
 	</table>
<% }else if ("A".equals(emp)){%>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<h4>Desembolso</h4>
<% }else{ %>
	<input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
	<input type="hidden" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>

	<a href="#" onclick="hideMenu();"><b>Desembolso</b></a>
	<br><br>
	<table id="menuDS" class="tbenter" width="100%" >
		<tr>
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('200')"> <b>Crear</b> </a></td> 
			<td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="20%" id="timbrec" style="display: none;"><a href="javascript:goAction('201')"> <b>Timbre Cupón</b> </a></td>
			<td align="center" class="tdbkg" width="20%" style="display: <%= (EPV1100List.isEmpty()) ? "none": "" %> "><a href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
		</tr>
	</table>
	
<%}%>  

	<table id="mainTable" class="tableinfo" style="height:75px;">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="center" nowrap width="30%">Descripci&oacute;n</th>						
						<th align="center" nowrap width="20%">Monto</th>
						<th align="center" nowrap width="20%">IVA</th>
						<th align="center" nowrap width="30%">Total</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:75px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
				<%
						double suma = 0;
						double sumb = 0;
						double sumc = 0;
						EPV1100List.initRow();
						boolean firstTime = true;
						String chk = "";
						while (EPV1100List.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
							EPV110002Message des = (EPV110002Message) EPV1100List.getRecord();
							suma += des.getBigDecimalE02DSBAMT().doubleValue();
							sumb += des.getBigDecimalE02DSBIVA().doubleValue();
							sumc += des.getBigDecimalE02DSBTOT().doubleValue();
				%>
						<tr id="dataTable<%= EPV1100List.getCurrentRow() %>">
							<td nowrap align="left" width="30%"><a href="javascript:goAction('203','<%= des.getE02DSBSEQ()%>','<%=des.getE02DSBORG()%>');" onclick="hideMenu();"><%=des.getE02DSBDSC()%></a></td>
							<td nowrap align="right" width="20%"><a href="javascript:goAction('203','<%= des.getE02DSBSEQ()%>','<%=des.getE02DSBORG()%>');" onclick="hideMenu();"><%=des.getE02DSBAMT()%></a></td>
							<td nowrap align="right" width="20%"><a href="javascript:goAction('203','<%= des.getE02DSBSEQ()%>','<%=des.getE02DSBORG()%>');" onclick="hideMenu();"><%=des.getE02DSBIVA()%></a></td>
							<td nowrap align="right" width="30%"><a href="javascript:goAction('203','<%= des.getE02DSBSEQ()%>','<%=des.getE02DSBORG()%>');" onclick="hideMenu();"><%=des.getE02DSBTOT()%></a></td>
						</tr>
				<%  }  %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
		<tr bgcolor="#FFFFFF">
			<td nowrap width="20%">&nbsp;</td>
			<td nowrap align="right" width="10%"><b>TOTAL : </b> </td>
			<td nowrap align="right" width="20%"><b><%=datapro.eibs.master.Util.formatCCY(suma)%></b></td>
			<td nowrap align="right" width="20%"><b><%=datapro.eibs.master.Util.formatCCY(sumb)%></b></td>
			<td nowrap align="right" width="30%"><b><%=datapro.eibs.master.Util.formatCCY(sumc)%></b></td>
		</tr>								
	</table>
</form>

<% if ("S".equals(request.getAttribute("ACT"))){ %>
<SCRIPT type="text/javascript">
	updateTotal(<%=suma%>"), <%=sumb%>"));
</SCRIPT>
<% } %>

<SCRIPT type="text/javascript">
	showChecked("keys");
	if (isValidObject(document.getElementById("menuDS")))  {
		document.getElementById("menuDS").style.display = 'none';
	}
	if (isValidObject(parent.document.getElementById("ifrempds"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempds").height;
	}	
	if (isValidObject(parent.document.getElementById("E01DEACLF"))) {
		if (parent.document.getElementById("E01DEACLF").value == 'S') {
			getElement("timbrec").style.display = 'block';
		}
	}	
</SCRIPT>

</body>
