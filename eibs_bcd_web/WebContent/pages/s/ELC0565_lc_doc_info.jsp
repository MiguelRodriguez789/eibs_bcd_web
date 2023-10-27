<HTML>
<HEAD>
<TITLE>Negociación de Cartas de Crédito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC056501Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<%
if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}

%>
<SCRIPT>
function goAction(op) {
 var delok= false;

 	document.forms[0].SCREEN.value = op;
    document.forms[0].submit();
}

</SCRIPT>
</HEAD>

<BODY BGCOLOR="#FFFFFF" >
<H3 ALIGN="center">Control de Documentos Recibidos <IMG SRC="<%=request.getContextPath()%>/images/e_ibs.gif" ALIGN="left"
	NAME="EIBS_GIF" title="lc_doc_info.jsp, ELC0565"></H3>
<HR SIZE="4"><FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0565">
<INPUT TYPE="HIDDEN" NAME="SCREEN" VALUE="5">
<INPUT TYPE="HIDDEN" NAME="E01LCIDNO" VALUE="<%=msg01.getE01LCRNUM().trim()%>">
<INPUT TYPE="HIDDEN" NAME="E01LCMBNK" VALUE="<%=msg01.getE01LCMBNK().trim()%>">

<table width="34%" border="0" class="tableinfo" id="trdark"
	align="center" height="152">
	<tr>
		<td align="left" nowrap colspan="7" width="234"><b>Numero De
		Carta de Credito : </b><b>
		</b></td>
		<td align="left" nowrap width="378"><input name="E01LCRNUM"
			value="<%=msg01.getE01LCRNUM()%>" size="22" maxlength="12" readonly></td>
		<td align="left" nowrap width="174"><b>Pagos/Numero Neg. :</b></td>
		<td align="left" nowrap width="415"><input name="E01DRWNUM"
			value="<%=msg01.getE01DRWNUM()%>" size="37" readonly></td>
	</tr>
	<tr>
		<td align="left" nowrap colspan="7" width="234"><b>Pago Neg.
		Tipo : </b><b> </b></td>
		<td align="left" nowrap width="378"><input name="E01OPCDSC"
			value="<%=msg01.getE01OPCDSC()%>" size="22" maxlength="18" readonly></td>
		<td align="left" nowrap width="174"><b>CCY : </b><input
			name="E01LCMCCY" value="<%=msg01.getE01LCMCCY()%>" size="9"
			maxlength="46" readonly><b> Monto: </b></td>
		<td align="left" nowrap width="415"><input name="E01DRWAMN"
			value="<%=msg01.getE01DRWAMN()%>" size="20" maxlength="46" readonly></td>
	</tr>
	<tr>
		<td align="left" nowrap colspan="7" height="24" width="234"><b>Cliente
		: </b><b> </b></td>
		<td align="left" nowrap height="24" width="378"><input
			name="E01CUSNA1" value="<%=msg01.getE01CUSNA1()%>" size="23"
			maxlength="18" readonly></td>
		<td align="left" nowrap height="24" width="174"><b>Nuetras
		Referencias : </b></td>
		<td align="left" nowrap height="24" width="415"><input
			name="E01LCMORF" value="<%=msg01.getE01LCMORF()%>" size="37"
			maxlength="40" readonly></td>
	</tr>
	<tr>
		<td align="left" nowrap height="18" colspan="7" width="234"><b>Produto
		: </b><input name="E01LCMTPRO" value="<%=msg01.getE01LCMPRO()%>" size="8"
			maxlength="16" readonly><b>
		</b></td>
		<td align="left" nowrap height="18" width="378"><input
			name="E01DSCPRO" value="<%=msg01.getE01DSCPRO()%>" size="34"
			maxlength="3" readonly></td>
		<td align="left" nowrap height="18" width="174"><b>Sus
		referencias :</b></td>
		<td align="left" nowrap height="18" width="415"><input
			name="E01WIRETO" value="<%=msg01.getE01WIRETO()%>" size="37"
			maxlength="40" readonly></td>
	</tr>
</table>

