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

	function enter(code) {
		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldName])) {
  			form[top.opener.fieldName].value = code;
  			form[top.opener.fieldName].focus();
  		}	
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
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD9008">

<input type="hidden" name="Type" value="<%=userPO.getType()%>">
<input type="hidden" name="FromRecord" value="0">

			  <table id="TBHELP">
				<tr>
				<td nowrap><b>Posicionar en Centro Compensacion: </b></td>
			  	<td nowrap>
					<input type="text" name="SelNew"  size=5 maxlength=4 value="<%=userPO.getHeader18()%>">
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
    	<th>Numero <br> Cubierta </th>
    	<th>Tipo <br> canje </th>
		<th>Descripcion</th>
    	<th>Codigo <br> compensacion </th>
		<th>Descripcion</th>
    	<th>Centro <br> Canje</th>
		<th>Descripcion</th>

  	</tr>
  <%
		msgHelp.initRow();
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD9008DSMessage msg = (datapro.eibs.beans.EWD9008DSMessage) msgHelp.getRecord();
     	%>    
    <TR>
		<td nowrap align="center"><a href="javascript:enter('<%= msg.getSWDNCU()%>')">
			<%= Util.formatCell(msg.getSWDNCU())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDNCU()%>')">
			<%= Util.formatCell(msg.getSWDTCA())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDNCU()%>')">
			<%= Util.formatCell(msg.getD01TCA())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDNCU()%>')">
			<%= Util.formatCell(msg.getSWDCOM())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDNCU()%>')">
			<%= Util.formatCell(msg.getD01COM())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDNCU()%>')">
			<%= Util.formatCell(msg.getSWDCCA())%></a>
		</td>
		<td nowrap align="left"><a href="javascript:enter('<%= msg.getSWDNCU()%>')">
			<%= Util.formatCell(msg.getD01CCA())%></a>
		</td>
	</TR>   	
		<%} %>	
</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( msgHelp.getShowPrev() ) {
       		int pos = msgHelp.getFirstRec() - 21;
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD9008?FromRecord=" + pos + "&type=" + userPO.getType() + "&selNew=" + userPO.getHeader18() + "\" > <img src=\""+request.getContextPath()+ "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	   <% if ( msgHelp.getShowNext() ) {
      		int pos = msgHelp.getLastRec();
      		out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD9008?FromRecord=" + pos +  "&type=" + userPO.getType() + "&selNew=" + userPO.getHeader18() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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