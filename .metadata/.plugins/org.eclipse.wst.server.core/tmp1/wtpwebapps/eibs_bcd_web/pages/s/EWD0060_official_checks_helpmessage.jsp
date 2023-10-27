<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><title>Busqueda de Cheques Oficiales</title>
<HEAD>
<META http-equiv="Pragma" content="No-cache">
<META http-equiv="Pragma" content="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript">
	function enter(code) {
		var form = top.opener.document.forms[0];
 		if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code;
 		top.close();
 	}
</script>
<TITLE></TITLE>
</HEAD>
<jsp:useBean id= "ewd0060Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<BODY>
<h3 align="center">Cheques Oficiales</h3>

<%@ page import="datapro.eibs.master.Util" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( ewd0060Help.getNoResult() ) {
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
      <TH ALIGN=CENTER  nowrap width="10%">Cheque</TH>
      <TH ALIGN=CENTER  nowrap width="25%">Benefeciario</TH>
      <TH ALIGN=CENTER  nowrap width="25%">Aplicante</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Monto</TH>
      <TH ALIGN=CENTER  nowrap width="5%">Estado</TH>
      <TH ALIGN=CENTER  nowrap width="25%">Descripci&oacute;n</TH>
    </TR>
     	<%
        String Type = (String) request.getAttribute("Type");
        String NameSearch = (String) request.getAttribute("NameSearch");
        String Ccy = (String) request.getAttribute("Ccy");
        String Sel = (String) request.getAttribute("Sel");
        ewd0060Help.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (ewd0060Help.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.EWD0060DSMessage msg = (datapro.eibs.beans.EWD0060DSMessage) ewd0060Help.getRecord();
     	%>               
        <TR>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDCKN()%>')"><%=Util.formatCell(msg.getEWDCKN())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDCKN()%>')"><%=Util.formatCell(msg.getEWDBNF())%></a></td>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDCKN()%>')"><%=Util.formatCell(msg.getEWDAPL())%></a></td>
			<td NOWRAP align="right"><a href="javascript:enter('<%=msg.getEWDCKN()%>')"><%=Util.formatCell(msg.getEWDAMT())%></a></td>
			<% if (msg.getEWDSST().equals("S")){ %>
				<td NOWRAP><a href="javascript:enter('<%=msg.getEWDCKN()%>')">Suspen.</a></td>
			<%} else { %>
				<td NOWRAP><a href="javascript:enter('<%=msg.getEWDCKN()%>')"> </a></td>
			<% } %>
			<td NOWRAP><a href="javascript:enter('<%=msg.getEWDCKN()%>')"><%=Util.formatCell(msg.getEWDDS1())%></a></td>
		</TR>   		
    	<%}%>   
  </TABLE>
  
<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
   <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
      <% if ( ewd0060Help.getShowPrev() ) {
      			int pos = ewd0060Help.getFirstRec() - 21;
      			   out.print("<A HREF=\"" +
      			   			 request.getContextPath() +
      			   			 "/servlet/datapro.eibs.helps.JSEWD0060?NameSearch=" + 
      			   			 NameSearch + 
      			   			 "&FromRecord=" + 
      			   			 pos + 
      			   			 "&Type=" + 
      			   			 Type + 
	      			         "&Ccy=" + 
	      			         Ccy + 
	      			         "&Sel=" + 
	      			         Sel + 
      			   			 "\" > <img src=\"" +
      			   			 request.getContextPath() +
      			   			 "/images/s/previous_records.gif\" border=0></A>");
         }%> 
	  </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  <% if ( ewd0060Help.getShowNext() ) {
      			int pos = ewd0060Help.getLastRec();
      			out.print("<A HREF=\"" +
      			          request.getContextPath() +
      			          "/servlet/datapro.eibs.helps.JSEWD0060?NameSearch=" + 
      			          NameSearch + 
      			          "&FromRecord=" + 
      			          pos + 
      			          "&Type=" + 
      			          Type + 
       			          "&Ccy=" + 
      			          Ccy + 
      			          "&Sel=" + 
      			          Sel + 
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