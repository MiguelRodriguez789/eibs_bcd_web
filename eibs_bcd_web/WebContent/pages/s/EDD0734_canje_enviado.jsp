<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Canje - Canje Enviado</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/>
 
<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.EDD0734DSMessage"  scope="session"  />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">


<%int row = 0; %>


	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
}
</SCRIPT>


</head>
<body>
	<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");

  out.println("<SCRIPT> initMenu(); </SCRIPT>");				
		
		}
	%>
	<div align="center">
		<h3>
			Canje Enviado - Canje<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="canje_enviado.jsp,EDD0734">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0734">
		<h4>Informaci�n B�sica</h4>
		<input type="hidden" name="SCREEN" value="5">

		<table class="tableinfo">
			<tr>
				<td align="center">
				Esta opci�n generar� el Archivo de Canje y lo enviar� via FTP.<br>
				Asegurese que todos los cajeros esten cerrados.<br>
				<BR><BR>
				Al finalizar el proceso se producir� el reporte DD7000. 
 				</td>      
    		</tr>
  		</table>

	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
     	  </div>	
  		</td>
  	</tr>	
  </table>	


		
	</form>
	
</body>
</html>