<BR>
<TABLE class="tableinfo" id="trclear" cellspacing="0" cellpadding="2"
	width="81%" border="0">
	<TR id="trdark">
		<TD align="right" nowrap width="200">Numero de Factura :</TD>
		<TD nowrap width="318"><A
			href="javascript:DatePicker(document.forms[0].E01LCIRDM,document.forms[0].E01LCIRDD,document.forms[0].E01LCIRDY)"></A>
		<INPUT name="E01INVNUM" value="<%=msg01.getE01INVNUM()%>" size="14"
			maxlength="12"> <IMG
			src="<%=request.getContextPath()%>/images/Check.gif"
			title="campo obligatorio" border="0"></TD>
		<TD align="right" nowrap width="140">Monto de Factura :</TD>
		<td align="right" nowrap width="68"><input name="E01INVCCY"
			value="<%=msg01.getE01INVCCY()%>" size="5" maxlength="3"></td>
		<TD nowrap width="212"><INPUT name="E01INVAMT"
			value="<%=msg01.getE01INVAMT()%>" size="19" maxlength="15"> <IMG
			src="<%=request.getContextPath()%>/images/Check.gif"
			title="campo obligatorio" border="0"></TD>
	</TR>
	<TR>
		<TD align="right" nowrap width="200">Tipo de Cambio :</TD>
		<TD nowrap width="318"><input name="E01LCRFXR"
			value="<%=msg01.getE01LCRFXR()%>" size="21" maxlength="8"><IMG
			src="<%=request.getContextPath()%>/images/Check.gif"
			title="campo obligatorio" border="0"></TD>
		<TD align="right" nowrap width="140">Tenor :</TD>
		<td align="right" nowrap width="68"></td>
		<TD nowrap width="212"><INPUT name="E01LCIBRE"
			value="<%=msg01.getE01RTENOR()%>" size="16, 18"></TD>
	</TR>
	<TR id="trdark">
		<TD align="right" nowrap width="200">Numero de Cheque :</TD>
		<TD nowrap width="318"><INPUT name="E01CHKNUM"
			value="<%=msg01.getE01CHKNUM()%>" size="21" maxlength="30"></TD>
		<TD align="right" nowrap width="140">Numero de envio :</TD>
		<td align="right" nowrap width="68"></td>
		<TD nowrap width="212"><input name="E01TRFNUM"
			value="<%=msg01.getE01TRFNUM()%>" size="16, 18"></TD>
	</TR>
	<TR id="trclear">
		<TD align="right" nowrap width="200">Via de Pago :</TD>
		<TD nowrap width="318"><input name="E01DSCPVI"
			value="<%=msg01.getE01DSCPVI()%>" size="16, 18"></TD>
		<td nowrap align="right" width="140">Envio A :</td>
		<td nowrap align="right" width="68"></td>
		<td nowrap width="212"><input name="E01LCIBRE1"
			value="<%=msg01.getE01WIRETO()%>" size="16, 18"></td>
	</TR>
</TABLE>


<br><table class="tableinfo" width="100%">
	<tr id="trdark0">
		<td align="center"><font size="medium"><b>Instruccion de Pago</b></font>
			<A href="javascript:getClausula('99A','11','<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0565')">
  			<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>
		</td>
	</tr>
	<tr>
		<td nowrap align="center" height="153">
		<div style="height:220px; overflow-y: scroll">
		<input type="text" name="E01PMTI01" size="70" maxlength="50"
			value="<%= msg01.getE01PMTI01().trim()%>"><br>
		<input type="text" name="E01PMTI02" size="70" maxlength="50"
			value="<%= msg01.getE01PMTI02().trim()%>"><br>
		<input type="text" name="E01PMTI03" size="70" maxlength="50"
			value="<%= msg01.getE01PMTI03().trim()%>"><br>
		<input type="text" name="E01PMTI04" size="70" maxlength="50"
			value="<%= msg01.getE01PMTI04().trim()%>"><br>
		<input type="text" name="E01PMTI05" size="70" maxlength="50"
			value="<%= msg01.getE01PMTI05().trim()%>"><br>
		<input type="text" name="E01PMTI06" size="70" maxlength="50"
			value="<%= msg01.getE01PMTI06().trim()%>"><br>
		</div>
		</td>
	</tr>
