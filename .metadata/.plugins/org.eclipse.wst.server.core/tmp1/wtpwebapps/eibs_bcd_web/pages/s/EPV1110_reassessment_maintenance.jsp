<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Reliquidaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV111001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();		
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

function setMulti() {
	if (getElement("E01SELPPM").value == "M") {
		showMulti(true,false);
	} else {
		showMulti(false,false);	
	}
}

function showMulti(lMulti,lMove) {
	if (!(document.getElementById("tblMulti") == null) && !(document.getElementById("tblUni") == null)) {
		if (lMulti) {
			document.getElementById("tblMulti").style.display = '';
			document.getElementById("mnuMulti").style.display = '';
			document.getElementById("tblUni").style.display = 'none';
			document.getElementById("mnuUni").style.display = 'none';
		} else {
			document.getElementById("tblMulti").style.display = 'none';
			document.getElementById("mnuMulti").style.display = 'none';
			document.getElementById("tblUni").style.display = '';
			document.getElementById("mnuUni").style.display = '';
		}
		if (lMove) {
			moveMulti(lMulti);
		}
	}
}

function moveMulti(lMulti) {
	if (lMulti) {

		getElement("E01PAGOP1").value = getElement("E01PAGOPC").value;
		getElement("E01PAGGL1").value = getElement("E01PAGOGL").value;
		getElement("E01PAGCO1").value = getElement("E01PAGCON").value;
		getElement("E01PAGBK1").value = getElement("E01PAGOBK").value;
		getElement("E01PAGBR1").value = getElement("E01PAGOBR").value;
		getElement("E01PAGCY1").value = getElement("E01PAGOCY").value;
		getElement("E01PAGAC1").value = getElement("E01PAGOAC").value;

		getElement("E01PAGOPC").value = '';
		getElement("E01PAGOGL").value = '';
		getElement("E01PAGCON").value = '';
		getElement("E01PAGOBK").value = '';
		getElement("E01PAGOBR").value = '0';
		getElement("E01PAGOCY").value = '';
		getElement("E01PAGOAC").value = '0';
		
		getElement("E01SELPPM").value = 'M';
		
	} else {

		getElement("E01PAGOPC").value = getElement("E01PAGOP1").value;
		getElement("E01PAGOGL").value = getElement("E01PAGGL1").value;
		getElement("E01PAGCON").value = getElement("E01PAGCO1").value;
		getElement("E01PAGOBK").value = getElement("E01PAGBK1").value;
		getElement("E01PAGOBR").value = getElement("E01PAGBR1").value;
		getElement("E01PAGOCY").value = getElement("E01PAGCY1").value;
		getElement("E01PAGOAC").value = getElement("E01PAGAC1").value;

		getElement("E01PAGOP1").value = '';
		getElement("E01PAGGL1").value = '';
		getElement("E01PAGCO1").value = '';
		getElement("E01PAGBK1").value = '';
		getElement("E01PAGBR1").value = '0';
		getElement("E01PAGCY1").value = '';
		getElement("E01PAGAC1").value = '0';
		
		getElement("E01SELPPM").value = '';

	}
}

