<%@page import = "datapro.eibs.master.Util" %>
<%@page import="datapro.eibs.beans.EDL090002Message"%>
<%@page import="datapro.eibs.beans.EDL090003Message"%>
<%@page import="datapro.eibs.beans.EDL090008Message"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>Cronograma de Plan de Pagos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/>

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090001Message"  scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="listUF" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="edl090008List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/sortTables.js"> </SCRIPT>
<SCRIPT type="text/javascript">

//Script control tabs
$(function() {  
$( "#tabs" ).tabs();
});

$(document).ready(function () {

	var tbs = 'YYYY';
	$("#tabs").tabs({disabled: [0,1,2,3]});
	var m = tbs.length;
   	for(n=0; n<m ;n++) {
     	var tb = tbs.substring(n, n+1);
      	if(tb == "Y") {
			enableTab($("#tabs"), n);
		}
    }
    
    var currentTabIndex = "0";

    $tab = $("#tabs").tabs({
         activate : function (e, ui) {
            currentTabIndex = ui.newTab.index().toString();
            sessionStorage.setItem('tab-index', currentTabIndex);
         }
    });

    if (sessionStorage.getItem('tab-index') != null) {
        currentTabIndex = sessionStorage.getItem('tab-index');
        console.log(currentTabIndex);
        $tab.tabs('option', 'active', currentTabIndex);
    }
    $('#btn-sub').on('click', function () {
        sessionStorage.setItem("tab-index", currentTabIndex);
    });
    
});

function enableTab(obj, num){
    obj.tabs("enable", num);
}
//end-tabs

<% 
	String newMenu = "";	
	if (!userPO.getOption().equals("PROP")) { 
		if (userPO.getPurpose().equals("MAINTENANCE")){
			if (userPO.getOption().equals("PV")){ 
				newMenu = "pv_m_opt";
			} else { 
				newMenu = "ln_m_opt";
			}  
		} else if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
				newMenu = "ln_i_1_opt";
		} else if ( userPO.getPurpose().equals("APPROVAL_INQ") || userPO.getPurpose().equalsIgnoreCase("AppInquiry")) { 
				newMenu = "pv_a_opt";
		} else if ( userPO.getPurpose().equals("AppInquiryP") ){ 
				newMenu = "ln_a_opt_prorroga";
		} else if ( userPO.getPurpose().equals("AppInquiryP") ){ 
				newMenu = "ln_a_opt_prorroga";
		} else if ( userPO.getPurpose().equals("CreditLines") ){ 
				newMenu = "crotat_inq_opt";
		} else  if (!userPO.getPurpose().equals("QUOTATION")) { 
			if (!userPO.getPurpose().equals("SIM")) {
				if(!userPO.getHeader22().equals("CreditLines")) {
					newMenu = "ln_i_2_opt";
				} else{
					newMenu = "crotat_inq_opt";
				}
			}
		}
	} 
%>
<% if (newMenu != "") { %>
	   builtNewMenu(<%=newMenu%>);
	   initMenu();
<% } %>

function PrintPreview(tab) {
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0900?SCREEN=300&TAB='+tab;
	CenterWindow(pg,720,500,2);
}

function goExcel(tab) {
	var pg = '<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0900?SCREEN=300&SOURCE=EXCEL&TAB='+tab;
	CenterWindow(pg, 600, 500, 2);
}

</SCRIPT>

</HEAD>
<BODY>

