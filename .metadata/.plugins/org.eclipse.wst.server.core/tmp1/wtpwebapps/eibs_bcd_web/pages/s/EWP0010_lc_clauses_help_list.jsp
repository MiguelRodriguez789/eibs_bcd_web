<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Lista de Cuentas a Aprobar
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
 function select(fld1,fld2,fld3){
    document.forms[0].E01CLSCDE.value = fld1;
    document.forms[0].E01CLSTXN.value = fld2;
    document.forms[0].E01CLSDSC.value = fld3;
    document.forms[0].submit();
    top.close();
 } 

</SCRIPT>

</HEAD>
<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }%>

<FORM name="letterOfCreditForm" target="main" method="post" action="<%=userPO.getRedirect()%>">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1111">
	<INPUT TYPE=HIDDEN NAME="E01CLSCDE" value="">
	<INPUT TYPE=HIDDEN NAME="E01CLSTXN" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="E01CLSDSC" VALUE="">
	

 
	
	<H3 align="center">
	Clausulas 
		<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="EWP0010_lc_clauses_help_list.jsp">
	</H3>
	<HR size="4">
    
	<BR>
  
	<TABLE  id="mainTable" class="tableinfo" border="0" cellspacing="0" cellpadding="2">
					<TR id="trdark">
						<TH ALIGN=CENTER nowrap width="25%">Clausula</TH>
						<TH ALIGN=CENTER nowrap width="25%">Texto</TH>						
						<TH ALIGN="left" nowrap width="50%">Descripcion</TH>						
					</TR>
						<% 
							String s1, s2, s3;
					        jbList.initRow(); 
							boolean firstTime = true;
							String chk = "";
					        while (jbList.getNextRow()) {
					        	datapro.eibs.beans.EWP001001Message msgPart = (datapro.eibs.beans.EWP001001Message) jbList.getRecord();
							   	s1 = msgPart.getE01CLSCDE();
							   	s2 = msgPart.getE01CLSTXN();
							   	s3 = msgPart.getE01CLSDSC();
					    %>               
						        <TR>
						        	<TD NOWRAP ALIGN="CENTER"><A href="javascript:select('<%=s1%>','<%=s2%>','<%=s3%>');"><%=s1%></A></TD>
									<TD NOWRAP ALIGN="CENTER"><A href="javascript:select('<%=s1%>','<%=s2%>','<%=s3%>');"><%=s2%></A></TD>
									<TD NOWRAP ALIGN="LEFT"  ><A href="javascript:select('<%=s1%>','<%=s2%>','<%=s3%>');"><%=s3%></A></TD>
								</TR>
				    	<%}%>    
				</TABLE>
	</FORM>
</BODY>
</HTML>
