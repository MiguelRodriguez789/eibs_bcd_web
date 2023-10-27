<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<script type="text/javascript">
//<!-- Hide from old browsers
function enter(code,type1,name) {
  	top.opener.document.forms[0][top.opener.fieldName].value = code; 
	top.opener.document.forms[0][top.opener.fieldAux1].value = type1;
  	top.opener.document.forms[0][top.opener.fieldDesc].value = name;
  	top.opener.document.forms[0][top.opener.fieldName].focus();
  	top.close();
 }

function goSearch() {
 	document.getElementById("FromRecord").value="0";
	document.forms[0].submit();

}

//-->
</script>

<title>Dealer Slip Accounts - Help</title>
</head>
<%@ page import="datapro.eibs.master.Util" %>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0000&SCREEN=11">

<input type="hidden" name="Type" value="<%=userPO.getType()%>">
			  <table id="TBHELP">
				<tr>
				<td nowrap><b>Go to : </b></td>
			  	<td nowrap>
					<input type="text" name="selNew"  size=20 maxlength=20 value="<%=userPO.getHeader18()%>">
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
		 	<b>There is no match for your search criteria </b>
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
    	<th>Code</th>
    	<th>Type</th>
    	<th>Name</th>
    	<th>Status</th>
    	<th>City</th>
  	</tr>
  <%
		msgHelp.initRow();
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD0360DSMessage msg = (datapro.eibs.beans.EWD0360DSMessage) msgHelp.getRecord();
     	%>    
    <TR>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWDCDE()%>','<%= msg.getSWDTYP()%>','<%= msg.getSWDNME()%>')"><%= Util.formatCell(msg.getSWDCDE())%></a></td>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWDCDE()%>','<%= msg.getSWDTYP()%>','<%= msg.getSWDNME()%>')"><%= Util.formatCell(msg.getSWDTYP())%></a></td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCDE()%>','<%= msg.getSWDTYP()%>','<%= msg.getSWDNME()%>')"><%= Util.formatCell(msg.getSWDNME())%></a></td>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWDCDE()%>','<%= msg.getSWDTYP()%>','<%= msg.getSWDNME()%>')"><%= Util.formatCell(msg.getSWDSTE())%></a></td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDCDE()%>','<%= msg.getSWDTYP()%>','<%= msg.getSWDNME()%>')"><%= Util.formatCell(msg.getSWDCIT())%></a></td>
	</TR>   	
		<%} %>	
</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( msgHelp.getShowPrev() ) {
       		int pos = msgHelp.getFirstRec() - 21;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ach.JSEWD0360?FromRecord=" + pos + "&type=" + userPO.getType() + "&selNew=" + userPO.getHeader18() + "\" > <img src=\""+request.getContextPath()+ "/images/e/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( msgHelp.getShowNext() ) {
      		int pos = msgHelp.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ach.JSEWD0360?FromRecord=" + pos +  "&type=" + userPO.getType() + "&selNew=" + userPO.getHeader18() + "\" ><img src=\""+request.getContextPath()+"/images/e/next_records.gif\" border=0></A>");

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