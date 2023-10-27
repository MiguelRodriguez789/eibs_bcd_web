<HTML>
<HEAD>
<TITLE>
 Lista de Sucursales asignadas por usuario
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"    scope="session" />
<jsp:useBean id= "error"  class= "datapro.eibs.beans.ELEERRMessage"    scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"   scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
	var reason = '';
 
  	function goAction(op) {
    	document.forms[0].action.value = op;
     	document.forms[0].reason.value = reason;
     	var formLength = document.forms[0].elements.length;
     	var ok = false;
     	for (n=0; n<formLength; n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue = document.forms[0].elements[n].value;
      	}
	}	  
 
 	function goExit(){
  		window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
  	}  
  
 	function showAddInfo(idxRow) {
   		for ( var i=0; i<dataTable.rows.length; i++ ) {
       		dataTable.rows[i].className = "trnormal";
    	}

   		dataTable.rows[idxRow].className = "trhighlight";
  	}   
</script>
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0"); 
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}
%>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">


<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0008" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
<INPUT TYPE=HIDDEN NAME="action" VALUE="A">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="<%=appList.getLastRec()%>">

<h3 align="center">Consulta sucursales asignadas	</h3>
<hr size="4">  

<TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER>
	<TR> 
    	<TD NOWRAP>
  			<TABLE id="headTable">
  				<TR id="trdark">  
      				<TH ALIGN=CENTER nowrap>Banco</TH>
      				<TH ALIGN=CENTER nowrap>Sucursal</TH>
      				<TH ALIGN=CENTER nowrap>Todas</TH>
  				</TR>
  			</TABLE>
  
   			<div id="dataDiv1" class="scbarcolor" style="padding:0">
    			<table id="dataTable">
<%
                	appList.initRow();
                	while (appList.getNextRow()) {
                    	if (appList.getFlag().equals("")) {
                    		out.println(appList.getRecord());
                    	}        
                	}
%>
   				</table>
   			</div>
  		</TD>
  	</TR>	
</TABLE>

<SCRIPT type="text/javascript">
	function resizeDoc() {
    	divResize(); 
      	 adjustEquTables( getElement("headTable"), getElement("dataTable"), getElement("dataDiv1"), 1, false);
  	}
  	resizeDoc();
  	window.onresize=resizeDoc;
</SCRIPT>

</FORM>
</BODY>
</HTML>
