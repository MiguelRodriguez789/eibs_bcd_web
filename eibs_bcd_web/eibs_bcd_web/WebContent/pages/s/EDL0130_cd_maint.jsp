<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Información Básica de Certificados de Depósito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<jsp:useBean id="cdMant" class="datapro.eibs.beans.EDL013001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>

<body>

<SCRIPT type="text/javascript">
  builtNewMenu(cd_m_opt);
  initMenu();
  
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

// Desmaterializado
function chgConcept(val){
	document.getElementById('E01DEAECU').value=val;
	if (getElement("E01DEAECU").value == ("1")) {					
		document.getElementById("nonpaper").style.display = 'block';
	} else {
		document.getElementById("nonpaper").style.display = 'none';
	} 
}

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 boolean protect = JSEIBSProp.getProtectedBNKBRN();
%>

<h3 align="center"><%=cdMant.getE01DEANR1() %>- Informaci&oacute;n B&aacute;sica
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_maint.jsp,EDL0130"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="4">
  <input type=HIDDEN name="E01DEAACD" id="E01DEAACD" value="<%= cdMant.getE01DEAACD().trim()%>">
  <input type=HIDDEN name="FLGDEAACU" id="FLGDEAECU" value="<%= cdMant.getE01DEAECU().trim()%>">
  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="0" width="100%" >
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" id="E01DEACUN" size="10" maxlength="9" value="<%= cdMant.getE01DEACUN().trim()%>">
                <a href="javascript:GetCustomer('E01DEACUN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E01CUSNA1" id="E01CUSNA1" size="45" maxlength="45" value="<%= cdMant.getE01CUSNA1().trim()%>" readonly>
                </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01DEAACC" id="E01DEAACC" size="13" maxlength="12" value="<%= cdMant.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
              	<eibsinput:text property="E01DEACCY" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left">
              	<eibsinput:text property="E01DEAPRO" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n General</h4>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Nombre del Certificado :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEANME" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" />
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>        
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%"> 
               <eibsinput:date name="cdMant"  fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="true"/> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="25%"> 
            <% if (!protect && cdMant.getH01FLGMAS().trim().equals("N")) {%>
                <eibsinput:text name="cdMant" property="E01DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  required="true"/>
            <% } else { %>
                <eibsinput:text name="cdMant" property="E01DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
            <% } %>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
               <eibsinput:date name="cdMant"  fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" readonly="True"/> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Saldo Principal :</div>
            </td>
            <td nowrap width="25%"> 
                <eibsinput:text name="cdMant" property="E01DEAMEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tasa Interes :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01RATE" id="E01RATE" size="10" maxlength="9" value="<%= cdMant.getE01RATE().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Saldo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="25%"> 
                <eibsinput:text name="cdMant" property="E01DEAMEI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEABAS" id="E01DEABAS" size="3" maxlength="3" value="<%= cdMant.getE01DEABAS().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right"> Moneda :</div>
            </td>
            <td nowrap width="25%"> 
             <input type="text" name="E01DEACCY2" id="E01DEACCY2" size="4" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" readonly>

            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4>
  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
