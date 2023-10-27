<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="com.datapro.constants.Entities"%> 
<html>
<head>
<title>Polizas de Seguros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ESG001001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
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

 function modoRecaudacion() {
	// 2=DebitoCtaCte/Ahorros  3=Caja  7=Endosado
	if (getElement("E01PACRCD").value == ('2')){
		getElement("blanco1").style.display = 'none';
		getElement("blanco2").style.display = 'none';
		getElement("debCta1").style.display = 'table-cell';
		getElement("debCta2").style.display = 'table-cell';
		getElement("cjaCnt1").style.display = 'none';
		getElement("cjaCnt2").style.display = 'none';
	} else if (getElement("E01PACRCD").value == ('3')){
		getElement("blanco1").style.display = 'none';
		getElement("blanco2").style.display = 'none';
		getElement("debCta1").style.display = 'none';
		getElement("debCta2").style.display = 'none';
		getElement("cjaCnt1").style.display = 'table-cell';
		getElement("cjaCnt2").style.display = 'table-cell';
	} else {
		getElement("blanco1").style.display = 'table-cell';
		getElement("blanco2").style.display = 'table-cell';
		getElement("debCta1").style.display = 'none';
		getElement("debCta2").style.display = 'none';
		getElement("cjaCnt1").style.display = 'none';
		getElement("cjaCnt2").style.display = 'none';
	}
 }
 
 function SendInfo(){
   <%--Function Called on Submit Button. Places Values in Correct Fields --%>
   // 2=DebitoCtaCte/Ahorros  3=Caja  7=Endosado
   if (getElement("E01PACRCD").value == ('3')) {
     getElement("E01PACPAC").value = getElement("TMPPACPAC").value;
   }
 }
 
</script>
</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
	boolean inqOnly=false;
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
<%
	// Determina si es solo consulta
	if (request.getParameter("inqOnly") != null ){
		if (request.getParameter("inqOnly").toLowerCase().equals("true")){
			inqOnly=true;
		} else {
			inqOnly=false;
		}
	}
%>

<body onload="modoRecaudacion();">
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
	CONSULTA POLIZA DE SEGURO
