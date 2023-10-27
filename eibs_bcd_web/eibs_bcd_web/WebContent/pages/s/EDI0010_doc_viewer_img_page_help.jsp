<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Blank</TITLE>

<%@ page import="datapro.eibs.master.JSEIBSProp" %>

<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">

<SCRIPT type="text/javascript">
var isize = <%= request.getParameter("IMG_SIZE")%>;

function loadImage(typ) {
    if ((typ == "PDF") || (typ == "DOC") || (typ == "TIF") || typ == "TIFF") {
		document.location.href="<%=JSEIBSProp.getScanURL()%>?SCREEN=4&DOC_NAME=<%=request.getParameter("PAGE_NAME")%>";
    }
}

function loadPage() {
	document.getElementById("canvas").width = isize;
}

function viewer_exit() {
	if ( window.name !="main" ) top.close(); 
	else window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}

//    zoom_in
function viewer_zoom_in() {
  isize = isize + 50;
  loadPage();
}

//    zoom_out
function viewer_zoom_out() {
  isize = isize - 50;
  loadPage();
}

//    Print
function viewer_print() {
  focus();
  print();
}
 
</SCRIPT>
</HEAD>

<% 		
	String type = (request.getParameter("TYPE") == null) ? "" : request.getParameter("TYPE");
%>
<BODY onload="loadImage('<%= type %>')">
<% 
		if (type.equalsIgnoreCase("PDF") || type.equalsIgnoreCase("DOC") || type.equalsIgnoreCase("TIF") || type.equalsIgnoreCase("TIFF")) {
			//Nothing to do...
		} else {
%>
			<TABLE class="tbenter" width="100%">
		    	<TR> 
		    		<TD width="10%" nowrap="nowrap"> <b> Secuencia: <%=request.getParameter("SEQNUM") %></b></TD>
		      		<TD ALIGN=CENTER  class=TDBKG> <a href="javascript:viewer_zoom_in()"><b>Zoom In</b></a></TD>
		      		<TD ALIGN=CENTER  class=TDBKG> <a href="javascript:viewer_zoom_out()"><b>Zoom Out</b></a></TD>
		      		<TD ALIGN=CENTER  class=TDBKG> <a href="javascript:viewer_exit()" ><b>Salir</b></a></TD>
		    	</TR>
		  	</TABLE>
		  
			<div align="center">
				<IMG name="img" id="canvas" src="<%=JSEIBSProp.getScanURL()%>?SCREEN=4&DOC_NAME=<%=request.getParameter("PAGE_NAME")%>" border="0" align="middle">
		   	</div>
<%
		}
%>		   	
</BODY>
</HTML>
