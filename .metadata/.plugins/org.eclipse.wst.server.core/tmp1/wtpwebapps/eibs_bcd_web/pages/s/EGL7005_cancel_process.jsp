<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EGL700501Message"%>

<html>
<head>  
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="cancel" class="datapro.eibs.beans.EGL700501Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

</head>
<body>
<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL7005">
<input type="hidden" id="SCREEN" name="SCREEN" value="300">

<br>

	<h3 align="center">Proceso Ejecutado Satisfactoriamente <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cancel_process.jsp,EGL7005"> </h3> 

<br>
<br>

<table class="tbenter" width=100% height=80%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> Proceso Ejecutado Satisfactoriamente. </b>
			</font>
		</div>
		</td>
	</tr>
</table>

</form>
</body>
</html>