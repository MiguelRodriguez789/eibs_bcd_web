<%@page import = "datapro.eibs.master.Util" %>
<%@page import="datapro.eibs.beans.EDL090006Message"%> 
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE>Resumen de Pagos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">

<jsp:useBean id="header" class="datapro.eibs.beans.EDL090007Message"  scope="session" />
<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/sortTables.js"> </SCRIPT>

<SCRIPT type="text/javascript">
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

</SCRIPT>

</HEAD>
<BODY>

<form>
	<h3 align="center">Resumen de Pagos
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_resumen_cupo_rotativo.jsp,EDL0900"> 
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
								<eibsinput:text property="E07DEACUN" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="12%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap > 
							<div align="left"> 
								<eibsinput:text property="E07CUSNA1" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
							</div>
						</td>
						<td nowrap ><div align="right"><b>Producto : </b></div></td>
						<td nowrap ><b>                
							<eibsinput:text property="E07DEATYP" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							<eibsinput:text property="E07DEAPRO" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/></b>
						</td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="14%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="9%"> 
							<div align="left"> 
								<eibsinput:text property="E07DEAACC" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="12%"><div align="right">Oficial :</div></td>
						<td nowrap width="33%"> 
							<div align="left"><b> 
								<input type="text" name="E07DEAOFC" size="48" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
								</b> </div>
						</td>
						<td nowrap width="11%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="21%"> 
							<div align="left"><b> 
								<eibsinput:text property="E07DEACCY" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
								</b> </div>
						</td>
					</tr>
					<% if ((!header.getE07DEACNV().equals("")) && (!header.getE07DSCCNV().equals(""))) { %>
					<tr id="trdark"> 
						<td nowrap width="15%" > 
							<div align="right"><b>Convenio : </b></div>
						</td>
						<td nowrap width="85%" colspan="5"> 
							<div align="left"> 
								<eibsinput:text property="E07DEACNV" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
								<eibsinput:text property="E07DSCCNV" name="header" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
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
						<td nowrap width="25%" ><div align="right"> Monto del Cupo :</div></td>
						<td nowrap width="25%"  > 
							<div align="left"><%=header.getE07DEAOAM()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha de Apertura :</div></td>
						<td nowrap width="25%"  > 
							<div align="left"><%=Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE07DEAODM().intValue(),header.getBigDecimalE07DEAODD().intValue(),header.getBigDecimalE07DEAODY().intValue())%></div>
						</td>
					</tr>
					
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right"> Monto de Utilizaciones :</div></td>
						<td nowrap width="25%"  > 
							<div align="left"><%=header.getE07DEAPRI()%></div>
						</td>
						<td nowrap width="25%" ><div align="right">Fecha de Vencimiento :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%=Util.formatCustomDate(currUser.getE01DTF(),header.getBigDecimalE07DEAMAM().intValue(),header.getBigDecimalE07DEAMAD().intValue(),header.getBigDecimalE07DEAMAY().intValue())%></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%" ><div align="right"> Saldo Disponible :</div></td>
						<td nowrap width="25%" > 
							<div align="left"><%=header.getE07DEAMEP()%></div>
						</td>
						<td nowrap width="25%"  ><div align="right"></div></td>
						<td nowrap width="25%" > 
							<div align="left"></div>
						</td>
					</tr>
					 
				</table>
			</td>
		</tr>
	</table>

	<br>
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
						<TH ALIGN=CENTER nowrap width="5%" >Nro<br>Utilizacion</TH>
						<TH ALIGN=CENTER nowrap width="5%" >Tipo<br>Utilizacion</TH>
						<TH ALIGN=CENTER nowrap width="3%" >Tasa<br></TH>
						<TH ALIGN=CENTER nowrap width="5%" >Fecha<br>a Pagar</TH>
						<TH ALIGN=CENTER nowrap width="7%" >Valor<br>Cuota</TH>
						<TH ALIGN=CENTER nowrap width="5%" >Fecha<br>a Pagar</TH>
						<TH ALIGN=CENTER nowrap width="7%" >Valor<br>Cuota</TH>
						<TH ALIGN=CENTER nowrap width="7%" >Pago<br>Parcial</TH>
						<TH ALIGN=CENTER nowrap width="7%" >Saldo<br>Cuotas</TH>
						<TH ALIGN=CENTER nowrap width="3%" >Total<br>Cuotas</TH>
						<TH ALIGN=CENTER nowrap width="3%" >Cuotas<br>Pendientes</TH>
						<TH ALIGN=CENTER nowrap width="3%" >Cuotas<br>Vencidas</TH>
						<TH ALIGN=CENTER nowrap width="7%" >Usuario<br></TH>
						<TH ALIGN=CENTER nowrap width="5%" >Fecha<br>Utilizacion</TH>
						
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
						 double sume = 0;
						 list.initRow();
						 while (list.getNextRow()) {
						   EDL090006Message plan = (EDL090006Message) list.getRecord();
						   suma += plan.getBigDecimalE06RESVAL().doubleValue();
						   sumb += plan.getBigDecimalE06RESVAV().doubleValue();
						   sumc += plan.getBigDecimalE06RESSDO().doubleValue();
						   sume = suma + sumb + sumc ;
					%> 
						<tr id="dataTable<%= list.getCurrentRow() %>">
							<td nowrap align="center" width="5%">
							 <a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESACC()%></a> 
							</td>
							<td nowrap align="center" width="5%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)">
								<% if   (plan.getE06RESAPC().equals("1")) out.print("Avances");
								else if (plan.getE06RESAPC().equals("2")) out.print("Compras");
								else if (plan.getE06RESAPC().equals("3")) out.print("Transfer");
								else out.print(plan.getE06RESAPC());%>
								</a>
							</td>
							<td nowrap align="center" width="3%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESRTE()%></a>
							</td>
							<td nowrap align="center" width="5%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE06RESPDM().intValue(),plan.getBigDecimalE06RESPDD().intValue(),plan.getBigDecimalE06RESPDY().intValue())%></a>
							</td>
							<td nowrap align="center" width="7%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESVAL()%></a>
							</td>
							<td nowrap align="center" width="5%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE06RESFVM().intValue(),plan.getBigDecimalE06RESFVD().intValue(),plan.getBigDecimalE06RESFVY().intValue())%></a>
							</td>
							<td nowrap align="center" width="7%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESVAV()%></a>
							</td>
							<td nowrap align="center" width="7%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESVAP()%></a>
							</td>
							<td nowrap align="center" width="7%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESSDO()%></a>
							</td>
							<td nowrap align="center" width="3%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESTOT()%></a>
							</td>
							<td nowrap align="right" width="3%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESTOP()%></a>
							</td>
							<td nowrap align="right" width="3%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESTOV()%></a>
							</td>
							<td nowrap align="right" width="7%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=plan.getE06RESUSR()%></a>
							</td>
							<td nowrap align="right" width="5%">
								<a href="javascript:showInqAcc(<%= plan.getE06RESACC()%>)"><%=Util.formatCustomDate(currUser.getE01DTF(),plan.getBigDecimalE06RESUTM().intValue(),plan.getBigDecimalE06RESUTD().intValue(),plan.getBigDecimalE06RESUTY().intValue())%></a>
							</td>
							
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
			<TD ALIGN=CENTER  nowrap><b>TOTAL PROXIMAS A PAGAR : </b><%= Util.formatCCY(suma) %></TD>
			<TD ALIGN=CENTER  nowrap><b>TOTAL VENCIDAS : </b><%= Util.formatCCY(sumb) %></TD>
			<TD ALIGN=CENTER  nowrap><b>TOTAL CUOTAS : </b><%= Util.formatCCY(sumc) %></TD>
			
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


	<div align="center"> 
		<input id="EIBSBTN" type=button name="Submit" OnClick="checkClose()" value="Salir">
	</div>

</FORM>

<script type="text/javascript">
function showGraph(){
	var pg= "<%=request.getContextPath()%>/pages/s/EDL0900_ln_PlanDePagoGraph.jsp";
	CenterNamedWindow(pg,'graph',1200,800,2);
}
</script>

</BODY>
</HTML>
