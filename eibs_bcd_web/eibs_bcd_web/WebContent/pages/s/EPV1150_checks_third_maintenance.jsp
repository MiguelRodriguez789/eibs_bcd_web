<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Cheques a Terceros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV115001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
    document.forms[0].submit();		
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
	} else {
   		newOnly=false;		
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
	CONSULTA DE CHEQUE A TERCEROS
<%} else if (newOnly){ %>
	NUEVO CHEQUE A TERCEROS
<%} else { %>
	MANTENIMIENTO DE CHEQUE A TERCEROS
<%} %>

 <% String emp = (String)session.getAttribute("EMPCT");
 	emp = (emp==null)?"":emp;//si es blanco viene llamado por menu, sino viene llamdo desde la pantalla EPV1010
 %>
 <%if ("".equals(emp)){ %> 
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="checks_third_maintenance.jsp, EPV1150"></h3>
<hr size="4">
<%}%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01UBK"  value="<%= currUser.getE01UBK().trim()%>">
  <input type=HIDDEN name="H01FLGMAS"  value="<%= datarec.getH01FLGMAS().trim()%>">
  <input type=HIDDEN name="E01PVCBC1"  value="<%= datarec.getE01PVCBC1().trim()%>">
  <input type=HIDDEN name="E01PVCBC2"  value="<%= datarec.getE01PVCBC2().trim()%>">
  <input type=HIDDEN name="E01PVCBD1"  value="<%= datarec.getE01PVCBD1().trim()%>">
  <input type=HIDDEN name="E01PVCBD2"  value="<%= datarec.getE01PVCBD2().trim()%>">
  <input type=HIDDEN name="E01PVCTXP"  value="<%= datarec.getE01PVCTXP().trim()%>">
  <input type=HIDDEN name="E01PVCTXB"  value="<%= datarec.getE01PVCTXB().trim()%>">


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
	  			<eibsinput:text name="datarec" property="E01PVCCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Propuesta : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="datarec" property="E01PVCNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Sequencia :  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="datarec" property="E01PVCSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
             </td>
         </tr>
       </table>
      </td>
    </tr>
  </table>
  <%}else{%>
  	<input  type="hidden" name="E01PVCCUN" value="<%=datarec.getE01PVCCUN()%>">
  	<input  type="hidden" name="E01PVCNUM" value="<%=datarec.getE01PVCNUM()%>">
  	<input  type="hidden" name="E01PVCSEQ" value="<%=datarec.getE01PVCSEQ()%>"> 
  <%} %>

<%if ("".equals(emp)){ %>      
  <h4>Datos del Cheque</h4>
<%} %>      
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
             <td width="15%"> 
              <div align="right">Identificacion :</div>
            </td>
            <td width="35%">
			<%if (readOnly){ %>
	              <eibsinput:text property="E01PVCRUT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>"  readonly="true" />
		    <% } else { %>
			      <eibsinput:text property="E01PVCRUT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" required="true" />
	              <a href="javascript:GetBeneficiaryId('E01PVCRUT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"></a> 
		    <% } %>  
            </td>
           <td width="15%"> 
              <div align="right">Cliente :</div>
            </td>
            <td width="35%">             
				<eibsinput:help name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01PVCCCU" fn_param_one="E01PVCCCU" fn_param_two="E01PVCNME" fn_param_three="E01PVCRUT"   readonly="<%=readOnly %>"/>
            </td>
          </tr>

          <tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td > 
              <div align="right">Nombre :</div>
            </td>
            <td colspan="3">
            	<eibsinput:text name="datarec" property="E01PVCNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="true" readonly="<%=readOnly%>"/>
            </td>
          </tr>

          <tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td > 
              <div align="right">Direccion   :</div>
            </td>
            <td colspan="3">
            	<eibsinput:text name="datarec" property="E01PVCAD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/> <br>
            	<eibsinput:text name="datarec" property="E01PVCAD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/> <br>
            	<eibsinput:text name="datarec" property="E01PVCAD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/>
            </td>
          </tr>

          <tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td > 
              <div align="right">Descripci&oacute;n   :</div>
            </td>
            <td colspan="3">
            	<eibsinput:text name="datarec" property="E01PVCDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="<%=readOnly%>"/> <br>
            </td>
          </tr>

          <tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td > 
              <div align="right">Destino Fondos:</div>
            </td>
            <td colspan="3">
                 <eibsinput:cnofc name="datarec" property="E01PVCDST" required="false" flag="38" fn_code="E01PVCDST" fn_description="E01DSCDST" readonly="<%=readOnly%>"/>
                 <eibsinput:text property="E01DSCDST" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true"/>
            </td>
          </tr>

          <tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td > 
              <div align="right">Monto del Cheque:</div>
            </td>
            <td >
				<eibsinput:text name="datarec" property="E01PVCVAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>"/>              
	        </td>
            <td> 
            	<div align="right">Sucursal:</div>
            </td>
            <td >
            	<% if (readOnly) { %>
	                 <eibsinput:text property="E01PVCBRN" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" required="true" readonly="true"/>
            	<%}else{ %>  
            		<eibsinput:help fn_param_one="E01UBK" property="E01PVCBRN" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" />
				<% } %>
	        </td>
          </tr>

          <tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td > 
              <div align="right">Impuesto :</div>
            </td>
            <td colspan="3">
                 <eibsinput:text property="E01PVCTXA" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>

          <tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td > 
              <div align="right">Total :</div>
            </td>
            <td colspan="3">
                 <eibsinput:text property="E01PVCTOT" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>"/>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
   <%if  (!readOnly) { %>
      <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
      </div>
    <% } else { %>
      <div align="center"> 
          <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
      </div>     
    <% } %>  
    
  </form>
 <%if ("S".equals(request.getAttribute("ACT"))){%>
 <script type="text/javascript">
 	  // recargamos la pagina que nos llamo..	  
	  window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1150?SCREEN=101&E01PVCCUN=<%=userPO.getCusNum()%>&E01PVCNUM=<%=userPO.getPorfNum()%>';	   	   
  	  //cerramos la ventana
  	  cerrarVentana();	  
 </script>
 <% } %>  
</body> 
</HTML>