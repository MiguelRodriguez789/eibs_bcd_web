<HTML>
<HEAD>
<TITLE>Control de Documentos Recibidos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC020001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<%if (!error.getERRNUM().equals("0"))
{
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>

</HEAD>

<BODY BGCOLOR="#FFFFFF">

<H3 ALIGN="center">Control de Documentos Recibidos<IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left"
	NAME="EIBS_GIF" title="lc_doc_enter.jsp, ELC0200"></H3>
<HR SIZE="4">


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0200">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="2">
<DIV ALIGN="center">
<TABLE CLASS="tbenter" WIDTH="100%" BORDER="0">
	<TR>
		<TD width="50%" align="right">N&uacute;mero de Carta de Cr&eacute;dito:		</TD>
		<TD width="50%">
		<DIV><INPUT TYPE="text" NAME="E01LCMACC" SIZE="13" MAXLENGTH="12" value="<%=msg01.getE01LCMACC() %>" onkeypress="enterInteger(event)"> <A
			HREF="javascript:GetAccount('E01LCMACC','','40','')"> <IMG SRC="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" BORDER="0"></A></DIV>
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