<form>
	<h3 align="center">Cronograma de Plan de Pagos
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_plan_de_pagos.jsp,EDL0900"> 
	</h3>
	<hr size="4">
	<input TYPE=HIDDEN name="SCREEN" id="SCREEN" value="200">
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="14%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="9%" > 
							<div align="left"> 
								<eibsinput:text property="E01DEACUN" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="12%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap > 
							<div align="left"> 
								<eibsinput:text property="E01CUSNA1" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
							</div>
						</td>
						<td nowrap ><div align="right"><b>Producto : </b></div></td>
						<td nowrap ><b>                
							<eibsinput:text property="E01DEATYP" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							<eibsinput:text property="E01DEAPRO" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/></b>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="14%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="9%"> 
							<div align="left"> 
								<eibsinput:text property="E01DEAACC" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="12%"><div align="right">Oficial :</div></td>
						<td nowrap width="33%"> 
							<div align="left"><b> 
								<input type="text" name="E01DEAOFC" size="48" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
								</b> </div>
						</td>
						<td nowrap width="11%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="21%"> 
							<div align="left"><b> 
								<eibsinput:text property="E01DEACCY" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
								</b> </div>
						</td>
					</tr>
					<% if ((!header.getE01DEACNV().equals("")) && (!header.getE01DSCCNV().equals(""))) { %>
					<tr id="trdark"> 
						<td nowrap width="15%" > 
							<div align="right"><b>Convenio : </b></div>
						</td>
						<td nowrap width="85%" colspan="5"> 
							<div align="left"> 
								<eibsinput:text property="E01DEACNV" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
								<eibsinput:text property="E01DSCCNV" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<% }%>
				</table>
			</td>
		</tr>
	</table>
	<br>

	<%int row = 0; %>
	<table class="tableinfo">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" >
							<div align="right">
							<% if (header.getE01DEACLF().equals("I")) out.print("Monto Cupo :");
							else out.print("Monto Inicial :");%>
							</div>
						</td>
						<td nowrap width="25%"  > 
							<div align="left"><%=header.getE01DEAOAM()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha de Apertura :</div></td>
						<td nowrap width="25%"  > 
							<div align="left"><%=Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE01DEAODM().intValue(),header.getBigDecimalE01DEAODD().intValue(),header.getBigDecimalE01DEAODY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Forma C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
							<% if   (header.getE01DEAICT().equals("S")) out.print("LINEAL/CALENDARIO/VENCIDO");
							else if (header.getE01DEAICT().equals("M")) out.print("LINEAL/COMERCIAL/VENCIDO");
							else if (header.getE01DEAICT().equals("P")) out.print("LINEAL/CALENDARIO/PREPAGADO");
							else if (header.getE01DEAICT().equals("A")) out.print("LINEAL/COMERCIAL/PREPAGADO");
							else if (header.getE01DEAICT().equals("D")) out.print("LINEAL/CALENDARIO/DESCONTADO");
							else if (header.getE01DEAICT().equals("R")) out.print("LINEAL/COMERCIAL/PREPAGADO");
							else if (header.getE01DEAICT().equals("1")) out.print("EXPON/CALENDARIO/VENCIDO");
							else if (header.getE01DEAICT().equals("2")) out.print("EXPON/COMERCIAL/VENCIDO");
							else if (header.getE01DEAICT().equals("3")) out.print("EXPON/CALENDARIO/PREPAGADO");
							else if (header.getE01DEAICT().equals("4")) out.print("EXPON/COMERCIAL/PREPAGADO");
							else if (header.getE01DEAICT().equals("5")) out.print("EXPON/CALENDARIO/DESCONTADO");
							else if (header.getE01DEAICT().equals("6")) out.print("EXPON/COMERCIAL/PREPAGADO");
							else out.print("");%>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha Inicio C&aacute;lculo :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%=Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE01DEASDM().intValue(),header.getBigDecimalE01DEASDD().intValue(),header.getBigDecimalE01DEASDY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right"> Base C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%"  > 
							<div align="left">
							<% if   (header.getE01DEAIFL().equals("1")) out.print("CAPITAL VIGENTE");
							else if (header.getE01DEAIFL().equals("2")) out.print("CAPITAL ORIGINAL");
							else if (header.getE01DEAIFL().equals("3")) out.print("CAPITAL(VIGENTE - VENCIDO)");
							else if (header.getE01DEAIFL().equals("N")) out.print("NO CALCULA INTERES");
							else out.print("");%>
							</div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha de Vencimiento :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%=Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE01DEAMAM().intValue(),header.getBigDecimalE01DEAMAD().intValue(),header.getBigDecimalE01DEAMAY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right"> Base C&aacute;lculo Mora :</div></td>
						<td nowrap width="25%" > 
							<div align="left">
							<% if   (header.getE01DEAPCL().equals("1")) out.print("CAPITAL VENCIDO");
							else if (header.getE01DEAPCL().equals("2")) out.print("CAPITAL ORIGINAL");
							else if (header.getE01DEAPCL().equals("3")) out.print("CAPITAL VIGENTE");
							else if (header.getE01DEAPCL().equals("4")) out.print("(CAPITAL + INTERES) VENCIDO");
							else if (header.getE01DEAPCL().equals("5")) out.print("(CAPITAL + INTERES + SEGURO) VENCIDO");
							else if (header.getE01DEAPCL().equals("6")) out.print("(CAPITAL + SEGURO) VENCIDO");
							else if (header.getE01DEAPCL().equals("N")) out.print("NO CALCULA MORA");
							else out.print("");%>
			 				</div>
						</td>
						<td nowrap width="25%"  ><div align="right">Ultimo C&aacute;lculo Interes :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%=Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE01DEALCM().intValue(),header.getBigDecimalE01DEALCD().intValue(),header.getBigDecimalE01DEALCY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Tasa de Inter&eacute;s :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEARTE()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Per&iacute;odo Base :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEABAS()%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"  ><div align="right">Tasa Efectiva :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DEASPR()%></div>
						</td>
						<td nowrap width="25%"  ><div align="right">Tasa de Mora :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01RTEMOR().equals("0.000000") ? "N/A" : header.getE01RTEMOR() %></div>
						</td>
					</tr>
					<% if (header.getE01FLGSBS().equals("Y")){ %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right">Tasa Subsidio :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DLCRFS()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Tasa Efectiva Subsidio :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%= header.getE01DLCRXS()%></div>
						</td>
					</tr>
					<% } %>  
				</table>
			</td>
		</tr>
	</table>

	<br>

<div id="tabs" >  
	<ul>
    	<li><a href="#tab1">General</a></li>
    	<li><a href="#tab2">Condonado</a></li>
    	<li><a href="#tab3">Pagado</a></li>
    	<li><a href="#tab4">Por Pagar</a></li>
  	</ul>

