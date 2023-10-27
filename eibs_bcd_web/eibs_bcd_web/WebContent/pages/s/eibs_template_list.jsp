<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>

<%@ page import = "datapro.eibs.master.Util" %>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">

	function enter(filename) {
		document.getElementById("FILENAME").value = filename;
		document.forms[0].submit();
 	}
 	
</script>
</head>

<jsp:useBean id= "dir" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<body>
 
<h3 align="center">  Editar eIBSForms Templates
 	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="eibs_template_list.jsp"></h3>
<hr size="4">

<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEditTemplate">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  	<INPUT TYPE=HIDDEN ID="FILENAME" NAME="FILENAME" VALUE="">

<%
	if ( dir.getNoResult() ) {
		String sMsg = "No hay datos que correspondan con su criterio de busqueda";
%>
 		<TABLE class="tbenter" width=100% height=100%>
 			<TR>
      			<TD><div align="center"> <b> <%= sMsg %></b></div></TD>
      		</TR>
   		</TABLE>
<%
	} else {
%>
 
  		<TABLE class="tableinfo" align="center" style="width:'95%'">
    		<TR id="trdark"> 
      			<TH ALIGN=CENTER  nowrap width="20%">Templates</TH>
    		</TR>
<%
                dir.initRow();
                while (dir.getNextRow()) {
               		out.println(dir.getRecord());
                }
%> 
  		</TABLE>
<%      
  	}
%> 
</FORM>
</BODY>
</HTML>