</table>
<br>
<table class="tableinfo" width="100%">
	<tr id="trdark00">
		<td align="center"><font size="medium"><b>Discrepancias</b></font></td>
	</tr>
	<tr>
		<td nowrap align="center">
		<div style="height:220px; overflow-y: scroll">
		<input type="text" name="E01DISC01" size="70" maxlength="50"
			value="<%= msg01.getE01DISC01().trim()%>"><br>
		<input type="text" name="E01DISC02" size="70" maxlength="50"
			value="<%= msg01.getE01DISC02().trim()%>"><br>
		<input type="text" name="E01DISC03" size="70" maxlength="50"
			value="<%= msg01.getE01DISC03().trim()%>"><br>
		<input type="text" name="E01DISC04" size="70" maxlength="50"
			value="<%= msg01.getE01DISC04().trim()%>"><br>
		<input type="text" name="E01DISC05" size="70" maxlength="50"
			value="<%= msg01.getE01DISC05().trim()%>"><br>
		<input type="text" name="E01DISC06" size="70" maxlength="50"
			value="<%= msg01.getE01DISC06().trim()%>"><br>
		<input type="text" name="E01DISC07" size="70" maxlength="50"
			value="<%= msg01.getE01DISC07().trim()%>"><br>
		<input type="text" name="E01DISC08" size="70" maxlength="50"
			value="<%= msg01.getE01DISC08().trim()%>"><br>
		<input type="text" name="E01DISC09" size="70" maxlength="50"
			value="<%= msg01.getE01DISC09().trim()%>"><br>
		<input type="text" name="E01DISC010" size="70" maxlength="50"
			value="<%= msg01.getE01DISC10().trim()%>"><br>
		</div>
		</td>
	</tr>
</table>
<br>
<table class="tableinfo" width="100%">
	<tr id="trdark1">
		<td align="center"><font size="medium"><b>Instrcciones Especiales</b></font></td>
	</tr>
	<tr>
		<td nowrap align="center" height="134">
		<div style="height:220px; overflow-y: scroll"><input type="text"
			name="E01SPIN01" size="70" maxlength="50"
			value="<%= msg01.getE01SPIN01().trim()%>"><br>
		<input type="text" name="E01SPIN02" size="70" maxlength="50"
			value="<%= msg01.getE01SPIN02().trim()%>"><br>
		<input type="text" name="E01SPIN03" size="70" maxlength="50"
			value="<%= msg01.getE01SPIN03().trim()%>"><br>
		<input type="text" name="E01SPIN04" size="70" maxlength="50"
			value="<%= msg01.getE01SPIN04().trim()%>"><br>
		<input type="text" name="E01SPIN05" size="70" maxlength="50"
			value="<%= msg01.getE01SPIN05().trim()%>"><br>
		<input type="text" name="E01SPIN06" size="70" maxlength="50"
			value="<%= msg01.getE01SPIN06().trim()%>"><br>
		</div>
		</td>
	</tr>
