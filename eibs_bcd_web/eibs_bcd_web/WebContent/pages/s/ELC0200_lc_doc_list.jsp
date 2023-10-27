<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Lista de Cuentas a Aprobar</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="jbList" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC020001Message" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
 function goAction(op)
 {
	if(op == "N") 		{ document.forms[0].SCREEN.value = 3; }
	else if(op == "M")	{ document.forms[0].SCREEN.value = 4; }
	document.forms[0].submit();
 }

</SCRIPT>
</HEAD>
<BODY>

<%if (!error.getERRNUM().equals("0"))
{
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
} 
%>

<FORM name="letterOfCreditForm" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0200">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
<H3 align="center">Control de Documentos Recibidos<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="lc_doc_list.jsp, ELC0200"></H3>
<HR size="4">

<TABLE width="100%" border="0" class="tableinfo" id="trdark" align="center">
  <TR>
    <TD align="right" nowrap>Banco: </TD>
    <TD nowrap><INPUT name="E01LCMBNK" value="<%=msg01.getE01LCMBNK()%>" size="4" maxlength="4" readonly></TD>
    <TD colspan="2" align="right" nowrap>Numero de Carta de Credito: </TD>
    <TD nowrap><INPUT name="E01LCMACC" value="<%=msg01.getE01LCMACC()%>" size="15" readonly></TD>
  </TR>
  <TR>
    <TD align="right" nowrap>Nuestra Referencia: </TD>
    <TD colspan="2" nowrap><INPUT name="E01LCMORF" value="<%=msg01.getE01LCMORF()%>" size="18" maxlength="18" readonly></TD>
    <TD align="right" nowrap>Nombre del Cliente: </TD>
    <TD nowrap><INPUT name="E01CUSNA1" value="<%=msg01.getE01CUSNA1()%>" size="46" maxlength="46" readonly></TD>
  </TR>
  <TR>
    <TD align="right" nowrap>Referencia del Otro Banco: </TD>
    <TD colspan="2" nowrap><INPUT name="E01LCMTRF" value="<%=msg01.getE01LCMTRF()%>" size="18" maxlength="18" readonly></TD>
    <TD align="right" nowrap>Nombre del Beneficiario: </TD>
    <TD nowrap><INPUT name="E01LCMBN1" value="<%=msg01.getE01LCMBN1()%>" size="46" maxlength="40" readonly></TD>
  </TR>
</TABLE>

<TABLE class="tbenter">
	<TR>
		<TD class=TDBKG>
		<DIV align="center"><A name="New" href="javascript:goAction('N')"><B>Crear</B></A></DIV>
		</TD>
		<TD class=TDBKG>
		<DIV align="center"><A name="Maint" href="javascript:goAction('M')"><B>Modificar</B></A></DIV>
		</TD>
		<TD class=TDBKG>
		<DIV align="center"><A href="<%=request.getContextPath()%>/pages/background.jsp"><B>Salir</B></A></DIV>
		</TD>
	</TR>
</TABLE>

<TABLE id="mainTable" class="tableinfo">
	<TR>
		<TD NOWRAP valign="top">
		<TABLE id="headTable" width="100%">
			<TR id="trdark">
				<TH ALIGN=CENTER nowrap></TH>
				<TH ALIGN=CENTER nowrap>NRO</TH>
				<TH ALIGN=CENTER nowrap>Fecha<br> Recibido </TH>
				<TH ALIGN=CENTER nowrap>MDA</TH>
				<TH ALIGN=CENTER nowrap>Monto</TH>
				<TH ALIGN=CENTER nowrap>Status</TH>
				<TH ALIGN=CENTER nowrap>Beneficiario</TH>
			</TR>
			<%int k = 0;
jbList.initRow();
boolean firstTime = true;
String chk = "";
while (jbList.getNextRow())
{
	ELC020001Message msgPart = (ELC020001Message) jbList.getRecord();
	if (firstTime)
	{
		firstTime = false;
		%><INPUT TYPE="hidden" NAME="E01LCIDNO" value="<%=msgPart.getE01LCIDNO()%>"> <%
		chk = "checked";
	}
	else
	{
		chk = "";
	}
	%>
			<TR>
				<TD NOWRAP><INPUT type="radio" name="ACCNUM_TEMP" value="<%=msgPart.getE01LCIDNO()%>"
					onclick="document.forms[0].E01LCIDNO.value = this.value;" <%=chk%>></TD>
				<TD NOWRAP ALIGN="center"><A href="javascript:document.forms[0].E01LCIDNO.value = '<%=msgPart.getE01LCIDNO()%>'; goAction('M');"><%=msgPart.getE01LCIDNO()%></A></TD>
				<TD NOWRAP ALIGN="CENTER"><A href="javascript:document.forms[0].E01LCIDNO.value = '<%=msgPart.getE01LCIDNO()%>'; goAction('M');">
				<%=msgPart.getE01LCIRDM()%> / <%=msgPart.getE01LCIRDD()%> /
				<%=(msgPart.getE01LCIRDY().length() == 1 ? "0":"") + msgPart.getE01LCIRDY()%></A></TD>
				<TD NOWRAP ALIGN="CENTER"><A href="javascript:document.forms[0].E01LCIDNO.value = '<%=msgPart.getE01LCIDNO()%>'; goAction('M');"><%=msgPart.getE01LCICCY()%></A></TD>
				<TD NOWRAP ALIGN="right"><A href="javascript:document.forms[0].E01LCIDNO.value = '<%=msgPart.getE01LCIDNO()%>'; goAction('M');"><%=msgPart.getE01LCIAMN()%></A></TD>
				<TD NOWRAP ALIGN="left"><A href="javascript:document.forms[0].E01LCIDNO.value = '<%=msgPart.getE01LCIDNO()%>'; goAction('M');"><%=msgPart.getE01STATUS()%></A></TD>
				<TD NOWRAP ALIGN="left"><A href="javascript:document.forms[0].E01LCIDNO.value = '<%=msgPart.getE01LCIDNO()%>'; goAction('M');"><%=msgPart.getE01LCMBN1()%></A></TD>
			</TR>
			<%k++;
}%>
		</TABLE>		</TD>
	</TR>
</TABLE>

</FORM>

<!--<%	if (!userPO.getHeader20().equals("")) {%>

<TABLE border="1">
	<TBODY>
		<TR>
			<TD>
			<%
			String s = userPO.getHeader18();
			for(int i = 0; i < s.length(); i++)
			{
				if(s.charAt(i) == ':')	out.print("<BR>");
				else if (s.charAt(i) == '<') out.print("{");
					else if (s.charAt(i) == '>') out.print("}");
				else 					out.print(s.charAt(i));

			}
			%>
			</TD>
			<TD>
			<%
			s = userPO.getHeader20();
			for(int i = 0; i < s.length(); i++)
			{
				if(s.charAt(i) == ':')	out.print("<BR>");
				else if (s.charAt(i) == '<') out.print("{");
					else if (s.charAt(i) == '>') out.print("}");
				else 					out.print(s.charAt(i));

			}
			%>
			</TD>
			<TD>
			<%
			s = userPO.getHeader19();
			for(int i = 0; i < s.length(); i++)
			{
				if(s.charAt(i) == ':')	out.print("<BR>");
				else if (s.charAt(i) == '<') out.print("{");
					else if (s.charAt(i) == '>') out.print("}");
				else 					out.print(s.charAt(i));

			}
			%>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<%}%>-->
</BODY>
</HTML>
