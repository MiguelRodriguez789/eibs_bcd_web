<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "java.math.BigDecimal" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Certificados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cdMant" class="datapro.eibs.beans.EDL016002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(cd_i_opt);;
 
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

<h3 align="center">Informaci&oacute;n B&aacute;sica<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_inq_basic, EDL0130"></h3>
<hr size="4">
<form method="post" action="eIBS_R04M07.pages.s.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s._R04M07_WebApp.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s._R04M07_WebApp.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s._R04M07_WebApp.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s._R04M07_WebApp.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s.eIBS_R04M07.pages.s.javascripts.nav_aid.js" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="41">
 
  <table border="0" cellspacing="0" cellpadding="0" width="100%">
  	<tr>
  		<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=cdMant.getE02PENDAP()%></b></td>
  		<td width="5%"><h4>&nbsp;</h4></td>
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
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PTYP" size="5" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
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
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
        </td>
	</tr>
</table>
  
  <table class=tbenter>
   <tr > 
      <td nowrap> 
   		<h4>Informaci&oacute;n B&aacute;sica</h4>
      </td>
      <td nowrap align="left"><b>DOCUMENTO :<font color="#ff6600">
		<%
			 if (cdMant.getE02DEAECU().trim().equals("1")) {
				out.print("EN CUSTODIA ELECTRONICA");
			} else if (cdMant.getE02DEAECU().trim().equals("2")) {
				out.print("FISICO");
			}
		%>
		</font></b></td>
      <td nowrap align=left> 
   		<b>CONTRATO :<font color="#ff6600"> 
   		<% 	if (cdMant.getE02COLATR().trim().equals("") ){
   				out.print("NO GARANTIZADO");
   			} else {
   				out.print(cdMant.getE02COLATR());
   			}
   		%>
   		</font></b>
      </td>
      <td nowrap align=right> 
   		<b>ESTADO :</b>
      </td>
      <td nowrap> 
   		<b><font color="#ff6600"><%= cdMant.getE02STATUS().trim()%></font></b>
      </td>
    </tr>
  </table>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="35"> 
              <div align="right">Nombre del Certificado :</div>
            </td>
            <td nowrap width="25%" height="35"> 
              <input type="text" name="E02DEANME" size="60" maxlength="80" value="<%= cdMant.getE02DEANME().trim()%>" readonly>
            </td>
            <td nowrap width="25%" height="23"> 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="25%" height="23"> 
              <input type="text" name="E02DEATRM" size="5" maxlength="5" value="<%= cdMant.getE02DEATRM().trim()%>" readonly>
              <input type="text" name="E02DEATRC" size="10" 
				  value="<% if (cdMant.getE02DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (cdMant.getE02DEATRC().equals("M")) out.print("Mes(es)");
							else if (cdMant.getE02DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>" 
				readonly>
            </td>
          </tr>        
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="35"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="25%" height="35"> 
              <input type="text" name="E02DEAOAM" size="23" maxlength="17" value="<%= cdMant.getE02DEAOAM().trim()%>" readonly>
            </td>
            <td nowrap width="25%" height="35"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%" height="35"> 
              <eibsinput:date name="cdMant" fn_month="E02DEAODM" fn_day="E02DEAODD" fn_year="E02DEAODY" readonly="true" />
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
 			<td nowrap width="25%" height="23">
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="25%" height="23"> 
              <input type="text" name="E02DEABAS" size="3" maxlength="3" value="<%= cdMant.getE02DEABAS().trim()%>" readonly>
            </td>

            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:date name="cdMant" fn_month="E02DEAMDM" fn_day="E02DEAMDD" fn_year="E02DEAMDY" readonly="true" />
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="23"> 
              <div align="right">Tabla de Tasa Flotante :</div>
            </td>
            <td nowrap width="25%" height="23"> 
              <input type="text" name="E02DEAFTB" size="3" maxlength="2" value="<%= cdMant.getE02DEAFTB().trim()%>" readonly>
              <input type="text" name="E02DEAFTY" size="10" 
				  value="<% if (cdMant.getE02DEAFTY().equals("FP")) out.print("Primaria");
							else if (cdMant.getE02DEAFTY().equals("FS")) out.print("Secundaria");
							else out.print("");%>"  readonly>
              <input type="text" readonly name="E02FLTDSC" size="40" maxlength="40" value="<%= cdMant.getE02FLTDSC().trim()%>">
            </td>
            <td width="25%" > 
              <div align="right">Tasa Flotante Base :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E02FLTORG" id="E02FLTORG" size="10" maxlength="9" value="<%= cdMant.getE02FLTORG().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width="25%">
              <div align="right"> Manejo Puntos Adicional :</div> 
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" readonly name="E02DEAFLX" size="1" maxlength="1" value="<%= cdMant.getE02DEAFLX().trim()%>">
              <input type="text" readonly name="D02DEAFLX" size="25" maxlength="25" 
				  value="<% if (cdMant.getE02DEAFLX().equals("B")) out.print("+/- Tasa Base");
							else if (cdMant.getE02DEAFLX().equals("E")) out.print("+/- Tasa Efectiva");
							else if (cdMant.getE02DEAFLX().equals("N")) out.print("+/- Tasa Nominal");
							else out.print("");%>" >
             </td>
             <td nowrap width="25%">
              <div align="right"> Valor Tasa Adicional :</div> 
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E02DEARTX" class="txtright" size="9" maxlength="9" value="<%= cdMant.getE02DEARTX().trim()%>" readonly>
            </td>
          </tr>   
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="19"> 
              <div align="right">Ciclo/Fecha Revis. Tasa :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E02DEARRP" size="3" maxlength="3" value="<%= cdMant.getE02DEARRP().trim()%>" readonly>
              / 
              <eibsinput:date name="cdMant" fn_month="E02DEARRM" fn_day="E02DEARRD" fn_year="E02DEARRY" readonly="true" />
            </td>
            <td width="25%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td width="25%" > 
                 <input type="text" readonly name="E02DEAFRT" size="10" maxlength="9" value="<%= cdMant.getE02DEAFRT().trim()%>">
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width="25%" height="19"> 
              <div align="right">Tabla de Tasa :</div>
            </td>
            <td nowrap width="25%" height="19">
              <input type="text" name="E02DEARTB" size="2" maxlength="2" value="<%= cdMant.getE02DEARTB().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Inter&eacute;s/Spread :</div>
            </td>
            <td nowrap width="25%"> 
				<eibsinput:text property="E02DEARTE" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
           </td>  
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
           <td nowrap width="25%"> 
              <div align="right">Tasa Nominal del Certificado:</div>
            </td>
            <td nowrap width="25%"> 
				<eibsinput:text property="E02LNSRTE" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
           </td>  
          	<td nowrap width="25%"> 
             <div align="right">Tasa Efectiva Anual :</div>
            </td>
            <td nowrap width="25%"> 
        	  <eibsinput:text name="cdMant" property="E02DEASPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="19"> 
              <div align="right">Tipo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" readonly name="E02DEAICT" size="40" maxlength="35" 
				value="<% if (cdMant.getE02DEAICT().equals("S")) out.print("Al Vencimiento Calendario");
							else if (cdMant.getE02DEAICT().equals("M")) out.print("Al Vencimiento Comercial");
							else if (cdMant.getE02DEAICT().equals("P")) out.print("Prepagados Calendario");
							else if (cdMant.getE02DEAICT().equals("A")) out.print("Prepagados Comerciales");
							else if (cdMant.getE02DEAICT().equals("D")) out.print("Descontados Calendario");
							else if (cdMant.getE02DEAICT().equals("T")) out.print("Descontados Comerciales");
							else if (cdMant.getE02DEAICT().equals("R")) out.print("Capitalizados(CD's)");
							else if (cdMant.getE02DEAICT().equals("1")) out.print("Al Vencimiento Calendario");
							else if (cdMant.getE02DEAICT().equals("2")) out.print("Al Vencimiento Comercial");
							else if (cdMant.getE02DEAICT().equals("3")) out.print("Prepagados Calendario");
							else if (cdMant.getE02DEAICT().equals("4")) out.print("Prepagados Comerciales");
							else if (cdMant.getE02DEAICT().equals("5")) out.print("Descontados Calendario");
							else if (cdMant.getE02DEAICT().equals("6")) out.print("Descontados Comerciales");
							else if (cdMant.getE02DEAICT().equals("7")) out.print("Capitalizados (CD's)");
							else if (cdMant.getE02DEAICT().equals("8")) out.print("Regla 78");
							else out.print("");%>" >
            </td>
            <td nowrap width="25%" height="19"> 
              <div align="right">Condici&oacute;n de Contrato :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E02DEADLC" size="2" value="<%= cdMant.getE02DEADLC()%>" 
				readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="19"> 
              <div align="right">Banco / Sucursal :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E02DEABNK" size="2" maxlength="2" value="<%= cdMant.getE02DEABNK().trim()%>" readonly>
              / 
              <input type="text" name="E02DEABRN" size="5" maxlength="4" value="<%= cdMant.getE02DEABRN().trim()%>" readonly>
            </td>
            <td nowrap width="25%" height="19"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="25%" height="19">
              <input type="text" name="E02DEAGLN" size="18" maxlength="16" value="<%= cdMant.getE02DEAGLN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="19"> 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E02DEAEXR" size="11" maxlength="11" value="<%= cdMant.getE02DEAEXR().trim()%>" readonly>
            </td>
            <td nowrap width="25%" height="19"> 
              <div align="right">Centro de Costos :</div>
            </td>
            <td nowrap width="25%" height="19">
              <input type="text" name="E02DEACCN" size="8" maxlength="8" value="<%= cdMant.getE02DEACCN().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="19"> 
              <div align="right">Contrapartida :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E02DEAOFB" size="2" maxlength="2" value="<%= cdMant.getE02DEAOFB().trim()%>" readonly>
              <input type="text" name="E02DEAOCR" size="4" maxlength="4" value="<%= cdMant.getE02DEAOCR().trim()%>" readonly>
              <input type="text" name="E02DEAOCY" size="3" maxlength="3" value="<%= cdMant.getE02DEAOCY().trim()%>" readonly>
              <input type="text" name="E02DEAOGL" size="17" maxlength="16" value="<%= cdMant.getE02DEAOGL().trim()%>" readonly>
              <input type="text" name="E02DEAOAC" size="13" maxlength="12" value="<%= cdMant.getE02DEAOAC().trim()%>" readonly>
            </td>
            <td nowrap width="29%" height="23"> 
              <div align="right">Uso de domicilio :</div>
            </td>
            <td nowrap width="22%" height="23"> 
               <input type="text" readonly name="E02DEAWHF" size="18" maxlength="18" 
                                  value="<% if (cdMant.getE02DEAWHF().equals("C")) out.print("Correo Electrónico");
								       else if (cdMant.getE02DEAWHF().equals("R")) out.print("Dirección Fisica");
								       else if (cdMant.getE02DEAWHF().equals("O")) out.print("Oficina del Banco");
							           else out.print("");%>">
              <input type="text" name="E02DEAMLA" size="2" maxlength="1" value="<%= cdMant.getE02DEAMLA().trim()%>" readonly >
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="19"> 
              <div align="right">Retenci&oacute;n / Impuesto :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" readonly name="E02DEAWHF" size="35" maxlength="35" 
				value="<% if (cdMant.getE02DEAWHF().equals("1")) out.print("Retención sobre Intereses ISR");
							else if (cdMant.getE02DEAWHF().equals("2")) out.print("Cobre del IVA");
							else if (cdMant.getE02DEAWHF().equals("3")) out.print("IVA mas ISR");
							else if (cdMant.getE02DEAWHF().equals("4")) out.print("IVA solo en Comisiones");
							else if (cdMant.getE02DEAWHF().equals("5")) out.print("IVA solo en Intereses");
							else if (cdMant.getE02DEAWHF().equals("6")) out.print("Debito Bancario IDB");
							else if (cdMant.getE02DEAWHF().equals("7")) out.print("IDB mas ISR");
							else if (cdMant.getE02DEAWHF().equals("8")) out.print("IDB mas IVA");
							else if (cdMant.getE02DEAWHF().equals("9")) out.print("Todo Tipo de Impuesto");
							else if (cdMant.getE02DEAWHF().equals("N")) out.print("No Calcula Impuestos");
							else if (cdMant.getE02DEAWHF().equals("F")) out.print("Cobro del FECI");
							else if (cdMant.getE02DEAWHF().equals("G")) out.print("FECI e ITBMS(Panamá)");
							else out.print("");%>" >
            </td>
            <td nowrap width="25%" height="19"> 
              <div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E02DEAREF" size="12" maxlength="12" value="<%= cdMant.getE02DEAREF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="19"> 
              <div align="right">Porcentaje Garant&iacute;a :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E02DEACPE2" size="7" maxlength="7" value="<%= cdMant.getE02DEACPE().trim()%>" readonly>
            </td>
            <td nowrap width="25%" height="19"> 
              <div align="right">Clase de Certificado :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E02DEACLF" size="2" maxlength="1" value="<%= cdMant.getE02DEACLF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%" >
       			<div align="right">Fecha Cambio de Tasa :</div>
       		</td> 	
    		<td nowrap width="25%" > 
              <eibsinput:date name="cdMant"  fn_month="E02DLVSDM" fn_day="E02DLVSDD" fn_year="E02DLVSDY" readonly="true"/>  
            </td>
            <td nowrap width="25%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="25%">           
              <input type="text" name="E02DEABNK" size="2" maxlength="2" value="<%= cdMant.getE02DEABNK().trim()%>" readonly>
              <input type="text" name="E02DEABRN" size="4" maxlength="4" value="<%= cdMant.getE02DEABRN().trim()%>" readonly>
            </td>      
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="25%" > 
              <div align="right">Amort. Nic 39 :</div>
            </td>
            <td nowrap width="25%" >
            	<eibsinput:help fn_param_one="E02DEABRK" fn_param_three="S" property="E02DEABRK" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER %>" readonly="true"/>
            </td>   
            <td nowrap width="25%" > 
            	<div align="right">Tasa TIR %:</div>
            </td>
            <td nowrap width="25%" >
            	<input type="text" name="E02TIR" size="6" maxlength="5" value="<%= cdMant.getE02TIR().trim()%>" readonly>
			</td>   
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="25%" > 
            	<div align="right">Condición de Manejo :</div>
            </td>
            <td nowrap width="25%" >
              <eibsinput:text  name="cdMant"  property="E02DEAPAF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_FLAG %>" readonly="true"/>
			</td> 
			<td nowrap width="25%" > 
            	<div align="right"></div>
            </td>
            <td nowrap width="25%" >
           </td> 
		 </tr>
		</table>
      </td>
    </tr>
  </table>
  
  <% if (cdMant.getE02DEAECU().equals("1")){%> 
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
	             <input type="text" readonly name="E02DEACUI" size="14" maxlength="12" value="<%= cdMant.getE02DEACUI().trim()%>">
				</td>
	            <td nowrap width="25%" > 
    	          <div align="right">Forma de Compensacion :</div>
     	       </td>      
	            <td nowrap width="25%">
	       			<%if(cdMant.getE02DEAF02().equals("Y")) out.print("DVP"); 
	       			else if(cdMant.getE02DEAF02().equals("N")) out.print("LP");%>
	            </td>
	   		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
	        	<td nowrap width="25%" >
    	          <div align="right">Agente Comprador :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E02DEADIB" size="5" maxlength="4" value="<%= cdMant.getE02DEADIB().trim()%>"
	                readonly 	              
	              >
	              <input type="text" name="D02DEADIB" size="40" maxlength="35" value="<%= cdMant.getD02DEADIB().trim()%>"
	              readonly>
	           </td>
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta Inversionista :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E02DEAIVC" size="22" maxlength="20" value="<%= cdMant.getE02DEAIVC().trim()%>"
	              readonly 	              
	              >
	 			</td>
	   		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta SEBRA Vendedor :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E02DEACRC" size="22" maxlength="20" value="<%= cdMant.getE02DEACRC().trim()%>"
	               readonly 	              
	              >
	 			</td>
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta SEBRA Comprador :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E02DEAUNR" size="22" maxlength="20" value="<%= cdMant.getE02DEAUNR().trim()%>"
	              readonly 	              
	              >
	 			</td>
	   		</tr>
       </table>
      </td>
    </tr>
  </table>
<%} %>
  
  <h4>Instrucciones al Vencimiento</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tipo de Prorroga :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E02DEAROC" size="2" maxlength="1" value="<%= cdMant.getE02DEAROC().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa / Tipo de prorroga :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E02DEAROR" size="9" maxlength="9" value="<%= cdMant.getE02DEAROR().trim()%>" readonly>
              <input type="text" name="E02DEAHTM" size="2" maxlength="1" value="<%= cdMant.getE02DEAHTM().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Cuenta Contable de Repago :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E02DEAREB" size="2" maxlength="2" value="<%= cdMant.getE02DEAREB().trim()%>" readonly>
              <input type="text" name="E02DEARPR" size="4" maxlength="4" value="<%= cdMant.getE02DEARPR().trim()%>" readonly>
              <input type="text" name="E02DEARPC" size="3" maxlength="3" value="<%= cdMant.getE02DEARPC().trim()%>" readonly>
              <input type="text" name="E02DEARGL" size="17" maxlength="16" value="<%= cdMant.getE02DEARGL().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cuenta detalle de Repago :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" name="E02DEARAC" size="13" maxlength="12" value="<%= cdMant.getE02DEARAC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%" height="23"> 
              <div align="right">Monto de Renovaci&oacute;n :</div>
            </td>
            <td nowrap width="25%" height="23">
              <input type="text" name="E02DEAROA" size="15" maxlength="15" value="<%= cdMant.getE02DEAROA().trim()%>" readonly>
            </td>
            <td nowrap width="25%" height="23"> 
              <div align="right">Per&iacute;odo :</div>
            </td>
            <td nowrap width="25%" height="23">
              <input type="text" name="E02DEAROY" size="4" maxlength="3" value="<%= cdMant.getE02DEAROY().trim()%>" readonly>
              <input type="text" name="E02DEAODA" size="2" maxlength="1" value="<%= cdMant.getE02DEAODA().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
             <td nowrap width="25%" height="19"> 
              <div align="right">Forma de Pago :</div>
            </td>
            <td nowrap width="25%" height="19">
              <input type="text" name="E02DEAPVI" size="2" maxlength="1" value="<%= cdMant.getE02DEAPVI().trim()%>" readonly>
            </td>
            <td nowrap width="25%" height="19"> 
            </td>
            <td nowrap width="25%" height="19">
            </td>
          </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
				 <td nowrap width="25%" > 
       				<div align="right"> Al Banco(Ruta) :</div>
	            </td>  
	            <td nowrap width="25%" >   
	              <input type="text" readonly name="E02DLDABA" size="10" maxlength="11" value="<%= cdMant.getE02DLDABA().trim()%>">            	
	            </td>    
	      	    <td nowrap width="25%" >
       			</td> 
    			<td nowrap width="25%" >
                
				</td>     
	   		 </tr>
	   		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
   		     	<td nowrap width="25%" >
       			  <div align="right">Al tipo de cuenta ACH :</div>
       			</td> 
    			<td nowrap width="25%" >
    			 <select name="E01DEAACT" disabled>
                  <option value=" " <% if (cdMant.getE02DLDACT().equals(" ")){out.print("selected");} %>>        </option> 
                  <option value="C" <% if (cdMant.getE02DLDACT().equals("C")){out.print("selected");} %>>Corriente</option>
                  <option value="S" <% if (cdMant.getE02DLDACT().equals("S")){out.print("selected");} %>>Ahorros</option>
                 </select>
				</td>	
	      	    <td nowrap width="25%" > 
       			  <div align="right">Numero de Cuenta ACH :</div>
	            </td>  
	            <td nowrap width="25%" >   
	             <input type="text" readonly name="E02DLDBFAC" size="22" maxlength="23" value="<%= cdMant.getE02DLDBFAC().trim()%>">
	            </td> 
	   		 </tr>	
	   		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
   		     	<td nowrap width="25%" >
       			  <div align="right">Nombre del Beneficiario :</div>
       			</td> 
    			<td nowrap width="25%" >
    			  <input type="text" readonly name="E02DLDBFNM" size="22" maxlength="23" value="<%= cdMant.getE02DLDBFNM().trim()%>">
				</td>	
	      	    <td nowrap width="25%" > 
       			  <div align="right">Descripcion ACH :</div>
	            </td>  
	            <td nowrap width="25%" >   
	              <input type="text" readonly name="E02DLDBTDS" size="45" maxlength="46" value="<%= cdMant.getE02DLDBTDS().trim()%>">    	
	            </td>
	           </tr>   
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
	           	 <td nowrap width="25%"> 
             		 <div align="right">ID Beneficiario : </div>
            	</td>
           		 <td nowrap width="25%"> 
           		   <input type="text" readonly name="E02DSCFCU" size="15" maxlength="15" value="<%= cdMant.getE02DSCFCU().trim()%>"></div>
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
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: <%= (cdMant.getE02DEAACD().equals("11") ||  cdMant.getE02DEAACD().equals("12") || cdMant.getE02DEAACD().equals("CD")) ? "table-row" : "none" %>"> 
            <td nowrap width="25%"> 
              <div align="right">Ganancia Anual Total (G.A.T) Nominal :</div>
            </td>
            <td nowrap width="25%">
              <eibsinput:text name="cdMant" property="E02DEACRP" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Ganancia Anual Total (G.A.T) Real :</div>
            </td>
            <td nowrap width="25%">
              <eibsinput:text name="cdMant" property="E02DEARTX" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" > 
            <td nowrap width="25%"> 
              <div align="right" style="visibility: <%= (cdMant.getE02DEAACD().equals("11") ||  cdMant.getE02DEAACD().equals("12") || cdMant.getE02DEAACD().equals("CD")) ? "" : "hidden" %>">
              	Tasa Neta :
              </div>
            </td>
            <td nowrap width="32%" > 
              <div align="left" style="visibility: <%= (cdMant.getE02DEAACD().equals("11") ||  cdMant.getE02DEAACD().equals("12") || cdMant.getE02DEAACD().equals("CD")) ? "" : "hidden" %>">
              		<input type="text" name="E02DEARTZ" size="9" maxlength="7" value="<%= new BigDecimal(cdMant.getE02DEARTZ()).setScale(4, BigDecimal.ROUND_HALF_UP)%>" readonly>
				</div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<% } %>
  
  

  </form>
</body>
</html>
