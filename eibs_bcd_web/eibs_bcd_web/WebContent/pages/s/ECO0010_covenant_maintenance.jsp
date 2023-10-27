<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.constants.Entities"%> 

<html>
<head>
<title>Solicitud de Convenio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO001002Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

//  Process according with user selection
 function goAction(op) {
	
   	switch (op){
	//Cancel
	case 1:  {
 		document.forms[0].SCREEN.value = "101";
       	break;
		}
	}
	document.forms[0].submit();
 }
 
function callEntidadRelacionada(){
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010?SCREEN=203&E01COSNUM=" + document.forms[0].E02COSNUM.value;
	document.location.href = pg;
}

function callConsultaEvaluacionConv(){
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010?SCREEN=355&E01COSNUM=" + document.forms[0].E02COSNUM.value+"&E01EMPCUN="+document.forms[0].E02COSECU.value;
	document.location.href = pg;
}
 
 </script>
</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
%> 
          
<%
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
%>
<body>

<%	if (userPO.getPurpose().equals("INQUIRY")) { %>
	<SCRIPT type="text/javascript">
		builtNewMenu(covenat_qry_opt);
	</SCRIPT>
<% } %>

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA DE
<%} else if (maintenance){ %>
	MANTENIMIENTO DE
<%} else { %>
	NUEVA
<%} %>
SOLICITUD DE CONVENIO <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="convenant_maintenance.jsp, ECO0010"></h3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
			<% if (cnvObj.getH02FLGMAS().trim().equals("N")) {%>
				<input type=HIDDEN name="E02COSNUM"  value="<%= cnvObj.getE02COSNUM().trim()%>">
            <% }%>  
  
  <input type=HIDDEN name="H02FLGMAS"  value="<%= cnvObj.getH02FLGMAS().trim()%>">
 
  <table  class="tableinfo">
    <tr id="trdark"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
             <td nowrap width="10%" align="right"> Empleador: 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E02COSECU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Identificación:  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E02EMPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Nombre: 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="cnvObj" property="E02EMPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Antecedentes Empresa </h4>
  
  <%int row = 0; %>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Sector :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02EMPSEC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Ambito :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02EMPAMB" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
          </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right"> Sub-Sector :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02CONSEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Giro Comercial :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02EMPGRO" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Sitio Web :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02EMPWEB" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_WEB%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02EMPPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">email :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02EMPIAD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02EMPPH2" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Renta Bruta Promedio :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02COSEBP" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly %>"/>
            </td>
            <td width="25%" > 
              <div align="right">Numero de Funcionarios :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02COSEFU" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="<%=readOnly %>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%" > 
              <div align="right">Renta Neta Promedio :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02COSENP" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly %>"/>
            </td>
            <td width="25%"> 
              <div align="right">Inicio de Actividad :</div>
            </td>
            <td width="25%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E02EMPIDY" fn_month="E02EMPIDM" fn_day="E02EMPIDD" readonly="<%=readOnly%>"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Dirección Principal :</div>
            </td>
            <td width="25%"> 
	  			<%=cnvObj.getE02EMPMA1() %><br> <%=cnvObj.getE02EMPMA2() %><br><%=cnvObj.getE02EMPMA3() %><br><%=cnvObj.getE02EMPMA4() %>
            </td>
            <td width="25%" > 
              <div align="right"></div>
            </td>
            <td width="25%" > 
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informacion Solicitud </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Solicitud numero :</div>
            </td>
            <td width="25%" > 
            <% if (cnvObj.getH02FLGMAS().trim().equals("N")) {%>
              <div align="left">
                <input type="text" name="E02COSNUM2" size="15" maxlength="12" value="NUEVA CUENTA">
              </div>
            <% } else { %>
	  			<eibsinput:text name="cnvObj" property="E02COSNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" required="false" readonly="<%=readOnly%>"/>
            <% } %>
          </td>
            <td width="25%"> 
              <div align="right">Fecha Solicitud :</div>
            </td>
            <td width="25%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E02COSFIY" fn_month="E02COSFIM" fn_day="E02COSFID" readonly="<%=readOnly%>"/>
    	           
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%" > 
              <div align="right">Tipo Convenio :</div>
            </td>
            <td width="25%" > 
                 <eibsinput:cnofc name="cnvObj" property="E02COSCTY" required="false" flag="C1" fn_code="E02COSCTY" fn_description="D02COSCTY" readonly="<%=readOnly %>"/>
                 <eibsinput:text property="D02COSCTY" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
	        </td>
            <td width="25%"> 
              <div align="right">Estado :</div>
            </td>
            <td width="25%"> 
               <select name="E02COSSTS" <%=readOnly?"disabled":""%>>
                    <option value=" " <% if (!(cnvObj.getE02COSSTS().equals("1")||cnvObj.getE02COSSTS().equals("2") || cnvObj.getE02COSSTS().equals("3")|| cnvObj.getE02COSSTS().equals("4"))) out.print("selected"); %>> 
                    </option>
                    <option value="1" <% if (cnvObj.getE02COSSTS().equals("1")) out.print("selected"); %>>Pendiente</option>
                    <option value="2" <% if (cnvObj.getE02COSSTS().equals("2")) out.print("selected"); %>>Evaluado</option>                   
                    <option value="3" <% if (cnvObj.getE02COSSTS().equals("3")) out.print("selected"); %>>Vigente</option>                   
                    <option value="4" <% if (cnvObj.getE02COSSTS().equals("4")) out.print("selected"); %>>Expirado</option>                   
                  </select>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Codigo Oficial :</div>
            </td>
            <td width="25%"> 
                 <eibsinput:cnofc name="cnvObj" property="E02COSOFC" required="false" flag="15" fn_code="E02COSOFC" fn_description="D02COSOFC" readonly="<%=readOnly %>"/>
                 <eibsinput:text property="D02COSOFC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td width="25%" > 
  				<eibsinput:text name="cnvObj" property="E02COSBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="false" readonly="<%=readOnly%>"/>
 	 			<eibsinput:help name="cnvObj" property="E02COSBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E02COSBRN" fn_param_two="document.forms[0].E02COSBNK.value" required="false" readonly="<%=readOnly%>"/>
          </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  <h4>Entidad del Convenio </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Numero Cliente :</div>
            </td>
            <td width="25%" > 
				<eibsinput:help name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E02COSCCU" 
					fn_param_one="E02COSCCU" fn_param_two="E02CONNME" fn_param_three="E02CONIDN"   readonly="<%=readOnly %>"/>
          </td>
            <td width="25%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02CONIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02CONNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Inicio de Actividad :</div>
            </td>
            <td width="25%" > 
    	        <eibsinput:date name="cnvObj" fn_year="E02CONIDY" fn_month="E02CONIDM" fn_day="E02CONIDD" readonly="true"/>
    	           
            </td>
          </tr>
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Sitio Web :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02CONWEB" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_WEB%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02CONPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">email :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02CONIAD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02CONPH2" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Numero de Funcionarios :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02COSNFU" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="6" maxlength="5" readonly="<%=readOnly %>"/>
            </td>
            <td width="25%" > 
              <div align="right">Renta Bruta Promedio :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02COSRBP" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly %>"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%" > 
              <div align="right">Dirección :</div>
            </td>
            <td width="25%" > 
            <% if (readOnly) { %> 
              <input type="text" name="E02COSADR" id="E02COSADR" size="3" maxlength="2" value="<%= cnvObj.getE02COSADR().trim()%>" readonly>
            <% } else { %>
              <input type="text" name="E02COSADR" id="E02COSADR" size="3" maxlength="2" value="<%= cnvObj.getE02COSADR().trim()%>">
              <a href="javascript:GetMailing('E02COSADR',document.getElementById('E02COSCCU').value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
            <% } %>
	  		</td>
            <td width="25%" > 
              <div align="right">Renta Neta Promedio :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02COSRNP" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly %>"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right"></div>
            </td>
            <td width="25%" > 
	  			<%=cnvObj.getE02CONMA1() %><br> <%=cnvObj.getE02CONMA2() %><br><%=cnvObj.getE02CONMA3() %><br><%=cnvObj.getE02CONMA4() %>
            </td>            
            <td width="25%"> 
              <div align="right">Tipo Entidad :</div>
            </td>
            <td width="25%"> 
                <select name="E02COSTCO"  <%=readOnly?"disabled":""%>>
                <option value="1" <% if (cnvObj.getE02COSTCO().equals("1")) out.print("selected"); %>>Bienestar</option>
                <option value="2" <% if (cnvObj.getE02COSTCO().equals("2")) out.print("selected"); %>>Dir. Empresa</option>
                <option value="3" <% if (cnvObj.getE02COSTCO().equals("3")) out.print("selected"); %>>Depto RRHH</option>                                                				
                <option value="4" <% if (cnvObj.getE02COSTCO().equals("4")) out.print("selected"); %>>Sindicato</option>                                                				
                <option value="5" <% if (cnvObj.getE02COSTCO().equals("5")) out.print("selected"); %>>Asociacion</option>                                                				
          	   </select>
            </td>
          </tr>          

        </table>
      </td>
    </tr>
  </table>
 
  <h4>Representante Legal </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Numero :</div>
            </td>
            <td width="25%" > 
	  			<eibsinput:help name="cnvObj" property="E02COSRLG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY%>" fn_param_one="E02COSRLG" fn_param_two="E02RPLNME" fn_param_three="E02RPLIDN" fn_param_four="document.forms[0].E02COSCCU.value" fn_param_five="<%=Entities.ENTITY_TYPE_CUSTOMER_LEGAL_REPRESENTATIVES %>" fn_param_six="C" required="false" readonly="<%=readOnly%>"/>
          </td>
            <td width="25%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02RPLIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02RPLNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Sexo :</div>
            </td>
            <td width="25%" > 
 		       <p> 
                 <input type="radio" disabled name="E02RPLSEX"  value="F" <%if (cnvObj.getE02RPLSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02RPLSEX"  value="M" <%if (cnvObj.getE02RPLSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
	        </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Cargo :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02RPLCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Estado Civil</div>
            </td>
            <td width="25%" > 
               <select name="E02RPLBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02RPLBMS().equals("1")||cnvObj.getE02RPLBMS().equals("2") || cnvObj.getE02RPLBMS().equals("3")||cnvObj.getE02RPLBMS().equals("4")||cnvObj.getE02RPLBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02RPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02RPLBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02RPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02RPLBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02RPLBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02RPLBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02RPLBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02RPLBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02RPLBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02RPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02RPLBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02RPLBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02RPLBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02RPLBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02RPLBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
                </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">email :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02RPLIAD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02RPLPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Dirección :</div>
            </td>
            <td width="25%" > 
	  			<%=cnvObj.getE02RPLMA1() %><br> <%=cnvObj.getE02RPLMA2() %><br><%=cnvObj.getE02RPLMA3() %><br><%=cnvObj.getE02RPLMA4() %>
            </td>            
            <td width="25%"> 
              <div align="right"></div>
            </td>
            <td width="25%"> 
            </td>
          </tr>          

        </table>
      </td>
    </tr>
  </table>
  
  <h4>Contacto 1</h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">N&uacute;mero :</div>
            </td>
            <td width="25%" > 
	  			<eibsinput:help name="cnvObj" property="E02COSTIT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY %>" fn_param_one="E02COSTIT" fn_param_two="E02TCONME" fn_param_three="E02TCOIDN" fn_param_four="document.forms[0].E02COSCCU.value" fn_param_five="<%=Entities.ENTITY_TYPE_CONTACT %>" fn_param_six="C" required="false" readonly="<%=readOnly%>"/>
          </td>
            <td width="25%"> 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02TCOIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02TCONME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Sexo :</div>
            </td>
            <td width="25%" > 
 		       <p> 
                 <input type="radio" disabled name="E02TCOSEX"  value="F" <%if (cnvObj.getE02TCOSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02TCOSEX"  value="M" <%if (cnvObj.getE02TCOSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
	        </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Cargo :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02TCOCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Estado Civil</div>
            </td>
            <td width="25%" > 
               <select name="E02TCOBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02TCOBMS().equals("1")||cnvObj.getE02TCOBMS().equals("2") || cnvObj.getE02TCOBMS().equals("3")||cnvObj.getE02TCOBMS().equals("4")||cnvObj.getE02TCOBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02TCOBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02TCOBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02TCOBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02TCOBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02TCOBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02TCOBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02TCOBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02TCOBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02TCOBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02TCOBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02TCOBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02TCOBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02TCOBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02TCOBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02TCOBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
                </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">email :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02TCOIAD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02TCOPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Dirección :</div>
            </td>
            <td width="25%" > 
	  			<%=cnvObj.getE02TCOMA1() %><br> <%=cnvObj.getE02TCOMA2() %><br><%=cnvObj.getE02TCOMA3() %><br><%=cnvObj.getE02TCOMA4() %>
            </td>            
            <td width="25%"> 
              <div align="right"></div>
            </td>
            <td width="25%"> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Contacto 2 </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Numero :</div>
            </td>
            <td width="25%" > 
	  			<eibsinput:help name="cnvObj" property="E02COSEGS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY %>" fn_param_one="E02COSEGS" fn_param_two="E02EGENME" fn_param_three="E02EGEIDN" fn_param_four="document.forms[0].E02COSCCU.value" fn_param_five="<%=Entities.ENTITY_TYPE_CONTACT %>" fn_param_six="C" required="false" readonly="<%=readOnly%>"/>
          </td>
            <td width="25%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02EGEIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02EGENME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Sexo :</div>
            </td>
            <td width="25%" > 
 		       <p> 
                 <input type="radio" disabled name="E02EGESEX"  value="F" <%if (cnvObj.getE02EGESEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02EGESEX"  value="M" <%if (cnvObj.getE02EGESEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
	        </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Cargo :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02EGECRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Estado Civil</div>
            </td>
            <td width="25%" > 
               <select name="E02EGEBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02EGEBMS().equals("1")||cnvObj.getE02EGEBMS().equals("2") || cnvObj.getE02EGEBMS().equals("3")||cnvObj.getE02EGEBMS().equals("4")||cnvObj.getE02EGEBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02EGEBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EGEBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02EGEBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EGEBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02EGEBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02EGEBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02EGEBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02EGEBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02EGEBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02EGEBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EGEBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02EGEBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02EGEBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02EGEBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02EGEBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
                </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">email :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02EGEIAD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02EGEPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Dirección :</div>
            </td>
            <td width="25%" > 
	  			<%=cnvObj.getE02EGEMA1() %><br> <%=cnvObj.getE02EGEMA2() %><br><%=cnvObj.getE02EGEMA3() %><br><%=cnvObj.getE02EGEMA4() %>
            </td>            
            <td width="25%"> 
              <div align="right"></div>
            </td>
            <td width="25%"> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Contacto 3</h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Numero :</div>
            </td>
            <td width="25%" > 
	  			<eibsinput:help name="cnvObj" property="E02COSEPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY %>" fn_param_one="E02COSEPL" fn_param_two="E02EPLNME" fn_param_three="E02EPLIDN" fn_param_four="document.forms[0].E02COSCCU.value" fn_param_five="<%=Entities.ENTITY_TYPE_CONTACT %>" fn_param_six="C" required="false" readonly="<%=readOnly%>"/>	  			
          </td>
            <td width="25%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02EPLIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02EPLNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Sexo :</div>
            </td>
            <td width="25%" > 
 		       <p> 
                 <input type="radio" disabled name="E02EPLSEX"  value="F" <%if (cnvObj.getE02EPLSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02EPLSEX"  value="M" <%if (cnvObj.getE02EPLSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
	        </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Cargo :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02EPLCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Estado Civil</div>
            </td>
            <td width="25%" > 
               <select name="E02EPLBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02EPLBMS().equals("1")||cnvObj.getE02EPLBMS().equals("2") || cnvObj.getE02EPLBMS().equals("3")||cnvObj.getE02EPLBMS().equals("4")||cnvObj.getE02EPLBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02EPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EPLBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02EPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EPLBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02EPLBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02EPLBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02EPLBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02EPLBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02EPLBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02EPLBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02EPLBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02EPLBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02EPLBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02EPLBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02EPLBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
                </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">email :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02EPLIAD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02EPLPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Dirección :</div>
            </td>
            <td width="25%" > 
	  			<%=cnvObj.getE02EPLMA1() %><br> <%=cnvObj.getE02EPLMA2() %><br><%=cnvObj.getE02EPLMA3() %><br><%=cnvObj.getE02EPLMA4() %>
            </td>            
            <td width="25%"> 
              <div align="right"></div>
            </td>
            <td width="25%"> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Contacto 4</h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Numero :</div>
            </td>
            <td width="25%" > 
	  			<eibsinput:help name="cnvObj" property="E02COSPAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY %>" fn_param_one="E02COSPAP" fn_param_two="E02PAPNME" fn_param_three="E02PAPIDN" fn_param_four="document.forms[0].E02COSCCU.value" fn_param_five="<%=Entities.ENTITY_TYPE_CONTACT %>" fn_param_six="C" required="false" readonly="<%=readOnly%>"/>	  			
          </td>
            <td width="25%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02PAPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02PAPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Sexo :</div>
            </td>
            <td width="25%" > 
 		       <p> 
                 <input type="radio" disabled name="E02PAPSEX"  value="F" <%if (cnvObj.getE02PAPSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02PAPSEX"  value="M" <%if (cnvObj.getE02PAPSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
	        </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Cargo :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02PAPCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Estado Civil</div>
            </td>
            <td width="25%" > 
               <select name="E02PAPBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02PAPBMS().equals("1")||cnvObj.getE02PAPBMS().equals("2") || cnvObj.getE02PAPBMS().equals("3")||cnvObj.getE02PAPBMS().equals("4")||cnvObj.getE02PAPBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02PAPBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02PAPBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02PAPBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02PAPBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02PAPBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02PAPBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02PAPBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02PAPBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02PAPBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02PAPBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02PAPBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02PAPBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02PAPBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02PAPBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02PAPBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
                </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">email :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02PAPIAD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02PAPPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Dirección :</div>
            </td>
            <td width="25%" > 
	  			<%=cnvObj.getE02PAPMA1() %><br> <%=cnvObj.getE02PAPMA2() %><br><%=cnvObj.getE02PAPMA3() %><br><%=cnvObj.getE02PAPMA4() %>
            </td>            
            <td width="25%"> 
              <div align="right"></div>
            </td>
            <td width="25%"> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Contacto 5</h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%" > 
              <div align="right">Numero :</div>
            </td>
            <td width="25%" > 
	  			<eibsinput:help name="cnvObj" property="E02COSHAB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY %>" fn_param_one="E02COSHAB" fn_param_two="E02HABNME" fn_param_three="E02HABIDN" fn_param_four="document.forms[0].E02COSCCU.value" fn_param_five="<%=Entities.ENTITY_TYPE_CONTACT %>" fn_param_six="C" required="false" readonly="<%=readOnly%>"/>	  			
          </td>
            <td width="25%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02HABIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02HABNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Sexo :</div>
            </td>
            <td width="25%" > 
 		       <p> 
                 <input type="radio" disabled name="E02HABSEX"  value="F" <%if (cnvObj.getE02HABSEX().equals("F")) out.print("checked"); %>>
                  Femenino 
                 <input type="radio" disabled name="E02HABSEX"  value="M" <%if (cnvObj.getE02HABSEX().equals("M")) out.print("checked"); %>>
                   Masculino 
               </p> 
	        </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Cargo :</div>
            </td>
            <td width="25%"> 
	  			<eibsinput:text name="cnvObj" property="E02HABCRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Estado Civil</div>
            </td>
            <td width="25%" > 
               <select name="E02HABBMS" disabled>
                    <option value=" " <% if (!(cnvObj.getE02HABBMS().equals("1")||cnvObj.getE02HABBMS().equals("2") || cnvObj.getE02HABBMS().equals("3")||cnvObj.getE02HABBMS().equals("4")||cnvObj.getE02HABBMS().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (cnvObj.getE02HABBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02HABBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (cnvObj.getE02HABBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02HABBMS().equals("2")) out.print("selected"); %>>Casado(a) - Separacion Bienes</option>                   
                    <option value="3" <% if (cnvObj.getE02HABBMS().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (cnvObj.getE02HABBMS().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (cnvObj.getE02HABBMS().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (cnvObj.getE02HABBMS().equals("6")) out.print("selected"); %>>Separado</option>
                    <option value="7" <% if (cnvObj.getE02HABBMS().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (cnvObj.getE02HABBMS().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (cnvObj.getE02HABBMS().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (cnvObj.getE02HABBMS().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (cnvObj.getE02HABBMS().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (cnvObj.getE02HABBMS().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (cnvObj.getE02HABBMS().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
                </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
            <td width="25%"> 
              <div align="right">email :</div>
            </td>
            <td width="25%"> 
                <eibsinput:text property="E02HABIAD" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL%>" readonly="true"/>
            </td>
            <td width="25%" > 
              <div align="right">Telefono :</div>
            </td>
            <td width="25%" > 
                <eibsinput:text property="E02HABPHN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE%>" readonly="true"/>
            </td>
          </tr>
         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="25%"> 
              <div align="right">Dirección :</div>
            </td>
            <td width="25%" > 
	  			<%=cnvObj.getE02HABMA1() %><br> <%=cnvObj.getE02HABMA2() %><br><%=cnvObj.getE02HABMA3() %><br><%=cnvObj.getE02HABMA4() %>
            </td>            
            <td width="25%"> 
              <div align="right"></div>
            </td>
            <td width="25%"> 
            </td>
          </tr>          
        </table>
      </td>
    </tr>
  </table>
 
     <%if  (!readOnly) { %>
       <div align="center"> 
           <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(1);">
       </div>
     <% } else { %>
       <div align="center"> 
           <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(1);">
       </div>     
     <% } %>  
  </form>
</body>
</HTML>
