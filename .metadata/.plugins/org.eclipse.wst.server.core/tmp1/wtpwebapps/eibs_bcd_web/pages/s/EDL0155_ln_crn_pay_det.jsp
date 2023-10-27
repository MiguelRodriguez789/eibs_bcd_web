<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.master.*" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="java.lang.Object" %>
<%@page import="com.datapro.presentation.input.EibsInput"%><HTML>   

<HEAD>
<TITLE>
Payment Details
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="record" class= "datapro.eibs.beans.EDL015502Message"  scope="session"/>
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"  scope="session"/>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript" >

var fieldAmount;
var fieldBank;
var fieldBranch;
var fieldCurrency;
var fieldLedger;

function goAction(opt) {
  if(opt == '0004') {
    var rt = confirm("Esta seguro que desea borrar este Registro?")
    if(!rt) return;
  }
  document.forms[0].OPTION.value = opt;
  document.forms[0].submit();
}

function AddConcepts() {
  var dataT = getElement("dataTable");
  for(var n=0;n<dataT.rows.length;n++) {
    dataT.rows[n].style.display="";
  }
}

function ShowHelpCode(cboName, divName, dscName, row, amnt, paid, cond, obnk, obrn, occy, ogln, oacc, oiva) {

  var v = document.forms[0][cboName][document.forms[0][cboName].selectedIndex].value;
  var codeName = 'E02CODE'+row;
  var codeElem = document.forms[0][codeName];
  
  if(codeElem.classList.contains('context-menu-help')){
    codeElem.classList.remove('context-menu-help');
  }
  
  codeElem.removeAttribute('onmousedown');
  codeElem.readOnly = false;
  
  if (v == " "){
    document.forms[0][amnt].value = '';
    document.forms[0][paid].value = '';
    document.forms[0][cond].value = '';
    document.forms[0][obnk].value = '';
    document.forms[0][obrn].value = '';
    document.forms[0][occy].value = '';
    document.forms[0][ogln].value = '';
    document.forms[0][oacc].value = '';
    document.forms[0][oiva].value = '';
    codeElem.value = '';
    document.forms[0][dscName].value = '';
  }
  
  if (v == '2') {
    codeElem.classList.add('context-menu-help');
    codeElem.setAttribute('onmousedown' , init(commDef,codeName,dscName));
    codeElem.value = '';
    document.forms[0][dscName].value = '';
  }else if (v == '3') {                              
    codeElem.classList.add('context-menu-help'); 
    codeElem.setAttribute('onmousedown' , init(brokerHelp,codeName, '','',dscName,'I',''));
    document.forms[0][dscName].readOnly = true;
    codeElem.value = '';
    document.forms[0][dscName].value = '';
  } else {
    if (v == '4') {
      document.forms[0][dscName].value = 'IVA';
      document.forms[0][dscName].readOnly = true;
      codeElem.value = '';
    } else if (v == '5') {
      if (codeElem.value == '') {
        codeElem.value = "@XCB";
      }
      if (codeElem.value == '@XCB' || document.forms[0][dscName].value == '') {
        document.forms[0][dscName].value = 'Cobranza';
      }
    } 
  }
}

