<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Ayuda CNOFC</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<%@ page import="java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<script type="text/javascript"	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%=datapro.eibs.master.JSEIBSProp.getPopUpTimeOut()%>);
</SCRIPT>
<script type="text/javascript">

var fCode = top.opener.$( "#"+top.opener.fieldName ) ;
var tEl =   top.opener.$( "#"+top.opener.fieldDesc ) ;
var lFieldName = "XX" + top.opener.fieldDesc ;

$(document).ready(function(){
	
	top.opener.$( "#" + lFieldName ).remove();
	top.opener.$( "body" ).append( "<input type='hidden' id='" + lFieldName + "' onchange='modIdF( event );' />" );
	
});

function enter(code, desc, type) {
	
	fCode.val( code ) ; 
	tEl.val( "" );
	
	tEl.attr('maxlength', desc );
	top.opener.$( "#"+lFieldName ).val( type ).change();
	
	top.close();
}

 
function goSearch() {
  window.location.href="<%=request.getContextPath()%>/pages/s/EWD0002_helpfile_CNOFC_Desc.jsp?codeflag=" + document.forms[0].codFlag.value + "&FromRecord=0&SelNew=" + document.forms[0].SelNew.value + "&SelOld=" + document.forms[0].SelOld.value; 
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
 	boolean firstTime = true;

 	// Send Request
 	try {
 		mp = new MessageProcessor("EWD0601");

 		EWD0601DSMessage msgHelp = (EWD0601DSMessage) mp.getMessageRecord("EWD0601DS");
 		msgHelp.setEWDTBL( request.getParameter("codeflag") );
 		mp.sendMessage(msgHelp);

 		JBObjList list = mp.receiveMessageRecordList( "EWDOPE" );

 		if (!list.isEmpty()) {
 			list.initRow();
 				if (list.getNextRow()) {
 					msgHelp = (EWD0601DSMessage) list.get(0);
 					out.println("<h4>" + msgHelp.getEWDDSC().trim() + "</h4>");
 				}
%>

<%-- 
<table id="tbhelp">
	<tr>
		<td nowrap><b>Búsqueda Rápida : </b></td>
		<td nowrap>
			<input type="text" name="SelNew" size=20 maxlength=20>
			&nbsp;&nbsp;
			<a href="javascript:goSearch();">
				<img src="<%=request.getContextPath()%>/images/search1.gif" align="bottom" border="0">
			</a>
		</td>
	</tr>
</table>
--%>

<TABLE id="mainTable" class="tableinfo" ALIGN="CENTER" style="width: '100%'">
	<TR>
		<TD NOWRAP width="100%">
		<TABLE id="headTable" width="100%">
			<TR id="trdark">
				<TH ALIGN="center" NOWRAP width="10%">Código</TH>
				<TH ALIGN="left" NOWRAP width="90%">Descripción</TH>
			</TR>
		</TABLE>
		<div id="dataDiv1" class="scbarcolor" style="display: block; height: 230px; overflow-y: scroll;">
		<table id="dataTable" width="100%">
			<% while (list.getNextRow()) {
					msgHelp = (EWD0601DSMessage) list.getRecord();
					String myCode = msgHelp.getEWDCOD().trim();
					String myDesc = msgHelp.getEWDDSC().trim();
					String myType = msgHelp.getEWDDCB().trim();
			%>
				
				<tr>
					<td nowrap="nowrap" width="10%" ><%=myCode %></td>
					<td nowrap="nowrap" width="90%" >
						<a href="javascript:enter('<%=myCode%>', '<%=msgHelp.getEWDDCC()%>', '<%=myType%>' )" ><%=myDesc %></a>
					</td>
				</tr>
					
			<% } %>
		</table>
		</div>
		</TD>
	</TR>
</TABLE>

<%-- 
<TABLE class="tbenter" WIDTH="100%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
		<% if (list.getShowPrev()) {
			    int pos = list.getFirstRec() - 31;
				out.print("<A HREF=\""
						+ request.getContextPath()
						+ "/pages/s/EWD0002_helpfile_CNOFC_Desc.jsp?codeflag="
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
			} %>
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25">
		<%	if (list.getShowNext()) {
				int pos = list.getLastRec();
				out.print("<A HREF=\""
						+ request.getContextPath()
						+ "/pages/s/EWD0002_helpfile_CNOFC_Desc.jsp?codeflag="
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
			} %>
		</TD>
	</TR>
</TABLE>
--%>

<SCRIPT type="text/javascript">

<%--
		document.forms[0].totalRow.value="<%=list.size()%>";
		document.forms[0].codFlag.value="<%=codeflag%>";
		document.forms[0].SelNew.value="<%=selNew%>";
		document.forms[0].SelOld.value="<%=selOld%>";
--%>
								
		function resizeDoc() {
   			divResize();
   			adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'), 1, false);
   		}
 		resizeDoc();   			
   		window.onresize = resizeDoc;        
</SCRIPT>

 <%   }
	} finally {
 		if (mp != null)
 			mp.close();
 	} %>

</form>
</BODY>
</HTML>
