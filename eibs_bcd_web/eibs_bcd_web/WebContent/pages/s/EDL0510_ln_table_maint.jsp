<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tasas de Prestamos</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL051002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>


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

<h3 align="center">Tabla de Parametros de Prestamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_table_maint.jsp,EDL0510"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  <INPUT TYPE=HIDDEN NAME="H02FLGMAS" value ="A" >
  <input type=HIDDEN name="E02DLSCUN" value="<%= lnParam.getE02DLSCUN().trim()%>">
  
  <%int row = 0; %>
  <table class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Banco :&nbsp;</b>
            </td>
            <td nowrap >                
 		         <eibsinput:text name="lnParam" property="E02DLSBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
            </td>
            <td nowrap width="20%" align=right> 
              <b>Tipo de Producto :&nbsp;</b>
            </td>
            <td nowrap > 
 		         <eibsinput:text name="lnParam" property="E02DLSTYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Codigo de Tabla :&nbsp;</b>
            </td>
            <td nowrap>  
 		         <eibsinput:text name="lnParam" property="E02DLSTLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>" readonly="true"/>
            </td>
            <td nowrap width="20%" align=right> 
            </td>
            <td nowrap>  
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
			    <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="25%"> 
 		         <eibsinput:text name="lnParam" property="E02DLSDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true"/>
            </td>
            <td nowrap width="20%">
			</td>
		    <td nowrap width="10%">
			<td nowrap  width="20%">  
              Factor	        
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap> 
              <div align="right">Tipo de Interes :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E02DLSICT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSICT()%>">
              <a href="javascript:GetCode('E02DLSICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a> 
            </td>
            <td nowrap> 
              <div align="right">Tasa Base o Puntos :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnParam" property="E02DLSRTF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
            <td nowrap colspan=3> 
              <input type="text" name="E02DLSRFT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSRFT()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetCode('E02DLSRFT','STATIC_ln_tables_factor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a>	
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap> 
              <div align="right">Tasa Minima Permitida :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnParam" property="E02DLSMIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
 	        </td>
 	        <td nowrap> 
              <div align="right">Tasa Maxima Permitida :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnParam" property="E02DLSMAX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
 	        </td>
 	        <td nowrap colspan=3> 
              <input type="text" name="E02DLSMMT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSMMT()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetCode('E02DLSMMT','STATIC_ln_tables_max_rate.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a>	
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Peiodo Base Calculo de Interes :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLSDAB" size="4" maxlength="3" value="<%= lnParam.getE02DLSDAB()%>" onkeypress="enterInteger(event)">	        
            </td>
            <td nowrap> 
              <div align="right">Cargo o Tasa x Mora :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnParam" property="E02DLSMRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
 	        </td>
            <td nowrap colspan=3>        
              <input type="text" name="E02DLSFL2" size="2" maxlength="1" value="<%= lnParam.getE02DLSFL2()%>">
              <a href="javascript:GetCode('E02DLSFL2','STATIC_ln_tables_penalty_rate.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a> 
            </td>
          </tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Periodo Base Calculo de Mora :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLSPBS" size="4" maxlength="3" value="<%= lnParam.getE02DLSPBS()%>" onkeypress="enterInteger(event)">	        
            </td>
            <td nowrap> 
              <div align="right">Cargo Mínimo de Mora :</div>
            </td>
            <td nowrap colspan=4> 
		         <eibsinput:text name="lnParam" property="E02DLSMPA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
 	        </td>            
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Control Adelanto Capital :</div>
            </td>
			<td nowrap>
  				<input type="radio" name="E02DLSFL1" value="Y" <%if(lnParam.getE02DLSFL1().equals("Y")) out.print("checked");%>>Si
  				<input type="radio" name="E02DLSFL1" value="N" <%if(lnParam.getE02DLSFL1().equals("N")) out.print("checked");%>>No
			</td>
			<td nowrap>
              <div align="right">Dias de Gracia por Mora :</div>
            </td>
			<td nowrap colspan=4>
  				1- <input type="text" name="E02DLSGR1" size="3" maxlength="2" value="<%=lnParam.getE02DLSGR1()%>"> 
  				2- <INPUT type="text" name="E02DLSGR2" size="3" maxlength="2" value="<%=lnParam.getE02DLSGR2()%>"> 
  				3- <INPUT type="text" name="E02DLSGR3" size="3" maxlength="2" value="<%=lnParam.getE02DLSGR3()%>">
  			</td>
		  </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Vencimiento en Feriados :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSFCO" size="2" maxlength="1" value="<%=lnParam.getE02DLSFCO()%>">
              <a href="javascript:GetCode('E02DLSFCO','STATIC_ln_tables_holidays.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a>
 	 		</td>            
  			<td nowrap>
              <div align="right">Dias de Paso a Vencido :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSPMD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Forma de Cambio Contable :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSTCG" size="2" maxlength="1" value="<%=lnParam.getE02DLSTCG()%>">
              <a href="javascript:GetCode('E02DLSTCG','STATIC_ln_tables_accounting_changes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a></td>
  			<td nowrap>
              <div align="right">Dias de Paso Castigo sin Garantia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSPC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Retiro Documentos de Custodia :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSCUP" size="3" maxlength="3" value="<%=lnParam.getE02DLSCUP()%>">
            </td>
  			<td nowrap>
              <div align="right">Dias de Paso Castigo con Garantia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSPC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
  			</td>
          </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Permite Pagos Parciales :</div>
            </td>
			<td nowrap>
	             <input type="text" name="E02DLSPPR" size="2" maxlength="1"	value="<%= lnParam.getE02DLSPPR()%>">
	              <a href="javascript:GetCode('E02DLSPPR','STATIC_ln_tables_partial_payment.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a> 
 			</td>			
 			<td nowrap>
              <div align="right">Dias Suspensi&oacute;n de Devengo :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSPSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
  			</td>
          </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">N&uacute;mero de Reincidencia en Mora :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSNSU" size="3" maxlength="2" value="<%=lnParam.getE02DLSNSU()%>">
            </td>
  			<td nowrap>
              <div align="right">Dias Suspensi&oacute;n por Reincidencia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSRSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap> 
              <div align="right">Intentos cobro Multicuentas :</div>
            </td>
            <td align="left">
  				<input type="text" name="E02DLSCMC" size="3" maxlength="2" value="<%=lnParam.getE02DLSCMC()%>" onKeypress="enterInteger(event)">
            </td>
			<td nowrap>
              <div align="right">A&ntilde;os de Excencion Renta Gravable :</div>
            </td>
			<td nowrap colspan=4>
				<eibsinput:text name="lnParam" property="E02DLSNP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="2" />
  			</td>
          </tr>
         <%--
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap> 
              <div align="right">Meses de Inactividad :</div>
            </td>
            <td align="left">
  				<eibsinput:text name="lnParam" property="E02DLSNP2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="2" />
            </td>
			<td nowrap>
              <div align="right">Meses de Obligacion :</div>
            </td>
			<td nowrap colspan=4>
				<eibsinput:text name="lnParam" property="E02DLSNP3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="2" />
  			</td>
          </tr>
          --%>
         </table>
       </td>
    </tr>
  </table>