function showDetail(pnu) {
  var param = "";
  param = param + "?pnu=" + pnu;
  param = param + "&PYVG=" + getElement("E02PYVG"+pnu).value;
  param = param + "&PYVN=" + getElement("E02PYVN"+pnu).value;
  param = param + "&PYSU=" + getElement("E02PYSU"+pnu).value;
  param = param + "&PYCS=" + getElement("E02PYCS"+pnu).value;
  param = param + "&PYPC=" + getElement("E02PYPC"+pnu).value;
  param = param + "&PDVG=" + getElement("E02PDVG"+pnu).value;
  param = param + "&PDVN=" + getElement("E02PDVN"+pnu).value;
  param = param + "&PDSU=" + getElement("E02PDSU"+pnu).value;
  param = param + "&PDCS=" + getElement("E02PDCS"+pnu).value;
  param = param + "&PDPC=" + getElement("E02PDPC"+pnu).value;
  param = param + "&CDVG=" + getElement("E02CDVG"+pnu).value;
  param = param + "&CDVN=" + getElement("E02CDVN"+pnu).value;
  param = param + "&CDSU=" + getElement("E02CDSU"+pnu).value;
  param = param + "&CDCS=" + getElement("E02CDCS"+pnu).value;
  param = param + "&CDPC=" + getElement("E02CDPC"+pnu).value;
  //page = "${pageContext.request.contextPath}/pages/s/MISC_message_viewer.jsp?MESSAGE=" + text;
  page = "<%=request.getContextPath()%>/pages/s/EDL0155_ln_crn_pay_detx.jsp" + param;
  CenterWindow(page, 700, 500, 1);
}

</SCRIPT>

