<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.Entities"%> 

<html>
<head>
<title>Cargos Adicionales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV116501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script type="text/javascript">

$( document ).ready(function() {
	showCobro(getElement("E01PVHTVA").value,true);
    setRowColors("BASIC_TABLE");
});

function goAction(op) {
  getElement("SCREEN").value = op;
  document.forms[0].submit();    
 }

function cerrarVentana(){
  window.open('','_parent','');
  window.close(); 
}

function TipoCargo(){
  // TipoCargo: 1=Impuesto 2=Comision 3=Deduccion 4=Iva
  if (document.getElementById("E01PVHAPC").value == ("2")) {
    document.getElementById("iva1").style.display = 'table-cell';
    document.getElementById("iva2").style.display = 'table-cell';
    document.getElementById("iva3").style.display = 'none';
    document.getElementById("iva4").style.display = 'none';
  } else if (document.getElementById("E01PVHAPC").value == ("3")) {
    document.getElementById("iva1").style.display = 'table-cell';
    document.getElementById("iva2").style.display = 'table-cell';
    document.getElementById("iva3").style.display = 'none';
    document.getElementById("iva4").style.display = 'none';
  } else if (document.getElementById("E01PVHAPC").value == ("1")){
    document.getElementById("iva1").style.display = 'none';
    document.getElementById("iva2").style.display = 'none';
    document.getElementById("iva3").style.display = 'table-cell';
    document.getElementById("iva4").style.display = 'table-cell';
  }else{
    document.getElementById("iva1").style.display = 'none';
    document.getElementById("iva2").style.display = 'none';
    document.getElementById("iva3").style.display = 'table-cell';
    document.getElementById("iva4").style.display = 'table-cell';
  }
    setRowColors("BASIC_TABLE");
    changeComHelpLink();
}

function changeComHelpLink(){
  if (getElement("E01PVHAPC").value == ("6")) {
  	$('#E01PVHCDE').siblings('a').attr("href", "javascript:GetBroker('E01PVHCDE','','N')");
  } else {
    $('#E01PVHCDE').siblings('a').attr("href", "javascript:GetCommDef('E01PVHCDE','E01PVHNAR')");
  }
}

function FormaPago(){
  // FormaPago: 1=Apertura/Renovacion 2=EnCuotas 3=TodasLasCuotas
  if (getElement("E01PVHPVI").value == ('1')) {
    getElement("c1").style.display = 'none';
    getElement("c2").style.display = 'none';
    getElement("c3").style.display = 'table-cell';
    getElement("c4").style.display = 'table-cell';
    getElement("medio").style.display = 'table-row';
    getElement("medio1").style.display = 'table-cell';
    getElement("medio2").style.display = 'table-cell';
    if (getElement("appType").value == ('BG')) {
      getElement("periodo").style.display = 'none';
    }
  } else if(getElement("E01PVHPVI").value == ('2')) {
    getElement("c1").style.display = 'table-cell';
    getElement("c2").style.display = 'table-cell';
    getElement("c3").style.display = 'none';
    getElement("c4").style.display = 'none';
    getElement("medio").style.display = 'none';
    getElement("medio1").style.display = 'none';
    getElement("medio2").style.display = 'none';
    if (getElement("appType").value == ('BG')) {
      getElement("periodo").style.display = 'table-cell';
    }
    
  } else if(getElement("E01PVHPVI").value == ('4')) {
    getElement("c1").style.display = 'none';
    getElement("c2").style.display = 'none';
    getElement("c3").style.display = 'table-cell';
    getElement("c4").style.display = 'table-cell';
    getElement("medio").style.display = 'table-row';
    getElement("medio1").style.display = 'table-cell';
    getElement("medio2").style.display = 'table-cell';
       
  } else if (getElement("E01PVHPVI").value == ('5')) {
    getElement("c1").style.display = 'none';
    getElement("c2").style.display = 'none';
    getElement("c3").style.display = 'table-cell';
    getElement("c4").style.display = 'table-cell';
    getElement("medio").style.display = 'table-row';
    getElement("medio1").style.display = 'table-cell';
    getElement("medio2").style.display = 'table-cell';
        
  } else {
    getElement("c1").style.display = 'none';
    getElement("c2").style.display = 'none';
    getElement("c3").style.display = 'table-cell';
    getElement("c4").style.display = 'table-cell';
    getElement("medio").style.display = 'none';
    getElement("medio1").style.display = 'none';
    getElement("medio2").style.display = 'none';
    if (getElement("appType").value == ('BG')) {
      getElement("periodo").style.display = 'none';
    }
  }
  setRowColors("BASIC_TABLE");
  MedioPago();
}

