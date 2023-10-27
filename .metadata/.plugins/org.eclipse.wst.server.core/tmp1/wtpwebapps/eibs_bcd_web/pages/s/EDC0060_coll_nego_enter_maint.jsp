<HTML>
<HEAD>
<TITLE>Negociación de Cartas de Crédito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="${pageContext.request.contextPath}/pages/style.css" REL="stylesheet">

<SCRIPT type="text/javascript" SRC="${pageContext.request.contextPath}/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />


<%if (!error.getERRNUM().equals("0")){
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
<SCRIPT type="text/javascript">
 function HelpWindow(fld1,fld2){
 	fieldAux1=fld1;
	fieldAux2=fld2;
	var page= webapp +'/servlet/datapro.eibs.approval.JSEDC0140?SCREEN=15';
	CenterWindow(page,500,400,3);
 }
</SCRIPT >
 
</HEAD>

<BODY BGCOLOR="#FFFFFF">

<H3 ALIGN="center">Pago/Liquidación de Cobranzas
	<IMG SRC="${pageContext.request.contextPath}/images/e_ibs.gif" ALIGN="left" NAME="EIBS_GIF" title="coll_nego_enter_maint.jsp, EDC0060"></H3>
<HR SIZE="4">


<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDC0060">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="0006">
<INPUT TYPE="HIDDEN" NAME="H01OPECOD" VALUE="0006">
<INPUT TYPE="HIDDEN" NAME="prevPage" VALUE="EDC0060_coll_negotiation_enter_maint.jsp">
<DIV ALIGN="center">
<TABLE CLASS="tbenter" WIDTH="100%" BORDER="0">
	
	
	<TR>
		<TD align="right" nowrap>N&uacute;mero de Cobranza:		</TD>
		<TD nowrap>
		
		
		<DIV><INPUT TYPE="text" NAME="E01DCMACC" SIZE="13" MAXLENGTH="12" ONKEYPRESS="enterInteger(event)" >
		<A href="javascript:HelpWindow('E01DCMACC','E01PMTNUM')"> <IMG SRC="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" BORDER="0"></A>
			</DIV>
		
		
		</TD>
	</TR>
	
	
	
	
	
	<TR>
		<TD align="right" nowrap>
		Numero de Negociacion:		</TD>
		<TD nowrap><INPUT TYPE="text" NAME="E01PMTNUM" SIZE="2" MAXLENGTH="2" ONKEYPRESS="return enterDecimalNum(event)"><IMG
			src="${pageContext.request.contextPath}/images/Check.gif" title="campo obligatorio" border="0"> 
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2">
		<DIV ALIGN="center"><BR>
		<INPUT ID="EIBSBTN" TYPE="submit" NAME="Submit" VALUE="Enviar"></DIV>
		</TD>
	</TR>
</TABLE>
</DIV>

</FORM>

</BODY>
</HTML>
