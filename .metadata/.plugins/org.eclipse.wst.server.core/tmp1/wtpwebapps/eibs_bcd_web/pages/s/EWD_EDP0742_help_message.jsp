<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">
function enter(code, desc) {
	var form = top.opener.document.forms[0];
  	if (isValidObject(form[top.opener.fieldDesc])) {
  		form[top.opener.fieldDesc].value = desc;
  		if (form[top.opener.fieldDesc].type != "hidden") {
  			form[top.opener.fieldDesc].focus();
  		}	
  	}
  	if (isValidObject(form[top.opener.fieldName])) {
		form[top.opener.fieldName].value = code;
		if (form[top.opener.fieldName].type != "hidden") {
			form[top.opener.fieldName].focus();
			form[top.opener.fieldName].select();
		}	
  	}	
	top.close();
}
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "edp0742Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<BODY>

<%@ page import="datapro.eibs.master.Util" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( edp0742Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Code</TH>
      <TH ALIGN=CENTER  nowrap width="50%">Descripción</TH>
    </TR>
     	<%
        edp0742Help.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (edp0742Help.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EDP074201Message msg = (datapro.eibs.beans.EDP074201Message) edp0742Help.getRecord();
     	%>               
        <TR>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01OPECDE()%>','<%=msg.getE01CNTNME()%>')"><%=Util.formatCell(msg.getE01OPECDE())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getE01OPECDE()%>','<%=msg.getE01CNTNME()%>')"><%=Util.formatCell(msg.getE01CNTNME())%></a></td>
			</TR>   		
    	<%}%>   
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
 	<%
        if ( edp0742Help.getShowPrev() ) {
      			int pos = edp0742Help.getFirstRec() - 21;
	%>
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEDP0742?FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/s/previous_records.gif" border=0></A>		
	</TD>
	<%  }
        if ( edp0742Help.getShowNext() ) {
      			int pos = edp0742Help.getLastRec();        
	%> 
	<TD WIDTH="50%" ALIGN=LEFT height="25">
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEDP0742?FromRecord=<%=pos%>" > 
			<img src="<%=request.getContextPath()%>/images/s/next_records.gif" border=0></A>		
	</TD>
	 </TR>
<%      }
  }
%> 
	 </TABLE>
</FORM>

</BODY>
</HTML>