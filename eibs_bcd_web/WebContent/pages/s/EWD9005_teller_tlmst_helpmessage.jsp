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
	function enter(code,brn,dsc,bth) {
		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldName])) {
  			form[top.opener.fieldName].value = code;
  			form[top.opener.fieldName].focus();
  		}	
  		if (isValidObject(form[top.opener.fieldAux1])) form[top.opener.fieldAux1].value = brn;
  		if (isValidObject(form[top.opener.fieldAux2])) form[top.opener.fieldAux2].value = dsc;
  		if (isValidObject(form[top.opener.fieldAux3])) form[top.opener.fieldAux3].value = bth;
  		top.close();
	}

	function goSearch() {
	 	getElement("FromRecord").value="0";
		document.forms[0].submit();
	
	}
</script>

<title>helps Help</title>
</head>
<%@ page import="datapro.eibs.master.Util" %>

<body>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD9005">

<input type="hidden" name="Type" value="<%=userPO.getType()%>">
<input type="hidden" name="FromRecord" value="0">
<%int row = 0; %>
<table id="TBHELP">
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
		<td nowrap><b>Posicionar en : </b></td>
		<td nowrap>
			<input type="text" name="SelNew"  size=12 maxlength=10 value="<%=userPO.getHeader18()%>">
       		<a href="javascript:goSearch();"><img src="<%=request.getContextPath()%>/images/search1.gif" align="bottom" border="0" ></a> 
   		</td>
   	</tr>
</table>

<%
	if ( msgHelp.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height="100%">
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"><TR>
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
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
		<th>Cajeros</th>
		<th>Oficina</th>
		<th>Nombre</th>
		<th>Lote</th>
  	</tr>
  <%
		msgHelp.initRow();
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD9005DSMessage msg = (datapro.eibs.beans.EWD9005DSMessage) msgHelp.getRecord();
     	%>    
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWCTID()%>','<%= msg.getSWCBRN()%>','<%= msg.getSWCBRD()%>','<%= msg.getSWCBTH()%>')">
			<%= Util.formatCell(msg.getSWCTID())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWCTID()%>','<%= msg.getSWCBRN()%>','<%= msg.getSWCBRD()%>','<%= msg.getSWCBTH()%>')">
			<%= Util.formatCell(msg.getSWCBRN())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWCTID()%>','<%= msg.getSWCBRN()%>',,'<%= msg.getSWCBRD()%>''<%= msg.getSWCBTH()%>')">
			<%= Util.formatCell(msg.getSWCBRD())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWCTID()%>','<%= msg.getSWCBRN()%>',,'<%= msg.getSWCBRD()%>''<%= msg.getSWCBTH()%>')">
			<%= Util.formatCell(msg.getSWCBTH())%></a>
		</td>

	</TR>   	
		<%} %>	
</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( msgHelp.getShowPrev() ) {
       		int pos = msgHelp.getFirstRec() - 21;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD9005?FromRecord=" + pos + "&type=" + userPO.getType() + "&selNew=" + userPO.getHeader18() + "\" > <img src=\""+request.getContextPath()+ "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( msgHelp.getShowNext() ) {
      		int pos = msgHelp.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD9005?FromRecord=" + pos +  "&type=" + userPO.getType() + "&selNew=" + userPO.getHeader18() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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