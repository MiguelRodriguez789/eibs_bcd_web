<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Sistema Administración Portafolio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="invInst" class="datapro.eibs.beans.EIE005001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<% if (userPO.getPurpose().equals("M") ) { %>
      builtNewMenu(inst_basic_opt);
 	  initMenu();
<% } %>
 	  
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
 	  
</SCRIPT>

</head>
<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

 
%>

<div align="center"> 
  <h3>Instrumentos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inv_inst_basic.jsp, EIE0050"> 
  </h3>
</div>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEIE0050" >
  <h4>Información 
    <input type="hidden" name="SCREEN"  value="2" >
  </h4>
  <table  class="tableinfo" width="715">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Código / Description :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISIIIC" size="13" maxlength="12" value="<%= invInst.getE01ISIIIC()%>" readonly>
              / 
              <input type="text" name="E01ISIDSC" size="35" maxlength="30" value="<%= invInst.getE01ISIDSC()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Estado Interno :</div>
            </td>
            <td nowrap width="33%" >
				<select name="E01ISISTS">
         		<option value="A" <%if (invInst.getE01ISISTS().equals("A")) {  out.print("selected"); }%>>Activo</option>
				<option value="I" <%if (invInst.getE01ISISTS().equals("I")) {  out.print("selected"); }%>>Inactivo</option>
				<option value="P" <%if (invInst.getE01ISISTS().equals("P")) {  out.print("selected"); }%>>Pendiente</option>
              </select> 
				</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Moneda Instrumento :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISICCY" size="5" maxlength="3" value="<%= invInst.getE01ISICCY()%>">
              <a href="javascript:GetCurrency('E01ISICCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="14%" > 
              <div align="right">Moneda Bloomberg :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISIBCY" size="5" maxlength="3" value="<%= invInst.getE01ISIBCY()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Tipo Instrumento :</div>
            </td>
            <td nowrap width="36%" >
        	     <SELECT name="E01ISIPTY" disabled>
					<OPTION value="ACD" <%if (invInst.getE01ISIPTY().equals("ACD")) { out.print("selected"); }%>>Productos(Commodities)</OPTION>
					<OPTION value="EQT" <%if (invInst.getE01ISIPTY().equals("EQT")) { out.print("selected"); }%>>Acciones</OPTION>
					<OPTION value="MUT" <%if (invInst.getE01ISIPTY().equals("MUT")) { out.print("selected"); }%>>Fondos Mutuales</OPTION>
					<OPTION value="BND" <%if (invInst.getE01ISIPTY().equals("BND")) { out.print("selected"); }%>>Bonos</OPTION>
					<OPTION value="PFS" <%if (invInst.getE01ISIPTY().equals("PFS")) { out.print("selected"); }%>>Acciones Preferentes</OPTION>
				</SELECT>
            </td>
            <td nowrap width="14%" > 
              <div align="right">Simbolo :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISISYM" size="20" maxlength="15" value="<%= invInst.getE01ISISYM()%>"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Nombre Emisor :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISIENM" size="50" maxlength="45" value="<%= invInst.getE01ISIENM()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Número ISIN / Serie :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISINUM" size="16" maxlength="12" value="<%= invInst.getE01ISINUM()%>">
              / 
              <input type="text" name="E01ISISER" size="3" maxlength="2" value="<%= invInst.getE01ISISER()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Marcar como Complex :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="hidden" name="E01ISIPRE" value="<%= invInst.getE01ISIPRE()%>">
              <input type="radio" name="CE01ISIPRE" value="Y" onClick="document.forms[0].E01ISIPRE.value='Y'"
			  <%if(invInst.getE01ISIPRE().equals("Y")) out.print("checked");%>>
              Si 
              <input type="radio" name="CE01ISIPRE" value="N" onClick="document.forms[0].E01ISIPRE.value='N'"
			  <%if(invInst.getE01ISIPRE().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="14%" > 
              <div align="right">Código Común / CUSIP :</div>
            </td>
            <td nowrap width="33%" > 
               <INPUT type="text" name="E01ISICCD" size="16"
					maxlength="15" value="<%= invInst.getE01ISICCD()%>"> 
               <INPUT type="text" name="E01ISICUS" size="12" maxlength="12"
					value="<%= invInst.getE01ISICUS()%>">
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Código País IBS :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISICTC" size="5" maxlength="3" value="<%= invInst.getE01ISICTC()%>">
              <a href="javascript:GetCodeCNOFC('E01ISICTC','03')"> 
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  >
            </td>
            <td nowrap width="14%" > 
              <div align="right">Nombre País :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISICTR" size="30" maxlength="30" value="<%= invInst.getE01ISICTR()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Código País Bloomberg :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISICTB" size="5" maxlength="4" value="<%= invInst.getE01ISICTB()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Modo Actualización :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="hidden" name="E01ISIMOD" value="<%= invInst.getE01ISIMOD()%>">
                <input type="radio" name="CE01ISIMOD" value="M" onClick="document.forms[0].E01ISIMOD.value='M'"
			  <%if(invInst.getE01ISIMOD().equals("M")) out.print("checked");%>>
                Manual 
                <input type="radio" name="CE01ISIMOD" value="B" onClick="document.forms[0].E01ISIMOD.value='B'"
			  <%if(invInst.getE01ISIMOD().equals("B")) out.print("checked");%>>
                Bloomberg <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  ></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Rating 'Standard &amp; Poor':</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISIRSP" size="25" maxlength="23" value="<%= invInst.getE01ISIRSP()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Rating 'Moodys' :</div>
            </td>
            <td nowrap width="33%" > 
              <div align="left"> 
                <input type="text" name="E01ISIRMD" size="25" maxlength="23" value="<%= invInst.getE01ISIRMD()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Nota Rango :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01ISIRGN" size="45" maxlength="45" value="<%= invInst.getE01ISIRGN()%>">
            </td>
            <td nowrap > 
              <div align="right">Precio en Porcentaje :</div>
            </td>
            <td nowrap > 
              <input type="hidden" name="E01ISIPER" value="<%= invInst.getE01ISIPER()%>">
              <input type="radio" name="CE01ISIPER " value="Y" onClick="document.forms[0].E01ISIPER.value='Y'"
			  <%if(invInst.getE01ISIPER().equals("Y")) out.print("checked");%>>
              Si 
              <input type="radio" name="CE01ISIPER " value="N" onClick="document.forms[0].E01ISIPER.value='N'"
			  <%if(invInst.getE01ISIPER().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="17%" > 
              <div align="right">Fecha Emisión :</div>
            </td>
            <td nowrap width="36%" > 
            	<eibsinput:date name="invInst" fn_year="E01ISISDY" fn_month="E01ISISDM" fn_day="E01ISISDD" required="true"/>
			</td>
            <td nowrap width="14%" > 
              <div align="right">Estado Instrumento en el Mercado :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISIMKS" size="15" maxlength="10" value="<%= invInst.getE01ISIMKS()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="17%" > 
              <div align="right">Tipo de Calculo :</div>
            </td>
            <td nowrap width="36%" > 
              <input type="text" name="E01ISICTP" size="7" maxlength="6" value="<%= invInst.getE01ISICTP()%>">
            </td>
            <td nowrap width="14%" > 
              <div align="right">Descripción Tipo de Cálculo :</div>
            </td>
            <td nowrap width="33%" > 
              <input type="text" name="E01ISICTD" size="35" maxlength="35" value="<%= invInst.getE01ISICTD()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Pendiente al Vencimiento :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIYLD" size="11" maxlength="9" value="<%= invInst.getE01ISIYLD()%>" >
            </td>
            <td nowrap width="34%" > 
              <div align="right">Pendiente de Llamado :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIYTC" size="11" maxlength="9" value="<%= invInst.getE01ISIYTC()%>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Grupo Industrial :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01ISIIGR" size="35" maxlength="30" value="<%= invInst.getE01ISIIGR()%>">
            </td>
            <td nowrap width="34%" >
              <div align="right">Incumplido :</div>
            </td>
            <td nowrap width="66%" >
              <input type="hidden" name="E01ISIDFT" value="<%= invInst.getE01ISIDFT()%>">  
              <input type="radio" name="CE01ISIDFT" value="Y" onClick="document.forms[0].E01ISIDFT.value='Y'"
			  <%if(invInst.getE01ISIDFT().equals("Y")) out.print("checked");%>>
              Si 
              <input type="radio" name="CE01ISIDFT" value="N" onClick="document.forms[0].E01ISIDFT.value='N'"
			  <%if(invInst.getE01ISIDFT().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  ></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="34%" >
              <div align="right">Cupón Cero :</div>
            </td>
            <td nowrap width="34%" >
              <input type="radio" name="E01ISIZER" value="Y" <%if(invInst.getE01ISIZER().equals("Y")) out.print("checked");%>>Si 
              <input type="radio" name="E01ISIZER" value="N" <%if(invInst.getE01ISIZER().equals("N")) out.print("checked");%>>No
            </td>
            <td nowrap width="34%" >
               <div align="right">Aceptada para el Comercio en Europa :</div>
            </td>
            <td nowrap width="66%" >
            	<input type="hidden" name="E01ISIEUR" value="<%= invInst.getE01ISIEUR()%>">
              <input type="radio" name="CE01ISIEUR" value="Y" onClick="document.forms[0].E01ISIEUR.value='Y'"
			  <%if(invInst.getE01ISIEUR().equals("Y")) out.print("checked");%>>
              Si 
              <input type="radio" name="CE01ISIEUR" value="N" onClick="document.forms[0].E01ISIEUR.value='N'">
              No</td>

          </tr>
          <tr id="trdark">
            <td nowrap width="34%" >
              <div align="right">Unidad de Medida :</div>
            </td>
            <td nowrap width="34%" >
              <INPUT type="text" name="E01ISICMS" size="6" maxlength="6" value="<%= invInst.getE01ISICMS().trim()%>">
              <A href="javascript:GetSpecUsrTab('E01ISICMS','13')">
                <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"	align="middle" border="0">
              </A>
            </td>
            <td nowrap width="14%" > 
              <div align="right">Pool Factor :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ISIPFA" size="11" maxlength="11" value="<%= invInst.getE01ISIPFA()%>">
              </div>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="14%" align="right">Permite Decimales en Cantidad : </td>
            <td nowrap width="34%" >
              <INPUT type="radio" name="E01ISIDAQ"
					value="Y"
					<%if(invInst.getE01ISIDAQ().equals("Y")) out.print("checked");%>>Si 
              <INPUT type="radio" name="E01ISIDAQ" value="N"
					<%if(invInst.getE01ISIDAQ().equals("N")) out.print("checked");%>>No
            </td>
            <td nowrap width="14%" align="right"> Tipo Titulo :</td>
            <td nowrap > 
            	<input type="text" name="E01ISITTI" size="11" maxlength="11" value="<%= invInst.getE01ISITTI()%>">
            	<a href="javascript:GetCodeCNOFC('E01ISITTI','GI')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="14%" align="right">Sector : </td>
            <td nowrap width="34%" >
             <select name="E01ISISCT">
                <option value="1" <%if (invInst.getE01ISISCT().equals("1")) { out.print("selected"); }%>>Gubernamental</option>
                <option value="2" <%if (invInst.getE01ISISCT().equals("2")) {  out.print("selected"); }%>>Privado</option>
              </select>
            </td>
            <td nowrap width="14%" align="right">Tipo Empresa :</td>
            <td nowrap >
            <input type="text" name="E01ISITEM" size="11" maxlength="11" value="<%= invInst.getE01ISITEM()%>">
            <a href="javascript:GetCodeCNOFC('E01ISITEM','T9')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="14%" align="right">Tipo Actividad : </td>
            <td nowrap width="34%" >
             <input type="text" name="E01ISITAC" size="11" maxlength="11" value="<%= invInst.getE01ISITAC()%>">
             <a href="javascript:GetCodeCNOFC('E01ISITAC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a>
            </td>
            <td nowrap width="14%" align="right"></td>
            <td nowrap ></td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  <h4>Información Fiscal</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="14%" align="right">US Security IRS :</td>
            <td nowrap width="34%" >
              <INPUT type="radio" name="E01ISIUSS"
					value="Y"
					<%if(invInst.getE01ISIUSS().equals("Y")) out.print("checked");%>>Si 
              <INPUT type="radio" name="E01ISIUSS" value="N"
					<%if(invInst.getE01ISIUSS().equals("N")) out.print("checked");%>>No
			</td>
            <td nowrap width="14%" ><div align="right">Tasa de Impuestos en la Fuente :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ISITRS" size="11" maxlength="11" value="<%= invInst.getE01ISITRS()%>"> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="14%" > 
              <div align="right">Código de Ingresos :</div>
            </td>
            <td nowrap width="36%"> 
              <div align="left"> 
                <input type="text" name="E01ISIIRC" size="3" maxlength="2" value="<%= invInst.getE01ISIIRC()%>">
                <A href="javascript:GetSpecUsrTab('E01ISIIRC','11')"><IMG
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="middle" border="0"></A>
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="33" > 
            </td>
          </tr>
        </table>
      </td>
    </tr> 
  </table> 
  <% if(invInst.getE01ISIPTY().equals("BND") || invInst.getE01ISIPTY().equals("PFS")) { %>
  <h4>Información Adicional</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="34%" >
            	<eibsinput:date name="invInst" fn_year="E01ISIMAY" fn_month="E01ISIMAM" fn_day="E01ISIMAD" required="true"/>
            </td>
            <td nowrap width="34%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="66%" >&nbsp; <A href="javascript:GetFloating('E01ISIFTB')"></A></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Tasa de Interés:</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E01ISIRTE" size="11" maxlength="11" value="<%= invInst.getE01ISIRTE()%>">
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
              </div>
            </td>
            <td nowrap > 
              <div align="right">Tipo de Cálculo de Intereses :</div>
            </td>
            <td nowrap > 
              <select name="E01ISIATY">
                <option value=" " <%if (invInst.getE01ISIATY().equals(" ")) { out.print("selected"); }%>></option> 
                <option value="1" <%if (invInst.getE01ISIATY().equals("1")) { out.print("selected"); }%>>Actual/Actual</option>
                <option value="2" <%if (invInst.getE01ISIATY().equals("2")) {  out.print("selected"); }%>>Actual/365</option>
                <option value="3" <%if (invInst.getE01ISIATY().equals("3")) {  out.print("selected"); }%>>Actual/365(366 
                Año Bisiesto)</option>
                <option value="4" <%if (invInst.getE01ISIATY().equals("4")) {  out.print("selected"); }%>>Actual/360</option>
                <option value="5" <%if (invInst.getE01ISIATY().equals("5")) {  out.print("selected"); }%>>30/360</option>
                <option value="6" <%if (invInst.getE01ISIATY().equals("6")) {  out.print("selected"); }%>>30E/360</option>
                <option value="7" <%if (invInst.getE01ISIATY().equals("7")) {  out.print("selected"); }%>>22/252</option>
                               
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Base de Cálculo :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIBAS" size="5" maxlength="3" value="<%= invInst.getE01ISIBAS()%>">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Días de Cálculo :</div>
            </td>
            <td nowrap width="66%" > 
              <select name="E01ISIICT">
                <option value=" " <%if (invInst.getE01ISIICT().equals(" ")) { out.print("selected"); }%>></option> 
                <option value="1" <%if (invInst.getE01ISIICT().equals("1")) { out.print("selected"); }%>>Días Calendario</option>
                <option value="2" <%if (invInst.getE01ISIICT().equals("2")) {  out.print("selected"); }%>>Días Comerciales 
                </option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Tabla Tasa Flotante :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIFTB" size="2" maxlength="2" value="<%= invInst.getE01ISIFTB().trim()%>">
              <a href="javascript:GetFloating('E01ISIFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
              <select name="E01ISIFTY">
                <option value=" " <%if (invInst.getE01ISIFTY().equals(" ")) { out.print("selected"); }%>></option>
                <option value="FP" <%if (invInst.getE01ISIFTY().equals("FP")) { out.print("selected"); }%>> 
                Primaria</option>
                <option value="FS" <%if (invInst.getE01ISIFTY().equals("FS")) {  out.print("selected"); }%>> 
                Secundaria</option>
              </select>
            </td>
            <td nowrap width="34%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIFRT" size="11" maxlength="11" value="<%= invInst.getE01ISIFRT()%>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Días / Fecha T + N :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIDTN" size="11" maxlength="11" value="<%= invInst.getE01ISIDTN()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="34%" > 
              <div align="right">Frecuencia de Pago :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIPFV" size="4" maxlength="4" value="<%= invInst.getE01ISIPFV().trim()%>" onKeyPress="enterInteger(event)">
              <select name="E01ISIPFC">
				<option value=" " <% if(invInst.getE01ISIPFC().equals(" ")) out.print("selected");%>></option>
                <option value="D" <% if(invInst.getE01ISIPFC().equals("D")) out.print("selected");%>>Día(s)</option>
                <option value="M" <% if(invInst.getE01ISIPFC().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Q" <% if(invInst.getE01ISIPFC().equals("Q")) out.print("selected");%>>Trimestral</option>
                <option value="S" <% if(invInst.getE01ISIPFC().equals("S")) out.print("selected");%>>Semestral</option>
                <option value="Y" <% if(invInst.getE01ISIPFC().equals("Y")) out.print("selected");%>>Anual</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
		  <tr id="trclear">
    		<td nowrap align="right">Metodo de Cálculo : </td>
    		<td nowrap colspan="3">
    			<SELECT name="E01ISICMT">
					<OPTION value=" "
						<%if (invInst.getE01ISICMT().equals(" ")) { out.print("selected"); }%>></OPTION>
					<OPTION value="N"
						<%if (invInst.getE01ISICMT().equals("N")) { out.print("selected"); }%>>Ninguno</OPTION>
					<OPTION value="1"
						<%if (invInst.getE01ISICMT().equals("1")) {  out.print("selected"); }%>>Base Semestral</OPTION>
				</SELECT>
			</td>
    	</tr>         
        </table>
      </td>
    </tr>
  </table>
  <%
     
    }
  %> 
  <h4>Fechas</h4>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="22%" >
              <div align="right">Ultima fecha de Pago de Intereses :</div>
            </td>
            <td nowrap width="18%" align="left">
              	<eibsinput:date name="invInst" fn_year="E01ISIINY" fn_month="E01ISIINM" fn_day="E01ISIIND" required="true"/>
            </td>
            <td nowrap width="41%" >
              <div align="right">Próxima Fecha de Pago de Intereses :</div>
            </td>
            <td nowrap width="19%" align="left">
            	<eibsinput:date name="invInst" fn_year="E01ISINIY" fn_month="E01ISINIM" fn_day="E01ISINID" required="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" >
              <div align="right">Fecha último pago de Dividendos  :</div>
            </td>
            <td nowrap width="18%" align="left">
            	<eibsinput:date name="invInst" fn_year="E01ISIDIY" fn_month="E01ISIDIM" fn_day="E01ISIDID" required="true"/>
            </td>
            <td nowrap width="41%" >
              <div align="right">Próxima Fecha de Pago de Dividendos :</div>
            </td>
            <td nowrap width="19%" align="left">
            	<eibsinput:date name="invInst" fn_year="E01ISINDY" fn_month="E01ISINDM" fn_day="E01ISINDD" required="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">Ultima Fecha de Pago de Capital :</div>
            </td>
            <td nowrap width="18%" >
            	<eibsinput:date name="invInst" fn_year="E01ISICAY" fn_month="E01ISICAM" fn_day="E01ISICAD" required="true"/>		 
            </td>
            <td nowrap width="41%" > 
              <div align="right">Próxima fecha de Pago de Capital :</div>
            </td>
            <td nowrap width="19%" >
            	<eibsinput:date name="invInst" fn_year="E01ISINCY" fn_month="E01ISINCM" fn_day="E01ISINCD" required="true"/> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">Primera Fecha de Cálculo de Intereses  :</div>
            </td>
            <td nowrap width="18%" align="left">
            	<eibsinput:date name="invInst" fn_year="E01ISIFAY" fn_month="E01ISIFAM" fn_day="E01ISIFAD" required="true"/> 
            </td>
            <td nowrap width="41%" ><div align="right"><DIV align="right">Proxima Fecha de 'Call' :</DIV></div>
            </td>
            <td nowrap width="19%" >
            	<eibsinput:date name="invInst" fn_year="E01ISICLY" fn_month="E01ISICLM" fn_day="E01ISICLD" required="true"/> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%"  align="right">Primera Fecha de Cupón :</td>
            <td nowrap width="18%" > 
            	<eibsinput:date name="invInst" fn_year="E01ISIFIY" fn_month="E01ISIFIM" fn_day="E01ISIFID" required="true"/>
            </td>
            <td nowrap width="41%" align="right">Proxima Fecha 'Put' :</td>
            <td nowrap width="19%" > 
            	<eibsinput:date name="invInst" fn_year="E01ISIPUY" fn_month="E01ISIPUM" fn_day="E01ISIPUD" required="true"/>
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" align="right">Primera Fecha de Liquidación: </td>
            <td nowrap width="18%" > 
            	<eibsinput:date name="invInst" fn_year="E01ISIFSY" fn_month="E01ISIFSM" fn_day="E01ISIFSD" required="true"/>
            </td>
            <td nowrap width="41%" align="right"></td>
            <td nowrap width="19%" ></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Tamaño Emisión</h4>
  <table  class="tableinfo" width="546">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Monto Emitido :</div>
            </td>
            <td nowrap width="34%" > 
              <input type="text" name="E01ISIAMT" size="22" maxlength="21" value="<%= invInst.getE01ISIAMT()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Precio Emitido :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIIPR" size="22" maxlength="21" value="<%= invInst.getE01ISIIPR()%>" onKeyPress="enterDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Monto Precio Mínimo :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01ISIMIA" size="22" maxlength="21" value="<%= invInst.getE01ISIMIA()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Precio al Vencimiento :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" name="E01ISIMPR" size="22" maxlength="21" value="<%= invInst.getE01ISIMPR()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Monto Incremento :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01ISIINA" size="22" maxlength="21" value="<%= invInst.getE01ISIINA()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right">Precio Promedio Mensual :</div>
            </td>
            <td nowrap width="66%" >
              <input type="text" name="E01ISIMAP" size="22" maxlength="21" value="<%= invInst.getE01ISIMAP()%>" onKeyPress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Monto Par. :</div>
            </td>
            <td nowrap width="34%" >
              <input type="text" name="E01ISIPAR" size="22" maxlength="21" value="<%= invInst.getE01ISIPAR()%>" onKeyPress="enterDecimal()">
            </td>
            <td nowrap width="34%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="66%" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4><% if(userPO.getPurpose().equals("M")) { %>Información Auditoria</h4>
  <table  class="tableinfo" width="546">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="34%" > 
              <div align="right">Ultima Fecha de Actualizacion Usuario :</div>
            </td>
            <td nowrap width="34%" > 
            	<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(invInst.getE01ISIUPM()),Integer.parseInt(invInst.getE01ISIUPD()),Integer.parseInt(invInst.getE01ISIUPY()))%>
            </td>   
            <td nowrap width="34%" > 
              <div align="right">Perfil Usuario :</div>
            </td>
            <td nowrap width="66%" > 
              <input type="text" name="E01ISIUSR" size="11" maxlength="10" value="<%= invInst.getE01ISIUSR()%>" readonly>
            </td>           
          </tr>
          <tr id="trclear"> 
            <td nowrap width="34%" > 
              <div align="right">Ultima Fecha Actualización Bloomberg :</div>
            </td>
            <td nowrap width="34%" >
            	<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(invInst.getE01ISIBLM()),Integer.parseInt(invInst.getE01ISIBLD()),Integer.parseInt(invInst.getE01ISIBLY()))%> 
            </td>
            <td nowrap width="34%" > 
              <div align="right">Estado Proceso :</div>
            </td>
            <td nowrap width="66%" >
              <%
            	if(invInst.getE01ISIMOD().equals("M")) { out.print("N/A");}
            	else if(invInst.getE01ISIUST().equals("0")) { out.print("OK");}
            	else if(invInst.getE01ISIUST().equals("1")) { out.print("Error-No Incluido en archivo de solicitud.");}
				else out.print(" ");
			  %>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%
    }
  %>
 
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
  <div align="center"> 
	   <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(2);" >
  </div>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td> 
        <div align="center"> </div>
      </td>
    </tr>
  </table>
 
  </form>
</body>
<% if (!(userPO.getPurpose().equals("N") || userPO.getPurpose().equals("M"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=invInst"> </script>
</html>
