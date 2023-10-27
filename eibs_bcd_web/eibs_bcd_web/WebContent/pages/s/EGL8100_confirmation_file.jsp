<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>File Confirmation </title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "repInfo" class= "datapro.eibs.beans.EGL810001Message"  scope="session" />

<SCRIPT type="text/javascript">
	function goAction(opt){
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL8100?SCREEN=300";
		CenterNamedWindow(page,'XML',800,500,4);		
	}

</SCRIPT>
	
</head>

<body>

 
<h3 align="center">
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="confirmation_file, EGL8100" ></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL8100">

<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
<br><br>
  <table width="100%" class="tbenter">
          <tr>
          	<TD align="CENTER" class="TDBKG" width="50%" style="border-color: white;">
	  			<a href="javascript:goAction('V')"><b>Visualizar</b></a></TD>
          	<TD align="CENTER" class="TDBKG" width="50%" style="border-color: white;">
	  			<a href="javascript:checkClose()"><b>Salir</b></a></TD>
	  		</tr>
	  		<tr><td colspan="2">&nbsp;</td></tr>	
          <tr> 
          <td align="center" colspan="2" style="border-color: white;"><h2>El Archivo 
           <% if (userPO.getOption().equals("CC")) out.print("Catalogo de Cuentas"); 
           else if (userPO.getOption().equals("BA")) out.print("Balanza de Comprobacion");
			else if (userPO.getOption().equals("PO")) out.print("Polizas del Periodo");
			else if (userPO.getOption().equals("FO")) out.print("Auxiliar de Folios");
			else if (userPO.getOption().equals("AC")) out.print("Auxiliar de Cuentas"); %>
            ha sido sometido satisfactoriamente .</h2> </td>
          </tr>
  </table>

</form>
</body>
</html>
