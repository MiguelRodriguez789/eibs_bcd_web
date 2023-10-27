<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Apertura de Certificados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<jsp:useBean id="cdNew" class="datapro.eibs.beans.EDL013001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

function CheckSubmit(act){
   document.getElementById("ACTION").value=act;
   document.forms[0].submit();
}

function chgConcept(val){
	document.getElementById('E01DEAECU').value=val;
	if (getElement("E01DEAECU").value == ("1")) {					
		document.getElementById("nonpaper").style.display = 'block';
	} else {
		document.getElementById("nonpaper").style.display = 'none';
	} 
}

	function chgPago(val){
	document.getElementById('E01DEAPVI').value=val;
	if (getElement("E01DEAPVI").value == ("A")) {					// ACH
		document.getElementById("nonpaper1").style.display = 'block';
	} else {
		document.getElementById("nonpaper1").style.display = 'none';
	} 
}

function showMandato(){	
	if( document.forms[0].E01DEAECU.value == "1" ){
		document.getElementById('IDMAN').style.display='block' ;
	} else {
		document.getElementById('IDMAN').style.display='block' ;
	}
}

function showAccount(value){
	document.getElementById('cuentaContableLabel').style.display='none';
	document.getElementById('cuentaLabel').style.display='none';
	document.getElementById('contractLabel').style.display='none';
	document.getElementById('helpRetail').style.display='none';
	document.getElementById('helpDP').style.display='none';	
	if(value == "1" || value == "2"){
		document.getElementById('cuentaContable').style.display='none';
		document.getElementById('cuenta').style.display='inline';
		if(value == "2"){
			document.getElementById('contractLabel').style.display='inline';
			document.getElementById('helpDP').style.display='inline';
		} else {
			document.getElementById('cuentaLabel').style.display='inline';
			document.getElementById('helpRetail').style.display='inline';
		}
	} else {
		document.getElementById('cuenta').style.display='none';
		document.getElementById('cuentaContable').style.display='inline';
		document.getElementById('cuentaContableLabel').style.display='inline';
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
     
 boolean protect = JSEIBSProp.getProtectedBNKBRN();
%>

<h3 align="center">Apertura de <%=cdNew.getE01DEANR1() %> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_opening.jsp,EDL0130" width="32" height="32"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="ACTION" id="ACTION" VALUE="F">
  <input type=HIDDEN name="E01DEAACD" id="E01DEAACD" value="<%= cdNew.getE01DEAACD().trim()%>"">
  <input type=HIDDEN name="E01DEAACC" id="E01DEAACC" value="<%= cdNew.getE01DEAACC().trim()%>"">
  <INPUT TYPE=HIDDEN NAME="E01FLTTYP" id="E01FLTTYP" VALUE="">
  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" id="E01DEACUN" size="10" maxlength="9" value="<%= cdNew.getE01DEACUN().trim()%>">
                <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
			 </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
              	<eibsinput:text property="E01CUSNA1" name="cdNew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" />
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01DEAACC2" id="E01DEAACC2" size="15" maxlength="12" value="NUEVA CUENTA">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
              	<eibsinput:text property="E01DEACCY" name="cdNew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
              	<eibsinput:text property="E01DEAPRO" name="cdNew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4> 
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Nombre del Certificado :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEANME" name="cdNew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" />
            </td>
           <td nowrap width="25%"> 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" value="<%= cdNew.getE01DEATRM().trim()%>">
              <select name="E01DEATRC" id="E01DEATRC">
                <option value=" " <% if (!(cdNew.getE01DEATRC().equals("D") ||cdNew.getE01DEATRC().equals("M")||cdNew.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(cdNew.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(cdNew.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(cdNew.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Ayuda" align="bottom" border="0" > 
            </td>
          </tr>        
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%">
               <eibsinput:date name="cdNew" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" /> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tabla de Tasa :</div>
            </td>
            <td nowrap width="25%" >
              <input type="text" name="E01DEARTB" id="E01DEARTB" size="3" maxlength="2" value="<%= cdNew.getE01DEARTB().trim()%>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
               <eibsinput:date name="cdNew"  fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" /> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Inter&eacute;s/Spread:</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEARTE" class="txtright" size="10" maxlength="9" value="<%= cdNew.getE01DEARTE().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td nowrap width="25%" > 
              <div align="right">Tabla de Tasa Flotante :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEAFTB" id="E01DEAFTB" size="3" maxlength="2" value="<%= cdNew.getE01DEAFTB().trim()%>">
              <a href="javascript:GetFloating('E01DEAFTB','','E01FLTDSC','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
              <select name="E01DEAFTY" id="E01DEAFTY">
                <option value=" " <% if (!(cdNew.getE01DEAFTY().equals("FP") ||cdNew.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (cdNew.getE01DEAFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                <option value="FS" <% if (cdNew.getE01DEAFTY().equals("FS")) out.print("selected"); %>>Secundaria</option>
              </select>
              <input type="text" name="E01FLTDSC" id="E01FLTDSC" size="40" maxlength="40" readonly value="<%= cdNew.getE01FLTDSC().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa Flotante Base :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01FLTORG" class="txtright" size="9" maxlength="9" value="<%= cdNew.getE01FLTORG().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%">
              <div align="right"> Manejo Puntos Adicional :</div> 
            </td>
            <td nowrap width="25%"> 
	             <select name="E01DEAFLX" id="E01DEAFLX">
	              <OPTION value=" " <% if (!(cdNew.getE01DEAFLX().equals("B") ||cdNew.getE01DEAFLX().equals("E")||cdNew.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(cdNew.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(cdNew.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(cdNew.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	      	</td>
            <td nowrap width="25%">
              <div align="right"> Valor Tasa Adicional :</div> 
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEARTX" class="txtright" size="9" maxlength="9" value="<%= cdNew.getE01DEARTX().trim()%>">
            </td> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Ciclo/Fecha Revis.Tasa :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEARRP" id="E01DEARRP" size="3" maxlength="3" value="<%= cdNew.getE01DEARRP().trim()%>" onblur="rightAlignCharNumber()">
              <a href="javascript:GetCode('E01DEARRP','STATIC_cycle_rev_cd.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
              /
               <eibsinput:date name="cdNew"  fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY" /> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01FLTRTE" class="txtright" size="9" maxlength="9" value="<%= cdNew.getE01FLTRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Tasa Nominal del Certificado :</div>
            </td>
            <td nowrap width="25%"> 
               <input type="text" name="E01RATE" size="10" maxlength="9" value="<%= cdNew.getE01RATE().trim()%>" readonly="readonly">      
            </td> 
            <td nowrap width="25%" > 
              <div align="right">Tasa Efectiva Anual:</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEASPR" class="txtright" size="10" maxlength="9" value="<%= cdNew.getE01DEASPR().trim()%>" onKeypress="enterDecimal(event, 6)" > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="25%" > 
                <eibsinput:text name="cdNew" property="E01DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  required="true"/>
            <td nowrap width="25%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="25%" >
            <% if (!protect) {%>
              <input type="text" name="E01DEABNK" id="E01DEABNK" size="2" maxlength="2" value="<%= cdNew.getE01DEABNK().trim()%>" >
              <input type="text" name="E01DEABRN" id="E01DEABRN" size="5" maxlength="4" value="<%= cdNew.getE01DEABRN().trim()%>">
              <a href="javascript:GetBranch('E01DEABRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
            <% } else { %>
              <input type="text" name="E01DEABNK" id="E01DEABNK" size="2" maxlength="2" value="<%= cdNew.getE01DEABNK().trim()%>" readonly>
              <input type="text" name="E01DEABRN" id="E01DEABRN" size="5" maxlength="4" value="<%= cdNew.getE01DEABRN().trim()%>" readonly>
            <% } %>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" >
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="25%" >
              <input type="text" name="E01DEACCY2" id="E01DEACCY2" size="4" maxlength="3" value="<%= cdNew.getE01DEACCY().trim()%>" readonly>
            </td>
            <td nowrap width="25%" >
              <div align="right">Centro de Costo : </div>
            </td>
            <td nowrap width="25%" >
              <input type="text" name="E01DEACCN" id="E01DEACCN" size="9" maxlength="8" value="<%= cdNew.getE01DEACCN().trim()%>">
              <a href="javascript:GetCostCenter('E01DEACCN','01')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Uso de Domicilio :</div>
            </td>
            <td nowrap width="25%"> 
              <select name="E01DEAWHF" id="E01DEAWHF" >
                <option value=" " <% if (!(cdNew.getE01DEAWHF().equals("R") || cdNew.getE01DEAWHF().equals("C")
                							 || cdNew.getE01DEAWHF().equals("O"))) out.print("selected"); %>> 
                </option>
                <option value="R" <% if (cdNew.getE01DEAWHF().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
                <option value="C" <% if (cdNew.getE01DEAWHF().equals("C")) out.print("selected"); %>>Correo Eléctronico</option>
                <option value="O" <% if (cdNew.getE01DEAWHF().equals("O")) out.print("selected"); %>>Oficina del Banco</option>
              </select> 
              <input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= cdNew.getE01DEAMLA().trim()%>">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value,document.forms[0].E01DEAWHF.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td width="25%" > 
              <div align="right">Clase de Certificado :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01DEACLF" id="E01DEACLF" size="2" maxlength="1" value="<%= cdNew.getE01DEACLF().trim()%>">
              <a href="javascript:GetCode('E01DEACLF','STATIC_cd_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
            <td nowrap width="25%" >
              <div align="right">Clase de Certificado :</div>  
            </td>
            <td nowrap width="25%">
       			<input type="hidden" name="E01DEAECU" id="E01DEAECU" value="<%= cdNew.getE01DEAECU()%>" >
       			<input type="radio" name="CE01DEAECU" id="CE01DEAECU" value="2" onClick="chgConcept('2')"
	  			<%if(cdNew.getE01DEAECU().equals("2")) out.print("checked");%>>
          			Físico 
       			<input type="radio" name="CE01DEAECU" id="CE01DEAECU" value="1" onClick="chgConcept('1')"
	  			<%if(cdNew.getE01DEAECU().equals("1")) out.print("checked");%>>
           			Desmaterializado 
            </td>
             <td nowrap width="25%" > 
              <div align="right">Tasa de Cambio M/E :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEAEXR" id="E01DEAEXR" class="txtright" size="11" maxlength="11" value="<%= cdNew.getE01DEAEXR().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="25%" > 
              <div align="right">N&uacute;mero Referencia :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEAREF" id="E01DEAREF" size="13" maxlength="12" value="<%= cdNew.getE01DEAREF().trim()%>">
            </td>   
          	<td nowrap width="25%" > 
              <div align="right">Referido por:</div>
            </td>
            <td nowrap width="25%" >
			 <input type="text" name="E01CMOREF" size="12" maxlength="10" value="<%= cdNew.getE01CMOREF().trim()%>" onkeypress="enterInteger(event)">
             <a href="javascript:GetCustomer('E01CMOREF')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
            </td>   
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="25%" > 
              <div align="right">Amort. Nic 39 :</div>
            </td>
            <td nowrap width="25%" >
            	<eibsinput:help fn_param_one="E01DEABRK" fn_param_three="S" property="E01DEABRK" name="cdNew" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER %>" />
            </td> 
            <td nowrap width="25%" > 
            	<div align="right">Condición de Manejo :</div>
            </td>
            <td nowrap width="25%" >
                <select name="E01DEAPAF" id="E01DEAPAF" >
                <option value=" " <% if (!(cdNew.getE01DEAPAF().equals("Y") && !cdNew.getE01DEAPAF().equals("O")))
                					 out.print("selected"); %>> 
                </option>
                <option value="Y" <% if (cdNew.getE01DEAPAF().equals("Y")) out.print("selected"); %>>Y</option>
                <option value="O" <% if (cdNew.getE01DEAPAF().equals("O")) out.print("selected"); %>>O</option>
              </select> 
			</td> 
		  </tr>
        </table>
      </td>
    </tr>
  </table>

  <div id="nonpaper">
  <h4>Depositos Desmaterializados</h4> 
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">             
    	    	<td nowrap width="25%" >
       				<div align="right">ISIN ANNA :</div>
      	 		</td> 
    			<td nowrap width="25%" >
	             <input type="text" readonly name="E01DEACUI" size="14" maxlength="12" value="<%= cdNew.getE01DEACUI().trim()%>">
				</td>
	            <td nowrap width="25%" >
	              <div align="right">Forma de Compensacion :</div>  
	            </td>
	            <td nowrap width="25%">
	       			<input type="radio" name="E01DEAF02" id="E01DEAF02" value="Y"
		  			<%if(cdNew.getE01DEAF02().equals("Y")) out.print("checked");%>>
	          			DVP 
	       			<input type="radio" name="E01DEAF02" id="E01DEAF02" value="N"
		  			<%if(!cdNew.getE01DEAF02().equals("Y")) out.print("checked");%>>
	           			LP 
	            </td>
	   		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
	        	<td nowrap width="25%" >
    	          <div align="right">Agente Comprador :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEADIB" size="5" maxlength="4" value="<%= cdNew.getE01DEADIB().trim()%>" > 
	                <% if(cdNew.getE01DEAACD().equals("12")){%>
	              		<a href="javascript:GetCodeDescCNOFC('E01DEADIB','D01DEADIB','D7')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
					<% } %>
	              <input type="text" name="D01DEADIB" size="40" maxlength="35" value="<%= cdNew.getD01DEADIB().trim()%>" readonly>
	                <% if(!cdNew.getE01DEAACD().equals("12")){%>
	              		<a href="javascript:GetCodeDescCNOFC('E01DEADIB','D01DEADIB','D7')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
					<% } %>
	 			</td>
	            <td nowrap width="25%" > 
	       			<div align="right">Cuenta Inversionista :</div>
     	       </td>      
 		       <td nowrap width="25%" >
	              <input type="text" readonly name="E01DEAIVC" size="22" maxlength="20" value="<%= cdNew.getE01DEAIVC().trim()%>"
	                <% if(cdNew.getE01DEAACD().equals("12")){%> readonly <% } %>	              
	              >
	           </td>      
	   		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta SEBRA Vendedor :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEACRC" size="22" maxlength="20" value="<%= cdNew.getE01DEACRC().trim()%>"
	                <% if(cdNew.getE01DEAACD().equals("12")){%> readonly <% } %>	              
	              >
	 			</td>
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta SEBRA Comprador :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEAUNR" size="22" maxlength="20" value="<%= cdNew.getE01DEAUNR().trim()%>"
	                <% if(cdNew.getE01DEAACD().equals("12")){%> readonly <% } %>	              
	              >
	 			</td>
	   		</tr>


       </table>
      </td>
    </tr>
  </table>
</div>
  
  
  <h4>Instrucciones al Vencimiento</h4> 
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
   		     	<td nowrap width="25%" >
       				<div align="right">Tipo de Prorroga :</div>
       			</td> 
    			<td nowrap width="25%" >
	              <input type="text" name="E01DEAROC" size="2" maxlength="1" value="<%= cdNew.getE01DEAROC().trim()%>">
	              <%if(userPO.getApplicationCode().equals("12")){ %>
	              <a href="javascript:GetCode('E01DEAROC','STATIC_bono_renewal.jsp')">
	              <%}else{ %>
	              <a href="javascript:GetCode('E01DEAROC','STATIC_cd_renewal.jsp')">
	              <%} %>
	              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a> 
				</td>
	            <td nowrap width="25%" > 
    	   			<div align="right">Vía de Pago :</div>	            
	            </td>      
	            <td nowrap width="25%" >
	              <select name="E01DEAPVI" onchange="ChgPago();" >
	                <option value="" <% if (!(cdNew.getE01DEAPVI().equals("F") || cdNew.getE01DEAPVI().equals("Q")|| cdNew.getE01DEAPVI().equals("C")||
					cdNew.getE01DEAPVI().equals("T") ||cdNew.getE01DEAPVI().equals("1")||cdNew.getE01DEAPVI().equals("2") 
					||cdNew.getE01DEAPVI().equals("3")))out.print("selected"); %>> 
	                </option>
	                <option value="C" <% if (cdNew.getE01DEAPVI().equals("C")){out.print("selected");} %>>Cheque de Gerencia
	                </option>
	                <option value="F" <% if (cdNew.getE01DEAPVI().equals("F")){out.print("selected");} %>>FED 
	                </option>
	                <option value="Q" <% if (cdNew.getE01DEAPVI().equals("Q")){out.print("selected");} %>>Emisi&oacute;n 
	                Cupones</option>
	                <option value="1" <% if (cdNew.getE01DEAPVI().equals("1")){out.print("selected");} %>>Swift 
	                Formato MT-100</option>
	                <option value="2" <% if (cdNew.getE01DEAPVI().equals("2")){out.print("selected");} %>>Swift 
	                Formato MT-200</option>
	                <option value="3" <% if (cdNew.getE01DEAPVI().equals("3")){out.print("selected");} %>>Swift 
	                Formato MT-300</option>
	                <option value="A" <% if (cdNew.getE01DEAPVI().equals("A")){out.print("selected");} %>>ACH 
	                </option>
	              </select>

  	            </td>    
	   		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	      	     <td nowrap width="25%" > 
        	      <div align="right">La cuenta de Pago es un(a):</div>
	            </td>      
	            <td nowrap width="25%" >
                <select name="E01FLGACC" onchange="showAccount(this.value)">
                  <option value="" <% if (cdNew.getE01FLGACC().equals("")){out.print("selected");} %>>Cuenta Contable</option>                  
                  <option value="1" <% if (cdNew.getE01FLGACC().equals("1")){out.print("selected");} %>>Cuenta Corriente o de Ahorros</option>
                  <option value="2" <% if (cdNew.getE01FLGACC().equals("2")){out.print("selected");} %>>Certificado</option>
                </select>
     	       </td>
				<td nowrap width="25%" align="right">
    	   			<span id="cuentaContableLabel" style="display: <%= cdNew.getE01FLGACC().equals("") ? "inline" : "none"%>">Número de Cuenta Contable :</span>
    	   			<span id="cuentaLabel" style="display: <%= cdNew.getE01FLGACC().equals("1") ? "inline" : "none"%>">Número de Cuenta :</span>
    	   			<span id="contractLabel" style="display: <%= cdNew.getE01FLGACC().equals("2") ? "inline" : "none"%>">Contrato a Acreditar :</span>
    	   		</td> 
 		   		<td nowrap width="25%" >
					<span id="cuentaContable" style="display: <%= cdNew.getE01FLGACC().equals("") ? "inline" : "none"%>">
					<input type="text" name="E01DEARGL" size="20" maxlength="16" value="<%= cdNew.getE01DEARGL().trim()%>" onKeypress="enterInteger(event)">
					<a href="javascript:GetLedger('E01DEARGL',document.forms[0].E01DEABNK.value,document.forms[0].E01DEACCY.value,'')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
					</span>
					<span id="cuenta" style="display: <%= cdNew.getE01FLGACC().equals("") ? "none" : "inline"%>">
					<input type="text" name="E01DEARAC" size="15" maxlength="12" value="<%= cdNew.getE01DEARAC().trim()%>" onKeypress="enterInteger(event)">
					</span>
					<span id="helpRetail" style="display: <%= cdNew.getE01FLGACC().equals("1") ? "inline" : "none"%>">
					<a href="javascript:GetAccount('E01DEARAC',document.forms[0].E01DEABNK.value,'RT','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					</span>
					<span id="helpDP" style="display: <%= cdNew.getE01FLGACC().equals("2") ? "inline" : "none"%>">
					<a href="javascript:GetAccount('E01DEARAC',document.forms[0].E01DEABNK.value,'CD','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					</span>
 				</td> 
  	 		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
   		     	<td nowrap width="25%" >
       				<div align="right">Periodo Pago Intereses :</div>
       			</td> 
    			<td nowrap width="25%" >
                <input type="text" name="E01DEAROY" size="3" maxlength="3" value="<%= cdNew.getE01DEAROY().trim()%>">
                <select name="E01DEAODA">
                  <option value="" <% if (!(cdNew.getE01DEAODA().equals("D") || cdNew.getE01DEAODA().equals("M")||
				cdNew.getE01DEAODA().equals("Y")))out.print("selected"); %>> 
                  </option>
                  <option value="D" <% if (cdNew.getE01DEAODA().equals("D")){out.print("selected");} %>>Dias</option>
                  <option value="M" <% if (cdNew.getE01DEAODA().equals("M")){out.print("selected");} %>>De Cada Mes</option>
                  <option value="Y" <% if (cdNew.getE01DEAODA().equals("Y")){out.print("selected");} %>>A&ntilde;os</option>
                </select>
				</td>
				<td nowrap width="25%" >
    	   			<div align="right">Formato Cheque IBS :
    	   			<br>
				(Si via de pago es Cheque)</div>
    	   		</td> 
 		   		<td nowrap width="25%" >
	              <input type="text" name="E01DEAOFT" size="5" maxlength="2" value="<%= cdNew.getE01DEAOFT().trim()%>" onKeypress="enterInteger()">
	              <a href="javascript:GetOffChkPar('E01DEAOFT')"> 
    	    	  <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a>
	              
 				</td>
	      </tr>
	      <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       <td nowrap width="25%" >
            		<div align="right">Tasa de Prorroga : </div>
            </td>
            <td nowrap width="25%" >
            	<input type="text" name="E01DEAROR" size="9" maxlength="9" value="<%= cdNew.getE01DEAROR().trim()%>">
             	<select name="E01DEAHTM">
                	<option value=" " <% if (!(cdNew.getE01DEAHTM().equals("4")||cdNew.getE01DEAHTM().equals("3")|| cdNew.getE01DEAHTM().equals("2")||cdNew.getE01DEAHTM().equals("1"))) out.print("selected"); %>></option>
                	<option value="1" <% if (cdNew.getE01DEAHTM().equals("1")) out.print("selected"); %>>Sumar</option>
                	<option value="2" <% if (cdNew.getE01DEAHTM().equals("2")) out.print("selected"); %>>Restar</option>
                	<option value="3" <% if (cdNew.getE01DEAHTM().equals("3")) out.print("selected"); %>>Sustituir</option>
                	<option value="4" <% if (cdNew.getE01DEAHTM().equals("4")) out.print("selected"); %>>Mantener</option>
              	</select>
            </td>
            <td nowrap width="25%" >
            </td>
            <td nowrap width="25%" >
            </td>
          </tr>
          <%if(userPO.getApplicationCode().equals("12")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       <td nowrap width="25%" >
            		<div align="right">Liquidacion interes : </div>
            </td>
            <td nowrap width="25%" >
            	<input type="radio" name="E01DEAF03" id="E01DEAF03" value="1" 
	  			<%if(cdNew.getE01DEAF03().equals("1")) out.print("checked");%>>
          			Tasa previa 
       			<input type="radio" name="E01DEAF03" id="E01DEAF03" value="2"
	  			<%if(cdNew.getE01DEAF03().equals("2")) out.print("checked");%>>
           			Tasa actual 
	        </td>
           <td nowrap width="25%" >
            	<div align="right">Periodo de Gracia : </div>
            </td>
            <td nowrap width="25%" >
            	<input type="text" name="E01DEAGPD" size="4" maxlength="2" value="<%= cdNew.getE01DEAGPD().trim()%>" onKeypress="enterInteger()">
            </td>
            
          </tr>			 
          <%} %>
       </table>
      </td>
    </tr>
  </table>

  <div id="nonpaper1">
		<h4>Transferencia ACH</h4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF"> 
				<td nowrap> 
					<table cellspacing="0" cellpadding="2" width="100%" border="0" > <%row = 1;%>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"><div align="right">Banco Destino (Ruta) :</div></td>
							<td width="30%">
								<input type="text" name="E01DEAABA" size="12" maxlength="9" value="<%= cdNew.getE01DEAABA().trim()%>">
								<a href="javascript:GetAchOperator('E01DEAABA','O',' ','D')"> 
									<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
								</a>
							</td>
							<td width="20%"><div align="right">Tipo de Cuenta :</div></td>
							<td width="30%">
								<select name="E01DEAACT">
							  		<option value="C" <% if (!(cdNew.getE01DEAACT().equals("C"))) out.print("selected"); %>>Corriente </option>
									<option value="S" <% if   (cdNew.getE01DEAACT().equals("S"))  out.print("selected"); %>>Ahorros   </option>
								</select>
							</td>
						</tr>
						
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Cuenta del Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAFAC" size="19" maxlength="17" value="<%= cdNew.getE01DEAFAC().trim()%>">
							</td>
							<td width="20%"> 
								<div align="right">Nombre Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAFNM" size="50" maxlength="45" value="<%= cdNew.getE01DEAFNM().trim()%>">
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Descripcion ACH :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEATDS" size="50" maxlength="45" value="<%= cdNew.getE01DEATDS().trim()%>">
							</td>
							<td width="20%"> 
								<div align="right">ID Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAAID" size="15" maxlength="15" value="<%= cdNew.getE01DEAAID().trim()%>">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>  



  <h4>Origen de Fondos</h4>
<TABLE id="mainTable" class="tableinfo" width="80%">
	<tr>
	<td>
	<table id="headTable" >
    <tr id="trdark"> 
				    <td nowrap align="center" width="30%">Concepto</td>
				    <td nowrap align="center" width="10%">Banco</td>
				    <td nowrap align="center" width="10%">Sucursal</td>
				    <td nowrap align="center" width="10%"> Moneda</td>
				    <td nowrap align="center" width="20%"> Referencia </td>
				    <td nowrap align="center" width="20%"> Monto</td>
    </tr>
    </table>
    
    <div id="dataDiv" style="height:60; overflow:auto;"> 
     <table id="dataTable" width="100%">     

          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="center" > 
            	<%= i %>
                <input type="text" name="E01OFFOP<%= name %>" id="E01OFFOP<%= name %>" value="<%= cdNew.getField("E01OFFOP"+name).getString().trim()%>" size="3" maxlength="3">
                <input type="hidden" name="E01OFFGL<%= name %>" value="<%= cdNew.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="45" maxlength="45" readonly value="<%= cdNew.getField("E01OFFCO"+name).getString().trim()%>" 
                  class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value, document.forms[0].E01OFFCY<%= name %>.value,'E01OFFGL<%= name %>','E01OFFOP<%= name %>',document.forms[0].E01DEAACD.value,'01')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdNew.getField("E01OFFBK"+name).getString().trim()%>"  readonly>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name %>" size="4" maxlength="4" value="<%= cdNew.getField("E01OFFBR"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdNew.getField("E01OFFCY"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" id="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= cdNew.getField("E01OFFAC"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01OFFBK<%= name %>.value, document.forms[0].E01OFFCY<%= name %>.value , getElement('E01DEACUN').value,'','RT')">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
                <input type="text" name="E01OFFAM<%= name %>" size="23" maxlength="15"  value="<%= cdNew.getField("E01OFFAM"+name).getString().trim()%>" onKeypress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
    
    	  </table>
        </div>
        
     <table id="footTable" > 
          <tr id="trdark"> 
        	<td nowrap width="80%" align="right"><b>Equivalente Moneda del Certificado :</b> 
            </td>
            <td nowrap width="20%" align="center"><b><i><strong> 
                <input type="text" name="E01OFFEQV" size="23" maxlength="17" readonly value="<%= cdNew.getE01OFFEQV().trim()%>">
                </strong></i></b>
            </td>
          </tr>
     </table>
   </TD>  
</TR>	
</TABLE>  
  
 <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables(document.getElementById("headTable"), document.getElementById("dataTable"), document.getElementById("dataDiv"), 0, true);
   }
  tableresize();
  window.onresize=tableresize;
  chgConcept('2');
  chgPago('2');
  </SCRIPT>
  <% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(cdNew.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Avisos</h4>
  <% } %>         
  <p align="center"> 
    <input id="EIBSBTN" type=button name="Submit"  onClick="CheckSubmit('F')" value="Enviar">
  </p>

  
  </form>
</body>
</html>
