<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Mantenimiento de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "lnBasic" class= "datapro.eibs.beans.EDL037002Message" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckACC(){
	if ( getElement("E02DEAACC").value.length < 1) {
		alert("Ingresar una cuenta válida");
	    getElement("E02DEAACC").value='';
	    getElement("E02DEAACC").focus();
	} else {
		document.forms[0].submit();
	}
}

</SCRIPT>
</head>
<body>
<% if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }%>

<h3 align="center">Mantenimiento de Comisiones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="commssions_search,EDL0372"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0372">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2000">
<br>
<br>
<br>
<br>
<br>
<table class="tbenter" width="100%" >
	<tr> 
	    <td nowrap align="right">Número de Cuenta : </td>
	    <td nowrap align="left">
        	<INPUT type="text" name="E02DEAACC" id="E02DEAACC" size="14" maxlength="13" value="<%= lnBasic.getE02DEAACC() %>" onkeypress="enterInteger(event)" onchange="CheckACC();">
            <a href="javascript:GetAccount('E02DEAACC','','10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
 		</td>
	</tr>
	<tr align="center" >
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center">
			<input id="EIBSBTN" type="submit" name="Submit" onclick="CheckACC()" value="Enviar">
		</div>
		</td>
	</tr>
</table>
    
</form>
</body>
</html>
