<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">
	function enter(code, desc) {
		var form = top.opener.document.forms[0];
 		if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code;
  		if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = desc;
 		top.close();
 	}
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "ewd0023Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<BODY>

<%@ page import="datapro.eibs.master.Util" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<% if ( ewd0023Help.getNoResult() ) { %>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
   		
<% } else { %>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Codigo</TH>
      <TH ALIGN=CENTER  nowrap width="30%">Descripcion</TH>
      <TH ALIGN=CENTER  nowrap width="30%">Nombre Compania</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Identificación</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Tipo</TH>
    </TR>
     	<%
        String NameSearch = (String) request.getAttribute("NameSearch");
        String type = (String) request.getAttribute("Type");
        ewd0023Help.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (ewd0023Help.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EWD0023DSMessage msg = (datapro.eibs.beans.EWD0023DSMessage) ewd0023Help.getRecord();
     	%>               
        <TR>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDNUM())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDNM4())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDNM1())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDBID())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDNUM()%>','<%=msg.getEWDNM1()%>')"><%=Util.formatCell(msg.getEWDSTY())%></a></td>
			</TR>   		
    	<%}%>   
  </TABLE>
  
<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
   <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
      <% if ( ewd0023Help.getShowPrev() ) {
      			int pos = ewd0023Help.getFirstRec() - 21;
      			   out.print("<A HREF=\"" +
      			   			 request.getContextPath() +
      			   			 "/servlet/datapro.eibs.helps.JSEWD0023" +
      			   			 "?NameSearch=" + NameSearch +
      			   			 "&Type=" + type +
      			   			 "&FromRecord=" + pos + 
      			   			 "\" > <img src=\"" +
      			   			 request.getContextPath() +
      			   			 "/images/s/previous_records.gif\" border=0></A>");
         }%> 
	  </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  <% if ( ewd0023Help.getShowNext() ) {
      			int pos = ewd0023Help.getLastRec();
      			out.print("<A HREF=\"" +
							request.getContextPath() +
      			   			"/servlet/datapro.eibs.helps.JSEWD0023" +
      			   			"?NameSearch=" + NameSearch +
      			   			"&Type=" + type +
      			   			"&FromRecord=" + pos + 
     			          "\" ><img src=\"" +
      			          request.getContextPath() +
      			          "/images/s/next_records.gif\" border=0></A>");
        }%> 
	  </TD>
   </TR>
</TABLE>
<% } %>	 

</FORM>



</BODY>
</HTML>