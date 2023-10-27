<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="datapro.eibs.beans.EPV015801Message"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="java.util.ArrayList"%>

<HTML>
<HEAD>
<TITLE>Fechas para Desplazar</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="newDate" class="java.util.ArrayList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>

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



<h3 align="center" style="width: 95%">Futuro Tasa/Spread <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="future_rate.jsp,EPV0158"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0158" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="TABLESIZE" id="TABLESIZE" value="" >

<%int row = 0; %>
<h4>&nbsp;Auditor&iacute;a de Tasa/Spread</h4> 
	<table class="tableinfoList" style="max-height:200px; width: 100%;" align="center">
	<tr height="5%"> 
		<td NOWRAP valign="top" width="100%"> 
			<table id="headTable" width="100%">
				<tr id="trdark">
					<th ALIGN="center" nowrap width="10%">	</th>
					<th ALIGN="center" nowrap width="45%"><b>Fecha Actualizaci&oacute;n</b></th>
					<th ALIGN="center" nowrap width="45%"><b>Nueva Tasa </b></th>
				</tr>
		</table>
		</td>
	</tr>
	<tr height="100%">
		<td nowrap="nowrap" colspan="3">
		<div id="dataDiv1" style="max-height: 200px ; overflow: auto; border: 0px;">
		<table id="dataTable"  cellspacing="0" cellpadding="1" border="0" width="100%">
		<%
			if (list.isEmpty()){
		%>		 
			<tr>
				<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c"" colspan="5">
					<br>No hay Futuro Tasa/Spead para la consulta.
				</TD>
			</tr>    
		<%}else{%>	      
         <%  
                list.initRow();
                int i = 0;
        		while (list.getNextRow()) {
                  	datapro.eibs.beans.EPV015801Message msgList = (datapro.eibs.beans.EPV015801Message) list.getRecord();
					i++;
		 %>
			<tr id='<%=i%>'>
					<td width="10%" align="center">
						  <%=Util.formatBlank( String.valueOf(i))%>
					</td>
					<td nowrap align="CENTER" width="45%" >
						<input type="text" id="E01FTRPRD_<%=i%>" name="E01FTRPRD_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRD()%>"  class="TXTRIGHT" readonly />
						<input type="text" id="E01FTRPRM_<%=i%>" name="E01FTRPRM_<%=i%>" size="3" maxlength="2" value="<%=msgList.getE01FTRPRM()%>"  class="TXTRIGHT" readonly/>
						<input type="text" id="E01FTRPRY_<%=i%>" name="E01FTRPRY_<%=i%>" size="5" maxlength="4" value="<%=msgList.getE01FTRPRY()%>"  class="TXTRIGHT" readonly/>
					</td>
					<td nowrap align="CENTER" width="45%" >
						<input type="text" name="E01FTRRTE<%=i%>" maxlength="10" size="12" value="<%=msgList.getE01FTRRTE()%>" readonly class="TXTRIGHT"> 
					</td>	
			</tr>		 
		 <%}}%>
		</table>
		</div>
		</td>
	</tr>
</table>
<br>
<div align="center">
	<input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="javascript:cerrarVentana()">
</div>
<script type="text/javascript">
function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}
</script>

</form>
</BODY>
</HTML>
