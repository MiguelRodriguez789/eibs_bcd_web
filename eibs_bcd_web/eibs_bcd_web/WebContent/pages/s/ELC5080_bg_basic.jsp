<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.*" %>
<%@page import="com.datapro.constants.EibsFields" %>
<%@page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Documentarias</title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "datarec" class= "datapro.eibs.beans.ELC508001Message"  scope="session" /> 
<jsp:useBean id= "garantizaBean" class= "datapro.eibs.beans.ELC500006Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script type="text/javascript">

  function submitPage(button) {
    getElement("FLGEXI").value = "";
    if (button.name == "Exit") {
      getElement("FLGEXI").value = "Y";
    }
    button.disabled = true;
    document.forms[0].submit();
  }

  function formaPago(){
    if (document.getElementById("E01LCMFLC").value == ("1")) {
      document.getElementById("lblAutoCuenta").style.display = 'block';
      document.getElementById("inpAutoCuenta").style.display = 'block';
    } else {
      document.getElementById("lblAutoCuenta").style.display = 'none';
      document.getElementById("inpAutoCuenta").style.display = 'none';
    }
  }

  function resetMatDte(){
    getElement('E01LCMEXM').value = 0;
    getElement('E01LCMEXD').value = 0;
    getElement('E01LCMEXY').value = 0;
  }

  function resetTermino(){
    getElement('E01LCMPOQ').value = 0;
    getElement('E01LCMTNR').value = '';
  }

  function UpdateFlag(val) {
    getElement("E01FLGRCL").value = (val) ? "X" : "";
  }
  
  <% if (userPO.getPurpose().equals("INQUIRY") ) {   %>
  builtNewMenu(bg_i_opt);
  initMenu();
  <% } %>

</script>

<%
  String FLGNEW = datarec.getE01FLGNEW().trim();
  String FLGPLN = datarec.getE01FLGPLN().trim();
  
  boolean readOnly = false;
  boolean readOnlyNew = false;
  boolean readOnlyRenewal = false;
  boolean readOnlyAll = false;
  
  if (!FLGNEW.equals("N")) {
    readOnlyNew = true;
  }
  
  if ((!userPO.getPurpose().equals("NEW")) && (!userPO.getPurpose().equals("MAINTENANCE"))) { 
    readOnly = true;
    readOnlyNew = true;
  }

  if (!userPO.getPurpose().equals("RENEWAL")) { 
    readOnlyRenewal = true;
  }
    
  if (userPO.getPurpose().equals("INQUIRY")) { 
    readOnlyAll = true;
  }
    
%>

</head>
<body>

<% 
  if (!error.getERRNUM().equals("0")) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println(" showErrors()");
    out.println("</SCRIPT>");
  }  
  
  String main = "";
  if (userPO.getPurpose().equals("NEW")) {
      main = "Ingreso Documentarias";
  } else if (userPO.getPurpose().equals("MAINTENANCE")) {       
      main = "Mantenimiento de Documentarias";
  } else if (userPO.getPurpose().equals("APPROVAL")) {       
      main = "Aprobacion de Documentarias";
  } else if (userPO.getPurpose().equals("RENEWAL")) {       
      main = "Prorroga de Documentarias";
  } else {
      main = "Consulta de Documentarias";  
  }
  
%> 

<h3 align="center">
<%=main%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_basic.jsp, ELC5080"></h3>
<hr size="4">