<div id="tab1">  <!-- General  -->

	
	<table  id="tbhelp">
		<tr> 
			<td width="12%" nowrap></td>
			<td width="88%"><i class="fa fa-bar-chart  fa-lg" aria-hidden="true" onclick="javascript:showGraph()"></i></td>
		</tr>
	</table>  
	<table class="tableinfo sortable">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<TABLE style="width: 100%" >
					<tr id="trdark"> 
						<TH ALIGN=CENTER nowrap width="9%" >Nro<br>Cuota</TH>
						<TH ALIGN=CENTER nowrap width="9%" >Fecha <br>a Pagar</TH>
						<% if (header.getE01DEACLF().equals("I")){ %>
						<TH ALIGN=CENTER nowrap width="9%" >Fecha<br>Facturaci&oacute;n</TH>
						<% } %>
						<TH ALIGN=CENTER nowrap width="9%" >Principal</TH>
						<TH ALIGN=CENTER nowrap width="9%" >Inter&eacute;s</TH>
						<TH ALIGN=CENTER nowrap width="11%" >Otros<br>Cargos</TH>
						<% if (header.getE01DLCFL9().equals("Y")){ %>
						<TH ALIGN=CENTER nowrap width="11%" >Ahorro</TH>
						<% } %>
						<TH ALIGN=CENTER nowrap width="9%" >Total<br>Cuota</TH>
						<% if (!header.getE01DEACLF().equals("I") && !header.getE01DEACLF().equals("O")){ %>
						<TH ALIGN=CENTER nowrap width="9%" >Saldo</TH>
						<% } %>
						<TH ALIGN=CENTER nowrap width="9%" >Est.</TH>
						<TH ALIGN=CENTER nowrap width="9%" >Dias<br>Ven.</TH>
						<TH ALIGN=CENTER nowrap width="9%" >Fecha<br>Pago</TH>
						<TH ALIGN=CENTER nowrap width="9%" >Monto<br>Pagado</TH>
						<% if (header.getE01FLGSBS().equals("Y")){ %>
						<TH ALIGN=CENTER nowrap width="9%" >Int.<br>Subsidio</TH>
						<% } %>
					</TR>
				</TABLE>
			</td>
		</tr>
		<tr  height="95%">    
			<td nowrap="nowrap"> 
				<div id="dataDiv1"  style="max-height:400px; overflow:auto; border: 0px;"> 
					<table id="dataTable" class="tableinfoList" style="border: 0" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
						 double suma = 0;
						 double sumb = 0;
						 double sumc = 0;
						 double sumd = 0;
						 double sume = 0;
						 list.initRow();
						 while (list.getNextRow()) {
						   EDL090002Message plan = (EDL090002Message) list.getRecord();
						   suma += plan.getBigDecimalE02DLPPRN().doubleValue();
						   sumb += plan.getBigDecimalE02DLPINT().doubleValue();
						   sumc += plan.getBigDecimalE02DLPOTH().doubleValue();
						   sumd += plan.getBigDecimalE02DLPPAG().doubleValue();
						   sume = suma + sumb + sumc - sumd;
					%> 
						<tr id="dataTable<%= list.getCurrentRow() %>">
							<td nowrap align="center" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)">
								<% if   (plan.getE02DLPPNU().equals("77777")) out.print("Aceler.");
								else if (plan.getE02DLPPNU().equals("88888")) out.print("Abono");
								else if (plan.getE02DLPPNU().equals("88999")) out.print("Cargo");
								else if (plan.getE02DLPPNU().equals("96666")) out.print("Reest.");
								else if (plan.getE02DLPPNU().equals("96667")) out.print("Modif.");
								else if (plan.getE02DLPPNU().equals("99999")) out.print("Prepago");
								else out.print(plan.getE02DLPPNU());%>
								</a>
							</td>
							<td nowrap align="center" width="9%">
								<a href="javascript:showQuoteDetail2(<%=list.getCurrentRow() %>)"><%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE02DLPPDM().intValue(),plan.getBigDecimalE02DLPPDD().intValue(),plan.getBigDecimalE02DLPPDY().intValue())%></a>
							</td>
							<% if (header.getE01DEACLF().equals("I")){ %>
							<td nowrap align="center" width="9%">
								<a href="javascript:showQuoteDetail2(<%=list.getCurrentRow() %>)"><%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE02DLPSDM().intValue(),plan.getBigDecimalE02DLPSDD().intValue(),plan.getBigDecimalE02DLPSDY().intValue())%></a>
							</td>
							<%} %>
							<td nowrap align="right" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPPRN()%></a>
							</td>
							<td nowrap align="right" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPINT()%></a>
							</td>
							<td nowrap align="right" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPOTH()%></a>
							</td>
							<% if (header.getE01DLCFL9().equals("Y")){ %>
							 <td nowrap align="right" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02PAHVAH()%></a>
							</td>
							<% } %>
							<td nowrap align="right" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPTOT()%></a>
							</td>
							<% if ((!userPO.getHeader23().equals("I") && !userPO.getHeader22().equals("CreditLines")) && !userPO.getHeader23().equals("O")){ %>
							<td nowrap align="right" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPBAL()%></a>
							</td>
								<% } %>
							<td nowrap align="center" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPSTS()%></a>
							</td>
							<td nowrap align="center" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPVEN()%></a>
							</td>
							<td nowrap align="center" width="9%">
								<a href="javascript:showQuoteDetail2(<%=list.getCurrentRow() %>)"><%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE02DLPDTM().intValue(),plan.getBigDecimalE02DLPDTD().intValue(),plan.getBigDecimalE02DLPDTY().intValue())%></a>
							</td>
							<td nowrap align="right" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02DLPPAG()%></a>
							</td>
							<% if (header.getE01FLGSBS().equals("Y")){ %>
							<td nowrap align="right" width="9%">
								<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)"><%=plan.getE02INTSBS()%></a>
							</td>
							<% } %>
						</tr>
					<% } %>
					</TABLE>
				</div>
			</td>
		</tr>
	</Table>  

	<h4>Totales</h4>
	<TABLE class="tableinfo"  cellpadding=2 cellspacing=3 >
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCCY(suma) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES : </b><%= Util.formatCCY(sumb) %></TD>
			<TD ALIGN=CENTER  nowrap><b>OTROS CARGOS : </b><%= Util.formatCCY(sumc) %></TD>
			<TD ALIGN=CENTER  nowrap><b>MONTO PAGADO : </b><%= Util.formatCCY(sumd) %></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL A PAGAR : </b><%= Util.formatCCY(sume) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
	</TABLE>

	<% if(!listUF.getNoResult()){ %>
	<br> <br>
	<h3 align="center">Cronograma de Plan de Pagos en Valor Reajustable </h3>

	<TABLE class="tableinfoList"  cellpadding=2 cellspacing=3>
		<tr id="trdark"> 
			<TH ALIGN=CENTER nowrap width="9%" >Nro<br>Cuota</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Fecha <br>a Pagar</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Principal</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Inter&eacute;s</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Otros<br>Cargos</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Total<br>Cuota</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Saldo</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Est.</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Dias<br>Ven.</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Fecha<br>Pago</TH>
			<TH ALIGN=CENTER nowrap width="9%" >Monto<br>Pagado</TH>
			<% if (header.getE01FLGSBS().equals("Y")){ %>
			<TH ALIGN=CENTER nowrap width="9%" >Int.<br>Subsidio</TH>
			 <% } %>
		</TR>
	</TABLE>
	<div id="dataDiv1"  style="max-height:400px; overflow:auto; border: 0px;"> 
		<TABLE class="tableinfoList"  cellpadding=2 cellspacing=3>
			<%
				 double sumaUF = 0;
				 double sumbUF = 0;
				 double sumcUF = 0;
				 double sumdUF = 0;
				 double sumeUF = 0;
				 listUF.initRow();
				 while (listUF.getNextRow()) {
				   EDL090003Message planUF = (EDL090003Message) listUF.getRecord();
				   sumaUF += planUF.getBigDecimalE03DLPPRN().doubleValue();
				   sumbUF += planUF.getBigDecimalE03DLPINT().doubleValue();
				   sumcUF += planUF.getBigDecimalE03DLPOTH().doubleValue();
				   sumdUF += planUF.getBigDecimalE03DLPPAG().doubleValue();
				   sumeUF = sumaUF + sumbUF + sumcUF - sumdUF;
			%> 
			<tr id="dataTable<%= listUF.getCurrentRow() %>">
				<td nowrap align="center" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)">
					<% if   (planUF.getE03DLPPNU().equals("77777")) out.print("Aceler.");
					else if (planUF.getE03DLPPNU().equals("88888")) out.print("Abono");
					else if (planUF.getE03DLPPNU().equals("88999")) out.print("Cargo");
					else if (planUF.getE03DLPPNU().equals("96666")) out.print("Reest.");
					else if (planUF.getE03DLPPNU().equals("96667")) out.print("Modif.");
					else if (planUF.getE03DLPPNU().equals("99999")) out.print("Prepago");
					else out.print(planUF.getE03DLPPNU());%>
					</a>
				</td>
				<td nowrap align="center" width="9%">
					<a href="javascript:showQuoteDetailUF(<%=listUF.getCurrentRow() %>)"><%=Util.formatCustomDate(currUser.getE01DTF(),planUF.getBigDecimalE03DLPPDM().intValue(),planUF.getBigDecimalE03DLPPDD().intValue(),planUF.getBigDecimalE03DLPPDY().intValue())%></a>
				</td>
				<td nowrap align="right" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03DLPPRN()%></a>
				</td>
				<td nowrap align="right" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03DLPINT()%></a>
				</td>
				<td nowrap align="right" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03DLPOTH()%></a>
				</td>
				<td nowrap align="right" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03DLPTOT()%></a>
				</td>
				<td nowrap align="right" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03DLPBAL()%></a>
				</td>
				<td nowrap align="center" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03DLPSTS()%></a>
				</td>
				<td nowrap align="center" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03DLPVEN()%></a>
				</td>
				<td nowrap align="center" width="9%">
					<a href="javascript:showQuoteDetailUF(<%=listUF.getCurrentRow() %>)"><%=Util.formatCustomDate(currUser.getE01DTF(),planUF.getBigDecimalE03DLPDTM().intValue(),planUF.getBigDecimalE03DLPDTD().intValue(),planUF.getBigDecimalE03DLPDTY().intValue())%></a>
				</td>
				<td nowrap align="right" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03DLPPAG()%></a>
				</td>
				<% if (header.getE01FLGSBS().equals("Y")){ %>
				<td nowrap align="right" width="9%">
					<a href="javascript:showQuoteDetailUF(<%= listUF.getCurrentRow() %>)"><%=planUF.getE03INTSBS()%></a>
				</td>
				<% } %>
			</tr>
			<% } %> 
		</TABLE>
	</div>
	
	<h4>Totales</h4>
	<TABLE class="tableinfo"  cellpadding=2 cellspacing=3>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCCY(sumaUF) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES : </b><%= Util.formatCCY(sumbUF) %></TD>
			<TD ALIGN=CENTER  nowrap><b>OTROS CARGOS : </b><%= Util.formatCCY(sumcUF) %></TD>
			<TD ALIGN=CENTER  nowrap><b>MONTO PAGADO : </b><%= Util.formatCCY(sumdUF) %></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL A PAGAR : </b><%= Util.formatCCY(sumeUF) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
	</TABLE>
