<%@page import="datapro.eibs.sockets.*, datapro.eibs.beans.* , datapro.eibs.master.*" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<style>
th, td { padding: 2px; }
</style>
<%
	MessageRecord mr = null;
	LoanPayPlanBean paybean = null;
	// Obtiene el mensaje a desplegar

	paybean = (LoanPayPlanBean) session.getAttribute("paybean");

	// Determina si es solo lectura
	String READ_ONLY_TAG = ""; 
	String DISABLED_TAG = "";
	boolean readOnly = false;
	if (request.getParameter("readOnly") != null ) {
		if (request.getParameter("readOnly").toLowerCase().equals("true")) {
			readOnly = true;
			READ_ONLY_TAG="readonly";
			DISABLED_TAG="disabled";
		} else {
			readOnly = false;
			READ_ONLY_TAG = "";
		}
	} else {
		READ_ONLY_TAG = "";
	}
	
	// Obtiene el color de la primera fila
	int row = 0;
	if ("trdark".equals(request.getParameter("firstColor"))) {
		row = 1;
	}
	
	String tablename = "";
	String headertitle = "Condiciones de Pago";
	if (paybean.getE01FLGFPG().equals("M")) {
		headertitle = "Pagar el Inter&eacute;s y el Capital al Vencimiento (MAT)";
		tablename   = "mattable"; 
	} else if(paybean.getE01FLGFPG().equals("2")) { 
		headertitle = "Doble Esquema de Pago (SC2)";
		tablename   = "sc2table";     
	} else if(paybean.getE01FLGFPG().equals("3")) {  
		headertitle = "Cuota Fija (SC3): Principal + Inter&eacute;s + Deducciones";
		tablename   = "sc3table"; 
	} else if(paybean.getE01FLGFPG().equals("4")) {  
		headertitle = "Cuota Fija (SC4): Pago Tipo Revolvente";
		tablename   = "sc4table";    
	} else if(paybean.getE01FLGFPG().equals("1")) {  
		headertitle = "Cuota Fija (SC1): Principal + Inter&eacute;s";
		tablename   = "sc1table";     
	} else if(paybean.getE01FLGFPG().equals("N")) {  
		headertitle = "Pagar el Inter&eacute;s y el Capital seg&uacute;n sus ciclos";
		tablename   = "nnntable";  
	} else if(paybean.getE01FLGFPG().equals("S")) {  
		headertitle = "Plan de Pago Manual (SCH) ";
		tablename   = "schtable";     
	}   

	// getSource
	// SIMULAT -> EPV0900
	// NEWMAIN -> EPV0150
	// RENEWAL -> EDL0910
	// INQUIRY -> EDL0160
%>
 
<!-- CONDICIONES DE PAGO VARIABLES/SECTION-->
<br><br>
<h5 align="center" id="pagotitle" ><%= paybean.getTitle()%></h5>
<a id="CondicionesdePago"></a>

