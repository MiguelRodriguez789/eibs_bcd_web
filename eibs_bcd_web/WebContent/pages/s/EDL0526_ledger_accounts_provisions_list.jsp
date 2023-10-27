<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
<head>
<jsp:useBean id= "EDL0526List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

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
		alert("Favor seleccionar una tabla");
		return;	 
	}
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

<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<title>Tabla de Provision Cuentas Contables</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Rational Software Architect">
</head>
<body>
<h3 align="center">Tabla de Provision Cuentas Contables<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ledger_accounts_provisions_list.jsp, EDL0526"></h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0526" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" >

 
  <table class="tbenter" width=100% align=center>
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goNew()"><b>Crear Tabla</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goMaintenance()"><b>Modificar Tabla</b></a></div>
      </td>
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goDelete()"><b>Borrar Tabla</b></a></div>
      </td>

      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <p> 
    <%
	if ( EDL0526List.getNoResult() ) {
 %>
  </p>
  
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> <h4 style="text-align:center"> No hay tablas para mostrar.</h4></div>
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
            <th align=CENTER nowrap width="10%">Clase de Credito</th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Categoria de Riesgo</div>
            </th>
            <th align=CENTER nowrap width="10%"> 
              <div align="center">Tipo de provision</div>
            </th>
          </tr>
          <%
                EDL0526List.initRow();
				boolean firstTime = true;
				String chk = "";
                while (EDL0526List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                  	datapro.eibs.beans.EDL052601Message msgList = (datapro.eibs.beans.EDL052601Message) EDL0526List.getRecord();
		 %>
          <tr> 
            <td NOWRAP  align=CENTER width="10%"> 
              <INPUT TYPE="radio" name="ROW"  value="<%= EDL0526List.getCurrentRow()%>" >
            </td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01PCCTPC() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getE01PCCCRG() %></td>
            <td NOWRAP  align=CENTER width=\"10%\"><%= msgList.getD01PCCTPP() %></td>
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
