<%@ taglib uri="/WEB-INF/display.tld" prefix="display" %>
<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "paramters" class= "com.datapro.eibs.internet.databeans.DC_SEARCH"  scope="session" />
<jsp:useBean id= "lstTransactions" class= "datapro.eibs.beans.JBObjList"  scope="session" />


<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Transactions List <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="DCIBS_log_download_list.jsp, DCIBS"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSLogTransSearch" >
  	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  
	<table border=0 style="border-collapse: collapse" CELLSPACING=0 CELLPADDING=0 width="100%" bgcolor="transparent" >
    	<tr>
			<td>
				<display:table  width="100%" name="lstTransactions" property="list" scope="session" export="true" decorator="com.datapro.eibs.internet.databeans.DC_LOGWrapper">
  					<display:column property="date" 		align="center" title="Date"/> 
  					<display:column property="time" 		align="center" title="Time"/> 
  					<display:column property="ENTITYID" 		align="left" title="Entity"/> 
  					<display:column property="USERID" 		align="left" title="User"/> 
  					<display:column property="TRANSCODE" 	align="left" title="Transaction"/> 
  					<display:column property="DEBITACC" 	align="right" title="Debit Account"/> 
  					<display:column property="CREDITACC" 	align="right" title="Credit Account"/> 
  					<display:column property="AMOUNT" 		align="right" title="Amount"/> 
  					<display:column property="REMARK" 		align="left" title="Remark"/> 

					<display:setProperty name="export.xml" value="false" />
					<display:setProperty name="export.txt" value="false" />
					<display:setProperty name="export.qif" value="false" />
					<display:setProperty name="export.csv" value="false" />
					<display:setProperty name="export.decorated" value="true" />
					<display:setProperty name="export.excel.include_header" value="true" /> 
				</display:table> 
			</td>
		</tr>
	</table>	

	<br>

	<table class="tbenter" width=100% align=center>
		<tr> 
	        <td><div align="center"><input id="EIBSBTN" type=submit name="Return" value="Return"></div></td>
	    </tr>
	</table>
  
</form>
</body>
</html>