function MedioPago() {
  // FormaPago: 1=Apertura
  if (getElement("E01PVHPVI").value == ('1')) {
    // MedioPago: D=ConDesembolso A=CuentaCliente G=CuentaContable
    if (getElement("E01PVHMPG").value == ('A')) {
      getElement("cuenta1").style.display = 'table-cell';
      getElement("cuenta2").style.display = 'table-cell';
      getElement("cuenta3").style.display = 'none';
      getElement("cuenta4").style.display = 'none';
      getElement("cuenta5").style.display = 'none';
      getElement("cuenta6").style.display = 'none';
    } else if (getElement("E01PVHMPG").value == ('G')) {
      getElement("cuenta1").style.display = 'none';
      getElement("cuenta2").style.display = 'none';
      getElement("cuenta3").style.display = 'none';
      getElement("cuenta4").style.display = 'none';
      getElement("cuenta5").style.display = 'table-cell';
      getElement("cuenta6").style.display = 'table-cell';
    } else {
      getElement("cuenta1").style.display = 'none';
      getElement("cuenta2").style.display = 'none';
      getElement("cuenta3").style.display = 'table-cell';
      getElement("cuenta4").style.display = 'table-cell';
      getElement("cuenta5").style.display = 'none';
      getElement("cuenta6").style.display = 'none';
    }
  } else if (getElement("E01PVHPVI").value == ('4')) {
    // MedioPago: D=ConDesembolso A=CuentaCliente G=CuentaContable
    if (getElement("E01PVHMPG").value == ('A')) {
      getElement("cuenta1").style.display = 'table-cell';
      getElement("cuenta2").style.display = 'table-cell';
      getElement("cuenta3").style.display = 'none';
      getElement("cuenta4").style.display = 'none';
      getElement("cuenta5").style.display = 'none';
      getElement("cuenta6").style.display = 'none';
    } else if (getElement("E01PVHMPG").value == ('G')) {
      getElement("cuenta1").style.display = 'none';
      getElement("cuenta2").style.display = 'none';
      getElement("cuenta3").style.display = 'none';
      getElement("cuenta4").style.display = 'none';
      getElement("cuenta5").style.display = 'table-cell';
      getElement("cuenta6").style.display = 'table-cell';
    } else {
      getElement("cuenta1").style.display = 'none';
      getElement("cuenta2").style.display = 'none';
      getElement("cuenta3").style.display = 'table-cell';
      getElement("cuenta4").style.display = 'table-cell';
      getElement("cuenta5").style.display = 'none';
      getElement("cuenta6").style.display = 'none';
    } 
  
  } else if (getElement("E01PVHPVI").value == ('5')) {
    // MedioPago: D=ConDesembolso A=CuentaCliente G=CuentaContable
    if (getElement("E01PVHMPG").value == ('A')) {
      getElement("cuenta1").style.display = 'table-cell';
      getElement("cuenta2").style.display = 'table-cell';
      getElement("cuenta3").style.display = 'none';
      getElement("cuenta4").style.display = 'none';
      getElement("cuenta5").style.display = 'none';
      getElement("cuenta6").style.display = 'none';
    } else if (getElement("E01PVHMPG").value == ('G')) {
      getElement("cuenta1").style.display = 'none';
      getElement("cuenta2").style.display = 'none';
      getElement("cuenta3").style.display = 'none';
      getElement("cuenta4").style.display = 'none';
      getElement("cuenta5").style.display = 'table-cell';
      getElement("cuenta6").style.display = 'table-cell';
    } else {
      getElement("cuenta1").style.display = 'none';
      getElement("cuenta2").style.display = 'none';
      getElement("cuenta3").style.display = 'table-cell';
      getElement("cuenta4").style.display = 'table-cell';
      getElement("cuenta5").style.display = 'none';
      getElement("cuenta6").style.display = 'none';
    }
    
   } else {
    getElement("cuenta1").style.display = 'none';
    getElement("cuenta2").style.display = 'none';
    getElement("cuenta3").style.display = 'none';
    getElement("cuenta4").style.display = 'none';
    getElement("cuenta5").style.display = 'none';
    getElement("cuenta6").style.display = 'none';
  }
}