<%} else if (maintenance){ %>
	MANTENIMIENTO POLIZA DE SEGURO
<%} else { %>
	NUEVA POLIZA DE SEGURO
<% } %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="PAC_seguros_maintenance.jsp, ESG0010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01PACBNK"  value="<%= currUser.getE01UBK().trim()%>">
  <input type=HIDDEN name="H01FLGMAS"  value="<%= cnvObj.getH01FLGMAS().trim()%>">
  <input type=HIDDEN name="Customer"  value="<%= cnvObj.getE01PACCUN().trim()%>">
 
  <%int row = 0; %>
 <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
             <td nowrap width="10%" align="right"> Cliente Numero : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E01PACCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Nombre : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="cnvObj" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Identificación :  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E01CUSIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
         </tr>
          <tr id="trdark" style="display: <% if (cnvObj.getE01PACNUM().trim().equals("999999999999")) { out.print("none");} %>">
             <td nowrap width="10%" align="right"> Seguro Numero : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E01PACNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> 
               </td>
             <td nowrap width="50%"align="left">
             </td>
             <td nowrap width="10%" align="right"> 
             </td>
             <td nowrap width="10%" align="left">
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Poliza de Seguro </h4>
    
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Descripcion :</div>
            </td>
            <td width="35%" > 
                 <eibsinput:text property="E01PACDSC" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="<%=readOnly%>" modified="F01PACDSC"/>
	        </td>
            <td width="15%" > 
              <div align="right">Poliza Numero :</div>
            </td>
            <td width="35%" > 
                 <eibsinput:text name="cnvObj" property="E01PACPLZ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE%>" required="false" readonly="<%=readOnly%>" modified="F01PACPLZ"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%" > 
              <div align="right">Seguro :</div>
            </td>
            <td width="35%" > 
				<eibsinput:help name="cnvObj" property="E01PACCOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" 					fn_param_one="E01PACCOD" fn_param_two="E01SEGNME" fn_param_three="I" readonly="<%=readOnly%>" modified="F01PACCOD"/>
                 <eibsinput:text property="E01SEGNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true" modified="F01PACCOD"/>
	        </td>
           <td width="15%"> 
              <div align="right">Fecha Incicio :</div>
            </td>
            <td width="35%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01PACFIY" fn_month="E01PACFIM" fn_day="E01PACFID" readonly="<%=readOnly%>" modified="F01PACFIY;F01PACFIM;F01PACFID"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Plan :</div>
            </td>
		<%  if (readOnly) { %>
              <td width="35%" > 
              	<input type="text" name="E01PACPLN" size="3" maxlength="2" value="<%= cnvObj.getE01PACPLN().trim()%>" readonly <% if (cnvObj.getF01PACPLN().equals("Y")) out.print("class=\"txtchanged\""); %>>
              	<eibsinput:text property="E01PLNNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" size="40" maxlength="40" readonly="true" modified="F01PACPLN"/>
	          </td>
        <% } else { %>
            <td width="35%" > 
              <input type="text" name="E01PACPLN" size="3" maxlength="2" value="<%= cnvObj.getE01PACPLN().trim()%>" <% if (cnvObj.getF01PACPLN().equals("Y")) out.print("class=\"txtchanged\""); %>>
              <a href="javascript:GetTablaSeguros('E01PACPLN',document.forms[0].E01PACCOD.value,'E01PLNNME')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
                 <eibsinput:text property="E01PLNNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" size="40" maxlength="40" readonly="true" modified="F01PACPLN"/>
	        </td>
 		<% } %>	                
           <td width="15%"> 
              <div align="right">Fecha Vencimiento :</div>
            </td>
            <td width="35%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01PACFVY" fn_month="E01PACFVM" fn_day="E01PACFVD" readonly="<%=readOnly%>" modified="F01PACFVY;F01PACFVM;F01PACFVD"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%" > 
              <div align="right">Moneda Seguro :</div>
            </td>
            <td width="35%" > 
 	 			<eibsinput:text name="cnvObj" property="E01PACCYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="false" readonly="true" modified="F01PACCYS"/>
	        </td>
           <td width="15%"> 
              <div align="right">Monto Asegurado :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACMTS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="<%=readOnly%>" modified="F01PACMTS"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Moneda Prima :</div>
            </td>
            <td width="35%" > 
 	 			<eibsinput:text name="cnvObj" property="E01PACCYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="false" readonly="true" modified="F01PACCYP"/>
	        </td>
           <td width="15%"> 
              <div align="right">Monto Prima :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACMTP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="<%=readOnly%>" modified="F01PACMTP"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%" > 
              <div align="right">Compañia :</div>
            </td>
            <td width="35%" > 
				<eibsinput:cnofc name="cnvObj" property="E01PACCIA" required="false" flag="IT" fn_code="E01PACCIA" fn_description="E01CIANME" readonly="<%=readOnly %>" size="4" maxlength="4" />
				<eibsinput:text property="E01CIANME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" size="40" maxlength="40" readonly="<%=readOnly %>" modified="F01PACCIA"/>
	        </td>
           <td width="15%"> 
              <div align="right">Prima Total :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACPRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEREST %>" readonly="<%=readOnly%>" modified="F01PACPRT"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Estado :</div>
            </td>   
            <td width="35%" > 
 			  <div >
               <select name="E01PACSTS" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACSTS().equals("Y")) out.print("class=\"txtchanged\""); %>>
                    <option value="1" <% if (cnvObj.getE01PACSTS().equals("1")) out.print("selected"); %>>Vigente</option>
                    <option value="2" <% if (cnvObj.getE01PACSTS().equals("2")) out.print("selected"); %>>Cancelado</option>                   
                    <option value="3" <% if (cnvObj.getE01PACSTS().equals("3")) out.print("selected"); %>>Bloqueado</option>                   
                    <option value="4" <% if (cnvObj.getE01PACSTS().equals("4")) out.print("selected"); %>>Suspendido</option>                   
                  </select>
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
			  </div>
	        </td>	             
           <td width="15%"> 
              <div align="right">Fecha contrato :</div>
            </td>
            <td width="35%"> 
    	        <eibsinput:date name="cnvObj" fn_year="E01PACFCY" fn_month="E01PACFCM" fn_day="E01PACFCD" readonly="<%=readOnly%>" modified="F01PACFCY;F01PACFCM;F01PACFCD"/>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  <h4>Cuenta Abono </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">	
            <td width="15%" > 
              <div align="right">Cuenta Contable Abono :</div>
            </td>
            <td width="35%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACABK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="<%=readOnly%>" modified="F01PACABK"/>
 		        <eibsinput:help name="cnvObj" property="E01PACABR" fn_param_one="E01PACABR" fn_param_two="document.forms[0].E01PACABK.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>"  readonly="<%=readOnly%>" modified="F01PACABR" />
 		        <eibsinput:help name="cnvObj" property="E01PACACY" fn_param_one="E01PACACY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>"  readonly="<%=readOnly %>" modified="F01PACACY" />
 		        <eibsinput:help name="cnvObj" property="E01PACAGL" fn_param_one="E01PACAGL" fn_param_two="document.forms[0].E01PACABK.value" fn_param_three="document.forms[0].E01PACACY.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="<%=readOnly%>" modified="F01PACAGL" />
            </td>
            <td width="15%" > 
            </td>
            <td width="35%" > 
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%" > 
              <div align="right">Cta Cte/Ahorros Abono :</div>
            </td>
            <td width="35%" > 
 				<eibsinput:help name="cnvObj" property="E01PACAAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E01PACAAC" fn_param_two="document.forms[0].E01PACBNK.value" fn_param_three="RT" readonly="<%=readOnly %>" modified="F01PACAAC"/>
		        </td>
           <td width="15%"> 
            </td>
            <td width="35%"> 
            </td>
          </tr>
          

        </table>
      </td>
    </tr>
  </table>


  <h4>Recaudación </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Modo Recaudación :</div>
            </td>
            <td width="35%" > 
				<select name="E01PACRCD" id="E01PACRCD" onchange="modoRecaudacion();" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACRCD().equals("Y")) out.print("class=\"txtchanged\""); %>>
					<option></option>
					<!--  
					<option value="1" <% if (cnvObj.getE01PACRCD().equals("1")) out.print("selected");%>>Convenio</option>
					-->
					<option value="2" <% if (cnvObj.getE01PACRCD().equals("2")) out.print("selected");%>>Debito Cta Cte/Ahorros</option>
					<option value="3" <% if (cnvObj.getE01PACRCD().equals("3")) out.print("selected");%>>Caja</option>
					<!--  
					<option value="4" <% if (cnvObj.getE01PACRCD().equals("4")) out.print("selected");%>>Transferencia ACH</option>
					-->
					<% if (readOnly) { %>
					<option value="5" <% if (cnvObj.getE01PACRCD().equals("5")) out.print("selected");%>>Préstamo</option>
					<option value="6" <% if (cnvObj.getE01PACRCD().equals("6")) out.print("selected");%>>Apertura Prestamo</option>
					<% } %>
					<option value="7" <% if (cnvObj.getE01PACRCD().equals("7")) out.print("selected");%>>Endosado</option>
				</select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
          </td>
            <td width="15%" id="blanco1" style="display: none;"></td>
            <td width="35%" id="blanco2" style="display: none;"></td>
            <td width="15%" id="debCta1" style="display: none;"> 
              <div align="right">Debito a Cuenta :</div>
            </td>
            <td width="35%" id="debCta2" style="display: none;"> 
              <eibsinput:help name="cnvObj" property="E01PACPAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E01PACPAC" fn_param_two="document.forms[0].E01PACBNK.value" fn_param_three="RY" fn_param_four="N" fn_param_five="document.forms[0].E01PACCUN.value" readonly="<%=readOnly %>" modified="F01PACPAC"/>
            </td>
            <td width="15%" id="cjaCnt1" style="display: none;"> 
              <div align="right">Transacción :</div>
            </td>
            <td width="35%" id="cjaCnt2" style="display: none;"> 
              <eibsinput:cnofc name="cnvObj" flag="13" property="E01PACSTE" fn_code="E01PACSTE" fn_description="" readonly="<%=readOnly %>" />
              Referencia: 
              <input type="text" name="TMPPACPAC" size="12" maxlength="13" <%=readOnly?"readonly":""%> value="<%=cnvObj.getE01PACPAC()%>" >
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Frecuencia Pago :</div>
            </td>
            <td width="35%"> 
			   <div <% if (cnvObj.getF01PACFRE().equals("Y")) out.print("class=\"txtchanged\""); %>>
				<select name="E01PACFRE" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACFRE().equals("Y")) out.print("class=\"txtchanged\""); %>>
					<option></option>
					<option value="U" <% if (cnvObj.getE01PACFRE().equals("U")) out.print("selected");%>>Pago Unico</option>
					<option value="D" <% if (cnvObj.getE01PACFRE().equals("D")) out.print("selected");%>>Diario</option>
					<option value="M" <% if (cnvObj.getE01PACFRE().equals("M")) out.print("selected");%>>Mensual</option>
					<option value="S" <% if (cnvObj.getE01PACFRE().equals("S")) out.print("selected");%>>Semestral</option>					
					<option value="Y" <% if (cnvObj.getE01PACFRE().equals("Y")) out.print("selected");%>>Anual</option>
				</select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
			  </div>
            </td>
            <td width="15%" > 
            </td>
            <td width="35%" > 
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Dia del cargo :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACDYS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=readOnly %>" modified="F01PACDYS"/>
            </td>
            <td width="15%" > 
              <div align="right">Numero de Pagos :</div>
            </td>
            <td width="35%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACNPM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="true" readonly="<%=readOnly %>" modified="F01PACNPM"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Primas Mora Máxima :</div>
            </td>
            <td width="35%" > 
                <div align="left"> 
 		        <eibsinput:text name="cnvObj" property="E01PACMPI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="true" modified="F01PACMPI"/>
                </div>
	        </td>
           <td width="15%"> 
              <div align="right">Días Mora Máxima :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACMMR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="true" modified="F01PACMMR"/>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">	
            <td width="15%" > 
              <div align="right">Maximo Insistencias :</div>
            </td>
            <td width="35%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACMIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"  readonly="true" modified="F01PACMIN"/>
            </td>
            <td width="15%" > 
              <div align="right">% Intermediacion :</div>
            </td>
            <td width="35%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="true" modified="F01PACPIN"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" > 
              <div align="right">Préstamo Nro : </div>
            </td>
            <td width="35%" > 
                <div align="left"> 
 				<eibsinput:help name="cnvObj" property="E01PACACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E01PACACC" fn_param_two="document.forms[0].E01PACBNK.value" fn_param_three="10" fn_param_four="N" fn_param_five="document.forms[0].E01PACCUN.value" readonly="<%=readOnly %>" modified="F01PACACC"/>
               </div>
	        </td>
            <td width="15%" > 
              <div align="right">Monto Base :</div>
            </td>
            <td width="35%" > 
	              <select name="E01PACBSE" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACBSE().equals("Y")) out.print("class=\"txtchanged\"");%> <% if (cnvObj.getF01PACBSE().equals("Y")) out.print("class=\"txtchanged\""); %>>
	                <option value="O" <% if (cnvObj.getE01PACBSE().equals("O")) out.print("selected"); %>>Monto Original</option>
	                <option value="B" <% if (cnvObj.getE01PACBSE().equals("B")) out.print("selected"); %>>Saldo Capital</option>
	                <option value="I" <% if (cnvObj.getE01PACBSE().equals("I")) out.print("selected"); %>>Saldo Teorico</option>
	                <option value="T" <% if (cnvObj.getE01PACBSE().equals("T")) out.print("selected"); %>>Total Deuda</option>
	                <option value="C" <% if (cnvObj.getE01PACBSE().equals("C")) out.print("selected"); %>>Valor Cuota</option>
	               </select>
	        </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  
  <h4>Beneficiarios </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           <td width="10%" > 
           </td>
           <td width="5%" > 
              <div align="center">Nro</div>
           </td>
           <td width="15%" > 
              <div align="center">Rut</div>
           </td>
           <td width="30%" > 
              <div align="center">Nombre</div>
           </td>
           <td width="10%" > 
              <div align="center">Telefono</div>
           </td>
           <td width="10%" > 
              <div align="Center">Relación</div>
           </td>
           <td width="5%" > 
              <div align="center">%</div>
           </td>
           <td width="10%" > 
           </td>
          </tr>

         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td width="10%" > 
           </td>
           <td width="5%" > 
              <div align="center">1</div>
           </td>
           <td width="15%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACRT1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>" modified="F01PACRT1"/>
           </td>
           <td width="30%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACNM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>" modified="F01PACNM1"/>
           </td>
           <td width="10%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPH1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>" modified="F01PACPH1"/>
           </td>
           <td width="10%" > 
                  <select name="E01PACRL1" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACRL1().equals("Y")) out.print("class=\"txtchanged\""); %>>
                    <option value=" " <% if (!(cnvObj.getE01PACRL1().equals("1")||cnvObj.getE01PACRL1().equals("2") || cnvObj.getE01PACRL1().equals("3")||cnvObj.getE01PACRL1().equals("4")||cnvObj.getE01PACRL1().equals("5")||cnvObj.getE01PACRL1().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01PACRL1().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
                    <option value="2" <% if (cnvObj.getE01PACRL1().equals("2")) out.print("selected"); %>>Hijo</option>
                    <option value="3" <% if (cnvObj.getE01PACRL1().equals("3")) out.print("selected"); %>>Padre</option>
                    <option value="4" <% if (cnvObj.getE01PACRL1().equals("4")) out.print("selected"); %>>Madre</option>
                    <option value="5" <% if (cnvObj.getE01PACRL1().equals("5")) out.print("selected"); %>>Hermano(a)</option>
                    <option value="9" <% if (cnvObj.getE01PACRL1().equals("9")) out.print("selected"); %>>Otro</option>
                  </select>
           </td>
           <td width="5%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>" modified="F01PACPR1"/>
           </td>
           <td width="10%" > 
           </td>
          </tr>

         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           <td width="10%" > 
           </td>
           <td width="5%" > 
              <div align="center">2</div>
           </td>
           <td width="15%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACRT2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>" modified="F01PACRT2"/>
           </td>
           <td width="30%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACNM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>" modified="F01PACNM2"/>
           </td>
           <td width="10%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPH2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>" modified="F01PACPH2"/>
           </td>
           <td width="10%" > 
                  <select name="E01PACRL2" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACRL2().equals("Y")) out.print("class=\"txtchanged\""); %>>
                    <option value=" " <% if (!(cnvObj.getE01PACRL2().equals("1")||cnvObj.getE01PACRL2().equals("2") || cnvObj.getE01PACRL2().equals("3")||cnvObj.getE01PACRL2().equals("4")||cnvObj.getE01PACRL2().equals("5")||cnvObj.getE01PACRL2().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01PACRL2().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
                    <option value="2" <% if (cnvObj.getE01PACRL2().equals("2")) out.print("selected"); %>>Hijo</option>
                    <option value="3" <% if (cnvObj.getE01PACRL2().equals("3")) out.print("selected"); %>>Padre</option>
                    <option value="4" <% if (cnvObj.getE01PACRL2().equals("4")) out.print("selected"); %>>Madre</option>
                    <option value="5" <% if (cnvObj.getE01PACRL2().equals("5")) out.print("selected"); %>>Hermano(a)</option>
                    <option value="6" <% if (cnvObj.getE01PACRL2().equals("9")) out.print("selected"); %>>Otro</option>
                  </select>
           </td>
           <td width="5%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>" modified="F01PACPR2"/>
           </td>
           <td width="10%" > 
           </td>
          </tr>

         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td width="10%" > 
           </td>
           <td width="5%" > 
              <div align="center">3</div>
           </td>
           <td width="15%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACRT3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>" modified="F01PACRT3"/>
           </td>
           <td width="30%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACNM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>" modified="F01PACNM3"/>
           </td>
           <td width="10%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPH3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>" modified="F01PACPH3"/>
           </td>
           <td width="10%" > 
                  <select name="E01PACRL3" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACRL3().equals("Y")) out.print("class=\"txtchanged\""); %>>
                    <option value=" " <% if (!(cnvObj.getE01PACRL3().equals("1")||cnvObj.getE01PACRL3().equals("2") || cnvObj.getE01PACRL3().equals("3")||cnvObj.getE01PACRL3().equals("4")||cnvObj.getE01PACRL3().equals("5")||cnvObj.getE01PACRL3().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01PACRL3().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
                    <option value="2" <% if (cnvObj.getE01PACRL3().equals("2")) out.print("selected"); %>>Hijo</option>
                    <option value="3" <% if (cnvObj.getE01PACRL3().equals("3")) out.print("selected"); %>>Padre</option>
                    <option value="4" <% if (cnvObj.getE01PACRL3().equals("4")) out.print("selected"); %>>Madre</option>
                    <option value="5" <% if (cnvObj.getE01PACRL3().equals("5")) out.print("selected"); %>>Hermano(a)</option>
                    <option value="6" <% if (cnvObj.getE01PACRL3().equals("9")) out.print("selected"); %>>Otro</option>
                  </select>
           </td>
           <td width="5%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>" modified="F01PACPR3"/>
           </td>
           <td width="10%" > 
           </td>
          </tr>

         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           <td width="10%" > 
           </td>
           <td width="5%" > 
              <div align="center">4</div>
           </td>
           <td width="15%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACRT4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>" modified="F01PACRT4"/>
           </td>
           <td width="30%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACNM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>" modified="F01PACNM4"/>
           </td>
           <td width="10%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPH4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>" modified="F01PACPH4"/>
           </td>
           <td width="10%" > 
                  <select name="E01PACRL4" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACRL4().equals("Y")) out.print("class=\"txtchanged\""); %>>
                    <option value=" " <% if (!(cnvObj.getE01PACRL4().equals("1")||cnvObj.getE01PACRL4().equals("2") || cnvObj.getE01PACRL4().equals("3")||cnvObj.getE01PACRL4().equals("4")||cnvObj.getE01PACRL4().equals("5")||cnvObj.getE01PACRL4().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01PACRL4().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
                    <option value="2" <% if (cnvObj.getE01PACRL4().equals("2")) out.print("selected"); %>>Hijo</option>
                    <option value="3" <% if (cnvObj.getE01PACRL4().equals("3")) out.print("selected"); %>>Padre</option>
                    <option value="4" <% if (cnvObj.getE01PACRL4().equals("4")) out.print("selected"); %>>Madre</option>
                    <option value="5" <% if (cnvObj.getE01PACRL4().equals("5")) out.print("selected"); %>>Hermano(a)</option>
                    <option value="6" <% if (cnvObj.getE01PACRL4().equals("9")) out.print("selected"); %>>Otro</option>
                  </select>
           </td>
           <td width="5%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>" modified="F01PACPR4"/>
           </td>
           <td width="10%" > 
           </td>
          </tr>

         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td width="10%" > 
           </td>
           <td width="5%" > 
              <div align="center">5</div>
           </td>
           <td width="15%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACRT5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="<%=readOnly %>" modified="F01PACRT5"/>
           </td>
           <td width="30%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACNM5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>"  readonly="<%=readOnly %>" modified="F01PACNM5"/>
           </td>
           <td width="10%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPH5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>"  readonly="<%=readOnly %>" modified="F01PACPH5"/>
           </td>
           <td width="10%" > 
                  <select name="E01PACRL5" <%=readOnly?"disabled":""%> <% if (cnvObj.getF01PACRL5().equals("Y")) out.print("class=\"txtchanged\""); %>>
                    <option value=" " <% if (!(cnvObj.getE01PACRL5().equals("1")||cnvObj.getE01PACRL5().equals("2") || cnvObj.getE01PACRL5().equals("3")||cnvObj.getE01PACRL5().equals("4")||cnvObj.getE01PACRL5().equals("5")||cnvObj.getE01PACRL5().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE01PACRL5().equals("1")) out.print("selected"); %>>Esposo(a)</option>                   
                    <option value="2" <% if (cnvObj.getE01PACRL5().equals("2")) out.print("selected"); %>>Hijo</option>
                    <option value="3" <% if (cnvObj.getE01PACRL5().equals("3")) out.print("selected"); %>>Padre</option>
                    <option value="4" <% if (cnvObj.getE01PACRL5().equals("4")) out.print("selected"); %>>Madre</option>
                    <option value="5" <% if (cnvObj.getE01PACRL5().equals("5")) out.print("selected"); %>>Hermano(a)</option>
                    <option value="6" <% if (cnvObj.getE01PACRL5().equals("9")) out.print("selected"); %>>Otro</option>
                  </select>
           </td>
           <td width="5%" > 
 		        <eibsinput:text name="cnvObj" property="E01PACPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="<%=readOnly %>" modified="F01PACPR5"/>
           </td>
           <td width="10%" > 
           </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Propiedad </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="10%" > 
            </td>
           <td width="20%"> 
              <div align="right">Descripción :</div>
            </td>
            <td width="40%"> 
			<%if (readOnly){ %>
                <textarea name="E01PACRMK" cols="50" rows="5" readonly <% if (cnvObj.getF01PACRMK().equals("Y")) out.print("class=\"txtchanged\"");%>><%= cnvObj.getE01PACRMK()%> </textarea>
			<%} else { %>
                <textarea name="E01PACRMK" cols="50" rows="5" <% if (cnvObj.getF01PACRMK().equals("Y")) out.print("class=\"txtchanged\"");%>><%= cnvObj.getE01PACRMK()%> </textarea>
		    <% } %>  
            </td>
            <td width="10%" > 
	        </td>
          </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="10%" > 
            </td>
           <td width="20%"> 
              <div align="right">Dirección :</div>
            </td>
            <td width="40%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="<%=readOnly %>" modified="F01PACMA1"/>
            </td>
            <td width="10%" > 
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="10%" > 
            </td>
           <td width="20%"> 
              <div align="right"> </div>
            </td>
            <td width="40%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly %>" modified="F01PACMA2"/>
            </td>
            <td width="10%" > 
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="10%" > 
            </td>
           <td width="20%"> 
              <div align="right"> </div>
            </td>
            <td width="40%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly %>"  modified="F01PACMA3"/>
            </td>
            <td width="10%" > 
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="10%" > 
            </td>
           <td width="20%"> 
              <div align="right"> </div>
            </td>
            <td width="40%"> 
 		        <eibsinput:text name="cnvObj" property="E01PACMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly %>" modified="F01PACMA4"/>
            </td>
            <td width="10%" > 
	        </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  <h4>Vendedor </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
            </td>
           <td width="15%"> 
              <div align="right">Ejecutivo Cuenta :</div>
            </td>
            <td width="55%"> 
                 <eibsinput:cnofc name="cnvObj" property="E01PACOFI" required="false" flag="15" fn_code="E01PACOFI" fn_description="E01OFINME" readonly="<%=readOnly%>"/>
                 <eibsinput:text property="E01OFINME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true" modified="F01PACOFI"/>
            </td>
            <td width="15%" >
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%" > 
            </td>
           <td width="15%"> 
              <div align="right">Canal de venta :</div>
            </td>
            <td width="55%"> 
                 <eibsinput:cnofc name="cnvObj" property="E01PACCNL" required="false" flag="62" fn_code="E01PACCNL" fn_description="E01CNLNME" readonly="<%=readOnly%>"/>
                 <eibsinput:text property="E01CNLNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" modified="F01PACCNL"/>
            </td>
            <td width="15%" > 
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
            </td>
           <td width="15%"> 
              <div align="right">Oficina de venta :</div>
            </td>
            <td width="55%"> 
 	 			<eibsinput:help name="cnvObj" property="E01PACBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="false" readonly="<%=readOnly%>" fn_param_one="E01PACBRN" fn_param_two="document.forms[0].E01PACBNK.value" fn_param_three="E01BRNNME" modified="F01PACBRN"/>
                 <eibsinput:text property="E01BRNNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true"/>
            </td>
            <td width="15%" > 
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%" > 
            </td>
            <td width="15%" > 
              <div align="right">Vendedor del Seguro:</div>
            </td>
            <td width="55%" > 
				<eibsinput:help name="cnvObj" property="E01PACVDR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" fn_param_one="E01PACVDR" fn_param_two="E01VDRNME" fn_param_three="S" readonly="<%=readOnly%>"  modified="F01PACVDR"/>
                 <eibsinput:text property="E01VDRNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true" modified="F01PACVDR"/>
	        </td>
            <td width="15%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

      <% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(cnvObj.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Advertencias</h4>
  <% } %>
  
  
   <%if  (!readOnly) { %>
      <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" onclick="SendInfo()" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(1);">
      </div>
    <% } else if  (!inqOnly){ %>
      <div align="center"> 
          <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(1);">
      </div>    
    <% } %>  
  </form>
<script type="text/javascript">
function goAsign() {
	<%-- Server call to assign "convenio" to customer --%>
	var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0150?SCREEN=700";		
	CenterWindow(url, 30, 30, 2);		
}  
</script>
  
</body>
</HTML>
