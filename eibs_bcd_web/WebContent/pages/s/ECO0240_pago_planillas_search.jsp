<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="header" class="datapro.eibs.beans.ECO024001Message" scope="session" />

<title>Solicitud de convenio</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript">

  function validar(){
  	  if (document.forms[0].Type[0].checked==true){
		  if (trim(document.forms[0].E01SELECU.value)=="" || trim(document.forms[0].E01SELECU.value)=="0" ){
		  	alert("Debe ingresar un numero de Cliente a buscar");
		  	document.forms[0].E01SELECU.focus();
		  	return false;
		  }
	  }else  if (document.forms[0].Type[1].checked==true){
		  if (trim((document.forms[0].E01SELNUM.value)=="" || trim(document.forms[0].E01SELNUM.value)=="0")){
		  	alert("Debe ingresar un numero de Planilla a buscar");
		  	document.forms[0].E01SELNUM.focus();
		  	return false;
		  }
		  
	  	if (trim((document.forms[0].E01SELRCY.value)=="" || trim(document.forms[0].E01SELRCY.value)=="0")){
		  	alert("Debe ingresar una Moneda para buscar");
		  	document.forms[0].E01SELRCY.focus();
		  	return false;
		  }
		  
	  }else{
	  	alert("Debe Seleccionar un modo de Bsuqueda para continuar.!!!");
		return false;	  	
	  }
	  return true;  	
  }

  function mostrar(tipo){
	 //hidden all
  	getElement("customer_number1").style.visibility="hidden";
   	getElement("pln_number1").style.visibility="hidden";
  	
  	//show specific
  	getElement(tipo).style.visibility="visible";
  }
  
</script>

  
</head>
<body>

<%
	if (!error.getERRNUM().equals("0")) {
		out.println("<script type=\"text/javascript\">");
		error.setERRNUM("0");
		out.println("showErrors()");
		out.println("</script>");
	}
%>

<h3 align="center">Seleccionar Planilla de Convenio a Pagar<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pago_planillas_search.jsp, ECO0240"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0240" onsubmit="return validar();">
<input type="hidden" name="SCREEN" value="101">
<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="center">
			<table id="TBHELPN" border="0" align="center">
				<tr>
					<td width="5%"><input type="radio" name="Type" value="C" onclick="javascript:mostrar('customer_number1');"></td>
					<td width="30%" align="right" nowrap>Numero Cliente Empresa :</td>
					<td width="65%" nowrap align="left">
						<div id="customer_number1" style="visibility='hidden'">					
			 				<eibsinput:help name="header" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01SELECU" fn_param_one="E01SELECU"  required="true"/>
						</div>			 			
					</td>					
				</tr>
				<tr>
					<td valign="top">
						<br><input type="radio" name="Type" value="P" onclick="javascript:mostrar('pln_number1');">
					</td>				
					<td align="right" nowrap>
						Numero Planilla :<br><br>
						Moneda :
					</td>
					<td nowrap align="left">
						<div id="pln_number1" style="visibility='hidden'">					
				 			<eibsinput:help name="header" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" property="E01SELNUM"  help="<%= HelpTypes.CONVENANT_FORM %>" fn_param_one="E01SELNUM" fn_param_two="E01SELRCY" required="true"/>
				 			<br>
							<eibsinput:help name="header" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" property="E01SELRCY" fn_param_one="E01SELRCY" />
						</div>										 				
					</td>					
				</tr>				
			</table>
		</td>
	</tr>	
	<tr><td height="40" colspan="2">&nbsp;</td></tr>	
	<tr align="center" >
		<td nowrap colspan="2" align="center">
			<div id="DIVSUBMIT" align="center">
				<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
			</div>
		</td>
	</tr>
</table>

	<script type="text/javascript">
		mostrar('customer_number1');
		document.forms[0].Type[0].checked =true;
	</script> 
</form>
</body>
</html>
