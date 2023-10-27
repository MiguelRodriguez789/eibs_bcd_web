<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Cuentas de Ahorro</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="svBasic" class="datapro.eibs.beans.EDD000001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	builtNewMenu(sv_a_opt); 
 
 function showSavingsPlan() {
  			var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDD0000?SCREEN=900";
				CenterWindow(url, 1070, 660, 2);
	}
 
 
</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<H3 align="center"> Aprobacion de Cuentas de Ahorro<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sv_ap_basic.jsp, EDD1000" width="32" height="32"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="30">
  <INPUT TYPE=HIDDEN NAME="E01ACMBNK" VALUE="<%= svBasic.getE01ACMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%= svBasic.getE01ACMATY().trim()%>">
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
                <input type="text" name="E01ACMCUN" size="10" maxlength="9" value="<%= svBasic.getE01ACMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= svBasic.getE01CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01ACMACC" size="13" maxlength="12" value="<%= svBasic.getE01ACMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= svBasic.getE01ACMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01ACMPRO" size="4" maxlength="4" value="<%= svBasic.getE01ACMPRO().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <%int row = 0; %>
  <H4>Datos B&aacute;sicos de la Operaci&oacute;n</H4>
<table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%"> 
              <div align="right">Nombre de la Cuenta:</div>
            </td>
            <td nowrap width="19%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMNME().equals("Y")) out.print("class=\"txtchanged\""); %>  name="E01ACMNME" size="60" maxlength="80" value="<%= svBasic.getE01ACMNME().trim()%>">
            </td>
            <td nowrap width="26%"> 
            </td>
            <td nowrap width="26%"> 
            </td>
          </tr>        
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%"> 
              <div align="right">Fecha de Apertura:</div>
            </td>
            <td nowrap width="19%"> 
		   		<eibsinput:date name="svBasic" fn_year="E01ACMOPY" fn_month="E01ACMOPM" fn_day="E01ACMOPD" modified="F01ACMOPM;F01ACMOPD;F01ACMOPY" readonly="true"/>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Fecha de Ingreso:</div>
            </td>
            <td nowrap width="26%"> 
		   		<eibsinput:date name="svBasic" fn_year="E01ACMSUY" fn_month="E01ACMSUM" fn_day="E01ACMSUD" modified="F01ACMSUM;F01ACMSUD;F01ACMSUY" readonly="true"/>
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%" height="19">
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="19%">            
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="<%= svBasic.getE01ACMBNK().trim()%>" readonly>
              <input type="text" name="E01ACMBRN" size="5" maxlength="4" value="<%= svBasic.getE01ACMBRN().trim()%>" readonly>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Centro de Costo:</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMCCN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCCN" size="9" maxlength="8" value="<%= svBasic.getE01ACMCCN().trim()%>">
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Uso de Domicilio:</div>
            </td>
            <td nowrap width="22%" height="23"> 
               <input type="text" readonly name="E01ACMWHF" size="18" maxlength="18" <% if (svBasic.getF01ACMWHF().equals("Y")) out.print("class=\"txtchanged\""); %>
                                  value="<% if (svBasic.getE01ACMWHF().equals("C")) out.print("Correo Electrónico");
								       else if (svBasic.getE01ACMWHF().equals("O")) out.print("Dirección Fisica");
							           else out.print("");%>">
              <input type="text" name="E01ACMMLA" size="2" maxlength="1" value="<%= svBasic.getE01ACMMLA().trim()%>" readonly <% if (svBasic.getF01ACMMLA().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
            <td nowrap width="23%"> 
              <div align="right">Tipo de Cuenta :</div>
            </td>
			<td nowrap width="24%">
				<input type="hidden" name="E01ACMPEC" value="<%= svBasic.getE01ACMPEC()%>">
				<input type="text" readonly size="15" <% if (svBasic.getF01ACMPEC().equals("Y")) out.print("class=\"txtchanged\""); %> 
					value='<% if (svBasic.getE01ACMPEC().equals("1")) out.print("Individual");
							else if (svBasic.getE01ACMPEC().equals("2")) out.print("Mancomunada");
							else if (svBasic.getE01ACMPEC().equals("3")) out.print("Solidaria");
							else if (svBasic.getE01ACMPEC().equals("4")) out.print("Menor");
							else if (svBasic.getE01ACMPEC().equals("5")) out.print("juridica");
							else out.print("");%>'>
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Diferidos Locales:</div>
            </td>
            <td nowrap width="19%" height="19"> 
              <input type="text" readonly <% if (svBasic.getF01ACMWLF().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= svBasic.getE01ACMWLF().trim()%>" name="E01ACMWLF">
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="right">Diferidos No Locales:</div>
            </td>
            <td nowrap width="26%" height="19"> 
              <input type="text" size="2" readonly <% if (svBasic.getF01ACMWNF().equals("Y")) out.print("class=\"txtchanged\""); %> maxlength="1" value="<%= svBasic.getE01ACMWNF().trim()%>" name="E01ACMWNF">
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="30%" height="19"> 
              <div align="right">Tabla de Documentos:</div>
            </td>
            <td nowrap width="18%" height="19"> 
              <input type="text" size="2" maxlength="1" readonly value="<%= svBasic.getE01APCTNU().trim()%>" name="text">
            </td> 
            <td nowrap width="24%"> 
            </td>
            <td nowrap width="30%"> 
            </td>         
          </tr>
        </table>
      </td>
    </tr>
  </table>
   
  <H4>Informaci&oacute;n para Cargos por Servicios</H4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">Cargos por Servicios :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSCF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSCF" size="3" maxlength="2" 
				  value="<% if (svBasic.getE01ACMSCF().equals("Y")) out.print("Si");
							else if (svBasic.getE01ACMSCF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Frecuencia Cobro de Cargos :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSHF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSHF" size="25" maxlength="30" 
				  value="<% if (svBasic.getE01ACMSHF().equals("D")) out.print("Diario");
							else if (svBasic.getE01ACMSHF().equals("W")) out.print("Semanal");
							else if (svBasic.getE01ACMSHF().equals("B")) out.print("Quincenal");
							else if (svBasic.getE01ACMSHF().equals("M")) out.print("Mensual");
							else if (svBasic.getE01ACMSHF().equals("Q")) out.print("Trimestral");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digos Tabla de Cargos :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMACL().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMACL" size="2" maxlength="2" value="<%= svBasic.getE01ACMACL().trim()%>">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Ciclo/D&iacute;a Cobro de Cargos :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSHY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSHY" size="3" maxlength="2" value="<%= svBasic.getE01ACMSHY().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Informaci&oacute;n Estado de Cuenta</H4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Frecuencia de Estado de Cuenta :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSTF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSTF" size="25" maxlength="30" 
				  value="<% if (svBasic.getE01ACMSTF().equals("D")) out.print("Diario");
							else if (svBasic.getE01ACMSTF().equals("W")) out.print("Semanal");
							else if (svBasic.getE01ACMSTF().equals("B")) out.print("Quincenal");
							else if (svBasic.getE01ACMSTF().equals("M")) out.print("Mensual");
							else if (svBasic.getE01ACMSTF().equals("Q")) out.print("Trimestral");
						    else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Retenci&oacute;n de Correos :</div>
            </td>
            <td nowrap width="24%"><font face="Arial" size="2"> 
              <input type="text" readonly <% if (svBasic.getF01ACMHSF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMHSF" size="3" maxlength="2" 
				  value="<% if (svBasic.getE01ACMHSF().equals("H")) out.print("Si");
							else if (svBasic.getE01ACMHSF().equals("")) out.print("No");
							else out.print("");%>" 
				>
              </font> </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Ciclo/D&iacute;a Impresi&oacute;n Estado de Cuentas 
                :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSDY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSDY" size="3" maxlength="2" value="<%= svBasic.getE01ACMSDY().trim()%>">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Estado de Cuentas Consolidado :</div>
            </td>
            <td nowrap width="24%"><font face="Arial" size="2"> </font><font face="Arial" size="2"> 
              <input type="text" readonly <% if (svBasic.getF01ACMCSF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCSF" size="3" maxlength="2" 
				  value="<% if (svBasic.getE01ACMCSF().equals("Y")) out.print("Si");
							else if (svBasic.getE01ACMCSF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
              </font></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Tipo de Estado de Cuenta :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSTY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSTY" size="25" maxlength="25" 
				  value="<% if (svBasic.getE01ACMSTY().equals("P")) out.print("Personal");
							else if (svBasic.getE01ACMSTY().equals("C")) out.print("Corporativa");
							else if (svBasic.getE01ACMSTY().equals("N")) out.print("Ninguna");
						    else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right">Forma de Env&iacute;o de Estado de Cuenta :</div>
            </td>
            <td nowrap width="24%" height="23"> 
              <input type="text" readonly <% if (svBasic.getF01ACMSTE().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSTE" size="25" maxlength="25" 
				  value="<% if (svBasic.getE01ACMSTE().equals("T")) out.print("Telex");
							else if (svBasic.getE01ACMSTE().equals("P")) out.print("Impresora");
							else if (svBasic.getE01ACMSTE().equals("F")) out.print("Facsimil");
							else if (svBasic.getE01ACMSTE().equals("E")) out.print("Correo Electronico");
							else if (svBasic.getE01ACMSTE().equals("N")) out.print("Ninguno");
						    else out.print("");%>" 	>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 	<H4>Asignaci&oacute;n de Talonario</H4>
<table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap><div align="right">Nombre en Talonario:</div></td>
            <td nowrap colspan=3>
            <INPUT type="text" name="E01ACMCK1" size="46" maxlength="45" value="<%= svBasic.getE01ACMCK1().trim()%>" readonly
            	<% if (svBasic.getF01ACMCK1().equals("Y")) out.print("class=\"txtchanged\""); %> >
            </td>
            
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">
              <SELECT name="E01ACMRE1" disabled <% if (svBasic.getF01ACMRE1().equals("Y")) out.print("class=\"txtchanged\""); %>>
              	<OPTION value="Y" <%if (!svBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">Y</OPTION>
              <% if (currUser.getE01INT().equals("07")) { %>
                <OPTION value="O" <%if (svBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">O</OPTION>
                <%} else { %>              	
                <OPTION value="O" <%if (svBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">Y/O</OPTION>
               <% } %>
              </SELECT></div>
            </td>
            <td nowrap colspan=3>
              <INPUT type="text" name="E01ACMCK2" size="46" maxlength="45" value="<%= svBasic.getE01ACMCK2().trim()%>" readonly
              	<% if (svBasic.getF01ACMCK2().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
            
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Tipo de Taloranio :</div>
            </td>
            <td nowrap <% if (!svBasic.getH01FLGMAS().equals("N")) out.print("colspan=3");%>>
            <INPUT type="text" name="E01ACMTBK" size="3" maxlength="2" value="<%= svBasic.getE01ACMTBK().trim()%>" readonly
            	<% if (svBasic.getF01ACMTBK().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
          	<td nowrap> 
              <div align="right">Cobro de Cargos :</div>
            </td>
            <td nowrap ><INPUT type="text" readonly <% if (svBasic.getF01ACMCBC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCBC" size="3" maxlength="2" value='<% if (svBasic.getE01ACMCBC().equals("Y")) out.print("Si");
							else if (svBasic.getE01ACMCBC().equals("N")) out.print("No");
							else out.print("");%>'></td>
		</tr>
		<tr id="trclear"> 
            <td nowrap> 
              <div align="right">Restricción de Entregas :</div>
            </td>
            <td nowrap ><INPUT type="text" readonly <% if (svBasic.getF01ACMCON().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCON" size="3" maxlength="2" value='<% if (svBasic.getE01ACMCON().equals("Y")) out.print("Si");
							else if (svBasic.getE01ACMCON().equals("N")) out.print("No");
							else out.print("");%>'>
            </td>
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap >
            </td>
        </tr>
       </table>
      </td>
    </tr>
  </table>
		 
  
  <H4>Plan de Ahorro/Proposito</H4>
  <%
			if (svBasic.getE01ACATYH().equals("4")) {
		%>
		<p>
			<b>Ver Plan</b><a href="javascript:showSavingsPlan()"><img
				src="<%=request.getContextPath()%>/images/eibs_deducciones.gif"
				title="Plan de Pagos" align="middle" border="0"></a>
		</p>
		<%
			}
		%>
<table id="mainTable" class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

			<tr id="trdark">
				<td nowrap width="24%">
				<div align="right">Tipo del Ahorro :</div>
				</td>
				<td nowrap width="21%">
						<input type="text" size="35" readonly value='<% if (svBasic.getE01ACATYH().equals("")) 
											out.print("Ahorro Tradicional");
										else if (svBasic.getE01ACATYH().equals("1")) 
											out.print("Ahorro Vivienda");
										else if (svBasic.getE01ACATYH().equals("2")) 
											out.print("Ahorro para Menores");
										else if (svBasic.getE01ACATYH().equals("3")) 
											out.print("Cuota de Participación");
										else if (svBasic.getE01ACATYH().equals("4")) 
											out.print("Ahorro Programado/Proposito");	
										else 
											out.print("No Aplica");%>' 
											<% if (svBasic.getF01ACATYH().equals("Y")) out.print("class=\"txtchanged\""); %>>
				</td>
					<td nowrap width="25%">
					<div align="right">Estado :</div>
				</td>
				<td nowrap width="22%">
					<select name="E01ACASTS" disabled="disabled" <% if (svBasic.getF01ACASTS().equals("Y")) out.print("class=\"txtchanged\""); %>>
					<option></option>
					<option value="1" <% if (svBasic.getE01ACASTS().equals("1")) out.print("selected"); %>>Vigente</option>
					<option value="2" <% if (svBasic.getE01ACASTS().equals("2")) out.print("selected"); %>>No Vigente</option>
				</select>
				</td>
				<td nowrap width="25%">
				<div align="right"> </div>
				</td>
				<td nowrap width="25%">
				<div align="right"> </div>
				</td>
				
			</tr>
			<tr id="trclear">
				<td nowrap width="25%">
				<div align="right">Monto Pactado:</div>
				</td>
				<td nowrap width="25%">
				<input type="text" name="E01ACAMMO" value="<%=svBasic.getE01ACAMMO().trim()%>" readonly="readonly"
					<% if (svBasic.getF01ACAMMO().equals("Y")) out.print("class=\"txtchanged\""); %>>
				</td>
				<td nowrap width="25%">
				<div align="right">Plazo en meses :</div>
				</td>
				<td nowrap width="25%">
					<input type="text" name="E01ACAPLO" size="6" maxlength="5" value="<%=svBasic.getE01ACAPLO().trim()%>"   readonly="readonly"
					    <% if (svBasic.getF01ACAPLO().equals("Y")) out.print("class=\"txtchanged\""); %>>
				</td>
			</tr>

			<tr id="trdark">
				<td nowrap width="25%">
				<div align="right">Frecuencia :</div>
				</td>
				<td nowrap width="25%">
				<select name="E01ACAFRE" disabled="disabled" <% if (svBasic.getF01ACAFRE().equals("Y")) out.print("class=\"txtchanged\""); %>>
					<option></option>
					<option value="B" <% if (svBasic.getE01ACAFRE().equals("B")) out.print("selected");%>>Quincenal</option>
					<option value="M" <% if (svBasic.getE01ACAFRE().equals("M")) out.print("selected");%>>Mensual</option>
					<option value="Q" <% if (svBasic.getE01ACAFRE().equals("Q")) out.print("selected");%>>Trimestral</option>
					<option value="S" <% if (svBasic.getE01ACAFRE().equals("S")) out.print("selected");%>>Semestral</option>
					<option value="Y" <% if (svBasic.getE01ACAFRE().equals("Y")) out.print("selected");%>>Anual</option>
				</select>
				</td>
				<td nowrap width="25%">
				<div align="right">Fecha de Inicio :</div>
				</td>
				<td nowrap width="24%">
					<eibsinput:date name="svBasic" fn_year="E01ACASTY" fn_month="E01ACASTM" fn_day="E01ACASTD" required="false" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
			
				<td nowrap width="25%">
				<div align="right">Cuenta  a Debitar:</div>
				</td><td nowrap width="25%">
					<input type="text" name="E01ACAPAC" size="14" maxlength="12" value="<%=svBasic.getE01ACAPAC().trim()%>" 
					<% if (svBasic.getF01ACAPAC().equals("Y")) out.print("class=\"txtchanged\""); %> readonly>
				</td>
				<td nowrap width="25%">
				<div align="right">Día de aplicación :</div>
				</td>
				<td nowrap width="25%">
					<input type="text" size="2" maxlength="3" name="E01ACADMP" value="<%=svBasic.getE01ACADMP().trim()%>" readonly
					  <% if (svBasic.getF01ACADMP().equals("Y")) out.print("class=\"txtchanged\""); %>>
				</td>
				
			</tr>
			<tr id="trclear">
				<td nowrap width="24%">
					<div align="right">Monto del Ahorro :</div>
				</td>
				<td nowrap width="26%">
					<input type="text" name="E01ACAAUG" value="<%=svBasic.getE01ACAAUG().trim()%>" readonly 
						<% if (svBasic.getF01ACAAUG().equals("Y")) out.print("class=\"txtchanged\""); %>>
				</td>
				<td nowrap width="25%">
					<div align="right">Cuotas Pactadas :</div>
				</td>
				<td nowrap width="25%">
					<input type="text" name="E01ACACON" size="6" maxlength="5" value="<%=svBasic.getE01ACACON().trim()%>"  readonly
						<% if (svBasic.getF01ACACON().equals("Y")) out.print("class=\"txtchanged\""); %>>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="24%">
				  <div align="right">Fecha de Vencimiento :</div>
				 </td>					
				<td nowrap width="24%">
					<eibsinput:date name="svBasic" fn_year="E01ACAENY" fn_month="E01ACAENM" fn_day="E01ACAEND"  required="false" readonly="true" />
				</td>
				<td nowrap width="24%">
				</td>
				<td nowrap width="26%" height="19">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<H4>Información  Impuestos</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr id="trdark"> 
          <% if (currUser.getE01INT().equals("05")) {%>      
            <td nowrap width="30%" align="right">Exenta del Gravamen a Movimientos Financieros (GMF): 
            </td>
            <td nowrap width="22%"> 
              <input type="text" disabled="disabled" <% if (svBasic.getF01ACMTX1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMTX1" size="3" maxlength="2" 
			  value="<% if (svBasic.getE01ACMTX1().equals("Y")) out.print("Si");
							else if (svBasic.getE01ACMTX1().equals("N")) out.print("No");
							else out.print("");%>" 
			  >
            </td>
            <td nowrap width="26%"><div align="right">Clase de Cuenta :</div></td>
          	<td nowrap width="22%"><input type="text" readonly <% if (svBasic.getF01ACMTX9().equals("Y")) out.print("id=\"txtchanged\""); %> 
          		name="E01ACMTX9" size="2" maxlength="1" value="<%= svBasic.getE01ACMTX9().trim()%>">
          	</td>
          <% } else {%>
            <td nowrap width="30%"></td>
            <td nowrap width="22%"></td>
            <td nowrap width="26%"></td>
            <td nowrap width="22%"></td>
          <%}%> 
        </tr>
        <tr id="trclear"> 
          
          
        </tr>
      </table>
    </td>
  </tr>
</table>


<% if (svBasic.getH01FLGMAS().equals("N")) {%>  
  <H4>Origen de Fondos</H4>
  <TABLE id="mainTable" class="tableinfo">
  <TR><TD>
  
   <table id="headTable" >
    <tr id="trdark"> 
      <td nowrap align="center" > Concepto</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Sucursal</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Referencia</td>
      <td nowrap align="center" >Monto</td>
    </tr>
    </table> 
      
    <div id="dataDiv" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
            <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="trclear"> 
            <td nowrap > 
              <div align="center"> 
            	<%= i %>
                <input type="hidden" name="E01OFFOP<%= name %>" value="<%= svBasic.getField("E01OFFOP"+name).getString().trim()%>">
                <input type="hidden" name="E01OFFGL<%= name %>" value="<%= svBasic.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= svBasic.getField("E01OFFCO"+name).getString().trim()%>" >
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= svBasic.getField("E01OFFBK"+name).getString().trim()%>"  readonly >
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name %>" size="4" maxlength="4" value="<%= svBasic.getField("E01OFFBR"+name).getString().trim()%>"
                 readonly >
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= svBasic.getField("E01OFFCY"+name).getString().trim()%>"
                 readonly >
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= svBasic.getField("E01OFFAC"+name).getString().trim()%>"
                 readonly >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input class="txtright" type="text" name="E01OFFAM<%= name %>" size="15" maxlength="15"  value="<%= svBasic.getField("E01OFFAM"+name).getString().trim()%>"  readonly >
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
           </table>
        </div>
        
        <TABLE id="footTable" > 
          <tr id="trdark"> 
            <td nowrap align="right"><b>Equivalente Moneda de la Cuenta:</b> 
            </td>
            <td nowrap  align="center"> 
                <input type="text" name="E01OFFEQV" size="15" maxlength="15" readonly value="<%= svBasic.getE01OFFEQV().trim()%>">
            </td>
          </tr>
        </table>
        
   </TD>  
</TR>	
</TABLE>    
 <SCRIPT type="text/javascript">
  
    function tableresize() {
     adjustEquTables( getElement('headTable'), getElement('dataTable'), getElement('dataDiv'),0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
 <%
    		}
    		%>       
  </form>
</body>
</html>
