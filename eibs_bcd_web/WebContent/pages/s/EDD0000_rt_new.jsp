<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <%@page import="com.datapro.eibs.constants.ISOCodes"%>
<html>
<head>
<title>Cuentas Corrientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<jsp:useBean id="rtBasic" class="datapro.eibs.beans.EDD000001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>
<body>


<% 
 String CUSCUN = "";
 String CUSNA1 = "";
 
 if (currClient != null && error.getERRNUM().equals("0")) {
    CUSCUN = currClient.getE01CUSCUN().trim();
    CUSNA1 = currClient.getE01CUSNA1().trim();
 } else {
    CUSCUN = rtBasic.getE01ACMCUN().trim();
    CUSNA1 = rtBasic.getE01CUSNA1().trim();
 }

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 boolean protect = JSEIBSProp.getProtectedBNKBRN();
  
%> 
<H3 align="center"><% if (userPO.getPurpose().equals("NEW")) out.print("Apertura de Cuentas de Detalle");
   else if (userPO.getPurpose().equals("MAINTENANCE")) out.print("Mantenimiento de Cuentas de Detalle");
   else out.print("");%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_new, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="29">
  <INPUT TYPE=HIDDEN NAME="E01ACMATY" VALUE="<%= rtBasic.getE01ACMATY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACMACD" VALUE="<%= rtBasic.getE01ACMACD().trim()%>">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01ACMCUN" id="E01ACMCUN" size="10" maxlength="9" value="<%= CUSCUN%>">
                <a href="javascript:GetCustomerDescId('E01ACMCUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= CUSNA1%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E01ACMACC" size="15" maxlength="12" readonly value="<% if (rtBasic.getE01ACMACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(rtBasic.getE01ACMACC().trim()); %>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01ACMCCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
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

