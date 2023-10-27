<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.*" %>
<%@ page import="datapro.eibs.beans.*" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="java.math.*" %>

<html>
<head>
<title>Manejo Tarifas</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.ESD052501Message" scope="session" />
<jsp:useBean id="ESD052501List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/graphical.js"> </SCRIPT>

<script type="text/javascript">
	<% userPO.setSource("comission");
	   userPO.setHeader20("APPROVAL");		
	 %>

function goAction(op,ac) {
  if ((op != '30') && (!isValidObject(getElement("key")))) {
    alert("Debe seleccionar un registro.");
  }
  if ((op == '30') || (op == '205')|| (op == '203')) {
    if (op == '30'  && isValidObject(getElement("key"))) {
      chk =	confirm("Desea aprobar el registro seleccionado?");
      if(chk)getElement('action').value = "A";	
    }else if (op == '30'  && !isValidObject(getElement("key"))) {
	    alert("Debe seleccionar un registro.");
    }
    if (op == '205' && isValidObject(getElement("key"))) {
    	chk = confirm("Desea eliminar el registro seleccionado?");
        if(chk)getElement('action').value = "D";	
    }
    if (op == '203') chk = "checked";
    if (!chk) return;
      getElement("SCREEN").value = op;
      document.forms[0].submit(); 
  } else {
    getElement("SCREEN").value = op;
    document.forms[0].submit(); 
  }
}


</script>

</head>

<body>
<% 
  if ( !error.getERRNUM().equals("0")  ) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("  showErrors()");
    out.println("</SCRIPT>");
  }
%>

<h3 align="center">Aprobación Tabla de Cargos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="tarifas_list_approval.jsp, ESD0525"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0525">
  <input type="hidden" name="SCREEN" id="SCREEN" value="30">
  <input type="hidden" name="action" id="action" value="">
          
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a name="linkApproval" href="javascript:goAction('30','A')"><b>Aprobar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('30','D')"><b>Eliminar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('203')"><b>Consultar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>

  
  <table id="mainTable" class="tableinfo" width="100%">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark">
            <th align="center" nowrap width="10%">SEL</th>            
            <th align="center" nowrap width="10%">TIPO PRODUCTO</th>
            <th align="center" nowrap width="15%">CLIENTE</th>
            <th align="center" nowrap width="10%">CODIGO</th>
            <th align="center" nowrap width="15%">ACCION</th>
            <th align="center" nowrap width="40%">OBSERVACION</th>
          </tr>
        </table>
      </td>
    </tr>
    <tr >    
      <td nowrap="nowrap">      
        <div id="dataDiv1" style="overflow:auto;"> 
          <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			if (ESD052501List.isEmpty()){
		%>		 
          <tr id="dataTable"> 
			<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
				<br><br><br><br> <font size=3>No hay Registros para la Aprobaci&oacute;n . </font>
			</TD>          
		 </tr>
          
          <% }else{
             ESD052501List.initRow();
             int k = 0;
             boolean firstTime = true;
             String chk = "";
             while (ESD052501List.getNextRow()) {
               if (firstTime) {
                 firstTime = false;
                 chk = "checked";
               } else {
                 chk = "";
               }
             ESD052501Message record = (ESD052501Message) ESD052501List.getRecord();
          %>
            <tr id="dataTable<%= ESD052501List.getCurrentRow() %>">
              <td nowrap align="center" width="10%"><input type="radio" id="key" name="key" value="<%=ESD052501List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESD052501List.getCurrentRow() %>)"/></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('203')"><%=record.getE01DLFTYP()%></a></td>
              <td nowrap align="center" width="15%"><a href="javascript:goAction('203')"><%=record.getE01DLFCUN()%></a></td>
              <td nowrap align="center" width="10%"><a href="javascript:goAction('203')"><% if (record.getE01DLFTBL().equals("@G")) out.print("GENERICA");
                                   															else if (record.getE01DLFTBL().equals("@C")) out.print("CONVENIO");
             																				else out.print(record.getE01DLFTBL()); %></a></td>
              <td nowrap align="center" width="15%"><a href="javascript:goAction('203')"><%=record.getE01REMARK()%></a></td>
              <td nowrap align="left"   width="40%"><a href="javascript:goAction('203')"><%=record.getE01DLFDSC()%></a></td>
            </tr>
          <% }} %>
          </table>
        </div>
      </td>
    </tr>
  </table>
 
</form>

<SCRIPT type="text/javascript">
<% if (!ESD052501List.getNoResult()) { %>
  showChecked("key");
<% } %>
</SCRIPT>

</body>
</html>