<% } %>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview(1)" value="Imprimir">
		<input id="EIBSBTN" type=button name="Submit" OnClick="goExcel(1)" value="Excel">
		<input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
	</div>
</div> <!-- fin div tab1 -->

<div id="tab2">  <!-- Condonados  -->
	<table class="tableinfo">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="105%"> 
				<TABLE style="width: 100%" >
					<tr id="trdark"> 
						<TH ALIGN=CENTER rowspan="2" width="4%" >Nro<br>Cuota</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Fecha <br>a Pagar</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Principal</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Cte. Balance</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Cte. Conting.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Mora Balance</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Mora Conting.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Seguro<br>Vida</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Seguro<br>Adicional</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Ley <br>MiPyme</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Ley MiPyme<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Comision</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Comision<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >GAC</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >GAC<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra<br>Judicial</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Gasto Extra<br>Judicial IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra Dif.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra Dif.<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Otros Gastos </TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Otros Gastos<br>IVA</TH>						
					</TR>
				</TABLE>
			</td>
		</tr>
		<tr  height="95%">    
			<td nowrap="nowrap"> 
				<div id="dataDiv1"  style="max-height:400px; overflow:auto; border: 0px;"> 
					<table id="dataTable" class="tableinfoList" style="border: 0" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
						 double sum01 = 0;
						 double sum02 = 0;
						 double sum03 = 0;
						 double sum04 = 0;
						 double sum05 = 0;
						 double sum06 = 0;
						 double sum07 = 0;
						 double sum08 = 0;
						 double sum09 = 0;
						 double sum10 = 0;
						 double sum11 = 0;
						 double sum12 = 0;
						 double sum13 = 0;
						 double sum14 = 0;
						 double sum15 = 0;
						 double sum16 = 0;
						 double sum17 = 0;
						 double sum18 = 0;
						 double sum19 = 0;
						 double sumtot = 0;
						 
						 list = edl090008List;
						 list.initRow();
						 while (list.getNextRow()) {
						   EDL090008Message plan = (EDL090008Message) list.getRecord();
						   if(!plan.getH08FLGWK1().equals("C"))
						     continue;
						   sum01 += plan.getBigDecimalE08COND01().doubleValue();
						   sum02 += plan.getBigDecimalE08COND02().doubleValue();
						   sum03 += plan.getBigDecimalE08COND03().doubleValue();
						   sum04 += plan.getBigDecimalE08COND04().doubleValue();
						   sum05 += plan.getBigDecimalE08COND05().doubleValue();
						   sum06 += plan.getBigDecimalE08COND06().doubleValue();
						   sum07 += plan.getBigDecimalE08COND07().doubleValue();
						   sum08 += plan.getBigDecimalE08COND08().doubleValue();
						   sum09 += plan.getBigDecimalE08COND09().doubleValue();
						   sum10 += plan.getBigDecimalE08COND10().doubleValue();
						   sum11 += plan.getBigDecimalE08COND11().doubleValue();
						   sum12 += plan.getBigDecimalE08COND12().doubleValue();
						   sum13 += plan.getBigDecimalE08COND13().doubleValue();
						   sum14 += plan.getBigDecimalE08COND14().doubleValue();
						   sum15 += plan.getBigDecimalE08COND15().doubleValue();
						   sum16 += plan.getBigDecimalE08COND16().doubleValue();
						   sum17 += plan.getBigDecimalE08COND17().doubleValue();
						   sum18 += plan.getBigDecimalE08COND18().doubleValue();
						   sum19 += plan.getBigDecimalE08COND19().doubleValue();
						   sumtot = sum01 + sum02 + sum03 + sum04 + sum05 +sum06 +sum07 +sum08 + sum09
						   			+sum10 + sum11 + sum12 + sum13 + sum14 +sum15 +sum16 +sum17 + sum18 + sum19;
					%> 
						<tr id="dataTable<%= list.getCurrentRow() %>">
							<td nowrap align="right" width="4%">
							<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)">
								<% if   (plan.getE08DLPPNU().equals("77777")) out.print("Aceler.");
								else if (plan.getE08DLPPNU().equals("88888")) out.print("Abono");
								else if (plan.getE08DLPPNU().equals("88999")) out.print("Cargo");
								else if (plan.getE08DLPPNU().equals("96666")) out.print("Reest.");
								else if (plan.getE08DLPPNU().equals("96667")) out.print("Modif.");
								else if (plan.getE08DLPPNU().equals("99999")) out.print("Prepago");
								else out.print(plan.getE08DLPPNU());%></a>
							</td>
							<td nowrap align="center" width="5%">
								<%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE08DLPPDM().intValue(),plan.getBigDecimalE08DLPPDD().intValue(),plan.getBigDecimalE08DLPPDY().intValue())%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND01()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND02()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND03()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND04()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND05()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND06()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND07()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND08()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08COND09()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND10()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08COND11()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND12()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08COND13()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND14()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08COND15()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND16()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND17()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND18()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08COND19()%>
							</td>
						</tr>
					<% } %>
					</TABLE>
				</div>
			</td>
		</tr>
	</Table>  

	<h4>Totales Condonado</h4>
	<TABLE class="tableinfo"  cellpadding=2 cellspacing=3 >
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCCY(sum01) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES CTE BALANCE : </b><%= Util.formatCCY(sum02) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES CTE CONTING.: </b><%= Util.formatCCY(sum03) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES MORA BALANCE : </b><%= Util.formatCCY(sum04) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES MORA CONTING. : </b><%= Util.formatCCY(sum05) %></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>SEGURO VIDA : </b><%= Util.formatCCY(sum06) %></TD>
			<TD ALIGN=CENTER  nowrap><b>SEGURO ADICIONAL : </b><%= Util.formatCCY(sum07) %></TD>
			<TD ALIGN=CENTER  nowrap><b>LEY MIPYME: </b><%= Util.formatCCY(sum08) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE LEY MIPYME : </b><%= Util.formatCCY(sum09) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>COMISION : </b><%= Util.formatCCY(sum10) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE COMISION : </b><%= Util.formatCCY(sum11) %></TD>
			<TD ALIGN=CENTER  nowrap><b>GAC: </b><%= Util.formatCCY(sum12) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GAC : </b><%= Util.formatCCY(sum13) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>GASTO EXTRA JUDICIAL: </b><%= Util.formatCCY(sum14) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GASTO EXTRA JUDICIAL : </b><%= Util.formatCCY(sum15) %></TD>
			<TD ALIGN=CENTER  nowrap><b>GASTO EXTRA DIFERIDO : </b><%= Util.formatCCY(sum16) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GASTO EXTRA DIFERIDO : </b><%= Util.formatCCY(sum17) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>OTROS GASTOS: </b><%= Util.formatCCY(sum18) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE OTROS GASTOS : </b><%= Util.formatCCY(sum19) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL CONDONADO : </b><%= Util.formatCCY(sumtot) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
	</TABLE>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview(2)" value="Imprimir">
		<input id="EIBSBTN" type=button name="Submit" OnClick="goExcel(2)" value="Excel">
		<input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
	</div>
	
