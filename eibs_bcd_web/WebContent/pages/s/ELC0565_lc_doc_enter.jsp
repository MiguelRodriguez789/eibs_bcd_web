<HTML>
<HEAD>
<TITLE>Control de Documentos Recibidos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC056501Message" scope="session" />

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
	NAME="EIBS_GIF" title="lc_doc_enter.jsp, ELC0565"></H3>
<HR SIZE="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0565">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="4">
<DIV ALIGN="center">
<TABLE CLASS="tbenter" WIDTH="100%" BORDER="0">
	<TR>
		<TD width="50%" align="right">N&uacute;mero de Carta de Cr&eacute;dito:		</TD>
		<TD width="50%">
		<DIV><INPUT TYPE="text" NAME="E01LCMACC" SIZE="13" MAXLENGTH="12" onkeypress="enterInteger(event)"> <A
			HREF="javascript:GetAccount('E01LCMACC','','40','')"> <IMG SRC="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" BORDER="0"></A></DIV>
		</TD>
	</TR>
	<tr>
		<td width="50%" align="right">Numero de Negociacion:</td>
		<td width="50%"><input type="text" name="E01LCMACC0" size="13"
			maxlength="12" onkeypress="enterInteger(event)"> <a
			href="javascript:GetAccount('E01LCMACC','','40','')"></a></td>
	</tr>
	<tr>
		<td width="50%" align="right">Tipo de Trans. Doc.:</td>
		<td width="50%">
		<a
			href="javascript:GetAccount('E01LCMACC','','40','')">
		</a>
		<select
			name="E01TTRDOC">
            <option <%= msg01.getE01TTRDOC().trim().equals("1")?"selected":"" %> value="T">Steamship</option>
			<option <%= msg01.getE01TTRDOC().trim().equals("2")?"selected":"" %> value="A">Airborne</option>
	    	<option <%= msg01.getE01TTRDOC().trim().equals("3")?"selected":"" %> value="R">Truck</option>
		</select></td>
	</tr>
	<TR>
		<TD COLSPAN="2" height="152"><DIV ALIGN="center"><BR>
		<INPUT ID="EIBSBTN" TYPE="submit" NAME="Submit" VALUE="Enviar"></DIV>
		</TD>
	</TR>
</TABLE>
</DIV>

</FORM>

</BODY>
</HTML>
