<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<title>Provisión Adicional Masiva</title>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="eDL0552List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT Language="javascript">
var ok = false;


function goDetail() 
{
	isCheck();
	if ( !ok ) 
	{
		alert("Favor seleccionar una tabla");
		return;	 
	}
	document.forms[0].SCREEN.value="14";	
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
		document.forms[0].SCREEN.value="13";
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
	<h3 align="center">Prestamos Susceptibles Provisi&oacute;n Adicional Masiva<img
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
        <td nowrap><div align="right">Identificación de Paquete  de Préstamos con Provisión Adicional :</div></td>
        <td nowrap><input type="text" readonly name="X" size="10" maxlength="9" value="<%= userPO.getHeader1()%>">
        </td>
        <td nowrap><div align="right">Monto  :</div></td>
        <td nowrap><input type="text" readonly name="Z" size="25" maxlength="24" value="<%= userPO.getHeader6()%>"></td>
        <td nowrap><div align="right"></div></td>
        <td nowrap colspan="3">&nbsp;</td>
      </tr>
     
    </table></td>
  </tr>
</table>
<p>&nbsp;</p>
<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goDelete()"><b>Borrar</b></a></div>
		</td>
		<td class=TDBKG width="20%">
		<div align="center"><a href="javascript:goDetail()"><b>Enviar para Aprobaci&oacute;n </b></a></div>
		</td>

		<td class=TDBKG width="20%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>
<p>
<%
if (eDL0552List.getNoResult()) {
%>
</p>

<p>&nbsp;</p>
<TABLE class="tbenter" width="100%">
	<TR>
		<TD>
		<div align="center">
		<h4 style="text-align:center">No hay Prestamos Provisi&oacute;n  Adicional para mostrar.</h4>
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
				<th align=CENTER nowrap width="10%">N&uacute;mero  de Pr&eacute;stamo</th>
				<th align=CENTER nowrap width="10%">Calificaci&oacute;n</th>
				<th align=CENTER nowrap width="10%">Agencia</th>
				<th align=CENTER nowrap width="10%">Modalidad</th>
				<th align=CENTER nowrap width="10%">Días de <br> Mora</th>				
				<th align=CENTER nowrap width="10%">Capital</th>								
				<th align=CENTER nowrap width="10%">Provision Capital <br>Actual</th>												
				<th align=CENTER nowrap width="10%">Provision Adicional <br>a Realizar</th>																
				<th align=CENTER nowrap width="10%">Provision <br>Total</th>																				
				<th align=CENTER nowrap width="10%">% Provisión</th>																								
			</tr>
			<%
					eDL0552List.initRow();
					boolean firstTime = true;
					String chk = "";
					 double suma = 0;
		             double sumb = 0;
        		     double sumc = 0;
		             double sumd = 0;
					while (eDL0552List.getNextRow()) {
						if (firstTime) {
					firstTime = false;
					chk = "checked";
						} else {
					chk = "";
						}
						datapro.eibs.beans.EDL055102Message msgList = (datapro.eibs.beans.EDL055102Message) eDL0552List
						.getRecord();
						suma += msgList.getBigDecimalE02DLMMEP().doubleValue();
						sumb += msgList.getBigDecimalE02DLMPPR().doubleValue();						
						sumc += msgList.getBigDecimalE02DLMPAC().doubleValue();												
						sumd += msgList.getBigDecimalE02DLMPTO().doubleValue();																		
			%>
			<tr>
				<td NOWRAP align=CENTER width="10%"><INPUT TYPE="radio"
					name="ROW" value="<%=eDL0552List.getCurrentRow()%>" <% out.print(chk); %>></td>
			    <td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMACC() %></td>
				<td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMALI() %></td>
				<td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMBRN() %></td>
				<td NOWRAP align=CENTER width=\"10%\">
				<% if (msgList.getE02DLMMOD().equals("C")) {
					out.print("CONSUMO"); 	  
				   } 
				   if (msgList.getE02DLMMOD().equals("L")) {
					out.print("COMERCIAL"); 	  
				   } 
				   if (msgList.getE02DLMMOD().equals("H")) {
					out.print("VIVIENDA"); 	  
				   }
				   if (msgList.getE02DLMMOD().equals("M")) {
					out.print("MICROCREDITO"); 	  
				   }
				%>
				</td>
				<td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMMOR() %></td>
				<td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMMEP() %></td>
				<td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMPPR() %></td>
				<td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMPAC() %></td>
				<td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMPTO() %></td>
				<td NOWRAP align=CENTER width=\"10%\"><%= msgList.getE02DLMPPP() %></td>
			</tr>
			<%
			}
			%>
						<tr id="trdark">
				<th align=CENTER nowrap width="10%">&nbsp;</th>
				<th align=CENTER nowrap width="10%">&nbsp;</th>
				<th align=CENTER nowrap width="10%">&nbsp;</th>
				<th align=CENTER nowrap width="10%">&nbsp;</th>
				<th align=CENTER nowrap width="10%">&nbsp;</th>
				<th align=CENTER nowrap width="10%">TOTALES:</th>				
				<th align=CENTER nowrap width="10%"><%= Util.formatCCY(suma) %></th>								
				<th align=CENTER nowrap width="10%"><%= Util.formatCCY(sumb) %></th>												
				<th align=CENTER nowrap width="10%"><%= Util.formatCCY(sumc) %></th>																
				<th align=CENTER nowrap width="10%"><%= Util.formatCCY(sumd) %></th>																				
				<th align=CENTER nowrap width="10%">&nbsp;</th>																								
			</tr>
		</table>
</table>
<%
}
%>

</form>
</body>
</html>
