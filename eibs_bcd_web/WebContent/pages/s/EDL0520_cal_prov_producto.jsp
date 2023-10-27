<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<head>
<title>Simulación Calificación y Provisión por Producto</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.EDL052001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript">
function consultar(){
	document.forms[0].SCREEN.value = 10;
	document.forms[0].submit();
}
function masiva(){
	document.forms[0].SCREEN.value = 6;
	document.forms[0].submit();
}
</script>

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

<h3 align="center">Simulaci&oacute;n  Calificaci&oacute;n y Provisi&oacute;n por Producto<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cal_prov_producto.jsp, EDL0520" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0520" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
    <INPUT TYPE=HIDDEN NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
    <input type=HIDDEN name="E01CHGBNK" size="3" maxlength="2" value="01">
    <input type=HIDDEN name="E01CHGACD" size="3" maxlength="2" value="10">
  </p>
  <% if("".equals(msg.getE01ACTION())){ %>
  <table  class="tableinfo">
    <tr>
      <td nowrap width="25%">
      </td>
	<td nowrap width="25%">
	        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trclear">
            <td nowrap >
              <div align="right">Producto :</div>
            </td>
            <td nowrap>
		 		<eibsinput:help name="msg" property="E01CYPPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" 
 		 				fn_param_one="E01CYPPRO" fn_param_two="document.forms[0].E01CHGACD.value" fn_param_three="document.forms[0].E01CHGBNK.value" fn_param_four="E01NEWPRD" />
			        <eibsinput:text  property="E01NEWPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
		    </td>
          </tr>
		   <tr id="trclear">
            <td nowrap >
              <div align="right">Cliente :</div>
            </td>
            <td nowrap>
		 		 <input type="text" name="E01CYPCUN" id="E01CYPCUN" size="10" maxlength="9" value="" onKeyPress="enterInteger(event)">
                <a href="javascript:GetCustomerDescId('E01CYPCUN','E01CUSNA1','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
			<input  type="text" name="E01CUSNA1" id="E01CUSNA1" size="25" maxlength="25" readonly >
		    </td>
          </tr>
		   <tr id="trclear">
            <td nowrap >
              <div align="right">Calificación Subjetiva Evaluación:</div>
            </td>
            <td nowrap>
		 		 <div align="left">
                <input type="text" maxlength="2" size="3" value="<%= msg.getE01CYPCAL().trim()%>" name="E01CYPCAL" >
               <a href="javascript:GetCodeCNOFC('E01CYPCAL','K4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a> 
              </div>
		    </td>
          </tr>
           <tr id="trclear">
            <td nowrap >
              <div align="right"></div>
            </td>
            <td nowrap>
	 		 <div align="left"><a href="javascript:masiva()"><b>Ver Informaci&oacute;n Cargada Masivamente</b></a></div>
		    </td>
          </tr>
    </table>
     </td>
    
     <td nowrap width="25%">
     </td>
    </tr>
  </table>
  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
    <%} %>
  <% if(!"".equals(msg.getE01ACTION()) ){
		if(msg.getE01ACTION().equals("R")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación Normal se esta Ejecutando </h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>
	    <% }			
 		 else if(msg.getE01ACTION().equals("P")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación Por Producto o Cliente se esta ejecutando</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
 		<% }
		 else if(msg.getE01ACTION().equals("O")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación Por Producto o Cliente Termino de Forma Correcta</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
		   <p align="center">
    			<input id="EIBSBTN" type=submit name="Submit" value="Consultar"  onClick="javascript:consultar()">
		  </p>	
 		<% }
 		 else if(msg.getE01ACTION().equals("X")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación  Por Producto o Cliente se esta Ejecutando</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
 		<% } 
		  else if(msg.getE01ACTION().equals("Y")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación x Producto Cliente termino, por favor ingrese en la opcion correspondiente para ver resultados</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
 		<% } 
		  else if(msg.getE01ACTION().equals("Z")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulacion x Producto Cliente no ha sido ejecutado</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
 		<% } 
  } %>

  
</form>
</body>
</html>

