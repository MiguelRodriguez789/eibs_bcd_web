<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<HTML>
<HEAD>
<TITLE>Reversion de Prestamos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnRever" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
	function checkTotals() {
		if (document.forms[0].TOTDEB.value == document.forms[0].TOTCRD.value) return true; 
		else {
			alert("No se puede reversar por diferencias entre Débitos y Créditos");
			return false;
		}
	}

	function selectAll(obj) {
		var e = document.forms[0].elements;
		for (i = 0; i < e.length; i++) {
			if (e[i].name.indexOf('TRANSROW_') == 0) {
				 e[i].checked = obj.checked;
			}
		}
	}
		
	function goAction(op) {
		document.forms[0].SCREEN.value = op;
		document.forms[0].submit();
	}
	
</script>
</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
		 error.setERRNUM("0");
		 out.println("<SCRIPT Language=\"Javascript\">");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
 }

%> 
<h3 align="center">Reversi&oacute;n de Pr&eacute;stamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_reversal.jsp,EDL1300">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL1300" onsubmit="return(checkTotals())">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
	<INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="lastRec" VALUE="<%= lnRever.getLastRec() %>">
	<INPUT TYPE=HIDDEN NAME="OPT" VALUE="1">
<%
	if ( lnRever.getNoResult() ) {
%> 
	<TABLE class="tbenter" width=100% height=40%>
		<TR>
			<TD> 
				<div align="center">           
					<p>&nbsp;</p>
					<p><b>El pr&eacute;stamo seleccionado no posee transacciones asignadas</b></p>
				</div>
			</TD>
		 </TR>
	 </TABLE>
<%   
	} else {
		lnRever.initRow();
		lnRever.setCurrentRow(0);
		datapro.eibs.beans.EDL130001Message msgLoan = (datapro.eibs.beans.EDL130001Message) lnRever.getRecord();    	
%> 
	<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
	<table class=tableinfo>
		<tr>
			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr id=trdark>
						<td align=right nowrap>Pr&eacute;stamo : </td>
						<td>       
							<input size="17" type="text" name="E01DEAACC" readonly value="<%= msgLoan.getE01DEAACC()%>">
						</td>
						<td align=right nowrap>Cliente : </td>
						<td>
							<input size="45" type="text" name="E01CUSNA1" readonly value="<%= msgLoan.getE01CUSNA1()%>">
				 		</td>
						<td align=right nowrap>Referencia : </td>
						<td>
							<input size="12" type="text" name="E01TRAACR" maxlength="5" value="<%=msgLoan.getE01TRAACR()%>" readonly>
						</td>
					</tr>
					<tr id=trdark>
						<td align=right nowrap>Lote : </td>
						<td>
							<input size="6" type="text" name="E01TRABTH" maxlength="5" value="<%=msgLoan.getE01TRABTH()%>" readonly>
						</td>
						<td align=right nowrap>Fecha Valor Reversi&oacute;n : </td>
						<td>
							<% if (currUser.getE01DTF().equals("DMY")){ %>
							<input size="3" type="text" name="E01TRAVDD" maxlength="2" value="<%=msgLoan.getE01TRAVDD()%>" readonly>
							<input size="3" type="text" name="E01TRAVDM" maxlength="2" value="<%=msgLoan.getE01TRAVDM()%>" readonly>
							<input size="5" type="text" name="E01TRAVDY" maxlength="4" value="<%=msgLoan.getE01TRAVDY()%>" readonly>
							<% } else if(currUser.getE01DTF().equals("MDY")){ %>
							<input size="3" type="text" name="E01TRAVDM" maxlength="2" value="<%=msgLoan.getE01TRAVDM()%>" readonly>
							<input size="3" type="text" name="E01TRAVDD" maxlength="2" value="<%=msgLoan.getE01TRAVDD()%>" readonly>
							<input size="5" type="text" name="E01TRAVDY" maxlength="4" value="<%=msgLoan.getE01TRAVDY()%>" readonly>
							<% } else {  %>
							<input size="5" type="text" name="E01TRAVDY" maxlength="4" value="<%=msgLoan.getE01TRAVDY()%>" readonly>
							<input size="3" type="text" name="E01TRAVDM" maxlength="2" value="<%=msgLoan.getE01TRAVDM()%>" readonly>
							<input size="3" type="text" name="E01TRAVDD" maxlength="2" value="<%=msgLoan.getE01TRAVDD()%>" readonly>
							<% } %>
						</td>    		
						<td></td>
						<td></td>
						<%--
						<td align=right nowrap>Fecha Proceso :</td>
						<td>
							<% if (currUser.getE01DTF().equals("DMY")){ %>
							<input size="3" type="text" name="E01TRABDD" maxlength="2" value="<%=msgLoan.getE01TRABDD()%>" readonly>
							<input size="3" type="text" name="E01TRABDM" maxlength="2" value="<%=msgLoan.getE01TRABDM()%>" readonly>
							<input size="5" type="text" name="E01TRABDY" maxlength="4" value="<%=msgLoan.getE01TRABDY()%>" readonly>
							<% } else if(currUser.getE01DTF().equals("MDY")){ %>
							<input size="3" type="text" name="E01TRABDM" maxlength="2" value="<%=msgLoan.getE01TRABDM()%>" readonly>
							<input size="3" type="text" name="E01TRABDD" maxlength="2" value="<%=msgLoan.getE01TRABDD()%>" readonly>
							<input size="5" type="text" name="E01TRABDY" maxlength="4" value="<%=msgLoan.getE01TRABDY()%>" readonly>
							<% } else {  %>
							<input size="5" type="text" name="E01TRABDY" maxlength="4" value="<%=msgLoan.getE01TRABDY()%>" readonly>
							<input size="3" type="text" name="E01TRABDM" maxlength="2" value="<%=msgLoan.getE01TRABDM()%>" readonly>
							<input size="3" type="text" name="E01TRABDD" maxlength="2" value="<%=msgLoan.getE01TRABDD()%>" readonly>
							<% } %>
						</td>
						--%>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<TABLE class="tbenter">
		<TR>
			<TD ALIGN=CENTER class="TDBKG" width="33%">
				<a href="javascript:goAction('1')">Enviar</a>
			</TD>      
			<TD ALIGN=CENTER class="TDBKG" width="33%">
				<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
			</TD>
		</TR>
	</TABLE>
	
	<% if(error.getERWRNG().equals("Y")){%>
		<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(msgLoan.getH01FLGWK2().equals("A")){ out.print("checked");} %> >Aceptar con Aviso</h4>
	<% } %> 		
	<BR>
	
	<TABLE  id="mainTable" class="tableinfo">
		<TR> 
			<TD NOWRAP >
				<TABLE id="headTable" width="100%">
					<TR id="trdark"> 
						<Th ALIGN=CENTER nowrap>Sel<BR>
							<input type="checkbox"  name="select_all" value="" onClick="selectAll(this)">
						</Th>
						<Th ALIGN=CENTER NOWRAP>BCO</Th>
						<Th ALIGN=CENTER NOWRAP>SUC</Th>
						<Th ALIGN=CENTER NOWRAP>MDA</Th>
						<Th ALIGN=CENTER NOWRAP>Contabilidad</Th>
						<Th ALIGN=CENTER NOWRAP>Cuenta</Th>
						<Th ALIGN=CENTER NOWRAP>COD</Th>
						<Th ALIGN=CENTER NOWRAP>Descripcion</Th>
						<Th ALIGN=CENTER NOWRAP><br>Monto<br>Total</Th>
						<Th ALIGN=CENTER NOWRAP>D/C</Th>
						<Th ALIGN=CENTER NOWRAP><br>Monto<br>Parcial</Th>
					</TR>
		<%
				lnRever.initRow();
				java.math.BigDecimal totDebit = new java.math.BigDecimal("0.00");
				java.math.BigDecimal totCredit = new java.math.BigDecimal("0.00");
				while (lnRever.getNextRow()) { 
					msgLoan = (datapro.eibs.beans.EDL130001Message) lnRever.getRecord(); 
		%>
					<TR id="trclear"> 
						<td align="center" nowrap> 
							<input type="checkbox" name="TRANSROW_<%= lnRever.getCurrentRow() %>" value="<%= lnRever.getCurrentRow() %>" >        	
							<input type="hidden" name="E01TRABNK_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRABNK()%>" >
							<input type="hidden" name="E01TRAVDM_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAVDM()%>" >
							<input type="hidden" name="E01TRAVDD_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAVDD()%>" >
							<input type="hidden" name="E01TRAVDY_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAVDY()%>" >
							<input type="hidden" name="E01TRAACR_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAACR()%>" >
							<input type="hidden" name="E01TRAMOD_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAMOD()%>" >
							<input type="hidden" name="E01TRAPMN_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAPMN()%>" >
							<input type="hidden" name="E01TRAAPC_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAAPC()%>" >
							<input type="hidden" name="E01TRADED_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRADED()%>" >
							<input type="hidden" name="E01TRADSQ_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRADSQ()%>" >
							<input type="hidden" name="E01TRAIVP_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAIVP()%>" >
							<input type="hidden" name="E01TRAIVB_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAIVB()%>" >
							<input type="hidden" name="E01TRACOD_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRACOD()%>" >
							<input type="hidden" name="E01TRAEXR_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAEXR()%>" >
							<input type="hidden" name="E01TRACCN_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRACCN()%>" >
						</td>
						<td NOWRAP align="center"><input type="hidden" name="E01TRABNK_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRABNK()%>" ><%=Util.formatCell(msgLoan.getE01TRABNK())%></td>
						<td NOWRAP align="center"><input type="hidden" name="E01TRABRN_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRABRN()%>" ><%=Util.formatCell(msgLoan.getE01TRABRN())%></td>
						<td NOWRAP align="center"><input type="hidden" name="E01TRACCY_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRACCY()%>" ><%=Util.formatCell(msgLoan.getE01TRACCY())%></td>
						<td NOWRAP align="center"><input type="hidden" name="E01TRAGLN_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAGLN()%>" ><%=Util.formatCell(msgLoan.getE01TRAGLN())%></td>
						<td NOWRAP align="center"><input type="hidden" name="E01TRAACC_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAACC()%>" ><%=Util.formatCell(msgLoan.getE01TRAACC())%></td>
						<td NOWRAP align="center"><input type="hidden" name="E01TRACDE_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRACDE()%>" ><%=Util.formatCell(msgLoan.getE01TRACDE())%></td>
						<td NOWRAP align="left"  ><input type="hidden" name="E01TRANAR_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRANAR()%>" ><%=Util.formatCell(msgLoan.getE01TRANAR())%></td>
						<td NOWRAP align="right" ><input type="hidden" name="E01TRAAMT_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRAAMT()%>" ><%=Util.formatCell(msgLoan.getE01TRAAMT())%></td>
						<td NOWRAP align="center"><input type="hidden" name="E01TRADCC_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01TRADCC()%>" ><%=Util.formatCell(msgLoan.getE01TRADCC())%></td>
						<td NOWRAP align="center"><input type="text"   name="E01NEWAMT_<%= lnRever.getCurrentRow() %>"  value="<%= msgLoan.getE01NEWAMT().trim()%>" onKeypress="enterDecimal(event, 2)"></td>
					</TR>    		 
		<%
					if (msgLoan.getE01TRADCC().equals("D")) totDebit=totDebit.add(msgLoan.getBigDecimalE01TRAAMT());
					else totCredit = totCredit.add(msgLoan.getBigDecimalE01TRAAMT());  
				}
		%> 
				</TABLE>
			</TD>
		</TR>	
	</TABLE>

	<h4>Totales</h4>
	<TABLE class="tableinfo">
		<TR> 
			<TD NOWRAP >
				<TABLE width="100%">
					<TR id="trdark"> 
						<Td ALIGN=CENTER NOWRAP>Nro. Trans : <%= lnRever.getLastRec() + 1 %></Td>
						<Td ALIGN=CENTER NOWRAP>D&eacute;bitos : <b><%=Util.fcolorCCY(totDebit.toString())%></b><input id="TOTDEB" type=hidden value="<%=totDebit.toString()%>"></Td>
						<Td ALIGN=CENTER NOWRAP>Cr&eacute;ditos : <b><%=Util.fcolorCCY(totCredit.toString())%></b><input id="TOTCRD" type=hidden value="<%=totCredit.toString()%>"></Td>
					</TR>
				</TABLE>
			</TD>
		</TR>	
	</TABLE>

	<%
	}
	%> 
	
	
</FORM>
 
</BODY>
</HTML>
