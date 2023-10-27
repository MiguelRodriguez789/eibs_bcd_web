<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Simulacion de Creditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session"/>
<jsp:useBean id="msgLoan" class="datapro.eibs.beans.EPV090001Message" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/json2.js"></script>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-paymentplan.jsp"></script>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-simulacion.jsp"></script>

</head>

<body>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}

	boolean isDEAIPDNum = true;
	boolean isDEAPPDNum = true;
  	String DEAIPD = msgLoan.getE01DEAIPD().trim();
  	String DEAPPD = msgLoan.getE01DEAPPD().trim();
  	String FLGSBS = msgLoan.getE01DLCFFS().trim();
 
	int num;
	try {
		num = Integer.parseInt(DEAIPD);
	} catch (Exception e) {
		isDEAIPDNum = false;
	}
	try {
		num = Integer.parseInt(DEAPPD);
	} catch (Exception e) {
		isDEAPPDNum = false;
	}
    
    
%> 

<div align="center"></div>
<h3 align="center">Simulaci&oacute;n de Prestamos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="simulacion_credito.jsp, EPV0900"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0900" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="200">
  <input type=HIDDEN name="E01DEABNK" id="E01DEABNK" value="<%=msgLoan.getE01DEABNK() %>">
  <INPUT TYPE=HIDDEN NAME="E01FLGRCL" id="E01FLGRCL" VALUE="<%=msgLoan.getE01FLGRCL().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGFVE" id="E01FLGFVE" VALUE="<%=msgLoan.getE01FLGFVE().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGFLT" id="E01FLGFLT" VALUE="<%=msgLoan.getE01FLGFLT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGFPG" id="E01FLGFPG" VALUE="<%=msgLoan.getE01FLGFPG().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEATYP" id="E01DEATYP" VALUE="<%=msgLoan.getE01DEATYP().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGCNV" id="E01FLGCNV" VALUE="<%=msgLoan.getE01FLGCNV().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGCHG" id="E01FLGCHG" VALUE="<%=msgLoan.getE01FLGCHG().trim()%>">
 
  
  <%int row = 0; %>
  
  <h4>Informaci&oacute;n Cliente</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%"> 
              <div align=right>Referencia :</div>
            </td>
            <td nowrap width="70%" > 
              <eibsinput:text property="E01DEAACC" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap width="70%" > 
            	<eibsinput:help fn_param_one="E01DEACUN" fn_param_two="E01CUSNA1" fn_param_three="" property="E01DEACUN" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text property="E01CUSNA1" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%"> 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap width="70%" > 
              <eibsinput:text property="E01CUSNA2" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" /><br>
              <eibsinput:text property="E01CUSNA3" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"  /><br>
              <eibsinput:text property="E01CUSNA4" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n Opcional</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Producto :</div>
            </td>
            <td nowrap width="10%" > 
              <input type="text" name="E01DEAPRO" id="E01DEAPRO" size="5" maxlength="4" value="<%= msgLoan.getE01DEAPRO().trim()%>">
	            <a href="javascript:GetProduct('E01DEAPRO','10','01','E01DSCPRD','E01DEATYP')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
    	        <eibsinput:text property="E01DSCPRD" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
            </td>
            <td nowrap width="20%"> 
            </td>
            <td nowrap width="31%" > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Convenio :</div>
            </td>
            <td nowrap width="10%" > 
              <input type="text" name="E01DEACNV" size="5" maxlength="4" value="<%=msgLoan.getE01DEACNV() %>" >
		            <a href="javascript:GetCodeDescDeal('E01DEACNV','E01DSCCNV')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
    	        <eibsinput:text property="E01DSCCNV" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="20%"> 
	            <div align="right"><a href="#" onclick="goAction(100);"><b>Refrescar</b></a></div>
            </td>
            <td nowrap width="31%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
