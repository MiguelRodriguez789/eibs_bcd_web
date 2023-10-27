<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.beans.*" %>
<title>Lista</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function ShowWin(acd, aty, dsc) { 
  	  var bnk = "";
  	  var brn = "";
  	  
      page = "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0003?SCREEN=300&E01NUMACD=" + acd + "&E01NUMATY=" + aty + "&E01NUMDSC=" + dsc + "&E01NUMBNK=" + bnk + "&E01NUMBRN=" + brn;
      listin = CenterWindow(page,680,260,3);
}
</SCRIPT>
</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

%>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0003">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CNTANG" VALUE="">
        
<% 
	if ( dvList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No existen registros que mostrar ó La Institución no tiene Numeración Automática</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>  
  <TABLE class="tableinfo">    
      
    <tr id="trdark" align="center">
      	<td colspan="2">  <b>Modulos</b> </td>
    </tr>
  
       <%   dvList.initRow();               
          while (dvList.getNextRow()) {
               ESD000301Message msgList = (ESD000301Message) dvList.getRecord();	%>  
          <TR>
          <td>
          	<% if (!msgList.getE01NUMACD().equals("XX")) { %>
          	<!-- ===================================================================================
	          	 Request Automatic Numbering by Application Code (CNTANG = 6)
          		 =================================================================================== -->          	
          	<% if (msgList.getE01CNTANG().equals("6") && !msgList.getE01NUMACD().equals("SQ")) { %>
			<a href ="javascript:ShowWin('<%= msgList.getE01NUMATY() %>', '<%= msgList.getE01NUMATY() %>', '<%= msgList.getE01NUMDSC() %>')" ><%= msgList.getE01NUMDSC() %></a><br />           	
			
			<!-- ===================================================================================
	          	 Request Automatic Numbering by Product Type (CNTANG = 2, 3, 4, 5)
          		 =================================================================================== -->          	          					
          	<% } else { %>	          	
          	<a href ="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0003?SCREEN=200&CFL=<%= msgList.getE01NUMACD() %>&ACD=<%= msgList.getE01NUMATY() %>" 
          					target ="showframe"><%= msgList.getE01NUMDSC() %></a><br />           	
          	<% } %>			
          	<!-- ===================================================================================
	          	 Request DataBase Sequence for all Products (CNTANG = 1)
          		 =================================================================================== -->
          	<% } else { %>
          	<a href ="javascript:ShowWin('<%= msgList.getE01NUMACD() %>', '<%= msgList.getE01NUMATY() %>', '<%= msgList.getE01NUMDSC() %>')" ><%= msgList.getE01NUMDSC() %></a><br /> 
          	<% } %>
      	  </td>
		</TR>
        <% } %>
  </TABLE>
<BR>

<%      
  }
%> 
</form>
</body>
</html>
