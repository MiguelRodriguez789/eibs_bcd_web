<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%> 
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO105001Message"%> 

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ECO105001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

  function goAction(op) {
	var ok = false;
	var cun = "";
	var pg = "";

	if (op != '300'){	//Checks something is selected except new 
	 	for(n=0; n<document.forms[0].elements.length; n++)
	     {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "E01COMNUM") 
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
      	
      	if (op =='205x'){// ventana emergente para consuta
    		var pg = document.forms[0].action + "?SCREEN=205&E01COMNUM=" + document.forms[0].E01COMNUM.value;
		    CenterWindow(pg,1000,500,2);
      	} else {
      		//por si es borrar
      		if (op =='500'){
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
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Convenios de Recaudos<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="collect_deal_list.jsp,ECO1050"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO1050">

<input type="hidden" name="SCREEN" value="200"> 

 <table  class="tableinfo">
    <tr id="trdark">   
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trdark">
             <td nowrap width="20%" align="right"> Número de Cliente: 
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
  
<table class="tbenter" width="100%">
	<tr>
		<td align="center" class="tdbkg" width="20%">
			<a href="#" onclick="goAction('300')"> <b>Crear</b> </a>
		</td>
		<td align="center" class="tdbkg" width="20%">
			<a
			href="javascript:goAction('400')"> <b>Modificar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="20%">
			<a href="javascript:goAction('500')"> <b>Borrar</b> </a>
		</td>
		<td align="center" class="tdbkg" width="20%">
			<a href="javascript:goActionDocuments()"> <b>Formularios PDF</b> </a>
		</td>			
		<td align="center" class="tdbkg" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<% if (ECO105001List.getNoResult()) { %>
<TABLE class="tbenter" width=100% height="50%" border="0">
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
				<th align="center" nowrap width="5%">&nbsp;</th>
				<th align="center" nowrap width="10%">Codigo<br>Convenio</th>
				<th align="center" nowrap width="25%">Descripción</th>
				<th align="center" nowrap width="15%">Categoria</th>
				<th align="center" nowrap width="15%">Tipo de Servicio</th>
				<th align="center" nowrap width="15%">Estado</th>
				<th align="center" nowrap width="15%">Fecha de<br>Aprobación</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			ECO105001List.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (ECO105001List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ECO105001Message convObj = (ECO105001Message) ECO105001List.getRecord();
		%>
          <tr id="dataTable<%= ECO105001List.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="E01COMNUM" id="E01COMNUM" value="<%=convObj.getE01COMNUM()%>; <%= ECO105001List.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= ECO105001List.getCurrentRow() %>)" ></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('205');"><%=Util.formatCell(convObj.getE01COMNUM())%></a></td>
			<td nowrap align="left" width="25%"><a href="javascript:goAction('205');"><%=convObj.getE01COMDCO()%></a></td>
			<td nowrap align="center" width="15%"><a href="javascript:goAction('205');"><%=convObj.getE01COMINC()%> </a></td>
			<td nowrap align="center" width="15%"><a href="javascript:goAction('205');"><%=convObj.getE01COMDTS()%> </a></td>	
			<td nowrap align="center" width="15%"><a href="javascript:goAction('205');"><%=convObj.getE01COMDST()%> </a></td>	
			<td nowrap align="center" width="15%"><a href="javascript:goAction('205');"><%=Util.formatCustomDate(currUser.getE01DTF(),
																								convObj.getBigDecimalE01COMAMM().intValue(),
																								convObj.getBigDecimalE01COMADD().intValue(),
																								convObj.getBigDecimalE01COMAYY().intValue())%></a>

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
			if (ECO105001List.getShowPrev()) {
      			 int pos = ECO105001List.getFirstRec() - 20;
      			 out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSECO1050?SCREEN=200&E01COMCUN=" + userPO.getCusNum() +  "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ECO105001List.getShowNext()) {
      			int pos = ECO105001List.getLastRec()-1;
      			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSECO1050?SCREEN=200&E01COMCUN=" + userPO.getCusNum() + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

				}
		%>
		</td>
	</tr>
</table>

<SCRIPT type="text/javascript">
 	showChecked("E01COMNUM");
</SCRIPT>

<% } %>
</form>

</body>
</html>