function data(){
  TipoCargo();
  FormaPago();
  setRowColors("BASIC_TABLE");
}

function editControl(status) {
	if (status != "Y") {
		return;
	}
	var editControlLst = ["E01PVHIVA"];
	if (isValidObject(opener.parent.document.getElementsByName("E01DLCFL6"))) {
		var radFG = opener.parent.document.getElementsByName("E01DLCFL6");
		var regFG = "N";
		for (var i = 0, length = radFG.length; i < length; i++ ) {
			if (radFG[i].checked)
				regFG = radFG[i].value;
		}
		if (regFG === "Y") {
			editControlLst.push("E01PVHFVA");
		}
	}
	if (editControlLst != null) {
		$.each(editControlLst, function(key, eleEdit) {
			if (isValidObject(eleEdit)){
				try {
					// readOnly true
					getElement(eleEdit).readOnly = true;
					// disable true for [INPUT]
					if (getElement(eleEdit).tagName == "INPUT") {
						$("input[name="+eleEdit+"]").attr('disabled', true);
						$("input[name="+eleEdit+"]").removeAttr("onmousedown").removeClass();
					} 
					// disable true for [SELECT]
					if (getElement(eleEdit).tagName == "SELECT") {
						$("select[name="+eleEdit+"]").attr('disabled', true);
					} 
					// display none for [IMG]
					if (getElement(eleEdit).tagName == "IMG") {
						getElement(eleEdit).style.display = 'none';
					} 
					// remove Help Link
					var fndHelp = $('a[href*='+eleEdit+']');
					$(fndHelp).each(function(key, eleLink) {
						$(this).remove();
						return false;
					});
				}
				catch (err) {
				}
			}
		});
	}
}

</script>


</head>

<%
  boolean readOnly = false;
  boolean maintenance = false;
  boolean newOnly = false;
  String appType = "";
  
  // Determina si es solo lectura
  if (request.getParameter("readOnly") != null ){
    if (request.getParameter("readOnly").toLowerCase().equals("true")){
      readOnly=true;
    }
  }
  
  // Determina si es nuevo o mantencion
  if (userPO.getHeader20().equals("NEW")){
    newOnly=true;
  }

  if (request.getParameter("appType") != null) {
    // LN=Prestamos LR=PrestamosRenovaciones BG=Documentarias CP=Credilineas
    appType = request.getParameter("appType");
  }

%>

<body onload="data();">
<%

  if (!error.getERRNUM().equals("0")) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("       showErrors()");
    out.println("</SCRIPT>");
  }
  
    String main = "";
    if (readOnly) {
        main = "Consulta de Cargos Adicionales";
    } else if (newOnly) {       
        main = "Nuevo Cargo Adicional";
    } else {
        main = "Mantenimiento de Cargos Adicionales";  
    }

    String title = "";
    if (appType.equals("LN")) {
        title = "Prestamos";
    } else if (appType.equals("LR")){
        title = "Renovaciones";
    } else if (appType.equals("LS")){
        title = "Prestamos Simulacion";
    } else if (appType.equals("BG")){
        title = "Documentarias";
    } else if (appType.equals("CP")){
        title = "Cupo Rotativo";
    } else {
        title = "Genericas";
    }
    
%>

<h3 align="center">
<%=main%> <%=title%>
<% 
  String emp = (String)session.getAttribute("EMPCA");
  emp = (emp == null) ? "" : emp;  //si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV0150
