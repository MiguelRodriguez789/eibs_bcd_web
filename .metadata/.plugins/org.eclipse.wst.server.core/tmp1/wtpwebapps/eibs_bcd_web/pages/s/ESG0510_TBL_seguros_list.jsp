<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESG051001Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado Tablas de Seguros</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ESG051001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

  function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";

	if (op != '200'){	//Checks something is selected
	 	for(n=0; n<document.forms[0].elements.length; n++)
	     {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "E01SGTPLN") 
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
		alert("Debe seleccionar un numero de tabla de seguros para continuar.");	   
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

<h3 align="center">Tablas de Seguros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="TBL_seguros_list.jsp,ESG0510"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0510">
<input type="hidden" name="SCREEN" value="201"> 

  <table class="tableinfo" style="width: 970px">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
             <td nowrap width="10%" align="right"> Codigo : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Descripcion : 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="userPO" property="cusName" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
<table class="tbenter" style="width: 1040px">
	<tr>
		<td align="center" class="tdbkg" width="20%"><a href="#"
			onclick="goAction('200')"> <b>Crear</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="javascript:goAction('202')"> <b>Borrar</b> </a></td>
		<td align="center" class="tdbkg" width="20%"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<% if (ESG051001List.getNoResult()) { %>
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
<% } else { %>

 <TABLE  id="mainTable" class="tableinfo sortable" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
    			<TR id="trdark">  
					<th align="center" nowrap width="5%"></th>
					<th align="center" nowrap width="5%">Plan</th>
					<th align="center" nowrap width="30%">Descripcion</th>
					<th align="center" nowrap width="10%">Monto Asegurado</th>
					<th align="center" nowrap width="10%">Monto Prima</th>
					<th align="center" nowrap width="10%">Termino </th>
					<th align="center" nowrap width="10%">Estado</th>
	         </tr>
	        </table>
	        </td>
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			ESG051001List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ESG051001List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ESG051001Message convObj = (ESG051001Message) ESG051001List.getRecord();
		%>
		<tr id="dataTable<%= ESG051001List.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="E01SGTPLN" name="E01SGTPLN" value="<%=convObj.getE01SGTPLN()%>;<%=ESG051001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ESG051001List.getCurrentRow() %>)"/></td>
			<td nowrap align="center" width="5%"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01SGTPLN())%></a></td>
			<td nowrap align="left" width="30%"><a href="javascript:goAction('203');"><%=convObj.getE01SGTDSC()%></a></td>
			<td nowrap align="right" width="10%"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01SGTMTS())%> <%=convObj.getE01SGTCYS()%></a></td>
			<td nowrap align="right" width="10%"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01SGTMTP())%> <%=convObj.getE01SGTCYP()%></a></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01SGTTRM())%></a></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('203');"><% if (convObj.getE01SGTSTS().equals("1")) out.print("<b>Vigente</b>"); 
																			 if (convObj.getE01SGTSTS().equals("2")) out.print("<b>No Disponible</b>");  %> </a></td>
		</tr>
		<%
			}
		%>
		</table>
	</div>
</td>
</tr>
</TABLE>

<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ESG051001List.getShowPrev()) {
					int pos = ESG051001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSESG0510?SCREEN=100&cusNum="
									+ request.getAttribute("cusNum")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ESG051001List.getShowNext()) {
					int pos = ESG051001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSESG0510?SCREEN=100&cusNum="
									+ request.getAttribute("cusNum")
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
<SCRIPT type="text/javascript">
	showChecked("E01SGTPLN");
</SCRIPT>
</body>
</html>

