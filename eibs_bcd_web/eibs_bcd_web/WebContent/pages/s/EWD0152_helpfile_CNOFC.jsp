<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>CNOFC Help</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>)
</SCRIPT>
<script type="text/javascript">
//<!-- Hide from old browsers
function a(code1, desc1,code2, desc2) {
	var form = top.opener.document.forms[0];

	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code1;
  	if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = desc1;
  	if (isValidObject(form[top.opener.fieldAux1])) form[top.opener.fieldAux1].value = code2;
  	if (isValidObject(form[top.opener.fieldAux2])) form[top.opener.fieldAux2].value = desc2;
  	   
	top.close();
 }

function goSearch() {
  window.location.href="<%=request.getContextPath()%>/pages/s/EWD0152_helpfile_CNOFC.jsp?codeflag=" + document.forms[0].codFlag.value + "&FromRecord=0&SelNew=" + document.forms[0].SelNew.value + "&SelOld=" + document.forms[0].SelOld.value; 
}

//-->
</script>
</HEAD>
<BODY>
<form>
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<INPUT TYPE=HIDDEN NAME="SelOld" VALUE="">
<INPUT TYPE=HIDDEN NAME="codFlag" VALUE="">
<%
 	MessageProcessor mp = null;
 	String codeflag = request.getParameter("codeflag") == null ? ""
 			: request.getParameter("codeflag");
	int rows = 0;
	String selNew = "";
	String selOld = "";
	String fromRec = "0";
	boolean firstTime = true;

	try {
 		mp = new MessageProcessor("EWD0152");
		EWD0152DSMessage msgHelp = (EWD0152DSMessage) mp.getMessageRecord("EWD0152DS");
		try {
			selNew = request.getParameter("SelNew").trim();
		} catch (Exception e) {
			selNew = "";              	  
		}
		try {
			selOld = request.getParameter("SelOld").trim();
		} catch (Exception e) {
			selOld = "";              	  
		}
		try {
			fromRec = request.getParameter("FromRecord").trim();
		} catch (Exception e) {
			fromRec = "0";              	  
		}
		// Send Request
		msgHelp = (EWD0152DSMessage) mp.getMessageRecord("EWD0152DS");
		msgHelp.setEWDTBL(codeflag);
		msgHelp.setEWDSHO(selOld);
		msgHelp.setEWDSHN(selNew);
		msgHelp.setEWDREC(fromRec);

		mp.sendMessage(msgHelp);
		// Receive Help
		JBObjList list = mp.receiveMessageRecordList("EWDOPE", "EWDREC");
		rows = 1;
		if (!list.isEmpty()) {
			list.initRow();
			list.getNextRow();
			msgHelp =  (EWD0152DSMessage) list.getRecord();
			out.println("<h4>"+msgHelp.getEWDDS1().trim()+"</h4>");
			%>
			  <table id="TBHELP">
			   <tr>
				<td nowrap><b>Busqueda Rapida : </b></td>
			  	<td nowrap>
					<input type="text" name="SelNew"  size=20 maxlength=20>
        			&nbsp;&nbsp;<a href="javascript:goSearch();"><img src="<%=request.getContextPath()%>/images/search1.gif" align="bottom" border="0" ></a> 
      			</td>
    		   </tr>
			  </table>
			  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'95%'">
 			   <TR> 
    			     <TD NOWRAP width="100%" >
  				<table id="headTable" style="width: 100%">
  				   <TR id="trdark">  
      					<TH ALIGN=CENTER NOWRAP>Código</TH>
      					<TH ALIGN=CENTER NOWRAP>Descripción</TH>
      					<TH ALIGN=CENTER NOWRAP>Ciudad</TH>
      					<TH ALIGN=CENTER NOWRAP>Descripción</TH>
          			   </TR>
       			</TABLE>
  
   			    <div id="dataDiv1" class="scbarcolor">
    				<table id="dataTable" > 
			<% 
		}
		int ct = 0;
		while (list.getNextRow()) {
			msgHelp =  (EWD0152DSMessage) list.getRecord();
			
			String myCode1 = msgHelp.getEWDCD1().trim();
			String myDesc1 = msgHelp.getEWDDS1().trim();
			String myCode2 = msgHelp.getEWDCD2().trim();
			String myDesc2 = msgHelp.getEWDDS2().trim();
			selOld = msgHelp.getEWDSHO().trim();
                            	
			out.println("<tr>");
			out.println("<td nowrap >" + myCode1 + "</td>");
			out.println("<td nowrap><NOBR><A HREF=\"javascript:a('" + myCode1 +"', '" + myDesc1 + "','" + myCode2 +"', '" + myDesc2 + "')\">"  + myDesc1 + "</a></td>");
			out.println("<td nowrap><NOBR><A HREF=\"javascript:a('" + myCode1 +"', '" + myDesc1 + "','" + myCode2 +"', '" + myDesc2 + "')\">"  + myCode2 + "</a></td>");
			out.println("<td nowrap><NOBR><A HREF=\"javascript:a('" + myCode1 +"', '" + myDesc1 + "','" + myCode2 +"', '" + myDesc2 + "')\">"  + myDesc2 + "</a></td>");
			out.println("</tr>");
			rows++;
		}
			%>
			 </table>
   			</div>
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
     		         	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      		}
	 		resizeDoc();   			
     		window.onresize=resizeDoc;        
     </SCRIPT>
		    
	 <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( list.getShowPrev() ) {
      			int pos = list.getFirstRec() - 31;
      			   out.print("<A HREF=\""+request.getContextPath()+"/pages/s/EWD0152_helpfile_CNOFC.jsp?codeflag=" + codeflag + "&FromRecord=" + pos + "&SelNew=" + selNew + "&SelOld=" + selOld + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        } %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if (list.getShowNext()) {
      			int pos = list.getLastRec();
      			out.print("<A HREF=\""+request.getContextPath()+"/pages/s/EWD0152_helpfile_CNOFC.jsp?codeflag=" + codeflag + "&FromRecord=" + pos + "&SelNew=" + selNew + "&SelOld=" + selOld + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        } %>
      </TD>
	 </TR>
	 </TABLE>
<%
	} finally {
		if (mp != null) mp.close();
	}
%>
</form>
</BODY>
</HTML>
