<html> 
<head>
<title>Declaraciones de Ingreso</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">

function checkAccount() {
	if (document.forms[0].E01DIPACC.value == "") {
		alert("Se necesita un número de Cuenta para esta opción.");
		return false;
	}
}

</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
 
 String option = "CC";
 if (userPO.getAccOpt().equals("L")) option = "10"; 
 if (userPO.getAccOpt().equals("C")) option = "51"; 

%>

</head>
<body>

<H3 align="center">Asociación de Declaraciones de Ingreso/Salida
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_account, ELC0430"></H3>
<hr size="4">

<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0430" onsubmit="checkAccount()">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1500">
<INPUT TYPE=HIDDEN NAME="H01FLGWK1" VALUE="<%= userPO.getAccOpt() %>">

<DIV ALIGN="center">
<TABLE CLASS="tbenter" WIDTH="100%" BORDER="0">
	<TR>
		<TD width="50%" align="right">N&uacute;mero de
		 	<%=("L".equals(userPO.getAccOpt())?"Préstamo":
		 	   ("C".equals(userPO.getAccOpt())?"Cobranza":
		 	    "Operación"))%>
		</TD>
		<TD width="50%">
			<DIV>
				<INPUT TYPE="text" NAME="E01DIPACC" SIZE="14" MAXLENGTH="12" onkeypress="enterInteger(event)"> 
            	<a href="javascript:GetAccount('E01DIPACC','','<%= option %>','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
        	</DIV>    
		</TD>
	</TR>
	<TR>
		<TD width="50%" align="right">Número/Secuencia Pago:	</TD>
		<TD width="50%">
			<DIV>
				<INPUT TYPE="text" NAME="E01DIPCOR" SIZE="4" MAXLENGTH="2" onkeypress="enterInteger(event)"> 
        	</DIV>    
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2">
			<DIV ALIGN="center"><BR><INPUT ID="EIBSBTN" TYPE="submit" NAME="Submit" VALUE="Enviar"></DIV>
		</TD>
	</TR>
</TABLE>
</DIV>

</form>
</body>
</html>