<!--         <table cellspacing=0 cellpadding=2 width="100%" border="0"> -->
		<table id="tableBasicInfo" class="mainInfo4Col" >
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td  > 
              <div align="right">Nuevo Vencimiento :</div>
            </td>
            <td  > 
               <eibsinput:date name="cdMant" fn_month="E01NEWMDM" fn_day="E01NEWMDD" fn_year="E01NEWMDY" /> 
            </td>
            <td  > 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td  > 
              <div align="left">
              <input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" value="<%= cdMant.getE01DEATRM().trim()%>" onKeypress="enterInteger(event)">
              <select name="E01DEATRC" id="E01DEATRC">
                <option value=" " <% if (!(cdMant.getE01DEATRC().equals("D") ||cdMant.getE01DEATRC().equals("M")||cdMant.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(cdMant.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(cdMant.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(cdMant.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Ayuda" align="bottom" border="0"> 
            </div>
            </td>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Tabla de Tasa Flotante :</div>
            </td>
            <td width="25%" > 
            <%if(cdMant.getE01FLGNEW().equals("N")){ %>
              <input type="text" name="E01DEAFTB" id="E01DEAFTB" size="3" maxlength="2" value="<%= cdMant.getE01DEAFTB().trim()%>" readonly>
              <select name="E01DEAFTY" id="E01DEAFTY" disabled>
                <option value=" " <% if (!(cdMant.getE01DEAFTY().equals("FP") ||cdMant.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (cdMant.getE01DEAFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                <option value="FS" <% if (cdMant.getE01DEAFTY().equals("FS")) out.print("selected"); %>>Secundaria</option>
              </select>
               <input type="text" name="E01FLTDSC" id="E01FLTDSC" size="40" maxlength="40" readonly value="<%= cdMant.getE01FLTDSC().trim()%>">
             <%}else{ %>
             	<input type="text" name="E01DEAFTB" id="E01DEAFTB" size="3" maxlength="2" value="<%= cdMant.getE01DEAFTB().trim()%>">
              	<a href="javascript:GetFloating('E01DEAFTB','','E01FLTDSC','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
              	<select name="E01DEAFTY" id="E01DEAFTY" >
                	<option value=" " <% if (!(cdMant.getE01DEAFTY().equals("FP") ||cdMant.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                	<option value="FP" <% if (cdMant.getE01DEAFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                	<option value="FS" <% if (cdMant.getE01DEAFTY().equals("FS")) out.print("selected"); %>>Secundaria</option>
              	</select>
               <input type="text" name="E01FLTDSC" id="E01FLTDSC" size="40" maxlength="40" readonly value="<%= cdMant.getE01FLTDSC().trim()%>">
             <%} %>  
            </td>
            <td width="25%" > 
              <div align="right">Tasa Flotante Base :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01FLTORG" id="E01FLTORG" size="10" maxlength="9" value="<%= cdMant.getE01FLTORG().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="25%">
              <div align="right"> Manejo Puntos Adicional :</div> 
            </td>
            <td nowrap width="25%"> 
               <%if(cdMant.getE01FLGNEW().equals("N")){ %>
	             <select name="E01DEAFLX" id="E01DEAFLX" disabled>
	              <OPTION value=" " <% if (!(cdMant.getE01DEAFLX().equals("B") || cdMant.getE01DEAFLX().equals("E")|| cdMant.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(cdMant.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(cdMant.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(cdMant.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	           <%}else{ %>
	           	<select name="E01DEAFLX" id="E01DEAFLX">
	              <OPTION value=" " <% if (!(cdMant.getE01DEAFLX().equals("B") || cdMant.getE01DEAFLX().equals("E")|| cdMant.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(cdMant.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(cdMant.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(cdMant.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	           <%} %>
	      	</td>
	      	 <td nowrap width="25%">
              <div align="right"> Valor Tasa Adicional :</div> 
            </td>
            <td nowrap width="25%" > 
              <%if(cdMant.getE01FLGNEW().equals("N")){ %>
              	<input type="text" name="E01DEARTX" class="txtright" size="9" maxlength="9" value="<%= cdMant.getE01DEARTX().trim()%>" readonly>
              <%}else{ %>
              	  <input type="text" name="E01DEARTX" class="txtright" size="9" maxlength="9" value="<%= cdMant.getE01DEARTX().trim()%>" >
              <%} %>
            </td> 
	      </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Ciclo/Fecha  Revis. Tasa :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01DEARRP" id="E01DEARRP" size="3" maxlength="3" value="<%= cdMant.getE01DEARRP().trim()%>" onblur="rightAlignCharNumber()">
              <a href="javascript:GetCode('E01DEARRP','STATIC_cycle_rev_cd.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
              / 
               <eibsinput:date name="cdMant"  fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY" /> 
            </td>
            <td width="25%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01FLTRTE" id="E01FLTRTE" size="10" maxlength="9" value="<%= cdMant.getE01FLTRTE().trim()%>" readonly>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           <td width="25%" > 
              <div align="right">Tabla de Tasa : </div>
            </td>
            <td width="25%" >
              <input type="text" name="E01DEARTB" id="E01DEARTB" size="3" maxlength="2" value="<%= cdMant.getE01DEARTB().trim()%>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a> 
            </td>
            <td width="25%" > 
              <div align="right">Tasa Inter&eacute;s/Spread :</div>
            </td>
            <td width="25%" > 
            	 <%if(cdMant.getE01FLGNEW().equals("N")){ %>
           		<input type="text" name="E01DEARTE" id="E01DEARTE" size="10" maxlength="9" value="<%= cdMant.getE01DEARTE().trim()%>" readonly>
           		 <% }else{ %>
           		 <input type="text" name="E01DEARTE" id="E01DEARTE" size="10" maxlength="9" value="<%= cdMant.getE01DEARTE().trim()%>" >
           		  <% }%> 	
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td width="25%" > 
              <div align="right">Tipo de Inter&eacute;s :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01DEAICT" id="E01DEAICT" size="2" maxlength="1" value="<%= cdMant.getE01DEAICT().trim()%>">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
             <td nowrap width="25%" > 
              <div align="right">Tasa Efectiva Anual:</div>
            </td>
            <td width="25%" > 
              <%if(cdMant.getE01FLGNEW().equals("N")){ %>
           		<input type="text" name="E01DEASPR" id="E01DEASPR" size="10" maxlength="9" value="<%= cdMant.getE01DEASPR().trim()%>" readonly>
           	  <% }else{ %>
           	  <input type="text" name="E01DEASPR" id="E01DEASPR" size="10" maxlength="9" value="<%= cdMant.getE01DEASPR().trim()%>" >
           	  <% }%> 	
            </td>
          </tr>
         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             <td nowrap width="25%" > 
              <div align="right">Uso de Domicilio :</div>
            </td>
            <td nowrap width="25%"> 
              <select name="E01DEAWHF" id="E01DEAWHF" >
                <option value=" " <% if (!(cdMant.getE01DEAWHF().equals("R") || cdMant.getE01DEAWHF().equals("C")
                							 || cdMant.getE01DEAWHF().equals("O"))) out.print("selected"); %>> 
                </option>
                <option value="R" <% if (cdMant.getE01DEAWHF().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
                <option value="C" <% if (cdMant.getE01DEAWHF().equals("C")) out.print("selected"); %>>Correo Eléctronico</option>
                <option value="O" <% if (cdMant.getE01DEAWHF().equals("O")) out.print("selected"); %>>Oficina del Banco</option>
              </select> 
              <input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= cdMant.getE01DEAMLA().trim()%>">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value,document.forms[0].E01DEAWHF.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td width="25%" > 
              <div align="right">Clase de Certificado :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01DEACLF" id="E01DEACLF" size="2" maxlength="1" value="<%= cdMant.getE01DEACLF().trim()%>">
              <a href="javascript:GetCode('E01DEACLF','STATIC_cd_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%" >
              <div align="right">Centro de Costos :</div>
            </td>
            <td width="25%" >
              <input type="text" name="E01DEACCN" id="E01DEACCN" size="8" maxlength="8" value="<%= cdMant.getE01DEACCN().trim()%>">
              <a href="javascript:GetCostCenter('E01DEACCN','01')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a> 
            </td>
            <td width="25%" >
              <div align="right">Porcentaje Garant&iacute;a :</div>
            </td>
            <td width="25%" >
              <input type="text" name="E01DEACPE" id="E01DEACPE" size="7" maxlength="7" value="<%= cdMant.getE01DEACPE().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Condici&oacute;n de Contrato :</div>
            </td>
            <td width="25%" > 
              <select name="E01DEADLC" id="E01DEADLC">
                <option value=" " <% if (!(cdMant.getE01DEADLC().equals("1") ||cdMant.getE01DEADLC().equals("2")||cdMant.getE01DEADLC().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if (cdMant.getE01DEADLC().equals("1")) out.print("selected"); %>>Vigente</option>
                <option value="2" <% if (cdMant.getE01DEADLC().equals("2")) out.print("selected"); %>>Vencido</option>
                <option value="3" <% if (cdMant.getE01DEADLC().equals("3")) out.print("selected"); %>>Embargado</option>
              </select>
            </td>
            <td width="25%" > 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01DEAEXR" id="E01DEAEXR" size="11" maxlength="11" value="<%= cdMant.getE01DEAEXR().trim()%>" onKeypress="enterDecimal()">
            </td>  
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        	<td nowrap width="25%" >
       			<div align="right">Fecha Cambio de Tasa :</div>
       		</td> 	
    		<td nowrap width="25%" > 
              <eibsinput:date name="cdMant"  fn_month="E01DLVSDM" fn_day="E01DLVSDD" fn_year="E01DLVSDY" readonly="true"/>  
            </td>
            <td  width="25%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td width="25%"" >
            <% if (!protect && cdMant.getH01FLGMAS().equals("N")) {%>
              <input type="text" name="E01DEABNK" id="E01DEABNK" size="2" maxlength="2" value="<%= cdMant.getE01DEABNK().trim()%>" >
              <input type="text" name="E01DEABRN" id="E01DEABRN" size="5" maxlength="4" value="<%= cdMant.getE01DEABRN().trim()%>">
              <a href="javascript:GetBranch('E01DEABRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
            <% } else { %>
              <input type="text" name="E01DEABNK" id="E01DEABNK" size="2" maxlength="2" value="<%= cdMant.getE01DEABNK().trim()%>" readonly>
              <input type="text" name="E01DEABRN" id="E01DEABRN" size="5" maxlength="4" value="<%= cdMant.getE01DEABRN().trim()%>" readonly>
            <% } %>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
            <td nowrap width="25%" >
              <div align="right">Clase de Certificado :</div>  
            </td>
            
            <td nowrap width="25%">
            	<input type="hidden" name="E01DEAECU" id="E01DEAECU" value="<%= cdMant.getE01DEAECU()%>" >
       			<input type="radio" name="CE01DEAECU" id="CE01DEAECU" value="2" onClick="chgConcept('2')"
       			<%if(cdMant.getE01DEAECU().equals("2")) out.print("checked");%> <% if (cdMant.getE01FLGNEW().equals("N"))  out.print("disabled");%> >
          			Físico 
       			<input type="radio" name="CE01DEAECU" id="CE01DEAECU" value="1" onClick="chgConcept('1')"
	  			<%if(cdMant.getE01DEAECU().equals("1")) out.print("checked");%> <% if (cdMant.getE01FLGNEW().equals("N"))  out.print("disabled");%>>
           			Desmaterializado 
            </td>
			
           <td width="25%" > 
              <div align="right">N&uacute;mero Referencia :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01DEAREF" id="E01DEAREF" size="13" maxlength="12" value="<%= cdMant.getE01DEAREF().trim()%>" onKeypress="enterInteger(event)">
            </td>  
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Amort. Nic 39 :</div>
            </td>
            <td nowrap width="25%" >
            	<eibsinput:help fn_param_one="E01DEABRK" fn_param_three="S" property="E01DEABRK" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER %>" />
            </td>
            <td nowrap width="25%" > 
              <div align="right">Condición de Manejo :</div>
            </td>
            <td nowrap width="25%" >
            	  <select name="E01DEAPAF" id="E01DEAPAF" >
                <option value=" " <% if (!(cdMant.getE01DEAPAF().equals("Y") && !cdMant.getE01DEAPAF().equals("O")))
                					 out.print("selected"); %>> 
                </option>
                <option value="Y" <% if (cdMant.getE01DEAPAF().equals("Y")) out.print("selected"); %>>Y</option>
                <option value="O" <% if (cdMant.getE01DEAPAF().equals("O")) out.print("selected"); %>>O</option>
              </select> 
            </td>  
           </tr> 
        </table>
      </td>
    </tr>
  </table>

<%if(!cdMant.getE01NEWGLN().equals("0")){ %>
<div>  
   <h4>Cambio de Producto</h4>
	<table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">             
    	    	<td nowrap width="25%" >
       				<div align="right">Cuenta Contable de acuerdo al Plazo :</div>
      	 		</td> 
    			<td nowrap width="25%" >
	            	<eibsinput:text property="E01NEWGLN" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
				</td>
				<td nowrap width="25%" >
       			</td> 
    			<td nowrap width="25%" >
	            </td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">             
    	        <td nowrap width="25%" >
	            	<div align="right">Nuevo Codigo de Producto :</div>  
	            </td>
	            <td nowrap width="25%">
	       			<eibsinput:help property="E01NEWPRC" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="false" required="true"
	       			fn_param_one="E01NEWPRC" fn_param_two="document.forms[0].E01DEAACD.value" fn_param_three="document.forms[0].E01DEABNK.value" fn_param_four="E01NEWPRD" />
	       			<eibsinput:text name="cdMant" property="E01NEWPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
		  		</td>
		  		<td nowrap width="25%" >
       			</td> 
    			<td nowrap width="25%" >
	            </td>
	   		</tr>
	      </table>
      </td>
    </tr>
  </table>
</div>
<%} %>

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
	             <input type="text" name="E01DEACUI" size="14" maxlength="12" value="<%= cdMant.getE01DEACUI().trim()%>">
				</td>
	            <td nowrap width="25%" >
	              <div align="right">Forma de Compensacion :</div>  
	            </td>
	            <td nowrap width="25%">
	       			<input type="radio" name="E01DEAF02" id="E01DEAF02" value="Y"
		  			<%if(cdMant.getE01DEAF02().equals("Y")) out.print("checked");%>>
	          			DVP 
	       			<input type="radio" name="E01DEAF02" id="E01DEAF02" value="N"
		  			<%if(cdMant.getE01DEAF02().equals("Y")) out.print("checked");%>>
	           			LP 
	            </td>
	   		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
	        	<td nowrap width="25%" >
    	          <div align="right">Agente Comprador :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEADIB" size="5" maxlength="4" value="<%= cdMant.getE01DEADIB().trim()%>" > 
	                <% if(cdMant.getE01DEAACD().equals("12")){%>
	              		<a href="javascript:GetCodeDescCNOFC('E01DEADIB','D01DEADIB','D7')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
					<% } %>
	              <input type="text" name="D01DEADIB" size="40" maxlength="35" value="<%= cdMant.getD01DEADIB().trim()%>" readonly>
	                <% if(!cdMant.getE01DEAACD().equals("12")){%>
	              		<a href="javascript:GetCodeDescCNOFC('E01DEADIB','D01DEADIB','D7')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
					<% } %>
	 			</td>
	            <td nowrap width="25%" > 
	       			<div align="right">Cuenta Inversionista :</div>
     	       </td>      
 		       <td nowrap width="25%" >
	              <input type="text" name="E01DEAIVC" size="22" maxlength="20" value="<%= cdMant.getE01DEAIVC().trim()%>">
	           </td>      
	   		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta SEBRA Vendedor :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEACRC" size="22" maxlength="20" value="<%= cdMant.getE01DEACRC().trim()%>">
	 			</td>
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta SEBRA Comprador :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEAUNR" size="22" maxlength="20" value="<%= cdMant.getE01DEAUNR().trim()%>">
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
	              <input type="text" name="E01DEAROC" size="2" maxlength="1" value="<%= cdMant.getE01DEAROC().trim()%>">
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
	              <select name="E01DEAPVI" onchange="ChgPago();">
	                <option value="" <% if (!(cdMant.getE01DEAPVI().equals("F") || cdMant.getE01DEAPVI().equals("Q")|| cdMant.getE01DEAPVI().equals("C")||
					cdMant.getE01DEAPVI().equals("T") ||cdMant.getE01DEAPVI().equals("1")||cdMant.getE01DEAPVI().equals("2") 
					||cdMant.getE01DEAPVI().equals("3")))out.print("selected"); %>> 
	                </option>
	                <option value="C" <% if (cdMant.getE01DEAPVI().equals("C")){out.print("selected");} %>>Cheque de Gerencia
	                </option>
	                <option value="F" <% if (cdMant.getE01DEAPVI().equals("F")){out.print("selected");} %>>FED 
	                </option>
	                <option value="Q" <% if (cdMant.getE01DEAPVI().equals("Q")){out.print("selected");} %>>Emisi&oacute;n 
	                Cupones</option>
	                <option value="1" <% if (cdMant.getE01DEAPVI().equals("1")){out.print("selected");} %>>Swift 
	                Formato MT-100</option>
	                <option value="2" <% if (cdMant.getE01DEAPVI().equals("2")){out.print("selected");} %>>Swift 
	                Formato MT-200</option>
	                <option value="3" <% if (cdMant.getE01DEAPVI().equals("3")){out.print("selected");} %>>Swift 
	                Formato MT-300</option>
	                <option value="A" <% if (cdMant.getE01DEAPVI().equals("A")){out.print("selected");} %>>ACH 
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
                  <option value="" <% if (cdMant.getE01FLGACC().equals("")){out.print("selected");} %>>Cuenta Contable</option>                  
                  <option value="1" <% if (cdMant.getE01FLGACC().equals("1")){out.print("selected");} %>>Cuenta Corriente o de Ahorros</option>
                  <option value="2" <% if (cdMant.getE01FLGACC().equals("2")){out.print("selected");} %>>Certificado</option>
                </select>
     	       </td>
				<td nowrap width="25%" align="right">
    	   			<span id="cuentaContableLabel" style="display: <%= cdMant.getE01FLGACC().equals("") ? "inline" : "none"%>">Número de Cuenta Contable :</span>
    	   			<span id="cuentaLabel" style="display: <%= cdMant.getE01FLGACC().equals("1") ? "inline" : "none"%>">Número de Cuenta :</span>
    	   			<span id="contractLabel" style="display: <%= cdMant.getE01FLGACC().equals("2") ? "inline" : "none"%>">Contrato a Acreditar :</span>
    	   		</td> 
 		   		<td nowrap width="25%" >
					<span id="cuentaContable" style="display: <%= cdMant.getE01FLGACC().equals("") ? "inline" : "none"%>">
					<input type="text" name="E01DEARGL" size="20" maxlength="16" value="<%= cdMant.getE01DEARGL().trim()%>" onKeypress="enterInteger(event)">
					<a href="javascript:GetLedger('E01DEARGL',document.forms[0].E01DEABNK.value,document.forms[0].E01DEACCY.value,'')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
					</span>
					<span id="cuenta" style="display: <%= cdMant.getE01FLGACC().equals("") ? "none" : "inline"%>">
					<input type="text" name="E01DEARAC" size="15" maxlength="12" value="<%= cdMant.getE01DEARAC().trim()%>" onKeypress="enterInteger(event)">
					</span>
					<span id="helpRetail" style="display: <%= cdMant.getE01FLGACC().equals("1") ? "inline" : "none"%>">
					<a href="javascript:GetAccount('E01DEARAC',document.forms[0].E01DEABNK.value,'RT','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					</span>
					<span id="helpDP" style="display: <%= cdMant.getE01FLGACC().equals("2") ? "inline" : "none"%>">
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
                <input type="text" name="E01DEAROY" size="3" maxlength="3" value="<%= cdMant.getE01DEAROY().trim()%>">
                <select name="E01DEAODA">
                  <option value="" <% if (!(cdMant.getE01DEAODA().equals("D") || cdMant.getE01DEAODA().equals("M")||
				cdMant.getE01DEAODA().equals("Y")))out.print("selected"); %>> 
                  </option>
                  <option value="D" <% if (cdMant.getE01DEAODA().equals("D")){out.print("selected");} %>>Dias</option>
                  <option value="M" <% if (cdMant.getE01DEAODA().equals("M")){out.print("selected");} %>>De Cada Mes</option>
                  <option value="Y" <% if (cdMant.getE01DEAODA().equals("Y")){out.print("selected");} %>>A&ntilde;os</option>
                </select>
				</td>
				<td nowrap width="25%" >
    	   			<div align="right">Formato Cheque IBS :
    	   			<br>
				(Si via de pago es Cheque)</div>
    	   		</td> 
 		   		<td nowrap width="25%" >
	              <input type="text" name="E01DEAOFT" size="5" maxlength="2" value="<%= cdMant.getE01DEAOFT().trim()%>" onKeypress="enterInteger()">
	              <a href="javascript:GetOffChkPar('E01DEAOFT')"> 
    	    	  <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a>
	              
 				</td>
	   		</tr>	
	   		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       <td nowrap width="25%" >
            		<div align="right">Tasa de Prorroga : </div>
            </td>
            <td nowrap width="25%" >
            	<input type="text" name="E01DEAROR" size="9" maxlength="9" value="<%= cdMant.getE01DEAROR().trim()%>">
             	<select name="E01DEAHTM">
                	<option value=" " <% if (!(cdMant.getE01DEAHTM().equals("4")|| cdMant.getE01DEAHTM().equals("3")|| cdMant.getE01DEAHTM().equals("2")||cdMant.getE01DEAHTM().equals("1"))) out.print("selected"); %>></option>
                	<option value="1" <% if (cdMant.getE01DEAHTM().equals("1")) out.print("selected"); %>>Sumar</option>
                	<option value="2" <% if (cdMant.getE01DEAHTM().equals("2")) out.print("selected"); %>>Restar</option>
                	<option value="3" <% if (cdMant.getE01DEAHTM().equals("3")) out.print("selected"); %>>Sustituir</option>
                	<option value="4" <% if (cdMant.getE01DEAHTM().equals("4")) out.print("selected"); %>>Mantener</option>
              	</select>
            </td>
              <%if(userPO.getApplicationCode().equals("12")){ %>
           <td nowrap width="25%" >
            	<div align="right">Periodo de Gracia : </div>
            </td>
            <td nowrap width="25%" >
            	<input type="text" name="E01DEAGPD" size="4" maxlength="2" value="<%= cdMant.getE01DEAGPD().trim()%>" onKeypress="enterInteger()">
            </td>
            <%}else{ %>
            <td nowrap width="25%" >
           
            </td>
            <td nowrap width="25%" >
            </td>
            <%} %>
          </tr>
             <%if(userPO.getApplicationCode().equals("12")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	       <td nowrap width="25%" >
            		<div align="right">Liquidacion interes : </div>
            </td>
            <td nowrap width="25%" >
            	<input type="radio" name="E01DEAF03" id="E01DEAF03" value="1" 
	  			<%if(cdMant.getE01DEAF03().equals("1")) out.print("checked");%>>
          			Tasa previa 
       			<input type="radio" name="E01DEAF03" id="E01DEAF03" value="2"
	  			<%if(cdMant.getE01DEAF03().equals("2")) out.print("checked");%>>
           			Tasa actual 
	        </td>
           <td nowrap width="25%" >
            		<div align="right">Plan de pago Capital : </div>
            </td>
            <td colspan="2" > 
            		<a href="javascript:showCDPayMaint()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Plan de Pagos" align="middle" border="0" ></a>
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
								<input type="text" name="E01DEAABA" size="12" maxlength="9" value="<%= cdMant.getE01DEAABA().trim()%>">
								<a href="javascript:GetAchOperator('E01DEAABA','O',' ','D')"> 
									<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" align="top">
								</a>
								
							</td>
							<td width="20%"><div align="right">Tipo de Cuenta :</div></td>
							<td width="30%">
								<select name="E01DEAACT">
							  		<option value="C" <% if (!(cdMant.getE01DEAACT().equals("C"))) out.print("selected"); %>>Corriente </option>
									<option value="S" <% if   (cdMant.getE01DEAACT().equals("S"))  out.print("selected"); %>>Ahorros   </option>
								</select>
							</td>
						</tr>
						
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Cuenta del Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAFAC" size="19" maxlength="17" value="<%= cdMant.getE01DEAFAC().trim()%>">
							</td>
							<td width="20%"> 
								<div align="right">Nombre Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAFNM" size="50" maxlength="45" value="<%= cdMant.getE01DEAFNM().trim()%>">
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Descripcion ACH :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEATDS" size="50" maxlength="45" value="<%= cdMant.getE01DEATDS().trim()%>">
							</td>
							<td width="20%"> 
								<div align="right">ID Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAAID" size="15" maxlength="15" value="<%= cdMant.getE01DEAAID().trim()%>">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>  
 
  
  <% if (cdMant.getH01FLGMAS().trim().equals("N")) {%> 
  
  <h4>Origen de Fondos</h4>
  
  <TABLE id="mainTable" class="tableinfo" width="80%">
  <TR><TD>
  
   <table id="headTable" >
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap align="center" > Concepto</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Sucursal</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Referencia</td>
      <td nowrap align="center" >Monto</td>
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
            <td nowrap > 
              <div align="center" > 
            	<%= i %>
                <input type="text" name="E01OFFOP<%= name %>" id="E01OFFOP<%= name %>" value="<%= cdMant.getField("E01OFFOP"+name).getString().trim()%>" size="3" maxlength="3">
                <input type="hidden" name="E01OFFGL<%= name %>" id="E01OFFGL<%= name %>" value="<%= cdMant.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" id="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= cdMant.getField("E01OFFCO"+name).getString().trim()%>" 
                  class="context-menu-help"
                  onmousedown="init(conceptHelp,this.name,document.getElementById('E01DEABNK').value, document.forms[0].E01OFFCY<%= name %>.value,'E01OFFGL<%= name %>','E01OFFOP<%= name %>',document.getElementById('E01DEAACD').value,'01')">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01OFFBK<%= name %>" id="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdMant.getField("E01OFFBK"+name).getString().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01OFFBR<%= name %>" id="E01OFFBR<%= name %>" size="4" maxlength="4" value="<%= cdMant.getField("E01OFFBR"+name).getString().trim()%>"
                  class="context-menu-help"
                  onmousedown="init(branchHelp,this.name,document.getElementById('E01DEABNK').value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" id="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFCY"+name).getString().trim()%>"
                  class="context-menu-help"
                  onmousedown="init(currencyHelp,this.name,document.getElementById('E01DEABNK').value,'','','','')">
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" id="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= cdMant.getField("E01OFFAC"+name).getString().trim()%>"
                  class="context-menu-help"
                  onmousedown="init(accountHelp,this.name,document.getElementById('E01DEABNK').value,'','','','RT')">
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E01OFFAM<%= name %>" id="E01OFFAM<%= name %>" size="15" maxlength="15"  value="<%= cdMant.getField("E01OFFAM"+name).getString().trim()%>" onKeypress="enterDecimal()">
              </div>
            </td>
          </tr>
          <% } %> 
    	  </table>
        </div>
        
      <table id="footTable" >
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" align="right"><b>Equivalente Moneda del Certificado :</b> 
            </td>
            <td nowrap width="60%" align="left"><b><i><strong> 
                <input type="text" name="E01OFFEQV" id="E01OFFEQV" size="15" maxlength="15" readonly value="<%= cdMant.getE01OFFEQV().trim()%>">
                </strong></i></b> 
            </td>
          </tr>
        </table>
        
   </TD>  
</TR>	
</TABLE>    
 <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables(document.getElementById('headTable'), document.getElementById('dataTable'), document.getElementById('dataDiv'), 0, true);
   }
  tableresize();
  window.onresize=tableresize; 
  String cls=cdMant.getE01DEAECU().trim();
  chgConcept(cls);
  </SCRIPT>
  <% } %>
  
 <jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=cdMant.getH01FLGWK3()%>" />
</jsp:include>

  <% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(cdMant.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Avisos</h4>
  <% } %>         
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>

</form>
</body>
</html>
