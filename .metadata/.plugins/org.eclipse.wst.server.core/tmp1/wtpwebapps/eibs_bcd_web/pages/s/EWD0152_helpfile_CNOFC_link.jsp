<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>CNOFC Help</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:directive.page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" />
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<SCRIPT type="text/javascript">
	setTimeout("self.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>
<script type="text/javascript">
//<!-- Hide from old browsers
function a(code1, desc1, code2, desc2) {
	var formLength= opener.document.forms[0].elements.length;
	for (n = 0; n < formLength; n++) {
		var elementName= opener.document.forms[0].elements[n].name;
		if (elementName == opener.fieldName) {
			opener.document.forms[0].elements[n].value = code1;
			opener.document.forms[0].elements[n + 1].value = desc1;
			opener.document.forms[0].elements[n + 2].value = code2;
			opener.document.forms[0].elements[n + 3].value = desc2;
			break;
		}
	}
	self.close();
}
//-->
</script>
</HEAD>
<BODY>
<form>
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<%
 	MessageProcessor mp = null;
 	String codeflag = request.getParameter("codeflag") == null ? ""
 			: request.getParameter("codeflag");
	int rows = 0;

	try {
 		mp = new MessageProcessor("EWD0152");
		EWD0152DSMessage msgHelp = (EWD0152DSMessage) mp.getMessageRecord("EWD0152DS");
		msgHelp.setEWDTBL(codeflag);
		
		mp.sendMessage(msgHelp);
		// Receive Help
		JBObjList list = mp.receiveMessageRecordList("EWDOPE");
                 	  
		if (!list.isEmpty()) {
			list.initRow();
			list.getNextRow();
			msgHelp =  (EWD0152DSMessage) list.getRecord();
			%>
			  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 			   <TR> 
    			     <TD NOWRAP width="100%" >
  				<TABLE id="headTable" >
  				   <TR id="trdark">  
      					<TH ALIGN=CENTER NOWRAP>Código</TH>
			<% if (codeflag.equals("80")) { %>
      				<TH ALIGN=CENTER NOWRAP>Comuna</TH>
					<TH ALIGN=CENTER NOWRAP>Ciudad</TH>
			<% } else { %>
					<TH ALIGN=CENTER NOWRAP>Ciudad</TH>
      				<TH ALIGN=CENTER NOWRAP>Región</TH>
			<% } %>
          			   </TR>
       			</TABLE>
  
   			    <div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable" > 
			<% 
                  	
				int ct = 0;
				while (list.getNextRow()) {
					msgHelp = (EWD0152DSMessage) list.getRecord();
		
					String myCode1 = msgHelp.getEWDCD1().trim();
					String myDesc1 = msgHelp.getEWDDS1().trim();
					String myCode2 = msgHelp.getEWDCD2().trim();
					String myDesc2 = msgHelp.getEWDDS2().trim();
	
					out.println("<tr><td nowrap >" + myCode1 + "</td>");
					out.println("<td nowrap><A HREF=\"javascript:a('" + myCode1 +"', '" + myDesc1 + "', '" + myCode2 + "', '" + myDesc2 + "')\">"  + myDesc1 + "</a></td>");
					out.println("<td nowrap><A HREF=\"javascript:a('" + myCode1 +"', '" + myDesc1 + "', '" + myCode2 + "', '" + myDesc2 + "')\">"  + myDesc2 + "</a></td></tr>");
					rows++;
				}
			}	
			%>
			 </table>
   			</div>
   			</TD>
   		      </TR>	
		    </TABLE>

		    <SCRIPT type="text/javascript">
			document.forms[0].totalRow.value="<%= rows %>";
			divResize();
     			adjustEquTables( getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"), 1, false);        
		    </SCRIPT>
                    <%
	} finally {
		if (mp != null) mp.close();
	}
                	
%>
</form>
</BODY>
</HTML>