</div> <!-- fin div tab2 -->

<div id="tab3">  <!-- Pagados  -->
	<table class="tableinfo">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<TABLE style="width: 100%" >
					<tr id="trdark"> 
						<TH ALIGN=CENTER rowspan="2" width="4%" >Nro<br>Cuota</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Fecha <br>a Pagar</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Principal</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Cte. Balance</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Cte. Conting.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Mora Balance</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Mora Conting.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Seguro<br>Vida</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Seguro<br>Adicional</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Ley <br>MiPyme</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Ley MiPyme<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Comision</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Comision<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >GAC</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >GAC<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra<br>Judicial</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Gasto Extra<br>Judicial IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra Dif.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra Dif.<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Otros Gastos </TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Otros Gastos<br>IVA</TH>						
					</TR>
				</TABLE>
			</td>
		</tr>
		<tr  height="95%">    
			<td nowrap="nowrap"> 
				<div id="dataDiv1"  style="max-height:400px; overflow:auto; border: 0px;"> 
					<table id="dataTable" class="tableinfoList" style="border: 0" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
						 sum01 = 0;
						 sum02 = 0;
						 sum03 = 0;
						 sum04 = 0;
						 sum05 = 0;
						 sum06 = 0;
						 sum07 = 0;
						 sum08 = 0;
						 sum09 = 0;
						 sum10 = 0;
						 sum11 = 0;
						 sum12 = 0;
						 sum13 = 0;
						 sum14 = 0;
						 sum15 = 0;
						 sum16 = 0;
						 sum17 = 0;
						 sum18 = 0;
						 sum19 = 0;
						 sumtot = 0;
						 
						 list = edl090008List;
						 list.initRow();
						 while (list.getNextRow()) {
						   EDL090008Message plan = (EDL090008Message) list.getRecord();
						   if(!plan.getH08FLGWK2().equals("P"))
						     continue;
						   sum01 += plan.getBigDecimalE08PAID01().doubleValue();
						   sum02 += plan.getBigDecimalE08PAID02().doubleValue();
						   sum03 += plan.getBigDecimalE08PAID03().doubleValue();
						   sum04 += plan.getBigDecimalE08PAID04().doubleValue();
						   sum05 += plan.getBigDecimalE08PAID05().doubleValue();
						   sum06 += plan.getBigDecimalE08PAID06().doubleValue();
						   sum07 += plan.getBigDecimalE08PAID07().doubleValue();
						   sum08 += plan.getBigDecimalE08PAID08().doubleValue();
						   sum09 += plan.getBigDecimalE08PAID09().doubleValue();
						   sum10 += plan.getBigDecimalE08PAID10().doubleValue();
						   sum11 += plan.getBigDecimalE08PAID11().doubleValue();
						   sum12 += plan.getBigDecimalE08PAID12().doubleValue();
						   sum13 += plan.getBigDecimalE08PAID13().doubleValue();
						   sum14 += plan.getBigDecimalE08PAID14().doubleValue();
						   sum15 += plan.getBigDecimalE08PAID15().doubleValue();
						   sum16 += plan.getBigDecimalE08PAID16().doubleValue();
						   sum17 += plan.getBigDecimalE08PAID17().doubleValue();
						   sum18 += plan.getBigDecimalE08PAID18().doubleValue();
						   sum19 += plan.getBigDecimalE08PAID19().doubleValue();
						   sumtot = sum01 + sum02 + sum03 + sum04 + sum05 +sum06 +sum07 +sum08 + sum09
						   			+sum10 + sum11 + sum12 + sum13 + sum14 +sum15 +sum16 +sum17 + sum18 + sum19;
					%> 
						<tr id="dataTable<%= list.getCurrentRow() %>">
							<td nowrap align="right" width="4%">
							<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)">
								<% if   (plan.getE08DLPPNU().equals("77777")) out.print("Aceler.");
								else if (plan.getE08DLPPNU().equals("88888")) out.print("Abono");
								else if (plan.getE08DLPPNU().equals("88999")) out.print("Cargo");
								else if (plan.getE08DLPPNU().equals("96666")) out.print("Reest.");
								else if (plan.getE08DLPPNU().equals("96667")) out.print("Modif.");
								else if (plan.getE08DLPPNU().equals("99999")) out.print("Prepago");
								else out.print(plan.getE08DLPPNU());%></a>
							</td>
							<td nowrap align="center" width="5%">
								<%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE08DLPPDM().intValue(),plan.getBigDecimalE08DLPPDD().intValue(),plan.getBigDecimalE08DLPPDY().intValue())%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID01()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID02()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID03()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID04()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID05()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID06()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID07()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID08()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID09()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID10()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID11()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID12()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID13()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID14()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08PAID15()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID16()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID17()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID18()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08PAID19()%>
							</td>
						</tr>
					<% } %>
					</TABLE>
				</div>
			</td>
		</tr>
	</Table>  

	<h4>Totales Pagado</h4>
	<TABLE class="tableinfo"  cellpadding=2 cellspacing=3 >
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCCY(sum01) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES CTE BALANCE : </b><%= Util.formatCCY(sum02) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES CTE CONTING.: </b><%= Util.formatCCY(sum03) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES MORA BALANCE : </b><%= Util.formatCCY(sum04) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES MORA CONTING. : </b><%= Util.formatCCY(sum05) %></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>SEGURO VIDA : </b><%= Util.formatCCY(sum06) %></TD>
			<TD ALIGN=CENTER  nowrap><b>SEGURO ADICIONAL : </b><%= Util.formatCCY(sum07) %></TD>
			<TD ALIGN=CENTER  nowrap><b>LEY MIPYME: </b><%= Util.formatCCY(sum08) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE LEY MIPYME : </b><%= Util.formatCCY(sum09) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>COMISION : </b><%= Util.formatCCY(sum10) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE COMISION : </b><%= Util.formatCCY(sum11) %></TD>
			<TD ALIGN=CENTER  nowrap><b>GAC: </b><%= Util.formatCCY(sum12) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GAC : </b><%= Util.formatCCY(sum13) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>GASTO EXTRA JUDICIAL : </b><%= Util.formatCCY(sum14) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GASTO EXTRA JUDICIAL : </b><%= Util.formatCCY(sum15) %></TD>
			<TD ALIGN=CENTER  nowrap><b>GASTO EXTRA DIFERIDO : </b><%= Util.formatCCY(sum16) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GASTO EXTRA DIFERIDO : </b><%= Util.formatCCY(sum17) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>OTROS GASTOS: </b><%= Util.formatCCY(sum18) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE OTROS GASTOS : </b><%= Util.formatCCY(sum19) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL PAGADO : </b><%= Util.formatCCY(sumtot) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
	</TABLE>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview(3)" value="Imprimir">
		<input id="EIBSBTN" type=button name="Submit" OnClick="goExcel(3)" value="Excel">
		<input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
	</div>
	
