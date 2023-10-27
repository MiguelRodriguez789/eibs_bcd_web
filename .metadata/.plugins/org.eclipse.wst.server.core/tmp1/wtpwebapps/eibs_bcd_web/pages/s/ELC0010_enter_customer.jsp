<html> 
<head>
<title>Declaraciones de Ingreso</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript">

function checkCustomer() {
	if (document.forms[0].E01CUBCUN.value == "") document.forms[0].E01CUBCUN.value = "999999999";
}

</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%>

</head>
<body>

<H3 align="center">Consulta de Beneficiarios
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_customer, ELC0010"></H3>
<hr size="4">

<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0010" onsubmit="checkCustomer()">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1500">
	
<DIV ALIGN="center">
<TABLE CLASS="tbenter" WIDTH="100%" BORDER="0">
	<TR>
		<TD width="50%" align="right">N&uacute;mero del Cliente:		</TD>
		<TD width="50%">
			<DIV>
				<INPUT TYPE="text" NAME="E01CUBCUN" SIZE="13" MAXLENGTH="12" onkeypress="enterInteger(event)"> 
            	<a href="javascript:GetCustomerDescId('E01CUBCUN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
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