function validateValue(valamt) {
	try {
		valamt = getElement(valamt).value;
		valamt = valamt.replace(/\,/g,'');
		valamt = parseFloat(valamt);
		if (isNaN(valamt)) { 
			valamt = 0.00;
		}
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function fixedValue(valamt) {
	try {
		valamt = Number(valamt.toFixed(2));
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function validateConcepto(concept, valpercent){
	var apgvalue; var xcnvalue; var relvalue; 
	apgvalue = parseFloat(validateValue("E01PRLS" + concept), 10);
	xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
	relvalue = fixedValue(apgvalue - xcnvalue);
	getElement("E01PRLC" + concept).value = formatCCY(String(xcnvalue));
	getElement("E01PRLR" + concept).value = formatCCY(String(relvalue));
}

function calculateConcepto(concept, field){
	var refnac;	var valors;	var valorc;	var valorp;	var valord;	var valorr;	var valchg; 
	refnac = getElement("E01FLGREF").value;
	valors = validateValue("E01PRLS" + concept);  // Saldo
	valorc = validateValue("E01PRLC" + concept);  // Condonado
	valorp = validateValue("E01PRLP" + concept);  // A Pagar
	valord = 0.00;                                // Diferir  
	valorr = 0.00;                                // Reliquidar
	valchg = 0.00;
	if ((refnac == "Y") && (concept != "PR")) {
		valord = fixedValue(valors - valorc - valorp);
	} else {
		valorr = fixedValue(valors - valorc - valorp);
	}
	if ((valord < 0) || (valorr < 0)) {
		alert('Valor invalido');
		getElement(field).value = formatCCY(valchg);
		valors = validateValue("E01PRLS" + concept);
		valorc = validateValue("E01PRLC" + concept);
		valorp = validateValue("E01PRLP" + concept);
		if ((refnac == "Y") && (concept != "PR")) {
			valord = fixedValue(valors - valorc - valorp);
		} else {
			valorr = fixedValue(valors - valorc - valorp);
		}
	}
	
	getElement("E01PRLC" + concept).value = formatCCY(fixedValue(valorc));
	getElement("E01PRLP" + concept).value = formatCCY(fixedValue(valorp));	
	getElement("E01PRLD" + concept).value = formatCCY(fixedValue(valord));
	getElement("E01PRLR" + concept).value = formatCCY(fixedValue(valorr));
	TOTAL();		
}

function calculateOtherCharges(seq, field) {
	var refnac;	var valors;	var valorc;	var valorp;	var valord;	var valorr;	var valchg;
	refnac = getElement("E01FLGREF").value;
	valors = validateValue("E01APAM" + seq);  // Saldo
	valorc = validateValue("E01XCAM" + seq);  // Condonado
	valorp = validateValue("E01PAMT" + seq);  // A Pagar
	valord = 0.00;                            // Diferir
	valorr = 0.00;                            // Reliquidar
	valchg = 0.00;
	if (refnac == "Y") {
		valord = fixedValue(valors - valorc - valorp);
	} else {
		valorr = fixedValue(valors - valorc - valorp);
	}
	if ((valord < 0) || (valorr < 0)) {
		alert('Valor invalido');
		getElement(field).value = formatCCY(valchg);
		valors = validateValue("E01APAM" + seq);
		valorc = validateValue("E01XCAM" + seq);
		valorp = validateValue("E01PAMT" + seq);
		if (refnac == "Y") {
			valord = fixedValue(valors - valorc - valorp);
		} else {
			valorr = fixedValue(valors - valorc - valorp);
		}
	}
	getElement("E01DAMT" + seq).value = formatCCY(fixedValue(valord));
	getElement("E01RAMT" + seq).value = formatCCY(fixedValue(valorr));
	getElement("E01PAMT" + seq).value = formatCCY(fixedValue(valorp));
	getElement("E01XCAM" + seq).value = formatCCY(fixedValue(valorc));	
	getElement("E01APAM" + seq).value = formatCCY(fixedValue(valors));	
	TOTAL();		
}

function TOTAL(){
	var valapa;	var valxca;	var valamt;	var valdif; var valrla; var valrea; var valrex
	var valpri;	var valinb;	var valinc;	var valmrb;	var valmrc;	var valimp;	var valcom;	var valded;	var valotr;
	var sq;
	
	valapa = 0.00; valxca = 0.00; valamt = 0.00; valdif = 0.00; valrla = 0.00;
	
	// Impuestos, Comisiones, Deducciones
	for (var ix=1; ix<=25; ix++) {
		if (ix < 10) sq = "0"+ix; else sq = ""+ix;
		valapa = valapa + validateValue("E01APAM"+sq);
		valxca = valxca + validateValue("E01XCAM"+sq);
		valamt = valamt + validateValue("E01PAMT"+sq);
		valdif = valdif + validateValue("E01DAMT"+sq);
		valrla = valrla + validateValue("E01RAMT"+sq);
	}
	
	// Saldos
	valpri = validateValue("E01PRLSPR");
	valrea = validateValue("E01PRLSRE");
	valinb = validateValue("E01PRLSIB");
	valinc = validateValue("E01PRLSIC");
	valmrb = validateValue("E01PRLSMB");
	valmrc = validateValue("E01PRLSMC");
	valrex = validateValue("E01PRLSMX");
	valimp = 0;
	valcom = 0;
	valded = 0;
	valotr = validateValue("E01PRLSOT");
	valtot = fixedValue(valpri + valinb + valinc + valmrb + valmrc + valimp + valcom + valded + valotr + valrex + valrea + valapa);
	getElement("TOTALS").value = formatCCY(fixedValue(valtot));

	// Condonado
	valpri = validateValue("E01PRLCPR");
	valrea = validateValue("E01PRLCRE");	
	valinb = validateValue("E01PRLCIB");
	valinc = validateValue("E01PRLCIC");
	valmrb = validateValue("E01PRLCMB");
	valmrc = validateValue("E01PRLCMC");
	valrex = validateValue("E01PRLCMX");
	valimp = 0;
	valcom = 0;
	valded = 0;
	valotr = validateValue("E01PRLCOT");
	valtot = fixedValue(valpri + valinb + valinc + valmrb + valmrc + valimp + valcom + valded + valotr + valrex + valrea + valxca);
	getElement("TOTALC").value = formatCCY(fixedValue(valtot));
	
	// Pagar
	valpri = validateValue("E01PRLPPR");
	valrea = validateValue("E01PRLPRE");	
	valinb = validateValue("E01PRLPIB");
	valinc = validateValue("E01PRLPIC");
	valmrb = validateValue("E01PRLPMB");
	valmrc = validateValue("E01PRLPMC");
	valrex = validateValue("E01PRLPMX");
	valimp = 0;
	valcom = 0;
	valded = 0;
	valotr = validateValue("E01PRLPOT");
	valtot = fixedValue(valpri + valinb + valinc + valmrb + valmrc + valimp + valcom + valded + valotr + valrex + valrea + valamt);
	getElement("TOTALP").value = formatCCY(fixedValue(valtot));
	
	// Diferir
	valpri = validateValue("E01PRLDPR");
	valrea = validateValue("E01PRLDRE");		
	valinb = validateValue("E01PRLDIB");
	valinc = validateValue("E01PRLDIC");
	valmrb = validateValue("E01PRLDMB");
	valmrc = validateValue("E01PRLDMC");
	valrex = validateValue("E01PRLDMX");
	valimp = 0;
	valcom = 0;
	valded = 0;
	valotr = validateValue("E01PRLDOT");
	valtot = fixedValue(valpri + valinb + valinc + valmrb + valmrc + valimp + valcom + valded + valotr + valrex + valrea + valdif);
	getElement("TOTALD").value = formatCCY(fixedValue(valtot));
	
	// Reliquidar
	valpri = validateValue("E01PRLRPR");
	valrea = validateValue("E01PRLRRE");		
	valinb = validateValue("E01PRLRIB");
	valinc = validateValue("E01PRLRIC");
	valmrb = validateValue("E01PRLRMB");
	valmrc = validateValue("E01PRLRMC");
	valrex = validateValue("E01PRLRMX");
	valimp = 0;
	valcom = 0;
	valded = 0;
	valotr = validateValue("E01PRLROT");
	valtot = fixedValue(valpri + valinb + valinc + valmrb + valmrc + valimp + valcom + valded + valotr + valrex + valrea + valrla);
	getElement("TOTALR").value    = formatCCY(fixedValue(valtot));
	getElement("E01PRLMTO").value = formatCCY(fixedValue(valtot));
	
}
  	
</script>
</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
	boolean newOnly=false;
	String refinac=(datarec.getE01FLGREF().trim()== null) ? "" : datarec.getE01FLGREF().trim();

	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}

	if (userPO.getPurpose().equals("NEW")){
		newOnly=false;
	} else if (userPO.getPurpose().equals("MAINTENANCE")) {
   		newOnly=false;
	} else {
   		newOnly=true;		
	}

%>

<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA DE RELIQUIDACIONES
<%} else if (maintenance){ %>
	MANTENIMIENTO DE RELIQUIDACIONES
<%} else { %>
	NUEVA RELIQUIDACION 
<%} %>

 <% 
  String emp = (String)session.getAttribute("EMPRC");
 	emp = (emp==null)?"":emp;
 %>
 <%if ("".equals(emp)){ %> 
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reassessment_maintenance.jsp, EPV1110"></h3>
  <hr size="4">
 <%}%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="500">
  <input type=HIDDEN name="E01UBK"  value="<%= currUser.getE01UBK().trim()%>">
  <input type=HIDDEN name="H01FLGMAS"  value="<%= datarec.getH01FLGMAS().trim()%>">
  <input type="hidden" name="E01PRLSEL" value="Y">
  <input type="hidden" name="E01PRLBNK" value="<%=datarec.getE01PRLBNK()%>">
  <input type="hidden" name="E01PRLBRN" value="<%=datarec.getE01PRLBRN()%>">
  <input type="hidden" name="E01PRLCCY" value="<%=datarec.getE01PRLCCY()%>">
  <input type="hidden" name="E01PRLCNV" value="<%=datarec.getE01PRLCNV()%>">
  <input type="hidden" name="E01PRLMTO" value="<%=datarec.getE01PRLMTO()%>">
  <input type="hidden" name="E01FLGREF" value="<%=datarec.getE01FLGREF()%>">
  <input type="hidden" name="E01SELPPM" value="<%=datarec.getE01SELPPM()%>">

 <% int row = 0;%>
 <% if ("".equals(emp)){ %> 
  <input type="hidden" name="E01PRLACC" value="<%=datarec.getE01PRLACC()%>"> 
  <input type="hidden" name="E01PRLTYP" value="<%=datarec.getE01PRLTYP()%>">
  <input type="hidden" name="E01PRLPRD" value="<%=datarec.getE01PRLPRD()%>">
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="10%" align="right"> Cliente : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="datarec" property="E01PRLCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Propuesta : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="datarec" property="E01PRLNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Sequencia :  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="datarec" property="E01PRLSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
             </td>
         </tr>
       </table>
      </td>
    </tr>
  </table>
 <%}else{%>
  	<input  type="hidden" name="E01PRLCUN" value="<%=datarec.getE01PRLCUN()%>">
  	<input  type="hidden" name="E01PRLNUM" value="<%=datarec.getE01PRLNUM()%>">
  	<input  type="hidden" name="E01PRLSEQ" value="<%=datarec.getE01PRLSEQ()%>"> 
  	
    <table class="tableinfo">
      <tr bordercolor="#FFFFFF"> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
            <tr id="trdark"> 
               <td nowrap width="10%" align="right"> Prestamo : </td>
               <td nowrap width="20%" align="left">
                 <eibsinput:text name="datarec" property="E01PRLACR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
               </td>
               <td nowrap width="10%" align="right"> Producto : </td>
               <td nowrap width="20%"align="left">
                 <eibsinput:text name="datarec" property="E01PRLPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
               </td>
               <td nowrap width="10%" align="right"> Descripci&oacute;n : </td>
               <td nowrap width="30%" align="left">
                 <eibsinput:text name="datarec" property="E01DSCPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" size="65" readonly="true"/>
               </td>
           </tr>
         </table>
        </td>
      </tr>
    </table>
    <br>

 <%} %>

<%if ("".equals(emp)){ %>      
  <h4>Datos de Reliquidacion</h4>
<%} %>      

<%if ("Y".equals(refinac)) { %>      
  <table id="mainTable" class="tableinfo" >
    <tr height="5%">
      <td NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th nowrap width="10%" align="center">CONCEPTOS</th>
            <th nowrap width="18%" align="center">SALDOS</th>
            <th nowrap width="18%" align="center">CONDONADO
            	<%if(!readOnly) {%>
					<img id="eibsNew" src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" >
				<%} %>
            </th>
            <th nowrap width="18%" align="center">A PAGAR</th>
            <th nowrap width="18%" align="center">DIFERIR</th>
            <th nowrap width="18%" align="center">A RELIQUIDAR</th>
          </tr>
        </table>
      </td>
    </tr>
    <tr height="95%">
      <td nowrap="nowrap">
        <div id="dataDiv1" style="overflow:auto;">
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
            <tr id="trclear">
              <td nowrap width="10%" align="center">PRINCIPAL</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('PR','E01PRLCPR');" readonly="<%=readOnly%>"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('PR','E01PRLPPR');" readonly="<%=readOnly%>"/>  
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01PRLDPR" value="<%=datarec.getE01PRLDPR().trim()%>" >
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLRPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>  
              </td>
            </tr>
	     <%if(datarec.getH01FLGWK3().equals("R")){%>
            <tr id="trclear">
              <td nowrap width="10%" align="center">REAJUSTE</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('RE','E01PRLCRE');" readonly="<%=readOnly%>"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('RE','E01PRLPRE');" readonly="<%=readOnly%>"/>  
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLDRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01PRLRRE" value="<%=datarec.getE01PRLRRE().trim()%>" >
              </td>
            </tr>
		  <%}%>               
            <tr id="trclear">
              <td nowrap width="10%" align="center">INTERES BAL.</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSIB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCIB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('IB','E01PRLCIB');" readonly="<%=readOnly%>"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPIB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('IB','E01PRLPIB');" readonly="<%=readOnly%>"/>  
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLDIB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01PRLRIB" value="<%=datarec.getE01PRLRIB().trim()%>" >
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="10%" align="center">INTERES CON.</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('IC','E01PRLCIC');" readonly="<%=readOnly%>"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('IC','E01PRLPIC');" readonly="<%=readOnly%>"/>  
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLDIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01PRLRIC" value="<%=datarec.getE01PRLRIC().trim()%>" >
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="10" align="center">MORA BAL.</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MB','E01PRLCMB');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MB','E01PRLPMB');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLDMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01PRLRMB" value="<%=datarec.getE01PRLRMB().trim()%>" >
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="10" align="center">MORA CON.</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MC','E01PRLCMC');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MC','E01PRLPMC');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLDMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01PRLRMC" value="<%=datarec.getE01PRLRMC().trim()%>" >
              </td>
            </tr>
	     <%if(datarec.getH01FLGWK3().equals("R")){%>
            <tr id="trclear">
              <td nowrap width="10%" align="center">REAJUSTE MORA:</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MX','E01PRLCMX');" readonly="<%=readOnly%>"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MX','E01PRLPMX');" readonly="<%=readOnly%>"/>  
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLDMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01PRLRMX" value="<%=datarec.getE01PRLRIN().trim()%>" >
              </td>
            </tr>
		  <%}%>               
            <%
              String seq = "";
              for (int i = 1;i <= 25;i++) {
                if (i < 10) seq = "0"+i; else seq = ""+i;
                if (!datarec.getField("E01PDSC"+seq).getString().trim().equals("")){
            %> 
            <tr id="trclear">
              <td nowrap width="10%" align="center">
                <input TYPE=HIDDEN name="E01PTYP<%=seq%>" id="E01PTYP<%=seq%>" value="<%= datarec.getField("E01PTYP"+seq).getString().trim()%>"> 
                <input TYPE=HIDDEN name="E01PCDE<%=seq%>" id="E01PCDE<%=seq%>" value="<%= datarec.getField("E01PCDE"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PDSC<%=seq%>" id="E01PDSC<%=seq%>" value="<%= datarec.getField("E01PDSC"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PSEQ<%=seq%>" id="E01PSEQ<%=seq%>" value="<%= datarec.getField("E01PSEQ"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PBNK<%=seq%>" id="E01PBNK<%=seq%>" value="<%= datarec.getField("E01PBNK"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PBRN<%=seq%>" id="E01PBRN<%=seq%>" value="<%= datarec.getField("E01PBRN"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PCCY<%=seq%>" id="E01PCCY<%=seq%>" value="<%= datarec.getField("E01PCCY"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PGLN<%=seq%>" id="E01PGLN<%=seq%>" value="<%= datarec.getField("E01PGLN"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PACC<%=seq%>" id="E01PACC<%=seq%>" value="<%= datarec.getField("E01PACC"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PIVA<%=seq%>" id="E01PIVA<%=seq%>" value="<%= datarec.getField("E01PIVA"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PTXP<%=seq%>" id="E01PTXP<%=seq%>" value="<%= datarec.getField("E01PTXP"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PTXB<%=seq%>" id="E01PTXB<%=seq%>" value="<%= datarec.getField("E01PTXB"+seq).getString().trim()%>">                
                <%= datarec.getField("E01PDSC"+seq).getString().trim()%>
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01APAM<%=seq%>" id="E01APAM<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01APAM<%=seq%>');" value="<%=datarec.getField("E01APAM"+seq).getString().trim()%>" readonly>
              </td>
			 <%if (readOnly){ %>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01XCAM<%=seq%>" id="E01XCAM<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01XCAM<%=seq%>');" value="<%=datarec.getField("E01XCAM"+seq).getString().trim()%>"  readonly >
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01PAMT<%=seq%>" id="E01PAMT<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01PAMT<%=seq%>');" value="<%=datarec.getField("E01PAMT"+seq).getString().trim()%>"  readonly >  
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01DAMT<%=seq%>" id="E01DAMT<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01DAMT<%=seq%>');" value="<%=datarec.getField("E01DAMT"+seq).getString().trim()%>"  readonly >
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01RAMT<%=seq%>" id="E01RAMT<%=seq%>" value="<%=datarec.getField("E01RAMT"+seq).getString().trim()%>" >  
              </td>
            <% } else {%>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01XCAM<%=seq%>" id="E01XCAM<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01XCAM<%=seq%>');" value="<%=datarec.getField("E01XCAM"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)" >
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01PAMT<%=seq%>" id="E01PAMT<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01PAMT<%=seq%>');" value="<%=datarec.getField("E01PAMT"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)" >  
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01DAMT<%=seq%>" id="E01DAMT<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01DAMT<%=seq%>');" value="<%=datarec.getField("E01DAMT"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)" readonly >
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01RAMT<%=seq%>" id="E01RAMT<%=seq%>" value="<%=datarec.getField("E01RAMT"+seq).getString().trim()%>" >  
              </td>
            <% } %>
            </tr>
            <%
                }
              } 
            %>
            <!--            SALDO ACT  CONDONACI  PAGO       DIFERIR    RELIQUIDA -->
            <!-- ---------------------------------------------------------------- -->
            <!-- IMPUESTOS: E01PRLSIM, E01PRLCIM, E01PRLPIM, E01PRLDIM, E01PRLRIM -->
            <!-- COMISION:  E01PRLSCO, E01PRLCCO, E01PRLPCO, E01PRLDCO, E01PRLRCO -->
            <!-- DEDUCCION: E01PRLSDE, E01PRLCDE, E01PRLPDE, E01PRLDDE, E01PRLRDE -->
            <tr id="trclear">
              <td nowrap width="10%" align="center">OTROS</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('OT','E01PRLCOT');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('OT','E01PRLPOT');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLDOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="hidden" name="E01PRLROT" value="<%=datarec.getE01PRLROT().trim()%>" >
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="10%" align="center">TOTAL</td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text property="TOTALS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" /> 
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text property="TOTALC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"  />
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text property="TOTALP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text property="TOTALD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="18%" align="center"> 
                <eibsinput:text property="TOTALR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true" />
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
<%} else {%>  
  <table id="mainTable" class="tableinfo" >
    <tr height="5%">
      <td NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th nowrap width="20%" align="center">CONCEPTOS</th>
            <th nowrap width="20%" align="center">SALDOS</th>
            <th nowrap width="20%" align="center">CONDONADO 
            	<%if(!readOnly) {%>
					<img id="eibsNew" src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" >
				<%} %>             </th>
            <th nowrap width="20%" align="center">A PAGAR</th>
            <th nowrap width="20%" align="center">A RELIQUIDAR</th>
          </tr>
        </table>
      </td>
    </tr>
    <tr height="95%">
      <td nowrap="nowrap">
        <div id="dataDiv1" style="overflow:auto;">
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">
            <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input type="hidden" name="E01PRLDPR" value="<%=datarec.getE01PRLDPR().trim()%>" >
                PRINCIPAL
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('PR','E01PRLCPR');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('PR','E01PRLPPR');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLRPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>  
              </td>
            </tr>
	     <%if(datarec.getH01FLGWK3().equals("R")){%> 
            <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input type="hidden" name="E01PRLDRE" value="<%=datarec.getE01PRLDRE().trim()%>" >
              REAJUSTE</td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('RE','E01PRLCRE');" readonly="<%=readOnly%>"/> 
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('RE','E01PRLPRE');" readonly="<%=readOnly%>"/>  
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLRRE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
            </tr>
		  <%}%>              
            <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input type="hidden" name="E01PRLDIB" value="<%=datarec.getE01PRLDIB().trim()%>" >
                INTERES BAL.
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSIB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCIB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('IB','E01PRLCIB');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPIB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('IB','E01PRLPIB');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLRIB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>  
              </td>
            </tr>
             <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input type="hidden" name="E01PRLDIC" value="<%=datarec.getE01PRLDIC().trim()%>" >
                INTERES CON.
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('IC','E01PRLCIC');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('IC','E01PRLPIC');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLRIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>  
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input type="hidden" name="E01PRLDMB" value="<%=datarec.getE01PRLDMB().trim()%>" >
                MORA BAL.
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MB','E01PRLCMB');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MB','E01PRLPMB');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLRMB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>  
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input type="hidden" name="E01PRLDMC" value="<%=datarec.getE01PRLDMC().trim()%>" >
                MORA CON.
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MC','E01PRLCMC');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MC','E01PRLPMC');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLRMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>  
              </td>
            </tr>
	     <%if(datarec.getH01FLGWK3().equals("R")){%>
            <tr id="trclear">
              <td nowrap width="20%" align="center">REAJUSTE MORA
                <input type="hidden" name="E01PRLDMX" value="<%=datarec.getE01PRLDMX().trim()%>" >
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MX','E01PRLCMX');" readonly="<%=readOnly%>"/> 
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('MX','E01PRLPMX');" readonly="<%=readOnly%>"/>  
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLRMX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
            </tr>
		  <%}%>             
            <%
              String seq = "";
              for (int i = 1;i <= 25;i++) {
                if (i < 10) seq = "0"+i; else seq = ""+i;
                if (!datarec.getField("E01PDSC"+seq).getString().trim().equals("")){
            %> 
            <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input TYPE=HIDDEN name="E01PTYP<%=seq%>" id="E01PTYP<%=seq%>" value="<%= datarec.getField("E01PTYP"+seq).getString().trim()%>"> 
                <input TYPE=HIDDEN name="E01PCDE<%=seq%>" id="E01PCDE<%=seq%>" value="<%= datarec.getField("E01PCDE"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01DAMT<%=seq%>" id="E01DAMT<%=seq%>" value="<%= datarec.getField("E01DAMT"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PDSC<%=seq%>" id="E01PDSC<%=seq%>" value="<%= datarec.getField("E01PDSC"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PSEQ<%=seq%>" id="E01PSEQ<%=seq%>" value="<%= datarec.getField("E01PSEQ"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PBNK<%=seq%>" id="E01PBNK<%=seq%>" value="<%= datarec.getField("E01PBNK"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PBRN<%=seq%>" id="E01PBRN<%=seq%>" value="<%= datarec.getField("E01PBRN"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PCCY<%=seq%>" id="E01PCCY<%=seq%>" value="<%= datarec.getField("E01PCCY"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PGLN<%=seq%>" id="E01PGLN<%=seq%>" value="<%= datarec.getField("E01PGLN"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PACC<%=seq%>" id="E01PACC<%=seq%>" value="<%= datarec.getField("E01PACC"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PIVA<%=seq%>" id="E01PIVA<%=seq%>" value="<%= datarec.getField("E01PIVA"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PTXP<%=seq%>" id="E01PTXP<%=seq%>" value="<%= datarec.getField("E01PTXP"+seq).getString().trim()%>">
                <input TYPE=HIDDEN name="E01PTXB<%=seq%>" id="E01PTXB<%=seq%>" value="<%= datarec.getField("E01PTXB"+seq).getString().trim()%>">
                 
                 
                <%= datarec.getField("E01PDSC"+seq).getString().trim()%>
              </td>
              <td nowrap width="20%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01APAM<%=seq%>" id="E01APAM<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01APAM<%=seq%>');" value="<%=datarec.getField("E01APAM"+seq).getString().trim()%>" readonly>
              </td>
			 <%if (readOnly){ %>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01XCAM<%=seq%>" id="E01XCAM<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01XCAM<%=seq%>');" value="<%=datarec.getField("E01XCAM"+seq).getString().trim()%>"  readonly >
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01PAMT<%=seq%>" id="E01PAMT<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01PAMT<%=seq%>');" value="<%=datarec.getField("E01PAMT"+seq).getString().trim()%>"  readonly >  
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01RAMT<%=seq%>" id="E01RAMT<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01RAMT<%=seq%>');" value="<%=datarec.getField("E01RAMT"+seq).getString().trim()%>"  readonly >  
              </td>
            <% } else {%>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01XCAM<%=seq%>" id="E01XCAM<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01XCAM<%=seq%>');" value="<%=datarec.getField("E01XCAM"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)" >
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01PAMT<%=seq%>" id="E01PAMT<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01PAMT<%=seq%>');" value="<%=datarec.getField("E01PAMT"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)" >  
              </td>
              <td nowrap width="18%" align="center"> 
                <input type="text"class="txtright" size="20" maxlength="19" name="E01RAMT<%=seq%>" id="E01RAMT<%=seq%>" onchange="calculateOtherCharges('<%=seq%>','E01RAMT<%=seq%>');" value="<%=datarec.getField("E01RAMT"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)" readonly>  
              </td>
            <% } %>              
            </tr>
            <%
                }
              } 
            %>
            <!-- IMPUESTOS: E01PRLSIM, E01PRLCIM, E01PRLPIM, E01PRLRIM -->
            <!-- COMISION:  E01PRLSCO, E01PRLCCO, E01PRLPCO, E01PRLRCO -->
            <!-- DEDUCCION: E01PRLSDE, E01PRLCDE, E01PRLPDE, E01PRLRDE -->
            <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input type="hidden" name="E01PRLDOT" value="<%=datarec.getE01PRLDOT().trim()%>" >
                OTROS
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLSOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLCOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('OT','E01PRLCOT');" readonly="<%=readOnly %>"/> 
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLPOT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" onchange="calculateConcepto('OT','E01PRLPOT');" readonly="<%=readOnly %>"/>  
              </td>
              <td nowrap width="20%" align="center"> 
                <eibsinput:text name="datarec" property="E01PRLROT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>  
              </td>
            </tr>
            <tr id="trclear">
              <td nowrap width="20%" align="center">
                <input type="hidden" name="TOTALD" value="0" >
                TOTAL
              </td>
              <td nowrap width="20%" align="center">
              	<eibsinput:text property="TOTALS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
              <td nowrap width="20%" align="center"> 
              	<eibsinput:text property="TOTALC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center"> 
              	<eibsinput:text property="TOTALP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/>
              </td>
              <td nowrap width="20%" align="center">
              	<eibsinput:text property="TOTALR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" readonly="true"/> 
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
<%} %>
	
  <div id="mnuUni">
    <br>
    <h4>Cuenta de Pago<%=readOnly?"":" - <a href='#' onclick='showMulti(true,true);'><b>Multiple</b></a>"%></h4>
  </div>
  <table id="tblUni" class="tableinfo" style="max-height:106px;">
		<tr height="5%"> 
			<td nowrap valign="top" width="100%"> 
				<table id="headTable" width="99%">
					<tr id="trdark">
						<th nowrap width="30%" align="center">Concepto</th>
						<th nowrap width="05%" align="center">Banco</th>
						<th nowrap width="10%" align="center">Sucursal</th>
						<th nowrap width="10%" align="center">Moneda</th>
						<th nowrap width="15%" align="center">Referencia</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="max-height:106px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
						<tr id="trclear"> 
							<td nowrap width="30%" align="center">
								<input type=text name="E01PAGOPC" value="<%= datarec.getE01PAGOPC().trim()%>" size="3" maxlength="3" readonly="<%=readOnly %>">
								<input type=HIDDEN name="E01PAGOGL" value="<%= datarec.getE01PAGOGL().trim()%>">
								<%if(readOnly){ %>
								<input type="text" name="E01PAGCON" size="35" maxlength="35" readonly value="<%= datarec.getE01PAGCON().trim()%>" readonly>
								<% }else{ %>
								<input type="text" name="E01PAGCON" size="35" maxlength="35" readonly value="<%= datarec.getE01PAGCON().trim()%>"
									class="context-menu-help" onmousedown="init(conceptHelp,this.name, document.forms[0].E01PRLBNK.value, document.forms[0].E01PAGOCY.value,'E01PAGOGL','E01PAGOPC','10','02')">
								<% } %>
							</td>
							<td nowrap width="05%" align="center"> 
								<input type="text" name="E01PAGOBK" size="2" maxlength="2" value="<%= datarec.getE01PAGOBK().trim()%>" readonly="<%=readOnly %>">
							</td>
							<td nowrap width="10%" align="center"> 
								<%if(readOnly){ %>
								<input type="text" name="E01PAGOBR" size="4" maxlength="4" value="<%= datarec.getE01PAGOBR().trim()%>" readonly>
								<% }else{ %>
								<input type="text" name="E01PAGOBR" size="4" maxlength="4" value="<%= datarec.getE01PAGOBR().trim()%>"
									class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01PRLBNK.value,'','','','')">
								<% } %>
							</td>
							<td nowrap width="10%" align="center"> 
							 <%if(readOnly){ %>
								<input type="text" name="E01PAGOCY" size="3" maxlength="3" value="<%= datarec.getE01PAGOCY().trim()%>" readonly>
								<% }else{ %>
								<input type="text" name="E01PAGOCY" size="3" maxlength="3" value="<%= datarec.getE01PAGOCY().trim()%>"
									class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01PRLBNK.value,'','','','')">
								<% } %>
							</td>
							<td nowrap width="15%" align="center"> 
								<%if(readOnly){ %>
								<input type="text" name="E01PAGOAC" size="16" maxlength="16" value="<%= datarec.getE01PAGOAC().trim()%>" readonly>
								<% }else{ %>
								<input type="text" name="E01PAGOAC" size="16" maxlength="16" value="<%= datarec.getE01PAGOAC().trim()%>"
									class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01PRLBNK.value,'','','','RM')">
								<% } %>
							</td>
						</tr> 
					</table>
				</div>
			</td>
		</tr>
	</table>

  <div id="mnuMulti">
    <br>
    <h4>Cuenta de Pago Multiple<%=readOnly?"":" - <a href='#' onclick='showMulti(false,true)' ><b>Unica</b></a>"%></h4>
  </div>
	<table id="tblMulti" class="tableinfo" style="max-height:106px;">
		<tr height="5%"> 
			<td nowrap valign="top" width="100%"> 
				<table id="headTable" width="99%">
					<tr id="trdark">
						<th nowrap width="28%" align="center">Concepto</th>
						<th nowrap width="04%" align="center">Ban</th>
						<th nowrap width="05%" align="center">Suc</th>
						<th nowrap width="05%" align="center">Mon</th>
						<th nowrap width="12%" align="center">Referencia</th>
						<th nowrap width="14%" align="center">Valor</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="max-height:106px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
						<%
							for (int i=1;i<10;i++) {
						%> 
						<tr id="trclear"> 
							<td nowrap width="28%" align="center">
								 <%= i %>.
								<input type=text name="<%="E01PAGOP"+i%>" value="<%=datarec.getFieldString("E01PAGOP"+i).trim()%>" size="3" maxlength="3" readonly="<%=readOnly%>">
								<input type=hidden name="<%="E01PAGGL"+i%>" value="<%=datarec.getFieldString("E01PAGGL"+i).trim()%>">
								<input type="text" name="<%="E01PAGCO"+i%>" size="35" maxlength="35" readonly value="<%=datarec.getFieldString("E01PAGCO"+i).trim()%>" <%=readOnly?"":"class='context-menu-help'"%> <%=readOnly?"":"onmousedown=init(conceptHelp,this.name,document.forms[0].E01PRLBNK.value, document.forms[0].E01PAGCY"+i+".value,'E01PAGGL"+i+"','E01PAGOP"+i+"','10','02')"%> <%=readOnly?"readonly":""%> >
							</td>
							<td nowrap width="04%" align="center"> 
								<input type="text" name="<%="E01PAGBK"+i%>" size="2" maxlength="2" value="<%=datarec.getFieldString("E01PAGBK"+i).trim()%>" readonly="<%=readOnly %>">
							</td>
							<td nowrap width="05%" align="center"> 
								<input type="text" name="<%="E01PAGBR"+i%>" size="4" maxlength="4" value="<%=datarec.getFieldString("E01PAGBR"+i).trim()%>" <%=readOnly?"":"class='context-menu-help'"%> <%=readOnly?"":"onmousedown=init(branchHelp,this.name,document.forms[0].E01PRLBNK.value,'','','','')"%> <%=readOnly?"readonly":""%> >
							</td>
							<td nowrap width="05%" align="center"> 
								<input type="text" name="<%="E01PAGCY"+i%>" size="3" maxlength="3" value="<%=datarec.getFieldString("E01PAGCY"+i).trim()%>" <%=readOnly?"":"class='context-menu-help'"%> <%=readOnly?"":"onmousedown=init(currencyHelp,this.name,document.forms[0].E01PRLBNK.value,'','','','')"%> <%=readOnly?"readonly":""%> >
							</td>
							<td nowrap width="12%" align="center"> 
								<input type="text" name="<%="E01PAGAC"+i%>" size="16" maxlength="16" value="<%=datarec.getFieldString("E01PAGAC"+i).trim()%>" <%=readOnly?"":"class='context-menu-help'"%> <%=readOnly?"":"onmousedown=init(accountHelp,this.name,document.forms[0].E01PRLBNK.value,'','','','RT')"%> <%=readOnly?"readonly":""%> >
							</td>
							<td nowrap width="14%" align="center"> 
								<input type="text" name="<%="E01PAGAM"+i%>" class="txtright" size="20" maxlength="19" value="<%=datarec.getField("E01PAGAM"+i).getString().trim()%>" onKeypress="enterDecimal(event, 2)" onblur="this.value = formatCCY(this.value)" <%=readOnly?"readonly":""%> >
							</td>
						</tr> 
						<%}%>
					</table>
				</div>
			</td>
		</tr>
	</table>
	
   <%if  (!readOnly) { %>
      <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
      </div>
    <% } else { %>
      <div align="center"> 
          <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
      </div>     
    <% } %>  
    
  </form>
  