</div> <!-- fin div tab3 -->

<div id="tab4">  <!-- Por Pagar  -->
	<table class="tableinfo">
		<tr  height="5%"> 
			<td NOWRAP> 
				<TABLE >
					<tr id="trdark"> 
						<TH ALIGN=CENTER rowspan="2" width="4%" >Nro<br>Cuota</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Fecha <br>a Pagar</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Principal</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Cte. Balance</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Cte. Conting.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Mora Balance</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Inter&eacute;s <br>Mora Conting.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Seguro<br>Vida</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Seguro<br>Adicional</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Ley <br>MiPyme</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Ley MiPyme<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Comision</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Comision<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >GAC</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >GAC<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra<br>Judicial</TH>
						<TH ALIGN=CENTER rowspan="2" width="4%" >Gasto Extra<br>Judicial IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra Dif.</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Gasto Extra Dif.<br>IVA</TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Otros Gastos </TH>
						<TH ALIGN=CENTER rowspan="2" width="5%" >Otros Gastos<br>IVA</TH>
					</TR>
				</TABLE>
			</td>
		</tr>
		<tr  height="95%">    
			<td nowrap="nowrap"> 
				<div id="dataDiv1"  style="max-height:400px; overflow:auto; border: 0px;"> 
					<table id="dataTable" class="tableinfoList" style="border: 0" cellspacing="0" cellpadding="1" border="0" >         
					<%
						 sum01 = 0;
						 sum02 = 0;
						 sum03 = 0;
						 sum04 = 0;
						 sum05 = 0;
						 sum06 = 0;
						 sum07 = 0;
						 sum08 = 0;
						 sum09 = 0;
						 sum10 = 0;
						 sum11 = 0;
						 sum12 = 0;
						 sum13 = 0;
						 sum14 = 0;
						 sum15 = 0;
						 sum16 = 0;
						 sum17 = 0;
						 sum18 = 0;
						 sum19 = 0;
						 sumtot = 0;
						 double rmmamt = 0;
						 
						 list = edl090008List;
						 list.initRow();
						 while (list.getNextRow()) {
						   EDL090008Message plan = (EDL090008Message) list.getRecord();
						   if(plan.getE08DLPSTS().equals("P"))
						     continue;
						   sum01 += plan.getBigDecimalE08TOTA01().doubleValue();
						   sum02 += plan.getBigDecimalE08TOTA02().doubleValue();
						   sum03 += plan.getBigDecimalE08TOTA03().doubleValue();
						   sum04 += plan.getBigDecimalE08TOTA04().doubleValue();
						   sum05 += plan.getBigDecimalE08TOTA05().doubleValue();
						   sum06 += plan.getBigDecimalE08TOTA06().doubleValue();
						   sum07 += plan.getBigDecimalE08TOTA07().doubleValue();
						   sum08 += plan.getBigDecimalE08TOTA08().doubleValue();
						   sum09 += plan.getBigDecimalE08TOTA09().doubleValue();
						   sum10 += plan.getBigDecimalE08TOTA10().doubleValue();
						   sum11 += plan.getBigDecimalE08TOTA11().doubleValue();
						   sum12 += plan.getBigDecimalE08TOTA12().doubleValue();
						   sum13 += plan.getBigDecimalE08TOTA13().doubleValue();
						   sum14 += plan.getBigDecimalE08TOTA14().doubleValue();
						   sum15 += plan.getBigDecimalE08TOTA15().doubleValue();
						   sum16 += plan.getBigDecimalE08TOTA16().doubleValue();
						   sum17 += plan.getBigDecimalE08TOTA17().doubleValue();
						   sum18 += plan.getBigDecimalE08TOTA18().doubleValue();
						   sum19 += plan.getBigDecimalE08TOTA19().doubleValue();
						   sumtot = sum01 + sum02 + sum03 + sum04 + sum05 +sum06 +sum07 +sum08 + sum09
						   			+sum10 + sum11 + sum12 + sum13 + sum14 +sum15 +sum16 +sum17 + sum18
						   			+sum19;
						   rmmamt = plan.getBigDecimalE08RMMAMT().doubleValue();
						   sumtot += rmmamt;
					%> 
						<tr id="dataTable<%= list.getCurrentRow() %>">
							<td nowrap align="right" width="4%">
							<a href="javascript:showQuoteDetail2(<%= list.getCurrentRow() %>)">
								<% if   (plan.getE08DLPPNU().equals("77777")) out.print("Aceler.");
								else if (plan.getE08DLPPNU().equals("88888")) out.print("Abono");
								else if (plan.getE08DLPPNU().equals("88999")) out.print("Cargo");
								else if (plan.getE08DLPPNU().equals("96666")) out.print("Reest.");
								else if (plan.getE08DLPPNU().equals("96667")) out.print("Modif.");
								else if (plan.getE08DLPPNU().equals("99999")) out.print("Prepago");
								else out.print(plan.getE08DLPPNU());%></a>
							</td>
							<td nowrap align="center" width="5%">
								<%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE08DLPPDM().intValue(),plan.getBigDecimalE08DLPPDD().intValue(),plan.getBigDecimalE08DLPPDY().intValue())%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA01()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA02()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA03()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA04()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA05()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA06()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA07()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA08()%>
							</td>
