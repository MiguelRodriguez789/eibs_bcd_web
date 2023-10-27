<html> 
<head>
<title>Cerrar Ambiente del Año Anterior</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgMC" class= "datapro.eibs.beans.EGL700801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<% 

          
	int NEW = 0;
	try { NEW = Integer.parseInt(request.getParameter("NEW"));} catch (Exception e) {}
	if (NEW == 1) {
	msgMC.destroy();
	}

   	if (msgMC == null) msgMC = new datapro.eibs.beans.EGL700801Message();
   	   
%>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
      
 %>
     <SCRIPT type="text/javascript">
            showErrors(); 
     </SCRIPT>
 <%
 }
%>
</head>
<body >
      
<H3 align="center">Proceso de Ajuste  Año Anterior y Actualizacion del Corriente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="contable_sel.jsp, EGL7008"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL7008">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="0002">
  <h5 align="center">Al pulsar el botón Ejecutar, se iniciaría el proceso de Ajuste del año anterior.<br>
  Se sugiere respaldar los reportes que se colocarán en su bandeja de user spool.</h5>
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Ejecutar">
  </p>
  
</form>
</body>      
</html>