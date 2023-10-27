<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page
	import="datapro.eibs.master.Util,datapro.eibs.beans.ECO106602Message"%>

<HTML>
<HEAD>
<TITLE>Lista de Adhesivos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="mtList" class="datapro.eibs.beans.JBObjList"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />

<SCRIPT type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function goAction(opt) {
	if (opt == "M") { 
		var row = getElement("CURRENTROW").value;   
    	page = "<%=request.getContextPath()%>/pages/s/ECO1066_value_paper_maint.jsp?ROW=" + row;
  		CenterNamedWindow(page,'Modification',550,300,2);
  	}
  }
</SCRIPT>

</HEAD>
<BODY>

<%
	String chk = "";

	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors();");
		out.println("</SCRIPT>");
	}
%>

<h3 align="center">Lista de Adhesivos <img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="value_paper_agent_mov_list.jsp,ECO1066"></h3>
<hr size="4">
<FORM Method="post"
	Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1066">

<%
	if (mtList.getNoResult()) {
%>
<TABLE class="tbenter" width=100% height=40%>
	<TR>
		<TD>
		<div align="center">
		<p><b>No hay movimientos de Adhesivos para su seleccion</b></p>
		</div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%> <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> <INPUT
	TYPE=HIDDEN NAME="SCREEN" VALUE="400">

<TABLE class="tbenter" width="60%" align=center>
	<TR>
		<TD class=TDBKG width="50%">
		<div align="center"><a href="javascript:goAction('M')">Modificar</a>
		</div>
		</TD>
		<TD class=TDBKG width="50%">
		<div align="center"><a href="javascript:checkClose()">Salir</a>
		</div>
		</TD>
	</TR>
</TABLE>

<TABLE id="mainTable" class="tableinfo" style="height: 400px;">
	<tr height="5%">
		<td NOWRAP valign="top" width="100%">
		<table id="headTable" width="100%">
			<tr id="trdark">
				<TH ALIGN=CENTER width="3%">&nbsp;</TH>
				<TH ALIGN=CENTER width="5%">Banco</TH>
				<TH ALIGN=CENTER width="5%">Ofic.</TH>
				<TH ALIGN=CENTER width="5%">Cajero<BR>Solic.</TH>
				<TH ALIGN=CENTER width="5%">Tipo<BR>Papel<BR>Valor</TH>
				<TH ALIGN=CENTER width="11%">Descripcion Tipo</TH>
				<TH ALIGN=CENTER width="5%">Subtipo<BR>Papel<BR>Valor</TH>
				<TH ALIGN=CENTER width="12%">Descripcion Subtipo</TH>
				<TH ALIGN=CENTER width="5%">Serial</TH>
				<TH ALIGN=CENTER width=9%">Fecha</TH>
				<TH ALIGN=CENTER width="5%">Tipo de<BR>Movimiento</TH>
				<TH ALIGN=CENTER width="5%">Doc.<BR>Inicial</TH>
				<TH ALIGN=CENTER width="5%">Doc.<BR>Final</TH>
				<TH ALIGN=CENTER width="5%">Cantidad</TH>
				<TH ALIGN=CENTER width="5%">Oficina<BR>Recibe</TH>
				<TH ALIGN=CENTER width="5%">Asesor<BR>Recibe</TH>
			</tr>
		</table>
		</td>
	</tr>
	<tr height="95%">
		<td nowrap="nowrap">
		<div id="dataDiv1" style="height: 400px; overflow: auto;">
		<table id="dataTable" cellspacing="0" cellpadding="1" border="0"
			width="100%">
			<%
				mtList.initRow();
					while (mtList.getNextRow()) {
						ECO106602Message msgMT = (ECO106602Message) mtList
								.getRecord();
			%>
			<TR>
				<td NOWRAP  align=CENTER width="3%"><input type="radio" name="ROW" value="<%= mtList.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtList.getCurrentRow() %>)" ></td>			
				<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01ADHBNK())%></TD>
				<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01ADHBRN())%></TD>
				<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01ADHCSN())%></TD>
				<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01ADHTIP())%></TD>
				<TD NOWRAP ALIGN="LEFT" width="11%"><%=Util.formatCell(msgMT.getE01ADHTIN())%></TD>
				<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01ADHSUB())%></TD>
				<TD NOWRAP ALIGN="LEFT" width="12%"><%=Util.formatCell(msgMT.getE01ADHSUN())%></TD>
				<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01ADHSER())%></TD>
				<TD NOWRAP ALIGN="CENTER" width="9%">
				<%
					//= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),msgMT.getBigDecimalE01ADHCDM().intValue(),msgMT.getBigDecimalE01ADHCDD().intValue(),msgMT.getBigDecimalE01ADHCDY().intValue())
				%>
				</TD>
				<TD NOWRAP ALIGN="CENTER" width="5%">
				<%
					//=Util.formatCell(msgMT.getE01ADHOPN())
				%>
				</TD>
				<TD NOWRAP ALIGN="CENTER" width="5%">
				<%
					//=Util.formatCell(msgMT.getE01ADHINI())
				%>
				</TD>
				<TD NOWRAP ALIGN="CENTER" width="5%">
				<%
					//=Util.formatCell(msgMT.getE01ADHFIN())
				%>
				</TD>
				<TD NOWRAP ALIGN="CENTER" width="5%">
				<%
					//=Util.formatCell(msgMT.getE01ADHQTY())
				%>
				</TD>
				<TD NOWRAP ALIGN="CENTER" width="5%">
				<%
					//=Util.formatCell(msgMT.getE01ADHRBR())
				%>
				</TD>
				<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01ADHUSR())%></TD>
			</TR>
			<%
				}
			%>
		</table>
		</div>
		</td>
	</tr>
</table>

<SCRIPT type="text/javascript">
  showChecked("ROW");       
</SCRIPT>

<%
	}
%>
</FORM>
</BODY>
</HTML>
