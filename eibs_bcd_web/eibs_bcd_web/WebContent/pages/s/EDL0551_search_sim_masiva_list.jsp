<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<title>Provisión Adicional Masiva</title>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="eDL0551List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT Language="javascript">
var ok = false;

function goNew() 
{
	document.forms[0].SCREEN.value="2";	
	document.forms[0].submit();
}
 
function goMaintenance() 
{
	isCheck();
	if ( !ok ) 
	{
		alert("Favor seleccionar una registro");
		return;	 
	}
	document.forms[0].SCREEN.value="3";	
	document.forms[0].submit();
}

function goDetail() 
{
	isCheck();
	if ( !ok ) 
	{
		alert("Favor seleccionar una tabla");
		return;	 
	}
	document.forms[0].SCREEN.value="10";	
	document.forms[0].submit();
}


function goDelete() 
{
	isCheck();
	if ( !ok ) 
	{
		alert("Favor seleccionar un registro");
		return;	 
	}
		document.forms[0].SCREEN.value="9";
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
	<h3 align="center">Provisi&oacute;n Adicional Masiva<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="search_sim_masiva_list.jsp, EDL0551"></h3>
    <hr size="4">
<FORM name="form1" METHOD="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0551">
<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN">
<table class="tableinfo">
  <tr >
    <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
      <tr id="trdark">
        <td nowrap><div align="center">Identificación de Paquete  de Préstamos con Provisión Adicional :</div></td>
        <td nowrap><div align="left"><input type="text" readonly name="X" size="10" maxlength="9" value="<%= userPO.getHeader1()%>"></div></td>
		        
      </tr>
     
    </table></td>
  <p>&nbsp;</p>
<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>
		</td>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goMaintenance()"><b>Modificar</b></a></div>
		</td>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goDelete()"><b>Borrar</b></a></div>
		</td>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goDetail()"><b>Ejecutar Proceso de Seleccion de Prestamos </b></a></div>
		</td>

		<td class=TDBKG width="20%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>
<p>
<%
if (eDL0551List.getNoResult()) {
%>
</p>

<p>&nbsp;</p>
<TABLE class="tbenter" width="100%">
	<TR>
		<TD>
		<div align="center">
		<h4 style="text-align:center">No hay Parametros de Provisi&oacute;n  Adicional para mostrar.</h4>
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
				<th align=CENTER nowrap width="10%">Criterio de Selecci&oacute;n  </th>
				<th align=CENTER nowrap width="10%">Parametro Selecci&oacute;n </th>
				<th align=CENTER nowrap width="10%">Descripcion</th>
			</tr>
			<%
					eDL0551List.initRow();
					boolean firstTime = true;
					String chk = "";
					while (eDL0551List.getNextRow()) {
						if (firstTime) {
					firstTime = false;
					chk = "checked";
						} else {
					chk = "";
						}
						datapro.eibs.beans.EDL055101Message msgList = (datapro.eibs.beans.EDL055101Message) eDL0551List
						.getRecord();
			%>
			<tr>
				<td NOWRAP align=CENTER width="10%"><INPUT TYPE="radio"
					name="ROW" value="<%=eDL0551List.getCurrentRow()%>" <% out.print(chk); %>></td>
				<td NOWRAP align=CENTER width=\"10%\">
				
				<% if (msgList.getE01SIMTIP().equals("1")) {
								 out.print("MODALIDAD"); 
				   } 
				   if (msgList.getE01SIMTIP().equals("2")) {
								 out.print("CALIFICACION"); 
				   } 
				   if (msgList.getE01SIMTIP().equals("3")) {
								 out.print("TIPO PRODUCTO"); 
				   } 
				   if (msgList.getE01SIMTIP().equals("4")) {
								 out.print("PRODUCTO"); 
				   } 				   
				   if (msgList.getE01SIMTIP().equals("5")) {
								 out.print("MONTO PROVISION ADICIONAL"); 
				   } 				   				   		   
				 %></td>
				<td NOWRAP align=CENTER width=\"10%\">
				<% if (msgList.getE01SIMTIP().equals("1")) {
					out.print(msgList.getE01SIMMOD()); 	  
				   } 
				   if (msgList.getE01SIMTIP().equals("2")) {
					out.print(msgList.getE01SIMCAL());
				   } 
				   if (msgList.getE01SIMTIP().equals("3")) {
					out.print(msgList.getE01SIMTPR());
				   } 
				   if (msgList.getE01SIMTIP().equals("4")) {
					out.print(msgList.getE01SIMPRO());
				   } 				   
				   if (msgList.getE01SIMTIP().equals("5")) {
					out.print(msgList.getE01SIMAMT());
				   } 	
				%>
				</td>
				
				<td NOWRAP align=CENTER width=\"10%\">
				<% if (msgList.getE01SIMTIP().equals("1")) {
					out.print(msgList.getE01DESMOD()); 	  
				   } 
				   if (msgList.getE01SIMTIP().equals("2")) {
					out.print(msgList.getE01DESCAL());
				   } 
				   if (msgList.getE01SIMTIP().equals("3")) {
					out.print(msgList.getE01DESTIP());
				   } 
				   if (msgList.getE01SIMTIP().equals("4")) {
					out.print(msgList.getE01DESPRO());
				   } 				   
				   if (msgList.getE01SIMTIP().equals("5")) {
					out.print("MONTO");
				   } 	
				%>
				
				
				</td>
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
