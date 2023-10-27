<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<TITLE>Ayuda, Canales</TITLE>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);

	function enter(code, desc, aux1) {
		var form = top.opener.document.forms[0];
		if (top.opener.fieldName.trim() !== "") {form[top.opener.fieldName].value = code;}
		if (top.opener.fieldDesc.trim() !== "") {form[top.opener.fieldDesc].value = desc;}  	
		if (top.opener.fieldAux1.trim() !== "") {form[top.opener.fieldAux1].value = aux1;}  	  		
		top.close();
	}

</SCRIPT>
<STYLE>
	table.tableinfo a.sortheader {
	    color:#666666;
	    font-weight: bold;
	    text-decoration: none;
	    display: block;
	}
	table .sortable span.sortarrow {
	    color: black;
	    text-decoration: none;
	}
</STYLE>
</HEAD>
<BODY>
<form>

<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">

<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
	<TR> 
		<TD NOWRAP width="100%" >
			<TABLE id="headTable" >
	   			<TR id="trdark">  
					<TH ALIGN=CENTER NOWRAP>
						<a href="#" class="sortheader" onclick="ts_resortTable(this,'dataTable');return false;">Code<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>
					</TH>
					<TH ALIGN=CENTER NOWRAP>
						<a href="#" class="sortheader" onclick="ts_resortTable(this,'dataTable');return false;">Description<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>
    				</TH>
       			</TR>
    		</TABLE>
  
   			<div id="dataDiv1" class="scbarcolor">
    			<table id="dataTable" > 
<%      
	            ESS0030DSMessage user = (ESS0030DSMessage) session.getAttribute("currUser");
	 			MessageProcessor mp = null;
				int rows = 0;
	            String marker = "";
	            try {
	            	mp = new MessageProcessor("EPR0302");
	           		EPR030201Message msgHelp = (EPR030201Message) mp.getMessageRecord("EPR030201");
					msgHelp.setH01USERID(user.getH01USR());
					msgHelp.setH01PROGRM("EPR0302");
					//msgHelp.setH01TIMSYS(getTimeStamp());
					msgHelp.setH01SCRCOD("01");
					msgHelp.setH01OPECOD("0015");
	              	 	
					mp.sendMessage(msgHelp);
					JBObjList list = mp.receiveMessageRecordList("E01INDOPE");
						
					if (mp.hasError(list)) {
					} else {
						list.initRow();
						rows = list.size();
						while (list.getNextRow()) {
							msgHelp = (EPR030201Message) list.getRecord();
%>
		           	<tr>
		           		<td nowrap> <%=msgHelp.getE01PRCCNL().trim()%> </td>
						<td nowrap>
							<A HREF="javascript:enter('<%=msgHelp.getE01PRCCNL().trim()%>', '<%=msgHelp.getE01PRCDSC().trim()%>','')"> <%=msgHelp.getE01PRCDSC().trim()%></a>
						</td>       		           		
			        </tr>               
<%           	
						}
					}				
				} finally {
					if (mp != null) mp.close();
				}
%>
				</table>
   			</div>
		</TD>
     </TR>	
</TABLE>

<SCRIPT type="text/javascript">
	document.forms[0].totalRow.value = "<%= rows %>";
	function resizeDoc() {
	 	if (document.forms[0].totalRow.value != "0") {
	 		divResize();
		    adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'), 1, false);
		}
	}
	resizeDoc();   			
	window.onresize = resizeDoc;        
</SCRIPT>
</form>
</BODY>
</HTML>