<div id="hiddenDivNew" class="hiddenDiv">
	<% int row1 = 0;%>
    <table id=tbhelp style=" width:170px; border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="trdark" >
        <td align=CENTER colspan="2" width="18%"> 
          <div align="center" style="font-weight: bold;"> % Condonacion</div>
        </td>
	  </tr>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Principal :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="principal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
	<%if(datarec.getH01FLGWK3().equals("R")){%>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Reajuste :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="reajuste" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <% } %>      
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Int.Bal.:</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
          	<eibsinput:text property="interest" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Int.Con.:</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
          	<eibsinput:text property="interestc" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Mora Bal:</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="mora" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Mora Con:</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="morac" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
	<%if(datarec.getH01FLGWK3().equals("R")){%>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Reajuste Mora :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="reajusteMora" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <% } %>          
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Otros :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="otros" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>         
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Impuesto :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="impuesto" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Comisi&oacute;n :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="comision" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Deduci&oacute;n :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="deducion" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">Cobranza :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="cobranza" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>
      <tr id="trclear">
        <td align=CENTER width="18%"> 
          <div align="right">IVA :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:text property="iva" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
          </div>
        </td>
      </tr>        
      <tr id="trclear">
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:checkCalcular()">
        </td>
      </tr>      
    </table>
  </div>  
  
  
