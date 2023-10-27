<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<title>Detalle de Indicadores de Cartera</title>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="edl0536List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT Language="javascript">
var ok = false;

function goNew() 
{
	document.forms[0].SCREEN.value="12";	
	document.forms[0].submit();
}

function goSalir() 
{
	document.forms[0].SCREEN.value="1";	
	document.forms[0].submit();
}

 
function goMaintenance() 
{
	isCheck();
	if ( !ok ) 
	{
		alert("Favor seleccionar una tabla");
		return;	 
	}
	document.forms[0].SCREEN.value="13";	
	document.forms[0].submit();
}



function goDelete() 
{
	isCheck();
	if ( !ok ) 
	{
		alert("Favor seleccionar una tabla");
		return;	 
	}
		document.forms[0].SCREEN.value="19";
	    if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
	
	
}

function isCheck() 
{
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) 
	{
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") 
      	{
			if (document.forms[0].elements[n].checked == true) 
			{
				ok = true;
				break;
			}
      	}
    }
}


</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">
</head>
<body>
	<h3 align="center">Detalle de Indicadores para Provisi&oacute;n de Cartera<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="search_ind_list_formula.jsp, EDL0536"></h3>
	
	<h3 align="center"> <%out.print(userPO.getHeader21()+'-'+userPO.getHeader22()); %></h3>
<hr size="4">
<FORM name="form1" METHOD="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0536">
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN">

<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="50%">
		<div align="center"><a href="javascript:goMaintenance()"><b>Consultar</b></a></div>
		</td>
		<td class=TDBKG width="50%">
		<div align="center"><a href="javascript:goSalir()"><b>Salir</b></a></div>
		
		</td>
	</tr>
</table>
<p>
<%
if (edl0536List.getNoResult()) {
%>
</p>

<p>&nbsp;</p>
<TABLE class="tbenter" width="100%">
	<TR>
		<TD>
		<div align="center">
		<h4 style="text-align:center">No hay Detalle de Indicadores para mostrar.</h4>
		</div>
		</TD>
	</TR>
</TABLE>
<%
} else {
%> <%
 			if (!error.getERRNUM().equals("0")) {
 			error.setERRNUM("0");
 			out.println("<SCRIPT Language=\"Javascript\">");
 			out.println("       showErrors()");
 			out.println("</SCRIPT>");
 		}
 %>
<p><br>
<table id=cfTable class="tableinfo">
	<tr>
		<td NOWRAP valign="top" width="100%">
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align=CENTER nowrap width="10%">&nbsp;</th>
				<th align=CENTER nowrap width="10%">Indicador</th>
				<th align=CENTER nowrap width="10%">Secuencia</th>
				<th align=CENTER nowrap width="10%">Cta.Contable Inicial</th>
				<th align=CENTER nowrap width="10%">Cta.Contable Final</th>
				<th align=CENTER nowrap width="10%">Ubicaci&oacute;n</th>
				<th align=CENTER nowrap width="10%">Suma/Resta</th>
				
				
			</tr>
			<%
					edl0536List.initRow();
					boolean firstTime = true;
					String chk = "";
					while (edl0536List.getNextRow()) {
						if (firstTime) {
					firstTime = false;
					chk = "checked";
						} else {
					chk = "";
						}
						datapro.eibs.beans.EDL053602Message msgList = (datapro.eibs.beans.EDL053602Message) edl0536List
						.getRecord();
			%>
			<tr>
				<td NOWRAP align=CENTER width="10%"><INPUT TYPE="radio"
					name="ROW" value="<%=edl0536List.getCurrentRow()%>" <% out.print(chk); %>></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE02INDCDE()%></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE02INDSEQ()%></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE02INDGLI()%></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE02INDGLF()%></td>
				<td NOWRAP align=CENTER width=\"10%\"><% if (msgList.getE02INDPOS().equals("N")) out.print("Numerador"); else out.print("Denominador");%></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE02INDOPE()%></td>
				
			</tr>
			<%
			}
			%>
		</table>
</table>
<%
}
%>

</form>
</body>
</html>
