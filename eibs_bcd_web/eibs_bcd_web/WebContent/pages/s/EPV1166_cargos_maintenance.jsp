<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.Entities"%> 

<html>
<head>
<title>Condiciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV116601Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script type="text/javascript">

$(document).ready(function() {
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

function tipoCondicion(){
  // tipoCondicion: 1=Avances 2=Compras 3=Transferencias
  if (document.getElementById("E01TYPAPC").value == ("1")) {
  }
  if (document.getElementById("E01TYPAPC").value == ("2")) {
  }
  if (document.getElementById("E01TYPAPC").value == ("3")) {
  }
  setRowColors("BASIC_TABLE");
}

function data(){
  tipoCondicion();
  setRowColors("BASIC_TABLE");
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
      readOnly = true;
    }
  }
  // Determina si es nuevo o mantencion
  if (userPO.getHeader20().equals("NEW")){
    newOnly = true;
  }
  if (request.getParameter("appType") != null) {
    // LN=Prestamos LR=PrestamosRenovaciones BG=Documentarias CP=CupoRotativo
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
        main = "Consulta de Condiciones";
    } else if (newOnly) {       
        main = "Nueva Condicion";
    } else {
        main = "Mantenimiento de Condiciones";  
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
  String emp = (String)session.getAttribute("EMPCU");
  emp = (emp == null) ? "" : emp;  //si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV0150
%>
<% if ("".equals(emp)){ %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cargos_maintenance.jsp, EPV1166"></h3>
<hr size="4">
<% } %>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1166" >
  <input type="hidden" name="SCREEN" id="SCREEN" value="600">
  <input type="hidden" name="BANCO" id="BANCO" value="<%= currUser.getE01UBK().trim()%>">
  <input type="hidden" name="appType" id="appType" value="<%=request.getParameter("appType")%>">
  <input type="hidden" name="H01FLGMAS" value="<%= datarec.getH01FLGMAS().trim()%>">

  <% int row = 0;row++;%>
 
  <% if ("".equals(emp)){ %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%" align="right"> Cliente :</td>
            <td nowrap width="10%" align="left">
              <eibsinput:text name="datarec" property="E01TYPCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Propuesta :</td>
            <td nowrap width="50%"align="left">
              <eibsinput:text name="datarec" property="E01TYPNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right">Sequencia :</td>
            <td nowrap width="10%" align="left">
              <eibsinput:text name="datarec" property="E01TYPSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } else { %>
  <input type="hidden" name="E01TYPCUN" value="<%=datarec.getE01TYPCUN()%>">
  <input type="hidden" name="E01TYPNUM" value="<%=datarec.getE01TYPNUM()%>">
  <input type="hidden" name="E01TYPSEQ" value="<%=datarec.getE01TYPSEQ()%>"> 
  <% } %>
   
  <% if ("".equals(emp)){ %>  
  <h4>Datos de la Tarjeta Alianza</h4>
  <% } %>    
  <table class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table id="BASIC_TABLE" cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="30%"><div align="right">Condicion :</div></td>
            <td width="70%">
              <select name="E01TYPAPC" id="E01TYPAPC" onchange="tipoCondicion();" <%=readOnly?"disabled":""%>>
              <%--
                <option value="1" <% if (datarec.getE01TYPAPC().equals("1")) out.print("selected");%>>AVANCES</option>
                <option value="2" <% if (datarec.getE01TYPAPC().equals("2")) out.print("selected");%>>COMPRAS</option>
                --%>
                <option value="3" <% if (datarec.getE01TYPAPC().equals("3")) out.print("selected");%>>TRANSFERENCIAS</option>
              </select>
            </td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="30%"><div align="right">Banco :</div></td>
            <td width="70%">
              <eibsinput:text property="E01TYPBNK" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="30%"><div align="right">Moneda :</div></td>
            <td width="70%">
              <eibsinput:help name="datarec" property="E01TYPCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" fn_param_one="E01TYPCCY" fn_param_two="document.forms[0].E01TYPBNK.value" readonly="<%=readOnly%>"/>
             
            </td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %> <%row++;%>'  id="codigoRow"> 
            <td width="30%" ><div align="right">Producto :</div></td>
            <td width="70%">
              <eibsinput:help name="datarec" property="E01TYPPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" fn_param_one="E01TYPPRO" fn_param_two="10" fn_param_three="document.forms[0].E01TYPBNK.value" fn_param_four="E01TYPNAR" readonly="<%=readOnly%>"/>
              <eibsinput:text property="E01TYPNAR" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true"/>
            </td>
          </tr>          
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="30%"><div align="right">Fuente de Recurso :</div></td>
            <td width="70%">
               <eibsinput:cnofc name="datarec" flag="RS" property="E01TYPRSC" fn_code="E01TYPRSC" fn_description="E01TYPRSD" readonly="<%=readOnly %>" />
			  <eibsinput:text  name="datarec" property="E01TYPRSD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true" />             
		<!--	<eibsinput:cnofc name="datarec" flag="RS" property="E01TYPRSC" fn_code="E01TYPRSC" fn_description="D01TYPRSC" required="true"/> -->            
             </td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="30%"><div align="right">Destino :</div></td>
            <td width="70%">
              <eibsinput:cnofc name="datarec" flag="DF" property="E01TYPDST" fn_code="E01TYPDST" fn_description="E01TYPDSD" readonly="<%=readOnly %>" />
			  <eibsinput:text  name="datarec" property="E01TYPDSD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true" />            
             </td>
          </tr>
          <!-- 
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="30%"><div align="right">Revolvente :</div></td>
            <td width="70%">
              <input type="radio" name="E01TYPREV" value="Y" <%=readOnly?"disabled":""%> <%if(datarec.getE01TYPREV().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="E01TYPREV" value="N" <%=readOnly?"disabled":""%> <%if(datarec.getE01TYPREV().equals("N")) out.print("checked");%>>No
            </td>
          </tr>
          <tr> 
          -->
            <td colspan="2"> 
              <h3 align="center">Cuenta Contable </h3>
              <table style="width: 100%">
                <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
                  <td width="40%"><div align="center">Concepto</div></td>
                  <td width="10%"><div align="center">Banco</div></td>
                  <td width="10%"><div align="center">Sucursal</div></td>
                  <td width="10%"><div align="center">Moneda</div></td>
                  <td width="15%"><div align="center">Referencia</div></td>
                  <td width="10%"></td>
                 
                </tr>
                <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
                  <td width="40%">
                  	<div align="center">
						<input type=text name="E01TYPOPC" value="<%= datarec.getE01TYPOPC().trim()%>" size="3" maxlength="3">
						<input type=HIDDEN name="E01TYPOGL" value="<%= datarec.getE01TYPOGL().trim()%>">
						<input type="text" name="E01TYPCON" size="35" maxlength="35" readonly value="<%= datarec.getE01TYPCON().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01TYPBNK.value, document.forms[0].E01TYPOCY.value,'E01TYPOGL','E01TYPOPC','10', 'CU')">
					</div>
                  </td>
                  <td width="10%">
                    <div align="center"> 
                      <input type="text" name="E01TYPOBK" size="2" maxlength="2" value="<%=datarec.getE01TYPOBK()%>" <%=readOnly?"readonly":""%> >
                    </div>
                  </td>
                  <td width="10%"> 
                    <div align="center"> 
                      <% if (readOnly) { %>
                      <input type="text" name="E01TYPOBR" size="4" maxlength="4" value="<%= datarec.getE01TYPOBR()%>" <%=readOnly?"readonly":""%> >
                      <% } else { %>
                      <input type="text" name="E01TYPOBR" size="4" maxlength="4" value="<%= datarec.getE01TYPOBR()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01TYPOBK.value,'','','','')" >
                      <% } %>
                    </div>
                  </td>
                  <td width="10%" > 
                    <div align="center">
                      <% if (readOnly) { %>
                      <input type="text" name="E01TYPOCY" size="3" maxlength="3" value="<%= datarec.getE01TYPOCY()%>" <%=readOnly?"readonly":""%> >
                      <% } else { %>
                      <input type="text" name="E01TYPOCY" size="3" maxlength="3" value="<%= datarec.getE01TYPOCY()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01TYPOBK.value,'','','','')" > 
                      <% } %>
                    </div>
                  </td>
                  <td width="15%" > 
                    <div align="center"> 
                      <% if (readOnly) { %>
                      <input type="text" name="E01TYPOAC" size="16" maxlength="16" value="<%= datarec.getE01TYPOAC()%>" <%=readOnly?"readonly":""%> >
                      <% } else { %>
                      <input type="text" name="E01TYPOAC" size="16" maxlength="16" value="<%= datarec.getE01TYPOAC()%>" class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01TYPBNK.value,'',document.forms[0].E01TYPCUN.value,'','RT')" >
                      <% } %>
                    </div>
                  </td>
                  <td width="10%"></td>
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
  window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1166?SCREEN=101&appType=<%=appType%>&E01TYPCUN=<%=userPO.getCusNum()%>&E01TYPNUM=<%=userPO.getPorfNum()%>';          
  cerrarVentana();
</script>
<% } %>  

<script type="text/javascript">
function setRowColors(table){
  $('#'+table+ ' tr:visible:odd').removeClass().addClass('trclear');
  $('#'+table+ ' tr:visible:even').removeClass().addClass('trdark'); 
}

</script>

</HTML>