</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0155" >
  <h3 align="center">Mantenimiento al Plan de Pagos y Deducciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_crn_pay_det.jsp , EDL0155"> </h3>
  <hr size="4">
  <input TYPE=HIDDEN name="SCREEN" value="3">
  <input TYPE=HIDDEN NAME="OPTION" VALUE="0002">
  <input type=HIDDEN name="E02TYPE01" value="<%=record.getE02TYPE01().trim()%>">
  <input type=HIDDEN name="E02TYPE02" value="<%=record.getE02TYPE02().trim()%>">
  <input type=HIDDEN name="E02TYPE03" value="<%=record.getE02TYPE03().trim()%>">
  <input type=HIDDEN name="E02TYPE04" value="<%=record.getE02TYPE04().trim()%>">
  <input type=HIDDEN name="E02TYPE05" value="<%=record.getE02TYPE05().trim()%>">
  <input type=HIDDEN name="E02TYPE06" value="<%=record.getE02TYPE06().trim()%>">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" ><div align="right"><b>Cliente :</b></div></td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02DEACUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" ><div align="right"><b>Nombre :</b></div></td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E02CUSNA1" size="46" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"><div align="right"><b>Cuenta : </b></div></td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02DLPACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"><div align="right"><b>Moneda :</b></div></td>
            <td nowrap width="16%"> 
              <div align="left">
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"><div align="right"><b>Producto : </b></div></td>
            <td nowrap width="16%"> 
              <div align="left">
                <input type="text" name="E02DEASPRO" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4 align="left"> Informacion basica </h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="30%" height="23" ><div align="right">Fecha Apertura  :</div></td>
            <td nowrap width="20%" height="23" > 
              <div align="left"><%= userPO.getHeader10().trim()%></div>
            </td>
            <td nowrap width="30%" height="23" ><div align="right">Tasa Interés :</div></td>
            <td nowrap width="20%" height="23" > 
              <div align="left"><%= userPO.getHeader13().trim()%></div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%" ><div align="right">Fecha Vencimiento :</div></td>
            <td nowrap width="20%" > 
              <div align="left"><%= userPO.getHeader11().trim()%></div>
            </td>
            <td nowrap width="30%" ><div align="right">Periodo Base :</div></td>
            <td nowrap width="20%" > 
              <div align="left"><%= userPO.getHeader14().trim()%></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="18" ><div align="right">Monto Original  :</div></td>
            <td nowrap width="20%" height="18" > 
              <div align="left"><%= userPO.getHeader12().trim()%></div>
            </td>
            <td nowrap width="30%" height="18" ><div align="right">Tipo de Interés :</div></td>
            <td nowrap width="20%" height="18" > 
              <div align="left"><%= userPO.getHeader15().trim()%></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4 align="left"> Informacion del Pago </h4> 
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trclear"> 
            <td nowrap width="20%"> <div align="right"> Número Cuota : </div></td>
            <td nowrap width="30%"> 
              <input TYPE="TEXT" size="6" maxlength="5" name="E02DLPPNU" value="<%=record.getE02DLPPNU()%>">
            </td>
            <td nowrap width="15%"  ><div align="right">Fecha de Pago Anterior : </div></td>
            <td nowrap width="30%"  > 
              <eibsinput:date name="record" fn_month="E02DLPPDM" fn_day="E02DLPPDD" fn_year="E02DLPPDY" readonly="TRUE"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"><div align="right">Fecha de Pago : </div></td>
            <td nowrap width="30%"> 
              <eibsinput:date name="record" fn_month="E02NEWPDM" fn_day="E02NEWPDD" fn_year="E02NEWPDY" readonly="FALSE"/>
            </td>
            <td nowrap width="20%"><div align="right">Fecha Último Pago :</div></td>
            <td nowrap width="30%"  > 
              <eibsinput:date name="record" fn_month="E02DLPDTM" fn_day="E02DLPDTD" fn_year="E02DLPDTY" readonly="FALSE"/>
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" align="right">Periodo de gracia : </td>
            <td nowrap width="30%"> 
              <input TYPE="TEXT" size="3" maxlength="2" name="E02DLPGPD" value="<%=record.getE02DLPGPD()%>" onKeyPress="enterInteger(event)">
            </td>
            <td nowrap width="20%" align="right">Monto extraordinario : </td>
            <td nowrap width="30%"> 
              <input TYPE="TEXT" size="16" maxlength="15" name="E02DLPAEX" value="<%=record.getE02DLPAEX()%>" onKeyPress="enterDecimal(event, 2)" class="txtright">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table id="infoTable" cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <th align=center nowrap width="35%">Descripción</th>
            <th align=center nowrap width="15%">A Pagar</th>
            <th align=center nowrap width="15%">Pagado</th>
            <th align=center nowrap width="15%">Condonado</th>
            <th align=center nowrap width="10%"></th>
          </tr>
          <!-- PRINCIPAL --> 
          <tr id="trclear">  
            <td nowrap width="35%" align="center" >
              <input type=hidden name="E02DESC01" value="<%=record.getE02DESC01().trim()%>">
              <%=record.getE02DESC01().trim()%>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02AMNT01" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02PAID01" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02COND01" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"/>
            </td>
            <td align=right nowrap width="10%"></td>
          </tr>
          <!-- INTERESES  -->     
          <tr id="trclear"> 
            <td nowrap width="35%" align="center" >
              <input type=hidden name="E02DESC02" value="<%=record.getE02DESC02().trim()%>">
              <a href="javascript:showDetail('02')"><%=record.getE02DESC02()%></a>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02AMNT02" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02PAID02" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02COND02" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td align=right nowrap width="10%">
              <input type=hidden name="E02PYVG02" value="<%=record.getE02PYVG02().trim()%>">
              <input type=hidden name="E02PYVN02" value="<%=record.getE02PYVN02().trim()%>">
              <input type=hidden name="E02PYSU02" value="<%=record.getE02PYSU02().trim()%>">
              <input type=hidden name="E02PYCS02" value="<%=record.getE02PYCS02().trim()%>">
              <input type=hidden name="E02PYPC02" value="<%=record.getE02PYPC02().trim()%>">
              <input type=hidden name="E02PDVG02" value="<%=record.getE02PDVG02().trim()%>">
              <input type=hidden name="E02PDVN02" value="<%=record.getE02PDVN02().trim()%>">
              <input type=hidden name="E02PDSU02" value="<%=record.getE02PDSU02().trim()%>">
              <input type=hidden name="E02PDCS02" value="<%=record.getE02PDCS02().trim()%>">
              <input type=hidden name="E02PDPC02" value="<%=record.getE02PDPC02().trim()%>">
              <input type=hidden name="E02CDVG02" value="<%=record.getE02CDVG02().trim()%>">
              <input type=hidden name="E02CDVN02" value="<%=record.getE02CDVN02().trim()%>">
              <input type=hidden name="E02CDSU02" value="<%=record.getE02CDSU02().trim()%>">
              <input type=hidden name="E02CDCS02" value="<%=record.getE02CDCS02().trim()%>">
              <input type=hidden name="E02CDPC02" value="<%=record.getE02CDPC02().trim()%>">
            </td>
          </tr>
          <!-- CARGOS MORA  -->     
          <tr id="trclear"> 
            <td nowrap width="35%" align="center" >
              <input type=hidden name="E02DESC03" value="<%=record.getE02DESC02().trim()%>">
              <a name="E02DESC03" href="javascript:showDetail('03')"><%=record.getE02DESC03()%></a>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02AMNT03" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02PAID03" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02COND03" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td align=right nowrap width="10%">
              <input type=hidden name="E02PYVG03" value="<%=record.getE02PYVG03().trim()%>">
              <input type=hidden name="E02PYVN03" value="<%=record.getE02PYVN03().trim()%>">
              <input type=hidden name="E02PYSU03" value="<%=record.getE02PYSU03().trim()%>">
              <input type=hidden name="E02PYCS03" value="<%=record.getE02PYCS03().trim()%>">
              <input type=hidden name="E02PYPC03" value="<%=record.getE02PYPC03().trim()%>">
              <input type=hidden name="E02PDVG03" value="<%=record.getE02PDVG03().trim()%>">
              <input type=hidden name="E02PDVN03" value="<%=record.getE02PDVN03().trim()%>">
              <input type=hidden name="E02PDSU03" value="<%=record.getE02PDSU03().trim()%>">
              <input type=hidden name="E02PDCS03" value="<%=record.getE02PDCS03().trim()%>">
              <input type=hidden name="E02PDPC03" value="<%=record.getE02PDPC03().trim()%>">
              <input type=hidden name="E02CDVG03" value="<%=record.getE02CDVG03().trim()%>">
              <input type=hidden name="E02CDVN03" value="<%=record.getE02CDVN03().trim()%>">
              <input type=hidden name="E02CDSU03" value="<%=record.getE02CDSU03().trim()%>">
              <input type=hidden name="E02CDCS03" value="<%=record.getE02CDCS03().trim()%>">
              <input type=hidden name="E02CDPC03" value="<%=record.getE02CDPC03().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%" align="center" >
              <input type=hidden name="E02DESC04" value="<%=record.getE02DESC04().trim()%>">
              <%=record.getE02DESC04().trim()%>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02AMNT04" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" type="<%= EibsInput.INPUT_TYPE_SIGN_DECIMAL %>"/>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02PAID04" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" type="<%= EibsInput.INPUT_TYPE_SIGN_DECIMAL %>"/>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02COND04" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
            <td align=right nowrap width="10%"></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="35%" align="center" >
              <input type=hidden name="E02DESC05" value="<%=record.getE02DESC05().trim()%>">
              <%=record.getE02DESC05().trim()%>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02AMNT05" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" type="<%= EibsInput.INPUT_TYPE_SIGN_DECIMAL %>"/>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02PAID05" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" type="<%= EibsInput.INPUT_TYPE_SIGN_DECIMAL %>"/>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02COND05" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" type="<%= EibsInput.INPUT_TYPE_SIGN_DECIMAL %>"/>
            </td>
            <td align=right nowrap width="10%"></td>
          </tr>
          <% if (userPO.getHeader3().trim().equals("R")) { %>  
          <tr id="trclear"> 
            <td nowrap width="35%" align="center" >
              <input TYPE="TEXT" size="40" maxlength="40" name="E02DESC06" value="<%=record.getE02DESC06()%>" readonly>
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02AMNT06" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02PAID06" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td nowrap width="15%" align="right"> 
              <eibsinput:text name="record" property="E02COND06" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
            <td align=right nowrap width="10%"></td>
          </tr>
          <% } %>
        </table>
      </td>
    </tr>
  </table>

	<h4 align="left"> Otros Cargos </h4> 
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table id="otrosTable" cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <th align=center nowrap width="5%" >Tipo</th>
            <th align=center nowrap width="5%">Código</th>
            <th align=center nowrap width="26%">Descripción</th>
            <th align=right nowrap width="10%">A Pagar </th>
            <th align=right nowrap width="10%">Pagado</th>
            <th align=right nowrap width="10%">Condonado</th>
            <th align=center nowrap width="4%">Bnc</th>
            <th align=center nowrap width="4%">Suc</th> 
            <th align=center nowrap width="4%">Mda</th>
            <th align=center nowrap width="10%">Contabilidad</th>
            <th align=center nowrap width="8%">Referencia</th>
            <th align=center nowrap width="4%">IVA</th>
          </tr>
          <div id="dataDiv1" style="overflow: auto;max-height: 300px;" > 
          <%
             String ext="";
             int filas = 30;
             for ( int i=11; i<=filas; i++ ) {
               if (i< 10) ext="0"+i; else ext="" +i;
          %>    
            <tr id="trclear"> 
              <td nowrap width="5%">
                <div>
                  <select name="E02TYPE<%=ext%>" onChange="javascript:ShowHelpCode('E02TYPE<%=ext%>','HLPCODE<%=ext%>','E02DESC<%=ext%>', '<%=ext%>')">
                    <option value=" " <% if(record.getField("E02TYPE"+ext).getString().trim().equals("")) out.print("selected"); %>></option>
                    <option value="1" <% if(record.getField("E02TYPE"+ext).getString().trim().equals("1")) out.print("selected"); %>>Impuesto</option>
                    <option value="2" <% if(record.getField("E02TYPE"+ext).getString().trim().equals("2")) out.print("selected"); %>>Comision</option>
                    <option value="3" <% if(record.getField("E02TYPE"+ext).getString().trim().equals("3")) out.print("selected"); %>>Deduccion</option>
                    <option value="4" <% if(record.getField("E02TYPE"+ext).getString().trim().equals("4")) out.print("selected"); %>>FECI/IVA</option>
                    <option value="5" <% if(record.getField("E02TYPE"+ext).getString().trim().equals("5")) out.print("selected"); %>>Cobranza</option>   
                  </select> 
                </div>
              </td>
              <td align="left" nowrap width="5%">
                <input type="hidden" name="E02SEQU<%=ext%>" value="<%=record.getField("E02SEQU"+ext).getString().trim()%>" >
                <input type="text" name="E02CODE<%=ext%>" size="5" maxlength="4" value="<%=record.getField("E02CODE"+ext).getString().trim()%>"   
          <%   if(record.getField("E02TYPE"+ext).getString().trim().equals("2")) out.print("class=\"context-menu-help\" onmousedown=\"init(commDef,this.name,E02CODE"+ext+")\""); %> 
          <%   if(record.getField("E02TYPE"+ext).getString().trim().equals("3")) out.print("class=\"context-menu-help\" onmousedown=\"init(brokerHelp,this.name,'','',E02CODE"+ext+",'I','')\""); %>
                > 
              </td> 
              <td nowrap align="right" width="26%" >
                <input TYPE="TEXT" size="60" maxlength="60" name="E02DESC<%=ext%>" value="<%=record.getField("E02DESC"+ext).getString().trim()%>">
              </td>
              <td nowrap align="right" width="10%"> 
                <input TYPE="TEXT" size="20" maxlength="21" name="E02AMNT<%=ext%>" value="<%=record.getField("E02AMNT"+ext).getString().trim()%>" onKeyPress="enterDecimal(event, 2)" class="txtright" onblur="this.value = formatCCY(this.value)">
              </td>
              <td nowrap align="right" width="10%"> 
                <input TYPE="TEXT" size="20" maxlength="21" name="E02PAID<%=ext%>" value="<%=record.getField("E02PAID"+ext).getString().trim()%>" onKeyPress="enterDecimal(event, 2)" class="txtright" onblur="this.value = formatCCY(this.value)">
              </td>
              <td nowrap align="right" width="10%"> 
                <input TYPE="TEXT" size="20" maxlength="21" name="E02COND<%=ext%>" value="<%=record.getField("E02COND"+ext).getString().trim()%>" onKeyPress="enterDecimal(event, 2)" class="txtright" onblur="this.value = formatCCY(this.value)">
              </td>
              <td nowrap align="center" width="4%"> 
                <input type="text" size="2" maxlength="2" name="E02OBNK<%=ext%>"  value="<%=record.getField("E02OBNK"+ext).getString().trim()%>">
              </td>
              <td nowrap align="center" width="4%"> 
                <input type="text" size="4" maxlength="4" name="E02OBRN<%=ext%>"  value="<%=record.getField("E02OBRN"+ext).getString().trim()%>" onKeyPress="enterInteger(event)" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02OBNK<%=ext%>.value,'','','','')">
              </td>
              <td nowrap align="center" width="4%"> 
                <input type="text" size="3" maxlength="3" name="E02OCCY<%=ext%>" value="<%=record.getField("E02OCCY"+ext).getString().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02OBNK<%=ext%>.value,'','','','')">
              </td>
              <td nowrap align="center" width="10%"> 
                <input type="text" size="16" maxlength="16" name="E02OGLN<%=ext%>" value="<%=record.getField("E02OGLN"+ext).getString().trim()%>" onKeyPress="enterInteger(event)" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E02OBNK<%=ext%>.value,document.forms[0].E02OCCY<%=ext%>.value,'','','')"> 
              </td>
              <td nowrap align="center" width="8%"> 
                <input type="text" size="12" maxlength="12" name="E02OACC<%=ext%>" value="<%=record.getField("E02OACC"+ext).getString().trim()%>" onKeyPress="enterInteger(event)" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E02OBNK<%=ext%>.value,'','','','RT')"> 
              </td>
              <td nowrap align="center" width="4%"> 
                <select name="E02DIVA<%=ext%>" id="E02OIVA<%=ext%>" >
	                <option value="Y" <% if (record.getField("E02DIVA"+ext).getString().trim().equals("Y"))  out.print("selected"); %>>Si</option>
	                <option value="N" <% if (!record.getField("E02DIVA"+ext).getString().trim().equals("Y")) out.print("selected"); %>>No</option>
                </select>
              </td>            
            </tr>
          <%
             }
          %> 
          </div>    
        </table>
      </td>
    </tr>
  </table>

  <BR><BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" height="18" ><b>Total</b></td>
            <td nowrap width="3%" height="18" >&nbsp;</td>
            <td nowrap width="37%" height="18" >A Pagar :&nbsp; <input type="text" name="E02TOAMNT" size="17" maxlength="16" value="<%=record.getE02TOAMNT()%>" readonly class="txtright"></td>
            <td nowrap width="4%" height="18" >&nbsp;</td>
            <td nowrap width="36%" height="18" > 
              <div align="left">Pagado :&nbsp;<input type="text" name="E02TOPAID" size="17" maxlength="16" value="<%=record.getE02TOPAID()%>" readonly class="txtright"></div>
            </td>
            <td nowrap width="36%" height="18" > 
              <div align="left">Condonado :&nbsp;<input type="text" name="E02TOCOND" size="17" maxlength="16" value="<%=record.getE02TOCOND()%>" readonly class="txtright"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
	<BR>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="50%" align="center"> 
        <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction('0002');">
      </td>     
      <td width="50%" align="center"> 
        <input id="EIBSBTN" type=button name="Delete" value="Eliminar" onClick="goAction('0004');">
      </td> 
    </tr>    
  </table>  

</FORM>
</BODY>
</HTML>
