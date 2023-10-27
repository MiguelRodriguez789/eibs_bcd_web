var popup = "<%=request.getParameter("popup")%>";

function goHistAppr() {
	var E01HVAREF = "<%=request.getParameter("reference")%>";
	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0084?SCREEN=100&E01HVAREF="+E01HVAREF;
	if (popup == "true") {
		CenterNamedWindow(page, 'Information', 1200, 500, 2);
	} else {
		document.forms[0].action = page;
		document.forms[0].submit();
	}
}

function goHistMnt() {
	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0240?SCREEN=400&TYPE=W";
	if (popup == "true") {
		CenterNamedWindow(page, 'Information', 1200, 500, 2);
	} else {
		document.forms[0].action = page;
		document.forms[0].submit();
	}
}

function callDocum() {
	var TABLE_NUM = "<%=request.getParameter("table")%>";   
	var IDENTIFIER = "<%=request.getParameter("reference")%>";  
	var SEQ = 0;
	var page = "";
	var purpose = "<%=request.getParameter("readOnly")%>";

	if (purpose == "readonly") {
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=3&Type=G&TABLE_NUM="+TABLE_NUM+"&IDENTIFIER="+IDENTIFIER+"&SEQ="+SEQ;
	} else {
    	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEDI0010?SCREEN=1&Type=G&TABLE_NUM="+TABLE_NUM+"&IDENTIFIER="+IDENTIFIER+"&SEQ="+SEQ;
	}
	if (popup == "true") {
   		CenterNamedWindow(page, 'Information', 650, 500, 2);
	} else {
		document.forms[0].action = page;
		document.forms[0].submit();
	}
}