<%int row = 0; %>
<H4>Datos B&aacute;sicos de la Operaci&oacute;n</H4>
<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Nombre de la Cuenta :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01ACMNME" size="60" maxlength="80" value="<%= rtBasic.getE01ACMNME().trim()%>">              
            </td>
            <td nowrap  width="29%" height="19"> 
            </td>
            <td nowrap>
            </td>
          </tr>        
          <tr id="trdark"> 
            <td nowrap width="29%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="19%"> 
	   		  <eibsinput:date name="rtBasic" fn_year="E01ACMOPY" fn_month="E01ACMOPM" fn_day="E01ACMOPD" />
            </td>
            <td nowrap width="26%"> 
              <div align="right">Tipo de Cuenta :</div>
            </td>
            <td nowrap width="26%">
              <select name="E01ACMPEC">
				<option value=" " <% if (!(rtBasic.getE01ACMPEC().equals("1") || rtBasic.getE01ACMPEC().equals("2")
                                            || rtBasic.getE01ACMPEC().equals("3") || rtBasic.getE01ACMPEC().equals("4")
                                            || rtBasic.getE01ACMPEC().equals("5"))) out.print("selected"); %>></option>
                <option value="1" <%if (rtBasic.getE01ACMPEC().equals("1")) out.print("selected"); %>>Individual</option>
                <option value="2" <% if (rtBasic.getE01ACMPEC().equals("2")) out.print("selected"); %>>Mancomunada</option>
                <option value="3" <% if (rtBasic.getE01ACMPEC().equals("3")) out.print("selected"); %>>Solidaria</option>
                <option value="4" <% if (rtBasic.getE01ACMPEC().equals("4")) out.print("selected"); %>>Menor</option>
                <option value="5" <% if (rtBasic.getE01ACMPEC().equals("5")) out.print("selected"); %>>Juridica</option>
				</select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19">
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap>
            <% if (!protect) {%>
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="<%= rtBasic.getE01ACMBNK().trim()%>">
              <input type="text" name="E01ACMBRN" size="5" maxlength="4" value="<%= rtBasic.getE01ACMBRN().trim()%>">
              <a href="javascript:GetBranch('E01ACMBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0"  ></a>
             <% } else {%>
              <input type="text" name="E01ACMBNK" size="2" maxlength="2" value="<%= rtBasic.getE01ACMBNK().trim()%>" readonly>
              <input type="text" name="E01ACMBRN" size="5" maxlength="4" value="<%= rtBasic.getE01ACMBRN().trim()%>" readonly>
             <% }%> 
            </td>
            <td nowrap width="26%" height="19">
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01ACMCCN" size="9" maxlength="8" value="<%= rtBasic.getE01ACMCCN().trim()%>">
              <a href="javascript:GetCostCenter('E01ACMCCN','01')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
            </td>
            
          </tr>
          <tr id="trdark"> 
          	<td nowrap width="29%" height="19"> 
              <div align="right">Uso de domicilio :</div>
            </td>
            <td nowrap width="19%" height="19"> 
               <select name="E01ACMWHF" >
			      <option value=" " <% if (!(rtBasic.getE01ACMWHF().equals("R") ||
			                                 rtBasic.getE01ACMWHF().equals("C") || rtBasic.getE01ACMWHF().equals("O")))out.print("selected"); %>>
			      </option>
			      <option value="C" <%if (rtBasic.getE01ACMWHF().equals("C")) out.print("selected"); %>>Correo Electrónico</option>
			      <option value="R" <%if (rtBasic.getE01ACMWHF().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
			      <option value="O" <%if (rtBasic.getE01ACMWHF().equals("O")) out.print("selected"); %>>Oficina del Banco</option>
			      
               </select>
              <input type="text" name="E01ACMMLA" size="3" maxlength="2" value="<%= rtBasic.getE01ACMMLA().trim()%>">
              <a href="javascript:GetMailing('E01ACMMLA',document.forms[0].E01ACMCUN.value,document.forms[0].E01ACMWHF.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
            </td>
            <td nowrap width="26%" height="23"> 
              <div align="right">Sobregiros Permitidos :</div>
            </td>
            <td nowrap width="26%" height="23"> 
              <input type="hidden" name="E01ACMF03" value="<%= rtBasic.getE01ACMF03()%>">
              <input type="radio" name="CE01ACMF03" value="1" onClick="document.forms[0].E01ACMF03.value='1'"
			  <%if(rtBasic.getE01ACMF03().equals("1")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01ACMF03" value="N" onClick="document.forms[0].E01ACMF03.value='N'"
			  <%if(rtBasic.getE01ACMF03().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" ></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="29%" height="19"> 
              <div align="right">Diferidos Locales :</div>
            </td>
            <td nowrap width="19%" height="19">
              <input type="text" size="2" maxlength="1" value="<%= rtBasic.getE01ACMWLF().trim()%>" name="E01ACMWLF">
              <a href="javascript:GetCode('E01ACMWLF','STATIC_rt_delay.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
            </td>
            <td nowrap width="26%" height="19"> 
              <div align="right">Diferidos No Locales :</div>
            </td>
            <td nowrap width="26%" height="19">
              <input type="text" size="2" maxlength="1" value="<%= rtBasic.getE01ACMWNF().trim()%>" name="E01ACMWNF">
              <a href="javascript:GetCode('E01ACMWNF','STATIC_rt_delay.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
            </td>
          </tr>
           <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Tabla de Documentos :</div>
            </td>
            <td nowrap width="19%" height="19">
             <input type="text" name="E01APCTNU" size="3" readonly maxlength="2" value="<%= rtBasic.getE01APCTNU().trim()%>">
            </td>
			<td nowrap width="26%" height="19">
				<div align="right">Referido Por:</div>
			</td>
			<td nowrap width="26%" height="19">
			 <input type="text" name="E01CMOREF" size="12" maxlength="10" value="<%= rtBasic.getE01CMOREF().trim()%>" onkeypress="enterInteger(event)">
   	             <a href="javascript:GetCustomer('E01CMOREF')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
			</td>
          </tr>
          <tr id="trclear">
           <td nowrap width="20%" > 
              <div align="right">Numero de Pagare :</div>
            </td>
            <td nowrap width="30%" >
            	<input type="text" name="E01ACMOFN" id="E01ACMOFN" size="12" maxlength="11" value="<%= rtBasic.getE01ACMOFN().trim()%>">  
            </td>
            <td nowrap width="26%" height="19">
			</td>
			<td nowrap width="26%" height="19">
			</td>
          </tr>
         </table>
      </td>
    </tr>
  </table>

<!-- <h4>Impuestos </h4> -->
<!--   <table class="tableinfo" > -->
<!--     <tr >  -->
<!--       <td nowrap >  -->
<!--         <table cellspacing=0 cellpadding=2 width="100%" border="0"> -->
<%--         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> --%>
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center"> </div> -->
<!--             </td> -->
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center">ISR</div> -->
<!--             </td> -->
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center">IVA/ITBMS</div> -->
<!--             </td> -->
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center">IDB/GMF</div> -->
<!--             </td> -->
<!--             <td nowrap width="10%" >  -->
<!--                <div align="center"> -->
<%--               	<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>   --%>
<!--               		FECI  -->
<%--               	<% } else if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) {%> --%>
<!--               		ITE -->
<%--               	<% } %> --%>
<!--               </div> -->
<!--            </td> -->
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center"> </div> -->
<!--             </td> -->
<!--         </tr>         -->
<%--          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> --%>
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center"> </div> -->
<!--             </td> -->
<!--             <td nowrap width="10%"  >  -->
<!--               <div align="center">  -->
<!-- 				<select id="E01ACMTX1" name="E01ACMTX1" > -->
<!-- 				    <option value=" " selected> &nbsp; </option> -->
<%-- 				    <option value="1" <% if(rtBasic.getE01ACMTX1().equals("1")) out.print("selected");%>> SI </option> --%>
<%-- 				    <option value="0" <% if(rtBasic.getE01ACMTX1().equals("0")) out.print("selected");%>> NO </option> --%>
<!-- 				</select>         -->
<!--               </div> -->
<!--             </td> -->
<!--             <td nowrap width="10%"  >  -->
<!--               <div align="center">  -->
<!-- 				<select id="E01ACMTX2" name="E01ACMTX2" > -->
<!-- 				    <option value=" " selected> &nbsp; </option> -->
<%-- 				    <option value="1" <% if(rtBasic.getE01ACMTX2().equals("1")) out.print("selected");%>> SI </option> --%>
<%-- 				    <option value="0" <% if(rtBasic.getE01ACMTX2().equals("0")) out.print("selected");%>> NO </option> --%>
<!-- 				</select>         -->
<!--               </div> -->
<!--             </td> -->
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center">  -->
<!-- 				<select id="E01ACMTX3" name="E01ACMTX3" > -->
<!-- 				    <option value=" " selected> &nbsp; </option> -->
<%-- 				    <option value="1" <% if(rtBasic.getE01ACMTX3().equals("1")) out.print("selected");%>> SI </option> --%>
<%-- 				    <option value="0" <% if(rtBasic.getE01ACMTX3().equals("0")) out.print("selected");%>> NO </option> --%>
<!-- 				</select>         -->
<!--               </div> -->
<!--             </td> -->
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center">  -->
<%-- 			<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %>  --%>
<!-- 				<select id="E01ACMTX4" name="E01ACMTX4" > -->
<!-- 				    <option value=" " selected> &nbsp; </option> -->
<%-- 				    <option value="1" <% if(rtBasic.getE01ACMTX4().equals("1")) out.print("selected");%>> SI </option> --%>
<%-- 				    <option value="0" <% if(rtBasic.getE01ACMTX4().equals("0")) out.print("selected");%>> NO </option> --%>
<!-- 				</select>                  -->
<%-- 			<% } %>				 --%>
<!-- 			</div> -->
<!--             </td> -->
<!--             <td nowrap width="10%" >  -->
<!--               <div align="center"> </div> -->
<!--             </td> -->
<!--          </tr> -->
<!--         </table> -->
<!--       </td> -->
<!--     </tr> -->
<!--   </table> -->
  
  
  <H4>Informaci&oacute;n para Cargos por Servicios</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Cargos por Servicios :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="hidden" name="E01ACMSCF" value="<%= rtBasic.getE01ACMSCF()%>">
              <input type="radio" name="CE01ACMSCF" value="Y" onClick="document.forms[0].E01ACMSCF.value='Y'"
			  <%if(rtBasic.getE01ACMSCF().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01ACMSCF" value="N" onClick="document.forms[0].E01ACMSCF.value='N'"
			  <%if(rtBasic.getE01ACMSCF().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" ></td>
            <td nowrap width="28%"> 
              <div align="right">Frecuencia Cobro de Cargos :</div>
            </td>
            <td nowrap width="24%">
              <select name="E01ACMSHF">
				<option value=" " <% if (!(rtBasic.getE01ACMSHF().equals("D") ||rtBasic.getE01ACMSHF().equals("W")
				||rtBasic.getE01ACMSHF().equals("B")||rtBasic.getE01ACMSHF().equals("M")||rtBasic.getE01ACMSHF().equals("Q")))
				out.print("selected"); %>></option>
                <option value="D" <%if (rtBasic.getE01ACMSHF().equals("D")) out.print("selected"); %>>Diario</option>
                <option value="W" <%if (rtBasic.getE01ACMSHF().equals("W")) out.print("selected"); %>>Semanal</option>
                <option value="B" <%if (rtBasic.getE01ACMSHF().equals("B")) out.print("selected"); %>>Quincenal</option>
                <option value="M" <%if (rtBasic.getE01ACMSHF().equals("M")) out.print("selected"); %>>Mensual</option>
                <option value="Q" <%if (rtBasic.getE01ACMSHF().equals("Q")) out.print("selected"); %>>Trimestral</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digos Tabla de Cargos :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E01ACMACL" size="3" maxlength="2" value="<%= rtBasic.getE01ACMACL().trim()%>">
              <a href="javascript:GetRetCod('E01ACMACL',document.forms[0].E01ACMATY.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" ></td>
            <td nowrap width="28%"> 
              <div align="right">Ciclo/D&iacute;a Cobro de Cargos :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="text" name="E01ACMSHY" size="3" maxlength="2" value="<%= rtBasic.getE01ACMSHY().trim()%>">
              <a href="javascript:GetCode('E01ACMSHY','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Informaci&oacute;n Estado de Cuenta</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Frecuencia  :</div>
            </td>
            <td nowrap width="18%">
              <select name="E01ACMSTF">
				<option value=" " <% if (!(rtBasic.getE01ACMSTF().equals("D") ||rtBasic.getE01ACMSTF().equals("W")
				||rtBasic.getE01ACMSTF().equals("B")||rtBasic.getE01ACMSTF().equals("M")||rtBasic.getE01ACMSTF().equals("Q")))
				out.print("selected"); %>></option>
                <option value="D" <%if (rtBasic.getE01ACMSTF().equals("D")) out.print("selected"); %>>Diario</option>
                <option value="W" <%if (rtBasic.getE01ACMSTF().equals("W")) out.print("selected"); %>>Semanal</option>
                <option value="B" <%if (rtBasic.getE01ACMSTF().equals("B")) out.print("selected"); %>>Quincenal</option>
                <option value="M" <%if (rtBasic.getE01ACMSTF().equals("M")) out.print("selected"); %>>Mensual</option>
                <option value="Q" <%if (rtBasic.getE01ACMSTF().equals("Q")) out.print("selected"); %>>Trimestral</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" > 
            </td>
            <td nowrap width="28%"> 
              <div align="right">Retenci&oacute;n de Correos :</div>
            </td>
            <td nowrap width="24%"> 
              <input type="hidden" name="E01ACMHSF" value="<%= rtBasic.getE01ACMHSF()%>">
              <input type="radio" name="CE01ACMHSF" value="H" onClick="document.forms[0].E01ACMHSF.value='H'"
			  <%if(rtBasic.getE01ACMHSF().equals("H")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01ACMHSF" value="" onClick="document.forms[0].E01ACMHSF.value=' '"
			  <%if(rtBasic.getE01ACMHSF().trim().equals("")) out.print("checked");%>>
              No  </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Ciclo/D&iacute;a Impresi&oacute;n  
                :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E01ACMSDY" size="3" maxlength="2" value="<%= rtBasic.getE01ACMSDY().trim()%>">
              <a href="javascript:GetCode('E01ACMSDY','STATIC_rt_ciclo.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" > 
            </td>
            <td nowrap width="28%"> 
              <div align="right">Estado  Consolidado :</div>
            </td>
            <td nowrap width="24%">
              <input type="hidden" name="E01ACMCSF" value="<%= rtBasic.getE01ACMCSF()%>">
              <input type="radio" name="CE01ACMCSF" value="Y" onClick="document.forms[0].E01ACMCSF.value='Y'"
			  <%if(rtBasic.getE01ACMCSF().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01ACMCSF" value="N" onClick="document.forms[0].E01ACMCSF.value='N'"
			  <%if(rtBasic.getE01ACMCSF().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Tipo  Estado de 
                Cuenta :</div>
            </td>
            <td nowrap width="18%" height="23"> 
              <select name="E01ACMSTY">
                <option value=" " <% if (!(rtBasic.getE01ACMSTY().equals("P") ||rtBasic.getE01ACMSTY().equals("C")
				||rtBasic.getE01ACMSTY().equals("N"))) out.print("selected"); %>></option>
                <option value="P" <%if (rtBasic.getE01ACMSTY().equals("P")) out.print("selected"); %>>Personal</option>
                <option value="C" <%if (rtBasic.getE01ACMSTY().equals("C")) out.print("selected"); %>>Corporativa</option>
                <option value="N" <%if (rtBasic.getE01ACMSTY().equals("N")) out.print("selected"); %>>Ninguna</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" > 
            </td>
            <td nowrap width="28%" height="23"> 
              <div align="right">Forma de Env&iacute;o  :</div>
            </td>
            <td nowrap width="24%" height="23">
              <select name="E01ACMSTE" >
				<option value="N" <% if (!(rtBasic.getE01ACMSTE().equals("T") ||rtBasic.getE01ACMSTE().equals("P")
				||rtBasic.getE01ACMSTE().equals("F")||rtBasic.getE01ACMSTE().equals("E"))) out.print("selected"); %>>Ninguna</option>
                <option value="T" <%if (rtBasic.getE01ACMSTE().equals("T")) out.print("selected"); %>>Telex</option>
                <option value="P" <%if (rtBasic.getE01ACMSTE().equals("P")) out.print("selected"); %>>Impresora</option>
                <option value="F" <%if (rtBasic.getE01ACMSTE().equals("F")) out.print("selected"); %>>Facsimil</option>
                <option value="E" <%if (rtBasic.getE01ACMSTE().equals("E")) out.print("selected"); %>>Email</option>
              </select>
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
            <td nowrap><div align="right">Nombre Personalizado :</div></td>
            <td nowrap colspan=3>
            	<INPUT type="text" name="E01ACMCK1" size="35" maxlength="35" value="<%= rtBasic.getE01ACMCK1().trim()%>">
            </td>
          
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">
              <SELECT name="E01ACMRE1">
                 <OPTION value="Y" <%if (!rtBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">Y</OPTION>
                 <% if (currUser.getE01INT().equals("07")) { %>
                   <OPTION value="O" <%if (rtBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">O</OPTION>               
                 <%} else { %>
                   <OPTION value="O" <%if (rtBasic.getE01ACMRE1().equals("O")) out.print("selected"); %>="">Y/O</OPTION>
                 <% } %>
              </SELECT>
              </div>
            </td>
            <td nowrap colspan=3>
              <INPUT type="text" name="E01ACMCK2" size="35" maxlength="35" value="<%= rtBasic.getE01ACMCK2().trim()%>">
            </td>
            
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Tipo de Chequera :</div>
            </td>
            <td nowrap <% if (!rtBasic.getH01FLGMAS().equals("N")) out.print("colspan=3");%>>
            <INPUT type="text" name="E01ACMTBK" size="3" maxlength="2" value="<%= rtBasic.getE01ACMTBK().trim()%>">
              <A href="javascript:GetTypCHK('E01ACMTBK','','<%= rtBasic.getE01ACMATY().trim()%>','<%= rtBasic.getE01ACMCCY().trim()%>')">
              <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></A> 
            </td>
            
            <% if (rtBasic.getH01FLGMAS().equals("N")) {%>
            <td nowrap>
              <div align="right">Cantidad :</div>
            </td>
            <td nowrap>
              <INPUT type="text" name="E01ACMNCB" size="3" maxlength="2" value="<%= rtBasic.getE01ACMNCB().trim()%>">
            </td>
            <% } %>
            
          </tr>
          <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Cobro de Cargos  :</div>
            </td>
            <td nowrap ><INPUT type="radio" name="E01ACMCBC" value="Y" <% if(!rtBasic.getE01ACMCBC().equals("N")) out.print("checked");%>="">
              S&iacute; 
              <INPUT type="radio" name="E01ACMCBC" value="N" <% if(rtBasic.getE01ACMCBC().equals("N")) out.print("checked");%>="">
               No
            </td>
            <td nowrap> 
              <div align="right">Stock Mínimo  :</div>
            </td>
            <td nowrap >
            <INPUT type="text" name="E01ACMMSK" size="3" maxlength="2" value="<%= rtBasic.getE01ACMMSK().trim()%>"> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right">Restricción de Entregas :</div>
            </td>
            <td nowrap ><INPUT type="radio" name="E01ACMCON" value="Y" <% if(rtBasic.getE01ACMCON().equals("Y")) out.print("checked");%>="">
              S&iacute; 
              <INPUT type="radio" name="E01ACMCON" value="N" <% if(!rtBasic.getE01ACMCON().equals("Y")) out.print("checked");%>="">
              No
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
              <input type="hidden" name="E01ACMTX1" value="<%= rtBasic.getE01ACMTX1()%>">
              <input type="radio" name="CE01ACMTX1" value="Y" onClick="document.forms[0].E01ACMTX1.value='Y'"
			  <%if(rtBasic.getE01ACMTX1().equals("Y")) out.print("checked");%> disabled="disabled">
                S&iacute; 
              <input type="radio" name="CE01ACMTX1" value="N" onClick="document.forms[0].E01ACMTX1.value='N'"
			  <%if(rtBasic.getE01ACMTX1().equals("N")) out.print("checked");%> disabled="disabled">
                No <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" >
              </td> 
           
          <td nowrap width="26%"><div align="right">Clase de Cuenta :</div></td>
            <td nowrap width="22%">
				<input type="text" name="E01ACMTX9" size="2" maxlength="1" value="<%= rtBasic.getE01ACMTX9().trim()%>">
            	<a href="javascript:GetCodeCNOFC('E01ACMTX9','CQ')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0" ></a>
            </td>

        <% } else {%>
            <td nowrap width="30%"></td>
            <td nowrap width="22%"></td>
            <td nowrap width="26%"></td>
          	<td nowrap width="22%"></td>
          <%}%>
       	</tr>
      </table>
    </td>
  </tr>
</table>


<H4>Origen de Fondos</H4>
  
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
          <tr id="trclear"> 
            <td nowrap width="30%"> 
                <div align="center" > 
 	              <%= i %>
                  <input type="text" name="E01OFFOP<%= name %>" id="E01OFFOP<%= name %>" value="<%= rtBasic.getField("E01OFFOP"+name).getString().trim()%>" size="3" maxlength="3">
                  <input type="hidden" name="E01OFFGL<%= name %>" value="<%= rtBasic.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= rtBasic.getField("E01OFFCO"+name).getString().trim()%>" 
                  class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01ACMBNK.value, document.forms[0].E01OFFCY<%= name %>.value,'E01OFFGL<%= name %>','E01OFFOP<%= name %>',document.forms[0].E01ACMACD.value, '01')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= rtBasic.getField("E01OFFBK"+name).getString().trim()%>">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name %>" size="4" maxlength="4" value="<%= rtBasic.getField("E01OFFBR"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01ACMBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= rtBasic.getField("E01OFFCY"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01ACMBNK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" id="E01OFFAC<%= name %>" size="12" maxlength="12"  value="<%= rtBasic.getField("E01OFFAC"+name).getString().trim()%>"
                class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01ACMBNK.value,'','','','RT')">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
                <input class="txtright" type="text" name="E01OFFAM<%= name %>" size="15" maxlength="15"  value="<%= rtBasic.getField("E01OFFAM"+name).getString().trim()%>" onKeypress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
          </table>
        </div>
     <table id="footTable">
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
  window.onresize=tableresize;
  </SCRIPT>
    
<% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(rtBasic.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Avisos</h4>
  <% } %>     
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
  </form>
</body>
</html>
