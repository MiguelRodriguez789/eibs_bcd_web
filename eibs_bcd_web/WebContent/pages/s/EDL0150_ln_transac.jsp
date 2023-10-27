<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util" %>

<html>
<head>
<title>Transacciones de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "lnTransac" class= "datapro.eibs.beans.EDL015203Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">

function UpdateField(bfield,trfield,afield,sfield,rep){
	var trval;
	var bfval;
	var afval=0.00;
	try{
		trval= parseFloat((document.forms[0][trfield].value));
		if (isNaN(trval)) trval=0.00;}
	catch(e){
		trval=0.00;
	}
	try{
		if (rep) bfval=parseFloat((document.forms[0][afield].value));
		else bfval=parseFloat((document.forms[0][bfield].value));}
	catch(e){
		bfval=0.00;
	}
	if (document.forms[0][sfield].value=="0") afval=bfval+trval;
	else if (document.forms[0][sfield].value=="5") afval=bfval-trval;
	else afval=bfval;
	document.forms[0][afield].value = formatCCY(afval);
} 

function Recalculate(){
	UpdateField('E03DEAPRI','E03TRNPRI','AFTERPRI','E03TRNPRF',false);
	<% if(lnTransac.getH03FLGWK3().equals("R")){%>
	UpdateField('E03DEAREA','E03TRNREA','AFTERREA','E03TRNREF',false);
	<% } %>
	UpdateField('E03DEAINT','E03TRNINT','AFTERINT','E03TRNINF',false);
	UpdateField('E03DEAINT','E03TRNAIN','AFTERINT','E03TRNAIF',true);
	UpdateField('E03DEAMOR','E03TRNMOR','AFTERMOR','E03TRNMOF',false);
	UpdateField('E03DEAMOR','E03TRNAMO','AFTERMOR','E03TRNAMF',true);
	UpdateTotal();
}
 
function updateCheck(check,val) {
	getElement(check).value = (val) ? "Y" : "";
}
 
function changeField(radio){
	var numval;
	var total;
	var newval; 
	if (!document.forms[0][radio][0].checked && !document.forms[0][radio][1].checked) {
		return;
	}
	Recalculate();     
}
	
function verifyNum(elem){
	if (trim(elem.value)=="") elem.value="0.00";
}
	
function UpdateTotal(){
	var total;  
	try{
		total= parseFloat((document.forms[0].AFTERPRI.value));}
	catch(e){
		total=0.00;
	}
	try{
		total=total+parseFloat((document.forms[0].AFTERINT.value));}
	catch(e){
	}
	try{
		total=total+parseFloat((document.forms[0].AFTERMOR.value));}
	catch(e){
	}
	document.forms[0].AFTERTOT.value=formatCCY(total);
}

</SCRIPT>

<SCRIPT type="text/javascript">
	builtNewMenu(ln_t_m_opt);
	initMenu();
</SCRIPT>

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

