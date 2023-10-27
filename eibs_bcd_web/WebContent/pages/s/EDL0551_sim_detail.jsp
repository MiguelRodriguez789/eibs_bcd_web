<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Provisión Adicional Masiva</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.EDL055101Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

	function changeSelection(value) {
		if (value == "1") {
			document.getElementById("MOD").style.visibility = "visible";
			document.getElementById("CAL").style.visibility = "hidden"; 
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "hidden"; 
			document.getElementById("MON").style.visibility = "hidden"; 		
		} else {
		if (value == "2") {
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "visible";
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "hidden"; 
			document.getElementById("MON").style.visibility = "hidden";
		} else {
		if (value == "3") { 
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "hidden";
			document.getElementById("TPR").style.visibility = "visible"; 
			document.getElementById("PRO").style.visibility = "hidden"; 
			document.getElementById("MON").style.visibility = "hidden";
		} else {
		if (value == "4") { 
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "hidden";
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "visible"; 
			document.getElementById("MON").style.visibility = "hidden";
		} else {
		if (value == "5") { 
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "hidden";
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "hidden"; 
			document.getElementById("MON").style.visibility = "visible";
		} 
		}
		}
		}
		}
	}	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF">

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Provisi&oacute;n Adicional Masiva<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="sim_detail, EDL0551" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0551" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
    <INPUT TYPE=HIDDEN NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
    <input type=HIDDEN name="E01CHGBNK" size="3" maxlength="2" value="01">
    <input type=HIDDEN name="E01CHGACD" size="3" maxlength="2" value="10">
  </p>
<table class="tableinfo">
  <tr >
    <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
      <tr id="trdark">
        <td nowrap><div align="center">Identificación de Paquete  de Préstamos con Provisión Adicional :</div></td>
        <td nowrap><div align="left"><input type="text" readonly name="X" size="10" maxlength="9" value="<%= userPO.getHeader1()%>"></div></td>
		        
      </tr>
     
    </table></td>
  <p>&nbsp;</p>
</table>  
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark">
            <td nowrap>
               <div align="right">Criterio de Selecci&oacute;n  :</div>            </td>
            <td nowrap>
			<select name="E01SIMTIP" id="E01SIMTIP"  <% if (!userPO.getPurpose().equals("NEW")) out.print("disabled");%> onChange="changeSelection(this.options[this.selectedIndex].value)">
              <option value=" " <% if (!(msg.getE01SIMTIP().equals("1")|| msg.getE01SIMTIP().equals("2")|| msg.getE01SIMTIP().equals("3")|| msg.getE01SIMTIP().equals("4")|| msg.getE01SIMTIP().equals("5"))) out.print("selected"); %>></option>
              <option value="5" <% if(msg.getE01SIMTIP().equals("5")) out.print("selected");%>>Monto Provisión Adicional</option>			  
              <option value="1" <% if(msg.getE01SIMTIP().equals("1")) out.print("selected");%>>Modalidad</option>
              <option value="2" <% if(msg.getE01SIMTIP().equals("2")) out.print("selected");%>>Calificación</option>
              <option value="3" <% if(msg.getE01SIMTIP().equals("3")) out.print("selected");%>>Tipo Producto</option>
              <option value="4" <% if(msg.getE01SIMTIP().equals("4")) out.print("selected");%>>Producto</option>

            </select>
			<% if (!userPO.getPurpose().equals("NEW")){ %>
			<INPUT TYPE=HIDDEN NAME="E01SIMTIP" VALUE="<%= msg.getE01SIMTIP()%>">
			<% } %>
			</td>
          </tr>
    </table>
      </td>
    </tr>
  </table>
 <table id="MON" class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark">
            <td nowrap>
               <div align="right">Monto Provision Adicional :</div>            </td>
            <td nowrap>
				<eibsinput:text name="msg" property="E01SIMAMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="false" />
			</td>
           
          </tr>
    </table>
      </td>
    </tr>
  </table>      
 <table id="MOD" class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark">
            <td nowrap>
               <div align="right">Modalidad   :</div>            </td>
            <td nowrap><input type="text" name="E01SIMMOD" size="3" maxlength="1" value="<%= msg.getE01SIMMOD() %>" <% if (!userPO.getPurpose().equals("NEW")) out.print("readonly");%>> <a
          href="javascript:GetCode('E01SIMMOD','STATIC_ln_prod_sup.jsp')"><img
          src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
          align="bottom" border="0"></a></td>
           <td nowrap>
            	<div align="right">Descripción :</div>            </td>
            <td nowrap><input type="text" name="E01DESMOD" readonly size="40" maxlength="35" value="<%= msg.getE01DESMOD() %>"></td> 
          </tr>
    </table>
      </td>
    </tr>
  </table>
