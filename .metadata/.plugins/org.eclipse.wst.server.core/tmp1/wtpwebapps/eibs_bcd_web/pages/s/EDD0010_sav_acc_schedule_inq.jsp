<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "java.math.BigDecimal" %>

<html>
<head>
<title>Consulta de Cuentas Corrientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="rtBasic" class="datapro.eibs.beans.EDD009002Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<body>


<script type="text/javascript">

function showSavingsPlan() {
	var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDD0000?SCREEN=910";
	CenterWindow(url, 1070, 660, 2);
}
</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<H3 align="center">Informaci&oacute;n B&aacute;sica<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_inq_basic.jsp, EDD0000"> 
  </H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="29">
  
  <table border="0" cellspacing="0" cellpadding="0" width="100%">
  	<tr>
  		<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=rtBasic.getE02PENDAP()%></b></td>
  		<td width="5%"></td>
  	</tr>
  </table> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= rtBasic.getE02ACMCUN()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="48" maxlength="45" readonly value="<%= rtBasic.getE02CUSNA1()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b>
              <input type="text" name="E02TYPE" size="4" maxlength="4" readonly value="<%= rtBasic.getE02ACMATY()%>">
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%=rtBasic.getE02ACMPRO()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= rtBasic.getE02ACMACC()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
            </td>
            <td nowrap width="33%"> 
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E02DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

 <%int row = 0; %>

<table class=tbenter>
  <tr > 
     <td nowrap width="50%"> 
	  <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4>
     </td>
     <td nowrap width="20%"> 
     </td>
     <td nowrap align=right width="10%"> 
   		<b>ESTADO :</b>
     </td>
     <td nowrap width="20%"> 
   		<b><font color="#ff6600"><%= rtBasic.getE02DSCAST().trim()%></font></b>
     </td>
   </tr>
</table>
  
