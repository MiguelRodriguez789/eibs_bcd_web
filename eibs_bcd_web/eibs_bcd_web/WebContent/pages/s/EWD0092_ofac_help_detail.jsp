<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="datapro.eibs.beans.EWD0092DSMessage"%><html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<TITLE>Lista de Control</TITLE>
</head>
<jsp:useBean id= "EWD0092HelpDetail" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
var reason = '';
var option = '';
var SEARCH_ENTRIES = new Object();

function enterReason(op){
	option = op;
	var page= "${pageContext.request.contextPath}/pages/s/EWD0092_message_enter_text.jsp?Number=<%=request.getParameter("shrAcc")%>&Seq=<%=request.getParameter("shrSeq")%>";
	CenterWindow(page,500,430,3);
}

function goAction(op) {
	var ok = reason != '';
	if(!ok){
		for (name in SEARCH_ENTRIES) {
			if(SEARCH_ENTRIES[name] == ''){
		    	enterReason(op);
		    	ok = reason != '';
		    	break;
			}
			ok = true;
		}
	}
	if(ok){
		top.opener.reason=reason;
		top.opener.goAction(op);
		top.close();
	}
}
 
function goExit(){
  top.close();
}

function showMatches(shrAcc, shrCat, shrSeq, shrName) {
	SEARCH_ENTRIES[shrName] = shrName;
	var URL="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + shrAcc + "&shrCategory=" + shrCat + "&Seq=" + shrSeq + "&Name=" + shrName + "&FromRecord=0" + "&shrAction=<%= request.getParameter("shrAction")%>";
	CenterWindow(URL,800,600,2);
}
</script>
<BODY>
<FORM>
<%
int k=0;
if ( EWD0092HelpDetail.getNoResult() ) {
%>
     <TABLE class="tbenter" width="100%" height="100%" >
     <TR>
     <TD> 
     <div align="center"><b>No hay resultados que correspondan a su criterio de búsqueda</b> 
     </div>
     </TD>
    </TR>
     </TABLE>
<%
} else {  %>
<TABLE  id="mainTable" class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark">
		<TH ALIGN=CENTER  nowrap width="20%">Origen</TH> 
        <TH ALIGN=CENTER  nowrap width="40%">Nombre de Busqueda</TH>
    <%
        	if("S".equals(request.getParameter("shrType"))) {
	%>
		<TH ALIGN=CENTER  nowrap width="40%" colspan="5">
			<table width="100%" class="trdark">
				<tr>
					<th colspan="4">Número de<br>Coincidencias</th>
				</tr>
			  	<tr>
			  		<th width="33%" align="center">Alto</th>
			    	<th width="33%" align="center">Med.</th>
			    	<th width="33%" align="center">Bajo</th>
			    	<th width="33%" align="center">Total</th>
			  </tr>
			</table>
		</TH>
	<%
        	} else {
	%>
		<TH ALIGN=CENTER  nowrap width="40%">Número de<br>Coincidencias</TH>
	<%
        	}
	%>
     </TR>

    <%
    	String shrType = request.getParameter("shrType");
    	String shrAcc = request.getParameter("shrAcc");
    	String shrSeq = request.getParameter("shrSeq");
		String shrCategory = request.getParameter("shrCategory");
		String shrAction = request.getParameter("shrAction");
		
		String strCategory = "";
   		EWD0092HelpDetail.initRow();
        while (EWD0092HelpDetail.getNextRow()) {
            EWD0092DSMessage msgHelp = (EWD0092DSMessage)EWD0092HelpDetail.getRecord();
	%>
		<TR class="<%= EWD0092HelpDetail.getCurrentRow()%2==0 ? "TRNORMAL" : "TRHIGHLIGHT"%>">
		<TD NOWRAP align="left" style="padding-right: 10px">
		 	<script type="text/javascript">
		 		SEARCH_ENTRIES['<%=msgHelp.getSWDSCA()%>'] = '';
		 	</script> 
		 	<A HREF="javascript:showMatches('<%=msgHelp.getEWDNRO()%>','<%=msgHelp.getSWDPRO().trim()%>','<%=msgHelp.getEWDPRO()%>','<%=msgHelp.getSWDSCA()%>')">
			<%=msgHelp.getSWDPRO()%>
			</A>
		</TD>
		<TD align="left">
			<A HREF="javascript:showMatches('<%=msgHelp.getEWDNRO()%>','<%=msgHelp.getSWDPRO().trim()%>','<%=msgHelp.getEWDPRO()%>','<%=msgHelp.getSWDSCA()%>')">
				<%=msgHelp.getSWDSCA()%></A>
		</TD>
    <%
        	if("S".equals(msgHelp.getSWDTYP())) {
	%>
		<TD NOWRAP align="right" width="10%">
			<span style="color: red"><%=msgHelp.getSWDCOH()%> </span>
		</TD>
		<TD NOWRAP align="right" width="10%">
			<span style="color: orange"><%=msgHelp.getSWDCOM()%> </span>
		</TD>
		<TD NOWRAP align="right" width="10%">
			<span style="color: black"><%=msgHelp.getSWDCOW()%> </span>
		</TD>
		<TD NOWRAP align="right" width="10%">
			<%=msgHelp.getSWDCON()%> 
		</TD>
	<%
        	} else {
	%>
		<TD NOWRAP align="right">
			<A HREF="javascript:showMatches(''<%=msgHelp.getEWDNRO()%>','<%=msgHelp.getSWDPRO().trim()%>','<%=msgHelp.getEWDPRO()%>','<%=msgHelp.getSWDSCA()%>')">
				<%=msgHelp.getSWDCON()%></A>
		</TD>
    <%
        	}
			strCategory = msgHelp.getEWDPRO();
	%>
		</TR> 
	<%
		}
     %>
  </TABLE>

  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
	<%
        if ( EWD0092HelpDetail.getShowPrev() ) {
      		int pos =EWD0092HelpDetail.getFirstRec() - 51;
    %>
          	<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrType=<%=shrType%>&shrAcc=<%=shrAcc%>&shrSeq=<%=shrSeq%>&shrCategory=SUMMARY&FromRecord=<%=pos%>&shrAction=<%=shrAction%>" >
          	<img src="<%= request.getContextPath()%>/images/s/Regresar.gif" border=0></A>
    <%
    	} 
    %> 
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25">
 	<%
        if ( EWD0092HelpDetail.getShowNext() ) {
      		int pos = EWD0092HelpDetail.getLastRec();
	%>
	        <A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrType=<%=shrType%>&shrAcc=<%=shrAcc%>&shrSeq=<%=shrSeq%>&shrCategory=SUMMARY&FromRecord=<%=pos%>&shrAction=<%=shrAction%>" >
          	<img src="<%= request.getContextPath()%>/images/s/Avanzar.gif" border=0></A>
    <%
    	} 
    %> 
  </TD>
  </TR>
  </TABLE>
  <TABLE class="tbenter" width="97" height="40" style="vertical-align: bottom">
    <TR>

       <% if (!request.getParameter("shrAction").equals("INQ") && !EWD0092HelpDetail.getShowNext()){ %>
		<TD class=TDBKG width="33%"> 
			<div align="center"><a href="javascript:goAction('Z')"><b>Aprobar</b></a></div>
		</TD>
	<% } %>
		<TD class=TDBKG width="34%">
			<div align="center"><a href="javascript:goExit()"><b>Salir</b></a></div>
		</TD>
    </TR>
  </TABLE>

<%      
  }
%> 
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
</FORM>
<script>
document.forms[0].totalRow.value="<%= k %>";
</script>
</BODY>
</HTML>