%>
<% if ("".equals(emp)){ %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cargos_maintenance.jsp, EPV1165"></h3>
<hr size="4">
<% } %>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165" >
  <input type="hidden" name="SCREEN" id="SCREEN" value="600">
  <input type="hidden" name="BANCO" id="BANCO" value="<%= currUser.getE01UBK().trim()%>">
  <input type="hidden" name="appType" id="appType" value="<%=request.getParameter("appType")%>">
  <input type="hidden" name="E01PVHRF1" id="E01PVHRF1" value="<%=request.getParameter("E01PVHRF1")%>">
  <input type="hidden" name="H01FLGMAS" value="<%= datarec.getH01FLGMAS().trim()%>">
  <input type="hidden" name="E01PVHIVP" value="<%= datarec.getE01PVHIVP().trim()%>">
  <input type="hidden" name="E01PVHIVB" value="<%= datarec.getE01PVHIVB().trim()%>">

  <% int row = 0;row++;%>
 
  <% if ("".equals(emp)){ %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%" align="right"> Cliente :</td>
            <td nowrap width="10%" align="left">
              <eibsinput:text name="datarec" property="E01PVHCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Propuesta :</td>
            <td nowrap width="50%"align="left">
              <eibsinput:text name="datarec" property="E01PVHNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right">Sequencia :</td>
            <td nowrap width="10%" align="left">
              <eibsinput:text name="datarec" property="E01PVHSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } else { %>
  <input type="hidden" name="E01PVHCUN" value="<%=datarec.getE01PVHCUN()%>">
  <input type="hidden" name="E01PVHNUM" value="<%=datarec.getE01PVHNUM()%>">
  <input type="hidden" name="E01PVHSEQ" value="<%=datarec.getE01PVHSEQ()%>"> 
  <% } %>
   
  <% if ("".equals(emp)){ %>  
  <h4>Datos de la Tarjeta Alianza</h4>
  <% } %>    
  <table class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table id="BASIC_TABLE" cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Tipo Cargo :</div></td>
            <td width="30%">
              <select name="E01PVHAPC" id="E01PVHAPC" onchange="TipoCargo();" <%=readOnly?"disabled":""%>>
                <option value=" " <% if (datarec.getE01PVHAPC().equals(" ")) out.print("selected");%>></option>
                <option value="1" <% if (datarec.getE01PVHAPC().equals("1")) out.print("selected");%>>IMPUESTO</option>
                <option value="2" <% if (datarec.getE01PVHAPC().equals("2")) out.print("selected");%>>COMISION</option>
                <option value="6" <% if (datarec.getE01PVHAPC().equals("6")) out.print("selected");%>>NOTARIOS</option>
                <option value="7" <% if (datarec.getE01PVHAPC().equals("7")) out.print("selected");%>>OTROS</option>
              </select>
            </td>
            <td width="20%" ></td>
            <td width="30%" ></td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %> <%row++;%>'  id="codigoRow"> 
            <td width="20%" >
            	<div align="right">Codigo Cargo :</div></td>
            <td width="30%">
            	<% if(!datarec.getE01PVHAPC().equals("6")){%>
	              <eibsinput:help name="datarec" property="E01PVHCDE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COMMISSION%>" fn_param_one="E01PVHCDE" fn_param_two="E01PVHNAR" readonly="<%=readOnly%>"/>
            	<% } else { %>
	             <eibsinput:help name="datarec" property="E01PVHCDE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" fn_param_one="E01PVHCDE" fn_param_two="" fn_param_three="N" readonly="<%=readOnly%>" />
            	<% } %>
            </td>
            <td width="20%" ></td>
            <td width="30%" ></td>    
          </tr>          
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Descripcion :</div></td>
            <td width="30%">
              <eibsinput:text property="E01PVHNAR" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly%>"/>
            </td>
            <td width="20%"></td>
            <td width="30%"></td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Base Calculo:</div></td>
            <td width="30%">
              <select name="E01PVHBSC" id="E01PVHBSC" <%=readOnly?"disabled":""%>>
                <option value=" " <% if (!(datarec.getE01PVHBSC().equals("O") || datarec.getE01PVHBSC().equals("B") || datarec.getE01PVHBSC().equals("I") ||  
                							datarec.getE01PVHBSC().equals("T") || datarec.getE01PVHBSC().equals("P"))) out.print("selected");%>> </option>
                <option value="O" <% if (datarec.getE01PVHBSC().equals("O")) out.print("selected");%>>Monto Original</option>
                <option value="B" <% if (datarec.getE01PVHBSC().equals("B")) out.print("selected");%>>Saldo Capital</option>
                <% if (!appType.equals("BG")) { %>
                <option value="I" <% if (datarec.getE01PVHBSC().equals("I")) out.print("selected");%>>Saldo Teorico</option>
                <option value="T" <% if (datarec.getE01PVHBSC().equals("T")) out.print("selected");%>>Total Deuda</option>
                <% } %>
                <% if (appType.equals("BG")) { %>
                <option value="P" <% if (datarec.getE01PVHBSC().equals("P")) out.print("selected");%>>Comision Principal</option>
                <% } %>
              </select>
            </td>
            <td width="20%"></td>
            <td width="30%"></td>
          </tr>  
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Factor Calculo:</div></td>
            <td width="30%">
              <%-- <select name="E01PVHTVA" id="E01PVHTVA" onchange="showCobro(this.value)" <%=readOnly?"disabled":""%>> --%>
              <select name="E01PVHTVA" id="E01PVHTVA" onchange="showCobro(this.value)" disabled >
                <option value=" " <% if (!(datarec.getE01PVHTVA().equals("F") || datarec.getE01PVHTVA().equals("P") || datarec.getE01PVHTVA().equals("1"))) out.print("selected");%>> </option>
                <option value="F" <% if (datarec.getE01PVHTVA().equals("F")) out.print("selected");%>>Monto Fijo</option>
                <option value="P" <% if (datarec.getE01PVHTVA().equals("P")) out.print("selected");%>>Porcentaje</option>
                <% if (!appType.equals("BG")) { %>
                <option value="1" <% if (datarec.getE01PVHTVA().equals("1")) out.print("selected");%>>Tasa/Periodo</option>
                <% } %>
              </select>            </td>
            <td width="20%"></td>
            <td width="30%"></td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td nowrap width="20%"> 
              <div align="right" id="divCobroTitle">Valor Comision :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left" id="FIJO" style="display: none"> 
				<input type="text" class="txtright" name="E01PVHFVA" size="17" maxlength="15"  value="<%= datarec.getE01PVHFVA() %>" onchange="setMonto()" <%=readOnly?"readonly=\"readonly\"":""%>>
              </div>
            </td>
            <td nowrap width="20%"></td>
            <td nowrap width="30%" ></td>
          </tr>          
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Valor de Cargo:</div></td>
            <td width="30%">
              <eibsinput:text property="E01PVHAMT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </td>
            <td nowrap width="20%" id="iva1" style="display: none"> 
              <div align="right">Aplica IVA :</div>
            </td>
            <td nowrap width="30%" id="iva2" style="display: none"> 
              <input type="radio" name="E01PVHIVA" value="Y" <%if(datarec.getE01PVHIVA().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="E01PVHIVA" value="N" <%if(datarec.getE01PVHIVA().equals("N")) out.print("checked");%>>No
            </td>
            <td width="20%" id="iva3" style="display: block"></td>
            <td width="30%" id="iva4" style="display: block"></td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Forma de pago :</div></td>
            <td width="30%">
              <select name="E01PVHPVI" id="E01PVHPVI" <%=readOnly?"disabled":""%> onchange="FormaPago();">
                <option value=""></option>
                <option value="1" <% if (datarec.getE01PVHPVI().equals("1")) out.print("selected");%>><%=!appType.equals("LR") ? "Apertura" : "Renovacion"%></option>
                <% if (!appType.equals("CP")) { %>
                <option value="2" <% if (datarec.getE01PVHPVI().equals("2")) out.print("selected");%>><%=!appType.equals("BG") ? "En Cuotas" : "Plan de Pagos"%></option>
                <% } %>
                <% if (appType.equals("LN") || appType.equals("LR") || appType.equals("LS")) { %>
                <option value="3" <% if (datarec.getE01PVHPVI().equals("3")) out.print("selected");%>>Todas las Cuotas</option>
                <% } %>
                <% if (appType.equals("LN") || appType.equals("LR") || appType.equals("LS")) { %>
                <option value="4" <% if (datarec.getE01PVHPVI().equals("4")) out.print("selected");%>><%=!appType.equals("LR") ? "Apertura y Cuotas" : "Renovacion y Cuotas"%></option>
                <% } %>
                <% if (appType.equals("LN") || appType.equals("LR") || appType.equals("LS")) { %>
                <option value="5" <% if (datarec.getE01PVHPVI().equals("5")) out.print("selected");%>><%=!appType.equals("LR") ? "Apertura Periodica" : "Renovacion Periodica"%></option>
                <% } %>
              </select>
            </td>
            <td width="20%" id="c1" style="display: none"><div align="right">Numero de Cuotas :</div></td>
            <td width="30%" id="c2" style="display: none">
              <eibsinput:text property="E01PVHNCU" name="datarec" size="6" maxlength="5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" readonly="<%=readOnly%>"/>
            </td>
            <td width="20%" id="c3" style="display: block"></td>
            <td width="30%" id="c4" style="display: block"></td>
          </tr>
          <% if (appType.equals("BG")) { %>
          <tr id="periodo" style="display: none" class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"></td>
            <td width="30%"></td>
            <td width="20%" ><div align="right">Frecuencia de Pago :</div></td>
            <td width="30%" >
              <select name="E01PVHNPR" <%=readOnly?"disabled":""%> >
                <option value="030" <% if (!(datarec.getE01PVHNPR().equals("30")||datarec.getE01PVHNPR().equals("60")||datarec.getE01PVHNPR().equals("90")||datarec.getE01PVHNPR().equals("180")||datarec.getE01PVHNPR().equals("360"))) out.print("selected"); %>>Mensual</option>
                <option value="060" <% if(datarec.getE01PVHNPR().equals("60")) out.print("selected");%>>Bimensual</option>
                <option value="090" <% if(datarec.getE01PVHNPR().equals("90")) out.print("selected");%>>Trimestral</option>
                <option value="180" <% if(datarec.getE01PVHNPR().equals("180")) out.print("selected");%>>Semestral</option>
                <option value="360" <% if(datarec.getE01PVHNPR().equals("360")) out.print("selected");%>>Anual</option>
              </select>
            </td>
          </tr>
          <% } %>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" id="medio" style="display: none"> 
            <td width="20%" id="medio1" style="display: none;">  
              <div align="right">Medio de Pago :</div>
            </td>
            <td width="30%" id="medio2" style="display: none;"> 
              <select name="E01PVHMPG" id="E01PVHMPG" onchange="MedioPago();" <%=readOnly ? "disabled" : ""%>>
                <option value=""></option>
                <% if (appType.equals("LN") || appType.equals("LS")) { %>
                <option value="D" <%if (datarec.getE01PVHMPG().equals("D")) { out.print("selected"); }%>>Con Desembolso</option>
                <% } %>
                <option value="A" <%if (datarec.getE01PVHMPG().equals("A")) { out.print("selected"); }%>>Cuenta Cliente</option>
                <option value="G" <%if (datarec.getE01PVHMPG().equals("G")) { out.print("selected"); }%>>Cuenta Contable</option>
              </select>
            </td>
            <td width="20%" id="cuenta1" style="display: none;"><div align="right">Cuenta de Pago :</div></td>
            <td width="30%" id="cuenta2" style="display: none;"> 
              <eibsinput:help property="E01PVHMAC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" fn_param_one="E01PVHMAC" fn_param_two="document.forms[0].BANCO.value" fn_param_three="RT" readonly="<%=readOnly %>" fn_param_five="${datarec.E01PVHCUN}" />
            </td>
            <td width="20%" id="cuenta3" style="display: block;"></td>
            <td width="30%" id="cuenta4" style="display: block;"></td>
            <td width="20%" id="cuenta5" style="display: none;"><div align="right">Cuenta de Pago :</div></td>
            <td width="30%" id="cuenta6" style="display: none;" nowrap="nowrap"> 
              <eibsinput:text name="datarec" property="E01PVHMBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="<%=readOnly %>" />
              <eibsinput:help name="datarec" property="E01PVHMBR" fn_param_one="E01PVHMBR" fn_param_two="document.forms[0].E01PVHMBK.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>"  readonly="<%=readOnly %>" />
              <eibsinput:help name="datarec" property="E01PVHMCY" fn_param_one="E01PVHMCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="<%=readOnly %>" />
              <eibsinput:help name="datarec" property="E01PVHMGL" fn_param_one="E01PVHMGL" fn_param_two="document.forms[0].E01PVHMBK.value" fn_param_three="document.forms[0].E01PVHMCY.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="<%=readOnly %>" />
            </td>
          </tr>
          <tr> 
            <td colspan="4"> 
              <h3 align="center">Cuenta Contable Credito </h3>
              <table style="width: 100%">
                <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
                  <td width="20%"></td>
                  <td width="10%"><div align="center">Banco</div></td>
                  <td width="10%"><div align="center">Sucursal</div></td>
                  <td width="10%"><div align="center">Moneda</div></td>
                  <td width="15%"><div align="center">Cuenta Contable</div></td>
                  <td width="15%"><div align="center">Referencia</div></td>
                  <td width="10%"></td>
                  <td width="10%"></td>
                </tr>
                <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
                  <td width="20%"></td>
                  <td width="10%">
                    <div align="center"> 
                      <input type="text" name="E01PVHOBK" size="2" maxlength="2" value="<%=datarec.getE01PVHOBK()%>" <%=readOnly?"readonly":""%> >
                    </div>
                  </td>
                  <td width="10%"> 
                    <div align="center"> 
                      <% if (readOnly) { %>
                      <input type="text" name="E01PVHOBR" size="4" maxlength="4" value="<%= datarec.getE01PVHOBR()%>" <%=readOnly?"readonly":""%> >
                      <% } else { %>
                      <input type="text" name="E01PVHOBR" size="4" maxlength="4" value="<%= datarec.getE01PVHOBR()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01PVHOBK.value,'','','','')" >
                      <% } %>
                    </div>
                  </td>
                  <td width="10%" > 
                    <div align="center">
                      <% if (readOnly) { %>
                      <input type="text" name="E01PVHOCY" size="3" maxlength="3" value="<%= datarec.getE01PVHOCY()%>" <%=readOnly?"readonly":""%> >
                      <% } else { %>
                      <input type="text" name="E01PVHOCY" size="3" maxlength="3" value="<%= datarec.getE01PVHOCY()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01PVHOBK.value,'','','','')" > 
                      <% } %>
                    </div>
                  </td>
                  <td width="15%" > 
                    <div align="center"> 
                      <% if (readOnly) { %>
                      <input type="text" name="E01PVHOGL" size="16" maxlength="16" value="<%= datarec.getE01PVHOGL()%>" <%=readOnly?"readonly":""%> >
                      <% } else { %>
                      <input type="text" name="E01PVHOGL" size="16" maxlength="16" value="<%= datarec.getE01PVHOGL() %>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01PVHOBK.value,document.forms[0].E01PVHOCY.value,'','','')" >
                      <% } %>
                    </div>
                  </td>
                  <td width="15%" > 
                    <div align="center"> 
                      <% if (readOnly) { %>
                      <input type="text" name="E01PVHOAC" size="16" maxlength="16" value="<%= datarec.getE01PVHOAC()%>" <%=readOnly?"readonly":""%> >
                      <% } else { %>
                      <input type="text" name="E01PVHOAC" size="16" maxlength="16" value="<%= datarec.getE01PVHOAC()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01PVHOBK.value,'','','','RT')" >
                      <% } %>
                    </div>
                  </td>
                  <td width="20%"></td>
                </tr>
              </table>
            </td>
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
  
<% if ("S".equals(request.getAttribute("ACT"))){ %>
<script type="text/javascript">
  window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&appType=<%=appType%>&E01PVHCUN=<%=userPO.getCusNum()%>&E01PVHNUM=<%=userPO.getPorfNum()%>';          
  cerrarVentana();
</script>
<% } %>  

<script type="text/javascript">
function setRowColors(table){
    $('#'+table+ ' tr:visible:odd').removeClass().addClass('trclear');
	$('#'+table+ ' tr:visible:even').removeClass().addClass('trdark'); 
}

function showCobro(payvalue,firstTime){
	if(payvalue === "P" || payvalue === "1"){
		getElement("divCobroTitle").innerHTML= '% Comision';
		getElement("FIJO").style.display= 'block';
		if(firstTime != true)getElement("E01PVHAMT").value = "0.000000" ;
	}else{
		getElement("divCobroTitle").innerHTML= 'Valor Fijo :';
		getElement("FIJO").style.display= 'block';
	}
    setRowColors("BASIC_TABLE");
}

function setMonto(){
	var payType = getElement("E01PVHTVA").value ;
	if(payType === "F"){
		getElement("E01PVHAMT").readOnly = true;
		getElement("E01PVHFVA").value = formatCCY(getElement("E01PVHFVA").value);	
		getElement("E01PVHAMT").value = getElement("E01PVHFVA").value ;
	}else{
		getElement("E01PVHAMT").readOnly = true;
	}	
	
}

<%if(readOnly){%>
$('#E01PVHMAC').addClass('context-menu-inq').attr('onmousedown', "init(inqAccount, this.value)");
$('head').append('<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css">');
<% } %>
</script>

<script type="text/javascript">
$( document ).ready(function() {
	editControl('<%=userPO.getHeader4()%>');
});
</script>

</body>
</HTML>