<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%"> 
              <div align="right">Nombre de la Cuenta :</div>
            </td>
            <td nowrap width="22%"> 
                <eibsinput:text name="rtBasic" property="E02ACMNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td nowrap width="23%"> 
            </td>
            <td nowrap width="26%"> 
		   </td>				
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%">
              <div align="right">Banco/Sucursal</div>
            </td>
            <td nowrap width="22%">
                <eibsinput:text name="rtBasic" property="E02ACMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
                <eibsinput:text name="rtBasic" property="E02ACMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
            </td>
            <td nowrap width="23%">
              <div align="right">Moneda/Cta Contable</div>
            </td>
            <td nowrap width="26%">
                <eibsinput:text name="rtBasic" property="E02ACMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
                <eibsinput:text name="rtBasic" property="E02ACMGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
            </td>
          </tr>
        
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="22%"> 
		   		  <eibsinput:date name="rtBasic" fn_year="E02OPNDTY" fn_month="E02OPNDTM" fn_day="E02OPNDTD" readonly="true"/>
            </td>
            <td nowrap width="23%"> 
              <div align="right">Fecha de Ingreso :</div>
            </td>
            <td nowrap width="22%"> 
		   		  <eibsinput:date name="rtBasic" fn_year="E02ACMSUY" fn_month="E02ACMSUM" fn_day="E02ACMSUD" readonly="true"/>
            </td>
          </tr>          
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="23%" height="23"> 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="26%" height="23"> 
                <eibsinput:text name="rtBasic" property="E02ACMCCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>" readonly="true"/>
            </td>
             <td nowrap width="29%" height="23"> 
              <div align="right">Uso de domicilio :</div>
            </td>
            <td nowrap width="22%" height="23"> 
               <input type="text" readonly name="E02ACMWHF" size="18" maxlength="18" 
                                  value="<% if (rtBasic.getE02ACMWHF().equals("C")) out.print("Correo Electrónico");
								       else if (rtBasic.getE02ACMWHF().equals("O")) out.print("Dirección Fisica");
							           else out.print("");%>">
              <input type="text" name="E02ACMMLA" size="2" maxlength="1" value="<%= rtBasic.getE02ACMMLA().trim()%>" readonly>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="29%" height="19"> 
              <div align="right">Diferidos Locales :</div>
            </td>
            <td nowrap width="22%" height="19"> 
              <input type="text" size="2" maxlength="1" value="<%= rtBasic.getE02ACMWLF().trim()%>" name="E02ACMWLF" readonly>
            </td>
            <td nowrap width="23%" height="19"> 
              <div align="right">Diferidos No Locales :</div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="text" size="2" maxlength="1" value="<%= rtBasic.getE02ACMWNF().trim()%>" name="E02ACMWNF" readonly>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap>
              <div align="right">Frecuencia Pago de Intereses :</div>
        	</td>
            <td nowrap width="24%">
				<input type="hidden" name="E02ACMF07" value="<%= rtBasic.getE02ACMF07()%>">
				<input type="text" readonly  size="15" 
					value='<% if (rtBasic.getE02ACMF07().equals("M")) out.print("Mensual");
							else if (rtBasic.getE02ACMF07().equals("D")) out.print("Diario");
							else if (rtBasic.getE02ACMF07().equals("Q")) out.print("Trimestral");
							else if (rtBasic.getE02ACMF07().equals("S")) out.print("Semestral");
							else if (rtBasic.getE02ACMF07().equals("Y")) out.print("Anual");
							else out.print("No Aplica");%>'>
            </td>
            <td nowrap width="23%"> 
              <div align="right">Tipo de Cuenta :</div>
            </td>
			<td nowrap width="24%">
				<input type="hidden" name="E02ACMPEC" value="<%= rtBasic.getE02ACMPEC()%>">
				<input type="text" readonly size="15" 
					value='<% if (rtBasic.getE02ACMPEC().equals("1")) out.print("Individual");
							else if (rtBasic.getE02ACMPEC().equals("2")) out.print("Mancomunada");
							else if (rtBasic.getE02ACMPEC().equals("3")) out.print("Solidaria");
							else if (rtBasic.getE02ACMPEC().equals("4")) out.print("Menor");
							else if (rtBasic.getE02ACMPEC().equals("5")) out.print("juridica");
							else out.print("");%>'>
            </td>
          </tr>
        <% if (!rtBasic.getE02ACMACD().equals("04")){ %>  
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        	<td nowrap width="20%" > 
              <div align="right">Sobregiros Permitidos :</div>
            </td>
            <td nowrap width="30%" >
              <input type="hidden" name="E01ACMF03" id="E01ACMF03" value="<%= rtBasic.getE02ACMF03()%>">
              <input type="text" readonly size="3" 
					value='<%if (rtBasic.getE02ACMF03().equals("1")) out.print("SI");
							else if (rtBasic.getE02ACMF03().equals("N")) out.print("NO");
							%>'>
            </td>
            <td nowrap width="29%" height="19"> 
              <div align="right">Tarjeta ATM :</div>
            </td>
            <td nowrap width="22%" height="19"> 
              <input type="text" name="E02ACMATM" size="8" maxlength="8" value="<%= rtBasic.getE02ACMATM().trim()%>" readonly>
            </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
         <td nowrap width="20%" > 
              <div align="right">Numero de Pagare :</div>
            </td>
            <td nowrap width="30%" >
            	<input type="text" name="E01ACMOFN" id="E01ACMOFN" size="12" maxlength="11" value="<%= rtBasic.getE02ACMOFN().trim()%>" readonly="readonly">  
            </td>
             <td nowrap width="20%" > 
            </td>
            <td nowrap width="30%" >
            </td>
        </tr>    
        <%}else{ %>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        	 <td nowrap width="29%" height="19"> 
              <div align="right">Tarjeta ATM :</div>
            </td>
            <td nowrap width="22%" height="19"> 
              <input type="text" name="E02ACMATM" size="8" maxlength="8" value="<%= rtBasic.getE02ACMATM().trim()%>" readonly>
            </td>
           <td nowrap width="20%" > 
            </td>
            <td nowrap width="30%" >
            </td>
        </tr>
        <%} %>
            
        </table>
      </td>
    </tr>
  </table>
  

 <%  if ( userPO.getOption().equals("SV") && !rtBasic.getE02ACATYH().equals("")) {%>
 
  <H4>Plan de Ahorro/Proposito</H4>
   <table id="mainTable" class="tableinfo">
		<tr bordercolor="#FFFFFF">
			<td nowrap>
			<table cellspacing="0" cellpadding="2" width="100%" border="0">
				<tr id="trdark">
					<td nowrap width="27%">
					<div align="right">Tipo del Ahorro :</div>
					</td>
					<td nowrap width="23%">
						<input type="hidden"  name="E02ACATYH" value="<%= rtBasic.getE02ACATYH()%>" >
						<input type="text" size="35" readonly value=' <% if (rtBasic.getE02ACATYH().equals("")) 
											out.print("No Aplica");
										else if (rtBasic.getE02ACATYH().equals("1")) 
											out.print("Ahorro Vivienda");
										else if (rtBasic.getE02ACATYH().equals("2")) 
											out.print("Ahorro para Menores");
										else if (rtBasic.getE02ACATYH().equals("4")) 
											out.print("Ahorro Programado/Proposito");	

										else 
											out.print("");%>'>
					</td>
					<td nowrap width="27%">
					<div align="right">Estado :</div>
					</td>
					<td nowrap width="23%">
						<input type="hidden"  name="E02ACASTS" value="<%= rtBasic.getE02ACASTS()%>" >
						<input type="text" readonly size="15" value='<% if(rtBasic.getE02ACASTS().equals("1")) 
											out.print("Vigente");
									  else if (rtBasic.getE02ACASTS().equals("2")) 
											out.print("No Vigente");
									  else 
											out.print("");%>'>
					</td>
				</tr>
				<tr id="trclear">
					<td nowrap width="24%">
					<div align="right">Fecha de Inicio :</div>
					</td><td nowrap width="26%">
						<eibsinput:date name="rtBasic" fn_year="E02ACASTY" fn_month="E02ACASTM" fn_day="E02ACASTD" required="false" readonly="true" />
					</td>
					 <td nowrap width="24%">
					   <div align="right">Fecha de Vencimiento :</div>
					</td>
					<td nowrap width="26%">
					   <eibsinput:date name="rtBasic" fn_year="E02ACAENY" fn_month="E02ACAENM" fn_day="E02ACAEND" readonly="true" />
					</td>
				</tr>
				<tr id="trdark">
					<td nowrap width="25%">
						<div align="right">Monto Pactado:</div>
					</td>
					<td nowrap width="23%">
						<input type="text"  readonly name="E02ACAMMO" value="<%= rtBasic.getE02ACAMMO()%>" >
					</td>
					<td nowrap width="24%">
					<div align="right">Frecuencia :</div>
					</td><td nowrap width="26%">
						<input type="hidden"  name="E02ACAFRE" value="<%= rtBasic.getE02ACAFRE()%>" >
						<input type="text" readonly size="15"  value=' <% if (rtBasic.getE02ACAFRE().equals("B"))
										 	out.print("Quincenal");
										 else if (rtBasic.getE02ACAFRE().equals("M")) 
										    out.print("Mensual");	
										 else if (rtBasic.getE02ACAFRE().equals("Q")) 
										    out.print("Trimestral");
										 else if (rtBasic.getE02ACAFRE().equals("S")) 
											out.print("Semestral");
										 else if (rtBasic.getE02ACAFRE().equals("Y")) 
											out.print("Anual");
										 else 
											out.print("");%>'>
					</td>
				</tr>
				<tr id="trclear">
					<td nowrap width="24%">
						<div align="right">Medio de Pago :</div>
					</td><td nowrap width="26%">
						<input type="hidden"  name="E02ACATYR" value="<%= rtBasic.getE02ACATYR()%>" >
						<input type="text" readonly size="25"  value=' <% if (rtBasic.getE02ACATYR().equals("0")) 
											out.print("No Programado");
										else if (rtBasic.getE02ACATYR().equals("1")) 
											out.print("Convenio");
										else if (rtBasic.getE02ACATYR().equals("2")) 
											out.print("Debito Automatico");
										else if(rtBasic.getE02ACATYR().equals("3"))
											//out.print("Caja");
											out.print("Pago Directo a cuenta");
										else 	
											out.print("");%>'>
					</td>
					
				</tr>
				<tr id="trdark">
					<td nowrap width="24%">
					<div align="right">Cuenta  a Debitar :</div>
					</td><td nowrap width="23%">
						<eibsinput:help name="rtBasic" property="E02ACAPAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E02ACAPAC" fn_param_two="document.forms[0].E02ACMBNK.value" fn_param_three="RT" readonly="true" />
					</td>
					<td nowrap width="24%">
					<div align="right">Dia de Aplicacion :</div>
					</td>
					<td nowrap width="26%">
						<input type="text" size="4" name="E02ACADMP" readonly value="<%=rtBasic.getE02ACADMP().trim()%>">
					</td>
				</tr>
				<tr id="trclear">
					<td nowrap width="27%">
					<div align="right">Cuotas Pactadas :</div>
					</td>
					<td nowrap width="23%">
						<input type="text" size="4" name="E02ACACON" readonly value="<%=rtBasic.getE02ACACON().trim()%>">
					</td>
					<td nowrap width="24%">
					<div align="right">Monto del Ahorro :</div>
					</td>
					<td nowrap width="26%">
						<eibsinput:text name="rtBasic" property="E02ACAAUG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="true" />
					</td>
				</tr>
				<tr id="trdark">
				    <td nowrap width="24%">
					   <div align="right">Cuotas procesadas :</div>
					</td>
					<td nowrap width="26%">
					  <input type="text" size="4" readonly name="E02ACACPA" value="<%= rtBasic.getE02ACACPA()%>" >
					</td>
					<td nowrap width="24%">
					   <div align="right">Saldo Ahorro esperado :</div>
					</td>
					<td nowrap width="26%">
					   <input type="text" readonly name="E02ACAMMA" value="<%= rtBasic.getE02ACAMMA()%>" >
					</td>
				       
				</tr>
				<tr id="trclear">
					 <td width="24%">
						<div align="right">Fecha de Ultimo Mantenimiento :</div>
					</td>
					<td width="26%">
						<eibsinput:date name="rtBasic" fn_year="E02ACALMY" fn_month="E02ACALMM" fn_day="E02ACALMD" readonly="true" />	
					</td>    
					<td width="24%">
						<div align="right">Usuario ID :</div>
					</td>
					<td width="23%">
						<input type="text" size="11" name="E02ACALMU" readonly value="<%=rtBasic.getE02ACALMU().trim()%>">
					</td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
 <%
    
  }%> 
  
  </form>
</body>
</html>
