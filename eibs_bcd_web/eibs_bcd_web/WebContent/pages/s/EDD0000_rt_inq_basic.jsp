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

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
else if ( userPO.getOption().equals("CP") ) {
%>
	builtNewMenu(cpar_i_opt);
<%   
}
%>

</SCRIPT>
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
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="48" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b>
              <input type="text" name="E02TYPE" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Oficial :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="48" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
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
								       else if (rtBasic.getE02ACMWHF().equals("R")) out.print("Dirección Fisica");
								       else if (rtBasic.getE02ACMWHF().equals("O")) out.print("Oficina del Banco");
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
  
  
  <H4>Informaci&oacute;n para Cargos por Servicios</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Cargos por Servicios :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E02ACMSCF" size="2" value="<% if(rtBasic.getE02ACMSCF().equals("Y")) out.print("Si");
              				else if(rtBasic.getE02ACMSCF().equals("N")) out.print("No");
							else out.print("");%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Frecuencia Cobro de Cargos :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E02ACMSHF" readonly value="<% if(rtBasic.getE02ACMSHF().equals("D")) out.print("Diario");
              				else if(rtBasic.getE02ACMSHF().equals("W")) out.print("Semanal");
							else if(rtBasic.getE02ACMSHF().equals("B")) out.print("Quincenal");
							else if(rtBasic.getE02ACMSHF().equals("M")) out.print("Mensual");
							else if(rtBasic.getE02ACMSHF().equals("Q")) out.print("Trimestral");%>" size="25">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digos Tabla de Cargos :</div>
            </td>
            <td nowrap width="21%"> 
              <input type="text" name="E02DSCACL" size="35" maxlength="35" value="<%= rtBasic.getE02DSCACL().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Ciclo/D&iacute;a Cobro de Cargos :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E02ACMSHY" size="3" maxlength="2" value="<%= rtBasic.getE02ACMSHY().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
	
	<% //Mexico G.A.T and C.A.T
	if(currUser.getE01INT().equals("04")){ %>  
  <H4>Información de Indicadores Financieros</H4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: <%= (Integer.valueOf(rtBasic.getE02ACMACD()) < 06 ) ? "table-row" : "none" %>"> 
            <td nowrap width="25%"> 
              <div align="right">Ganancia Anual Total (G.A.T) Nominal :</div>
            </td>
            <td nowrap width="25%">
              <eibsinput:text name="rtBasic" property="E02ACMICA" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Ganancia Anual Total (G.A.T) Real :</div>
            </td>
            <td nowrap width="25%">
              <eibsinput:text name="rtBasic" property="E02ACMI2Y" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" > 
            <td nowrap width="25%"> 
              <div align="right" style="visibility: <%= (Integer.valueOf(rtBasic.getE02ACMACD()) < 06 ) ? "" : "hidden" %>">
              	Tasa Neta :
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left" style="visibility: <%= (Integer.valueOf(rtBasic.getE02ACMACD()) < 06 ) ? "" : "hidden" %>">
              		<input type="text" name="E02ACMI2L" size="9" maxlength="7" value="<%= new BigDecimal(rtBasic.getE02ACMI2L()).setScale(4, BigDecimal.ROUND_HALF_UP)%>" readonly>
				</div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<% } %>

