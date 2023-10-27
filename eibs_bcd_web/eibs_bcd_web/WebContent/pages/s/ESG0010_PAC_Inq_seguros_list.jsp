<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ESG001001Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado de PAC de Seguros</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ESG001001List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>	
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.7.2.js"> </script>
<script type="text/javascript">

<%if (userPO.getOption().equals("LN") && userPO.getPurpose().equals("INQUIRY")){ %>
	<% if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
		builtNewMenu(ln_i_1_opt);
	
	<% } else { %>
		builtNewMenu(ln_i_2_opt);
	
	<% } %>
	initMenu();
<% } %>


$(function(){
	$("#key").attr("checked", false);
});



function goAction(op,index) {

document.forms[0].elements[index].checked = true;
$("input[name=key][value=" + index + "]").prop('checked', true); 
     document.forms[0].SCREEN.value = op;
	document.forms[0].submit();

}
  
 function showAddInfo(idxRow){
   //tbAddInfo.rows[0].cells[1].style.color="#d0122c";   
   //tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(document.forms[0]["TXTDATA"+idxRow].value,4);
   } 
   
 function extraInfo(textfields,noField) {
	 var pos=0
	 var s= textfields;
	 for ( var i=0; i<noField ; i++ ) {
	   pos=textfields.indexOf("<br>",pos+1);
	  }
	 s=textfields.substring(0,pos);
	 return(s);
 }  

  function goActionDocuments() {
	var ok = false;
	var cun = "";
	var pg = "";
	var cosnum = '0';
	var codseg = '';
	
	 	for(n=0; n<document.forms[0].elements.length; n++)
	    {
	      	var element = document.forms[0].elements[n];
	      	if(element.name == "key") 
	      	{	
	      		if (element.checked == true) {
        			ok = true;   			
        			cosnum =  eval("document.forms[0].PAC"+element.value+".value");
        			codseg =  eval("document.forms[0].COD"+element.value+".value");
        			break;
				}
	      	}
	     }
      
      if ( ok ) {
      	var url_doc = '<%=request.getContextPath()%>/pages/s/EFRM000C_pdf_form.jsp?SCREEN=1&OPE_CODE=87&CUST_NUMBER='+document.forms[0].cusNum.value+'&REQ_NUMBER='+cosnum+'&REQ_CODSEG='+codseg;      	
      	getPdfForms(url_doc);
     } else {
		alert("Debe seleccionar un seguro para continuar.");	   
	 }
      
	}	
</script>

</head>

<body>
<%if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Polizas de Seguros
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="PAC_Inq_seguros_list.jsp,ESG0010"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESG0010I">
<input type="hidden" name="SCREEN" value="201"> 

  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
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
  <br>

<table class="tbenter" width="100%">
	<tr>
		<td align="center"  width="15%">&nbsp;</td>
		<td align="center" width="15%">&nbsp;</td>
		<td align="center"  width="15%">&nbsp;</td>
		<td align="center" width="15%">&nbsp;</td>
		<td align="center" width="15%"><!-- <a	
			href="javascript:goActionDocuments()"> <b>Formularios PDF</b> </a> --></td>
		<td align="center" width="15%">&nbsp;</td>			
	</tr>
</table>

<%
	if (ESG001001List.getNoResult()) {
%>
<table class="tableinfo" width=100% height=90%>
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


<% if(request.getAttribute("flag").equals("E")){ %>
<table class="tbenter" width=100% height=10%>
	<tr>
		<td>
		<div align="center">
			<font size="2">
				<b> Información de Siniestros no disponible, reporte este problema. </b>
			</font>
		</div>
		</td>
	</tr>
</table>

<%} %>


	<table  class="tableinfo"  width="100%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">	
		<tr id="trdark">
			<th align="center" nowrap width="5%"></th>
			<th align="center" nowrap width="10%">N&uacute;mero</th>
			<th align="center" nowrap width="5%">Empr</th>
			<th align="center" nowrap width="10%">Prestamo</th>		
			<th align="center" nowrap width="5%">Codigo</th>
			<th align="center" nowrap width="5%">Plan</th>
			<th align="center" nowrap width="30%">Descripcion</th>
			<th align="center" nowrap width="10%">Estado</th>
			<th align="center" nowrap width="10%">Fecha Apertura</th>
			<th align="center" nowrap width="10%">Fecha Final</th>	
		</tr>
        </table>
      </td>
    </tr>  
    
	  <tr  height="95%">    
	    <td nowrap="nowrap">       
	       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">       	
		<%
			ESG001001List.initRow();
				boolean firstTime = true;
				String chk = "";
				while (ESG001001List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					ESG001001Message convObj = (ESG001001Message) ESG001001List
							.getRecord();
		%>
		<tr>
			<td nowrap width="5%"><input type="radio" name="key" id="key"
					value="<%=ESG001001List.getCurrentRow()%>"  class="highlight" onClick="highlightRow('dataTable', <%= ESG001001List.getCurrentRow() %>);showAddInfo(<%=ESG001001List.getCurrentRow()%>);"
					<%=chk%>> </td>
			<td nowrap align="right" width="10%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><%=convObj.getE01PACNUM()%></a></td>
			<td nowrap align="center" width="5%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><%=convObj.getE01PACCIA()%></a></td>
			<td nowrap align="right" width="10%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><%=convObj.getE01PACACC()%></a></td>
			<td nowrap align="center" width="5%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><%=convObj.getE01PACCOD()%></a></td>
			<td nowrap align="center" width="5%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><%=convObj.getE01PACPLN()%></a></td>
			<td nowrap align="left" width="30%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><%=convObj.getE01PACDSC()%></a></td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><% if (convObj.getE01PACSTS().equals("1")) out.print("<b>Vigente</b>"); 
																			 if (convObj.getE01PACSTS().equals("2")) out.print("<b>Cancelado</b>");
																			 if (convObj.getE01PACSTS().equals("3")) out.print("<b>Bloqueado</b>");
																			 if (convObj.getE01PACSTS().equals("4")) out.print("<b>Suspendido</b>");
																			 if	(convObj.getE01PACSTS().equals("5")) out.print("<b>Retractado</b>"); %></a> </td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><%=Util.formatCustomDate(currUser.getE01DTF(),
																														convObj.getBigDecimalE01PACFIM().intValue(),
																														convObj.getBigDecimalE01PACFID().intValue(),
																														convObj.getBigDecimalE01PACFIY().intValue())%></a> </td>
			<td nowrap align="center" width="10%"><a href="javascript:goAction('203','<%=ESG001001List.getCurrentRow()%>');"><%=Util.formatCustomDate(currUser.getE01DTF(),
																														convObj.getBigDecimalE01PACFVM().intValue(),
																														convObj.getBigDecimalE01PACFVD().intValue(),
																														convObj.getBigDecimalE01PACFVY().intValue())%></a> </td>
		</tr>
		<%
			}
		%>
		</table>
		</td>
		</tr>
	</table>

<script type="text/javascript">
     showAddInfo(0);     
     
</script> <br>

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

