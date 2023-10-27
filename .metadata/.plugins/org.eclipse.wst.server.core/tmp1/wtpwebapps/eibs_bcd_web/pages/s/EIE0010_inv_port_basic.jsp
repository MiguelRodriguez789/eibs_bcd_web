<!DOCTYPE HTML>
<%@ page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util"%>
<html>
<head>
<title>Customer Portfolio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.EIE001001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=cusPort"> </script>

<SCRIPT type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>
	
<%if (userPO.getPurpose().equals("MAINTENANCE")) {%>
	builtNewMenu(cus_m_port_opt);
<%} else if (userPO.getPurpose().equals("INQUIRY")) {%>
	builtNewMenu(cus_i_port_opt);
<%} else if (userPO.getPurpose().equals("APPROVAL")) {%>
	builtNewMenu(cus_a_port_opt);
<%}%>
<%if (!userPO.getPurpose().equals("NEW")) {%>
  initMenu();
<%}%>  

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
}
</SCRIPT>

</head>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
%>

<div align="center">
  <h3>Perfil de Portafolio de Inversiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_port_basic.jsp,EIE0010"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0010" >
  <h4>Información Básica 
    <input type="hidden" name="SCREEN" value="5" >
    <input type="hidden" name="E01PRFBNK" value=<%=msgRcd.getE01PRFBNK()%>" >
  </h4>
  <table border="0" width="100%">
    <tr id="trclear"> 
      <td width="82%"> 
        <div align="right">Estado :</div>
      </td>
      <td width="18%">
		<select name="E01PRFSTS">
                  <option value="" <%if (msgRcd.getE01PRFSTS().equals("")) { out.print("selected"); }%>></option>
                  <option value="P" <%if (msgRcd.getE01PRFSTS().equals("P")) { out.print("selected"); }%>>Pendiente</option>
                  <option value="A" <%if (msgRcd.getE01PRFSTS().equals("A")) { out.print("selected"); }%>>Activo</option>
                  <option value="I" <%if (msgRcd.getE01PRFSTS().equals("I")) { out.print("selected"); }%>>Inactivo</option>
                </select>