<% if ("S".equals(request.getAttribute("ACT"))){ %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1110?SCREEN=101&E01PRLCUN=<%=userPO.getCusNum()%>&E01PRLNUM=<%=userPO.getPorfNum()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>  

<script type="text/javascript">
	function closeHiddenDivNew(){
		setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

	function showHiddenDivNew(evt) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
	 	
		var hiddenDivNew = document.getElementById("hiddenDivNew");
	
		var y=evt.clientY + document.body.scrollTop;
		var x=evt.clientX + document.body.scrollLeft;
		
		getElement("principal").value = "";
		getElement("interest").value = "";
		getElement("interestc").value = "";
		getElement("mora").value = "";
		getElement("morac").value = "";
		getElement("otros").value = "";
		getElement("impuesto").value = "";
		getElement("comision").value = "";
		getElement("deducion").value = "";
		getElement("cobranza").value = "";
		getElement("iva").value = "";	
		if(isValidObject(getElement("reajuste")))getElement("reajuste").value = "";
		if(isValidObject(getElement("reajusteMora")))getElement("reajusteMora").value = "";
	
		
		cancelBub(evt);
	
		moveElement(hiddenDivNew, y, x);
		setVisibility(hiddenDivNew, "visible");
	 
}


function checkCalcular(){
	var apgvalue; var xcnvalue; var relvalue; var valpercent;
	var otroCargosPerc; var impuestoperc; var comisionperc; var deducionperc; var cobranzaperc; var ivaperc;
	var reajustePerc; var reajusteMoraPerc;
	// PRINCIPAL
	if (getElement("principal").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("principal"), 10) / 100;
		if (valpercent != 0){
			validateConcepto('PR',valpercent);
			calculateConcepto('PR','E01PRLCPR');
		}
	}
	// REAJUSTE
	if (isValidObject(getElement("reajuste"))){
		if (getElement("reajuste").value.length == 0) {
			valpercent = 0;
		} else {
			valpercent = parseFloat(validateValue("reajuste"), 10) / 100;
			if (valpercent != 0){
				validateConcepto('RE',valpercent);
				calculateConcepto('RE','E01PRLCRE');
			}
		}	
	}
	// INTERES BAL.
	if (getElement("interest").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("interest"), 10) / 100;
		if (valpercent != 0){
			validateConcepto('IB',valpercent);
			calculateConcepto('IB','E01PRLCIB');
		}
	}
	// INTERES CON.
	if (getElement("interestc").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("interestc"), 10) / 100;
		if (valpercent != 0){
			validateConcepto('IC',valpercent);
			calculateConcepto('IC','E01PRLCIC');
		}
	}
	// MORA BAL.
	if (getElement("mora").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("mora"), 10)/ 100;
		if (valpercent != 0){
			validateConcepto('MB',valpercent);
			calculateConcepto('MB','E01PRLCMB');
		}
	}
	// MORA CON.
	if (getElement("morac").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("morac"), 10)/ 100;
		if (valpercent != 0){
			validateConcepto('MC',valpercent);
			calculateConcepto('MC','E01PRLCMC');
		}
	}
	// REAJUSTE MORA
	if (isValidObject(getElement("reajusteMora"))){
		if (getElement("reajusteMora").value.length == 0) {
			valpercent = 0;
		} else {
			valpercent = parseFloat(validateValue("reajusteMora"), 10) / 100;
			if (valpercent != 0){
				validateConcepto('MX',valpercent);
				calculateConcepto('MX','E01PRLCMX');
			}
		}	
	}
	// OTROS
	if (getElement("otros").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("otros"), 10) / 100;
			if (valpercent != 0){
				validateConcepto('OT',valpercent);
				calculateConcepto('OT','E01PRLCOT');
			}
	}
	
	if (getElement("impuesto").value.length == 0) {
		impuestoperc = 0;
	} else {
		impuestoperc = parseFloat(validateValue("impuesto"), 10) / 100;
	}

	if (getElement("comision").value.length == 0) {
		comisionperc = 0;
	} else {
		comisionperc = parseFloat(validateValue("comision"), 10)/ 100;
	}

	if (getElement("deducion").value.length == 0) {
		deducionperc = 0;
	} else {
		deducionperc = parseFloat(validateValue("deducion"), 10)/ 100;
	}
	
	if (getElement("cobranza").value.length == 0) {
		cobranzaperc = 0;
	} else {
		cobranzaperc = parseFloat(validateValue("cobranza"), 10)/ 100;
	}

	if (getElement("iva").value.length == 0) {
		ivaperc = 0;
	} else {
		ivaperc = parseFloat(validateValue("iva"), 10) / 100;
	}	
	
	for (var k=1; k<26; k++) {
		if (k < 10) sq = "0"+k; else sq = ""+k;
		try {
			apgvalue = parseFloat(validateValue("E01APAM"+sq), 10);
			xcnvalue = parseFloat(validateValue("E01XCAM"+sq), 10);
			if((impuestoperc != 0 && getElement("E01PTYP"+sq).value=='1')) {
				xcnvalue = parseFloat(apgvalue * impuestoperc);
			}
			if((comisionperc != 0 && getElement("E01PTYP"+sq).value=='2')) {
				xcnvalue = parseFloat(apgvalue * comisionperc);
			}
			if((deducionperc != 0 && getElement("E01PTYP"+sq).value=='3')) {
				xcnvalue = parseFloat(apgvalue * deducionperc);
			}
			if((cobranzaperc != 0 && getElement("E01PTYP"+sq).value=='5')) {
				xcnvalue = parseFloat(apgvalue * cobranzaperc);
			}
			if((ivaperc != 0 && getElement("E01PTYP"+sq).value=='4')) {
				xcnvalue = parseFloat(apgvalue * ivaperc);
			}
			xcnvalue = fixedValue(xcnvalue);
			relvalue = fixedValue(apgvalue - xcnvalue);
			getElement("E01XCAM"+sq).value = formatCCY(String(xcnvalue));
			getElement("E01RAMT"+sq).value = formatCCY(String(relvalue));
		} catch (e) {
		}
	}	
		
	//calculateConcepto(concept, field)	
	
	TOTAL();		
	closeHiddenDivNew();	
}

function validateValue(valamt) {
	try {
		valamt = getElement(valamt).value;
		valamt = valamt.replace(/\,/g,'');
		valamt = parseFloat(valamt);
		if (isNaN(valamt)) { 
			valamt = 0.00;
		}
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function fixedValue(valamt) {
	try {
		valamt = Number(valamt.toFixed(2));
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function checkPercentage(e, dec) {
	enterInteger(e);
	var elem = EventElement(e);
	if (elem.value.length > 0) {
		if (parseInt(elem.value) > 100) {
			elem.value = "100";
		}
	}	
}


</script>

<script type="text/javascript">
	TOTAL();
	setMulti();
	
	addEventHandler(document, 'click', closeHiddenDivNew);
	document.getElementById("hiddenDivNew").onclick = cancelBub;
	
	if (isValidObject(document.getElementById("eibsNew"))) {
		document.getElementById("eibsNew").onclick = showHiddenDivNew;
	}	
</script>

</body> 
</HTML>