<!-- 							iva leymipyme -->
							<td nowrap align="right" width="4%"> 
								<%=plan.getE08TOTA09()%> 
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA10()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08TOTA11()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA12()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08TOTA13()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA14()%>
							</td>
							<td nowrap align="right" width="4%">
								<%=plan.getE08TOTA15()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA16()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA17()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA18()%>
							</td>
							<td nowrap align="right" width="5%">
								<%=plan.getE08TOTA19()%>
							</td>
						</tr>
					<% } %>
					</TABLE>
				</div>
			</td>
		</tr>
	</Table>  

	<h4>Totales Por Pagar</h4>
	<TABLE class="tableinfo"  cellpadding=2 cellspacing=3 >
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>PRINCIPAL : </b><%= Util.formatCCY(sum01) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES CTE BALANCE : </b><%= Util.formatCCY(sum02) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES CTE CONTING.: </b><%= Util.formatCCY(sum03) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES MORA BALANCE : </b><%= Util.formatCCY(sum04) %></TD>
			<TD ALIGN=CENTER  nowrap><b>INTERES MORA CONTING. : </b><%= Util.formatCCY(sum05) %></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>SEGURO VIDA : </b><%= Util.formatCCY(sum06) %></TD>
			<TD ALIGN=CENTER  nowrap><b>SEGURO ADICIONAL : </b><%= Util.formatCCY(sum07) %></TD>
			<TD ALIGN=CENTER  nowrap><b>LEY MIPYME: </b><%= Util.formatCCY(sum08) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE LEY MIPYME : </b><%= Util.formatCCY(sum09) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>COMISION : </b><%= Util.formatCCY(sum10) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE COMISION : </b><%= Util.formatCCY(sum11) %></TD>
			<TD ALIGN=CENTER  nowrap><b>GAC: </b><%= Util.formatCCY(sum12) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GAC : </b><%= Util.formatCCY(sum13) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>GASTO EXTRA JUDICIAL : </b><%= Util.formatCCY(sum14) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GASTO EXTRA JUDICIAL : </b><%= Util.formatCCY(sum15) %></TD>
			<TD ALIGN=CENTER  nowrap><b>GASTO EXTRA DIFERIDO : </b><%= Util.formatCCY(sum16) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE GASTO EXTRA DIFERIDO : </b><%= Util.formatCCY(sum17) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>OTROS GASTOS: </b><%= Util.formatCCY(sum18) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE OTROS GASTOS : </b><%= Util.formatCCY(sum19) %></TD>
			<TD ALIGN=CENTER  nowrap><b>IVA DE OTROS GASTOS : </b><%= Util.formatCCY(sum19) %></TD>
			<TD ALIGN=CENTER  nowrap><b></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap><b>SALDO REMANENTE: </b><%= Util.formatCCY(rmmamt) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3" >__________________________________________________________________________</TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
		<TR> 
			<TD ALIGN=CENTER  nowrap colspan="3"><b>TOTAL POR PAGAR : </b><%= Util.formatCCY(sumtot) %></TD>
			<TD ALIGN=CENTER  nowrap></TD>
		</TR>
	</TABLE>
	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="PrintPreview(4)" value="Imprimir">
		<input id="EIBSBTN" type=button name="Submit" OnClick="goExcel(4)" value="Excel">
		<input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
	</div>
	
</div> <!-- fin div tab4 -->

</div> <!-- fin divs -->
</FORM>

<script type="text/javascript">
function showGraph(){
	var pg= "<%=request.getContextPath()%>/pages/s/EDL0900_ln_PlanDePagoGraph.jsp";
	CenterNamedWindow(pg,'graph',1200,800,2);
}
</script>

</BODY>
</HTML>
