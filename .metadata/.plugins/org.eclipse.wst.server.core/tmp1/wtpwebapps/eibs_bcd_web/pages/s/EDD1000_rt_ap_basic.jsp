
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Aprobación de Cuentas Corrientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtBasic" class="datapro.eibs.beans.EDD000001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	builtNewMenu(rt_a_opt);

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  

   out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 
<H3 align="center">Aprobaci&oacute;n de Cuentas Corrientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_ap_basic.jsp, EDD1000"> 
  </H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="29">
  <INPUT TYPE=HIDDEN NAME="E01ACMBNK" VALUE="<%= rtBasic.getE01ACMBNK().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%= rtBasic.getE01ACMATY().trim()%>">
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
                <input type="text" readonly <% if (rtBasic.getF01ACMCUN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCUN" size="10" maxlength="9" value="<%= rtBasic.getE01ACMCUN().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01ACMACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01ACMPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>

  <%int row = 0; %>
  <H4>Datos B&aacute;sicos de la Operaci&oacute;n</H4>
<table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="29%"> 
              <div align="right">Nombre de la Cuenta :</div>
            </td>
            <td nowrap width="19%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMNME().equals("Y")) out.print("class=\"txtchanged\""); %>  name="E01ACMNME" size="60" maxlength="80" value="<%= rtBasic.getE01ACMNME().trim()%>">
            </td>
            <td nowrap width="26%"> 
            </td>
            <td nowrap width="26%"> 
            </td>
          </tr>        
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="19%"> 
		   		<eibsinput:date name="rtBasic" fn_year="E01ACMOPY" fn_month="E01ACMOPM" fn_day="E01ACMOPD" modified="F01ACMOPM;F01ACMOPD;F01ACMOPY" readonly="true"/>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Fecha de Ingreso :</div>
            </td>
            <td nowrap width="26%"> 
		   		<eibsinput:date name="rtBasic" fn_year="E01ACMSUY" fn_month="E01ACMSUM" fn_day="E01ACMSUD" modified="F01ACMSUM;F01ACMSUD;F01ACMSUY" readonly="true"/>
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%" height="19">
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="19%">            
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="<%= rtBasic.getE01ACMBNK().trim()%>" readonly>
              <input type="text" name="E01ACMBRN" size="5" maxlength="4" value="<%= rtBasic.getE01ACMBRN().trim()%>" readonly>
            </td>
            <td nowrap width="26%"> 
              <div align="right">Centro de Costo:</div>
            </td>
            <td nowrap width="26%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMCCN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCCN" size="9" maxlength="8" value="<%= rtBasic.getE01ACMCCN().trim()%>">
            </td>
          </tr>
          <tr class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Uso de Domicilio:</div>
            </td>
            <td nowrap width="22%" height="23"> 
               <input type="text" readonly name="E01ACMWHF" size="18" maxlength="18" <% if (rtBasic.getF01ACMWHF().equals("Y")) out.print("class=\"txtchanged\""); %>
                                  value="<% if (rtBasic.getE01ACMWHF().equals("C")) out.print("Correo Electrónico");
								       else if (rtBasic.getE01ACMWHF().equals("R")) out.print("Dirección Fisica");
								       else if (rtBasic.getE01ACMWHF().equals("O")) out.print("Oficina del Banco");
							           else out.print("");%>">
              <input type="text" name="E01ACMMLA" size="2" maxlength="1" value="<%= rtBasic.getE01ACMMLA().trim()%>" readonly <% if (rtBasic.getF01ACMMLA().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="right">Sobregiros Permitidos :</div>
            </td>
            <td nowrap width="26%" height="23"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMF03().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMF03" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMF03().equals("1")) out.print("Si");
							else if (rtBasic.getE01ACMF03().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Tabla de Documentos :</div>
            </td>
            <td nowrap width="19%" height="19">
             <input type="text" name="E01APCTNU" size="3" readonly maxlength="2" value="<%= rtBasic.getE01APCTNU().trim()%>">
            </td>
            <td nowrap width="23%"> 
              <div align="right">Tipo de Cuenta :</div>
            </td>
			<td nowrap width="24%">
				<input type="hidden" name="E01ACMPEC" value="<%= rtBasic.getE01ACMPEC()%>">
				<input type="text" readonly size="15" <% if (rtBasic.getF01ACMPEC().equals("Y")) out.print("class=\"txtchanged\""); %> 
					value='<% if (rtBasic.getE01ACMPEC().equals("1")) out.print("Individual");
							else if (rtBasic.getE01ACMPEC().equals("2")) out.print("Mancomunada");
							else if (rtBasic.getE01ACMPEC().equals("3")) out.print("Solidaria");
							else if (rtBasic.getE01ACMPEC().equals("4")) out.print("Menor");
							else if (rtBasic.getE01ACMPEC().equals("5")) out.print("juridica");
							else out.print("");%>'>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Diferidos Locales :</div>
            </td>
            <td nowrap width="19%" height="19">
              <input type="text" readonly <% if (rtBasic.getF01ACMWLF().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= rtBasic.getE01ACMWLF().trim()%>" name="E01ACMWLF">
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="right">Diferidos No Locales :</div>
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" size="2" readonly <% if (rtBasic.getF01ACMWNF().equals("Y")) out.print("class=\"txtchanged\""); %> maxlength="1" value="<%= rtBasic.getE01ACMWNF().trim()%>" name="E01ACMWNF">
            </td>
          </tr>
          <tr id="trdark"> 
          	<td nowrap width="20%" > 
              <div align="right">Numero de Pagare :</div>
            </td>
            <td nowrap width="30%" >
            	<input type="text" name="E01ACMOFN" readonly <% if (rtBasic.getF01ACMOFN().equals("Y")) out.print("class=\"txtchanged\""); %> value="<%= rtBasic.getE01ACMOFN().trim()%>" >  
            </td>
            <td nowrap width="20%" > 
            </td>
            <td nowrap width="30%" >
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
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Cargos por Servicios :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMSCF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSCF" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMSCF().equals("Y")) out.print("Si");
							else if (rtBasic.getE01ACMSCF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Frecuencia Cobro de Cargos :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMSHF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSHF" size="25" maxlength="30" 
				  value="<% if (rtBasic.getE01ACMSHF().equals("D")) out.print("Diario");
							else if (rtBasic.getE01ACMSHF().equals("W")) out.print("Semanal");
							else if (rtBasic.getE01ACMSHF().equals("B")) out.print("Quincenal");
							else if (rtBasic.getE01ACMSHF().equals("M")) out.print("Mensual");
							else if (rtBasic.getE01ACMSHF().equals("Q")) out.print("Trimestral");
						    else out.print("");%>" 
				>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digos Tabla de Cargos :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMACL().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMACL" size="2" maxlength="2" value="<%= rtBasic.getE01ACMACL().trim()%>">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Ciclo/D&iacute;a Cobro de Cargos :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMSHY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSHY" size="3" maxlength="2" value="<%= rtBasic.getE01ACMSHY().trim()%>">
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
              <input type="text" readonly <% if (rtBasic.getF01ACMSTF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSTF" size="25" maxlength="30" 
				  value="<% if (rtBasic.getE01ACMSTF().equals("D")) out.print("Diario");
							else if (rtBasic.getE01ACMSTF().equals("W")) out.print("Semanal");
							else if (rtBasic.getE01ACMSTF().equals("B")) out.print("Quincenal");
							else if (rtBasic.getE01ACMSTF().equals("M")) out.print("Mensual");
							else if (rtBasic.getE01ACMSTF().equals("Q")) out.print("Trimestral");
						    else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%"> 
              <div align="right">Retenci&oacute;n de Correos :</div>
            </td>
            <td nowrap width="24%"><font face="Arial" size="2"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMHSF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMHSF" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMHSF().equals("H")) out.print("Si");
							else if (rtBasic.getE01ACMHSF().equals("")) out.print("No");
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
              <input type="text" readonly <% if (rtBasic.getF01ACMSDY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSDY" size="3" maxlength="2" value="<%= rtBasic.getE01ACMSDY().trim()%>">
            </td>
            <td nowrap width="28%"> 
              <div align="right">Estado de Cuentas Consolidado :</div>
            </td>
            <td nowrap width="24%"><font face="Arial" size="2"> </font><font face="Arial" size="2">
<input type="text" readonly <% if (rtBasic.getF01ACMCSF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCSF" size="3" maxlength="2" 
				  value="<% if (rtBasic.getE01ACMCSF().equals("Y")) out.print("Si");
							else if (rtBasic.getE01ACMCSF().equals("N")) out.print("No");
							else out.print("");%>" 
				>
              </font></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Tipo de Estado de 
                Cuenta :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMSTY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSTY" size="25" maxlength="25" 
				  value="<% if (rtBasic.getE01ACMSTY().equals("P")) out.print("Personal");
							else if (rtBasic.getE01ACMSTY().equals("C")) out.print("Corporativa");
							else if (rtBasic.getE01ACMSTY().equals("N")) out.print("Ninguna");
						    else out.print("");%>" 
				>
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right">Forma de Env&iacute;o de Estado de Cuenta :</div>
            </td>
            <td nowrap width="24%" height="23"> 
              <input type="text" readonly <% if (rtBasic.getF01ACMSTE().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMSTE" size="25" maxlength="25" 
				  value="<% if (rtBasic.getE01ACMSTE().equals("T")) out.print("Telex");
							else if (rtBasic.getE01ACMSTE().equals("P")) out.print("Impresora");
							else if (rtBasic.getE01ACMSTE().equals("F")) out.print("Facsimil");
							else if (rtBasic.getE01ACMSTE().equals("E")) out.print("Correo Electronico");
							else if (rtBasic.getE01ACMSTE().equals("N")) out.print("Ninguno");
						    else out.print("");%>" 
				>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Asignaci&oacute;n de Chequeras</H4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td><div align="right">Nombre Personalizado :</div></td>
            <td nowrap><INPUT type="text" readonly <% if (rtBasic.getF01ACMCK1().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCK1" size="35" maxlength="35" value="<%= rtBasic.getE01ACMCK1().trim()%>"></td>
            <td nowrap>
              <div align="right"></div>
            </td>
            <td nowrap></td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">
              <INPUT type="text" readonly <% if (rtBasic.getF01ACMRE1().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMRE1" size="4" maxlength="3" value='<%=rtBasic.getE01ACMRE1()%>'></div>
            </td>
            <td nowrap <% if (!rtBasic.getH01FLGMAS().equals("N")) out.print("colspan=3");%>>
              <INPUT type="text" readonly <% if (rtBasic.getF01ACMCK2().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCK2" size="35" maxlength="35" value="<%= rtBasic.getE01ACMCK2().trim()%>">
            </td>
            <% if (rtBasic.getH01FLGMAS().equals("N")) {%>
            <td nowrap>
              <div align="right">N&uacute;mero de Chequeras :</div>
            </td>
            <td nowrap><INPUT type="text" readonly <% if (rtBasic.getF01ACMNCB().equals("Y")) out.print("class=\"txtchanged\""); %>="" name="E01ACMNCB" size="3" maxlength="2" value="<%= rtBasic.getE01ACMNCB().trim()%>"> </td>
            <% } %>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Tipo de Chequera :</div>
            </td>
            <td nowrap >
            <INPUT type="text" readonly <% if (rtBasic.getF01ACMTBK().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMTBK" size="2" maxlength="1" value="<%= rtBasic.getE01ACMTBK().trim()%>">
            </td>
            
            <td nowrap> 
              <div align="right">Stock Mínimo de Chequeras :</div>
            </td>
            <td nowrap><INPUT type="text" readonly <% if (rtBasic.getF01ACMMSK().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMMSK" size="3" maxlength="2" value="<%= rtBasic.getE01ACMMSK().trim()%>"> </td>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Cobro de Cargos por Chequeras :</div>
            </td>
            <td nowrap ><INPUT type="text" readonly <% if (rtBasic.getF01ACMCBC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCBC" size="3" maxlength="2" value='<% if (rtBasic.getE01ACMCBC().equals("Y")) out.print("Si");
							else if (rtBasic.getE01ACMCBC().equals("N")) out.print("No");
							else out.print("");%>'></td>
            <td nowrap> 
              <div align="right">Restricción de Entregas de Chequeras :</div>
            </td>
            <td nowrap >
            <INPUT type="text" readonly <% if (rtBasic.getF01ACMCON().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMCON" size="3" maxlength="2" value='<% if (rtBasic.getE01ACMCON().equals("Y")) out.print("Si");
							else if (rtBasic.getE01ACMCON().equals("N")) out.print("No");
							else out.print("");%>'>
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Chequeras Multimoneda:</div>
            </td>
            <td nowrap >
            <INPUT type="text" readonly <% if (rtBasic.getF01ACMF04().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01ACMF04" size="3" maxlength="2" value='<% if (rtBasic.getE01ACMF04().equals("Y")) out.print("Si");
							else out.print("No");%>'>
            </td>
            
            <td nowrap> 
              
            </td>
            <td nowrap> </td>
            
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
			    <input type="text" disabled="disabled" <% if (rtBasic.getF01ACMTX1().equals("Y")) out.print("id=\"txtchanged\""); %> name="E01ACMTX1" size="3" maxlength="2" 
				       value="<% if (rtBasic.getE01ACMTX1().equals("Y")) out.print("Si");
					   else if (rtBasic.getE01ACMTX1().equals("N")) out.print("No");
					   else out.print("");%>" 
			    ></td>
            	<td nowrap width="26%"><div align="right">Clase de Cuenta :</div></td>
            	<td nowrap width="22%"><input type="text" readonly <% if (rtBasic.getF01ACMTX9().equals("Y")) out.print("id=\"txtchanged\""); %> 
            		name="E01ACMTX9" size="2" maxlength="1" value="<%= rtBasic.getE01ACMTX9().trim()%>">
            	</td>
            <% } else {%>
              <td nowrap width="30%"></td>
              <td nowrap width="22%"></td>
              <td nowrap width="26%"></td>
              <td nowrap width="22%"></td>
            <% } %> 
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
 <% if (rtBasic.getH01FLGMAS().equals("N")) { %>
  <H4>Origen de Fondos</H4>
 <TABLE id="mainTable" class="tableinfo">
  <TR><TD>
   <table id="headTable" width="100%">
    <tr id="trdark" > 
      <td nowrap align="center" width ="25%">Concepto </td>
      <td nowrap align="center" width ="10%">Banco </td>
      <td nowrap align="center" width ="10%">Sucursal</td>
      <td nowrap align="center" width ="10%">Moneda</td>
      <td nowrap align="center" width ="20%">Referencia</td>
      <td nowrap align="center" width ="25%">Monto</td>
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
            <td nowrap width ="25%"> 
              <div align="center"> 
            	<%= i %>
                <input type="hidden" name="E01OFFOP<%= name %>" value="<%= rtBasic.getField("E01OFFOP"+name).getString().trim()%>">
                <input type="hidden" name="E01OFFGL<%= name %>" value="<%= rtBasic.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= rtBasic.getField("E01OFFCO"+name).getString().trim()%>" >
              </div>
            </td>
            <td nowrap width ="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= rtBasic.getField("E01OFFBK"+name).getString().trim()%>"  readonly >
              </div>
            </td>
            <td nowrap width ="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name %>" size="4" maxlength="4" value="<%= rtBasic.getField("E01OFFBR"+name).getString().trim()%>"
                 readonly >
              </div>
            </td>
            <td nowrap width ="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= rtBasic.getField("E01OFFCY"+name).getString().trim()%>"
                 readonly >
              </div>
            </td>
            <td nowrap width ="20%"> 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= rtBasic.getField("E01OFFAC"+name).getString().trim()%>"
                 readonly >
              </div>
            </td>
            <td nowrap width ="25%"> 
              <div align="center"> 
                <input class="txtright" type="text" name="E01OFFAM<%= name %>" size="15" maxlength="15"  value="<%= rtBasic.getField("E01OFFAM"+name).getString().trim()%>"  readonly >
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
            <td nowrap align="right"><b>Equivalente Moneda de la Cuenta:</b> 
            </td>
            <td nowrap  align="center"> 
                <input class="txtright" type="text" name="E01OFFEQV" size="15" maxlength="15" readonly value="<%= rtBasic.getE01OFFEQV().trim()%>">
            </td>
          </tr>
        </table>
   </TD>  
</TR>	
</TABLE> 

 <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables(getElement('headTable'),getElement('dataTable'),getElement('dataDiv'),0,true);
   }
  tableresize();
  window.onresize = function(){
	  tableresize();
  }
  </SCRIPT>
  <% } %>     
  </form>
</body>
</html>
