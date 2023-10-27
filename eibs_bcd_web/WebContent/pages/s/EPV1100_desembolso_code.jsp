<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>
<%@ page import="com.datapro.constants.Entities" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Desembolso</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV110001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function SendInfo(){
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
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	String emp = (String)session.getAttribute("EMPDS");
 	emp = (emp==null) ? "" : emp;
%>

<h3 align="center">TIMBRE CUPÓN
<% if ("".equals(emp)){ %> 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="desembolso_maintenance.jsp, EPV1100"></h3>
<hr size="4">
<% } %>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100" >
  <INPUT type=HIDDEN name="SCREEN"    id="SCREEN"    value="501">
  <input type=HIDDEN name="E01UBK"    id="E01UBK"    value="<%= currUser.getE01UBK().trim()%>">
  <input type=HIDDEN name="H01FLGMAS" id="H01FLGMAS" value="<%= datarec.getH01FLGMAS().trim()%>">
  <input type=HIDDEN name="E01PVBOGL" id="E01PVBOGL" value="<%= datarec.getE01PVBOGL().trim()%>">
  <input type=HIDDEN name="E01PVBPFL" id="E01PVBPFL" value="<%= datarec.getE01PVBPFL().trim()%>">
  <input type=HIDDEN name="E01PVBTYP" id="E01PVBTYP" value="<%= datarec.getE01PVBTYP().trim()%>">
  <input type=HIDDEN name="E01PVBOAM" id="E01PVBOAM" value="<%= datarec.getE01PVBOAM().trim()%>">
  <input type=HIDDEN name="E01PVBTXA" id="E01PVBTXA" value="<%= datarec.getE01PVBTXA().trim()%>">
  <input type=HIDDEN name="E01PVBCOA" id="E01PVBCOA" value="<%= datarec.getE01PVBCOA().trim()%>">
  <input type=HIDDEN name="E01PVBIVA" id="E01PVBIVA" value="<%= datarec.getE01PVBIVA().trim()%>">
  <input type=HIDDEN name="E01PVBTOT" id="E01PVBTOT" value="<%= datarec.getE01PVBTOT().trim()%>">
  <input type=HIDDEN name="E01PVBOAC" id="E01PVBOAC" value="<%= datarec.getE01PVBOAC().trim()%>">
  
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
	  			<eibsinput:text name="datarec" property="E01PVBCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Propuesta : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="datarec" property="E01PVBNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Sequencia :  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="datarec" property="E01PVBSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
             </td>
         </tr>
       </table>
      </td>
    </tr>
  </table>
  <%}else{%>
  	<input  type="hidden" name="E01PVBCUN" value="<%=datarec.getE01PVBCUN()%>">
  	<input  type="hidden" name="E01PVBNUM" value="<%=datarec.getE01PVBNUM()%>">
  	<input  type="hidden" name="E01PVBSEQ" value="<%=datarec.getE01PVBSEQ()%>"> 
  <%} %>

<%if ("".equals(emp)){ %>      
  <h4>Datos de Desembolso</h4>
<%} %>      
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
						<td width="50%">
							<div align="right">Timbre Cupón :</div>
						</td>
						<td width="50%">
							<eibsinput:text property="E01CODBAR" name="datarec" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="99" maxlength="99"  />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
  
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" onclick="SendInfo()" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
	</div>
    
</form>

<% if ("S".equals(request.getAttribute("ACT"))){ %>
<script type="text/javascript">
	window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=101&E01PVBCUN=<%=userPO.getCusNum()%>&E01PVBNUM=<%=userPO.getPorfNum()%>';	   	   
	cerrarVentana();	  
</script>
<% } %>

<script type="text/javascript">
	document.forms[0].E01CODBAR.focus();
</script>

</body> 
</HTML>