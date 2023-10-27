<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Mantenimiento Aseguradoras y/o Deduccion de Cargos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="broker" class="datapro.eibs.beans.EFE009001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


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

<h3 align="center"><%if (userPO.getPurpose().equals("NEW")) out.print("Nuevo"); else out.print("Mantenimiento");%> Agentes de Bolsa, Seguros y Otros
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="insurance_maint.jsp,EFE0090"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0090" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <input type=HIDDEN NAME="E01FEBTY"  value="<%= broker.getE01FEBATY().trim()%>"> 
  <% String descType="";
     String  type = broker.getE01FEBATY().trim();
     if (userPO.getPurpose().equals("NEW")) {
        if (type.equals("A")) descType="SEGURO AUTOS";
        else if (type.equals("C")) descType="CREDIAHORRO";
        else if (type.equals("T")) descType="Impuestos";
        else if (type.equals("V")) descType="Agente Bolsa";
        else if (type.equals("G")) descType="ADMIN/FONDOS";
        else if (type.equals("I")) descType="Aseguradora";
        else if (type.equals("E")) descType="Ent.Gobierno";
        else if (type.equals("S")) descType="Vendedores";
        else if (type.equals("N")) descType="Notarios";
     } else {
      descType= broker.getE01FEBADS().trim();
     }
  %>
  <table class="tableinfo" id="headtable">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="0" width="100%" >          
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Codigo Deduccion : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01FEBNUM" size="5" maxlength="4" value="<%= broker.getE01FEBNUM().trim()%>" <% if(!userPO.getPurpose().equals("NEW")) out.print("readonly");%>>
                <input type="text" name="E01FEBADS" size="25" maxlength="25" value="<%= descType%>" readonly>
              </div>
            </td>
            <td nowrap > 
              <div align="right">No Cliente :</div>
            </td>
            <td nowrap colspan=3> 
				<eibsinput:help name="broker" property="E01FEBCUN"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" fn_param_one="E01FEBCUN"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n B&aacute;sica</h4>
   
    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">  
            <td nowrap > 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap > 
               <eibsinput:text name="broker" property="E01FEBNM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" readonly="false"/>
           </td>
            <td nowrap > 
              <div align="right">Poliza Numero :</div>
            </td>
            <td nowrap> 
               <eibsinput:text name="broker" property="E01FEBPLZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CARD_NUMBER%>" readonly="false"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Direcci�n :</div>
            </td>
            <td nowrap > 
               <eibsinput:text name="broker" property="E01FEBNM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false"/>
            </td>
            <td nowrap > 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td nowrap> 
               <eibsinput:text name="broker" property="E01FEBBID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" readonly="false"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right"></div>
            </td>
            <td nowrap > 
               <eibsinput:text name="broker" property="E01FEBNM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false"/>
            </td>
            <td nowrap > 
              <div align="right">Nombre Corto :</div>
            </td>
            <td nowrap> 
               <eibsinput:text name="broker" property="E01FEBSNM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" readonly="false"/>
          </td>          
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Ciudad :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E01FEBCTY" size="35" maxlength="35" value="<%= broker.getE01FEBCTY().trim()%>">
            </td>
          </tr>
          <tr id="trdark">   
            <td nowrap > 
              <div align="right">Estado :</div>
            </td>
            <td nowrap> 
				<eibsinput:cnofc name="broker" flag="27" property="E01FEBSTE"  required="false"/>
            </td>
            <td nowrap > 
              <div align="right">Area :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01FEBZI1" size="6" maxlength="5" value="<%= broker.getE01FEBZI1().trim()%>">
              <input type="text" name="E01FEBZI2" size="6" maxlength="5" value="<%= broker.getE01FEBZI2().trim()%>">
            </td>
          </tr>
      	  
       </table>
      </td>
    </tr>
  </table>
  <br>   
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">          
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Tipo de Seguro :</div>
            </td>
            <td nowrap > 
              <select name="E01FEBITY">
                <option value="1" <% if (broker.getE01FEBITY().equals("1")) out.print("selected"); %>>Desgravamen</option>
                <option value="2" <% if (broker.getE01FEBITY().equals("2")) out.print("selected"); %>>Cesantias</option>
                <option value="3" <% if (broker.getE01FEBITY().equals("3")) out.print("selected"); %>>Autos</option>
                <option value="4" <% if (broker.getE01FEBITY().equals("4")) out.print("selected"); %>>Educativo</option>
                <option value="5" <% if (broker.getE01FEBITY().equals("5")) out.print("selected"); %>>Otros</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right">Obligatorio :</div>
            </td>
            <td nowrap > 
              <input type="radio" name="E01FEBOTI" value="Y" <%if(!broker.getE01FEBOTI().equals("N")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="E01FEBOTI" value="N" <%if(broker.getE01FEBOTI().equals("N")) out.print("checked");%>>No 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
             <div align="right">Valor Deduccion :</div>
            </td>
            <td nowrap >
             <input type="text" name="E01FEBVAL" size="16" maxlength="15" value="<%= broker.getE01FEBVAL().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Tipo Deduccion :</div>
            </td>
            <td nowrap >
              <select name="E01FEBFCT">
                <option value="F" <% if (broker.getE01FEBFCT().equals("F")) out.print("selected"); %>>cargo Fijo</option>
                <option value="1" <% if (broker.getE01FEBFCT().equals("1")) out.print("selected"); %>>% Sobre monto Original</option>
                <option value="2" <% if (broker.getE01FEBFCT().equals("2")) out.print("selected"); %>>% Sobre saldo Principal</option>
                <option value="3" <% if (broker.getE01FEBFCT().equals("3")) out.print("selected"); %>>% Sobre valor Cuota</option>
              </select>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Cobro de IVA :</div>
            </td>
            <td nowrap > 
              <select name="E01FEBWTH">
                <option value="W" <% if (!(broker.getE01FEBWTH().equals("F") || broker.getE01FEBWTH().equals("B") || broker.getE01FEBWTH().equals("N"))) out.print("selected"); %>>Retencion</option>
                <option value="F" <% if (broker.getE01FEBWTH().equals("F")) out.print("selected"); %>>Forma 1099</option>
                <option value="B" <% if (broker.getE01FEBWTH().equals("B")) out.print("selected"); %>>Ambos</option>
                <option value="N" <% if (broker.getE01FEBWTH().equals("N")) out.print("selected"); %>>Ninguno</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right">Tasa Activa:</div>
            </td>
            <td nowrap > 
               <eibsinput:text name="broker" property="E01FEBRTA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="false"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Via de Pago :</div>
            </td>
            <td nowrap > 
              <select name="E01FEBPVI">
                <option value="A" <% if (broker.getE01FEBPVI().equals("A")) out.print("selected"); %>>Cuenta Detalle</option>
                <option value="G" <% if (broker.getE01FEBPVI().equals("G")) out.print("selected"); %>>Cuenta Contable</option>
                <option value="F" <% if (broker.getE01FEBPVI().equals("F")) out.print("selected"); %>>Transfer FED</option>
                <option value="T" <% if (broker.getE01FEBPVI().equals("T")) out.print("selected"); %>>Transfer Telex</option>
                <option value="1" <% if (broker.getE01FEBPVI().equals("1")) out.print("selected"); %>>Swift MT-100</option>
                <option value="2" <% if (broker.getE01FEBPVI().equals("2")) out.print("selected"); %>>Swift MT-200</option>
                <option value="" <% if (broker.getE01FEBPVI().equals("")) out.print("selected"); %>>Ninguno</option>
              </select>
            </td>
            <td nowrap > 
              <div align="right">Tasa Pasiva :</div>
            </td>
            <td nowrap > 
               <eibsinput:text name="broker" property="E01FEBRTL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="false"/>
	        </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Descripcion Seguros :</div>
            </td>
            <td nowrap > 
               <eibsinput:text name="broker" property="E01FEBNM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="false"/>
	       </td>
			<td nowrap > 
              <div align="right">Tabla de Tasas de Seguro:</div>
            </td>
			<td nowrap> 
              <input type="text" name="E01FEBUC4" size="6" maxlength="4" value="<%= broker.getE01FEBUC4().trim()%>">            
               <a href="javascript:GetInsuranceFormula('E01FEBUC4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap >
             <div align="right">% Intermediacion :</div>
            </td>
            <td nowrap >
               <eibsinput:text name="broker" property="E01FEBMAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="false"/>
            </td>
            <td nowrap > 
            </td>
            <td nowrap >
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  <br>  
  <TABLE id="mainTable" class="tableinfo">
  <TR><TD>
  
   	<table cellspacing=2 cellpadding=2 width="100%" border="0">
    	 <tr id="trdark"> 
            <td nowrap></td>
            <td nowrap align="CENTER"><b>Banco</b></td>
            <td nowrap align="CENTER"><b>Suc.</b></td>
            <td nowrap align="CENTER"><b>Mda.</b></td>
            <td nowrap align="CENTER"><b>C.Contable</b></td>
            <td nowrap align="CENTER"><b>Referencia</b></td>
            <td nowrap align="CENTER"><b>C.Costo</b></td>
         </tr>     	        	    
         <tr  id="trclear"> 
            <td nowrap> 
              <div align="right">Cuenta Acreditar :</div>
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBCBK" size="2" maxlength="2" value="<%= broker.getE01FEBCBK().trim()%>">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBCBR" size="4" maxlength="4" value="<%= broker.getE01FEBCBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBCCY" size="3" maxlength="3" value="<%= broker.getE01FEBCCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">              
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBCGL" size="17" maxlength="16"  value="<%= broker.getE01FEBCGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBCBK.value,document.forms[0].E01FEBCCY.value,'','','')">        
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBCAC" size="13" maxlength="12"  value="<%= broker.getE01FEBCAC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','RT')">        
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBCCN" size="10" maxlength="8"  value="<%= broker.getE01FEBCCN().trim()%>" class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].E01FEBCBK.value,'','','','')">        
            </td>
         </tr>  
         <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Cuenta de Pago :</div>
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBRBK" size="2" maxlength="2" value="<%= broker.getE01FEBRBK().trim()%>">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBRBR" size="4" maxlength="4" value="<%= broker.getE01FEBRBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBRBK.value,'','','','')">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBRCY" size="3" maxlength="3" value="<%= broker.getE01FEBRCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBRBK.value,'','','','')">              
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBRGL" size="17" maxlength="16"  value="<%= broker.getE01FEBRGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBRBK.value,document.forms[0].E01FEBRCY.value,'','','')">        
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBRAC" size="13" maxlength="12"  value="<%= broker.getE01FEBRAC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBRBK.value,'','','','RT')">        
            </td>
            <td nowrap></td>
         </tr>
         <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Cuenta por Cobrar :</div>
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBXBK" size="2" maxlength="2" value="<%= broker.getE01FEBXBK().trim()%>">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBXBR" size="4" maxlength="4" value="<%= broker.getE01FEBXBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBXBK.value,'','','','')">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBXCY" size="3" maxlength="3" value="<%= broker.getE01FEBXCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBXBK.value,'','','','')">              
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBXGL" size="17" maxlength="16"  value="<%= broker.getE01FEBXGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBXBK.value,document.forms[0].E01FEBXCY.value,'','','')">        
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBXAC" size="13" maxlength="12"  value="<%= broker.getE01FEBXAC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBXBK.value,'','','','RT')">        
            </td>
            <td nowrap></td>
         </tr>
         <tr id="trdark"> 
            <td nowrap > 
              <div align="right">Comision Fogape :</div>
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBGBK" size="2" maxlength="2" value="<%= broker.getE01FEBGBK().trim()%>">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBGBR" size="4" maxlength="4" value="<%= broker.getE01FEBGBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBGBK.value,'','','','')">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBGCY" size="3" maxlength="3" value="<%= broker.getE01FEBGCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBGBK.value,'','','','')">              
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBGGL" size="17" maxlength="16"  value="<%= broker.getE01FEBGGL().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBGBK.value,document.forms[0].E01FEBGCY.value,'','','')">        
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBGAC" size="13" maxlength="12"  value="<%= broker.getE01FEBGAC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBGBK.value,'','','','RT')">        
            </td>
            <td nowrap></td>
         </tr>   
         
         <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Impuesto Sobre Deduccion :</div>
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBBN1" size="2" maxlength="2" value="<%= broker.getE01FEBBN1().trim()%>">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBBR1" size="4" maxlength="4" value="<%= broker.getE01FEBBR1().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01FEBBN1.value,'','','','')">             
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBCC1" size="3" maxlength="3" value="<%= broker.getE01FEBCC1().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01FEBBN1.value,'','','','')">              
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBGL1" size="17" maxlength="16"  value="<%= broker.getE01FEBGL1().trim()%>" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01FEBBN1.value,document.forms[0].E01FEBCC1.value,'','','')">        
            </td>
            <td nowrap>                
                <input type="text" name="E01FEBAC1" size="13" maxlength="12"  value="<%= broker.getE01FEBAC1().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBBN1.value,'','','','RT')">        
            </td>
            <td nowrap><INPUT type="text" name="E01FEBUC1" size="8"
					maxlength="6" value="<%= broker.getE01FEBUC1().trim()%>"
					class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01FEBBN1.value,'','','','RT')">%</td>
         </tr>                 
  		</table>
     </TD>  
  </TR>	
  </TABLE> 
  <br>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark">  
            <td nowrap > 
              <div align="right">Monto Pago Anual :</div>
            </td>
            <td nowrap > 
               <eibsinput:text name="broker" property="E01FEBPYT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false"/>
            </td>
            <td nowrap > 
              <div align="right">Retenido Anual :</div>
            </td>
            <td nowrap colspan=2> 
               <eibsinput:text name="broker" property="E01FEBWYT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
   
 </form>
</body>
</html>
