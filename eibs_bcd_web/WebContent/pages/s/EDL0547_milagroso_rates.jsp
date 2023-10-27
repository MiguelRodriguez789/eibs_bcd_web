<%@ page import = "datapro.eibs.master.Util" %> 
<%@ page import="datapro.eibs.beans.EPV015801Message"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="java.util.ArrayList"%>
<HTML>
<HEAD>
<TITLE>Tabla de Credito Milagroso</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL054701Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>

<SCRIPT type="text/javascript">

</SCRIPT>

</HEAD>
<BODY >

<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	
%>

<h3 align="center" style="width: 95%">Tabla de Credito Milagroso<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="milagroso_rate.jsp,EDL0547"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0547" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="TABLESIZE" id="TABLESIZE" value="" >

  <%int row = 0; %>
  <h4>&nbsp;Informaci&oacute;n de Tasa Beneficio</h4> 
  <table class="tableinfoList" style="max-height:200px; width: 100%;" align="center">
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
      <td nowrap width="25%" ><div align="center"><b>Rango Tasa Inicial </b></div></td>
      <td nowrap width="25%" ><div align="center"><b>Rango Tasa Final </b></div></td>
      <td nowrap width="25%" ><div align="left"><b>Porcentaje de Ahorro </b></div></td>
      <td nowrap width="25%" ><div align="left"><b>Tasa Efectiva(Beneficio) </b></div></td>  
      <td nowrap width="25%" ><div align="left"><b>Seleccion </b></div></td>                       
    </tr>
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
      <td nowrap width="25%"align="center">
        <eibsinput:text name="lnParam" property="E01CMLRTI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
      </td>
      <td nowrap width="25%"align="center">
        <eibsinput:text name="lnParam" property="E01CMLRTF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
      </td>
      <td nowrap width="25%"align="left">
        <eibsinput:text name="lnParam" property="E01CMLPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>"  readonly="true" />
      </td>
      <td nowrap width="25%"align="center">
        <eibsinput:text name="lnParam" property="E01CMLRT1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
      </td>  
      <td nowrap width="10%" align="center">
        <input type="radio" name="key" value="1" checked>
      </td>        	 		
    </tr>
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
      <td nowrap width="25%"align="center"></td>
      <td nowrap width="25%"align="center"></td>
      <td nowrap width="25%"align="left">
        <eibsinput:text name="lnParam" property="E01CMLPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
      </td>
      <td nowrap width="25%"align="center">
        <eibsinput:text name="lnParam" property="E01CMLRT2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
      </td>
      <td nowrap width="10%" align="center">
        <input type="radio" name="key" value="2">
      </td>        	 		
    </tr>
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
      <td nowrap width="25%"align="center"></td>
      <td nowrap width="25%"align="center"></td>
      <td nowrap width="25%"align="left">
        <eibsinput:text name="lnParam" property="E01CMLPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
      </td>
      <td nowrap width="25%"align="center">
        <eibsinput:text name="lnParam" property="E01CMLRT3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
      </td>  
      <td nowrap width="10%" align="center">
        <input type="radio" name="key" value="3" >
      </td>        	 		
    </tr>
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
      <td nowrap width="25%"align="center"></td>
      <td nowrap width="25%"align="center"></td>
      <td nowrap width="25%"align="left">
        <eibsinput:text name="lnParam" property="E01CMLPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
      </td>
      <td nowrap width="25%"align="center">
        <eibsinput:text name="lnParam" property="E01CMLRT4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
      </td>  
      <td nowrap width="10%" align="center">
        <input type="radio" name="key" value="4" >
      </td>        	 		
    </tr>
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
      <td nowrap width="25%"align="center"></td>
      <td nowrap width="25%"align="center"></td>
      <td nowrap width="25%"align="left">
        <eibsinput:text name="lnParam" property="E01CMLPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
      </td>
      <td nowrap width="25%"align="center">
        <eibsinput:text name="lnParam" property="E01CMLRT5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
      </td>  
      <td nowrap width="10%" align="center">
        <input type="radio" name="key" value="5" >
      </td>        	 		
    </tr>
  </table>

<br>
<div align="center">
	<input id="EIBSBTN" type="button" name="Submit" OnClick="goSend()" value="Enviar"> 
	<input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana()">
</div>

<script type="text/javascript">
function goSend() {
  var frm = top.opener.document;
  if (isValidObject(frm.getElementById("E01BNFRTE"))) {
    var key  = getElementChecked('key').value;
    var fld  = "E01CMLRT"+key; 
    if (isValidObject(getElement(fld))) {
      frm.getElementById("E01BNFRTE").value = document.getElementById(fld).value;
    } 
  }
  document.forms[0].submit();		
}

function cerrarVentana(){
  window.open('','_parent','');
  window.close(); 
}

</script>

</form>
</BODY>
</HTML>
