<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>

<%
 	String filter = request.getParameter("filter") == null ? ""	: request.getParameter("filter");
%>
<SCRIPT>setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);</SCRIPT>

<script>
	function enter(code,name) {
		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldName])) {
  			form[top.opener.fieldName].value = code;
  			form[top.opener.fieldName].focus();
  		}	
  		if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = name;
  		top.close();
	}

	function goSearch() {
	 	getElement("FromRecord").value="0";
		document.forms[0].submit();
	
	}
</script>

<title>WEB Menu Options Help</title>
</head>
<%@ page import="datapro.eibs.master.Util" %>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEWD9015">

<input type="hidden" name="lang" value="<%=userPO.getType()%>">
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
    	<th>Identificador</th>
    	<th>Opción</th>
    	<th>Descripción</th>
    	<th>URL</th>
  	</tr>
  <%
		msgHelp.initRow();
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD9015DSMessage msg = (datapro.eibs.beans.EWD9015DSMessage) msgHelp.getRecord();
     	%>    
    <TR>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDDEN()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDID())%></a></td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDDEN()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDDEN())%></a></td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDDEN()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDDSC())%></a></td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDDEN()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDURI())%></a></td>
	</TR>   	
		<%} %>	
</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( msgHelp.getShowPrev() ) {
       		int pos = msgHelp.getFirstRec() - 21;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.reports.JSEWD9015?FromRecord=" + pos + "&filter=" + filter + "\" > <img src=\""+request.getContextPath()+ "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( msgHelp.getShowNext() ) {
      		int pos = msgHelp.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.reports.JSEWD9015?FromRecord=" + pos + "&filter=" + filter + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
	 
<%
   }  
%>
</form>
</body>
</html>