<h3 align="center">Transacciones de Pr&eacute;stamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_transac.jsp, EDL0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0152">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
	<INPUT TYPE=HIDDEN NAME="E03DEABNK" VALUE="<%= lnTransac.getE03DEABNK().trim()%>">
		<%
		String subi="";
		for (int k=1;k<=9;k++) {
		subi=""+k;
		%> 
		<input type=hidden name="E03DLSTYP<%= subi%>" value="<%= lnTransac.getField("E03DLSTYP"+subi).getString().trim()%>">
		<input type=hidden name="E03DLSCDE<%= subi%>" value="<%= lnTransac.getField("E03DLSCDE"+subi).getString().trim()%>">
		<input type=hidden name="E03DLSSEQ<%= subi%>" value="<%= lnTransac.getField("E03DLSSEQ"+subi).getString().trim()%>">
		<%
		}
		%> 
	
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="16%" > 
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="20%" > 
							<div align="left"> 
								<input type="text" name="E03DEACUN" size="10" maxlength="9" value="<%= lnTransac.getE03DEACUN().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="16%" > 
							<div align="right"><b>Nombre :</b> </div>
						</td>
						<td nowrap colspan="3" > 
							<div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
								<input type="text" name="E03CUSNA1" size="45" maxlength="45" value="<%= lnTransac.getE03CUSNA1().trim()%>" readonly>
								</font></font></font></div>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="16%"> 
							<div align="right"><b>Cuenta :</b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left"> 
								<input type="text" name="E03DEAACC" size="13" maxlength="12" value="<%= lnTransac.getE03DEAACC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="16%"> 
							<div align="right"><b>Moneda : </b></div>
						</td>
						<td nowrap width="16%"> 
							<div align="left"><b> 
								<input type="text" name="E03DEACCY" size="3" maxlength="3" value="<%= lnTransac.getE03DEACCY().trim()%>" readonly>
								</b> </div>
						</td>
						<td nowrap width="16%"> 
							<div align="right"><b>Producto : </b></div>
						</td>
						<td nowrap width="16%"> 
							<div align="left"><b> 
								<input type="text" name="E03DEAPRO" size="4" maxlength="4" value="<%= lnTransac.getE03DEAPRO().trim()%>" readonly>
								</b> </div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Informaci&oacute;n Financiera</h4>

	<%int row = 0; %>
	<TABLE class="tableinfo" >
		<TBODY>
				<TR> 
					<TD nowrap> 
						<TABLE cellspacing="2" cellpadding="2" width="100%" border="0">
							<TBODY>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<TD nowrap width="20%" > 
										<DIV align="center"></DIV>
									</TD>
									<TD nowrap width="40%" > 
										<DIV align="center"><B>Antes</B></DIV>
									</TD>
									<TD nowrap width="40%" > 
										<DIV align="center"><B>Despu�s</B></DIV>
									</TD>
								</TR>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<TD nowrap > 
										<DIV align="right">Saldo de Principal :</DIV>
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="E03DEAPRI" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEAPRI())%>" onkeypress="enterDecimal(event, 2)">
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="AFTERPRI" size="15" maxlength="13" value="" onkeypress="enterDecimal(event, 2)">
									</TD>
								</TR>
								<% if(lnTransac.getH03FLGWK3().equals("R")){%>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<TD nowrap > 
										<div align="right">Valor Ajustado :</div>
									</TD>
									<TD nowrap align="center"> 
										<input class="txtright" type="text" name="E03DEAREA" size="15" maxlength="15" value="<%= lnTransac.getE03DEAREA().trim()%>" onKeypress="enterDecimal(event, 2)">
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="AFTERREA" size="15" maxlength="13" value="" onkeypress="enterDecimal(event, 2)">
									</TD>
								</TR>
								<%}%>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<TD nowrap > 
										<DIV align="right">Saldo de Inter&eacute;s :</DIV>
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="E03DEAINT" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEAINT())%>" onkeypress="enterDecimal(event, 2)">
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="AFTERINT" size="15" maxlength="13" value="" onkeypress="enterDecimal(event, 2)">
									</TD>
								</TR>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<TD nowrap > 
										<DIV align="right">Cargo por Mora :</DIV>
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="E03DEAMOR" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEAMOR())%>" onkeypress="enterDecimal(event, 2)">
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="AFTERMOR" size="15" maxlength="13" value="" onkeypress="enterDecimal(event, 2)">
									</TD>
								</TR>
								
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<TD nowrap > 
										<DIV align="right">Total :</DIV>
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="E03DEATOT" size="15" maxlength="13" value="<%= Util.formatCCY(lnTransac.getE03DEATOT())%>" onkeypress="enterDecimal(event, 2)">
									</TD>
									<TD nowrap align="center"> 
										<INPUT class="txtright" type="text" readonly name="AFTERTOT" size="15" maxlength="13" value="" onkeypress="enterDecimal(event, 2)">
									</TD>
								</TR>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<TD nowrap colspan="3"> 
										<DIV align="center">Fecha de Ultimo C&aacute;lculo : 
											<eibsinput:date name="lnTransac"  fn_month="E03DEALCM" fn_day="E03DEALCD" fn_year="E03DEALCY" /> 
										</DIV>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
		</TBODY>
	</TABLE>

	<h4>Datos de la Transacci&oacute;n</h4>
	<table class="tableinfo" >
		<tr > 
			<td> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="trdark"> 
						<td width="40%"> 
							<div align="right">Principal :</div>
						</td>
						<td width="60%"> 
							<input type="text" name="E03TRNPRI" size="15" maxlength="15" value="<%= lnTransac.getE03TRNPRI().trim()%>" onKeypress="enterDecimal(event, 2)" onChange="changeField('CE03TRNPFL')" onblur="verifyNum(this)">
							<input type="hidden" name="E03TRNPRF" value="<%= lnTransac.getE03TRNPRF()%>">
							<input type="radio" name="CE03TRNPFL" value="0" onClick="document.forms[0].E03TRNPRF.value='0';Recalculate();" <%if(lnTransac.getE03TRNPRF().equals("0")) out.print("checked");%>> Aumento 
							<input type="radio" name="CE03TRNPFL" value="5" onClick="document.forms[0].E03TRNPRF.value='5';Recalculate();" <%if(lnTransac.getE03TRNPRF().equals("5")) out.print("checked");%>> Disminuci&oacute;n
						</td>
					</tr>
					<% if(lnTransac.getH03FLGWK3().equals("R")){%>
					<tr id="trclear"> 
						<td width="40%"> 
							<div align="right">Reajuste :</div>
						</td>
						<td width="60%"> 
							<input type="text" name="E03TRNREA" size="15" maxlength="15" value="<%= lnTransac.getE03TRNREA().trim()%>" onKeypress="enterDecimal(event, 2)" onChange="changeField('CE03TRNREF')" onblur="verifyNum(this)">
							<input type="hidden" name="E03TRNREF" value="<%= lnTransac.getE03TRNREF()%>">
							<input type="radio" name="CE03TRNREF" value="0" onClick="document.forms[0].E03TRNREF.value='0';Recalculate();" <%if(lnTransac.getE03TRNREF().equals("0")) out.print("checked");%>> Aumento 
							<input type="radio" name="CE03TRNREF" value="5" onClick="document.forms[0].E03TRNREF.value='5';Recalculate();" <%if(lnTransac.getE03TRNREF().equals("5")) out.print("checked");%>> Disminuci&oacute;n 
						</td>
					</tr>
					<%}%>
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trdark"); else out.print("trclear"); %>"> 
						<td width="40%" height="27"> 
							<div align="right">Intereses :</div>
						</td>
						<td width="60%" height="27"> 
							<input type="text" name="E03TRNINT" size="15" maxlength="15" value="<%= lnTransac.getE03TRNINT().trim()%>" onKeypress="enterDecimal(event, 2)" onChange="changeField('CE03TRNINF')" onblur="verifyNum(this)">
							<input type="hidden" name="E03TRNINF" value="<%= lnTransac.getE03TRNINF()%>">
							<input type="radio" name="CE03TRNINF" value="0" onClick="document.forms[0].E03TRNINF.value='0';Recalculate();" <%if(lnTransac.getE03TRNINF().equals("0")) out.print("checked");%>> Reversar 
							<input type="radio" name="CE03TRNINF" value="5" onClick="document.forms[0].E03TRNINF.value='5';Recalculate();" <%if(lnTransac.getE03TRNINF().equals("5")) out.print("checked");%>> Pago 
						</td>
					</tr>
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trclear"); else out.print("trdark"); %>">  
						<td width="40%"> 
							<div align="right">Mora :</div>
						</td>
						<td width="60%"> 
							<input type="text" name="E03TRNMOR" size="15" maxlength="15" value="<%= lnTransac.getE03TRNMOR().trim()%>" onKeypress="enterDecimal(event, 2)" onChange="changeField('CE03TRNMOF')" onblur="verifyNum(this)">
							<input type="hidden" name="E03TRNMOF" value="<%= lnTransac.getE03TRNMOF()%>">
							<input type="radio" name="CE03TRNMOF" value="0" onClick="document.forms[0].E03TRNMOF.value='0';Recalculate();" <%if(lnTransac.getE03TRNMOF().equals("0")) out.print("checked");%>> Reversar 
							<input type="radio" name="CE03TRNMOF" value="5" onClick="document.forms[0].E03TRNMOF.value='5';Recalculate();" <%if(lnTransac.getE03TRNMOF().equals("5")) out.print("checked");%>> Pago
						</td>
					</tr>
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trdark"); else out.print("trclear"); %>"> 
						<td width="40%"> 
							<div align="right">Ajuste de Intereses :</div>
						</td>
						<td width="60%"> 
							<input type="text" name="E03TRNAIN" size="15" maxlength="15" value="<%= lnTransac.getE03TRNAIN().trim()%>" onKeypress="enterDecimal(event, 2)" onChange="changeField('CE03TRNAIF')" onblur="verifyNum(this)">
							<input type="hidden" name="E03TRNAIF" value="<%= lnTransac.getE03TRNAIF()%>">
							<input type="radio" name="CE03TRNAIF" value="0" onClick="document.forms[0].E03TRNAIF.value='0';Recalculate();" <%if(lnTransac.getE03TRNAIF().equals("0")) out.print("checked");%>> Aumento 
							<input type="radio" name="CE03TRNAIF" value="5" onClick="document.forms[0].E03TRNAIF.value='5';Recalculate();" <%if(lnTransac.getE03TRNAIF().equals("5")) out.print("checked");%>> Disminuci&oacute;n
							<input type="checkbox" name="E03TRNAIS" id="E03TRNAIS" value="" onClick="updateCheck('E03TRNAIS', this.checked)" > Suspenso
						</td>
					</tr>
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trclear"); else out.print("trdark"); %>">  
						<td width="40%"> 
							<div align="right">Ajuste Mora :</div>
						</td>
						<td width="60%"> 
							<input type="text" name="E03TRNAMO" size="15" maxlength="15" value="<%= lnTransac.getE03TRNAMO().trim()%>" onKeypress="enterDecimal(event, 2)" onChange="changeField('CE03TRNAMF')" onblur="verifyNum(this)">
							<input type="hidden" name="E03TRNAMF" value="<%= lnTransac.getE03TRNAMF()%>">
							<input type="radio" name="CE03TRNAMF" value="0" onClick="document.forms[0].E03TRNAMF.value='0';Recalculate();" <%if(lnTransac.getE03TRNAMF().equals("0")) out.print("checked");%>> Aumento 
							<input type="radio" name="CE03TRNAMF" value="5" onClick="document.forms[0].E03TRNAMF.value='5';Recalculate();" <%if(lnTransac.getE03TRNAMF().equals("5")) out.print("checked");%>> Disminuci&oacute;n
							<input type="checkbox" name="E03TRNAMS" id="E03TRNAMS" value="" onClick="updateCheck('E03TRNAMS', this.checked)" > Suspenso 
						</td>
					</tr>
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trdark"); else out.print("trclear"); %>">  
						<td width="40%"> 
							<div align="right">Total :</div>
						</td>
						<td width="60%"> 
							<input type="text" name="E03TRNTOT" size="15" maxlength="15" value="<%= lnTransac.getE03TRNTOT().trim()%>" onKeypress="enterDecimal(event, 2)">
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Otros Cargos</h4>
	<table class="tableinfo" >
		<tr > 
			<td> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
				<%
					String name="";
					boolean par=true;
					for (int i=1;i<=9;i++) {
						name=""+i;
						if (par == true) par=false; else par=true;
						if(!lnTransac.getField("E03DLSNAR"+name).getString().trim().equals("")){
				%> 
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R") || par==false) out.print("trdark"); else out.print("trclear"); %>">
						<td width="40%"> 
							<div align="right"><%= lnTransac.getField("E03DLSNAR"+name).getString().trim()%> : </div>
						</td>
						<td width="60%"> 
							<input type="text" size="15" maxlength="15" name="E03DLSAMT<%= name%>" value="<%= lnTransac.getField("E03DLSAMT"+name).getString().trim()%>">
							<input type="hidden" name="E03DLSPFL<%= name%>" value="<%= lnTransac.getField("E03DLSPFL"+name).getString().trim()%>">
							<input type="radio" name="CE03DLSPFL<%= name%>" value="0" onClick="document.forms[0].E03DLSPFL<%= name%>.value='0';Recalculate();" <%if(lnTransac.getField("E03DLSPFL"+name).getString().trim().equals("0")) out.print("checked");%>> Reversar 
							<%--<input type="radio" name="CE03DLSPFL<= name>" value="5" onClick="document.forms[0].E03DLSPFL<= name>.value='5';Recalculate();" <if(lnTransac.getField("E03DLSPFL"+name).getString().trim().equals("5")) out.print("checked");>> Pago--%> 
						</td>
					</tr>
				<%
						}
					}
				%> 
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trdark"); else out.print("trclear"); %>"> 
						<% if(lnTransac.getE03CNTINT().equals("07")){%>
						<td width="40%">
							<div align="right">F.E.C.I. :</div>
						</td>
						<% } else { %> 
						<td width="40%">
							<div align="right">I.V.A. :</div>
						</td>
						<% } %> 
						<td width="60%">
							<input type="text" name="E03TRNIVA" size="15" maxlength="15" value="<%= lnTransac.getE03TRNIVA().trim()%>" onKeypress="enterDecimal(event, 2)">
							<input type="hidden" name="E03TRNIVF" value="<%= lnTransac.getE03TRNIVF()%>">
							<input type="radio" name="CE03TRNIVF" value="0" onClick="document.forms[0].E03TRNIVF.value='0';Recalculate();" <%if(lnTransac.getE03TRNIVF().equals("0")) out.print("checked");%>> Reversar 
							<%--<input type="radio" name="CE03TRNIVF" value="5" onClick="document.forms[0].E03TRNIVF.value='5';Recalculate();" <if(lnTransac.getE03TRNIVF().equals("5")) out.print("checked");>> Pago--%> 
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Informacion adicional</h4>
	<table class="tableinfo" >
		<tr > 
			<td> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trdark"); else out.print("trclear"); %>"> 
						<td width="40%"><div align="right">Fecha Valor :</div></td>
						<td width="60%"> 
							<eibsinput:date name="lnTransac"  fn_month="E03TRNVDM" fn_day="E03TRNVDD" fn_year="E03TRNVDY" /> 
						</td>
					</tr>
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trclear"); else out.print("trdark"); %>">  
						<td width="40%"><div align="right">Tasa de Cambio :</div></td>
						<td width="60%"> 
							<input type="text" name="E03DEAEXR" size="11" maxlength="11" value="<%= lnTransac.getE03DEAEXR().trim()%>">
						</td>
					</tr>
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trdark"); else out.print("trclear"); %>"> 
						<td width="40%"><div align="right">Descripci&oacute;n :</div></td>
						<td width="60%"> 
							<input type="text" name="E03DEANR1" size="60" maxlength="60" value="<%= lnTransac.getE03DEANR1().trim()%>">
						</td>
					</tr>
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trclear"); else out.print("trdark"); %>">  
						<td width="40%"><div align="right"></div></td>
						<td width="60%"> 
							<input type="text" name="E03DEANR2" size="60" maxlength="60" value="<%= lnTransac.getE03DEANR2().trim()%>">
						</td>
					</tr>
				</table>
				<br>
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<% if(lnTransac.getH03FLGWK3().equals("R")) out.print("trclear"); else out.print("trdark"); %>">  
						<td align="center"> <b>Cuenta Contrapartida</b> </td>
					</tr>
				</table>
				<table class="tableinfo" style="filter:''; border: 0px;">
					<tr id="trdark"> 
						<td width="40%"><div align="center">Concepto</div></td>
						<td width="5%"><div align="center">Banco</div></td>
						<td width="5%" ><div align="center">Sucursal</div></td>
						<td width="5%" ><div align="center">Moneda</div></td>
						<td width="15%"><div align="center">Referencia</div></td>
						<td nowrap width="30%" ><div align="center">Titular</div></td>
					</tr>
					<tr id="trclear"> 
						<td width="40%" > 
							<div align="center" > 
								<input type=text name="E03TRNOPC" value="<%= lnTransac.getE03TRNOPC().trim()%>" size="3" maxlength="3">
								<input type=HIDDEN name="E03TRNGLN" value="<%= lnTransac.getE03TRNGLN().trim()%>">
								<input type="text" name="E03TRNCON" size="60" maxlength="60" readonly value="<%= lnTransac.getE03TRNCON().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E03DEABNK.value, document.forms[0].E03TRNCCY.value,'E03TRNGLN','E03TRNOPC','10','05')">
							</div>
						</td>
						<td width="5%" > 
							<div align="center"> 
								<input type="text" name="E03TRNBNK" size="2" maxlength="2" value="<%= lnTransac.getE03TRNBNK().trim()%>">
							</div>
						</td>
						<td width="5%"> 
							<div align="center"> 
								<input type="text" name="E03TRNBRN" size="4" maxlength="4" value="<%= lnTransac.getE03TRNBRN().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E03DEABNK.value,'','','','')">
							</div>
						</td>
						<td width="5%" > 
							<div align="center">
								<input type="text" name="E03TRNCCY" size="3" maxlength="3" value="<%= lnTransac.getE03TRNCCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E03DEABNK.value,'','','','')"> 
							</div>
						</td>
						<td width="15%" > 
							<div align="center"> 
								<input type="text" name="E03TRNACC" size="16" maxlength="16" value="<%= lnTransac.getE03TRNACC().trim()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E03DEABNK.value,'','','','RT')">
							</div>
						</td>
						<td nowrap width="30%" > 
							<div align="center"> 
								<input type="text" readonly name="E03TRNNA1" size="60" maxlength="60" value="<%= lnTransac.getE03TRNNA1().trim()%>">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<SCRIPT type="text/javascript">
		Recalculate();
	</SCRIPT>

	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</div>
	
</form>
</body>
</html>