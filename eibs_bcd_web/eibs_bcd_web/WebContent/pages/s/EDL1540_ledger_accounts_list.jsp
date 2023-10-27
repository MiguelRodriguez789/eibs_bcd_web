<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<jsp:useBean id= "EDL1540List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT Language="javascript">
var ok = false;
 
function goNew() 
{
	document.forms[0].SCREEN.value="31";
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
	document.forms[0].SCREEN.value="32";
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
		document.forms[0].SCREEN.value="34";
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

<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<title>Cuentas Contables NIIF 9 - Provision</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">
</head>
<body>
<h3 align="center">Cuentas Contables NIIF 9 - Provision<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ledger_accounts_list.jsp, EDL1540"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL1540" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" >

 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goNew()"><b>Crear</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goMaintenance()"><b>Modificar</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete()"><b>Borrar</b></a></div>
      </td>

      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <p> 
    <%
	if ( EDL1540List.getNoResult() ) {
 %>
  </p>
  
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> <h4 style="text-align:center"> No hay registros para mostrar.</h4></div>
	 </TD>
	</TR>
  </TABLE>
 <%  
	}
	else {
%> <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
  <p> 
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
          	<th align=CENTER nowrap width="10%">&nbsp;</th>
            <th align=CENTER nowrap width="10%">Banco</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Moneda</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Modalidad Credito/Impuesto</div>
            </th>
          </tr>
          <%
                EDL1540List.initRow();
				boolean firstTime = true;
				String chk = "";
                while (EDL1540List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.EDL154002Message msgRcd = (datapro.eibs.beans.EDL154002Message) EDL1540List.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <INPUT TYPE="radio" name="ROW"  value="<%= EDL1540List.getCurrentRow()%>" >
            </td>
            <td NOWRAP  align=CENTER width="10%"><%= msgRcd.getE02BNK() %></td>
            <td NOWRAP  align=CENTER width="10%"><%= msgRcd.getE02CCY() %></td>
            <td NOWRAP  align=CENTER width="10%">
            	<% if (msgRcd.getE02TPR().equals("H")) out.print("Hipotecario ");
					else if (msgRcd.getE02TPR().equals("M")) out.print("Microcredito");
					else if (msgRcd.getE02TPR().equals("C")) out.print("Consumo");
					else if (msgRcd.getE02TPR().equals("L")) out.print("Comercial");
					else if (msgRcd.getE02TPR().equals("T")) out.print("Impuesto");
			    else out.print("Otro"); %>
            </td>
          </tr>
          <%
                }
          %>
        </table>
  </table>
<%}%>
</form>
</body>
</html>
