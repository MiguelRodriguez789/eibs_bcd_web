<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ page import = "datapro.eibs.master.*" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.eibs.constants.StyleID"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Otros Conceptos a Reliquidar</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV112001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

//ADD LISTENER TO PAGE
addEventHandler(document, 'DOMContentLoaded', function() {
	
	//Commision
    addEventHandler(getElement('ACHCOA'), 'change', function() {
        getElement('E01FLGCOA').value = "X";
        getElement('ACHIVA').value = "0.00";
    });
    
    addEventHandler(getElement('OFCCOA'), 'change', function() {
    	getElement('E01FLGCOA').value = "X";
    	getElement('OFCIVA').value = "0.00";
    });	    
    
    //Impuesto
    addEventHandler(getElement('ACHTXA'), 'change', function() {
    	getElement('E01FLGTXA').value = "X";
    });	    
    
    addEventHandler(getElement('LNSTXA'), 'change', function() {
    	getElement('E01FLGTXA').value = "X";
    });	 
    
    addEventHandler(getElement('OFCTXA'), 'change', function() {
    	getElement('E01FLGTXA').value = "X";
    });	  
    
});	


function chgPago(val){ 		
	getElement("E01ORLPFL").value = val;
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

</script>
</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
	boolean newOnly=false;
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
	// Determina si es nuevo o mantencion
	if (userPO.getHeader20().equals("NEW")){
		newOnly=true;
	} else if (userPO.getHeader20().equals("MAINTENANCE")) {
   		newOnly=false;
	} else {
   		newOnly=true;		
	}
%>

<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA DE OTROS CONCEPTOS A RELIQUIDAR
<%} else if (newOnly){ %>
	NUEVO PARA OTROS CONCEPTOS A RELIQUIDAR
<%} else { %>
	MANTENIMIENTO DE OTROS CONCEPTOS A RELIQUIDAR
<%} %>

 <% String emp = (String)session.getAttribute("EMPRN");
 	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
 %>
 <%if ("".equals(emp)){ %> 
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reliquidar_maintenance.jsp, EPV1120"></h3>
<hr size="4">
<%}%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1120" >
  <INPUT type=HIDDEN name="SCREEN"    id="SCREEN"    value="500">
  <input type=HIDDEN name="E01UBK"    id="E01UBK"    value="<%= currUser.getE01UBK().trim()%>">
  <input type=HIDDEN name="H01FLGMAS" id="H01FLGMAS" value="<%= datarec.getH01FLGMAS().trim()%>">
  <input type=HIDDEN name="E01ORLOGL" id="E01ORLOGL" value="<%= datarec.getE01ORLOGL().trim()%>">
  <input type=HIDDEN name="E01ORLTYP" id="E01ORLTYP" value="<%= datarec.getE01ORLTYP().trim()%>">
  <input type=HIDDEN name="prdCode" id="prdCode" value="<%= request.getAttribute("prdCode")%>">
  
 <% int row = 0;%>
 <%if ("".equals(emp)){ %> 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="10%" align="right"> Cliente : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="datarec" property="E01ORLCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Propuesta : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="datarec" property="E01ORLNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Sequencia :  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="datarec" property="E01ORLSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
             </td>
         </tr>
       </table>
      </td>
    </tr>
  </table>
  <%}else{%>
  	<input  type="hidden" name="E01ORLCUN" value="<%=datarec.getE01ORLCUN()%>">
  	<input  type="hidden" name="E01ORLNUM" value="<%=datarec.getE01ORLNUM()%>">
  	<input  type="hidden" name="E01ORLSEQ" value="<%=datarec.getE01ORLSEQ()%>"> 
  <%} %>