<form METHOD="post"  name="firstForm" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5080">
  <input type="hidden" name="SCREEN" id="SCREEN" value="301"> 
  <input type="hidden" name="FLGEXI" id="FLGEXI" value="">
  <input type="hidden" name="E01LCMACC" id="E01LCMACC" value="<%=datarec.getE01LCMACC()%>">
  <input type="hidden" name="E01LCMACD" id="E01LCMACD" value="<%=datarec.getE01LCMACD()%>">
  <input type="hidden" name="E01LCMGLN" id="E01LCMGLN" value="<%=datarec.getE01LCMGLN()%>">
  <input type="hidden" name="E01LCMTYP" id="E01LCMTYP" value="<%=datarec.getE01LCMTYP()%>">
  <input type="hidden" name="E01LCMOFN" id="E01LCMOFN" value="<%=datarec.getE01LCMOFN()%>">
  <input type="hidden" name="E01FLGNEW" id="E01FLGNEW" value="<%=datarec.getE01FLGNEW()%>">
  <input type="hidden" name="E01FLGPLN" id="E01FLGPLN" value="<%=datarec.getE01FLGPLN()%>">
  <input type="hidden" name="E01FLGRCL" id="E01FLGRCL" value="">
  <input type="hidden" name="E01DSCPRO" id="E01DSCPRO" value="<%=datarec.getE01DSCPRO()%>">

  <% int row = 1; %>

  <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=datarec.getE01PENDAP()%></b></td>
      <td width="5%"><h4>&nbsp;</h4></td>
    </tr>
  </table>

  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
            <td nowrap width="10%" > 
              <div align="left">
                <eibsinput:text property="E01LCMCUN" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
            <td nowrap width="35%"> 
              <div align="left">
                <eibsinput:text property="E01APLNME" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
            <td nowrap width="20%"> 
              <div align="left">
                <eibsinput:text property="E01LCMATY" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
            <td nowrap width="10%"> 
              <div align="left"> 
                <input type="text" name="E01LCMACC" size="14" maxlength="12" value="<% if (datarec.getE01LCMACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(datarec.getE01LCMACC().trim()); %>" readonly >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
                <eibsinput:text property="E01LCMCCY" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <eibsinput:text property="E01LCMPRO" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <% if (!userPO.getPurpose().equals("RENEWAL")){ %>
  <h4>Cotitulares/Avales</h4>
  <table id="mainTable" class="tableinfo" style="height:106px;">
    <tr height="5%"> 
      <td nowrap valign="top" width="100%"> 
        <table id="headTable" width="98%">
          <tr id="trdark">
            <th nowrap width="15%" align="center">Nro Cliente</th>
            <th nowrap width="45%" align="center">Nombre</th>
            <th nowrap width="15%" align="center">Identificacion</th>
            <th nowrap width="10%" align="center">Relacion</th>
            <th nowrap width="15%" align="center">Porcentaje</th>
          </tr>
        </table>
      </td>
    </tr>    
    <tr  height="95%">    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="height:106px; overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <% for (int i=1;i<10;i++) { %> 
            <tr id="trclear"> 
              <td nowrap width="15%" align="center"><%=i%>
                <input type=text name="<%="E01TACUN"+i%>" size="10" maxlength="9" value="<%=datarec.getFieldString("E01TACUN"+i)%>" class="<%=readOnly?"":"context-menu-help"%>" onmousedown="init(custdescidHelp,this.name,'','','E01TANME<%= i %>','E01TAIDN<%= i %>','')" onKeyPress="enterInteger(event)" <%=readOnly?"readonly":""%> <%=datarec.getFieldString("F01TACUN"+i).equals("Y")?"class=\"txtchanged\"":""%> >  
              </td>
              <td nowrap width="45%" align="center"> 
                <input type="text" name="<%="E01TANME"+i %>" size="60" maxlength="60" value="<%=datarec.getFieldString("E01TANME"+i) %>" readonly <%=datarec.getFieldString("F01TANME"+i).equals("Y")?"class=\"txtchanged\"":""%>> 
              </td>
              <td nowrap width="15%" align="center"> 
                <input type="text" name="<%="E01TAIDN"+i %>" size="28" maxlength="25" value="<%=datarec.getFieldString("E01TAIDN"+i) %>" readonly <%=datarec.getFieldString("F01TAIDN"+i).equals("Y")?"class=\"txtchanged\"":""%> >  
              </td>
              <td nowrap width="10%" align="center"> 
                <input type="text" name="<%="E01TAREL"+i %>" size="2" maxlength="1" value="<%=datarec.getFieldString("E01TAREL"+i) %>" class="<%=readOnly?"":"context-menu-help"%>" onmousedown="init(accholdersHelp,this.name,'','','','','')" <%=readOnly?"readonly":""%> <%=datarec.getFieldString("F01TAREL"+i).equals("Y")?"class=\"txtchanged\"":""%> >  
              </td>
              <td nowrap width="15%" align="center"> 
                <input type="text" name="<%="E01TAPRC"+i %>" size="7" maxlength="6" value="<%=datarec.getFieldString("E01TAPRC"+i) %>" class="txtright" onKeyPress="enterInteger(event)" <%=readOnly?"readonly":""%> >  
              </td>
            </tr> 
          <% } %>
          </table>
        </div>
      </td>
    </tr>
  </table>
  <% } %>

  <% if (!datarec.getE01STATUS().equals("")){ %>
  <div>&nbsp;</div>
  <table class=tbenter>
    <tr > 
      <td nowrap> 
        <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4>
      </td>
      <td nowrap align=left></td>
      <td nowrap align=right> 
        <b>ESTADO :</b>
      </td>
      <td nowrap> 
        <b><font color="#ff6600"><%=datarec.getE01STATUS().trim()%></font></b>
      </td>
    </tr>
  </table>
  <% } else { %>
    <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4>
  <% } %>
  
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Fecha de Apertura :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:date name="datarec" fn_month="E01LCMODM" fn_day="E01LCMODD" fn_year="E01LCMODY" modified="F01LCMODM;F01LCMODD;F01LCMODY" readonly="<%=readOnlyNew%>" />
            </td>
            <td nowrap width="25%"><div align="right">Tipo de Documento :</div></td>
            <td nowrap width="25%"> 
              <select name="E01APCREL" disabled>
                <option value=" " <%if (datarec.getE01APCREL().equals(" ")) { out.print("selected"); }%> >General </option>
                <option value="1" <%if (datarec.getE01APCREL().equals("1")) { out.print("selected"); }%> >Aval Bancario </option>
                <option value="2" <%if (datarec.getE01APCREL().equals("2")) { out.print("selected"); }%> >Garant&iacute;a Bancaria </option>
                <option value="3" <%if (datarec.getE01APCREL().equals("3")) { out.print("selected"); }%> >Aceptaci&oacute;n Bancaria </option>
                <option value="4" <%if (datarec.getE01APCREL().equals("4")) { out.print("selected"); }%> >Cupo Exigible </option>
              </select>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">T&eacute;rmino :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text property="E01LCMPOQ" name="datarec" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" modified="F01LCMPOQ" onchange="javascript:resetMatDte();" readonly="<%=readOnlyNew%>" />
              <% if (readOnlyNew) { %>  
              <input type="hidden" name="E01LCMTNR" id="E01LCMTNR" value="<%=datarec.getE01LCMTNR()%>">
              <% } %>    
              <select name="E01LCMTNR" onchange="javascript:resetMatDte();" <%=readOnlyNew?"disabled":""%> >
                <option value=" " <% if (!(datarec.getE01LCMTNR().equals("D") || datarec.getE01LCMTNR().equals("M")||datarec.getE01LCMTNR().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(datarec.getE01LCMTNR().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(datarec.getE01LCMTNR().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(datarec.getE01LCMTNR().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%"><div align="right">Banco/Sucursal :</div></td>
            <td nowrap width="25%"> 
                <eibsinput:text property="E01LCMBNK" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" modified="F01LCMBNK" readonly="<%=readOnlyNew%>" />
                <eibsinput:help name="datarec" fn_param_one="E01LCMBRN" fn_param_two="''" property="E01LCMBRN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true" modified="F01LCMBRN" readonly="<%=readOnlyNew%>" />
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Fecha Vencimiento :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:date name="datarec" fn_month="E01LCMEXM" fn_day="E01LCMEXD" fn_year="E01LCMEXY" onchange="javascript:resetTermino();" modified="F01LCMEXM;F01LCMEXD;F01LCMEXY" readonly="<%=readOnlyNew%>" />
            </td>
            <td nowrap width="25%"><div align="right">Centro de Costo : </div></td>
            <td nowrap width="25%"> 
              <input type="text" name="E01LCMCCN" size="8" maxlength="8" value="<%= datarec.getE01LCMCCN().trim()%>">
              <% if (!readOnly) { %>  
              <a href="javascript:GetCostCenter('E01LCMCCN',document.forms[0].E01LCMBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
              <% } %>    
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Monto :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text property="E01LCMOAM" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" modified="F01LCMOAM" readonly="<%=readOnlyNew%>" />
            </td>
            <td nowrap width="25%"><div align="right">Tabla de Cargos :</div></td>
            <td nowrap width="25%"> 
              <input type="text" name="E01LCMTAR" size="3" maxlength="2" value="<%= datarec.getE01LCMTAR().trim()%>" <%=readOnly?"readonly":""%> >
		      <% if (!userPO.getPurpose().equals("RENEWAL")){ %>  
		      <%   if (userPO.getPurpose().equals("NEW") || (userPO.getPurpose().equals("MAINTENANCE"))){ %>  
              	<a href="javascript:GetLoanChargeTable('E01LCMTAR',document.forms[0].E01LCMATY.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
			  <%   } %>
              <b>&nbsp; &nbsp; Personalizar</b>
		      <%   if (!userPO.getPurpose().equals("NEW") && (!userPO.getPurpose().equals("MAINTENANCE"))){ %>  
	            <a href="javascript: setComissionTable('true')"><img src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
              <%   } else { %>
	            <a href="javascript: setComissionTable('false')"><img src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
              <%   } %>
              <% } %>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Pagare Diligenciado :</div></td>
            <td nowrap width="25%"> 
              <input type="hidden" name="E01LCMFL3" value="<%=datarec.getE01LCMFL3()%>" readonly >
              <input type="radio"  name="CE01LCMFL3" value="Y" onClick="document.forms[0].E01LCMFL3.value = 'Y'" <%if(datarec.getE01LCMFL3().equals("Y"))  out.print("checked");%> <%=readOnly?"disabled":""%> >S&iacute; 
              <input type="radio"  name="CE01LCMFL3" value="N" onClick="document.forms[0].E01LCMFL3.value = 'N'" <%if(!datarec.getE01LCMFL3().equals("Y")) out.print("checked");%> <%=readOnly?"disabled":""%> >No 
            </td>
            <td nowrap width="25%"><div align="right">Línea de Cr&eacute;dito :</div></td>
            <td nowrap width="25%"> 
              <% if (!readOnly) { %>  
              <input type="text" name="E01LCMLNR" size="9" maxlength="9" value="<%= datarec.getE01LCMLNR().trim()%>" >
              <input type="text" name="E01LCMCMN" size="4" maxlength="4" value="<%= datarec.getE01LCMCMN().trim()%>" >
	              <a href="javascript:GetCreditLine('E01LCMCMN',document.forms[0].E01LCMLNR.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
              <% } else { %>
              <input type="text" name="E01LCMLNR" size="9" maxlength="9" value="<%= datarec.getE01LCMLNR().trim()%>" readonly="readonly"  >
              <input type="text" name="E01LCMCMN" size="4" maxlength="4" value="<%= datarec.getE01LCMCMN().trim()%>" readonly="readonly"  >
              <% } %>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <% if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("RENEWAL")){ %>  
  <h4>Información Adicional</h4> 
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Monto Original :</div></td>
            <td nowrap width="25%"> 
              <input type="text" name="LCMOAM" maxlength="20" size="22" value="<%=datarec.getE01LCMOAM()%>" readonly="readonly" class="TXTRIGHT">
            </td>
            <td nowrap width="25%"><div align="right">Cuenta Contable : </div></td>
            <td nowrap width="25%">
              <input type="text" name="LCMGLN" maxlength="16" size="18" value="<%=datarec.getE01LCMGLN()%>" readonly="readonly" class="TXTRIGHT">
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Monto Utilizado : </div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01AMTUSE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Saldo Disponible : </div></td>
            <td nowrap width="25%">
              <eibsinput:text name="datarec" property="E01AMTAVA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>    

  <% if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL") || userPO.getPurpose().equals("RENEWAL")){ %>  
  <%   if (!datarec.getE01LCMCRF().equals("")){ %>
  <h4>Información Bloqueo</h4> 
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Estado :</div></td>
            <td nowrap width="25%"> 
              <select name="E01LCMCRF" disabled <%=datarec.getFieldString("F01LCMCRF").equals("Y")?"class=\"txtchanged\"":""%> >
                  <option value=""> </option>
                  <option value="Y" <% if(datarec.getE01LCMCRF().equals("Y")) out.print("selected");%>>Bloqueo</OPTION>
                  <option value="N" <% if(datarec.getE01LCMCRF().equals("N")) out.print("selected");%>>Desbloqueo</OPTION>
              </select>
            </td>
            <td nowrap width="25%"><div align="right">Motivo :</div></td>
            <td nowrap width="25%">
              <eibsinput:text name="datarec" property="E01LCMUC6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" modified="F01LCMUC6" />
              <eibsinput:text name="datarec" property="D01LCMUC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" modified="F01LCMUC6" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%   } %>
  <% } %>    

  <% if (userPO.getPurpose().equals("RENEWAL") || userPO.getPurpose().equals("APPROVAL")){ %>
  <h4>Prorroga</h4> 
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Nueva Fecha de Vencimiento :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:date name="datarec" fn_month="E01LCMEEM" fn_day="E01LCMEED" fn_year="E01LCMEEY" modified="F01LCMEEM;F01LCMEED;F01LCMEEY" readonly="<%=readOnlyRenewal%>" />
            </td>
            <td nowrap width="25%"></td>
            <td nowrap width="25%"> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>    
  <% if (!userPO.getPurpose().equals("RENEWAL")){ %>
  <h4>Datos Por Cuenta de</h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">N&uacute;mero Cliente :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01LCMCBC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" modified="F01LCMCBC" readonly="<%=readOnly%>" />
              <% if (!readOnly) { %>  
              <a href="javascript:GetCustomerDescId('E01LCMCBC','E01LCMCA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a>
              <% } %>    
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Nombre :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01LCMCA1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" modified="F01LCMCA1" readonly="<%=readOnly%>" />
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Cuenta Corriente Garantia Efectiva :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01LCMIBA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" modified="F01LCMIBA" readonly="<%=readOnly%>" />
              <% if (!readOnly) { %>  
              <a href="javascript:GetAccByClient('E01LCMIBA',document.forms[0].E01LCMBNK.value,'RT','',document.forms[0].E01LCMCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
              <% } %>    
            </td>
            <td nowrap width="25%"><div align="right">Cuenta Contable Garantia Efectiva</div></td>
            <td nowrap width="25%"> 
              <% if (!readOnly) { %>  
  		        <eibsinput:help name="datarec" property="E01LCMRF1" fn_param_one="E01LCMRF1" fn_param_two="document.forms[0].E01LCMBNK.value" fn_param_three="document.forms[0].E01LCMCCY.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="<%=readOnly%>" modified="F01LCMRF1" />
              <% } else { %> 
              <eibsinput:text name="datarec" property="E01LCMRF1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" modified="F01LCMRF1" readonly="<%=readOnly%>" />
              <% } %>    
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <% } %> 

  <% if (!userPO.getPurpose().equals("RENEWAL")){ %>
  <h4>Datos Beneficiario</h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">N&uacute;mero Cliente :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01LCMBCU" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" modified="F01LCMBCU" readonly="<%=readOnly%>" />
              <% if (!readOnly) { %>  
              <a href="javascript:GetCustomerDescId('E01LCMBCU','E01LCMBN1','E01LCMBID')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a>
              <% } %>    
            </td>
            <td nowrap width="25%"><div align="right">Identificaci&oacute;n :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01LCMBID" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" modified="F01LCMBID" readonly="<%=readOnly%>" />
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Nombre :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01LCMBN1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" modified="F01LCMBN1" readonly="<%=readOnly%>" />
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Garantiza :</div></td>
            <td nowrap width="25%">
              <textarea name="E01LCMSHF" cols="45" rows="3" <%=readOnly?"readonly":""%> <%=datarec.getF01LCMSHF().equals("Y")?"class=\"txtchanged\"":""%> ><%=datarec.getE01LCMSHF()%></textarea> 
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Cuenta Corriente :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01LCMBAC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" modified="F01LCMBAC" readonly="<%=readOnly%>" />
              <% if (!readOnly) { %>  
              <a href="javascript:GetAccByClient('E01LCMBAC',document.forms[0].E01LCMBNK.value,'RT','',document.forms[0].E01LCMBCU.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
              <% } %>    
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Fecha de Aviso de Pago :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:date name="datarec" fn_month="E01LCMCNM" fn_day="E01LCMCND" fn_year="E01LCMCNY" modified="F01LCMCNM;F01LCMCND;F01LCMCNY" readonly="<%=readOnly%>" />
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %> 

  <% if (!userPO.getPurpose().equals("RENEWAL")){ %>
  <h4>Intereses</h4> 
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Cuenta Corriente Pago :</div></td>
            <td nowrap width="25%"> 
              <% if (!readOnly) { %>  
              <eibsinput:text name="datarec" property="E01LCMAPA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" modified="F01LCMAPA" />
	              <a href="javascript:GetAccByClient('E01LCMAPA',document.forms[0].E01LCMBNK.value,'RT','',document.forms[0].E01LCMCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a>
              <% } else { %>
              <eibsinput:text name="datarec" property="E01LCMAPA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" modified="F01LCMAPA" readonly="true" />
              <% } %>
            </td>
            <td nowrap width="25%"><div align="right">Tasa de Interes :</div></td>
            <td nowrap width="25%"> 
              <% if (!readOnly) { %>  
              <eibsinput:text property="E01LCMLFX" name="datarec" type="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" />
              <% } else { %>
              <eibsinput:text property="E01LCMLFX" name="datarec" type="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" modified="F01LCMLFX" readonly="true" />
              <% } %>
            </td>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Frecuencia de Pago : </div></td>
            <td nowrap width="25%"> 
              <% if (!readOnly) { %>  
              <eibsinput:text property="E01LCMPC1" name="datarec" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" />
              <select name="E01LCMFL1" id="E01LCMFL1" >
                <option value=" " <% if (!(datarec.getE01LCMFL1().equals("D") || datarec.getE01LCMFL1().equals("M")||datarec.getE01LCMFL1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(datarec.getE01LCMFL1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(datarec.getE01LCMFL1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(datarec.getE01LCMFL1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <% } else { %>
              <eibsinput:text property="E01LCMPC1" name="datarec" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" modified="F01LCMPC1" readonly="true" />
              <select name="E01LCMFL1" disabled="disabled" <%=datarec.getF01LCMFL1().equals("Y")?"class=\"txtchanged\"":""%> >
                <option value=" " <% if (!(datarec.getE01LCMFL1().equals("D") || datarec.getE01LCMFL1().equals("M")||datarec.getE01LCMFL1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(datarec.getE01LCMFL1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(datarec.getE01LCMFL1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(datarec.getE01LCMFL1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <% } %>
            </td>
            <td nowrap width="25%"><div align="right">Periodo Base :</div></td>
            <td nowrap width="25%"> 
              <% if (!readOnly) { %>  
              <eibsinput:text property="E01LCMLSN" name="datarec" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" />            
              <% } else { %>
              <eibsinput:text property="E01LCMLSN" name="datarec" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" modified="F01LCMLSN" readonly="true" />            
              <% } %>
            </td>
          </tr>

          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Día del Pago : </div></td>
            <td nowrap width="25%"> 
              <eibsinput:text property="E01LCMPC2" name="datarec" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" modified="F01LCMPC2" readonly="<%=readOnlyAll%>" />
              (31=Fin de mes)
            </td>
            <td nowrap width="25%"><div align="right">Fecha Proximo Pago :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:date name="datarec" fn_month="E01LCMSCM" fn_day="E01LCMSCD" fn_year="E01LCMSCY" modified="F01LCMSCM;F01LCMSCD;F01LCMSCY" readonly="<%=readOnlyNew%>" />
            </td>
          </tr>

          <% if (userPO.getPurpose().equals("INQUIRY")){ %>  
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Intereses Acumulados :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01INTACR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="25%"><div align="right">Fecha Ultimo Calculo :</div></td>
            <td nowrap width="25%">
              <eibsinput:date name="datarec" fn_month="E01LCALCM" fn_day="E01LCALCD" fn_year="E01LCALCY" readonly="true" />
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Intereses Pagados :</div></td>
            <td nowrap width="25%"> 
              <eibsinput:text name="datarec" property="E01INTPAI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Saldo de Intereses :</div></td>
            <td nowrap width="25%">
              <eibsinput:text name="datarec" property="E01INTBAL" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="25%"><div align="right"></div></td>
            <td nowrap width="25%"> 
            </td>
          </tr>
          <% } %>    
        </table>
      </td>
    </tr>
  </table>
  <% } %>  
 
  <h4>Cobro de Comisiones</h4> 
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"><div align="right">Forma de Pago :</div></td>
            <td nowrap width="25%"> 
              <% if (readOnly) { %>  
              <input type="hidden" name="E01LCMFLC" id="E01LCMFLC" value="<%=datarec.getE01LCMFLC()%>">
              <% } %>    
              <select name="E01LCMFLC" id="E01LCMFLC" onchange="javascript:formaPago();" <%=readOnly?"disabled":""%> <%=datarec.getF01LCMFLC().equals("Y")?"class=\"txtchanged\"":""%> >
                <option value=" " <% if (datarec.getE01LCMFLC().equals(" ")) out.print("selected");%>>Caja</option>
                <option value="1" <% if (datarec.getE01LCMFLC().equals("1")) out.print("selected");%>>Automatico</option>
              </select>
            </td>
            <td nowrap width="25%"><div id="lblAutoCuenta" align="right">Cuenta Corriente : </div></td>
            <td nowrap width="25%"> 
              <div id="inpAutoCuenta" align="left">
                <eibsinput:text name="datarec" property="E01LCMRBA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" modified="F01LCMRBA" readonly="<%=readOnly%>" />
                <% if (!readOnly) { %>  
                <a href="javascript:GetAccByClient('E01LCMRBA',document.forms[0].E01LCMBNK.value,'RT','',document.forms[0].E01LCMCUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a>
                <% } %>    
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <% if (userPO.getPurpose().equals("INQUIRY")){ %>  
  <h4>Cargos</h4> 
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <th align="center" nowrap width="15%"></th>
            <th align="center" nowrap width="15%">Valor</th>
            <th align="center" nowrap width="15%">Iva</th>
            <th align="center" nowrap width="15%">Total</th>
            <th align="center" nowrap width="15%"></th>
            <th align="center" nowrap width="15%"></th>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%"><div align="right">Monto Pagado :</div></td>
            <td nowrap width="15%" align="center">
              <eibsinput:text property="E01COMPAI" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="center">
              <eibsinput:text property="E01IVAPAI" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="center">
              <eibsinput:text property="E01TOTPAI" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
            </td>
            <td nowrap width="15%"><div align="right">Fecha de Pago :</div></td>
            <td nowrap width="15%"> 
              <eibsinput:date name="datarec" fn_month="E01IDCPAM" fn_day="E01IDCPAD" fn_year="E01IDCPAY" readonly="true" />
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%"><div align="right">Monto Vencido :</div></td>
            <td nowrap width="15%" align="center"> 
              <eibsinput:text property="E01COMDUE" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="15%" align="center"> 
              <eibsinput:text property="E01IVADUE" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="15%" align="center"> 
              <eibsinput:text property="E01TOTDUE" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="15%"><div align="right">Fecha de Vencimiento :</div></td>
            <td nowrap width="15%" >
              <eibsinput:date name="datarec" fn_month="E01IDCDUM" fn_day="E01IDCDUD" fn_year="E01IDCDUY" readonly="true" /> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%"><div align="right">Monto por Vencer :</div></td>
            <td nowrap width="15%" align="center"> 
              <eibsinput:text property="E01COMNXV" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="15%" align="center"> 
              <eibsinput:text property="E01IVANXV" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="15%" align="center"> 
              <eibsinput:text property="E01TOTNXV" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="15%"><div align="right">Fecha por Vencer :</div></td>
            <td nowrap width="15%"> 
              <eibsinput:date name="datarec" fn_month="E01IDCNXM" fn_day="E01IDCNXD" fn_year="E01IDCNXY" readonly="true" />
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%"><div align="right">Monto Pendiente :</div></td>
            <td nowrap width="15%" align="center"> 
              <eibsinput:text property="E01COMFTV" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="15%" align="center">
              <eibsinput:text property="E01IVAFTV" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="center">
              <eibsinput:text property="E01TOTFTV" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
            </td>
            <td nowrap width="15%"><div align="right"></div></td>
            <td nowrap width="15%"> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%"><div align="right">Monto Total :</div></td>
            <td nowrap width="15%" align="center"> 
              <eibsinput:text property="E01COMTOT" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="15%" align="center">
              <eibsinput:text property="E01IVATOT" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="center">
              <eibsinput:text property="E01TOTTOT" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" /> 
            </td>
            <td nowrap width="15%"><div align="right"></div></td>
            <td nowrap width="15%"> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% } %>  

  <br>
  <!-- Cargos Adicionales -->
  <% if (FLGNEW.equals("N") || userPO.getPurpose().equals("RENEWAL")) { %>  
  <% session.setAttribute("EMPCA",readOnly&&readOnlyRenewal?"A":"S"); %>
  <iframe id="ifrempca" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&ACT=N&appType=BG&&E01PVHCUN=<%=datarec.getE01LCMCUN().trim()%>&E01PVHNUM=<%=datarec.getE01LCMOFN().trim()%>"> </iframe>
  <% } %>

  <!-- Plan de Pagos -->
  <% if (FLGPLN.equals("Y")){ %>  
  <iframe id="ifremppp" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5080?SCREEN=600&IFRAME=Y&E03DCCACC=<%=datarec.getE01LCMACC()%>"></iframe>
  <% } %>
   
  <!-- Recalcular -->
  <% if (FLGNEW.equals("N") && FLGPLN.equals("Y")) { %>  
  <div align="center">
    <table class="tbenter" class="tbenter" >
      <tr>
        <td width="50%" >
          <div align="right"><b>Recalcular Plan de Pagos </b></div>
        </td>
        <td width="50%" >
          <div align="left"><input type="checkbox" name="FLGRCL" id="FLGRCL" value="" onClick="UpdateFlag(this.checked)" ></div>
        </td>
      </tr>
    </table> 
  </div>
  <% } %>
   
  <% if ((readOnly) && (!userPO.getPurpose().equals("RENEWAL"))) { %>  
  <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="checkClose()" ></div>
  <% } else { %>    
  <div align="center">
    <table class="tbenter" class="tbenter">
      <tr>
        <td align="right"><input class="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="submitPage(this)"></td>
        <td >&nbsp;</td>
        <td align="left" ><input class="EIBSBTN" type="button" name="Exit"   value="Salir"  onclick="submitPage(this)"></td>
      </tr>
    </table> 
  </div>
  <% } %>    

  <br>

</FORM>

<SCRIPT type="text/javascript">

  formaPago();          
  
  function setComissionTable(readOnly) {
	var notMissingInfo = true;
	var cun = getElement('E01LCMCUN').value;
	var apcd = getElement('E01LCMACD').value;
	var bank = getElement('E01LCMBNK').value;
	var type = getElement('E01LCMATY').value;
	var table = getElement('E01LCMTAR').value;
	var alertMessage = "Por Favor Ingrese : ";
	
	if(readOnly === "true" ){	
		<% if(userPO.getPurpose().equals("APPROVAL")) { %>
			page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1200&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table+"&readOnly="+readOnly;
		<%}else{%>
			page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table+"&readOnly="+readOnly;
		<%}%>
	}else{
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table;
		
		if(trim(bank) == "") {
			alert(alertMessage + "Banco");
			notMissingInfo = false;			
		}
		
		if(trim(table) == "") {
			alert(alertMessage + "Tabla de Cargos");
			notMissingInfo = false;			
		}		
	}
	
	if(notMissingInfo){			
		CenterWindow(page, 1200, 1000, 2);
	}	
}

  //INQUIRY DISABLES all elements
  <% if (!userPO.getPurpose().equals("NEW") && !userPO.getPurpose().equals("MAINTENANCE") && !userPO.getPurpose().equals("RENEWAL")){ %>  
  var j=document.forms[0].elements.length;
  var felem=document.forms[0].elements;
    for(i=0;i< j;i++){
      if (felem[i].tagName!=="select"){
        if (felem[i].type=="text") {
          felem[i].readOnly=true;
          felem[i].oncontextmenu = "";
        } else felem[i].disabled=true;
      } else { 
        felem[i].disabled=true;
      }
    }
  <%}%>
  
</SCRIPT>

</BODY>
</html>