<% if ((!paybean.getE01DEAIPD().equals("SCH") && !paybean.getE01DEAPPD().equals("SCH")) || (paybean.userEnabled())) { %> 
	<table id="pagobutton" class="tableinfo" style="width: 100%;">
	<% if ( paybean.userEnabled()) { %>
		<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap width="3%"></td>
			<td nowrap width="35%" align="left" >
				<select name="FORMADEPAGO" id="FORMADEPAGO" onchange="pagoTypeChange('<%=tablename%>');" <%=DISABLED_TAG%>>
					<option value="N" <% if (paybean.getE01FLGFPG().equals("N")) out.print("selected"); %>>Ciclo Pago Num&eacute;rico</option>
					<option value="1" <% if (paybean.getE01FLGFPG().equals("1")) out.print("selected"); %>>Cuotas Fija: Principal + Inter&eacute;s</option>
					<option value="2" <% if (paybean.getE01FLGFPG().equals("2")) out.print("selected"); %>>Doble Esquema de Pago</option>                   
					<option value="3" <% if (paybean.getE01FLGFPG().equals("3")) out.print("selected"); %>>Cuotas Fija: Principal + Inter&eacute;s + Deducci&oacute;n</option>
					<option value="4" <% if (paybean.getE01FLGFPG().equals("4")) out.print("selected"); %>>Pago Revolvente</option>
					<option value="M" <% if (paybean.getE01FLGFPG().equals("M")) out.print("selected"); %>>Pago al Vencimiento</option>
					<option value="S" <% if (paybean.getE01FLGFPG().equals("S")) out.print("selected"); %>>Plan de Pago Manual</option>
				</select>
			</td>
			<td nowrap width="62%"></td>
		</tr>
	<% } %>
	<!-- NNN TABLE-->
	<% if (paybean.getE01FLGFPG().equals("N")){ %> 
		<tr> 
			<td colspan="4">
				<table id="nnntable" style="border: 1px; border-collapse: collapse; display: table; height:100%; width: 100%;" >
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%"><div align="right">Ciclo Pago de Intereses :</div></td>
						<td nowrap width="15%">
							<input type="text" name="E01DEAIPD" maxlength="3" size="4" value="<%=paybean.getE01DEAIPD().trim()%>" class="TXTRIGHT" <%=READ_ONLY_TAG%> >
						</td>
						<td nowrap width="22%"><div align="right">Pr&oacute;xima Fecha de Pago :</div></td>
						<td nowrap colspan="2">
							<eibsinput:date name="paybean"  fn_month="e01DEARDM" fn_day="e01DEARDD" fn_year="e01DEARDY"  onchange="setRecalculate();amountRecalculate();" required="true"  capslock="true" readonly="<%=readOnly%>" />
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%"><div align="right">Ciclo Pago Capital :</div></td>
						<td nowrap width="15%">
							<input type="text" name="E01DEAPPD" maxlength="3" size="4" value="<%=paybean.getE01DEAPPD().trim()%>" class="TXTRIGHT" <%=READ_ONLY_TAG%>>
						</td>
						<td nowrap width="22%"><div align="right">Pr&oacute;xima Fecha de Pago :</div></td>
						<td nowrap colspan="2">
							<eibsinput:date name="paybean"  fn_month="e01DEAHEM" fn_day="e01DEAHED" fn_year="e01DEAHEY"  onchange="setRecalculate();amountRecalculate();" required="true" capslock="true" readonly="<%=readOnly%>"  />
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%"><div align="right">Valor de la Cuota :</div></td>
						<td nowrap width="15%">
							<eibsinput:text property="e01DEAROA" name="paybean" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate();amountRecalculate();" capslock="true" readonly="<%=readOnly%>"  />
						</td>
						<td nowrap width="20%" ><div align="right">Incluye Intereses Pago :</div></td>
						<td nowrap colspan="2" >
							<input type="hidden" name="E01DEAIIP" value="N">
							<input type="radio" name="CE01DEAIIP" value="Y" disabled >S&iacute; 
							<input type="radio" name="CE01DEAIIP" value="N" disabled checked>No 
							<%-- 
							<input type="hidden" name="E01DEAIIP" value="<%= paybean.getE01DEAIIP()%>">
							<input type="radio" name="CE01DEAIIP" value="Y" onClick="document.forms[0].E01DEAIIP.value='Y'" <%=DISABLED_TAG %> <% if(paybean.getE01DEAIIP().equals("Y")) out.print("checked");%>>S&iacute; 
							<input type="radio" name="CE01DEAIIP" value="N" onClick="document.forms[0].E01DEAIIP.value='N'" <%=DISABLED_TAG %> <% if(paybean.getE01DEAIIP().equals("N")) out.print("checked");%>>No 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  >
							--%>
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%"><div align="right">Recalcular Fecha Vencimiento :</div></td>
						<td nowrap width="15%">
							<input type="checkbox" name="AmountROA" id="AmountROA" value="" onClick="UpdateAmountFlag(this.checked)" <% if (paybean.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%> <%=DISABLED_TAG %>>
						</td>
						<td nowrap width="22%"></td>
						<td nowrap colspan="2"></td>
					</tr>
				</table>
			</td>
		</tr>
	<% } %>
	<!-- SC1 TABLE--> <!---SC3 -->
	<% if (paybean.getE01FLGFPG().equals("1") || paybean.getE01FLGFPG().equals("3") || paybean.getE01FLGFPG().equals("4")) { %> 
		<tr>
			<td colspan="4">
				<table id="SCN" style="border: 0px; width:100%; border-collapse: collapse; border-spacing: 0;">
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%"><div align="right">Total de Cuotas :</div></td>
						<td nowrap width="15%"> 
							<input type="text" name="E01DLCNC1" id="E01DLCNC1" size="4" maxlength="3" value="<%= paybean.getE01DLCNC1().trim()%>" onkeypress="enterInteger(event)" onchange="setRecalculate();amountRecalculate();valTotalCuota();" <%=READ_ONLY_TAG%>>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
						<td nowrap width="22%"><div align="right">Frecuencia de Pagos :</div></td>
						<td nowrap colspan="2">
							<input type="text" name="E01DLCFP1" size="4" maxlength="3" value="<%= paybean.getE01DLCFP1().trim()%>" onchange="setRecalculate();amountRecalculate();wipeValorCuota();" <%=READ_ONLY_TAG%>>
							<select name="E01DLCTP1" onchange="setRecalculate();amountRecalculate();wipeValorCuota();" <%=DISABLED_TAG%>>
								<option value=" " <% if (!(paybean.getE01DLCTP1().equals("D") ||paybean.getE01DLCTP1().equals("M")||paybean.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
								<option value="D" <% if(paybean.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
								<option value="M" <% if(paybean.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
								<option value="Y" <% if(paybean.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%" ><div align="right">Intereses Prepagados Hasta :</div></td>
						<td nowrap width="15%" >
							<eibsinput:date name="paybean"  fn_month="e01DLCPM1" fn_day="e01DLCPD1" fn_year="e01DLCPY1"  onchange="setRecalculate();amountRecalculate()" capslock="true" readonly="<%=readOnly%>" />
						</td>
						<td nowrap width="22%" ><div align="right">Per&iacute;odo de Gracia :</div></td>
						<td nowrap colspan="2" >
							<eibsinput:date name="paybean"  fn_month="e01DLCGM1" fn_day="e01DLCGD1" fn_year="e01DLCGY1"   capslock="true" readonly="<%=readOnly%>" />
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%" ><div align="right">Fecha Proximo Pago : </div></td>
						<td nowrap width="15%" >
							<eibsinput:date name="paybean" fn_month="e01DLCXM1" fn_day="e01DLCXD1" fn_year="e01DLCXY1"  onchange="setRecalculate();amountRecalculate();wipeValorCuota();addDateChangePaymentPlan('E01DLCXD1');" capslock="true" readonly="<%=readOnly%>"  />
						</td>
						<td nowrap width="22%" ><div align="right">Mes de NO Pago :</div></td>
						<td nowrap colspan="2" >
							<eibsinput:text property="e01DLCMN1" name="paybean" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()" capslock="true" readonly="<%=readOnly%>" />
							<eibsinput:text property="e01DLCMN2" name="paybean" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()" capslock="true" readonly="<%=readOnly%>" />
							<eibsinput:text property="e01DLCMN3" name="paybean" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()" capslock="true" readonly="<%=readOnly%>" />
						</td>	          
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" id="gracias" style="display: none;">
						<td nowrap width="33%" ><div align="right">Forma Cobro del periodo de Gracia :</div></td>
						<td nowrap width="15%" >
							<select name="E01DLCIGF" id="E01DLCIGF" onchange="setRecalculate(); nCuotas();wipeValorCuota()" <%=DISABLED_TAG%>>
								<option value="" <%if (paybean.getE01DLCIGF().equals("") ) { out.print("selected"); }%>>Interes Deudor</option>
								<% if (!paybean.getSource().equals("RENEWAL")) { %> 
								<option value="1"<%if (paybean.getE01DLCIGF().equals("1")) { out.print("selected"); }%>>Prepaga los Intereses</option>
								<% } %> 
								<option value="2"<%if (paybean.getE01DLCIGF().equals("2")) { out.print("selected"); }%>>Cobrar en la 1ra Cuota</option>
								<% if (!paybean.getSource().equals("RENEWAL")) { %> 
								<option value="3"<%if (paybean.getE01DLCIGF().equals("3")) { out.print("selected"); }%>>Cobrar en NN Cuotas</option>
								<% } %> 
								<option value="4"<%if (paybean.getE01DLCIGF().equals("4")) { out.print("selected"); }%>>Cobrar en Todas las Cuotas</option>
							</select>
						</td>
						<td nowrap width="22%" id="num1" style="display: none;"><div align="right">Numero de Cuotas a Diferir :</div></td>
						<td nowrap colspan="2" id="num2" style="display: none;">
							<eibsinput:text property="e01DLCIGN" name="paybean" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" capslock="true" readonly="<%=readOnly%>" />
						</td>
						<td nowrap width="22%" id="num3" style="display: none;">
						<%--
						<% if(!paybean.getE01DLCIGA().equals("0.00")) { %>
							<input type="hidden" name="E01DLCIGF" id="E01DLCIGF" value="<%=paybean.getE01DLCIGF()%>" >
						<% } %>
						--%>	      
						</td>
						<td nowrap colspan="2" id="num4" style="display: none;"></td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%" ><div align="right">Valor Intereses del periodo de Gracia :</div></td>
						<td nowrap width="15%" >
							<eibsinput:text property="e01DLCIGA" name="paybean" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" capslock="true" />
						</td>
						<td nowrap width="22%"><div align="right">Recalcular Fecha Vencimiento :</div></td>
						<td nowrap colspan="2">
							<input type="checkbox" name="AmountSC1" id="AmountSC1" <%= DISABLED_TAG %> value="" onClick="UpdateAmountFlag(this.checked)" <% if (paybean.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%>>
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%" ><div align="right">Valor de la Cuota :</div></td>
						<td nowrap width="22%" >
							<eibsinput:text property="e01DLCVA1" name="paybean" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="amountRecalculate();setRecalculate()" capslock="true" readonly="<%=readOnly%>"  />
						</td>
						<td nowrap width="22%" ><div align="right" >Abono Extraordinario :</div></td>
						<td nowrap colspan="2" >
							<input type="checkbox" name="E01FLGPEX" id="E01FLGPEX" value="" onClick="UpdateAbono(this.checked)" <% if (paybean.getE01FLGPEX().trim().equals("Y")) out.print(" checked ");%> <%=DISABLED_TAG%>> 
						</td>
					</tr>
					<tr id="trclear">
						<td colspan="5">
							<table  style="border: 0px;  margin: 0 auto;  width: 75%; display: <%= ("Y".equals(paybean.getE01DLCFL5()) ? "table" : "none")  %> ;" >
								<tr  height="5%"> </tr>
								<tr  height="5%">
									<td width="100%">
										<table id="headTable" style="width: 100%">
											<tr id="trdark">
												<th nowrap width="16.6%" align="center">Mes</th>
												<th nowrap width="16.6%" align="center">Cuota (UVR)</th>
												<th nowrap width="16.6%" align="center">Mes</th>
												<th nowrap width="16.6%" align="center">Cuota (UVR)</th>
												<th nowrap width="16.6%" align="center">Mes</th>
												<th nowrap width="17%" align="center">Cuota (UVR)</th>
											</tr>
											<tr id="trclear">
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean"  property="e01IDAM01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2" readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM05" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2" readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC05" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM09" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2" readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 17%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC09" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
											</tr>
											<tr id="trclear">
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM06" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC06" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM10" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 17%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC10" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
											</tr>
											<tr id="trclear">
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM07" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC07" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM11" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 17%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC11" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
											</tr>
											<tr id="trclear">
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM08" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC08" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 16.6%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAM12" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true"  capslock="true"  />
													</div>
												</td>
												<td nowrap="nowrap" style="width: 17%">
													<div align="center">
														<eibsinput:text name="paybean" property="e01IDAC12" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true"  capslock="true"  />
													</div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr id="trclear">
						<td colspan="5">
							<div class="outOfTableText" id="AbonoTitle" align="center" style="font-size: small;font-variant: small-caps;display: none">Abono Extraordinario </div>
							<table id="abono" style="border: 0px; height: 110px; width:100%; display: none; margin: 0 auto; ">
								<tr  height="5%">
									<td align="center">
										<table id="headTable" style="width: 300px">
											<tr id="trdark">
												<th nowrap width="10%" align="center">Cuota</th>
												<th nowrap width="15%" align="center">Monto</th>
											</tr>
										</table>
									</td>
								</tr>
								<tr height="95%">
									<td nowrap="nowrap" align="center">
										<div id="dataDiv1" style="height:150px; width: 300px; overflow:auto;">
											<table id="dataTable" style="border-collapse: collapse; border-spacing: 0;border: 0;width: 100%">
												<%   String seq="";
													for (int i=1;i<61;i++) {
													if (i < 10) seq = "0"+i; else seq = ""+i;
													%>
												<tr id="trclear">
													<td nowrap width="10%" align="center">
														<%= i %>
														<input type=text name="<%="E01PENR"+seq%>" size="6" maxlength="5" value="<%=paybean.getFieldString("e01PENR"+seq) %>" onchange="setRecalculate()" <%=READ_ONLY_TAG%>> 
													</td>
													<td nowrap width="15%" align="center">
														<input type=text name="<%="E01PEAM"+seq%>" size="18" maxlength="15" class="txtright" value="<%=paybean.getFieldString("e01PEAM"+seq) %>" onchange="setRecalculate()"  onkeypress=" enterInteger(event)" onblur=" this.value = formatCCY(this.value);setRecalculate()" <%=READ_ONLY_TAG%>> 
													</td>
												</tr>
												<%}%>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	<%}%>
	<!-- SC2 TABLE-->
	<% if (paybean.getE01FLGFPG().equals("2")){%> 
		<tr>
			<td colspan="4">
				<table id="sc2table" style="border-collapse: collapse; border-spacing: 0;border: 0;width: 100%">
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%"><b>Plan 1</b></td>
						<td nowrap width="30%">&nbsp;</td>
						<td nowrap width="20%">&nbsp;</td>
						<td nowrap colspan="2">&nbsp;</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%"><div align="right">Porcentaje Capital :</div></td>
						<td nowrap width="30%"> 
							<input type="text" name="E01DLCOR1" size="4" maxlength="3" value="<%= paybean.getE01DLCOR1().trim()%>" <%=READ_ONLY_TAG%>>% 
						</td>
						<td nowrap width="20%"><div align="right">Valor Capital :</div></td>
						<td nowrap colspan="2">
							<eibsinput:text property="e01DLCPP1" name="paybean" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  capslock="true" readonly="<%=readOnly%>" />
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" height="31"><div align="right">N&uacute;mero de Cuotas :</div></td>
						<td nowrap width="30%" height="31"> 
							<input type="text" name="E01DLCNC1" size="4" maxlength="3" <%=READ_ONLY_TAG%> value="<%= paybean.getE01DLCNC1().trim()%>" onchange="setRecalculate();amountRecalculate(); valTotalCuota();" >
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
						<td nowrap width="20%" height="31"><div align="right">Frecuencia de Pagos :</div></td>
						<td nowrap colspan="2" height="31">
							<input type="text" name="E01DLCFP1" size="4" maxlength="3" <%=READ_ONLY_TAG%> value="<%= paybean.getE01DLCFP1().trim()%>" onchange="setRecalculate();amountRecalculate(); wipeValorCuota();" >
							<select name="E01DLCTP1" onchange="setRecalculate();amountRecalculate(); wipeValorCuota();"  <%=DISABLED_TAG%>>
								<option value=" " <% if (!(paybean.getE01DLCTP1().equals("D") ||paybean.getE01DLCTP1().equals("M")||paybean.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
								<option value="D" <% if(paybean.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
								<option value="M" <% if(paybean.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
								<option value="Y" <% if(paybean.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" ><div align="right">Fecha Proximo Pago : </div></td>
						<td nowrap width="30%" >
							<eibsinput:date name="paybean" fn_month="e01DLCXM1" fn_day="e01DLCXD1" fn_year="e01DLCXY1"  readonly="true" onchange="setRecalculate();amountRecalculate();wipeValorCuota();addDateChangePaymentPlan('E01DLCXD1');" capslock="true"  />
						</td>
						<td nowrap width="20%" > </td>
						<td nowrap colspan="2" ></td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" ><div align="right">Valor de la Cuota :</div></td>
						<td nowrap width="30%" >
							<eibsinput:text property="e01DLCVA1" name="paybean" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate();amountRecalculate();" capslock="true" readonly="<%=readOnly%>" />
						</td>
						<td nowrap width="20%"><div align="right">Recalcular Fecha Vencimiento :</div></td>
						<td nowrap colspan="2">
							<input type="checkbox" name="AmountSC21" id="AmountSC21" <%= DISABLED_TAG%> value="" onClick="UpdateAmountFlag(this.checked)" <% if (paybean.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%>>
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" ><div align="right"></div></td>
						<td nowrap width="30%" >&nbsp; </td>
						<td nowrap width="20%" ><div align="right"></div></td>
						<td nowrap colspan="2" >&nbsp; </td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" ><b>Plan 2</b></td>
						<td nowrap width="30%" >&nbsp;</td>
						<td nowrap width="20%" >&nbsp;</td>
						<td nowrap colspan="2" >&nbsp;</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%"><div align="right">Porcentaje Capital :</div></td>
						<td nowrap width="30%">
							<eibsinput:text property="e01DLCOR2" name="paybean" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>"   capslock="true" readonly="<%=readOnly%>" />% 
						</td>
						<td nowrap width="20%"><div align="right">Valor Capital :</div></td>
						<td nowrap colspan="2">
							<eibsinput:text property="e01DLCPP2" name="paybean" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  capslock="true" readonly="<%=readOnly%>"  />% 
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" height="31"><div align="right">N&uacute;mero de Cuotas :</div></td>
						<td nowrap width="30%" height="31"> 
							<input type="text" name="E01DLCNC2" size="4" maxlength="3" <%=READ_ONLY_TAG%> value="<%= paybean.getE01DLCNC2().trim()%>" onchange="setRecalculate();amountRecalculate(); valTotalCuota();" >
						</td>
						<td nowrap width="20%" ><div align="right">Frecuencia de Pagos :</div></td>
						<td nowrap colspan="2" >
							<input type="text" name="E01DLCFP2" size="4" maxlength="3" <%=READ_ONLY_TAG%> value="<%= paybean.getE01DLCFP2().trim()%>" onchange="setRecalculate();amountRecalculate();wipeValorCuota();" >
							<select name="E01DLCTP2" onchange="setRecalculate();amountRecalculate();wipeValorCuota();" <%=DISABLED_TAG%>>
								<option value=" " <% if (!(paybean.getE01DLCTP2().equals("D") ||paybean.getE01DLCTP2().equals("M")||paybean.getE01DLCTP2().equals("Y"))) out.print("selected"); %>></option>
								<option value="D" <% if(paybean.getE01DLCTP2().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
								<option value="M" <% if(paybean.getE01DLCTP2().equals("M")) out.print("selected");%>>Mes(es)</option>
								<option value="Y" <% if(paybean.getE01DLCTP2().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
							</select>
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" ><div align="right">Fecha Proximo Pago : </div></td>
						<td nowrap width="30%" >
							<eibsinput:date name="paybean" fn_month="e01DLCXM2" fn_day="e01DLCXD2" fn_year="e01DLCXY2" readonly="true" onchange="setRecalculate();amountRecalculate();wipeValorCuota();addDateChangePaymentPlan('E01DLCXD2');" capslock="true" />
						</td>
						<td nowrap width="20%" > </td>
						<td nowrap colspan="2" ></td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" ><div align="right">Valor de la Cuota :</div></td>
						<td nowrap width="30%" >
							<eibsinput:text property="e01DLCVA2" name="paybean" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate();amountRecalculate();" capslock="true" readonly="<%=readOnly%>"  />
						</td>
						<td nowrap width="20%"><div align="right">Recalcular Fecha Vencimiento :</div></td>
						<td nowrap colspan="2">
							<input type="checkbox" name="AmountSC22" id="AmountSC22" <%= DISABLED_TAG %> value="" onClick="UpdateAmountFlag(this.checked)" <% if (paybean.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%>>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	<% } %>  
	<!-- MATURITY TABLE-->
	<% if (paybean.getE01FLGFPG().equals("M")) { %> 
		<tr>
			<td colspan="4">
				<table id="mattable" style="border-collapse: collapse; border-spacing: 0;border: 0;width: 100%"  >
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%"><div align="right">Ciclo Pago de Intereses :</div></td>
						<td nowrap width="15%">
							<input type="text" name="E01DEAIPD" maxlength="3" size="4" <%=READ_ONLY_TAG%> value="<%=paybean.getE01DEAIPD().trim()%>" class="TXTRIGHT" >
						</td>
						<td nowrap width="22%"><div align="right">Pr&oacute;xima Fecha de Pago :</div></td>
						<td nowrap colspan="2">
							<eibsinput:date name="paybean" fn_month="e01DEARDM" fn_day="e01DEARDD" fn_year="e01DEARDY"  onchange="setRecalculate();wipeValorCuota()" required="true"  capslock="true" readonly="<%=readOnly%>" />
						</td>
					</tr>
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="33%"><div align="right">Ciclo Pago Capital :</div></td>
						<td nowrap width="15%">
							<input type="text" name="E01DEAPPD" maxlength="3" size="4" <%=READ_ONLY_TAG%> value="<%=paybean.getE01DEAPPD().trim()%>" class="TXTRIGHT" >
						</td>
						<td nowrap width="22%"><div align="right"></div></td>
						<td nowrap colspan="2">&nbsp; </td>
					</tr>
				</table>
			</td>
		</tr>
	<% } %>
	</table>

<% } %>

<% if (paybean.getE01FLGFPG().equals("S") && !paybean.getH01FLGWK1().equals("")) { %> 
<% session.setAttribute("EMPPP", "S"); %>
<iframe id="ifremppp" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155?SCREEN=2&E01DEAACC=<%=userPO.getAccNum()%>"></iframe>
<% } %>