<br>
<%row = 1;%>
  <h4>Informaci&oacute;n Credito</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table id="INFORMATION_CREDITO"cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Monto Principal :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:text property="E01DEAOAM" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  onchange="setRecalculate();wipeValorCuota()" onblur="setRecalculate()"/>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="30%" > 
				<eibsinput:help name="msgLoan" property="E01DEACCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01DEACCY" fn_param_two="document.forms[0].E01DEABNK.value" onchange="resetPrd()" />
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Fecha Inicial :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="msgLoan" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" required="true" onchange="setRecalculate()"/>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Plazo :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:text property="E01DEATRM" name="msgLoan" size="6" maxlength="5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate();wipeValorCuota()"/>
            	<select name="E01DEATRC" onclick="setRecalculate()">
	                <option value=" " <% if (!(msgLoan.getE01DEATRC().equals("D") || msgLoan.getE01DEATRC().equals("M") || msgLoan.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
	                <option value="D" <% if (msgLoan.getE01DEATRC().equals("D")) out.print("selected"); %>>Día(s)</option>
	                <option value="M" <% if (msgLoan.getE01DEATRC().equals("M")) out.print("selected"); %>>Mes(s)</option>
	                <option value="Y" <% if (msgLoan.getE01DEATRC().equals("Y")) out.print("selected"); %>>Año(s)</option>
	            </select>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Fecha Final :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="msgLoan" fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY" onchange="setRecalculate();wipeValorCuota()"/>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Tabla Tasa Flotante :</div>
            </td>
            <td nowrap width="30%" > 
            	<eibsinput:help eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" fn_param_one="E01DEAFTB" fn_param_two="E01FLGFLT" fn_param_three="E01FLTDSC" fn_param_four="PRIMARYRATE" fn_param_five="SECONDARYRATE" fn_param_six="E01DEAFTY" property="E01DEAFTB" name="msgLoan" help="<%=HelpTypes.FLOATING_RATE_TABLES%>" onchange="activeProduct.rateDisplay();setRecalculate();wipeValorCuota()" /> 
	            <select name="E01DEAFTY" onchange="setRecalculate();activeProduct.rateDisplay();wipeValorCuota()" > 
		            <option value=" " <% if (!(msgLoan.getE01DEAFTY().equals("FP") || msgLoan.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
	    	        <option value="FP" <% if (msgLoan.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
	        	    <option value="FS" <% if (msgLoan.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
	            </select>
            </td>
          </tr>
          <tr id="FLOATINGTABLE2" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none;">
            <td> 
              <div align="right">Descripcion Tabla Flotante :</div>
            </td>
            <td> 
            	<eibsinput:text property="E01FLTDSC" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
            </td>
            <td> 
              <div align="right">Tasa Flotante Base :</div>
            </td>
            <td nowrap>
				<%if(msgLoan.getE01FLGFLT().equals("2")){%>
  					<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=msgLoan.getE01FLTORG().trim()%>">
			  		<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=msgLoan.getE01FLTORG().trim()%>">
			  	<%}else{%>
  					<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=msgLoan.getE01FLTRTE().trim()%>">
			  		<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=msgLoan.getE01FLTRTE().trim()%>">
			  	<%}%>
            	<eibsinput:text property="E01FLTORG" name="msgLoan" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          </tr>
          <tr id="FLOATINGTABLE" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none;"> 
            <td nowrap width="20%"> 
              <div align="right">Manejo Puntos Adicional  :</div>
            </td>
            <td nowrap width="30%" > 
	             <select name="E01DEAFLX" onclick="setRecalculate()" >
	              <OPTION value=" " <% if (!(msgLoan.getE01DEAFLX().equals("B") ||msgLoan.getE01DEAFLX().equals("E")||msgLoan.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(msgLoan.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(msgLoan.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(msgLoan.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	      	</td>
            <td nowrap width="20%" > 
              <div align="right">Valor Tasa Adicional :</div>
            </td>
            <td nowrap width="30%" > 
            	<eibsinput:text property="E01DEARTX" name="msgLoan" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" onchange="setRecalculate()"/>
            </td>
	      </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Tipo Inter&eacute;s :</div>
            </td>
            <td nowrap width="30%" > 
	            <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= msgLoan.getE01DEAICT().trim()%>" onchange="setRecalculate();resetPrd(this);wipeValorCuota()">
	            <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')" onclick="setRecalculate()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" ></a>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap width="30%" > 
		       	<eibsinput:text property="E01FLTRTE" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>  
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="30%" > 
            	<eibsinput:text property="E01DEABAS" name="msgLoan" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate();resetPrd()"/>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Tasa Interes/Spread :</div>
            </td>
            <td nowrap width="30%" > 
            	<eibsinput:text property="E01DEARTE" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" onchange="setRecalculate();activeProduct.rateDisplay(); activeProduct.chgRate()" /> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Permite Feriados :</div>
            </td>
            <td nowrap width="30%" > 
              <eibsinput:text property="E01DEAHFQ" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="2" maxlength="1" />
              <a href="javascript:GetCode('E01DEAHFQ','STATIC_ln_tables_holidays.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Tasa del Prestamo :</div>
            </td>
            <td nowrap width="30%" > 
		       	<eibsinput:text property="E01LNSRTE" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>  
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Tabla de Cargos :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01DEAOFT" id="E01DEAOFT" size="3" maxlength="2" value="<%= msgLoan.getE01DEAOFT().trim()%>">
              <a href="javascript:GetLoanChargeTable('E01DEAOFT',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="20%"> 
              <div align="right">Tasa Efectiva :</div>
            </td>
            <td nowrap width="30%" > 
            	<eibsinput:text property="E01DEASPR" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="false" /> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right"> Banco/Sucursal : </div>
            </td>
            <td nowrap width="30%" > 
            	<eibsinput:text property="E01DEABNK" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
            	<eibsinput:help fn_param_one="E01DEABRN" fn_param_two="document.forms[0].E01DEABNK.value" property="E01DEABRN" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" />
            </td>
            <td nowrap width="20%"> 
              <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %>
              	 <div align="right">Tasa CAE :</div>
              <% } %>	 
            </td>
            <td nowrap width="30%" > 
              <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %>
            	<eibsinput:text property="E01TASCAE" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" /> 
			  <% } %>
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  

<H4>Subsidio</H4>
<table  class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Entidad : </div>
            </td>
            <td nowrap width="75%">
              <eibsinput:help name="msgLoan" fn_param_one="E01DLCCFS" fn_param_two="E01DSCCFS" fn_param_three="F" property="E01DLCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" onchange="changeEntity()" />
			  <eibsinput:text name="msgLoan" property="E01DSCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"  />
            </td>
          </tr> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Tasa Subsidio : </div>
            </td>
            <td nowrap width="75%">
            <eibsinput:text name="msgLoan" property="E01DLCRFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" onchange="goSubsidizedRate();"/>
            </td>
          </tr> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Tasa Efctiva Subsidio : </div>
            </td>
            <td nowrap width="75%">
            <eibsinput:text name="msgLoan" property="E01DLCRXS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
            </td>
          </tr> 
          <%--
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Referencia Subsidio: </div>
            </td>
            <td nowrap width="75%">
              <eibsinput:text name="msgLoan" property="E01DLCNRS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="12" maxlength="12" />
            </td>
          </tr> 
          
          <% if (!("N".equals("Y"))){ %>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Terminaci&oacute;n Por : </div>
            </td>
            <td nowrap width="75%">
              <select name="E01DLCFFS" >
	              <OPTION value=" " <% if (!(msgLoan.getE01DLCFFS().equals("1") ||msgLoan.getE01DLCFFS().equals("2")||msgLoan.getE01DLCFFS().equals("3")|| msgLoan.getE01DLCFFS().equals("4") 
	              					|| msgLoan.getE01DLCFFS().equals("5") || msgLoan.getE01DLCFFS().equals("6") || msgLoan.getE01DLCFFS().equals("7")))  out.print("selected"); %>></OPTION>
	              <OPTION value="1" <% if(msgLoan.getE01DLCFFS().equals("1")) out.print("selected");%>>Pago Anticipado</OPTION>
	              <OPTION value="2" <% if(msgLoan.getE01DLCFFS().equals("2")) out.print("selected");%>>Vencido</OPTION>
	              <OPTION value="3" <% if(msgLoan.getE01DLCFFS().equals("3")) out.print("selected");%>>Cesion de Contrato</OPTION>
	              <OPTION value="4" <% if(msgLoan.getE01DLCFFS().equals("4")) out.print("selected");%>>Reestructuracion</OPTION>
	              <OPTION value="5" <% if(msgLoan.getE01DLCFFS().equals("5")) out.print("selected");%>>Aceleracion</OPTION>
	              <OPTION value="6" <% if(msgLoan.getE01DLCFFS().equals("6")) out.print("selected");%>>Peticion Cliente</OPTION>
	              <OPTION value="7" <% if(msgLoan.getE01DLCFFS().equals("7")) out.print("selected");%>>Fallecimiento Cliente</OPTION>
              </select>
            </td>
          </tr>          
			<% } %>	
			--%>
			
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Valor de la Vivienda : </div>
            </td>
            <td nowrap width="75%">
			  <eibsinput:text name="msgLoan" property="E01DLCVVI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
          </tr> 
         
          
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Fecha de Expiraci&oacute;n : </div>
            </td>
            <td nowrap width="75%">
              <eibsinput:date name="msgLoan" fn_month="E01DLCFSM" fn_day="E01DLCFSD" fn_year="E01DLCFSY" />
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>


	<br>
	<!-- Seguros -->
	<% session.setAttribute("EMPSG","S"); %>
	<input type="hidden" name="SGTOT" id="SGTOT" value="0">
	<iframe id="ifrempsg" frameborder="0" scrolling="no" height="184" width="100%" src="${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&ACT=N&appType=LS&E01PSGCUN=<%=msgLoan.getE01DEACUN()%>&E01PSGNUM=<%=msgLoan.getE01DEAACC()%>"> </iframe>
  <br>
	<!-- Cargos -->
    <% session.setAttribute("EMPCA","S"); %>
  <input type="hidden" name="CAIMP" id="CAIMP" value="0">
  <input type="hidden" name="CACOM" id="CACOM" value="0">
  <input type="hidden" name="CADED" id="CADED" value="0">
  <input type="hidden" name="CAIVA" id="CAIVA" value="0">
  <input type="hidden" name="CAOTH" id="CAOTH" value="0">
  	<iframe id="ifrempca" frameborder="0" scrolling="no" height="200" width="100%" src="${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&ACT=S&appType=LS&E01PVHCUN=<%=msgLoan.getE01DEACUN()%>&E01PVHNUM=<%=msgLoan.getE01DEAACC()%>" ></iframe>  

  <br>
  <a href="#CondicionesdePago" ><b>Condiciones de Pago</b></a>
  <br>
  <div id="planPago"></div>

  <br>
	<h4>Distribuci&oacute;n</h4> 
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
			              <div align="right">Monto del Cr&eacute;dito :</div>
			            </td>
						<td nowrap width="20%"> 
			            	 <eibsinput:text property="OAM" value="<%=msgLoan.getE01DEAOAM()%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
			          </tr>
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
			              <div align="right">Seguros :</div>
			            </td>
						<td nowrap width="20%">
			            	 <eibsinput:text property="E01TOTSGR" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
			          </tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">I.V.A. :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTIVA" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>			          
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
			              <div align="right">Otros Cargos :</div>
			            </td>
						<td nowrap width="20%">
			            	 <eibsinput:text property="E01TOTOTH" name="msgLoan" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
			          </tr>
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
			              <div align="right">Monto Neto :</div>
			            </td>
						<td nowrap width="20%">
			            	 <eibsinput:text property="E01BALNET" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" onchange="setRecalculate();reverseCalculate(this); wipeValorCuota();"/>
			            </td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
			          </tr>
		  		</table>
	  		</td>
		</tr>
	</table>  
	
<br>
  <div align="center"> 
		<input class="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="goAction(200)"> &nbsp; &nbsp; &nbsp; 
    	<input class="EIBSBTN" type="button" name="Plan" value="Plan de Pago" onclick="plan()">&nbsp; &nbsp; &nbsp;
		<font class="outOfTableText">Recalcular: </font><input type="checkbox" name="RECALC" id="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (msgLoan.getE01FLGRCL().trim().equals("X")) out.print(" checked disabled");%>>
  </div>
	
  
</form>
</body>
<script type="text/javascript">
</script>

</html>