<%if(userPO.getOption().equals("RT")){ %> 
  <H4>Asignaci&oacute;n de Chequeras</H4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%">
            	<div align="right">Nombre Personalizado :</div>
            </td>
            <td nowrap width="30%">
            	<INPUT type="text" name="E02ACMCK1" id="E02ACMCK1" size="46" maxlength="45" value="<%= rtBasic.getE02ACMCK1().trim()%>" readonly>
            </td>
            <td nowrap width="20%">
            	<div align="right"></div>
            </td>
            <td nowrap width="30%">
            </td>
          </tr>

        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%">
              <div align="right">
              <input type="text" name="E02ACMRE1" size="2" value="<% if(rtBasic.getE02ACMRE1().equals("Y")) out.print("Y");
              				else if(rtBasic.getE02ACMCBC().equals("O")) out.print("O");
							else out.print(" ");%>" readonly>
             </div>
            </td>
            <td nowrap width="30%">
              <INPUT type="text" name="E02ACMCK2" id="E02ACMCK2" size="46" maxlength="45" value="<%= rtBasic.getE02ACMCK2().trim()%>" readonly>
            </td>
            <td nowrap width="20%">
            	<div align="right"></div>
            </td>
            <td nowrap width="30%">
            </td>
          </tr>

        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
              <div align="right">Tipo  de Chequera :</div>
            </td>
            <td nowrap width="30%">
            <INPUT type="text" name="E02ACMTBK" id="E02ACMTBK" size="3" maxlength="2" value="<%= rtBasic.getE02ACMTBK().trim()%>" readonly>
            </td>
            <td nowrap width="20%">
              <div align="right">Cantidad  :</div>
            </td>
            <td nowrap width="20%">
              <INPUT type="text" name="E02ACMNCB" id="E02ACMNCB" size="3" maxlength="2" value="<%= rtBasic.getE02ACMNCB().trim()%>" readonly>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
              <div align="right">Cobro de Cargos :</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="E02ACMCBC" size="2" value="<% if(rtBasic.getE02ACMCBC().equals("Y")) out.print("Si");
              				else if(rtBasic.getE02ACMCBC().equals("N")) out.print("No");
							else out.print("");%>" readonly>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Stock Mínimo :</div>
            </td>
            <td nowrap width="20%">
            	<INPUT type="text" name="E02ACMMSK" id="E02ACMMSK" size="3" maxlength="2" value="<%= rtBasic.getE02ACMMSK().trim()%>" readonly> 
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
              <div align="right">Restricción de Entregas :</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="E02ACMCON" size="2" value="<% if(rtBasic.getE02ACMCON().equals("Y")) out.print("Si");
              				else if(rtBasic.getE02ACMCON().equals("N")) out.print("No");
							else out.print("");%>" readonly>
            </td>
            <td nowrap width="20%">
            	<div align="right"></div>
            </td>
            <td nowrap width="30%">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<% } else{%>
 	<H4>Asignaci&oacute;n de Talonario</H4>
<table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap><div align="right">Nombre en Talonario:</div></td>
            <td nowrap colspan=3>
            <INPUT type="text" name="E02ACMCK1" size="46" maxlength="45" value="<%= rtBasic.getE02ACMCK1().trim()%>" readonly >
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap>
              <div align="right">
              <SELECT name="E02ACMRE1" disabled >
              	<OPTION value="Y" <%if (!rtBasic.getE02ACMRE1().equals("O")) out.print("selected"); %>="">Y</OPTION>
              <% if (currUser.getE01INT().equals("07")) { %>
                <OPTION value="O" <%if (rtBasic.getE02ACMRE1().equals("O")) out.print("selected"); %>="">O</OPTION>
                <%} else { %>              	
                <OPTION value="O" <%if (rtBasic.getE02ACMRE1().equals("O")) out.print("selected"); %>="">Y/O</OPTION>
               <% } %>
              </SELECT></div>
            </td>
            <td nowrap colspan=3>
              <INPUT type="text" name="E02ACMCK2" size="46" maxlength="45" value="<%= rtBasic.getE02ACMCK2().trim()%>" readonly>
            </td>
            <td nowrap> 
            </td>
            <td nowrap >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Tipo de Taloranio :</div>
            </td>
            <td nowrap <% if (!rtBasic.getH02FLGMAS().equals("N")) out.print("colspan=3");%>>
            <INPUT type="text" name="E02ACMTBK" size="3" maxlength="2" value="<%= rtBasic.getE02ACMTBK().trim()%>" readonly>
            </td>
          	<td nowrap width="20%"> 
              <div align="right">Cobro de Cargos :</div>
            </td>
            <td nowrap width="30%">
              <input type="text" name="E02ACMCBC" size="2" value="<% if(rtBasic.getE02ACMCBC().equals("Y")) out.print("Si");
              				else if(rtBasic.getE02ACMCBC().equals("N")) out.print("No");
							else out.print("");%>" readonly>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Restricción de Entregas :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E02ACMCON" size="2" value="<% if(rtBasic.getE02ACMCON().equals("Y")) out.print("Si");
              				else if(rtBasic.getE02ACMCON().equals("N")) out.print("No");
							else out.print("");%>" readonly>
            </td>
            <td nowrap>
            </td>
            <td nowrap>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<% } %>
  <H4>Informaci&oacute;n Estado de Cuenta</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Frecuencia de Estado de Cuenta :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E02ACMSTF" readonly value="<% if(rtBasic.getE02ACMSTF().equals("D")) out.print("Diario");
              				else if(rtBasic.getE02ACMSTF().equals("W")) out.print("Semanal");
							else if(rtBasic.getE02ACMSTF().equals("B")) out.print("Quincenal");
							else if(rtBasic.getE02ACMSTF().equals("M")) out.print("Mensual");
							else if(rtBasic.getE02ACMSTF().equals("Q")) out.print("Trimestral");%>" size="15">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Retenci&oacute;n de Correos :</div>
            </td>
            <td nowrap width="24%"><font face="Arial" size="2"> 
              <input type="text" name="E02ACMHSF" size="2" value="<% if(rtBasic.getE02ACMHSF().equals("H")) out.print("Si");
              				else if(rtBasic.getE02ACMHSF().equals("")) out.print("No");
							else out.print("");%>" readonly>
              </font> </td>
          </tr>
          <tr id="trclear">   
            <td nowrap width="30%"> 
              <div align="right">Ciclo/D&iacute;a Impresi&oacute;n Estado de Cuentas 
                :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E02ACMSDY" size="3" maxlength="2" value="<%= rtBasic.getE02ACMSDY().trim()%>" readonly>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Estado de Cuentas Consolidado :</div>
            </td>
            <td nowrap width="24%"><font face="Arial" size="2"> 
              <input type="text" name="E02ACMCSF" size="2" value="<% if(rtBasic.getE02ACMCSF().equals("Y")) out.print("Si");
              				else if(rtBasic.getE02ACMCSF().equals("N")) out.print("No");
							else out.print("");%>" readonly>
              </font></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Tipo de Estado de 
                Cuenta :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" name="E02ACMSTY" readonly value="<% if(rtBasic.getE02ACMSTY().equals("P")) out.print("Personal");
              				else if(rtBasic.getE02ACMSTY().equals("C")) out.print("Corporativa");
							else if(rtBasic.getE02ACMSTY().equals("N")) out.print("Ninguna");%>" size="15">
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right">Forma de Env&iacute;o de Estado de Cuenta :</div>
            </td>
            <td nowrap width="24%" height="23"> 
              <input type="text" name="E02ACMSTE" readonly value="<% if(rtBasic.getE02ACMSTE().equals("T")) out.print("Telex");
              				else if(rtBasic.getE02ACMSTE().equals("P")) out.print("Impresora");
							else if(rtBasic.getE02ACMSTE().equals("F")) out.print("Facsimil");
							else if(rtBasic.getE02ACMSTE().equals("E")) out.print("Correo Electronico");
							else if(rtBasic.getE02ACMSTE().equals("N")) out.print("Ninguno");%>" size="15">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Cambio de Estado de la Cuenta</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="23%"> 
              <div align="right">Cambiado por (Funcionario):</div>
            </td>
            <td nowrap width="23%"> 
                <eibsinput:text name="rtBasic" property="E02ACMUIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_OFFICER %>" readonly="true" />
                <eibsinput:text name="rtBasic" property="E02DSCUIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
            </td>
            <td nowrap width="22%"> 
              <div align="right">Estado de la Cuenta:</div>
            </td>
            <td nowrap width="32%"> 
              <input type="text" name="E02ACMAST" readonly value='<% if(rtBasic.getE02ACMAST().equals("A")) out.print("Cuenta Activa");
              				else if(rtBasic.getE02ACMAST().equals("C")) out.print("Cuenta Cancelada");
							else if(rtBasic.getE02ACMAST().equals("I")) out.print("Cuenta Inactiva 1");
							else if(rtBasic.getE02ACMAST().equals("D")) out.print("Cuenta Inactiva 2");
							else if(rtBasic.getE02ACMAST().equals("O")) out.print("Cuenta Controlada");
							else if(rtBasic.getE02ACMAST().equals("E")) out.print("Cuenta Embargada");
							else if(rtBasic.getE02ACMAST().equals("T")) out.print("Acepta Solo Depositos");
							else out.print("");%>' size="25">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="23%"> 
              <div align="right">Fecha de Cambio:</div>
            </td>
            <td nowrap width="23%">
		   		  <eibsinput:date name="rtBasic" fn_year="E02LSCSTY" fn_month="E02LSCSTM" fn_day="E02LSCSTD" readonly="true"/>
            </td>
            <td nowrap width="14%">
					<div align="right">Fecha de Mandato:</div>
					</td><td nowrap width="26%">
						<eibsinput:date name="rtBasic" fn_year="E02ACMCSY" fn_month="E02ACMCSM" fn_day="E02ACMCSD" required="false" readonly="true" />
					</td>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
