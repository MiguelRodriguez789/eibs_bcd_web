<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.Entities"%>

 
<html>
<head>
<title>Destino de Fondos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV116801Message"  scope="session" />
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
	boolean readOnly = false;
	boolean maintenance = false;
	boolean newOnly = false;
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly = true;
		}
	}
	if (userPO.getHeader20().equals("NEW")){
		newOnly = true;
	}
	if (!newOnly || readOnly) {
		maintenance = true;
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
	CONSULTA DE DESTINO DE FONDOS
<%} else if (newOnly){ %>
	NUEVO DESTINO DE FONDOS
<%} else { %>
	MANTENIMIENTO DE DESTINO DE FONDOS
<%} %>

<% 
	String emp = (String)session.getAttribute("EMPDF");
	emp = (emp==null) ? "" : emp;
%>

<%if ("".equals(emp)){ %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="df_maintenance.jsp,EPV1168"></h3>
 <hr size="4">
<%}%>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
	<input type=HIDDEN name="H01FLGMAS"  value="<%= datarec.getH01FLGMAS().trim()%>">

	<%int row=1;%>
 
	<%if ("".equals(emp)) { %>
	<table  class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="10%" align="right"> Cliente : </td>
						<td nowrap width="10%" align="left">
							<eibsinput:text name="datarec" property="E01PDFCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
						</td>
						<td nowrap width="10%" align="right"> Propuesta : </td>
						<td nowrap width="50%"align="left">
							<eibsinput:text name="datarec" property="E01PDFNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="10%" align="right">Sequencia :  </td>
						<td nowrap width="10%" align="left">
							<eibsinput:text name="datarec" property="E01PDFSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true"/>
						</td>
				 </tr>
			 </table>
			</td>
		</tr>
	</table>
	<%}else{%>
		<input type="hidden" name="E01PDFCUN" value="<%=datarec.getE01PDFCUN()%>">
		<input type="hidden" name="E01PDFNUM" value="<%=datarec.getE01PDFNUM()%>">
		<input type="hidden" name="E01PDFSEQ" value="<%=datarec.getE01PDFSEQ()%>">
	<%} %>
	
	<%if ("".equals(emp)){ %>  
		<h4>Destino de Fondos</h4>
	<%} %>    

		<table  class="tableinfo" width="100%">
			<tr bordercolor="#FFFFFF"> 
				<td nowrap> 
					<table cellspacing="0" cellpadding="2" width="100%" border="0">
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Destino de Fondos :</td>
							<td nowrap width="35%" align="left"> 
								<eibsinput:cnofc name="datarec" flag="DF" property="E01PDFCDE" fn_code="E01PDFCDE" fn_description="E01PDFNME" readonly="<%=maintenance %>" />
								<eibsinput:text  name="datarec" property="E01PDFNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="<%=maintenance %>" />
							</td>
							<td nowrap width="15%" align="right"></td>
							<td nowrap width="35%" align="left">
							</td>
						 </tr>
						 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
							<td nowrap width="15%" align="right">Valor :</td>
							<td nowrap width="35%" align="left">
								<eibsinput:text name="datarec" property="E01PDFVLR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly %>" />
							</td>
							<td nowrap width="15%" align="right"></td>
							<td nowrap width="35%" align="left">
							</td>
						 </tr>
				 	</table>
				</td>
			</tr>
		</table>
	

	<%if (!readOnly) { %>
		<div align="center"> 
			<input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
		</div>
	<% } else { %>
		<div align="center"> 
			<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana();">
		</div>     
	<% } %>  

</form>
	
<script type="text/javascript">
<% if ("S".equals(request.getAttribute("ACT"))){ %>
	   window.opener.location.href = '<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168?SCREEN=101&E01PDFCUN=<%=userPO.getCusNum()%>&E01PDFNUM=<%=userPO.getPorfNum()%>';	   	   
	   cerrarVentana();
<% } %>  

</script>


</body>
</HTML>
