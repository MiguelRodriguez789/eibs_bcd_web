<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESG001001Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado de Polizas de Seguros</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ESG001001List" class="datapro.eibs.beans.JBObjList"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

  function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";

	if (op != '200'){	//Checks something is selected
	 	for(n=0; n<document.forms[0].elements.length; n++)
	     {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "E01PACNUM") 
	      	{	
	      		if (element.checked == true) {
        			ok = true;
        			break;
				}
	      	}
	      }
      } else {
      	ok = true;
      }
      
      if ( ok ) {
      	var confirm1 = true;
      	
      	if (op =='202'){
      		confirm1 = confirm("Desea Eliminar el Seguro seleccionado?");
      	}
		if (confirm1){
			document.forms[0].SCREEN.value = op;
			document.forms[0].submit();		
		}		

     } else {
		alert("Debe seleccionar un numero de seguros para continuar.");	   
	 }
      
	}
</script>

</head>

<body>
<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Polizas de Seguros<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="PAC_seguros_list.jsp,ESG0010"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0010">
<input type="hidden" name="SCREEN" value="201"> 

  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="10%" align="right"> Cliente : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Nombre : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="userPO" property="cusName" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Identificación :  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="userPO" property="ID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>

<%
	if (ESG001001List.getNoResult()) {
%>
  
<table class="tbenter" width="100%">
	<tr>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<table class="tbenter" width=100% height=90%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
%>

<table class="tbenter" width="100%">
	<tr>
<%-- 		<td align="center" class="tdbkg" width="20%"><a href="#"
			onclick="goAction('200')"> <b>Crear</b> </a></td>  --%>
			<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
<%--		<td align="center" class="tdbkg" width="20%"><a
    		href="javascript:goAction('202')"> <b>Borrar</b> </a></td>  --%>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

	<table id="headTable" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="5%"></th>
			<th align="center" nowrap width="15%">N&uacute;mero</th>
			<th align="center" nowrap width="15%">Prestamo</th>
			<th align="center" nowrap width="40%">Descripcion</th>
			<th align="center" nowrap width="15%">Estado</th>
			<th align="center" nowrap width="10%">Fecha</th>
		</tr>
		<%
			ESG001001List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ESG001001List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ESG001001Message convObj = (ESG001001Message) ESG001001List.getRecord();
		%>
		<tr>
			<td nowrap align="center"><input type="radio" name="E01PACNUM"	value="<%=convObj.getE01PACNUM()%>" <%=chk%>/></td>
			<td nowrap align="center"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01PACNUM())%></a></td>
			<td nowrap align="center"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01PACACC())%></a></td>
			<td nowrap align="left"><a href="javascript:goAction('203');"><%=convObj.getE01PACDSC()%></a></td>
			<td nowrap align="center"><a href="javascript:goAction('203');"><% if (convObj.getE01PACSTS().equals("1")) out.print("<b>Vigente</b>"); 
																			 if (convObj.getE01PACSTS().equals("2")) out.print("<b>Cancelado</b>");
																			 if (convObj.getE01PACSTS().equals("3")) out.print("<b>Bloqueado</b>");
																			 if (convObj.getE01PACSTS().equals("4")) out.print("<b>Suspendido</b>"); %></a></td>
			<td nowrap align="center"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01PACFID() + "/"	+ convObj.getE01PACFIM() + "/" + convObj.getE01PACFIY())%></a>
			</td>
			<td nowrap align="center"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01DSCRTY())%></a></td>
		</tr>
		<%
			}
		%>
	</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ESG001001List.getShowPrev()) {
					int pos = ESG001001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSESG0010?SCREEN=100&customer_number="
									+ request.getAttribute("customer_number")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ESG001001List.getShowNext()) {
					int pos = ESG001001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSESG0010?SCREEN=100&customer_number="
									+ request.getAttribute("customer_number")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>
<%
	}
%>
</form>

</body>
</html>