<H4>Cambio de Cuenta Contable</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
 			   <table cellspacing="0" cellpadding="2" width="100%" border="0">
	          <tr id="trclear">
	            <td nowrap> 
	            	<div align="right">Dias de Vencido :</div>
	            </td>
	            <td nowrap> 
	               (1)<eibsinput:text name="lnParam" property="E02DLSPL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
	            </td>
	            <td nowrap> 
	               (2)<eibsinput:text name="lnParam" property="E02DLSPL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
	            </td>
	            <td nowrap> 
	               (3)<eibsinput:text name="lnParam" property="E02DLSPL3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
	            </td>
	            <td nowrap> 
	               (4)<eibsinput:text name="lnParam" property="E02DLSPL4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
	            </td>
	            <td nowrap> 
	               (5)<eibsinput:text name="lnParam" property="E02DLSPL5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" />
	            </td>
	          </tr>
	          <tr id="trdark">
	            <td nowrap> 
	            	<div align="right">% Capital Vencido :</div>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
	            </td>
	          </tr>
		   </table>
	   </td>
   </tr>
  </table>
  
  
  
   <h4>Prioridad de Pagos </h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap > 
        <table id="tableSelect" cellspacing=0 cellpadding=2 width="100%" border="0">
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="14%"  > 
              <div align="center"> 
				<select id="E02DLSPP1" name="E02DLSPP1" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnParam.getE02DLSPP1().equals("1")) out.print("selected");%>> 1 </option>
				    <option value="2" <% if(lnParam.getE02DLSPP1().equals("2")) out.print("selected");%>> 2 </option>
				    <option value="3" <% if(lnParam.getE02DLSPP1().equals("3")) out.print("selected");%>> 3 </option>
				    <option value="4" <% if(lnParam.getE02DLSPP1().equals("4")) out.print("selected");%>> 4 </option>
				    <option value="5" <% if(lnParam.getE02DLSPP1().equals("5")) out.print("selected");%>> 5 </option>
					<option value="6" <% if(lnParam.getE02DLSPP1().equals("6")) out.print("selected");%>> 6 </option>
				    <option value="7" <% if(lnParam.getE02DLSPP1().equals("7")) out.print("selected");%>> 7 </option>
				 <%if(currUser.getE01INT().equals("07")){%> <option value="8" <% if(lnParam.getE02DLSPP1().equals("8")) out.print("selected");%>> 8 </option> <% } %>
				</select>        
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
				<select id="E02DLSPP2" name="E02DLSPP2" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnParam.getE02DLSPP2().equals("1")) out.print("selected");%>> 1 </option>
				    <option value="2" <% if(lnParam.getE02DLSPP2().equals("2")) out.print("selected");%>> 2 </option>
				    <option value="3" <% if(lnParam.getE02DLSPP2().equals("3")) out.print("selected");%>> 3 </option>
				    <option value="4" <% if(lnParam.getE02DLSPP2().equals("4")) out.print("selected");%>> 4 </option>
				    <option value="5" <% if(lnParam.getE02DLSPP2().equals("5")) out.print("selected");%>> 5 </option>
					<option value="6" <% if(lnParam.getE02DLSPP2().equals("6")) out.print("selected");%>> 6 </option>
				    <option value="7" <% if(lnParam.getE02DLSPP2().equals("7")) out.print("selected");%>> 7 </option>
				 <%if(currUser.getE01INT().equals("07")){%> <option value="8" <% if(lnParam.getE02DLSPP2().equals("8")) out.print("selected");%>> 8 </option> <% } %>
				    
				</select>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
				<select id="E02DLSPP3" name="E02DLSPP3" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnParam.getE02DLSPP3().equals("1")) out.print("selected");%>> 1 </option>
				    <option value="2" <% if(lnParam.getE02DLSPP3().equals("2")) out.print("selected");%>> 2 </option>
				    <option value="3" <% if(lnParam.getE02DLSPP3().equals("3")) out.print("selected");%>> 3 </option>
				    <option value="4" <% if(lnParam.getE02DLSPP3().equals("4")) out.print("selected");%>> 4 </option>
				    <option value="5" <% if(lnParam.getE02DLSPP3().equals("5")) out.print("selected");%>> 5 </option>
					<option value="6" <% if(lnParam.getE02DLSPP3().equals("6")) out.print("selected");%>> 6 </option>
				    <option value="7" <% if(lnParam.getE02DLSPP3().equals("7")) out.print("selected");%>> 7 </option>
				 <%if(currUser.getE01INT().equals("07")){%> <option value="8" <% if(lnParam.getE02DLSPP3().equals("8")) out.print("selected");%>> 8 </option> <% } %>
				</select>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
				<select id="E02DLSPP4" name="E02DLSPP4" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnParam.getE02DLSPP4().equals("1")) out.print("selected");%>> 1 </option>
				    <option value="2" <% if(lnParam.getE02DLSPP4().equals("2")) out.print("selected");%>> 2 </option>
				    <option value="3" <% if(lnParam.getE02DLSPP4().equals("3")) out.print("selected");%>> 3 </option>
				    <option value="4" <% if(lnParam.getE02DLSPP4().equals("4")) out.print("selected");%>> 4 </option>
				    <option value="5" <% if(lnParam.getE02DLSPP4().equals("5")) out.print("selected");%>> 5 </option>
					<option value="6" <% if(lnParam.getE02DLSPP4().equals("6")) out.print("selected");%>> 6 </option>
				    <option value="7" <% if(lnParam.getE02DLSPP4().equals("7")) out.print("selected");%>> 7 </option>
				 <%if(currUser.getE01INT().equals("07")){%> <option value="8" <% if(lnParam.getE02DLSPP4().equals("8")) out.print("selected");%>> 8 </option> <% } %>
				</select>              
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
				<select id="E02DLSPP5" name="E02DLSPP5" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnParam.getE02DLSPP5().equals("1")) out.print("selected");%>> 1 </option>
				    <option value="2" <% if(lnParam.getE02DLSPP5().equals("2")) out.print("selected");%>> 2 </option>
				    <option value="3" <% if(lnParam.getE02DLSPP5().equals("3")) out.print("selected");%>> 3 </option>
				    <option value="4" <% if(lnParam.getE02DLSPP5().equals("4")) out.print("selected");%>> 4 </option>
				    <option value="5" <% if(lnParam.getE02DLSPP5().equals("5")) out.print("selected");%>> 5 </option>
					<option value="6" <% if(lnParam.getE02DLSPP5().equals("6")) out.print("selected");%>> 6 </option>
				    <option value="7" <% if(lnParam.getE02DLSPP5().equals("7")) out.print("selected");%>> 7 </option>
				 <%if(currUser.getE01INT().equals("07")){%> <option value="8" <% if(lnParam.getE02DLSPP5().equals("8")) out.print("selected");%>> 8 </option> <% } %>
				</select>              
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center">
				<select id="E02DLSPP6" name="E02DLSPP6" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnParam.getE02DLSPP6().equals("1")) out.print("selected");%>> 1 </option>
				    <option value="2" <% if(lnParam.getE02DLSPP6().equals("2")) out.print("selected");%>> 2 </option>
				    <option value="3" <% if(lnParam.getE02DLSPP6().equals("3")) out.print("selected");%>> 3 </option>
				    <option value="4" <% if(lnParam.getE02DLSPP6().equals("4")) out.print("selected");%>> 4 </option>
				    <option value="5" <% if(lnParam.getE02DLSPP6().equals("5")) out.print("selected");%>> 5 </option>
					<option value="6" <% if(lnParam.getE02DLSPP6().equals("6")) out.print("selected");%>> 6 </option>
				    <option value="7" <% if(lnParam.getE02DLSPP6().equals("7")) out.print("selected");%>> 7 </option>
				 <%if(currUser.getE01INT().equals("07")){%> <option value="8" <% if(lnParam.getE02DLSPP6().equals("8")) out.print("selected");%>> 8 </option> <% } %>
				</select>               
              </div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%"  > 
	              <div align="center">
					<select id="E02DLSPP7" name="E02DLSPP7" >
					    <option value=" " selected> &nbsp; </option>
					    <option value="1" <% if(lnParam.getE02DLSPP7().equals("1")) out.print("selected");%>> 1 </option>
					    <option value="2" <% if(lnParam.getE02DLSPP7().equals("2")) out.print("selected");%>> 2 </option>
					    <option value="3" <% if(lnParam.getE02DLSPP7().equals("3")) out.print("selected");%>> 3 </option>
					    <option value="4" <% if(lnParam.getE02DLSPP7().equals("4")) out.print("selected");%>> 4 </option>
					    <option value="5" <% if(lnParam.getE02DLSPP7().equals("5")) out.print("selected");%>> 5 </option>
						<option value="6" <% if(lnParam.getE02DLSPP7().equals("6")) out.print("selected");%>> 6 </option>
					    <option value="7" <% if(lnParam.getE02DLSPP7().equals("7")) out.print("selected");%>> 7 </option>
				 		<option value="8" <% if(lnParam.getE02DLSPP7().equals("8")) out.print("selected");%>> 8 </option> 
					</select>	               
	              </div>
	            </td>
			  <% } %>
            <td nowrap width="12%"  > 
              <div align="center"> 
				<select id="E02DLSPP8" name="E02DLSPP8" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(lnParam.getE02DLSPP8().equals("1")) out.print("selected");%>> 1 </option>
				    <option value="2" <% if(lnParam.getE02DLSPP8().equals("2")) out.print("selected");%>> 2 </option>
				    <option value="3" <% if(lnParam.getE02DLSPP8().equals("3")) out.print("selected");%>> 3 </option>
				    <option value="4" <% if(lnParam.getE02DLSPP8().equals("4")) out.print("selected");%>> 4 </option>
				    <option value="5" <% if(lnParam.getE02DLSPP8().equals("5")) out.print("selected");%>> 5 </option>
					<option value="6" <% if(lnParam.getE02DLSPP8().equals("6")) out.print("selected");%>> 6 </option>
				    <option value="7" <% if(lnParam.getE02DLSPP8().equals("7")) out.print("selected");%>> 7 </option>
				 <%if(currUser.getE01INT().equals("07")){%> <option value="8" <% if(lnParam.getE02DLSPP8().equals("8")) out.print("selected");%>> 8 </option> <% } %>
				</select>              
              </div>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="12%" > 
              <div align="center">Principal</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Intereses</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Mora</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Comisiones</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Impuestos</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Deducciones</div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%" > 
	              <div align="center">FECI</div>
	            </td>
			  <% } %>
            <td nowrap width="12%" > 
              <div align="center">Cobranzas</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p align="center"> 
        <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </p>


</form>
<script type="text/javascript">
function modifyPrioritySelection(){
	$.each(SELECT_BOX, function(index,field){
	    $("#"+field.id+" option").removeAttr("disabled");
	}); 

	$.each(SELECT_BOX, function(index,field){
	    	var SELECT_BOX_VALUE = field.value;                          
	         if(SELECT_BOX_VALUE.trim() !== ""){     
	             $.each(SELECT_BOX, function(indexInner,fieldInner){
	                if(field !== fieldInner){
	                    $("#"+fieldInner.id+" option[value="+SELECT_BOX_VALUE+"]").attr("disabled","disabled");
	                }
	             });
	         }
		});
}


$().ready(function(){
	SELECT_BOX = $("#tableSelect tr:first select");	
	
	$.each(SELECT_BOX, function(index,field){
        $("#"+field.id+"").change(modifyPrioritySelection);
    });
	
	modifyPrioritySelection();
});



</script>
</body>
</html>
