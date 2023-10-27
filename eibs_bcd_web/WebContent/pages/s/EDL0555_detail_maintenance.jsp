<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>

<html>
<head>
<title>Detalle Negociacion</title> 
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EDL055504Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript"  src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();		
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

function calculateConcepto(obj) {
	var fldnam; var fldcpt;
	var valamt; var valprc; var valcnd; var valtot;  
	fldnam = obj.name.substring(0,8);
	fldcpt = obj.name.substring(8);
	valprc = 0.00;
	valcnd = 0.00;
	valtot = 0.00;
	// Porcentaje
	if (fldnam == "E04DLNPR") {
		valamt = validateValue("E04DLNAM" + fldcpt);
		valprc = validateValue("E04DLNPR" + fldcpt);
		valcnd = fixedValue(valamt * valprc / 100);
		valtot = fixedValue(valamt - valcnd);
	}
	// Valor Condonado
	if (fldnam == "E04DLNCD") {
		valamt = validateValue("E04DLNAM" + fldcpt);
		valcnd = validateValue("E04DLNCD" + fldcpt);
		valprc = fixedValue(valcnd * 100 / valamt);
		valtot = fixedValue(valamt - valcnd);
	}
	if (valtot < 0) {
		valprc = 0.00;
		valcnd = 0.00;
		valtot = 0.00;
	}
	getElement("E04DLNPR" + fldcpt).value = formatCCY(valprc);
	getElement("E04DLNCD" + fldcpt).value = formatCCY(valcnd);
	getElement("E04DLNTO" + fldcpt).value = formatCCY(valtot);
	return;
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
	var maxvalue = 9999999999999.99;
	try {
		valamt = Number(valamt.toFixed(2));
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

</script>

</head>

<%
	boolean readOnly = false;
	boolean maintenance = false;
	boolean newOnly = false;

	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null) {
		if (request.getParameter("readOnly").toLowerCase().equals("true")) {
			readOnly = true;
		} else {
			readOnly = false;
		}
	}

	// Determina si es nuevo o mantencion
	if (userPO.getHeader20().equals("NEW")) {
		newOnly = true;
	} else {
		newOnly = false;
	}

  String main = "";
  if (readOnly) {
      main = "Consulta de Negociacion";
  } else if (newOnly) {       
      main = "Nueva Negociacion";
  } else {
      main = "Mantenimiento de Negociacion";  
  }

%>

<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%=main%> 
<% 
	String emp = (String)session.getAttribute("EMPNG");
	emp = (emp==null)?"":emp;
%>
<%if ("".equals(emp)){ %> 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="detail_maintenance.jsp, EDL0555"></h3>
	<hr size="4">
<%}%>
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="407">
  <%int row = 0;%>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="10%" align="right"> Propuesta : </td>
            <td nowrap width="23%"align="left">
              <eibsinput:text name="datarec" property="E04DLNOFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Cliente : </td>
            <td nowrap width="23%" align="left">
              <eibsinput:text name="datarec" property="E04DLNCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Cuenta  : </td>
            <td nowrap width="23%" align="left">
              <eibsinput:text name="datarec" property="E04DLNACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Detalle Simulacion </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="15%" ><div align="right">Tipo Simulacion :</div></td>
            <td width="15%" nowrap="nowrap" >
              <select name="E04DLNTYP" disabled>
                <option value="1" <% if (datarec.getE04DLNTYP().equals("1")) out.print("selected"); %>>Vencido</option>
                <option value="2" <% if (datarec.getE04DLNTYP().equals("2")) out.print("selected"); %>>Pago Total</option>
                <option value="3" <% if (datarec.getE04DLNTYP().equals("3")) out.print("selected"); %>>Por Cuota</option>
              </select>                
            </td>
            <td width="15%" >
              <div align="right" id="divNroCuotasLabel">Numero de Cuotas :</div>
            </td>
            <td width="15%" >
              <div align="left" id="divNroCuotas">
                <eibsinput:text name="datarec" property="E04DLNCUO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_QUANTITY %>" readonly="true"/>
              </div>
            </td>
            <td width="15%" ><div align="right">Fecha de Simulacion :</div></td>
            <td width="15%" >
              <eibsinput:date name="datarec" fn_year="E04DLNSIY" fn_month="E04DLNSIM" fn_day="E04DLNSID" readonly="true" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Detalle Negociacion </h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"><div align="center"><b>Concepto</b></div></td>
            <td nowrap width="16%"><div align="center"><b>Endeudamiento</b></div></td>
            <td nowrap width="16%"><div align="center"><b>Porcentaje</b></div></td>
            <td nowrap width="16%"><div align="center"><b>Descuento</b></div></td>
            <td nowrap width="16%"><div align="center"><b>A Pagar</b></div></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Capital Total :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Capital Vencido :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Reintegro de Fondos :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAME" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPRE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCDE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTOE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Interes Vigente :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Interes Contingente :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Mora Vigente :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Mora Contingente :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Comisiones :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">IVA Comisiones :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Deducciones :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM9" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR9" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD9" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO9" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">IVA Deducciones :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAM0" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPR0" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCD0" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTO0" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">GAC :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAMA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPRA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCDA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTOA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">IVA GAC :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAMB" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPRB" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCDB" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTOB" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Cobranzas :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAMF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPRF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCDF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTOF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">IVA Cobranzas :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAMG" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPRG" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCDG" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTOG" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <%--
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Otros :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAMH" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPRH" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCDH" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="calculateConcepto(this);" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTOH" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Total Vencido :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAMI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPRI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCDI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTOI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
          --%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"><div align="right">Total Endeudado :</div></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNAMJ" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNPRJ" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNCDJ" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
            <td align="center" width="10%"><eibsinput:text name="datarec" property="E04DLNTOJ" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <% if (!readOnly) { %>
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>
	<% } else { %>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>     
	<% } %>
	  
</form>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555?SCREEN=401&E04DLNCUN=<%=userPO.getCusNum()%>&E04DLNOFN=<%=userPO.getPorfNum()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>  

<script type="text/javascript">

showNroCuotas(getElement("E04DLNTYP").value);

function showNroCuotas(simValue){
	// 3=PorCuota 
	if (simValue === "3"){
		getElement("divNroCuotasLabel").style.display= 'table-cell';
		getElement("divNroCuotas").style.display= 'table-cell';
	} else {
		getElement("divNroCuotasLabel").style.display= 'none';
		getElement("divNroCuotas").style.display= 'none';
	}
}

</script>
 
</body>
</HTML>
