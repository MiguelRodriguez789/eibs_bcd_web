<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
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

<title>Reports Fields Help</title>
</head>
<%@ page import="datapro.eibs.master.Util" %>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.reports.JSEWD9011">

<input type="hidden" name="lang" value="<%=userPO.getType()%>">
<input type="hidden" name="FromRecord" value="0">

			  <table id="TBHELP">
				<tr>
				<td nowrap><b>Posicionar en : </b></td>
			  	<td nowrap>
					<input type="text" name="code"  size=12 maxlength=10 value="<%=userPO.getHeader18()%>">
        			<a href="javascript:goSearch();"><img src="<%=request.getContextPath()%>/images/search1.gif" align="bottom" border="0" ></a> 
      			</td>
    		  </tr>
			</table>

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
    	<th>Campo</th>
    	<th>Descripción</th>
    	<th>Tipo</th>
    	<th>Long</th>
    	<th>Dec</th>
  	</tr>
  <%
		msgHelp.initRow();
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD9011DSMessage msg = (datapro.eibs.beans.EWD9011DSMessage) msgHelp.getRecord();
     	%>    
    <TR>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWDCOD()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDCOD())%></a></td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCOD()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDDSC())%></a></td>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWDCOD()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDPTY())%></a></td>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWDCOD()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDPLN())%></a></td>
		<% if (!msg.getSWDPTY().equals("A")) { %>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWDCOD()%>','<%= msg.getSWDDSC()%>')"><%= Util.formatCell(msg.getSWDNDC())%></a></td>
		<% } else { %>
		<td nowrap align="center"></td>
		<% } %>
	</TR>   	
		<%} %>	
</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( msgHelp.getShowPrev() ) {
       		int pos = msgHelp.getFirstRec() - 21;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.reports.JSEWD9011?FromRecord=" + pos + "&lang=" + userPO.getType() + "&code=" + userPO.getHeader18() + "\" > <img src=\""+request.getContextPath()+ "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( msgHelp.getShowNext() ) {
      		int pos = msgHelp.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.reports.JSEWD9011?FromRecord=" + pos +  "&lang=" + userPO.getType() + "&code=" + userPO.getHeader18() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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