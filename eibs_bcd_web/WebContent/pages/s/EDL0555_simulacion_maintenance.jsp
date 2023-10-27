<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>

<html>
<head>
<title>Simulacion Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EDL055504Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript"  src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script type="text/javascript">

function sendInfo(){
  if (!isValidDate()) {
    alert("Fecha no valida.");
    return;
  }
  document.forms[0].submit();
}

function cerrarVentana(){
  window.open('','_parent','');
  window.close(); 
}

function isValidDate() {
  var ok; var year; var month; var day; var simDate; var runDate;
  ok = true;
  // Fecha Simulacion
  if (ok) {
    ok    = false;
    year  = parseInt(getElement('E04DLNSIY').value);
    month = parseInt(getElement('E04DLNSIM').value);
    day   = parseInt(getElement('E04DLNSID').value);
    if (year > 0 && month > 0 && day > 0) {
      if (month > 0) month = month-1;
      simDate = new Date(year,month,day);
      ok = ((day==simDate.getDate()) && (month==simDate.getMonth()) && (year==simDate.getFullYear()));
    }
  }
  // Fecha Sistema
  if (ok) {
    ok    = false;
    year  = parseInt(getElement('E01RDY').value);
    month = parseInt(getElement('E01RDM').value);
    day   = parseInt(getElement('E01RDD').value);
    if (year > 0 && month > 0 && day > 0) {
      if (month > 0) month = month-1;
      runDate = new Date(year,month,day);
      ok = ((day==runDate.getDate()) && (month==runDate.getMonth()) && (year==runDate.getFullYear()));
    }
  }
  // Fecha Simulacion vs Fecha Sistema
  if (ok) {
  	if (simDate < runDate) {
  		ok = false;
  	}
	}  
  return ok;
}

</script>

</head>

<%
  boolean readOnly = false;
  boolean maintenance = false;
  boolean newOnly = false;

  // Determina si es solo lectura
  if (request.getParameter("readOnly") != null) {
    if (request.getParameter("readOnly").toLowerCase().equals("true")) {
      readOnly = true;
    } else {
      readOnly = false;
    }
  }

  // Determina si es nuevo o mantencion
  if (userPO.getHeader20().equals("NEW")) {
    newOnly = true;
  } else {
    newOnly = false;
  }

  String main = "";
  if (readOnly) {
      main = "Consulta de Simulacion";
  } else if (newOnly) {       
      main = "Nueva Simulacion";
  } else {
      main = "Mantenimiento de Simulacion";  
  }

%>

<body>
<%
  if (!error.getERRNUM().equals("0")) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("  showErrors()");
    out.println("</SCRIPT>");
  }
%>

<h3 align="center">
<%=main%> 
<% 
  String emp = (String)session.getAttribute("EMPNG");
  emp = (emp==null)?"":emp;
%>
<%if ("".equals(emp)){ %> 
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="detail_maintenance.jsp, EDL0555"></h3>
  <hr size="4">
<%}%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="406">
  <input type="hidden" id="E01RDM" name="E01RDM" value="<%=currUser.getE01RDM()%>">
  <input type="hidden" id="E01RDD" name="E01RDD" value="<%=currUser.getE01RDD()%>">
  <input type="hidden" id="E01RDY" name="E01RDY" value="<%=currUser.getE01RDY()%>">
  
  <%int row = 0;%>
 
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="10%" align="right"> Propuesta : </td>
            <td nowrap width="23%"align="left">
              <eibsinput:text name="datarec" property="E04DLNOFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Cliente : </td>
            <td nowrap width="23%" align="left">
              <eibsinput:text name="datarec" property="E04DLNCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Cuenta  : </td>
            <td nowrap width="23%" align="left">
              <eibsinput:text name="datarec" property="E04DLNACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Detalle Simulacion </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="30%" ><div align="right">Tipo Simulacion :</div></td>
            <td width="20%" nowrap="nowrap" >
              <select name="E04DLNTYP" <%=readOnly ? "disabled" : ""%> onchange="showNroCuotas(this.value)" >
                <option value="1" <% if (datarec.getE04DLNTYP().equals("1")) out.print("selected"); %>>Vencido</option>
                <option value="2" <% if (datarec.getE04DLNTYP().equals("2")) out.print("selected"); %>>Pago Total</option>
                <option value="3" <% if (datarec.getE04DLNTYP().equals("3")) out.print("selected"); %>>Por Cuotas</option>
              </select>                
            </td>
            <td width="10%" nowrap="nowrap" >
              <div align="right" id="divNroCuotasLabel">Numero de Cuotas :</div>
            </td>
            <td width="40%" nowrap="nowrap" >
              <div align="left" id="divNroCuotas">
              <input type="text" name="E04DLNCUO" size="3" maxlength="2" value="<%=datarec.getE04DLNCUO()%>">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="30%" ><div align="right">Fecha de Simulacion :</div></td>
            <td width="20%" nowrap="nowrap" >
              <eibsinput:date name="datarec" fn_year="E04DLNSIY" fn_month="E04DLNSIM" fn_day="E04DLNSID" required="true" />
            </td>
            <td width="10%" ><div align="right"></div></td>
            <td width="40%" ><div align="right"></div></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <% if (!readOnly) { %>
  <div align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" OnClick="sendInfo()" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
  </div>
  <% } else { %>
  <div align="center"> 
    <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
  </div>     
  <% } %>
    
</form>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
  window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555?SCREEN=401&E04DLNCUN=<%=userPO.getCusNum()%>&E04DLNOFN=<%=userPO.getPorfNum()%>';          
  cerrarVentana();    
</script>
<% } %>  

<script type="text/javascript">

showNroCuotas(getElement("E04DLNTYP").value);

function showNroCuotas(simValue){
	// 3=PorCuota 
	if (simValue === "3"){
		getElement("divNroCuotasLabel").style.display= 'table-cell';
		getElement("divNroCuotas").style.display= 'table-cell';
	} else {
		getElement("divNroCuotasLabel").style.display= 'none';
		getElement("divNroCuotas").style.display= 'none';
	}
}

</script>
   
</body>
</HTML>
