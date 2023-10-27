<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(ttp, dsc, lvl) {
		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldName])) {
  			form[top.opener.fieldName].value = ttp;
  			form[top.opener.fieldName].focus();
  		}	
  		if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = dsc;
  		if (isValidObject(form[top.opener.fieldAux])) form[top.opener.fieldAux].value = lvl;
  		top.close();
	}

	function goSearch() {
	 	getElement("FromRecord").value="0";
		document.forms[0].submit();
	
	}
</script>

<title>Taxes Help</title>
</head>
<%@ page import="datapro.eibs.master.Util" %>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSEWD0910">

<input type="hidden" name="type" value="<%=userPO.getType()%>">
<input type="hidden" name="FromRecord" value="0">


<%
	if ( msgHelp.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height="100%">
	<TR>
      <TD> 
      	<div align="center">
		 	<b>No hay resultados para su criterio de busqueda </b>
		</div>
      </TD>
    </TR>
</TABLE>
<%  
		}
	else {
%>	

<TABLE class="tableinfo" align="center" style="width:'95%'">
	<TR id="trdark"> 
  	    <th>Código</th>
    	<th>Descripción</th>
    	<th>Tipo</th>
  	</tr>
  <%
		msgHelp.initRow();
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD0910DSMessage msg = (datapro.eibs.beans.EWD0910DSMessage) msgHelp.getRecord();
     	%>    
    <TR>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDLEV()%>','<%= msg.getSWDDSC()%>','<%= msg.getSWDLVP()%>')">
			<%= Util.formatCell(msg.getSWDLEV())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDLEV()%>','<%= msg.getSWDDSC()%>,'<%= msg.getSWDLVP()%>'')">
			<%= Util.formatCell(msg.getSWDDSC())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDLEV()%>','<%= msg.getSWDDSC()%>','<%= msg.getSWDLVP()%>')">
			<%= Util.formatCell(msg.getSWDLVP())%></a>
		</td>
	</TR>   	
		<%} %>	
</TABLE>

	 
<%
   }  
%>
</form>
</body>
</html>