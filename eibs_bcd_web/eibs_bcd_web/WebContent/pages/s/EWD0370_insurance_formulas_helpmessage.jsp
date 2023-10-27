<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<script type="text/javascript">
	function enter(code) {
		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldName])) {
  			form[top.opener.fieldName].value = code;
  			form[top.opener.fieldName].focus();
  		}	
  		top.close();
 	}

function getMoreInfo(position) {
    page = "<%=request.getContextPath()%>/pages/s/EWD0370_Insurance_Calc_Info.jsp?position=" + position;
	CenterWindow(page, 600, 300, 2);
}

//-->
</script>

<title>Tabla de Tasas de Seguros </title>
</head>
<%@ page import="datapro.eibs.master.Util" %>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0370&SCREEN=1">
<H3 align="center">Tabla de Tasas de Seguros</H3>
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
    	<th>Monto</th>
    	<th>Más Info</th>    	
  	</tr>
  <%
		msgHelp.initRow();
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD0370DSMessage msg = (datapro.eibs.beans.EWD0370DSMessage) msgHelp.getRecord();
     	%>    
    <TR>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getEWDTBL()%>')"><%= Util.formatCell(msg.getEWDTBL())%></a></td>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getEWDTBL()%>')"><%= Util.formatCell(msg.getEWDDSC())%></a></td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getEWDTBL()%>')"><%= Util.formatCell(msg.getEWDSAMT())%></a></td>
		<td nowrap align="center"><a href="javascript:getMoreInfo('<%= msgHelp.getCurrentRow()%>');"><img src="<%=request.getContextPath()%>/images/s/info.gif" align="middle" border="0" ></a></td>
	</TR>   	
		<%} %>	
</TABLE>
 
<%
   }  
%>
</form>
</body>
</html>