</td>
    </tr>
  </table>
  <BR>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
			<td nowrap width="34%" > 
              <div align="right">Portafolio / Descripción :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01PRFNUM" size="12" maxlength="9" value="<%= msgRcd.getE01PRFNUM().trim()%>" readonly>
              / 
              <input type="text" name="E01PRFDSC" size="35" maxlength="35" value="<%= msgRcd.getE01PRFDSC()%>">
              <%=mandatory%> 
            </td>            
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Número de Cliente :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01PRFCUN" size="12" maxlength="9" value="<%= msgRcd.getE01PRFCUN().trim()%>" readonly>
              <input type="text" name="D01CUSNA1" size="35" maxlength="35" value="<%= msgRcd.getD01CUSNA1().trim()%>" readonly>
              <%=mandatory%> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Oficial de Cuenta :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01PRFOFC" size="6" maxlength="4" value="<%= msgRcd.getE01PRFOFC().trim()%>">
              <input type="text" name="D01OFCNME" size="35" maxlength="35" value="<%= msgRcd.getD01OFCNME()%>" readonly>
              <a href="javascript:GetCodeDescCNOFC('E01PRFOFC','D01OFCNME', '15')"><%=help%></a> 
              <%=mandatory%> 
            </td>
          </tr>
          <% 
  			if (userPO.getPurpose().equals("NEW")) {
		   %> 
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Cuenta Transaccional :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01PRFHAC" size="15" maxlength="12" value="<%= msgRcd.getE01PRFHAC()%>">
              <a href="javascript:GetAccount('E01PRFHAC','','RA','')"><%=help%></a> 
            </td>
          </tr>
          <tr id="trdark"> <% } else { %> 
          <tr id="trclear"> <% } %> 
            <td nowrap width="34%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap > 
            	<eibsinput:date name="msgRcd" fn_month="E01PRFOPM" fn_day="E01PRFOPD" fn_year="E01PRFOPY" />
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Moneda del Portafolio :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01PRFVCY" size="4" maxlength="3" value="<%= msgRcd.getE01PRFVCY().trim()%>">
              <a href="javascript:GetCurrency('E01PRFVCY','')"><%=help%></a> 
              <%=mandatory%> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Tabla de Custodia :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01PRFCUT" size="4" maxlength="2" value="<%= msgRcd.getE01PRFCUT()%>">
                <a href="javascript:GetCommCustodyTable('E01PRFCUT','CST','','')"><%=help%></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Via de Confirmación :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <select name="E01PRFCNF">
                  <option value="N" <%if (msgRcd.getE01PRFCNF().equals("N")) { out.print("selected"); }%>>Ninguna</option>
                  <option value="E" <%if (msgRcd.getE01PRFCNF().equals("E")) { out.print("selected"); }%>>Correo Electronico</option>
                  <option value="F" <%if (msgRcd.getE01PRFCNF().equals("F")) { out.print("selected"); }%>>Fax</option>
                  <option value="P" <%if (msgRcd.getE01PRFCNF().equals("P")) { out.print("selected"); }%>>Impresora</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Tipo de Portafolio :</div>
            </td>
            <td nowrap > 
              <div align="left">
                <input type="radio" name="E01PRFTYP" value="D" onClick="document.forms[0].E01PRFTYP.value='D'" <%if(msgRcd.getE01PRFTYP().equals("D")) out.print("checked");%>>
                Discrecionario 
                <input type="radio" name="E01PRFTYP" value="N" onClick="document.forms[0].E01PRFTYP.value='N'" <%if(msgRcd.getE01PRFTYP().equals("N")) out.print("checked");%>>
                No Discrecionario</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Información de Inversiones</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan=6 > 
              <div align="left"><b>Invertir en :</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="right">Ingreso Fijo :</div>
            </td>
            <td nowrap >              
              <input type="radio" name="E01PRFFXR" value="Y" <%if(msgRcd.getE01PRFFXR().equals("Y")) out.print("checked");%>>
              Sí 
              <input type="radio" name="E01PRFFXR" value="N" <%if(msgRcd.getE01PRFFXR().equals("N")) out.print("checked");%>>
              No <%=mandatory%></td>
            <td nowrap width="33%" > 
              <div align="right">Ingreso Variable :</div>
            </td>
            <td nowrap>               
              <input type="radio" name="E01PRFVIR" value="Y" <%if(msgRcd.getE01PRFVIR().equals("Y")) out.print("checked");%>>
              Sí 
              <input type="radio" name="E01PRFVIR" value="N" <%if(msgRcd.getE01PRFVIR().equals("N")) out.print("checked");%>>
              No <%=mandatory%></td>
            <td nowrap width="34%" > 
              <div align="right">Productos de Banca :</div>
            </td>
            <td nowrap>               
              <input type="radio" name="E01PRFBPR" value="Y" <%if(msgRcd.getE01PRFBPR().equals("Y")) out.print("checked");%>>
              Sí
              <input type="radio" name="E01PRFBPR" value="N" <%if(msgRcd.getE01PRFBPR().equals("N")) out.print("checked");%>>
              No <%=mandatory%></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <h4>Cuentas de Pago </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="center"><b>Cuentas de Pago</b></div>
            </td>
            <td nowrap> 
              <div align="center">Banco</div>
            </td>
            <td nowrap> 
              <div align="center">Agencia</div>
            </td>
            <td nowrap> 
              <div align="center">Moneda</div>
            </td>
            <td nowrap> 
              <div align="center">Cuenta Contable</div>
            </td>
            <td nowrap> 
              <div align="center">Referencia</div>
            </td>
            <td nowrap> 
              <div align="center">Centro de Costo</div>
            </td>
          </tr>
          <tr> 
            <td nowrap id="trdark"> 
              <div align="right">Intereses (Cupones) :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFIBK" size="2" maxlength="2" value="<%= msgRcd.getE01PRFIBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFIBR" size="4" maxlength="4" value="<%= msgRcd.getE01PRFIBR()%>"
	              class="context-menu-help"
	              onmousedown="init(branchHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFICY" size="3" maxlength="3" value="<%= msgRcd.getE01PRFICY()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFIGL" size="17" maxlength="16" value="<%= msgRcd.getE01PRFIGL()%>" 
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01PRFIBK.value,document.forms[0].E01PRFICY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFIAC" size="13" maxlength="12" value="<%= msgRcd.getE01PRFIAC()%>"
	              class="context-menu-help"
	              onmousedown="init(accountHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFICC" size="9" maxlength="8" value="<%= msgRcd.getE01PRFICC()%>"
	              class="context-menu-help"
	              onmousedown="init(costcenterHelp,this.name,document.forms[0].E01PRFIBK.value,'','','','')" >
              </div>
            </td>
          </tr>
          <tr> 
            <td nowrap id="trdark"> 
              <div align="right">Dividendos :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFDBK" size="2" maxlength="2" value="<%= msgRcd.getE01PRFDBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFDBR" size="4" maxlength="4" value="<%= msgRcd.getE01PRFDBR()%>"
	              class="context-menu-help"
	              onmousedown="init(branchHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFDCY" size="3" maxlength="3" value="<%= msgRcd.getE01PRFDCY()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFDGL" size="17" maxlength="16" value="<%= msgRcd.getE01PRFDGL()%>" 
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01PRFDBK.value,document.forms[0].E01PRFDCY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFDAC" size="13" maxlength="12" value="<%= msgRcd.getE01PRFDAC()%>"
	              class="context-menu-help"
	              onmousedown="init(accountHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFDCC" size="9" maxlength="8" value="<%= msgRcd.getE01PRFDCC()%>"
	              class="context-menu-help"
	              onmousedown="init(costcenterHelp,this.name,document.forms[0].E01PRFDBK.value,'','','','')" >
              </div>
            </td>
          </tr>
          <tr > 
            <td nowrap id="trdark"> 
              <div align="right">Capital :</div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFCBK" size="2" maxlength="2" value="<%= msgRcd.getE01PRFCBK()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFCBR" size="4" maxlength="4" value="<%= msgRcd.getE01PRFCBR()%>"
	              class="context-menu-help"
	              onmousedown="init(branchHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFCCY" size="3" maxlength="3" value="<%= msgRcd.getE01PRFCCY()%>"
	              class="context-menu-help"
	              onmousedown="init(currencyHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFCGL" size="17" maxlength="16" value="<%= msgRcd.getE01PRFCGL()%>" 
	              class="context-menu-help"
	              onmousedown="init(ledgerHelp,this.name,document.forms[0].E01PRFCBK.value,document.forms[0].E01PRFCCY.value,'','','')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFCAC" size="13" maxlength="12" value="<%= msgRcd.getE01PRFCAC()%>"
	              class="context-menu-help"
	              onmousedown="init(accountHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','RT')" >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01PRFCCC" size="9" maxlength="8" value="<%= msgRcd.getE01PRFCCC()%>"
	              class="context-menu-help"
	              onmousedown="init(costcenterHelp,this.name,document.forms[0].E01PRFCBK.value,'','','','')" >
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Información Adicional
  </h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan="2">Nombre Legal :</td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <div align="center">
                <textarea name="E01LEGNME" cols="80" rows="4" readonly> <%= msgRcd.getE01LEGNME() %> </textarea>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap colspan="2"> 
              <div align="left">Comentarios :</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan=2 align=center> 
              <div align="center">
                <textarea name="E01PRFCMT" cols="80" rows="4" readonly> <%= msgRcd.getE01PRFCMT() %> </textarea>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

    <h4>Experiencia y conocimiento como inversionista:</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
         <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Bonos de Corto Plazo (1 año o menos):</div>
            </td>
            <td nowrap >
              <input type="radio" name="E01PRFEC1" value="Y" onClick="document.forms[0].E01PRFEC1.value='Y'" <%if(msgRcd.getE01PRFEC1().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFEC1" value="N" onClick="document.forms[0].E01PRFEC1.value='N'" <%if(msgRcd.getE01PRFEC1().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Bonos de Largo Plazo / Alta Calidad Crediticia / Grado de Inversion:</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFEC2" value="Y" onClick="document.forms[0].EO1PRFEC2.value='Y'"<%if(msgRcd.getE01PRFEC2().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFEC2" value="N" onClick="document.forms[0].EO1PRFEC2.value='N'"<%if(msgRcd.getE01PRFEC2().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Fondos Mutuales (Acciones, Bonos, etc):</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFEC3" value="Y" onClick="document.forms[0].EO1PRFEC3.value='Y'"<%if(msgRcd.getE01PRFEC3().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFEC3" value="N" onClick="document.forms[0].EO1PRFEC3.value='N'"<%if(msgRcd.getE01PRFEC3().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Bonos de Alto Rendimiento / Baja Calidad Crediticia / Grado Especulativo:</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFEC4" value="Y" onClick="document.forms[0].EO1PRFEC4.value='Y'"<%if(msgRcd.getE01PRFEC4().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFEC4" value="N" onClick="document.forms[0].EO1PRFEC4.value='N'" <%if(msgRcd.getE01PRFEC4().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Deuda Republicas Latinoamericanas :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFEC7" value="Y" onClick="document.forms[0].EO1PRFEC7.value='Y'" <%if(msgRcd.getE01PRFEC7().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFEC7" value="N" onClick="document.forms[0].EO1PRFEC7.value='N'" <%if(msgRcd.getE01PRFEC7().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Acciones   cotizadas en bolsas:</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFEC5" value="Y" onClick="document.forms[0].EO1PRFEC5.value='Y'" <%if(msgRcd.getE01PRFEC5().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFEC5" value="N" onClick="document.forms[0].EO1PRFEC5.value='N'" <%if(msgRcd.getE01PRFEC5().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
	         
        </table>
      </td>
    </tr>
  </table>
  
<h4>¿Hasta que plazo esta dispuesto a mantener su inversion? Solo seleccione una opción:</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          
          <tr id="trclear">
            <td nowrap width="25%"  align="right">Menos de 1 año : </td>
            <td nowrap >
               <input type="radio" name="E01PRFFHI" value="A" onClick="document.forms[0].EO1PRFFHI.value='A'" <%if(msgRcd.getE01PRFFHI().equals("A")) out.print("checked");%>>
            <td nowrap width="25%" align="right">Entre 1 y 3 años : </td>
            <td nowrap>
              <input type="radio" name="E01PRFFHI" value="B" onClick="document.forms[0].EO1PRFFHI.value='B'" <%if(msgRcd.getE01PRFFHI().equals("B")) out.print("checked");%>>
            <td nowrap width="25%" align="right">Mayor a 3 años : </td>
            <td nowrap>
              <input type="radio" name="E01PRFFHI" value="C" onClick="document.forms[0].EO1PRFFHI.value='C'" <%if(msgRcd.getE01PRFFHI().equals("C")) out.print("checked");%>>
            <td nowrap width="25%" align="right">No Aplica : </td>
            <td nowrap>
              <input type="radio" name="E01PRFFHI" value="D" onClick="document.forms[0].EO1PRFFHI.value='D'" <%if(msgRcd.getE01PRFFHI().equals("D")) out.print("checked");%>>
             </tr>  
        </table>
      </td>
    </tr>
  </table>
  
  <h4>El valor de los activos financieros tiene variaciones al alza y a la baja durante el horizonte de inversión del cliente. 
  <br/>¿Cuál es la máxima variación que usted toleraría? Solo seleccione una opción:</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          
          <tr id="trdark">
            <td nowrap width="25%" align="right">Menor a un 5% : </td>
            <td nowrap >
               <input type="radio" name="E01PRFTAR" value="A" onClick="document.forms[0].EO1PRFTAR.value='A'" <%if(msgRcd.getE01PRFTAR().equals("A")) out.print("checked");%>>
            <td nowrap width="25%" align="right">Entre 5% y 10% : </td>
            <td nowrap>
               <input type="radio" name="E01PRFTAR" value="B" onClick="document.forms[0].EO1PRFTAR.value='B'" <%if(msgRcd.getE01PRFTAR().equals("B")) out.print("checked");%>>
            <td nowrap width="25%" align="right">Mayor a 10% : </td>
            <td nowrap>
               <input type="radio" name="E01PRFTAR" value="C" onClick="document.forms[0].EO1PRFTAR.value='C'" <%if(msgRcd.getE01PRFTAR().equals("C")) out.print("checked");%>>  
            <td nowrap width="25%" align="right">No Aplica : </td>
            <td nowrap>
               <input type="radio" name="E01PRFTAR" value="D" onClick="document.forms[0].EO1PRFTAR.value='D'" <%if(msgRcd.getE01PRFTAR().equals("D")) out.print("checked");%>>  
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
   <h4>Frecuencia en sus ingresos. Solo seleccione una opción:</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Frecuentes :</div>
            </td>
            <td nowrap >
               <input type="radio" name="E01PRFFEI" value="A" onClick="document.forms[0].EO1PRFFEI.value='A'" <%if(msgRcd.getE01PRFFEI().equals("A")) out.print("checked");%>>
               </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Muy esporadicos :</div>
            </td>
            <td nowrap>
               <input type="radio" name="E01PRFFEI" value="B" onClick="document.forms[0].EO1PRFFEI.value='B'" <%if(msgRcd.getE01PRFFEI().equals("B")) out.print("checked");%>>  
            </tr>
           <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">No Aplica :</div>
            </td>
            <td nowrap>
               <input type="radio" name="E01PRFFEI" value="C" onClick="document.forms[0].EO1PRFFEI.value='C'" <%if(msgRcd.getE01PRFFEI().equals("C")) out.print("checked");%>>  
            </tr>
         
          
        </table>
      </td>
    </tr>
  </table>
  
 <h4>Exposición total del patrimonio (Inversión/Total Patrimonio). 
 <br/>¿Qué proporción está usted dispuesto a invertir de su patrimonio líquido total consolidando sus cuentas bancarias, ahorros, colocaciones, inversiones financieras? 
 <br/>Solo seleccione una opción:</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">El monto a invertir es menor al 15% del patrimonio liquido:</div>
            </td>
            <td nowrap >
               <input type="radio" name="E01PRFETP" value="A" onClick="document.forms[0].EO1PRFETP.value='A'" <%if(msgRcd.getE01PRFETP().equals("A")) out.print("checked");%>>               
            </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">El monto a invertir se encuentra entre 15 y 30%  del patrimonio liquido:</div>
            </td>
            <td nowrap>
               <input type="radio" name="E01PRFETP" value="B" onClick="document.forms[0].EO1PRFETP.value='B'" <%if(msgRcd.getE01PRFETP().equals("B")) out.print("checked");%>>               
            </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">El monto a invertir es mayor al 30% del patrimonio liquido:</div>
            </td>
            <td nowrap>
               <input type="radio" name="E01PRFETP" value="C" onClick="document.forms[0].EO1PRFETP.value='C'" <%if(msgRcd.getE01PRFETP().equals("C")) out.print("checked");%>>               
            </tr>
        </table>
      </td>
    </tr>
  </table>
 
  
  <h4>¿Dispuesto a endeudarse para invertir en títulos valores? </h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">    </div>
            </td>
         <td nowrap>
              <input type="radio" name="E01PRFEND" value="Y" onClick="document.forms[0].EO1PRFEND.value='Y'" <%if(msgRcd.getE01PRFEND().equals("Y")) out.print("checked");%>>               
              Si
              <input type="radio" name="E01PRFEND" value="N" onClick="document.forms[0].EO1PRFEND.value='N'" <%if(msgRcd.getE01PRFEND().equals("N")) out.print("checked");%>>               
              No 
              <input type="radio" name="E01PRFEND" value="A" onClick="document.forms[0].EO1PRFEND.value='A'" <%if(msgRcd.getE01PRFEND().equals("A")) out.print("checked");%>>               
              No Aplica 
              <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
       </table>
      </td>
    </tr>
  </table>
  
  
  <h4>Resultado del perfil del inversionista:</h4>
  <table  class="tableinfo" width="80%">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Riesgo
				Bajo:</div>
            </td>
            <td>

              <input type="radio" name="E01PRFPRF" value="A" onClick="document.forms[0].EO1PRFPRF.value='A'" <%if(msgRcd.getE01PRFPRF().equals("A")) out.print("checked");%>>               

			</td>
            <td nowrap width="34%" >
En lo que sea posible prefiere tener una mínima exposición al riesgo. 
Busca exclusivamente preservar el capital durante un horizonte de tiempo variable de corto al mediano plazo.
            </td>
              </tr>
          <tr id="trdark">
            <td>
              <div align="right">Riesgo
				Moderado:</div>
            </td>
            <td>

                <input type="radio" name="E01PRFPRF" value="B" onClick="document.forms[0].EO1PRFPRF.value='B'" <%if(msgRcd.getE01PRFPRF().equals("B")) out.print("checked");%>>               

			</td>
			<td>
Se siente cómodo con cierta exposición al riesgo y tiene la expectativa de lograr apreciación de capital moderada sin horizonte específico de tiempo. 
Le preocupa en algo la preservación de su capital pero no es una condición primordial ante los riesgos que esta dispuesto a asumir. 
La renta no necesariamente ha de ser recurrente. 
Entiende que bajo ciertas condiciones del mercado podrá sufrir pérdidas totales o parciales y su principal no quedará garantizado.
			</td>
            </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Tolerante
				al Riesgo / Profesional:</div>
            </td>
            <td nowrap>

               <input type="radio" name="E01PRFPRF" value="C" onClick="document.forms[0].EO1PRFPRF.value='C'" <%if(msgRcd.getE01PRFPRF().equals("C")) out.print("checked");%>>       

			</td>
			<td>
Asume una elevada exposición al riesgo. Es conocedor de los mercados y todos los riesgos inherentes previstos. 
Busca crecimiento de capital con un horizonte de tiempo variable de corto, mediano a largo plazo.
			</td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
        
   <h4>Productos a los que desea acceder:</h4>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
         <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Margen :</div>
            </td>
            <td nowrap >
              <input type="radio" name="E01PRFMRG" value="Y" onClick="document.forms[0].EO1PRFMRG.value='Y'" <%if(msgRcd.getE01PRFMRG().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFMRG" value="N" onClick="document.forms[0].EO1PRFMRG.value='N'" <%if(msgRcd.getE01PRFMRG().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Compra/Venta de Titulos Renta Fija :</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFFIJ" value="Y" onClick="document.forms[0].EO1PRFFIJ.value='Y'" <%if(msgRcd.getE01PRFFIJ().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFFIJ" value="N" onClick="document.forms[0].EO1PRFFIJ.value='N'" <%if(msgRcd.getE01PRFFIJ().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Compra/Venta de Titulos Renta Variable:</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFVAR" value="Y" onClick="document.forms[0].EO1PRFVAR.value='Y'" <%if(msgRcd.getE01PRFVAR().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFVAR" value="N" onClick="document.forms[0].EO1PRFVAR.value='N'" <%if(msgRcd.getE01PRFVAR().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>
          
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Inversion de Liquidez:</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFILI" value="Y" onClick="document.forms[0].EO1PRFILI.value='Y'" <%if(msgRcd.getE01PRFILI().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFILI" value="N" onClick="document.forms[0].EO1PRFILI.value='N'" <%if(msgRcd.getE01PRFILI().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>   
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Prestamo de Valores Monetizado:</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFPVM" value="Y" onClick="document.forms[0].EO1PRFPVM.value='Y'" <%if(msgRcd.getE01PRFPVM().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFPVM" value="N" onClick="document.forms[0].EO1PRFPVM.value='N'" <%if(msgRcd.getE01PRFPVM().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>   
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Fondo de Deuda Latinoamericana:</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFDLA" value="Y" onClick="document.forms[0].EO1PRFDLA.value='Y'" <%if(msgRcd.getE01PRFDLA().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFDLA" value="N" onClick="document.forms[0].EO1PRFDLA.value='N'" <%if(msgRcd.getE01PRFDLA().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>

          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Fondo de Deuda de Alta Calificacion:</div>
            </td>
            <td nowrap>
              <input type="radio" name="E01PRFFAC" value="Y" onClick="document.forms[0].EO1PRFFAC.value='Y'" <%if(msgRcd.getE01PRFFAC().equals("Y")) out.print("checked");%>>
              Si
              <input type="radio" name="E01PRFFAC" value="N" onClick="document.forms[0].EO1PRFFAC.value='N'" <%if(msgRcd.getE01PRFFAC().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" border="0"  ></td>
          </tr>            
	         
        </table>
      </td>
    </tr>
  </table>     


		<%if (!isInquiry) {%>
		<p align="center">
			<input class="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);"><BR>
		</p>
		<%}%>
		<%if (isInquiry) {%>
			<script>readOnlyPage();</script>
		<% } %>
  
  </form>
</body>
</html>
