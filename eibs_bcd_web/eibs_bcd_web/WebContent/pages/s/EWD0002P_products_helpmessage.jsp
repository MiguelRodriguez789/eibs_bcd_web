<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><title>Origen de los Fondos, Concepto</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0002pHelp" class= "datapro.eibs.beans.JBList"   scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
	function enter(code1) {
		//n-1 code2; n-2 code3
 		var form = top.opener.document.forms[0];
 		if (isValidObject(form[top.opener.fieldName])) {
 			form[top.opener.fieldName].value = code1;
 			form[top.opener.fieldName].focus();
 		}	
 		top.close();
 	}
</script>
</head>
<body>
<%
	if ( ewd0002pHelp.getNoResult() ) {
%>
	<TABLE class="tbenter" width=100% height=100%>
		<TR>
			<TD> 
				<div align="center"> <font size="3"><b> No hay resultados para su criterio de busqueda</b></font></div>
			</TD>
		</TR>
	</TABLE>
<%  
	} else {
%>	
	<table class="tableinfo" style="width:95%" ALIGN=CENTER>
		<tr id="trdark">
			<th>Codigo de Producto</th>
			<th>Descripcion</th>
		</tr>	
<%
		String App = (String)request.getAttribute("App");
		ewd0002pHelp.initRow();
		while (ewd0002pHelp.getNextRow()) {
			if (ewd0002pHelp.getFlag().equals("")) {
				out.println(ewd0002pHelp.getRecord());
			}
		}
%> 
	</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25"> 
<%
		if ( ewd0002pHelp.getShowPrev() ) {
			int pos = ewd0002pHelp.getFirstRec() - 51;
			out.print("<A HREF=\"" +
			          request.getContextPath() +
			          "/servlet/datapro.eibs.helps.JSEWD0002P?App=" +
			          App + 
			          "&FromRecord=" + 
			          pos + 
			          "\" > <img src=\"" +
			          request.getContextPath() +
			          "/images/s/previous_records.gif\" border=0></A>");
		}
%> 
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25"> 
<%       
		if ( ewd0002pHelp.getShowNext() ) {
			int pos = ewd0002pHelp.getLastRec();
			out.print("<A HREF=\"" +
			          request.getContextPath() +
			          "/servlet/datapro.eibs.helps.JSEWD0002P?App=" + 
			          App + 
			          "&FromRecord=" + 
			          pos + 
			          "\" ><img src=\"" +
			          request.getContextPath() +
			          "/images/s/next_records.gif\" border=0></A>");
		}
%> 
		</TD>
	</TR>
</TABLE>

<%
	}  
%>
 
</body>
</html>