</table><br><TABLE width="70%" border="0" class="tableinfo">
  <TR id="trdark">
		<TD colspan="6" align="center"><B><FONT size="medium">Documentos Recibidos</FONT>
		</B></TD>
	</TR>
  <TR id="trclear">
    <TD align="center">
    <TABLE border="0" class="tableinfo">
    <TR align="center">
    <TD width="8%" align="center"></TD>
		<TD align="center" width="320"></TD>
		<TD colspan="2" align="center">Requeridos</TD><TD colspan="2" align="center">Recibidos</TD></TR>
	<TR align="center">
		<TD align="center">Cod. Documento</TD>
		<TD align="center" width="320">Descripcion</TD>
		<TD align="center" width="84">Originales</TD>
		<TD align="center" width="85">Copias</TD>
		<TD align="center" width="82">Originales</TD>
		<TD align="center" width="85">Copias</TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD1" value="<%=msg01.getE01LCMDD1()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS1" value="<%=msg01.getE01LCMDS1()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO1" value="<%=msg01.getE01LCMDO1()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC1" value="<%=msg01.getE01LCMDC1()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO1" value="<%=msg01.getE01RCVDO1()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC1" value="<%=msg01.getE01RCVDC1()%>" size="2" maxlength="1"></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD2" value="<%=msg01.getE01LCMDD2()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS2" value="<%=msg01.getE01LCMDS2()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO2" value="<%=msg01.getE01LCMDO2()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC2" value="<%=msg01.getE01LCMDC2()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO2" value="<%=msg01.getE01RCVDO2()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC2" value="<%=msg01.getE01RCVDC2()%>" size="2" maxlength="1"></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD3" value="<%=msg01.getE01LCMDD3()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS3" value="<%=msg01.getE01LCMDS3()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO3" value="<%=msg01.getE01LCMDO3()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC3" value="<%=msg01.getE01LCMDC3()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO3" value="<%=msg01.getE01RCVDO3()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC3" value="<%=msg01.getE01RCVDC3()%>" size="2" maxlength="1"></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD4" value="<%=msg01.getE01LCMDD4()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS4" value="<%=msg01.getE01LCMDS4()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO4" value="<%=msg01.getE01LCMDO4()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC4" value="<%=msg01.getE01LCMDC4()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO4" value="<%=msg01.getE01RCVDO4()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC4" value="<%=msg01.getE01RCVDC4()%>" size="2" maxlength="1"></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD5" value="<%=msg01.getE01LCMDD5()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS5" value="<%=msg01.getE01LCMDS5()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO5" value="<%=msg01.getE01LCMDO5()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC5" value="<%=msg01.getE01LCMDC5()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO5" value="<%=msg01.getE01RCVDO5()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC5" value="<%=msg01.getE01RCVDC5()%>" size="2" maxlength="1"></TD>
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD6" value="<%=msg01.getE01LCMDD6()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS6" value="<%=msg01.getE01LCMDS6()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO6" value="<%=msg01.getE01LCMDO6()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC6" value="<%=msg01.getE01LCMDC6()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO6" value="<%=msg01.getE01RCVDO6()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC6" value="<%=msg01.getE01RCVDC6()%>" size="2" maxlength="1"></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD7" value="<%=msg01.getE01LCMDD7()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS7" value="<%=msg01.getE01LCMDS7()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO7" value="<%=msg01.getE01LCMDO7()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC7" value="<%=msg01.getE01LCMDC7()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO7" value="<%=msg01.getE01RCVDO7()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC7" value="<%=msg01.getE01RCVDC7()%>" size="2" maxlength="1"></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD8" value="<%=msg01.getE01LCMDD8()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS8" value="<%=msg01.getE01LCMDS8()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO8" value="<%=msg01.getE01LCMDO8()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC8" value="<%=msg01.getE01LCMDC8()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO8" value="<%=msg01.getE01RCVDO8()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC8" value="<%=msg01.getE01RCVDC8()%>" size="2" maxlength="1"></TD>	  
	</TR>
	<TR align="center">
      <TD align="center"><INPUT type="text" name="E01LCMDD9" value="<%=msg01.getE01LCMDD9()%>" size="4" maxlength="5" readonly></TD>
	  <TD align="center" width="320"><INPUT type="text" name="E01LCMDS9" value="<%=msg01.getE01LCMDS9()%>" size="35" maxlength="35" readonly></TD>
	  <TD align="center" width="84"><INPUT type="text" name="E01LCMDO9" value="<%=msg01.getE01LCMDO9()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01LCMDC9" value="<%=msg01.getE01LCMDC9()%>" size="2" maxlength="1" readonly></TD>
	  <TD align="center" width="82"><INPUT type="text" name="E01RCVDO9" value="<%=msg01.getE01RCVDO9()%>" size="2" maxlength="1"></TD>
	  <TD align="center" width="85"><INPUT type="text" name="E01RCVDC9" value="<%=msg01.getE01RCVDC9()%>" size="2" maxlength="1"></TD>	  
	</TR>
	</TABLE>
	</TD>
	</TR>					
</TABLE>
<br>
<DIV align="center">
    <INPUT id="EIBSBTN" type=button name="Update" value="Actualizar" onclick="goAction('5')">
    <INPUT id="EIBSBTN" type=button name="Print" value="Imprimir" onclick="goAction('25')">
</DIV>
    
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
