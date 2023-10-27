<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Deals Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cdMant" class="datapro.eibs.beans.EDL013001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />


<SCRIPT type="text/javascript">
 <%
if ( userPO.getHeader16().equals("N") ) {
%>
	builtNewMenu(cdm_m_act_opt);
<%   
} 
else {
%>  
   builtNewMenu(cdm_m_opt);
<%}%>
   
	builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
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
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>
<h3 align="center"> Informaci&oacute;n B&aacute;sica <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_maint.jsp,EDL0130M"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEDL0130M" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK"  value="<%= cdMant.getE01DEABNK().trim()%>">
  <input type=HIDDEN name="E01DEAACD"  value="<%= cdMant.getE01DEAACD().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= cdMant.getE01DEACUN().trim()%>">
                <a href="javascript:GetCustomerDescId('E01DEACUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= cdMant.getE01CUSNA1().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="13" maxlength="9" value="<%= cdMant.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY2" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= cdMant.getE01DEAPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Original </h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap > 
               <eibsinput:date name="cdMant"  fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="true"/> 
            </td>
            <td nowrap > 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAOAM" size="15" maxlength="13" value="<%= cdMant.getE01DEAOAM().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap > 
               <eibsinput:date name="cdMant"  fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" readonly="True"/> 
            </td>
            <td nowrap > 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Base de Periodificaci&oacute;n:</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEABAS" size="3" maxlength="3" value="<%= cdMant.getE01DEABAS().trim()%>" readonly>
            </td>
            <td nowrap >
              <div align="right">Tasa Actual :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01RATE" size="10" maxlength="9" value="<%= cdMant.getE01RATE().trim()%>" readonly>
            </td>
          </tr>
 
        </table>
      </td>
    </tr>
  </table>
  <h4> Informaci&oacute;n B&aacute;sica </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Nueva Fecha de Vencimiento :</div>
            </td>
            <td nowrap > 
               <eibsinput:date name="cdMant" fn_month="E01NEWMDM" fn_day="E01NEWMDD" fn_year="E01NEWMDY" /> 
            </td>
            <td nowrap > 
              <div align="right">T&eacute;rminos :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEATRM" size="6" maxlength="5" value="<%= cdMant.getE01DEATRM().trim()%>" onkeypress="enterInteger(event)">
              <select name="E01DEATRC">
                <option value=" " <% if (!(cdMant.getE01DEATRC().equals("D") ||cdMant.getE01DEATRC().equals("M")||cdMant.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(cdMant.getE01DEATRC().equals("D")) out.print("selected");%>>Día(s)</option>
                <option value="M" <% if(cdMant.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(s)</option>
                <option value="Y" <% if(cdMant.getE01DEATRC().equals("Y")) out.print("selected");%>>Año(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Mandatory Field" align="bottom" border="0" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Tipo de Tasa Flotante :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= cdMant.getE01DEAFTB().trim()%>">
              <a href="javascript:GetFloating('E01DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Floating Rates Table" align="middle" border="0" ></a> 
              <select name="E01DEAFTY">
                <option value=" " <% if (!(cdMant.getE01DEAFTY().equals("FP") ||cdMant.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (cdMant.getE01DEAFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                <option value="FS" <% if (cdMant.getE01DEAFTY().equals("FS")) out.print("selected"); %>>Secundaria</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01FLTRTE" size="10" maxlength="9" value="<%= cdMant.getE01FLTRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Per&iacute;odo/ Fecha Revisi&oacute;n de Tasa 
                :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= cdMant.getE01DEARRP().trim()%>" onkeypress="enterInteger(event)">
              / 
               <eibsinput:date name="cdMant"  fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY" /> 
            </td>
            <td nowrap > 
              <div align="right">Tasa de Inter&eacute;s /Spread :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= cdMant.getE01DEARTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Retenci&oacute;n/Impuestos :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAWHF" size="2" maxlength="1" value="<%= cdMant.getE01DEAWHF().trim()%>">
              <a href="javascript:GetCode('E01DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" title="help" ></a> 
            </td>
            <td nowrap > 
              <div align="right"> N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAREF" size="12" maxlength="12" value="<%= cdMant.getE01DEAREF().trim()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">M&eacute;todo C&aacute;lculo Inter&eacute;s :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= cdMant.getE01DEAICT().trim()%>">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" title="help" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Mandatory Field" align="bottom" border="0"> 
            </td>
            <td nowrap > 
              <div align="right"> Tasa Moneda Extranjera :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAEXR" size="11" maxlength="11" value="<%= cdMant.getE01DEAEXR().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Direcci&oacute;n de Correo :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= cdMant.getE01DEAMLA().trim()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
            </td>
            <td nowrap > 
              <div align="right">Inter&eacute;s Acumulado :</div>
            </td>
            <td nowrap > 
              <input type="radio" name="E01DEAIFL" value="1" <% if (cdMant.getE01DEAIFL().equals("1")) out.print("checked"); %>>
              Si 
              <input type="radio" name="E01DEAIFL" value="N" <% if (cdMant.getE01DEAIFL().equals("N")) out.print("checked"); %>>
              No </td>
          </tr>
          <tr id="trdark">
            <td nowrap >
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEACCN" size="8" maxlength="6" value="<%= cdMant.getE01DEACCN().trim()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
            <td nowrap >
              <div align="right">Tabla de Tasas : </div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEARTB" size="2" maxlength="2" value="<%= cdMant.getE01DEARTB().trim()%>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Estado : </div>
            </td>
            <td nowrap >
              <select name="E01DEADLC">
                <option value=" " <% if (!(cdMant.getE01DEADLC().equals("1") ||cdMant.getE01DEADLC().equals("2")||cdMant.getE01DEADLC().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if (cdMant.getE01DEADLC().equals("1")) out.print("selected"); %>>Activo</option>
				<option value="2" <% if (cdMant.getE01DEADLC().equals("2")) out.print("selected"); %>>Vencido</option>                
				<option value="3" <% if (cdMant.getE01DEADLC().equals("3")) out.print("selected"); %>>Retenido</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right">Forma de Pago :</div>
            </td>
            <td nowrap >
              <input type="text" name="E01DEAPVI" size="2" maxlength="1" value="<%= cdMant.getE01DEAPVI().trim()%>">
              <a href="javascript:GetCode('E01DEAPVI','STATIC_cd_pmnt_via.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0" title="help" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Cuenta Contrapartida</h4>
   <TABLE class="tableinfo">
  <TR><TD>
  
   <table id="headTable">
    <tr id="trdark"> 
            <td nowrap align="center" >Concepto</td>
            <td nowrap align="center" >Banco</td>
            <td nowrap align="center" >Sucursal</td>
            <td nowrap align="center" >Moneda</td>
            <td nowrap align="center" >Referencia</td>
            <td nowrap align="center" >Monto</td>
    </tr>
    </table> 
      
    <div id="dataDiv" class="scbarcolor" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable">
    <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
    <tr id="trclear"> 
      <td nowrap > 
                <div align="center"> 
                  <input type="text" name="E01OFFOP<%= name %>" value="<%= cdMant.getField("E01OFFOP"+name).getString().trim()%>" size="2" maxlength="2">
                  <input type="hidden" name="E01OFFGL<%= name %>" value="<%= cdMant.getField("E01OFFGL"+name).getString().trim()%>">
          <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= cdMant.getField("E01OFFCO"+name).getString().trim()%>" 
                  class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value, document.forms[0].E01OFFCY<%= name %>.value,'E01OFFGL<%= name %>','E01OFFOP<%= name %>','CD')">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdMant.getField("E01OFFBK"+name).getString().trim()%>" onkeypress="enterInteger(event)">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
          <input type="text" name="E01OFFBR<%= name %>" size="4" maxlength="4" value="<%= cdMant.getField("E01OFFBR"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')" onkeypress="enterInteger(event)">
        </div>
      </td>
      <td nowrap  > 
        <div align="center"> 
          <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFCY"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
        </div>
      </td>
      <td nowrap > 
        <div align="center"> 
                  <input type="text" name="E01OFFAC<%= name %>" size="13" maxlength="9"  value="<%= cdMant.getField("E01OFFAC"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01DEABNK.value,'','','','RC')"  onkeypress="enterInteger(event)">
        </div>
      </td>
      <td nowrap > 
                <div align="center"> 
                  <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="13"  value="<%= cdMant.getField("E01OFFAM"+name).getString().trim()%>" onKeyPress="enterDecimal()">
                </div>
      </td>
    </tr>
    <%
    		}
    		%> 
     </table>
        </div>
 <table id="footTable"> 		
    <tr id="trdark"> 
            <td nowrap align="right"><b>Equivalente en Moneda del Certificado 
              :</b> </td>
      <td nowrap align="center"><b><i><strong> 
          <input type="text" name="E01OFFEQV" size="15" maxlength="13" readonly value="<%= cdMant.getE01OFFEQV().trim()%>">
          </strong></i></b>
      </td>
    </tr>
  </table>
  </TD>  
</TR>	
</TABLE>    
 <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv'),0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
	<% 
		if (error.getERWRNG().equals("Y")) { 
			error.setERWRNG(" ");
	%>
			<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A">
    Aceptar con Avisos </h4>
	<% 
		} 
	%>       
 
   <br>
  <div align="center"> 
	   
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>

  </form>
</body>
</html>
