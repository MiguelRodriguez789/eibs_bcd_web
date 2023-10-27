<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="datapro.eibs.beans.EWD0092DSMessage"%>
<%@page import="datapro.eibs.master.Util"%><html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<TITLE>Lista de Control</TITLE>
</head>
<jsp:useBean id= "EWD0092Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script language="javascript">
 
function showOfacDetail(shrType, shrAcc, shrSeq, shrCat) {
	results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrType=" + shrType + "@shrAcc=" + shrAcc + "@shrSeq=" + shrSeq + "@shrCategory=SUMMARY@FromRecord=0@shrAction=<%= request.getParameter("shrAction")%>"+"'";
}

</script>
<BODY>
<FORM>
<%
if ( EWD0092Help.getNoResult() ) {
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
} else {
%>
  <h3 align="center">Coincidencias con Lista de Control</h3>
  <TABLE class="tbenter" width="97" height="40">
    <TR>
    </TR>
  </TABLE>
<TABLE class="tableinfo" align="center" style="width:'95%'">
    <TR id="trdark"> 
    	  <TH ALIGN=CENTER  nowrap width="20%">Nro. Busqueda</TH>
          <TH ALIGN=CENTER  nowrap width="20%">Referencia</TH>
          <TH ALIGN=CENTER  nowrap width="20%">Total de Concidencias</TH>
          <TH ALIGN=CENTER  nowrap width="10%">Fecha</TH>
     </TR>
    <%
    	String shrType = "";
    	String shrSearch = "";
 		String shrAcc = request.getParameter("shrAcc");
		String shrCategory = request.getParameter("shrCategory");
		String shrAction = request.getParameter("shrAction");
		
    	String strCategory = "";
    	Integer totm = 0;
    	EWD0092DSMessage msgHelp = null;
   		EWD0092Help.initRow();
        while (EWD0092Help.getNextRow()) {
            msgHelp = (EWD0092DSMessage)EWD0092Help.getRecord();
            shrType = msgHelp.getSWDTYP();
            shrSearch = msgHelp.getEWDNRO();
			strCategory = msgHelp.getSWDPRO();
			totm = totm + Integer.parseInt(msgHelp.getSWDNMT());
		}	
	%>
		<TR>
		<TD NOWRAP align="center">
			<%=shrSearch%>
		</TD>
		<TD NOWRAP align="center">
			Cuenta / Cliente / Cheque : <%=msgHelp.getEWDACN()%>
		</TD>
		<TD NOWRAP align="center">
			<%=totm%>
		</TD>
		<TD NOWRAP align="center">
			<%=Util.formatCustomDate(currUser.getE01DTF(),
					msgHelp.getBigDecimalSWDDTM().intValue(),
					msgHelp.getBigDecimalSWDDTD().intValue(),
					msgHelp.getBigDecimalSWDDTY().intValue())%>
		</TD>
		</TR> 
  </TABLE>
  <br/>
  <iframe id="results" name="results" frameborder="0" width="100%" height="100%" marginwidth="0">
  </iframe>
<script language="javascript">
	showOfacDetail('<%=shrType%>', '<%=shrAcc%>','<%=shrSearch%>', '<%=strCategory%>');
</script>

<%      
  }
%> 

</FORM>
<script language="JavaScript">
setCenterSize(800,600);
</script>

</BODY>
</HTML>