<%if(userPO.getOption().equals("RT")){ %> 
  <h4>L&iacute;nea y L&iacute;mite de Cr&eacute;dito</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Cliente de la L&iacute;nea:</div>
            </td>
            <td nowrap width="16%"> 
                <eibsinput:text name="rtBasic" property="E02ACMCMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="27%"> 
              <div align="right">L&iacute;nea de Cr&eacute;dito:</div>
            </td>
            <td nowrap width="28%">
                <eibsinput:text name="rtBasic" property="E02ACMCMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Valor L&iacute;mite de Cr&eacute;dito:</div>
            </td>
            <td nowrap width="16%"> 
                <eibsinput:text name="rtBasic" property="E02ACMCLI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="27%"> 
              <div align="right">Fecha Revisi&oacute;n de Cr&eacute;dito:</div>
            </td>
            <td nowrap width="28%"> 
		   		  <eibsinput:date name="rtBasic" fn_year="E02ODLRDY" fn_month="E02ODLRDM" fn_day="E02ODLRDD" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>L&iacute;mites para Sobregiros</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="29%" height="33"> 
              <div align="right">Permitir Sobregiros :</div>
            </td>
            <td nowrap width="16%" height="33"> <font face="Arial" size="2"> 
              <input type="text" name="E02ACMF03" size="2" value='<% if(rtBasic.getE02ACMF03().equals("1")) out.print("Si");
              				else if(rtBasic.getE02ACMF03().equals("N")) out.print("No");
							else out.print("");%>' readonly>
              </font> </td>
            <td nowrap width="27%" height="33"> 
              <div align="right">Saldo Usado para Sobregiros :</div>
            </td>
            <td nowrap width="28%" height="33"> 
              <input type="text" name="E02ACMONG" readonly value='<% if(rtBasic.getE02ACMONG().equals("G")) out.print("Saldo en Libros");
              				else if(rtBasic.getE02ACMONG().equals("N")) out.print("Saldo Neto");
							else if(rtBasic.getE02ACMONG().equals("C")) out.print("Segun Control");
							else out.print("");%>' size="25">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Cargos por Sobregiros :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E02ACMODF" readonly value='<% if(rtBasic.getE02ACMODF().equals("N")) out.print("No Cargos");
              				else if(rtBasic.getE02ACMODF().equals("1")) out.print("Si Cargos");
							else if(rtBasic.getE02ACMODF().equals("2")) out.print("Diferir Cargos");
							else if(rtBasic.getE02ACMODF().equals("3")) out.print("Cargos Diarios");
							else if(rtBasic.getE02ACMODF().equals("4")) out.print("A Prestamos");
							else out.print("");%>' size="25">
            </td>
            <td nowrap width="27%"> 
              <div align="right">Porcentaje Maximo de Garantia :</div>
            </td>
            <td nowrap width="28%"> 
              <input type="text" name="E02ACMCPE" maxlength="7" size="7" value="<%= rtBasic.getE02ACMCPE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Valor L&iacute;mite de Sobregiro 1:</div>
            </td>
            <td nowrap width="16%"> 
                <eibsinput:text name="rtBasic" property="E02ACMOL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="27%"> 
              <div align="right">Sobretasa por Sobregiro 1:</div>
            </td>
            <td nowrap width="28%"> 
                <eibsinput:text name="rtBasic" property="E02ACMOI1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="23"> 
              <div align="right">Valor L&iacute;mite de Sobregiro 2:</div>
            </td>
            <td nowrap width="16%" height="23"> 
                <eibsinput:text name="rtBasic" property="E02ACMOL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
            </td>
            <td nowrap width="27%" height="23"> 
              <div align="right">Sobretasa por Sobregiro2 :</div>
            </td>
            <td nowrap width="28%" height="23"> 
                <eibsinput:text name="rtBasic" property="E02ACMOI2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Cuenta Contable Relacionada</div>
            </td>
            <td nowrap width="16%" height="19"> 
                <eibsinput:text name="rtBasic" property="E02ACMRGL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
            </td>
            <td nowrap width="27%" height="19"> 
              <div align="right">Cuenta Detalle Relacionada:</div>
            </td>
            <td nowrap width="28%" height="19"> 
                <eibsinput:text name="rtBasic" property="E02ACMRAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Oficina Relacionada:</div>
            </td>
            <td nowrap width="16%" height="19"> 
                <eibsinput:text name="rtBasic" property="E02ACMRBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true" />
            </td>
            <td nowrap width="24%"></td><td nowrap width="23%"></td>
            
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
<% } %>
  
 <%  if ( userPO.getOption().equals("SV") && !rtBasic.getE02ACATYH().equals("")) {%>
 
  <H4>Plan de Ahorro/Proposito</H4>
   <% if (rtBasic.getE02ACATYH().equals("4")){%>
        	<p><b>Ver Plan</b><a href="javascript:showSavingsPlan()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Plan de Pagos" align="middle" border="0" ></a></p>
        <% }%>
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
 <%  if ( userPO.getOption().equals("CP") ) {%>
  <H4>Cuotas de Participación</H4>
	<table id="mainTable" class="tableinfo">
		<tr bordercolor="#FFFFFF">
			<td nowrap>
			<table cellspacing="0" cellpadding="2" width="100%" border="0">	
				<tr id="trclear">
					<td nowrap width="27%">
					<div align="right">Número de Convenio :</div>
					</td><td nowrap width="23%">
						<input type="text" size="12" maxlength="12" name="E02ACARCL" readonly value="<%=rtBasic.getE02ACARCL().trim()%>">
					</td>
					<td nowrap width="24%">
					<div align="right">Fecha de Inicio :</div>
					</td><td nowrap width="26%">
						<eibsinput:date name="rtBasic" fn_year="E02ACASTY" fn_month="E02ACASTM" fn_day="E02ACASTD" required="false" readonly="true" />
					</td>
				</tr>
				<tr id="trdark">
					<td nowrap width="27%">
					<div align="right">Número de Cuotas Pactadas:</div>
					</td>
					<td nowrap width="23%"><input type="text" size="7" maxlength="7" name="E02ACACON" readonly value="<%=rtBasic.getE02ACACON().trim()%>">
					</td>
					<td nowrap width="24%">
					<div align="right">Monto en Moneda Nacional:</div>
					</td>
					<td nowrap width="26%">
						<eibsinput:text name="rtBasic" property="E02ACAAUG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" readonly="true" />
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
											out.print("Planilla/Nomina");
										else if (rtBasic.getE02ACATYR().equals("2")) 
											out.print("PAC/Automatico");
										else if(rtBasic.getE02ACATYR().equals("3"))
											out.print("Caja");
										else 	
											out.print("");%>'>
								</td>
					<td nowrap width="24%">
					<div align="right">Cuenta  a Debitar:</div>
					</td><td nowrap width="23%">
						<eibsinput:help name="rtBasic" property="E02ACAPAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E02ACAPAC" fn_param_two="document.forms[0].E02ACMBNK.value" fn_param_three="RT" readonly="true" />
					</td>
				 </tr>
				<tr id="trdark">
					<td nowrap width="24%">
					<div align="right">Frecuencia :</div>
					</td><td nowrap width="26%">
						<input type="hidden"  name="E02ACAFRE" value="<%= rtBasic.getE02ACAFRE()%>" >
						<input type="text" readonly size="15"  value=' <% if (rtBasic.getE02ACAFRE().equals("M"))
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
					<td nowrap width="24%">
					<div align="right">Día de aplicación :</div>
					</td>
					<td nowrap width="26%"><input type="text" size="2" maxlength="3" name="E02ACADMP" readonly value="<%=rtBasic.getE02ACADMP().trim()%>">
					</td>
				</tr>
				<tr id="trclear">
					<td nowrap width="27%">
					<div align="right">Moneda :</div>
					</td><td nowrap width="23%">
						<eibsinput:help name="rtBasic" property="E02ACACCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" required="false" fn_param_one="E02ACACCY" fn_param_two="document.forms[0].E02ACMBNK.value" readonly="true" />
					</td>
					<td width="24%">
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
				<tr id="trdark">
					<td width="24%">
					<div align="right">Fecha de cambio de Estado :</div>
					</td>
					<td width="26%">
						<eibsinput:date name="rtBasic" fn_year="E02ACAENY" fn_month="E02ACAENM" fn_day="E02ACAEND" required="false" readonly="true" />
					</td>
					<td nowrap width="27%">
					<div align="right">Número orden de pago :</div>
					</td>
					<td nowrap width="23%">
						<input type="text"  readonly name="E02ACANUM" value="<%= rtBasic.getE02ACANUM()%>" >
					</td>        
					<td width="24%"></td>
					<td width="26%"></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
 <% }%>  
  
  <H4>Información  Impuestos</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <% if (currUser.getE01INT().equals("05")) {%>
              <td nowrap width="30%" align="right">Exenta del Gravamen a Movimientos Financieros (GMF): 
              </td>
              <td nowrap width="18%"> 
                <input type="text" name="E02ACMTX1" size="2" value="<% if(rtBasic.getE02ACMTX1().equals("Y")) out.print("Si");
              	 			else if(rtBasic.getE02ACMTX1().equals("N")) out.print("No");
				 			else out.print("");%>" disabled="disabled">
			  </td>
			  <td nowrap width="29%"> 
              	<div align="right">Valor Acumulado Mes Retiros para Tope GMF: </div>
             </td>
             <td nowrap width="16%"> 
                <eibsinput:text name="rtBasic" property="E02ACMTPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
             </td>	
            <% } else {%>			 				
              <td nowrap width="30%"></td>
              <td nowrap width="18%"></td>
            <%}%> 
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%">
              <div align="right">Clase Cuenta   :</div>
            </td>
            <td nowrap width="22%"> 
              <input type="text" name="E02ACMTX9" size="2" maxlength="1" value="<%= rtBasic.getE02ACMTX9().trim()%>" readonly>
            </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>     
  
  
  </form>
</body>
</html>
