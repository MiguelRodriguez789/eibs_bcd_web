<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO016001Message"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

  function goDetails(cnv,pln,rcy) {
  	document.forms[0].SCREEN.value="300";
	document.forms[0].PLDCDE.value=cnv;
	document.forms[0].PLDNUM.value=pln;
	document.forms[0].PLDRCY.value=rcy;
  	document.forms[0].target='detail';
	document.forms[0].submit();
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

<h3 align="center">Consulta Planillas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="covenant_list.jsp,ECO0160"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0160">
<input type="hidden" name="SCREEN" value="300">
<input type="hidden" name="lista" value="1">
<input type="hidden" name="PLDCDE" value="">
<input type="hidden" name="PLDNUM" value="">
<input type="hidden" name="PLDRCY" value="">
<%
	if (cnvList.getNoResult()) {
%>
<TABLE class="tbenter" width=100% height=90%>
	<TR>
		<TD>
		<div align="center"><font size="3"><b> No hay resultados que correspondan a su criterio de búsqueda. </b></font></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>	
<br>

<table id="mainTable" class="tableinfo" align="center">
	<tr>
		<td nowrap valign="top" width="100%">
			<table id="headTable" width="100%">
				<tr id="trdark">
					<th align="center" nowrap width="10%">Convenio</th>				
					<th align="center" nowrap width="10%">Planilla</th>				
					<th align="left" nowrap width="30%">Nombre Convenio</th>
					<th align="left" nowrap width="10%">Identidad</th>
					<th align="center" nowrap width="10%">Emitida</th>
					<th align="center" nowrap width="10%">Moneda</th>
					<th align="center" nowrap width="10%">Monto</th>
					<th align="center" nowrap width="10%">Estado</th>
				</tr>
			</table>

		<div id="dataDiv1" class="scbarcolor" >
		<table id="dataTable">
			<% 
				cnvList.initRow();
					while (cnvList.getNextRow()) {
						ECO016001Message convObj = (ECO016001Message) cnvList.getRecord();
			%>
			<tr>
				<td nowrap align="center"><a href="javascript:goDetails('<%=convObj.getE01PLHCDE()%>','<%=convObj.getE01PLHNUM()%>','<%=convObj.getE01PLHRCY()%>');"><%=Util.formatCell(convObj.getE01PLHCDE())%></a></td>
				<td nowrap align="center"><a href="javascript:goDetails('<%=convObj.getE01PLHCDE()%>','<%=convObj.getE01PLHNUM()%>','<%=convObj.getE01PLHRCY()%>');"><%=Util.formatCell(convObj.getE01PLHNUM())%></a></td>
				<td nowrap align="left"><a href="javascript:goDetails('<%=convObj.getE01PLHCDE()%>','<%=convObj.getE01PLHNUM()%>','<%=convObj.getE01PLHRCY()%>');"><%=convObj.getE01PLHCNM()%></a></td>				
				<td nowrap align="left"> <a href="javascript:goDetails('<%=convObj.getE01PLHCDE()%>','<%=convObj.getE01PLHNUM()%>','<%=convObj.getE01PLHRCY()%>');"><%=convObj.getE01PLHCID()%></a></td>
				<td nowrap align="center"><a href="javascript:goDetails('<%=convObj.getE01PLHCDE()%>','<%=convObj.getE01PLHNUM()%>','<%=convObj.getE01PLHRCY()%>');"> <%=Util.formatCustomDate(currUser.getE01DTF(),convObj.getBigDecimalE01PLHFEM().intValue(),convObj.getBigDecimalE01PLHFED().intValue(),convObj.getBigDecimalE01PLHFEY().intValue())%></a></td>
				<td nowrap align="center"><a href="javascript:goDetails('<%=convObj.getE01PLHCDE()%>','<%=convObj.getE01PLHNUM()%>','<%=convObj.getE01PLHRCY()%>');"><%=convObj.getE01PLHRCY()%></a></td>				
				<td nowrap align="right"><a href="javascript:goDetails('<%=convObj.getE01PLHCDE()%>','<%=convObj.getE01PLHNUM()%>','<%=convObj.getE01PLHRCY()%>');"><%=convObj.getE01PLHPAM()%></a></td>				
				<td nowrap align="center" nowrap><a href="javascript:goDetails('<%=convObj.getE01PLHCDE()%>','<%=convObj.getE01PLHNUM()%>','<%=convObj.getE01PLHRCY()%>');"><%=convObj.getE01DSCSTA().trim()%></a></td>
			</tr>
			<%
				}
			%>
		</table>
		</div>
		</td>
	</tr>
</table>

<script type="text/javascript">
     function resizeDoc() {
 	          	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      }
     resizeDoc();
     window.onresize=resizeDoc; 
</script> 
<br>
<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (cnvList.getShowPrev()) {
					int pos = cnvList.getFirstRec() - 13;
					out.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									//+ cnvList.getSearchText() + "&Type="
									//+ cnvList.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (cnvList.getShowNext()) {
					int pos = cnvList.getLastRec();
					out.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									//	+ cifList.getSearchText() + "&Type="
									//	+ cifList.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/next_records.gif\" ></A>");
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
