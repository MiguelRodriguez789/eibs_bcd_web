<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO001001Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ECO001001List" class="datapro.eibs.beans.JBObjList" scope="session" />
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
	      	if(element.name == "E01COSNUM") 
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
      	
      	if (op =='400'){
    		var pg = document.forms[0].action + "?SCREEN=400&E01COSNUM=" + document.forms[0].E01COSNUM.value;
		    CenterWindow(pg,600,500,2);
      	} else {
      		if (op =='202'){
      			confirm1 = confirm("Desea Eliminar el convenio seleccionado?");
      		}
      		if (confirm1){
				document.forms[0].SCREEN.value = op;
				document.forms[0].submit();		
			}
      	}

     } else {
		alert("Debe seleccionar un convenio para continuar.");	   
	 }
      
	}
	
  function goActionDocuments() {
	var ok = false;
	var cun = "";
	var pg = "";
	var cosnum = '0';
	
	 	for(n=0; n<document.forms[0].elements.length; n++)
	    {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "E01COSNUM") 
	      	{	
	      		if (element.checked == true) {
        			ok = true;
        			cosnum =  element.value;
        			break;
				}
	      	}
	     }
      
      if ( ok ) {
      	var url_doc = '<%=request.getContextPath()%>/pages/s/EFRM000_pdf_form.jsp?SCREEN=1&OPE_CODE=85&CUST_NUMBER='+document.forms[0].cusNum.value+'&REQ_NUMBER='+cosnum;
      	getPdfForms(url_doc);
     } else {
		alert("Debe seleccionar un convenio para continuar.");	   
	 }
      
	}	
</script>

</head>

<body>
<% 
boolean evaluation = request.getParameter("evaluation")!=null?request.getParameter("evaluation").equals("true")?true:false:false;

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Solicitudes de Convenios<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="covenant_list.jsp,ECO0010"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010">
<input type="hidden" name="SCREEN" value="201"> 

 <table  class="tableinfo">
    <tr id="trdark">   
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
             <td nowrap width="20%" align="right"> Empleador: 
              </td>
             <td nowrap width="15%" align="left">
	  			<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="15%" align="right">Identificación:  
             </td>
             <td nowrap width="15%" align="left">
	  			<eibsinput:text name="userPO" property="ID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
             <td nowrap width="15%" align="right"> Nombre: 
               </td>
             <td nowrap width="20%"align="left">
	  			<eibsinput:text name="userPO" property="cusName" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
<%if (evaluation){ %>
<table class="tbenter" width="100%">
	<tr>
		<td align="center" class="tdbkg" width="50%">
			<a href="javascript:goAction('300')"> <b>Evaluar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>
<%} else { %>
<table class="tbenter" width="100%">
	<tr>
		<td align="center" class="tdbkg" width="15%">
			<a href="#" onclick="goAction('200')"> <b>Crear</b> </a>
		</td>
		<td align="center" class="tdbkg" width="15%">
			<a
			href="javascript:goAction('201')"> <b>Modificar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goAction('300')"> <b>Datos Adicionales</b> </a>
		</td>
		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goAction('202')"> <b>Borrar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goAction('400')"> <b>Documento</b> </a>
		</td>
		<td align="center" class="tdbkg" width="15%">
			<a href="javascript:goActionDocuments()"> <b>Formularios PDF</b> </a>
		</td>			
		<td align="center" class="tdbkg" width="15%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>
<%} %>

<% if (ECO001001List.getNoResult()) { %>
<TABLE class="tbenter" width=100% height=90%>
	<TR>
		<TD>
			<div align="center"><font size="3"><b> No hay resultados que correspondan a su criterio de búsqueda. </b></font>
			</div>
		</TD>
	</TR>
</TABLE>
<% } else { %>
   <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap width="5%"></th>
				<th align="center" nowrap width="20%">N&uacute;mero</th>
				<th align="center" nowrap width="25%">Cliente Convenio</th>
				<th align="center" nowrap width="20%">Estado</th>
				<th align="center" nowrap width="20%">Fecha</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			ECO001001List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ECO001001List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECO001001Message convObj = (ECO001001Message) ECO001001List
							.getRecord();
		%>
          <tr id="dataTable<%= ECO001001List.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="E01COSNUM" id="E01COSNUM" value="<%=convObj.getE01COSNUM()%>; <%= ECO001001List.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ECO001001List.getCurrentRow() %>)" ></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><%=Util.formatCell(convObj.getE01COSNUM())%></a></td>
			<td nowrap align="center" width="25%"><a href="javascript:goAction('203');"><%=convObj.getE01CONNA1()%></a></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><% if (convObj.getE01COSSTS().equals("1")) out.print("<b>Pendiente</b>"); 
																			 if (convObj.getE01COSSTS().equals("2")) out.print("<b>Evaluado</b>");
																			 if (convObj.getE01COSSTS().equals("3")) out.print("<b>Vigente</b>");
																			 if (convObj.getE01COSSTS().equals("4")) out.print("<b>Expirado</b>"); %></a></td>
			<td nowrap align="center" width="20%"><a href="javascript:goAction('203');"><%=Util.formatCustomDate(currUser.getE01DTF(),
																								convObj.getBigDecimalE01COSFIM().intValue(),
																								convObj.getBigDecimalE01COSFID().intValue(),
																								convObj.getBigDecimalE01COSFIY().intValue())%></a>

			</td>
		</tr>
		<% } %>
             </table>
             </div>
             </td>
             </tr>
</table>


<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ECO001001List.getShowPrev()) {
					int pos = ECO001001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECO0010?SCREEN=100&customer_number="
									+ request.getAttribute("customer_number")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ECO001001List.getShowNext()) {
					int pos = ECO001001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECO0010?SCREEN=100&customer_number="
									+ request.getAttribute("customer_number")
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>

<SCRIPT type="text/javascript">
 	showChecked("E01COSNUM");
</SCRIPT>

<% } %>
</form>

</body>
</html>
