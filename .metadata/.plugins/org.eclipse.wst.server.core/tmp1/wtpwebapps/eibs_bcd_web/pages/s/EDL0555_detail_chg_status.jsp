<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>

<html>
<head>
<title>Seguros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EDL055502Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript"  src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


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


<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">Cambio de Estado de Negociacion por Cliente
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="detail_chg_status.jsp, EDL0555"></h3>
	<hr size="4">

  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="3003">
  <%int row = 0;%>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="10%" align="right"> Propuesta : </td>
            <td nowrap width="23%"align="left">
              <eibsinput:text name="datarec" property="E02DLNOFN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="10%" align="right"> Cliente : </td>
            <td nowrap width="23%" align="left">
              <eibsinput:text name="datarec" property="E02DLNCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              <eibsinput:text name="datarec" property="E02DSCPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
            </td>
            
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Detalle Estado </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td width="15%" ><div align="right">Estado :</div></td>
            <td width="15%" nowrap="nowrap" >
              <select name="E02DLNSTS" >
                <option value="D" <% if (datarec.getE02DLNSTS().equals("D")) out.print("selected"); %>>Anulado</option>
                <option value="A" <% if (datarec.getE02DLNSTS().equals("A")) out.print("selected"); %>>Activo</option>
                <option value="I" <% if (datarec.getE02DLNSTS().equals("I")) out.print("selected"); %>>Incumplido</option>
                <option value="C" <% if (datarec.getE02DLNSTS().equals("C")) out.print("selected"); %>>Cumplido</option>
                <option value="M" <% if (datarec.getE02DLNSTS().equals("M")) out.print("selected"); %>>Incumplido Manual</option>
                <option value="N" <% if (datarec.getE02DLNSTS().equals("N")) out.print("selected"); %>>Cumplido Manual</option>
              </select>                
            </td>
                       
          </tr>
        </table>
      </td>
    </tr>
  </table>

   
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>
	
</form>

<% if ("S".equals(request.getAttribute("ACT"))) { %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555?SCREEN=3001&&E01CUN=<%=userPO.getCusNum()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>  

<script type="text/javascript">
</script>
 
</body>
</HTML>
