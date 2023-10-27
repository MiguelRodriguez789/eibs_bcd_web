<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css"	rel="stylesheet">
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<title>EDL0528_app_ind_list</title>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="edl1528AppList" class="datapro.eibs.beans.JBObjList" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT Language="javascript">
var ok = false;

function goApprove() 
{
	isCheck();
	if ( !ok ) 
	{
		alert("Favor seleccionar una tabla");
		return;	 
	}
	document.forms[0].SCREEN.value="2";	
	document.forms[0].submit();
}
 
 function enterReason(){
 
 	isCheck();
	if ( !ok ) 
	{
		alert("Favor seleccionar una tabla");
		return;	 
	}
	if (!confirm("Desea rechazar el elemento seleccionado?")) {
		return;
	}

	var page= prefix +language + 'EDL1528_enter_reason_text.jsp';
	CenterWindow(page,500,430,3);
 }

 function goReject(reason) 
 {
 	getElement("E02MSGTXT").value=reason;
	document.forms[0].SCREEN.value="3";	
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
	if (!confirm("Desea borrar el registro seleccionado?")) {
		return;
	}
	document.forms[0].SCREEN.value="4";		
	document.forms[0].submit();
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
	<h3 align="center">Aprobación Parametros Metodología<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="app_ind_list.jsp, EDL0528"></h3>
<hr size="4">
<FORM name="form1" METHOD="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL1528">
<INPUT TYPE=HIDDEN NAME="SCREEN">
<INPUT TYPE=HIDDEN NAME="E02MSGTXT">

<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="30%">
		<div align="center"><a href="javascript:goApprove()"><b>Aprobar</b></a></div>
		</td>
		<td class=TDBKG width="30%">
		<div align="center"><a href="javascript:enterReason()"><b>Rechazar</b></a></div>
		</td>
		<td class=TDBKG width="30%">
		<div align="center"><a href="javascript:goDelete()"><b>Eliminar</b></a></div>
		</td>
		<td class=TDBKG width="30%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>
<p>
<%
if (edl1528AppList.getNoResult()) {
%>
</p>

<p>&nbsp;</p>
<TABLE class="tbenter" width="100%">
	<TR>
		<TD>
		<div align="center">
		<h4 style="text-align:center">No hay tablas para mostrar.</h4>
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
				<th align=CENTER nowrap width="10%">Año</th>
				<th align=CENTER nowrap width="10%">Mes</th>
				<th align=CENTER nowrap width="10%">Indicador</th>
				<th align=CENTER nowrap width="10%">DEscripción</th>				
			</tr>
			<%
					edl1528AppList.initRow();
					boolean firstTime = true;
					String chk = "";
					while (edl1528AppList.getNextRow()) 
					{
						if (firstTime) 
						{
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						datapro.eibs.beans.EDL152801Message msgList = (datapro.eibs.beans.EDL152801Message) edl1528AppList
						.getRecord();
			%>
			<tr>
				<td NOWRAP align=CENTER width="10%"><INPUT TYPE="radio"
					name="ROW" value="<%=msgList.getE01TADIND() + "_" + msgList.getE01TADCPY() + "_" + msgList.getE01TADCPM()%>" <% out.print(chk); %>></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE01TADCPY()%></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE01TADCPM()%></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE01TADIND()%></td>
				<td NOWRAP align=CENTER width=\"10%\"><%=msgList.getE01TADDSC()%></td>
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