<%if ("".equals(emp)){ %>      
  <h4>Datos de Otros Conceptos a Reliquidar</h4>
<%} %>      
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td width="30%"> 
							<div align="right">Concepto :</div>
						</td>
						<td width="70%">
							<% if (readOnly) { %>
								<input type="text" name="E01ORLOPC" id="E01ORLOPC" value="<%= datarec.getE01ORLOPC().trim()%>" size="3" maxlength="3" <%=readOnly?"readonly":""%>>
								<eibsinput:text property="E01ORLDSC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" required="true" readonly="<%=readOnly%>"/>
							<% }else{ %>
								<input type="text" name="E01ORLOPC" id="E01ORLOPC" value="<%= datarec.getE01ORLOPC().trim()%>" size="3" maxlength="3" readonly>
									<a href="javascript:GetConcept('E01ORLDSC',getElement('E01UBK').value,'10','E01ORLOGL','E01ORLOPC','RN','E01ORLTYP','<%=userPO.getCurrency()%>',getElement('prdCode').value);">
										<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
									</a> 
								<eibsinput:text property="E01ORLDSC" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
							<% } %>
						</td>
					</tr>
					<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
						<td width="30%"> 
							<div align="right">Banco :</div>
						</td>
						<td width="70%">             
 			    			<eibsinput:text property="E01ORLOBK" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK%>" required="false" readonly="<%=readOnly%>"/>
						</td>
					</tr>
					<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td > 
							<div align="right">Sucursal :</div>
						</td>
						<td >
							<% if (readOnly) { %>
								<eibsinput:text name="datarec" property="E01ORLOBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="<%=readOnly%>"/>
							<% }else{ %>
								<eibsinput:help name="datarec" property="E01ORLOBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E01ORLOBR" fn_param_two="document.forms[0].E01ORLOBK.value" readonly="<%=readOnly%>"/>
							<% } %>
						</td>
					</tr>
					<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td > 
							<div align="right">Moneda :</div>
						</td>
						<td >
							<% if (readOnly) { %>
								<eibsinput:text name="datarec" property="E01ORLOCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="<%=readOnly%>"/>
							<% }else{ %>
								<eibsinput:help fn_param_one="E01ORLOCY" fn_param_two="document.forms[0].E01ORLOBK.value" name="datarec" property="E01ORLOCY" value="<%=userPO.getCurrency()%>" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="<%=readOnly%>"/>
							<% } %>
						</td>
					</tr>
					<tr > 
						<td colspan="2">
							<table id="selDefault" cellspacing="0" width="100%" border="0">
								<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
									<td> 
										<div align="right">Referencia :</div>
									</td>
									<td >
										<% if (readOnly) { %>
											<eibsinput:text name="datarec" property="REFOAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01ORLOAC().trim()%>"/>
										<% }else{ %>
											<eibsinput:help name="datarec" property="REFOAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" fn_param_one="REFOAC" fn_param_two="document.forms[0].E01UBK.value" fn_param_three="RT" readonly="<%=readOnly%>" value="<%= datarec.getE01ORLOAC().trim()%>"/>
										<% } %>
									</td>
								</tr>
								<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
									<td width="30%">  
										<div align="right">Monto a Reliquidar :</div>
									</td>
									<td width="70%">
										<eibsinput:text property="E01ORLOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01ORLOAM().trim()%>"/>
									</td>
								</tr>
			              	<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %>  
								<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
									<td width="30%">  
										<div align="right">Monto Afecto ITE :</div>
									</td>
									<td width="70%">
										<eibsinput:text property="E01ORLMAF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" value="<%= datarec.getE01ORLMAF().trim()%>"/>
									</td>
								</tr>
								<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
									<td width="30%">  
										<div align="right">Tasa del ITE :</div>
									</td>
									<td width="70%">
										<eibsinput:text property="E01ORLRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="<%=readOnly%>" value="<%= datarec.getE01ORLRTE().trim()%>"/>
									</td>
								</tr>
								<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'>
									<td width="30%">  
										<div align="right">Meses Calculados :</div>
									</td>
									<td width="70%">
										<eibsinput:text property="E01ORLNMH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2" readonly="<%=readOnly%>" value="<%= datarec.getE01ORLNMH().trim()%>"/>
									</td>
								</tr>
							<% } %>
							</table>
						</td>  
					</tr>
				</table>
			</td>
		</tr>
	</table>
  


   <%if  (!readOnly) { %>
      <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit"  value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
      </div>
    <% } else { %>
      <div align="center"> 
          <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
      </div>     
    <% } %>  
    
</form>

<% if ("S".equals(request.getAttribute("ACT"))){ %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1120?SCREEN=101&E01ORLCUN=<%=userPO.getCusNum()%>&E01ORLNUM=<%=userPO.getPorfNum()%>&prdCode=<%=userPO.getProdCode()%>"';	   	   
/* 	window.opener.location.reload(true);
 */	cerrarVentana();	  
</script>
<% } %>

<script type="text/javascript">
	
	
	function goAction(type, elemName){
		
		var element = getElement(elemName); 
		element.value = opener.parent.document.forms[0]["SALNET"].value; 
		if (typeof element.onchange === "function") element.onchange();
	}
	
	<%if(readOnly){%> // If Inquiry, Always Remove Button
		var buttons = document.getElementsByClassName("styled-button-Search");
			Array.prototype.filter.call(buttons, function(buttons){
			    return buttons.style.display = 'none';
		});
	<% } else {%> //If Saldo is <=0, Remove Button
	if(parseFloat(opener.parent.document.forms[0]["SALNET"].value) <= 0){
		var buttons = document.getElementsByClassName("styled-button-Search");
		Array.prototype.filter.call(buttons, function(buttons){
		    return buttons.style.display = 'none';
		});
	}	
	<% } %>
	
	
	
</script>
 
</body> 
</HTML>