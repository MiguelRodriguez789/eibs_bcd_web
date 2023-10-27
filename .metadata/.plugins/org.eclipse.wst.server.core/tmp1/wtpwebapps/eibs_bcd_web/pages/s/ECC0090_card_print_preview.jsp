<html>
<head>
<title>Asignación de Tarjetas</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">

function doPrint(){
	if(!window.print){
       var msg ="Debe actualizar su navegador para imprimir.";
	   alert(msg);
	   return;
	}
	
    window.focus();
	window.print();

	return;
}

</SCRIPT>  

</head>
<body>
<P><BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<BR>
<font face="Arial" size="2"><%= request.getParameter("NAME").toUpperCase() %></font>
</P>

<script type="text/javascript">
	doPrint();
</SCRIPT> 

</body>
</html>