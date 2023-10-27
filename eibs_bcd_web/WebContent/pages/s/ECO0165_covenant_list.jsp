<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO016501Message"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Listado de Convenios por Empleador</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList"	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

  	function goExcel() {
  	    var items = "";
  		var form = document.forms[0];
		var formLength = form.elements.length;
    	for (n=0; n<formLength; n++) {
    		var elemt = form.elements[n];
      		if (elemt.type == 'checkbox') {
				if (elemt.checked) {
					items += "&ROW=" + elemt.value;
            	}	
    		}
		}
   		var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0165?SCREEN=3" + items;
   		CenterWindow(pg, 600, 500, 2);
  	}
  	
  	function selectAll(obj) {
  		var form = document.forms[0];
		var formLength = form.elements.length;
    	for (n=0; n<formLength; n++) {
    		var elemt = form.elements[n];
      		if (elemt.type == 'checkbox') {
      			elemt.checked = obj.checked;
      		}
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

<h3 align="center">Listado de Convenios por Empleador
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="covenant_list.jsp, ECO0165"></h3>
<hr size="4">
<form method="POST"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0165">

	<input type="hidden" name="SCREEN" value="3"> 

  	<table  class="tableinfo">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap> 
		        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		          	<tr>
			             <td nowrap width="10%" align="right"> Empleador : 
			              </td>
			             <td nowrap width="10%" align="left">
				  			<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			             </td>
			             <td nowrap width="10%" align="right">Identificación :  
			             </td>
			             <td nowrap width="10%" align="left">
				  			<eibsinput:text name="userPO" property="ID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
			             </td>
			             <td nowrap width="10%" align="right"> Nombre : 
			               </td>
			             <td nowrap width="50%"align="left">
				  			<eibsinput:text name="userPO" property="cusName" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
			             </td>
		         	</tr>
		        </table>
      		</td>
    	</tr>
  	</table>

<%
	if (list.getNoResult()) {
%>
		<TABLE class="tbenter" width=100% height=90%>
			<TR>
				<TD>
					<div align="center">
						<font size="3"><b> No hay resultados que correspondan a su criterio de búsqueda. </b></font>
					</div>
				</TD>
			</TR>
		</TABLE>
	<TABLE class="tbenter">
	    <TR>     	      
	      <TD class=TDBKG width="100%"> 
	        <div align="center"><a href="javascript:checkClose()"><b>Salir</b></a></div>
	      </TD>  	          
	    </TR>
	</TABLE>
	
<%
	} else {
%>

	<TABLE class="tbenter">
	    <TR>     	      
	      <TD class=TDBKG width="50%"> 
	        <div align="center"><a href="javascript:goExcel()">Generar<br>EXCEL</a></div>
	      </TD>	    
	      <TD class=TDBKG width="50%"> 
	        <div align="center"><a href="javascript:checkClose()"><b>Salir</b></a></div>
	      </TD>  	          
	    </TR>
	</TABLE>
	
	<H4>&nbsp;
		<input type="checkbox" id="all" name="all" onclick="selectAll(this)"> Seleccionar Todas
	</H4>
	
	<table id="headTable" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="5%">&nbsp;</th>
			<th align="center" nowrap width="10%">Convenio</th>
			<th align="center" nowrap width="10%">Planilla</th>
			<th align="center" nowrap width="10%">Moneda</th>
			<th align="center" nowrap width="15%">Fecha Emisión</th>
			<th align="center" nowrap width="25%">Nombre</th>
			<th align="center" nowrap width="15%">Monto</th>
			<th align="center" nowrap width="10%">Estado</th>
		</tr>
		<%
			list.initRow();
			int k = 0;
			boolean firstTime = true;
			String chk = "";
			while (list.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
				ECO016501Message convObj = (ECO016501Message) list.getRecord();
		%>
		<tr>
			<td nowrap><input type="checkbox" name="ROW_<%=list.getCurrentRow()%>" value="<%=list.getCurrentRow()%>" <%=chk%>/></td>
			<td nowrap align="center"><%=Util.formatCell(convObj.getE01PLHCDE())%></td>
			<td nowrap align="center"><%=Util.formatCell(convObj.getE01PLHNUM())%></td>
			<td nowrap align="center"><%=Util.formatCell(convObj.getE01PLHRCY())%></td>
			<td nowrap align="center"><%=Util.formatCustomDate(currUser.getE01DTF(),
																 convObj.getBigDecimalE01PLHFEM().intValue(),
																 convObj.getBigDecimalE01PLHFED().intValue(),
																 convObj.getBigDecimalE01PLHFEY().intValue())%></td>
			<td nowrap align="left"><%=Util.formatCell(convObj.getE01PLHCNM())%></td>
			<td nowrap align="right"><%=Util.formatCCY(convObj.getE01PLHPAM())%></td>
			<td nowrap align="center"><%=Util.formatCell(convObj.getE01DSCSTA())%></td>
		</tr>
		<%
			}
		%>
	</table>

<%
	}
%>

</form>
</body>
</html>
