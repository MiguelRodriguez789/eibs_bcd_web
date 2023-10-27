<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<%@ page
	import="java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<TITLE>Ayuda CNOFC</TITLE>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%=datapro.eibs.master.JSEIBSProp.getPopUpTimeOut()%>);
</SCRIPT>
<script type="text/javascript">
function enter(code) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldName])) {
		form[top.opener.fieldName].value = code;
		form[top.opener.fieldName].focus();
		form[top.opener.fieldName].select();
		triggerOnchangeOpener(top.opener.fieldName);
	}
	top.close();
}

function goSearch() {
	window.location.href="<%=request.getContextPath()%>/pages/s/EWD0002_helpfile_CNOFC.jsp?codeflag=" + document.forms[0].codFlag.value + "&FromRecord=0&SelNew=" + document.forms[0].SelNew.value + "&SelOld=" + document.forms[0].SelOld.value; 
}
</script>

</HEAD>
<BODY>

<form><INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0"> <INPUT
	TYPE=HIDDEN NAME="SelOld" VALUE=""> <INPUT TYPE=HIDDEN
	NAME="codFlag" VALUE=""> <%
 	MessageProcessor mp = null;
 	String codeflag = request.getParameter("codeflag") == null ? ""
 			: request.getParameter("codeflag");
 	int rows = 0;
 	int posIni = 0;
 	int posEnd = 0;
 	String marker = "";
 	String selNew = request.getParameter("SelNew") == null ? ""
 			: request.getParameter("SelNew");
 	String selOld = request.getParameter("SelOld") == null ? ""
 			: request.getParameter("SelOld");
 	String fromRec = request.getParameter("FromRecord") == null ? "0"
 			: request.getParameter("FromRecord");
 	String codeaux = request.getParameter("codeaux") == null ? ""
 			: request.getParameter("codeaux");
 	boolean firstTime = true;

 	// Send Request
 	try {
 		mp = new MessageProcessor("EWD0002");

 		EWD0002DSMessage msgHelp = (EWD0002DSMessage) mp
 				.getMessageRecord("EWD0002DS");
 		msgHelp.setEWDTBL(codeflag);
 		msgHelp.setEWDSHO(selOld);
 		msgHelp.setEWDSHN(selNew);
 		msgHelp.setEWDREC(fromRec);
 		msgHelp.setEWDCOD(codeaux);

 		mp.sendMessage(msgHelp);

 		JBObjList list = mp
 				.receiveMessageRecordList("EWDOPE", "EWDREC");

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
		<td nowrap><b>B�squeda R�pida : </b></td>
		<td nowrap><input type="text" name="SelNew" size=20 maxlength=20>
		&nbsp;&nbsp;<a href="javascript:goSearch();"><img
			src="<%=request.getContextPath()%>/images/search1.gif" align="bottom"
			border="0"></a></td>
	</tr>
</table>
<TABLE id="mainTable" class="tableinfo" ALIGN=CENTER
	style="width: '100%'">
	<TR>
		<TD NOWRAP width="100%">
		<TABLE id="headTable" width="100%" >
			<TR id="trdark">
				<TH ALIGN=CENTER NOWRAP width="20%">C�digo</TH>
				<TH ALIGN=CENTER NOWRAP>Descripci�n</TH>
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
									+ myCode + "')\">" + myDesc
									+ "</a></td></tr>");
						}
			%>
		</table>
		</div>
		</TD>
	</TR>
</TABLE>
<TABLE class="tbenter" WIDTH="100%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
		<%
			if (list.getShowPrev()) {
						int pos = list.getFirstRec() - 31;
						out
								.print("<A HREF=\""
										+ request.getContextPath()
										+ "/pages/s/EWD0002_helpfile_CNOFC.jsp?codeflag="
										+ codeflag
										+ "&FromRecord="
										+ pos
										+ "&SelNew="
										+ selNew
										+ "&SelOld="
										+ selOld
										+ "\" > <img src=\""
										+ request.getContextPath()
										+ "/images/s/previous_records.gif\" border=0></A>");
					}
		%>
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25">
		<%
			if (list.getShowNext()) {
						int pos = list.getLastRec();
						out
								.print("<A HREF=\""
										+ request.getContextPath()
										+ "/pages/s/EWD0002_helpfile_CNOFC.jsp?codeflag="
										+ codeflag
										+ "&FromRecord="
										+ pos
										+ "&SelNew="
										+ selNew
										+ "&SelOld="
										+ selOld
										+ "\" ><img src=\""
										+ request.getContextPath()
										+ "/images/s/next_records.gif\" border=0></A>");
					}
		%>
		</TD>
	</TR>
</TABLE>
<SCRIPT type="text/javascript">
								document.forms[0].totalRow.value="<%=list.size()%>";
								document.forms[0].codFlag.value="<%=codeflag%>";
								document.forms[0].SelNew.value="<%=selNew%>";
								document.forms[0].SelOld.value="<%=selOld%>";
								function resizeDoc() {
					      		 	divResize();
   									adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'), 1, false , "90");
					      		}
						 		resizeDoc();   			
					     		window.onresize = resizeDoc;        
					     </SCRIPT> <%
 	}
 	} finally {
 		if (mp != null)
 			mp.close();
 	}
 %>
</form>
</BODY>
</HTML>
