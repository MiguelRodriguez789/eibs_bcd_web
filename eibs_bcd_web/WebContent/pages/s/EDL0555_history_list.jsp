<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.master.Util" %>
<html>
<head>
<title>Lista de Monitoreo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="headInfo" class="datapro.eibs.beans.EDL055506Message" scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="EDL055506List" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	getElement("opt").value = op;
	document.forms[0].submit();
}

</SCRIPT>  

</head>

<BODY>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
	} 	
%>

<h3 align="center">Hist&oacute;rico Estados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="history_list.jsp, EDL0555"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0555" >
	<input type=HIDDEN name="SCREEN" id="SCREEN" value="2012">
	<%int row = 0; %>
	<table class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap width="10%" align="right"> Propuesta : </td>
						<td nowrap width="30%"align="left">
							<input type="text" name="porfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
						</td>
						<td nowrap width="20%" align="right"> Cliente : </td>
						<td nowrap width="40%" align="left">
							<input type="text" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>
							<input type="text" name="cusName" size="50" maxlength="50" value="<%= userPO.getCusName()%>" readonly>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 <br>

	<TABLE  id="mainTable" class="tableinfoList" style="max-height:400px;">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%" >
					<tr id="trdark">
						<th align=center nowrap width="25%">Fecha</th>
						<th align=center nowrap width="75%">Estado</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr  height="100%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="max-height:400px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   EDL055506List.initRow();
					   boolean firstTime = true;
					   String chk = "";
					   while (EDL055506List.getNextRow()) {
					   if (firstTime) {
					     firstTime = false;
					     chk = "checked";
					   } else {
					     chk = "";
					   }
					   datapro.eibs.beans.EDL055506Message msgList = (datapro.eibs.beans.EDL055506Message) EDL055506List.getRecord();
					   String time = msgList.getE06DNHLMT();
					   time = msgList.getE06DNHLMT().substring(11,19).replace(".",":");
					%>
						<tr id="dataTable<%= EDL055506List.getCurrentRow() %>"> 
							<td nowrap align=center width="25%"><%= Util.formatCustomDate(currUser.getE01DTF(),msgList.getE06DNHRDM(),msgList.getE06DNHRDD(),msgList.getE06DNHRDY())%> <%= time %></td>
							<td nowrap align=center width="75%">
								<%= msgList.getE06DNHSTS().equals("")  ? "EN PROCESO" : ""%>
								<%= msgList.getE06DNHSTS().equals("A") ? "ACTIVO" : ""%>
								<%= msgList.getE06DNHSTS().equals("D") ? "ANULADO" : ""%>
								<%= msgList.getE06DNHSTS().equals("C") ? "CUMPLIDO" : ""%>
								<%= msgList.getE06DNHSTS().equals("I") ? "INCUMPLIDO" : ""%>
								<%= msgList.getE06DNHSTS().equals("M") ? "INCUMPLIDO MANUAL" : ""%>
								<%= msgList.getE06DNHSTS().equals("N") ? "CUMPLIDO MANUAL" : ""%>
								<%= msgList.getE06DNHSTS().equals("W") ? "COMPLETADO" : ""%>
							</td>             
						</tr>
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	
	<table class="tbenter" width="98%" align="center"  height="10%">
		<tr>
			<td width="50%" align=left height="25">
			<% 
				 if ( EDL055506List.getShowPrev() ) {
				   int pos = EDL055506List.getFirstRec() - 51;
				   out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.products.JSEDL0555?SCREEN=201&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
				 }
			%>
			</td>
			<td width="50%" align=right height="25">
			<% 
				 if ( EDL055506List.getShowNext() ) {
				   int pos = EDL055506List.getLastRec();
				   out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.products.JSEDL0555?SCREEN=201&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
				 }
			%>
			</td>
		</tr>
	</table>

</form>
</body>
</html>
