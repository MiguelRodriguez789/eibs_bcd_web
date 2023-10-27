<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Lista de Documentos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<%@ page import="datapro.eibs.master.JSEIBSProp" %>

<jsp:useBean id="listImg" class="datapro.eibs.beans.JBListRec"
	scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
	
<%
	String row = ""; 
	try {
		row = "&ROW=" + request.getParameter("ROW").trim();
	} catch (Exception e) {
		row = "&ROW=0";
	}
%>	

<SCRIPT type="text/javascript">

  var reason = '';
  
  function loadPage(num, typ, size) {
		$('[name="blank_viewer"]', parent.document).attr("src", "<%=request.getContextPath()%>/pages/s/EDI0010_doc_viewer_img_page.jsp?PAGE_NAME=" + num + "&TYPE=" + typ);
  }

// Delete
	function deletePage(name, uid, row) {
		if (confirm("Esta seguro que desea eliminar este documento?")) {
			enterReason(name + "-" + uid);
		} else {
			return;
		}
	}
	
	function goAction(opt) {
		var comm = "&reason=" + reason;
		var option = "&opt=4";
		var row = "<%=row%>";
		var parameters = opt.split("-");
		parent.window.location.href="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=10&DOC_NAME=<%=request.getParameter("DOC_NAME")%>&PAGE_NAME=" 
			+ parameters[0] + "&UID=" + parameters[1] + comm + option + row;
	}

</SCRIPT>

</HEAD>

<BODY>

<h3 align="center">Documentos</h3>
<FORM>
<%
	listImg.setCurrentRow(0);
%>


<TABLE class="tbenter" align="center" width="190" border="1"
	cellpadding="2" cellspacing="2">
	<TR bgcolor="#CCCCCC">
		<TD ALIGN=CENTER width="95%"><b><%=listImg.getRecord(1)%> </b> <b>
		</b></TD>
	</TR>
</TABLE>

<TABLE width="190" border="0" class="tbenter" align="center">
	<%
		listImg.initRow();
		int pagenum = 0;
		String imgName = "";
		String pagename = "";
		String pagedate = "";
		String seqnum = "";
		String uid = "";
		String type = "";
		String size = "";

		while (listImg.getNextRow()) {
			pagename = listImg.getRecord(0);
			uid = listImg.getRecord(5);
			if (!seqnum.equals(listImg.getRecord(4))) {
				seqnum = listImg.getRecord(4);
				pagedate = listImg.getRecord(3);
				pagenum = 0;
	%>
					<TR bgcolor="#bbbbbb">
						<TD ALIGN=LEFT>
						<table width="100%" border="1" cellspacing="0" cellpadding="2">
							<tr>
								<td>Secuencia<b> <%=seqnum + ""%> </b>: <%=pagedate%></td>
							</tr>
						</table>
						</TD>
					</TR>
	<%
		}
			imgName = listImg.getRecord(5) + "_" + seqnum + "."
					+ listImg.getRecord(2);
			type = listImg.getRecord(2);
			pagenum++;
	%>
	<TR>
		<TD ALIGN=CENTER>Página<b> <%=pagenum + ""%> </b></TD>
	</TR>
	<TR>
		<TD ALIGN=CENTER><br>
		<a href="javascript:loadPage('<%=imgName%>', '<%=listImg.getRecord(2)%>', '<%=listImg.getRecord(6)%>')">
			<b>Archivo	<%=listImg.getRecord(2)%></b></a><br><%=listImg.getRecord(11)%><br>
		</TD>
	</TR>
		<%
			if (!userPO.getPurpose().equals("INQUIRY")
					&& !userPO.getPurpose().equals("APPROVAL_INQ")
						&& !("D".equals(listImg.getRecord(12)) || "C"
								.equals(listImg.getRecord(12)))) {
		%> 	
	<TR>
			<TD align="center" class="TDBKG" valign="middle">
				<a href="javascript:deletePage('<%=pagename%>', '<%=uid%>')"><font color="#ff0000"><b>Eliminar</b></font></a> 
		</TD>	
	</TR>
	<% 	}	%>     
	<TR>
			<TD align="center">
 			<br>
			<hr>
			<br>
		</TD>	
	</TR>
	<%
		}
	%>
</TABLE>
<%
	listImg.initRow();
	if (listImg.getNextRow()) {
		pagename = listImg.getRecord(0);
		imgName = listImg.getRecord(5) + "_" + seqnum + "."
				+ listImg.getRecord(2);
		type = listImg.getRecord(2);
		uid = listImg.getRecord(5);
		size = listImg.getRecord(6);
%> 
		<SCRIPT type="text/javascript">
			loadPage("<%=imgName%>", "<%=type%>", "<%=size%>");
		</SCRIPT> <%
 	}
 %>
</FORM>
</BODY>
</HTML>