<table id="CAL" class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark">
            <td nowrap>
               <div align="right">Calificaci&oacute;n   :</div>            </td>
            <td nowrap>
			 <input type="text" name="E01SIMCAL" size="5" maxlength="2" value="<%= msg.getE01SIMCAL().trim()%>" <% if (!userPO.getPurpose().equals("NEW")) out.print("readonly");%>>
              <a href="javascript:GetCodeCNOFC('E01SIMCAL','K4')">
			  <% if (userPO.getPurpose().equals("NEW")){ %>
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>   
			  <% } %>
			</td>
            <td nowrap>
            	<div align="right">Descripción :</div>            </td>
            <td nowrap><input type="text" name="E01DESCAL" readonly size="40" maxlength="35" value="<%= msg.getE01DESCAL() %>"></td>
          </tr>
    </table>
      </td>
    </tr>
  </table>
  <table id="TPR" class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark">
            <td nowrap>
               <div align="right">Tipo Producto   :</div>            </td>
            <td nowrap>
			 <input type="text" name="E01SIMTPR" size="5" maxlength="4" value="<%= msg.getE01SIMTPR().trim()%>" <% if (!userPO.getPurpose().equals("NEW")) out.print("readonly");%>>
              <a href="javascript:GetCodeCNOFC('E01SIMTPR','04')">
              <% if (userPO.getPurpose().equals("NEW")){ %>
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>   
			  <% } %>  
			</td>
            <td nowrap>
            	<div align="right">Descripción :</div>            </td>
            <td nowrap><input type="text" name="E01DESTIP" readonly size="40" maxlength="35" value="<%= msg.getE01DESTIP() %>"></td>
          </tr>
    </table>
      </td>
    </tr>
  </table>
  <table id="PRO" class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark">
            <td nowrap>
               <div align="right">Producto   :</div>            </td>
            <td nowrap>
			<% if (userPO.getPurpose().equals("NEW")) { %>
			<eibsinput:help name="msg" property="E01SIMPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" 
 		 				fn_param_one="E01SIMPRO" fn_param_two="document.forms[0].E01CHGACD.value" fn_param_three="document.forms[0].E01CHGBNK.value" fn_param_four="E01DESPRO" />
			<% } else { %>			
			<eibsinput:help name="msg" property="E01SIMPRO" readonly="true" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" 
 		 				fn_param_one="E01SIMPRO" fn_param_two="document.forms[0].E01CHGACD.value" fn_param_three="document.forms[0].E01CHGBNK.value" fn_param_four="E01DESPRO" />
			<% } %>			
			</td>
            <td nowrap>
            	<div align="right">Descripción :</div>            </td>
            <td nowrap><input type="text" name="E01DESPRO" readonly size="40" maxlength="35" value="<%= msg.getE01DESPRO() %>"></td>
          </tr>
    </table>
      </td>
    </tr>
  </table>  
  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	<input id="EIBSBTN" type=button name="Submit" OnClick="goAction('1')" value="Regresar">
  </p>
</form>
<SCRIPT type="text/javascript">
		<% if (msg.getE01SIMTIP().equals("1")) { %>
			document.getElementById("MOD").style.visibility = "visible";
			document.getElementById("CAL").style.visibility = "hidden"; 
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "hidden";
			document.getElementById("MON").style.visibility = "hidden"; 
			document.getElementById("PAQ").style.visibility = "hidden"; 			
		<% } %>	
		<% if (msg.getE01SIMTIP().equals("2")) { %>
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "visible"; 
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "hidden";
			document.getElementById("MON").style.visibility = "hidden"; 
			document.getElementById("PAQ").style.visibility = "hidden"; 						
		<% } %>	
		<% if (msg.getE01SIMTIP().equals("3")) { %>
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "hidden"; 
			document.getElementById("TPR").style.visibility = "visible"; 
			document.getElementById("PRO").style.visibility = "hidden";
			document.getElementById("MON").style.visibility = "hidden"; 
			document.getElementById("PAQ").style.visibility = "hidden"; 						
		<% } %>	
		<% if (msg.getE01SIMTIP().equals("4")) { %>
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "hidden"; 
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "visible";
			document.getElementById("MON").style.visibility = "hidden"; 
			document.getElementById("PAQ").style.visibility = "hidden"; 						
		<% } %>	
		<% if (msg.getE01SIMTIP().equals("5")) { %>
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "hidden"; 
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "hidden";
			document.getElementById("MON").style.visibility = "visible"; 
			document.getElementById("PAQ").style.visibility = "hidden"; 			
		<% } %>			
		<% if (msg.getE01SIMTIP().equals("6")) { %>
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("CAL").style.visibility = "hidden"; 
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "hidden";
			document.getElementById("MON").style.visibility = "hidden"; 
			document.getElementById("PAQ").style.visibility = "visible"; 			
		<% } %>					
		<% if (msg.getE01SIMTIP().equals("")) { %>
			document.getElementById("CAL").style.visibility = "hidden"; 
			document.getElementById("MOD").style.visibility = "hidden";
			document.getElementById("TPR").style.visibility = "hidden"; 
			document.getElementById("PRO").style.visibility = "hidden";
			document.getElementById("MON").style.visibility = "hidden"; 
			document.getElementById("PAQ").style.visibility = "hidden"; 												
		<% } %>			
	function goAction(op){
		getElement("SCREEN").value = op;
		document.forms[0].submit();
	}			

</SCRIPT>

</body>
</html>

