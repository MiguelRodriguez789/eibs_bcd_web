<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Ayuda CNOFC</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import="java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<%
 	String codeflag = request.getParameter("codeflag") == null ? "" : request.getParameter("codeflag");
  	String selNew = request.getParameter("SelNew") == null ? "" : request.getParameter("SelNew");
 	String selOld = request.getParameter("SelOld") == null ? ""	: request.getParameter("SelOld");
 	String fromRec = request.getParameter("FromRecord") == null ? "0" : request.getParameter("FromRecord");
 	String wkmid = request.getParameter("filter") == null ? ""	: request.getParameter("filter");
 	String wkmic = request.getParameter("filter2") == null ? ""	: request.getParameter("filter2");
%>

<script type="text/javascript" 	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);

function enter(code, desc) {
	var form = top.opener.document.forms[0];
	
	setField(form[top.opener.fieldDesc], desc);
	setField(form[top.opener.fieldName], code);	
	if (!selectField(form[top.opener.fieldName])) {
		selectField(form[top.opener.fieldDesc]);
	}

	top.close();
}
 
function goSearch() {
  addWaitCursor();
  window.location.href="<%=request.getContextPath()%>/pages/s/EWD0002_helpfile_CNOFC_DescF.jsp?codeflag=<%= codeflag %>&FromRecord=0&SelNew=" + document.forms[0].SelNew.value + "&SelOld=" + document.forms[0].SelOld.value + "&filter=<%=wkmid%>&filter2=<%=wkmic%>"; 
}
</script>
</HEAD>
<BODY>
<form>
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0"> 
	<INPUT TYPE=HIDDEN NAME="SelOld" VALUE=""> 
	<INPUT TYPE=HIDDEN NAME="codFlag" VALUE="">
<%
 	MessageProcessor mp = null;
 	int rows = 0;
 	int posIni = 0;
 	int posEnd = 0;
 	String marker = "";
 	

 	// Send Request
 	try {
 		mp = new MessageProcessor("EWD0002");

 		EWD0002DSMessage msgHelp = (EWD0002DSMessage) mp
 				.getMessageRecord("EWD0002DS");
 		msgHelp.setEWDTBL(codeflag);
 		msgHelp.setEWDSHO(selOld);
 		msgHelp.setEWDSHN(selNew);
 		msgHelp.setEWDREC(fromRec);
 		msgHelp.setEWDMID(wkmid);  
 		msgHelp.setEWDMIC(wkmic);

 		mp.sendMessage(msgHelp);
 		JBObjList list = mp.receiveMessageRecordList("EWDOPE", "EWDREC");
		
		rows = list.size();
 		if (!list.isEmpty()) {
 			list.initRow();
			if (list.getNextRow()) {
				msgHelp = (EWD0002DSMessage) list.getRecord();
				out.println("<h4>" + msgHelp.getEWDDSC().trim()
					+ "</h4>");
 			}
%>
<table id="tbhelp">
	<tr>
		<td nowrap><b>Busqueda Rapida : </b></td>
		<td nowrap>
			<input type="text" name="SelNew" size=20 maxlength=20>
			<a href="javascript:goSearch();"><img src="<%=request.getContextPath()%>/images/search1.gif" align="bottom" border="0">
			</a>
		</td>
	</tr>
</table>
<TABLE id="mainTable" class="tableinfo" ALIGN=CENTER
	style="width: '95%'">
	<TR>
		<TD NOWRAP width="100%">
		<TABLE id="headTable">
			<TR id="trdark">
				<TH ALIGN=CENTER NOWRAP>Código</TH>
				<TH ALIGN=CENTER NOWRAP>Descripción</TH>
			</TR>
		</TABLE>

		<div id="dataDiv1" class="scbarcolor">
		<table id="dataTable">
<% 
				while (list.getNextRow()) {
							msgHelp = (EWD0002DSMessage) list.getRecord();
							String myCode = msgHelp.getEWDCOD().trim();
							String myDesc = msgHelp.getEWDDSC().trim();
							selOld = msgHelp.getEWDSHO().trim();

							out.println("<tr><td nowrap >" + myCode + "</td>");
							out.println("<td nowrap><NOBR><A HREF=\"javascript:enter('"
									+ myCode + "', '" + myDesc + "')\">" + myDesc
									+ "</a></td></tr>");
						}
%>
		</table>
		</div>
		</TD>
	</TR>
</TABLE>

<TABLE class="tbenter" WIDTH="88%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
		<%
			if (list.getShowPrev()) {
				int pos = list.getFirstRec() - (list.getLastRec() - list.getFirstRec());
      			out.print("<A HREF=\""
      				+ request.getContextPath()
      				+ "/pages/s/EWD0002_helpfile_CNOFC_DescF.jsp?"
      				+ "filter="+wkmid
      				+ "filter2="+wkmic
      				+ "&codeflag=" + codeflag 
      				+ "&FromRecord=" + pos 
      				+ "&SelNew=" + selNew 
      				+ "&SelOld=" + selOld 
      				+ "\" > <img src=\"" + request.getContextPath() + "/images/s/previous_records.gif\" border=0></A>");
        } %>
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25">
		<%       
			if (list.getShowNext()) {
				int pos = list.getLastRec();
      			out.print("<A HREF=\""
      				+ request.getContextPath()
      				+ "/pages/s/EWD0002_helpfile_CNOFC_DescF.jsp?"
      				+ "filter="+wkmid
      				+ "filter2="+wkmic
      				+ "&codeflag=" + codeflag 
      				+ "&FromRecord=" + pos 
      				+ "&SelNew=" + selNew 
      				+ "&SelOld=" + selOld 
      				+ "\" ><img src=\"" + request.getContextPath() + "/images/s/next_records.gif\" border=0></A>");
        } %>
		</TD>
	</TR>
</TABLE>

<SCRIPT type="text/javascript">
			document.forms[0].totalRow.value="<%= rows %>";
			document.forms[0].codFlag.value="<%= codeflag %>";
			document.forms[0].SelNew.value="<%= selNew %>";
			document.forms[0].SelOld.value="<%= selOld %>";
			function resizeDoc() {
      		 	divResize();
     		    adjustEquTables(headTable, dataTable, dataDiv1, 1, false, "90");
      		}
	 		resizeDoc();   			
     		window.onresize=resizeDoc;        
     </SCRIPT>
<%
 		}
 	} finally {
 		if (mp != null)
 			mp.close();
 	}
%>

</form>

<script type="text/javascript">
//Function That Redifnes Enter KeyPress
//ReBinds to whatever function

defer(function(){ return typeof $.fn.pressEnter !== 'undefined'},
	function(){
		$(document).pressEnter(function(evt){
			goSearch();
		});
	});
</script>

</BODY>
</HTML>
