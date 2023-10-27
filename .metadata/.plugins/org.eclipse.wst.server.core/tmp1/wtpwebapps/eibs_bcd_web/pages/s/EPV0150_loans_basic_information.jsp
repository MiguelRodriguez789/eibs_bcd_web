<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import = "datapro.eibs.master.*" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.eibs.constants.StyleID"%>

<html> 
<head>
<title>Apertura de Creditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EPV015001Message" scope="session" /> 
<jsp:useBean id="msg" class="datapro.eibs.beans.ECO004001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-opening.jsp"> </SCRIPT>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-paymentplan.jsp"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>

<SCRIPT type="text/javascript">
<%	if (userPO.getPurpose().equals("MAINTENANCE") && !lnBasic.getE01DEAACC().trim().equals("999999999999")){%>
			builtNewMenu(pv_m_opt);
			initMenu();
<% } %>


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
		
	boolean isDEAIPDNum = true;
	boolean isDEAPPDNum = true;
	boolean isNewLoan = true;
	String DEAIPD = lnBasic.getE01DEAIPD().trim();
	String DEAPPD = lnBasic.getE01DEAPPD().trim();
	String FLGDED = lnBasic.getE01FLGDED().trim();
	String FLGREF = lnBasic.getE01FLGREF().trim();
	String FLGPAY = lnBasic.getE01FLGPAY().trim();
	String FLGCOL = lnBasic.getE01FLGCOL().trim();
	String FLGNEW = lnBasic.getE01FLGNEW().trim();
	String ASSEST = lnBasic.getE01FLGACT().trim();
	String FLGFND = lnBasic.getE01FLGFND().trim();
	String FLGSBS = lnBasic.getE01FLGSBS().trim();
	String FLGDIA = lnBasic.getE01DLCFL5().trim();
	String FLGPMT = lnBasic.getE01FLGPMT().trim();
 
	//isNewLoan = "N".equals(FLGNEW);
	
	userPO.setHeader20("");
	
	int num;
	try {
		num = Integer.parseInt(DEAIPD);
	} catch (Exception e) {
		isDEAIPDNum = false;
	}
	try {
		num = Integer.parseInt(DEAPPD);
	} catch (Exception e) {
		isDEAPPDNum = false;
	}

%>

<h3 align="center"> Informaci&oacute;n de Credito - <%=lnBasic.getE01DSCPRO()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="loans_basic_information.jsp, EPV0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0150" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="301">
	<INPUT TYPE=HIDDEN NAME="editCntrl" id="editCntrl" VALUE="<%=userPO.getHeader4()%>">
	<INPUT TYPE=HIDDEN NAME="H01FLGMAS" id="H01FLGMAS" VALUE="<%=lnBasic.getH01FLGMAS()%>">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="<%=lnBasic.getH01FLGWK1()%>">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK3" id="H01FLGWK3" VALUE="<%=lnBasic.getH01FLGWK3()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=lnBasic.getE01DEAACD().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAACC" id="E01DEAACC" VALUE="<%=lnBasic.getE01DEAACC().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01PFNPAC" id="E01PFNPAC" VALUE="<%=lnBasic.getE01PFNPAC().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01OLDOAM" id="E01OLDOAM" VALUE="<%=lnBasic.getE01OLDOAM().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGDED" id="E01FLGDED" VALUE="<%=lnBasic.getE01FLGDED().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGREF" id="E01FLGREF" VALUE="<%=lnBasic.getE01FLGREF().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGPAY" id="E01FLGPAY" VALUE="<%=lnBasic.getE01FLGPAY().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGCOL" id="E01FLGCOL" VALUE="<%=lnBasic.getE01FLGCOL().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGRCL" id="E01FLGRCL" VALUE="<%=lnBasic.getE01FLGRCL().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGNEW" id="E01FLGNEW" VALUE="<%=lnBasic.getE01FLGNEW().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFVE" id="E01FLGFVE" VALUE="<%=lnBasic.getE01FLGFVE().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFND" id="E01FLGFND" VALUE="<%=lnBasic.getE01FLGFND().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGSBS" id="E01FLGSBS" VALUE="<%=lnBasic.getE01FLGSBS().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGACT" id="E01FLGACT" VALUE="<%=lnBasic.getE01FLGACT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFLT" id="E01FLGFLT" VALUE="<%=lnBasic.getE01FLGFLT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01PLGFLT" id="E01PLGFLT" VALUE="<%=lnBasic.getE01PLGFLT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DLCFL5" id="E01DLCFL5" VALUE="<%=lnBasic.getE01DLCFL5().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAGLN" id="E01DEAGLN" VALUE="<%=lnBasic.getE01DEAGLN().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGCNV" id="E01FLGCNV" VALUE="<%=lnBasic.getE01FLGCNV().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGCHG" id="E01FLGCHG" VALUE="<%=lnBasic.getE01FLGCHG().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPSU" id="E01DEAPSU" VALUE="<%=lnBasic.getE01DEAPSU().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01RDM" id="E01RDM" VALUE="<%=currUser.getE01RDM().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01RDD" id="E01RDD" VALUE="<%=currUser.getE01RDD().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01RDY" id="E01RDY" VALUE="<%=currUser.getE01RDY().trim()%>">

<% if(!isDEAIPDNum){ %>
	<INPUT TYPE=HIDDEN NAME="E01DEAPPD" id="E01DEAPPD" VALUE="<%=lnBasic.getE01DEAPPD().trim()%>">
<% } %>  
<% if(!isDEAPPDNum){ %>
	<INPUT TYPE=HIDDEN NAME="E01DEAIPD" id="E01DEAIPD" VALUE="<%=lnBasic.getE01DEAIPD().trim()%>">
<% } %>  

	
	<%int row = 0; %>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%" > 
							<div align="left">
								<eibsinput:text property="E01DEACUN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E01CUSNA1" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01DEATYP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
								<eibsinput:text property="E01DEAPRO" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly value="<% if (lnBasic.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(lnBasic.getE01DEAACC().trim()); %>">
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Propuesta :</b></div></td>
						<td nowrap width="35%"> 
							<table border="0" cellspacing="0" >
								<tr>
									<td><div align="left">
										<eibsinput:text property="E01DEAOFN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
									</div></td>
									<td><div align="right"><b>&nbsp;&nbsp;Moneda : </b></div></td>
									<td><div align="left">
										<eibsinput:text property="E01DEACCY" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
									</div></td>
								</tr>
							</table>
						</td>
						<td nowrap width="10%"><div align="right"><b>Nota Interna :</b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E01NOTINT" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
 </table>

	<% if (lnBasic.getE01DEACLF().equals("S")) { %>
	<!-- Creditos Avalados -->
	<% session.setAttribute("EMPAV","S"); %>
	<iframe id="ifrempav" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1140?SCREEN=101&ACT=N&E01PVTCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PVTNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>  
	<% } %>

	<% if (("Y".equals(ASSEST)) && (!lnBasic.getE01DEACLF().equals("S"))) { %>
	<h4>Cotitulares/Avales</h4>
	<table id="mainTable" class="tableinfo" style="height:106px;">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="98%">
					<tr id="trdark">
						<th nowrap width="15%" align="center">Nro Cliente</th>
						<th nowrap width="45%" align="center">Nombre</th>
						<th nowrap width="15%" align="center">Identificacion</th>
						<th nowrap width="10%" align="center">Relacion</th>
						<th nowrap width="15%" align="center">Porcentaje</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:106px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   for (int i=1;i<10;i++) {
					%> 
						<tr id="trclear"> 
							<td nowrap width="15%" align="center"> 
								<%= i %>
								<input type=text name="<%="E01TACUN"+i%>" size="10" maxlength="9" value="<%=lnBasic.getFieldString("E01TACUN"+i) %>" class="context-menu-help" onmousedown="init(custdescidHelp,this.name,'','','E01TANME<%= i %>','E01TAIDN<%= i %>','')" onKeyPress="enterInteger(event)" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("readonly");%> >	
							</td>
							<td nowrap width="45%" align="center"> 
								<input type="text" name="<%="E01TANME"+i %>" size="60" maxlength="60" value="<%=lnBasic.getFieldString("E01TANME"+i) %>" readonly> 
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E01TAIDN"+i %>" size="28" maxlength="25" value="<%=lnBasic.getFieldString("E01TAIDN"+i) %>" readonly>  
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E01TAREL"+i %>" size="2" maxlength="1" value="<%=lnBasic.getFieldString("E01TAREL"+i) %>" class="context-menu-help" onmousedown="init(accholdersHelp,this.name,'','','','','')" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("readonly");%> >  
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" class="txtright" name="<%="E01TAPRC"+i %>" size="7" maxlength="6" value="<%=lnBasic.getFieldString("E01TAPRC"+i) %>" onKeyPress="enterInteger(event)" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("readonly");%> >  
							</td>
						</tr> 
					<% } %>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<% } %>

	<!-- 	Datos Basicos de la Operacion -->
	<h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4> 
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table id="tableBasicInfo" class="mainInfo4Col" >
					<tr>
						<td>Fecha de Apertura : </td>
						<td>
							<eibsinput:date name="lnBasic" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" onclick="setRecalculate()" onchange="setRecalculate();wipeFecha();wipeValorCuota();" readonly="${lnBasic.E01FLGNEW != 'N'}"/> 
						</td>
						<td>T&eacute;rmino o Plazo : </td>
						<td> 
							<input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>" onchange="setRecalculate()" readonly="${lnBasic.E01FLGNEW != 'N'}" onkeypress="enterInteger(event)">
							<select name="E01DEATRC" id="E01DEATRC" onchange="setRecalculate()" disabled="${lnBasic.E01FLGNEW != 'N'}">
								<option value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
								<option value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
								<option value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
								<option value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
							</select>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
					</tr>
					<tr>
						<td>Fecha de Vencimiento : </td>
						<td> 
							<eibsinput:date name="lnBasic"  fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY" required="True" onchange="setRecalculate()" readonly="${lnBasic.E01FLGNEW != 'N'}"/> 
						</td>
						<td>Tabla Tasa Flotante : </td>
						<td> 	
							<eibsinput:help name="lnBasic" readonly="${lnBasic.E01FLGNEW != 'N'}" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" fn_param_one="E01DEAFTB" fn_param_two="E01FLGFLT" fn_param_three="E01FLTDSC" fn_param_four="PRIMARYRATE" fn_param_five="SECONDARYRATE" fn_param_six="E01DEAFTY" property="E01DEAFTB" help="<%=HelpTypes.FLOATING_RATE_TABLES%>" onchange="activeProduct.rateDisplay(); activeProduct.chgRate(); setRecalculate();" /> 
							<select name="E01DEAFTY" id="E01DEAFTY" onchange="activeProduct.rateDisplay(); activeProduct.chgRate(); setRecalculate();" disabled="${lnBasic.E01FLGNEW != 'N'}"> 
								<option value=" " <% if (!(lnBasic.getE01DEAFTY().equals("FP") ||lnBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
								<option value="FP" <% if (lnBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
								<option value="FS" <% if (lnBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
							</select>
						</td>
					</tr>
					<tr id="FLOATINGTABLE2" style="display: none">
						<td>Descripcion Tabla Flotante : </td>
						<td> 
							<eibsinput:text property="E01FLTDSC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
						</td>
						<td>Tasa Flotante Base : </td>
						<td> 
							<% if (lnBasic.getE01FLGFLT().equals("2")) { %>
							<input TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=lnBasic.getE01FLTORG().trim()%>">
							<input TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=lnBasic.getE01FLTORG().trim()%>">
							<% } else { %>
							<input TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=lnBasic.getE01FLTRTE().trim()%>">
							<input TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=lnBasic.getE01FLTRTE().trim()%>">
							<% } %>
							<eibsinput:text property="E01FLTORG" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
						</td>
					</tr>
					<tr id="FLOATINGTABLE" style="display: none"> 
						<td> Manejo Puntos Adicional  : </td>
						<td> 
							<select name="E01DEAFLX" id="E01DEAFLX" onclick="setRecalculate()" disabled="${lnBasic.E01FLGNEW != 'N'}" >
								<option value=" " <% if (!(lnBasic.getE01DEAFLX().equals("B") ||lnBasic.getE01DEAFLX().equals("E")||lnBasic.getE01DEAFLX().equals("N"))) out.print("selected"); %>></option>
								<option value="B" <% if(lnBasic.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</option>
								<option value="E" <% if(lnBasic.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</option>
								<option value="N" <% if(lnBasic.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</option>
							</select>
						</td>
						<td>Valor Tasa Adicional : </td>
						<td> 
							<eibsinput:text property="E01DEARTX" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" onchange="setRecalculate();" readonly="${lnBasic.E01FLGNEW != 'N'}"/>
						</td>
					</tr>
					<% if (!("N".equals(FLGNEW))){ %>
					<tr>
						<td>Monto Original : </td>
						<td> 
							<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>  
						</td>
						<td></td>
						<td nowrap></td>
					</tr>
					<% } %>
					<tr>
						<td>Clase de Cr&eacute;dito : </td>
						<td> 
							<input type="text" name="E01DEACLF" id="E01DEACLF" size="2" maxlength="1" value="<%= lnBasic.getE01DEACLF().trim()%>" readonly >
							<%--
							<a href="javascript:GetClassCred('E01DEACLF','STATIC_ln_cred_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
							--%>
						</td>
						<td>Tasa Flotante : </td>
						<td> 
							<eibsinput:text property="E01FLTRTE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" onchange="setRecalculate();"/>  
						</td>
					</tr>
					<tr>
						<td>Tipo de Inter&eacute;s :  </td>
						<td> 
							<input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= lnBasic.getE01DEAICT().trim()%>" onchange="setRecalculate();typeOfInterest(this)">
							<a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" onclick="setRecalculate()"></a>
						</td>
						<td>Tasa Interes/Spread :    </td>
						<td> 
							<eibsinput:text property="E01DEARTE" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" readonly="${lnBasic.E01FLGNEW != 'N'}" onchange="activeProduct.rateDisplay(); activeProduct.chgRate(); setRecalculate();" />
							<b>&nbsp; &nbsp;Tasa Futuros</b>
							<a href="javascript: goFutureRates('false')"><img id="futureRates" src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr>
						<td>Tasa Efectiva Anual : </td>
						<td> 
							<eibsinput:text property="E01DEASPR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" onchange="setRecalculate(); activeProduct.chgEfRate()" readonly="${lnBasic.E01FLGNEW != 'N'}"/>
						</td>
						<td>Tasa Nominal del Prestamo : </td>
						<td> 
							<eibsinput:text property="E01LNSRTE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
						</td>
					</tr>
					<tr>
						<td>Per&iacute;odo Base : </td>
						<td> 
							<eibsinput:text property="E01DEABAS" name="lnBasic" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()"/>
						</td>
						<td>Tasa M&iacute;nima Permitida : </td>
						<td> 
							<eibsinput:text property="E01DEAMIR" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true"/>
						</td>
					</tr>
					<tr>
						<td>C&aacute;lculo  Interes Normal : </td>
						<td> 
							<input type="text" name="E01DEAIFL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAIFL().trim()%>" onchange="setRecalculate()">
							<a id="linkHelp" href="javascript:lnGetOver('E01DEAIFL','STATIC_ln_prov.jsp')" onclick="setRecalculate()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" ></a> 
						</td>
						<td>Tasa M&aacute;xima Permitida : </td>
						<td> 
							<eibsinput:text property="E01DEAMXR" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true"/>
						</td>
					</tr>
					<% if (currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) { %>
					<tr>
						<td></td>
						<td></td>
						<td>Tasa CAE : </td>
						<td> 
							<eibsinput:text property="E01DLCRT3" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>
					</tr>
					<% } %>
					<tr>
						<td>C&aacute;lculo  Interes de Mora : </td>
						<td> 
							<input type="text" name="E01DEAPCL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPCL().trim()%>" onchange="setRecalculate()">
							<a href="javascript:lnGetOver('E01DEAPCL','STATIC_ln_mor.jsp')" onclick="setRecalculate()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" ></a>
						</td>
						<td>Tasa o Cargo por Mora : </td>
						<td> 
							<input type="text" class="txtright" name="E01DEAPEI" size="8" maxlength="7" value="<%= lnBasic.getE01DEAPEI().trim()%>" >
							<input type="text" name="E01DEAPIF" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPIF().trim()%>" >
							<a id="linkHelp" href="javascript:lnGetFact('E01DEAPIF','STATIC_ln_fact.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" ></a> 
						</td>
					</tr>
					<tr>
						<td>L&iacute;nea de Cr&eacute;dito : </td>
						<td> 
							<input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= lnBasic.getE01DEACMC().trim()%>" >
							<input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= lnBasic.getE01DEACMN().trim()%>" >
							<a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"></a> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td>
						<td>Centro de Costo : </td>
						<td> 
							<input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= lnBasic.getE01DEACCN().trim()%>">
							<a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr>
						<td>Banco/Sucursal : </td>
						<td> 
							<eibsinput:text property="E01DEABNK" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
							<eibsinput:help fn_param_one="E01DEABRN" fn_param_two="document.forms[0].E01DEABNK.value" property="E01DEABRN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"/>
						</td>
						<td>Numero Referencia : </td>
						<td> 
							<eibsinput:text property="E01DEAREF" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_REFERENCE %>"/> 
						</td>
					</tr>
					<tr>
						<td>Tabla Tasas Matriz : </td>
						<td> 
							<input type="text" name="E01DEARTB" size="3" maxlength="2" value="<%= lnBasic.getE01DEARTB().trim() %>">
							<a id="linkHelp" href="javascript:GetRateTable('E01DEARTB','P')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
						</td>
						<td>Tabla de Parametros : </td>
						<td> 
							<input type="text" name="E01DEATLN" size="3" maxlength="2" value="<%= lnBasic.getE01DEATLN().trim()%>">
							<a href="javascript:GetLoanTable('E01DEATLN',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr>
						<td>Uso de Domicilio : </td>
						<td> 
							<select name="E01DEAWHF" id="E01DEAWHF" >
								<option value=" " <% if (!(lnBasic.getE01DEAWHF().equals("R") || lnBasic.getE01DEAWHF().equals("C") || lnBasic.getE01DEAWHF().equals("O"))) out.print("selected"); %>></option>
								<option value="R" <% if (lnBasic.getE01DEAWHF().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
								<option value="C" <% if (lnBasic.getE01DEAWHF().equals("C")) out.print("selected"); %>>Correo Eléctronico</option>
								<option value="O" <% if (lnBasic.getE01DEAWHF().equals("O")) out.print("selected"); %>>Oficina del Banco</option>
							</select> 
							<input type="text" name="E01DEAMLA" id="E01DEAMLA" size="3" maxlength="2" value="<%= lnBasic.getE01DEAMLA().trim()%>">
							<a href="javascript:GetMailing('E01DEAMLA',document.getElementById('E01DEACUN').value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
						</td>
						<td>Tabla de Cargos : </td>
						<td> 
							<input type="text" name="E01DEAOFT" id="E01DEAOFT" size="3" maxlength="2" value="<%= lnBasic.getE01DEAOFT().trim()%>">
							<a href="javascript:GetLoanChargeTable('E01DEAOFT',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
							<b>&nbsp; &nbsp; Personalizar</b>
							<a id="linkHelp" href="javascript: setComissionTable('false')"><img id="comissionTable" src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr>
					<td>Condici&oacute;n  Cr&eacute;dito : </td>
						<td> 
							<input type="text" name="E01DEADLC" size="2" maxlength="1" value="<%=lnBasic.getE01DEADLC() %>">
							<a href="javascript:GetCondicionesCode('E01DEADLC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
						</td> 
						<td>Per&iacute;odo de Gracia : </td>
						<td> 
							<input type="text" name="E01DEAGPD" size="3" maxlength="2" value="<%= lnBasic.getE01DEAGPD().trim()%>" >
						</td>
					</tr>
					<tr>
						<td>Ciclo Revisi&oacute;n de Tasa : </td>
						<td> 
							<input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= lnBasic.getE01DEARRP().trim()%>">
							<a href="javascript:GetCode('E01DEARRP','STATIC_cycle_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
						<td>Fecha Revisi&oacute;n de Tasa : </td>
						<td> 
							<eibsinput:date name="lnBasic"  fn_month="E01DEARRM" fn_day="E01DEARRD" fn_year="E01DEARRY" /> 
						</td>
					</tr>
					<tr>
						<td>Ciclo Envio Estado de Cuenta : </td>
						<td> 
							<input type="text" name="E01DEASTC" size="3" maxlength="3" value="<%= lnBasic.getE01DEASTC().trim()%>">
						</td>
						<td>Fecha Envio Estado de Cuenta : </td>
						<td> 
							<eibsinput:date name="lnBasic" fn_month="E01DEAEDM" fn_day="E01DEAEDD" fn_year="E01DEAEDY" /> 
						</td>
					</tr>
					<tr>
						<td> Ciclo Revisi&oacute;n del Prestamo : </td>
						<td> 
							<input type="text" name="E01DLCRVC" size="3" maxlength="3" value="<%= lnBasic.getE01DLCRVC().trim()%>">
							<select name="E01DLCRVT" id="E01DLCRVT" >
								<option value=" " <% if (!(lnBasic.getE01DLCRVT().equals("D") ||lnBasic.getE01DLCRVT().equals("M")||lnBasic.getE01DLCRVT().equals("Y"))) out.print("selected"); %>></option>
								<option value="D" <% if(lnBasic.getE01DLCRVT().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
								<option value="M" <% if(lnBasic.getE01DLCRVT().equals("M")) out.print("selected");%>>Mes(es)</option>
								<option value="Y" <% if(lnBasic.getE01DLCRVT().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
							</select>
						</td>
						<td>Fecha Revisi&oacute;n del Prestamo : </td>
						<td> 
							<eibsinput:date name="lnBasic"  fn_month="E01DLCRDM" fn_day="E01DLCRDD" fn_year="E01DLCRDY" /> 
						</td>
					</tr>
					<tr>
						<td>Tipo de Relacion 1 : </td>
						<td> 
							<input type="text" name="E01DEAPAR" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPAR().trim()%>">
							<a href="javascript:GetRel1('E01DEAPAR','STATIC_ln_rel1.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
						<td>Cuenta  Relacion 1 : </td>
						<td> 
							<input type="text" name="E01DEAPAC" size="12" maxlength="12" value="<%= lnBasic.getE01DEAPAC().trim()%>">
							<a href="javascript:GetAccount('E01DEAPAC',document.forms[0].E01DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr>
						<td>Tipo de Relacion 2 : </td>
						<td> 
							<input type="text" name="E01DEARET" size="2" maxlength="1" value="<%= lnBasic.getE01DEARET().trim()%>">
							<a href="javascript:GetRel2('E01DEARET','STATIC_ln_rel2.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a></td>
						<td>Cuenta  Relacion 2 : </td>
						<td> 
							<input type="text" name="E01DEAREA" size="12" maxlength="12" value="<%= lnBasic.getE01DEAREA().trim()%>">
							<a href="javascript:GetAccount('E01DEAREA',document.forms[0].E01DEABNK.value,'10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
						</td>
					</tr>  
					<tr>
						<td>Informa x Reestructuraci&oacute;n : </td>
						<td> 
							<input type="radio" id="E01DEAFLY" name="E01DEAFLY" value="Y" <%if (lnBasic.getE01DEAFLY().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" id="E01DEAFLY" name="E01DEAFLY" value="N" <%if (lnBasic.getE01DEAFLY().equals("N")) out.print("checked"); %>> No
						</td>
						<td>Acci&oacute;n Sobre Cambio Tasa : </td>
						<td>
							<select name="E01DEAXRF" id="E01DEAXRF">
								<option value=""></option>
								<option value="T" <%if (lnBasic.getE01DEAXRF().equals("T")) { out.print("selected"); }%>>Cambiar el Plazo</option>
								<option value="P" <%if (lnBasic.getE01DEAXRF().equals("P")) { out.print("selected"); }%>>Cambiar la Cuota</option>
							</select>
						</td>
					</tr> 
					<tr>
						<td>Fuente de Recurso : </td>
						<td> 
							<eibsinput:cnofc name="lnBasic" flag="RS" property="E01DEAUC7" fn_code="E01DEAUC7" fn_description="" required="true"/>
						</td>
						<td>N&uacute;mero de Pagar&eacute; : </td>
						<td>
							<input type="text" name="E01DEAIVC" size="14" maxlength="12" value="<%= lnBasic.getE01DEAIVC().trim()%>">				
						</td>
					</tr> 
					<tr>
						<td>Fecha de Suscripci&oacute;n : </td>
						<td> 
							<eibsinput:date name="lnBasic" fn_year="E01DEAPSY" fn_month="E01DEAPSM" fn_day="E01DEAPSD" required="true"/>
						</td>
						<td> Abierto o Cerrado : </td>
						<td>
							<input type="radio" id="E01DEAF07" name="E01DEAF07" value="Y" <%if (!lnBasic.getE01DEAF07().equals("N")) out.print("checked"); %>> Abierto 
							<input type="radio" id="E01DEAF07" name="E01DEAF07" value="N" <%if (lnBasic.getE01DEAF07().equals("N"))  out.print("checked"); %>> Cerrado
						</td>
					</tr>     
					<tr>
						<td>Indice Cobertura de la Garantía :</td>
						<td nowrap> 
							<input type="text" class="txtright" name="E01DEAA01" size="10" maxlength="9" value="<%= lnBasic.getE01DEAA01().trim()%>">
						</td>
						<td>Tasa de Cambio M/E : </td> 
						<td> 
							<eibsinput:text property="E01DEAEXR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE%>" />
						</td>
					</tr>   
					<% if (currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CO"))) { %>          
					<tr>
						<td> Registra FG : </td> <!-- FNG -->
						<td nowrap> 
							<input type="radio" name="E01DLCFL6" value="Y" <%if (lnBasic.getE01DLCFL6().equals("Y"))  out.print("checked"); %> onchange="setRecalculate();setFNG(this.value);" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("disabled");%> > Si 
							<input type="radio" name="E01DLCFL6" value="N" <%if (!lnBasic.getE01DLCFL6().equals("Y")) out.print("checked"); %> onchange="setRecalculate();setFNG(this.value);" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("disabled");%> > No
						</td>
						<td>
							<div id="fngTD1" style="display: <%= lnBasic.getE01DLCFL6().equals("Y") ? "" : "none" %>">Numero de Reserva : </div>
						</td>
						<td >
							<div id="fngTD2" style="display: <%= lnBasic.getE01DLCFL6().equals("Y") ? "" : "none" %>">
								<eibsinput:text property="E01DLCRF1" maxlength="12" size="14" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" readonly="${lnBasic.E01FLGNEW != 'N'}" />
								<% if (("N".equals(FLGNEW))) { %>
								<a href="javascript:GetReserva('E01DLCRF1','','RS','<%=lnBasic.getE01DEACUN().trim()%>','','<%=lnBasic.getE01DEACUN().trim()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
								<% } %>
							</div>
						</td>
					</tr> 
					<% } %>
					<tr>
						<td>Referido por:</td>
						<td nowrap> 
							<input type="text" name="E01CMOREF" size="12" maxlength="10" value="<%= lnBasic.getE01CMOREF().trim()%>" onkeypress="enterInteger(event)">
							<a href="javascript:GetCustomer('E01CMOREF')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a>
						</td>
						<td>Amort. Nic 39 : </td>
						<td> 
							<eibsinput:help fn_param_one="E01DEABRK" fn_param_three="S" property="E01DEABRK" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER %>" />
						</td>
					</tr>   	
					<% if (lnBasic.getE01DEACLF().equals("H")) { %>
					<tr>
						<td>Valor de la Vivienda : </td>
						<td> 
							<eibsinput:text property="E01DLCVVI" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" /> 
						</td>
						<td>Aplica Renta Exenta : </td>
						<td> 
							<input type="radio" id="E01DLCFRE" name="E01DLCFRE" value="Y" <%if (lnBasic.getE01DLCFRE().equals("Y")) out.print("checked"); %>> Si 
							<input type="radio" id="E01DLCFRE" name="E01DLCFRE" value="N" <%if (lnBasic.getE01DLCFRE().equals("N")) out.print("checked"); %>> No
						</td>
					</tr>
					<% } %>   
					<% if (lnBasic.getE01DEACLF().equals("S")) { %>
					<tr>
						<td>Entidad Avaladora : </td>
						<td nowrap colspan="3" > 
							<eibsinput:help name="lnBasic" fn_param_one="E01DLCCAV" fn_param_two="E01DSCCAV" fn_param_three="L" property="E01DLCCAV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" />
							<eibsinput:text name="lnBasic" property="E01DSCCAV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" />
						</td>
					</tr>
					<% } %>  
					<% if (currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CO"))) { %>          
					<tr>
						<td>Credito Milagroso : </td>
						<td nowrap> 
							<%--
							<input type="radio" name="E01DLCFL9" value="Y" <%if (lnBasic.getE01DLCFL9().equals("Y"))  out.print("checked"); %> onchange="setRecalculate();setMLG(this.value);" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("disabled");%> > Si
							<input type="radio" name="E01DLCFL9" value="N" <%if (!lnBasic.getE01DLCFL9().equals("Y")) out.print("checked"); %> onchange="setRecalculate();setMLG(this.value);" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("disabled");%> > No
							--%>
							<input type="radio" name="E01DLCFL9" value="Y" <%if (lnBasic.getE01DLCFL9().equals("Y"))  out.print("checked"); %> onchange="setRecalculate();setMLG(this.value);" > Si
							<input type="radio" name="E01DLCFL9" value="N" <%if (!lnBasic.getE01DLCFL9().equals("Y")) out.print("checked"); %> onchange="setRecalculate();setMLG(this.value);" > No
						</td>
						<td>
							<div id="mlgTD1" style="display: <%= lnBasic.getE01DLCFL9().equals("Y") ? "" : "none" %>">Tasa de Beneficio : </div>
						</td>
						<td >
							<div id="mlgTD2" style="display: <%= lnBasic.getE01DLCFL9().equals("Y") ? "" : "none" %>">
								<eibsinput:text property="E01BNFRTE" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="true" onchange="activeProduct.rateDisplay(); activeProduct.chgRate(); setRecalculate();" />
								<b>&nbsp; &nbsp;Tasa Milagrosa</b>
								<a href="javascript: goMilagrosoRates('false')"><img id="milagrosoRates" src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
							</div>
						</td>
					</tr>
					<tr>
						<td>Crear Cuenta Ahorro: </td>
						<td nowrap> 
							<input type="radio" name="E01FLGCRT" value="Y" <%if ( lnBasic.getE01FLGCRT().equals("Y")) out.print("checked"); %> onchange="setCta(this.value);" > Si
							<input type="radio" name="E01FLGCRT" value="N" <%if (!lnBasic.getE01FLGCRT().equals("Y")) out.print("checked"); %> onchange="setCta(this.value);" > No
							<a href="javascript:GetAccByClient('E01NEWACC','','RT','',document.forms[0].E01DEACUN.value)"><img id="ctaHLP" style="display: none" src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
						</td>
						<td>
							<div id="ctaTD1" style="display: <%= lnBasic.getE01FLGCRT().equals("Y") ? "" : "none" %>">Tipo Cuenta : </div>
						</td>
						<td >
							<div id="ctaTD2" style="display: <%= lnBasic.getE01FLGCRT().equals("Y") ? "" : "none" %>">
								<input type="text" name="E01PRODUC" size="5" maxlength="4" value="<%= lnBasic.getE01PRODUC() %>" >
								<a href="javascript:GetProduct('E01PRODUC','04','<%=currUser.getE01UBK()%>','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a>
								<input type="text" name="E01NEWACC" size="12" maxlength="12" value="<%= lnBasic.getE01NEWACC().trim()%>" onchange="crearAcc('N');;">
								<a href="javascript:crearAcc('N')"><img id="asignarAcc" src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
							</div>
						</td>
					</tr>
					<tr>
						<td>Novaci&oacute;n : </td>
						<td nowrap> 
							<input type="radio" name="E01DEAECU" value="Y" <%if (lnBasic.getE01DEAECU().equals("Y"))  out.print("checked"); %> onchange="setDesembolso(this.value);" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("disabled");%> > Si 
							<input type="radio" name="E01DEAECU" value="N" <%if (!lnBasic.getE01DEAECU().equals("Y")) out.print("checked"); %> onchange="setDesembolso(this.value);" <%if (!lnBasic.getE01FLGNEW().equals("N")) out.print("disabled");%> > No
						</td>
						<td></td>
						<td></td>
					</tr>
					<tr id="trNovacion" style="display: none">
						<td>Tipo Novaci&oacute;n : </td>
						<td nowrap> 
							<input type="text" name="E01DLCTPR" size="3" maxlength="2" value="<%= lnBasic.getE01DLCTPR().trim()%>"   >
							<a href="javascript:GetCodeDescCNOFC('E01DLCTPR', 'E01DSCTPR','RY')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
							<eibsinput:text name="lnBasic" property="E01DSCTPR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
						</td>
						<td>Condici&oacute;n Novaci&oacute;n : </td>
						<td nowrap> 
							<input type="text" name="E01DLCCDR" size="3" maxlength="2" value="<%= lnBasic.getE01DLCCDR().trim()%>"   >
							<a href="javascript:GetCodeDescCNOFC('E01DLCCDR', 'E01DSCCDR','RO')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
							<eibsinput:text name="lnBasic" property="E01DSCCDR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
						</td>
					</tr>
					<% } %> 
					<% if (!("N".equals(FLGNEW))){ %>
					<tr>
						<td>Concurso Acreedores : </td>
						<td>
							<input type="text" name="E01DLCCAC" size="3" maxlength="2" value="<%= lnBasic.getE01DLCCAC().trim()%>"   >
							<a href="javascript:GetCodeDescCNOFC('E01DLCCAC', 'E01DSCCAC','AS')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
							<eibsinput:text name="lnBasic" property="E01DSCCAC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
						</td>
						<td>Codigo Acuerdo Informal : </td>
						<td> 
							<input type="text" name="E01DLCCAI" size="3" maxlength="2" value="<%= lnBasic.getE01DLCCAI().trim()%>"   >
							<a href="javascript:GetCodeDescCNOFC('E01DLCCAI', 'E01DSCCAI','AI')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
							<eibsinput:text name="lnBasic" property="E01DSCCAI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
						</td>
					</tr>
					<% } %> 
				</table>
			</td>
		</tr>	
	</table>
	
	<% if ("Y".equals(FLGSBS)) { %>
	<H4>Subsidio</H4>
	<table  class="tableinfo" >
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Entidad : </div></td>
						<td nowrap width="75%">
							<eibsinput:help name="lnBasic" fn_param_one="E01DLCCFS" fn_param_two="E01DSCCFS" fn_param_three="F" property="E01DLCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" onchange="changeEntity()" />
							<eibsinput:text name="lnBasic" property="E01DSCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>"  />
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Tasa Subsidio : </div></td>
						<td nowrap width="75%">
							<eibsinput:text name="lnBasic" property="E01DLCRFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" onchange="goSubsidizedRate();"/>
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Tasa Efectiva Subsidio : </div></td>
						<td nowrap width="75%">
							<eibsinput:text name="lnBasic" property="E01DLCRXS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Referencia Subsidio: </div></td>
						<td nowrap width="75%">
							<eibsinput:text name="lnBasic" property="E01DLCNRS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="12" maxlength="12" />
						</td>
					</tr> 
					<% if (!("N".equals(FLGNEW))) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Terminaci&oacute;n Por : </div></td>
						<td nowrap width="75%">
							<select name="E01DLCFFS" id="E01DLCFFS">
								<option value=" " <% if (!(lnBasic.getE01DLCFFS().equals("1") || lnBasic.getE01DLCFFS().equals("2")||lnBasic.getE01DLCFFS().equals("3")|| lnBasic.getE01DLCFFS().equals("4") || lnBasic.getE01DLCFFS().equals("5") || lnBasic.getE01DLCFFS().equals("6") || lnBasic.getE01DLCFFS().equals("7") || lnBasic.getE01DLCFFS().equals("8")))  out.print("selected"); %>></option>
								<option value="1" <% if(lnBasic.getE01DLCFFS().equals("1")) out.print("selected");%>>Mora</option>
								<option value="2" <% if(lnBasic.getE01DLCFFS().equals("2")) out.print("selected");%>>Pago Anticipado</option>
								<option value="3" <% if(lnBasic.getE01DLCFFS().equals("3")) out.print("selected");%>>Cesion de Contrato</option>
								<option value="4" <% if(lnBasic.getE01DLCFFS().equals("4")) out.print("selected");%>>Reestructuracion</option>
								<option value="5" <% if(lnBasic.getE01DLCFFS().equals("5")) out.print("selected");%>>Aceleracion</option>
								<option value="6" <% if(lnBasic.getE01DLCFFS().equals("6")) out.print("selected");%>>Peticion Cliente</option>
								<option value="7" <% if(lnBasic.getE01DLCFFS().equals("7")) out.print("selected");%>>Fallecimiento Cliente</option>
								<option value="8" <% if(lnBasic.getE01DLCFFS().equals("8")) out.print("selected");%>>Acto Administrativo FONVIVIENDA</option>
							</select>
						</td>
					</tr>          
					<% } %>	
					<% if (!lnBasic.getE01DEACLF().equals("H")) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Valor de la Vivienda : </div></td>
						<td nowrap width="75%">
							<eibsinput:text name="lnBasic" property="E01DLCVVI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
						</td>
					</tr> 
					<% } %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td width="25%"><div align="right">Fecha de Expiraci&oacute;n : </div></td>
						<td nowrap width="75%">
							<eibsinput:date name="lnBasic" fn_month="E01DLCFSM" fn_day="E01DLCFSD" fn_year="E01DLCFSY" />
						</td>
					</tr> 
				</table>
			</td>
		</tr>
	</table>
	<% } %>  

	<h4>Impuestos </h4>
	<table class="tableinfo" >
		<tr> 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%"><div align="center"> </div></td>
						<td nowrap width="10%"><div align="center">ISR</div></td>
						<td nowrap width="10%"><div align="center">IVA/ITBMS</div></td>
						<td nowrap width="10%"><div align="center">IDB/GMF</div></td>
						<td nowrap width="10%"> 
							<div align="center"> 
								<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  
									FECI 
								<% } else if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) {%>
									ITE
								<% } %>
							</div>
						</td>
						<td nowrap width="10%" ><div align="center"> </div></td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" ><div align="center"> </div></td>
						<td nowrap width="10%"  > 
							<div align="center"> 
								<select id="E01DEATX1" name="E01DEATX1" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEATX1().equals("1")) out.print("selected");%>> SI </option>
									<option value="0" <% if(lnBasic.getE01DEATX1().equals("0")) out.print("selected");%>> NO </option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
								<select id="E01DEATX2" name="E01DEATX2" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEATX2().equals("1")) out.print("selected");%>> SI </option>
									<option value="0" <% if(lnBasic.getE01DEATX2().equals("0")) out.print("selected");%>> NO </option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<select id="E01DEATX3" name="E01DEATX3" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEATX3().equals("1")) out.print("selected");%>> SI </option>
									<option value="0" <% if(lnBasic.getE01DEATX3().equals("0")) out.print("selected");%>> NO </option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<% if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) { %> 
								<select id="E01DEATX4" name="E01DEATX4" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEATX4().equals("1")) out.print("selected");%>> SI </option>
									<option value="0" <% if(lnBasic.getE01DEATX4().equals("0")) out.print("selected");%>> NO </option>
								</select>                 
								<% } %>				
							</div>
						</td>
						<td nowrap width="10%" ><div align="center"> </div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Prioridad de Pagos </h4>
	<table class="tableinfo" >
		<tr> 
			<td nowrap > 
				<table id="tableSelect" cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="14%"  > 
							<div align="center"> 
								<select id="E01DEAPP1" name="E01DEAPP1" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEAPP1().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(lnBasic.getE01DEAPP1().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(lnBasic.getE01DEAPP1().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(lnBasic.getE01DEAPP1().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(lnBasic.getE01DEAPP1().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(lnBasic.getE01DEAPP1().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(lnBasic.getE01DEAPP1().equals("7")) out.print("selected");%>> 7 </option>
				 					<% if (currUser.getE01INT().equals("07")) { %> 
				 					<option value="8" <% if(lnBasic.getE01DEAPP1().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>        
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<select id="E01DEAPP2" name="E01DEAPP2" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEAPP2().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(lnBasic.getE01DEAPP2().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(lnBasic.getE01DEAPP2().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(lnBasic.getE01DEAPP2().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(lnBasic.getE01DEAPP2().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(lnBasic.getE01DEAPP2().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(lnBasic.getE01DEAPP2().equals("7")) out.print("selected");%>> 7 </option>
				 					<% if (currUser.getE01INT().equals("07")) { %> 
				 					<option value="8" <% if(lnBasic.getE01DEAPP2().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<select id="E01DEAPP3" name="E01DEAPP3" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEAPP3().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(lnBasic.getE01DEAPP3().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(lnBasic.getE01DEAPP3().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(lnBasic.getE01DEAPP3().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(lnBasic.getE01DEAPP3().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(lnBasic.getE01DEAPP3().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(lnBasic.getE01DEAPP3().equals("7")) out.print("selected");%>> 7 </option>
				 					<% if (currUser.getE01INT().equals("07")) { %> 
									<option value="8" <% if(lnBasic.getE01DEAPP3().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<select id="E01DEAPP4" name="E01DEAPP4" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEAPP4().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(lnBasic.getE01DEAPP4().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(lnBasic.getE01DEAPP4().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(lnBasic.getE01DEAPP4().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(lnBasic.getE01DEAPP4().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(lnBasic.getE01DEAPP4().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(lnBasic.getE01DEAPP4().equals("7")) out.print("selected");%>> 7 </option>
				 					<% if (currUser.getE01INT().equals("07")) { %> 
				 					<option value="8" <% if(lnBasic.getE01DEAPP4().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>              
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<select id="E01DEAPP5" name="E01DEAPP5" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEAPP5().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(lnBasic.getE01DEAPP5().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(lnBasic.getE01DEAPP5().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(lnBasic.getE01DEAPP5().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(lnBasic.getE01DEAPP5().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(lnBasic.getE01DEAPP5().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(lnBasic.getE01DEAPP5().equals("7")) out.print("selected");%>> 7 </option>
				 					<%if(currUser.getE01INT().equals("07")){%> 
				 					<option value="8" <% if(lnBasic.getE01DEAPP5().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>              
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center">
								<select id="E01DEAPP6" name="E01DEAPP6" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEAPP6().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(lnBasic.getE01DEAPP6().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(lnBasic.getE01DEAPP6().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(lnBasic.getE01DEAPP6().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(lnBasic.getE01DEAPP6().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(lnBasic.getE01DEAPP6().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(lnBasic.getE01DEAPP6().equals("7")) out.print("selected");%>> 7 </option>
				 					<%if(currUser.getE01INT().equals("07")){%> 
				 					<option value="8" <% if(lnBasic.getE01DEAPP6().equals("8")) out.print("selected");%>> 8 </option> 
				 					<% } %>
								</select>               
							</div>
						</td>
			 			<% if(currUser.getE01INT().equals("07")) { %> 
							<td nowrap width="12%"  > 
								<div align="center">
									<select id="E01DEAPP7" name="E01DEAPP7" >
										<option value=" " selected> &nbsp; </option>
										<option value="1" <% if(lnBasic.getE01DEAPP7().equals("1")) out.print("selected");%>> 1 </option>
										<option value="2" <% if(lnBasic.getE01DEAPP7().equals("2")) out.print("selected");%>> 2 </option>
										<option value="3" <% if(lnBasic.getE01DEAPP7().equals("3")) out.print("selected");%>> 3 </option>
										<option value="4" <% if(lnBasic.getE01DEAPP7().equals("4")) out.print("selected");%>> 4 </option>
										<option value="5" <% if(lnBasic.getE01DEAPP7().equals("5")) out.print("selected");%>> 5 </option>
										<option value="6" <% if(lnBasic.getE01DEAPP7().equals("6")) out.print("selected");%>> 6 </option>
										<option value="7" <% if(lnBasic.getE01DEAPP7().equals("7")) out.print("selected");%>> 7 </option>
										<option value="8" <% if(lnBasic.getE01DEAPP7().equals("8")) out.print("selected");%>> 8 </option> 
									</select>	               
								</div>
							</td>
						<% } %>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<select id="E01DEAPP8" name="E01DEAPP8" >
									<option value=" " selected> &nbsp; </option>
									<option value="1" <% if(lnBasic.getE01DEAPP8().equals("1")) out.print("selected");%>> 1 </option>
									<option value="2" <% if(lnBasic.getE01DEAPP8().equals("2")) out.print("selected");%>> 2 </option>
									<option value="3" <% if(lnBasic.getE01DEAPP8().equals("3")) out.print("selected");%>> 3 </option>
									<option value="4" <% if(lnBasic.getE01DEAPP8().equals("4")) out.print("selected");%>> 4 </option>
									<option value="5" <% if(lnBasic.getE01DEAPP8().equals("5")) out.print("selected");%>> 5 </option>
									<option value="6" <% if(lnBasic.getE01DEAPP8().equals("6")) out.print("selected");%>> 6 </option>
									<option value="7" <% if(lnBasic.getE01DEAPP8().equals("7")) out.print("selected");%>> 7 </option>
									<% if(currUser.getE01INT().equals("07")){%> 
									<option value="8" <% if(lnBasic.getE01DEAPP8().equals("8")) out.print("selected");%>> 8 </option> 
									<% } %>
								</select>              
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="12%"><div align="center">Principal</div></td>
						<td nowrap width="12%"><div align="center">Intereses</div></td>
						<td nowrap width="12%"><div align="center">Mora</div></td>
						<td nowrap width="12%"><div align="center">Comisiones</div></td>
						<td nowrap width="12%"><div align="center">Impuestos</div></td>
						<td nowrap width="12%"><div align="center">Deducciones</div></td>
			 			<% if (currUser.getE01INT().equals("07")) { %> 
						<td nowrap width="12%"><div align="center">FECI</div></td>
						<% } %>
						<td nowrap width="12%"><div align="center">Cobranzas</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<% if ("N".equals(FLGNEW) && "Y".equals(ASSEST)){ %>  
	<br>
	<!-- Reliquidaciones de Creditos -->
	<% session.setAttribute("EMPRC","S"); %>
	<input type="hidden" name="RCTOT" id="RCTOT" value="0">
	<iframe id="ifremprc" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1110?SCREEN=101&ACT=N&E01PRLCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PRLNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>
	<!-- Otros Conceptos a Reliquidar -->
	<% session.setAttribute("EMPRN","S"); %>
	<input type="hidden" name="RNTOT" id="RNTOT" value="0">
	<iframe id="ifremprn" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1120?SCREEN=101&ACT=S&E01ORLCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01ORLNUM=<%=lnBasic.getE01DEAOFN().trim()%>&prdCode=<%=lnBasic.getE01DEAPRO().trim()%>"></iframe>  
	<% } %> 

	<a name="CuentaPago"></a>   
	<h4>Forma de pago Automatico</h4>
	<table class="tableinfo" >
		<tr> 
			<td nowrap align="left"> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0" >
					<tr id="<%= (row % 2 == 1) ?  "trdark" : "trdark" %><% if(row % 2 == 1){ row++; }else{row++;row++;}%>">
						<td nowrap width="33%" align="right"> Autoriza Sobregiro :</td>
						<td nowrap width="15%" > 
							<div align="left">
								<input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%=lnBasic.getE01DEAODA().trim()%>" readonly >
								<!--  
								<a id="linkHelp" href="javascript:lnGetOver('E01DEAODA','STATIC_ln_over.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
								--> 
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="right">Permite Pagos en Feriados : </div>
						</td>
						<td nowrap colspan="2" > 
							<eibsinput:text property="E01DEAHFQ" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="2" maxlength="1" />
							<a href="javascript:GetCode('E01DEAHFQ','STATIC_ln_tables_holidays.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a>
						</td>
						<td nowrap width="10%" ><div align="right"></div></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="28%" align="right"> Forma de Pago :</td>
						<td nowrap width="10%" > 
							<div align="left">
								<select name="E01DEAPVI" id="E01DEAPVI" onchange="javascript:cuentas();">
									<option value=" " <% if (lnBasic.getE01DEAPVI().equals(" ")) out.print("selected"); %>>Caja</option>
									<option value="1" <% if (lnBasic.getE01DEAPVI().equals("1")) out.print("selected"); %>>Automatico </option>                   
									<option value="2" <% if (lnBasic.getE01DEAPVI().equals("2")) out.print("selected"); %>>Convenio</option>  
									<option value="3" <% if (lnBasic.getE01DEAPVI().equals("3")) out.print("selected"); %>>M&uacute;ltiple Cuentas</option>                 
									<option value="4" <% if (lnBasic.getE01DEAPVI().equals("4")) out.print("selected"); %>>PAC Multibanco</option>                   
								</select>
							</div>
						</td>
						<td nowrap  id="intento" style="display: none;" > 
							<div align="right">Intento Cobro : </div>
						</td>
						<td nowrap id="intento2" style="border: 0px; display: none;"> 
							<div align="left">
								<eibsinput:text property="E01DLCCMC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" />
							</div>
						</td>
						<td align="LEFT" id="convenioAsignar" style="border: 0px; display: none;" ><a href="#CuentaPago" onclick="goAsign();"><b>Asignar</b></a></td>
						<td colspan="4" ></td>
					</tr>
					<tr id="convenioTable" style="display: none;width: 100%">	
						<td colspan="5" style="width: 100%">
							<table style="border-collapse: collapse;" cellpadding=2 cellspacing=0 width="100%" border="0">
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="width: 100%"> 
									<td width="28%"><div align="right">Codigo de Convenio : </div></td>
									<td nowrap > 
										<div align="left" >
											<input TYPE=HIDDEN NAME="E01CNVFL1" id="E01CNVFL1" VALUE="<%=lnBasic.getE01CNVFL1().trim()%>">
											<input type="text" name="E01DEACNV" id="E01DEACNV" size="5" maxlength="4" value="<%= lnBasic.getE01DEACNV().trim()%>" onchange="cuentas()" >
											<a href="javascript:GetConvenio('E01DEACNV','E01DSCCNV',document.forms[0].E01DEACUN.value,'E01CNVFL1')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
											<eibsinput:text name="lnBasic" property="E01DSCCNV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
										</div>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td width="28%"><div align="right">Pagadurias : </div></td>
									<td nowrap > 
										<div align="left">
											<input type="text" name="E01DEAPGD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPGD().trim()%>" onKeypress="enterInteger(event);">
											<a href="javascript:GetPagadurias('E01DEAPGD',document.forms[0].E01DEACNV.value,'E01DSCPGD')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
											&nbsp;&nbsp;
											<eibsinput:text name="lnBasic" property="E01DSCPGD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
										</div>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td width="28%"><div align="right">Novedad : </div></td>
									<td nowrap > 
										<div align="left">
											<input type="text" name="E01DEAUC6" size="5" maxlength="4" value="<%= lnBasic.getE01DEAUC6().trim()%>"   >
											<a href="javascript:GetCodeDescCNOFC('E01DEAUC6', 'E01DSCUC6','NC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
											<eibsinput:text name="lnBasic" property="E01DSCUC6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
										</div>
									</td>
								</tr >
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td width="28%"><div align="right">Reserva Contraparte : </div></td>
									<td nowrap > 
										<div align="left">
											<eibsinput:text property="E01CTLSEQ" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_REFERENCE %>"/>
										</div>
									</td>
								</tr >
							</table>
						</td>
					</tr>
					<tr id="autocuenta" style="border: 0px; display: none; width: 100%" >
						<td colspan="5" style="width: 100%">
							<table style="border: 0px; width: 100%">
								<tr id="trdark"> 
									<td nowrap width="28%"><div align="center">Concepto</div></td>
									<td nowrap width="10%"><div align="center">Banco </div></td>
									<td nowrap width="10%"><div align="center">Sucursal</div></td>
									<td nowrap><div align="center">Moneda </div></td>
									<td nowrap><div align="center">Referencia</div></td>
									<td nowrap><div align="center">Titular</div></td>
									<td nowrap> </td>
								</tr>
								<tr id="trclear">
									<td nowrap width="28%" > 
										<div align="center" > 
											<input type="text" name="E01PAGOPE" id="E01PAGOPE" value="<%= lnBasic.getE01PAGOPE().trim()%>" size="3" maxlength="3">
											<input type="hidden" name="E01PAGGLN" value="<%= lnBasic.getE01PAGGLN().trim()%>">
											<input type="text" name="E01PAGCON" id="E01PAGCON" size="25" maxlength="25" readonly value="<%= lnBasic.getE01PAGCON().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value, document.forms[0].E01PAGCCY.value ,'E01PAGGLN','E01PAGOPE','10', '02')">
										</div>
									</td>
									<td nowrap width="10%" > 
										<div align="center"> 
											<input type="text" name="E01PAGBNK" size="2" maxlength="2" value="<%= lnBasic.getE01PAGBNK().trim()%>">
										</div>
									</td>
									<td nowrap width="10%" > 
										<div align="center"> 
											<input type="text" name="E01PAGBRN" size="4" maxlength="4" value="<%= lnBasic.getE01PAGBRN().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')"> 
										 </div>
									</td>
									<td nowrap width="10%" > 
										<div align="center"> 
											<input type="text" name="E01PAGCCY" size="3" maxlength="3" value="<%= lnBasic.getE01PAGCCY().trim()%>"
											 class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
										</div>
									</td>
									<td nowrap width="14%" > 
										<div align="center"> 
											<input type="text" name="E01PAGACC" size="12" maxlength="12"  value="<%= lnBasic.getE01PAGACC().trim()%>"
											class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01DEABNK.value,'',document.forms[0].E01DEACUN.value,'','RT')">
										</div>
									</td>
									<td nowrap width="28%" > 
										<div align="center"> 
											<input type="text" readonly name="E01PAGNME" size="25" maxlength="25" value="<%= lnBasic.getE01PAGNME().trim()%>">
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr id="multicuenta" style="display: none">
						<td colspan="5" style="width: 100%">
							<table style="border: 0px; height:100%; width: 100%;" >
								<tr height="5%"> 
									<td NOWRAP valign="top" width="100%">
										<table id="headTable" width="100%"> 
											<tr id="trdark"> 
												<th nowrap width="15%" align="center">Cuenta</th>
												<th nowrap width="50%" align="center">Nombre</th>
												<th nowrap width="10%" align="center">Tipo</th>
												<th nowrap width="10%" align="center">Producto</th>
												<th nowrap width="15%" align="center">%USO</th>
											</tr>
										</table>
									</td>
								</tr>
								<tr height="95%">    
									<td nowrap="nowrap" valign="top">      
										<div id="dataDiv1" style="width: 100%; height:106px; overflow:auto;"> 
											<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
											<% for (int i=1;i<10;i++) {%>
												<tr id="trclear"> 
													<td nowrap width="15%" align="center">
														<%= i %>
														<input type=text name="<%="E01PGACC"+i%>" size="13" maxlength="12" value="<%=lnBasic.getFieldString("E01PGACC"+i) %>" class="context-menu-help" onmousedown="init(accountCustomerNameHelp,this.name,document.forms[0].E01DEABNK.value,'','E01PGNME<%=i%>','','RT')"> 
													</td>
													<td nowrap width="50%" align="center">
														<input type=text name="<%="E01PGNME"+i%>" size="60" maxlength="60" value="<%=lnBasic.getFieldString("E01PGNME"+i) %>" readonly> 
													</td>
													<td nowrap width="10%" align="center">
														<input type=text name="<%="E01PGTYP"+i%>" size="5" maxlength="4" value="<%=lnBasic.getFieldString("E01PGTYP"+i) %>" readonly> 
													</td>
													<td nowrap width="10%" align="center">
														<input type=text name="<%="E01PGPRD"+i%>" size="5" maxlength="4" value="<%=lnBasic.getFieldString("E01PGPRD"+i) %>" readonly> 
													</td>
													<td nowrap width="15%" align="center">
														<input type=text name="<%="E01PGPER"+i%>" size="8" maxlength="7" class="txtright" value="<%=lnBasic.getFieldString("E01PGPER"+i) %>"> 
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
	</table> 
	 
<%--HTML LOADED INTO DIV THROUGH AJAX Call
	JSPAYMENT within page or ln-paymentplan.js
	--%>   
<div id="planPago"></div>

 <% if (DEAIPD.equals("SCH") && DEAPPD.equals("SCH")) { %> 
	 <% if ("Y".equals(FLGPMT)) { %> 
		 <% session.setAttribute("EMPPP", !("N".equals(FLGNEW)) ? "S" : "S"); %>
		 <iframe id="ifremppp" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155?SCREEN=2&E01DEAACC=<%=lnBasic.getE01DEAACC()%>"></iframe>
	 <% } %>
 <% } %>

<% if ("N".equals(FLGNEW)){ %>

<% if ("Y".equals(ASSEST)){ %>

<% if(lnBasic.getE01FLGREF().equals("N")) {	%>
	<br>
	<!-- Seguros Financiados -->
	<% session.setAttribute("EMPSG","S"); %>
	<input type="hidden" name="SGTOT" id="SGTOT" value="0">
	<iframe id="ifrempsg" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/images/throbber.gif"></iframe>

	<br>
	<!-- Cargos Adicionales -->
	<% session.setAttribute("EMPCA","S"); %>
	<input type="hidden" name="CAIMP" id="CAIMP" value="0">
	<input type="hidden" name="CACOM" id="CACOM" value="0">
	<input type="hidden" name="CADED" id="CADED" value="0">
	<input type="hidden" name="CAIVA" id="CAIVA" value="0">
	<input type="hidden" name="CAOTH" id="CAOTH" value="0">
	<iframe id="ifrempca" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/images/throbber.gif"> </iframe>

	<br>
	<!-- Destino de Fondos -->
	<% session.setAttribute("EMPDF","S"); %>
	<iframe id="ifrempdf" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168?SCREEN=101&ACT=N&E01PDFCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PDFNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>

	<h4>Distribuci&oacute;n</h4> 
	<table class="tableinfo"  >
		<tr > 
			<td nowrap> 
				<table class="" cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Monto del Cr&eacute;dito :</div>
						</td>
						<td nowrap width="20%"> 
							<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" onchange="updateAmount(); wipeValorCuota();"/> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Cr&eacute;ditos Reliquidados :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTCRN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Otras Reliquidaciones :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTORN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Impuestos :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Comisiones :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTCOM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Deducciones :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTDED" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Seguros :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTSGR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">I.V.A. :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTIVA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Otros Cargos :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTOTH" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
				 <%if (!lnBasic.getE01TOTPIN().trim().equals("0.00") ){ %> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="10%"></td>
						<td nowrap width="20%"> 
							<div align="right">Interes Prepagado :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTPIN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>	
				 <%}%>
				 <%if (!lnBasic.getE01INTGRA().trim().equals("0.00") ){ %> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="10%"></td>
						<td nowrap width="20%"> 
							<div align="right">Pago Interes de Gracia :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01INTGRA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>	
				 <%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right" style="font-weight: bold;">Monto Neto(Desembolso) :</div>
						</td>
						<td nowrap width="15%">
							 <eibsinput:text property="E01BALNET" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate();reverseCalculate(this); wipeValorCuota();"/>
						</td>
						<td nowrap width="15%" style="font-weight: bold;">
							<div align="right">Saldo(Desembolso) :</div>
						</td>
						<td nowrap width="20%">
							<eibsinput:text property="SALNET" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
						</td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="10%"></td>
						<td nowrap width="20%">
								<div align="right"><b>Recalcular</b></div>
						</td>
						<td nowrap width="20%">
								<input type="checkbox" name="RECALC" id="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnBasic.getE01FLGRCL().trim().equals("X")) out.print(" checked disabled");%>>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<br> 
	<!-- Desembolso -->
	<div id="divDesembolso">
	<% session.setAttribute("EMPDS","S"); %>
	<input type="hidden" name="DSTOT" id="DSTOT" value="0">
	<input type="hidden" name="DSGMF" id="DSGMF" value="0">
	<iframe id="ifrempds" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=101&ACT=S&E01PVBCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PVBNUM=<%=lnBasic.getE01DEAOFN().trim()%>&prdCode=<%=lnBasic.getE01DEAPRO().trim()%>"></iframe>  
	</div>

	<% }else { %>
	<br>
	<!-- Seguros Financiados -->
	<% session.setAttribute("EMPSG","S"); %>
	<input type="hidden" name="SGTOT" id="SGTOT" value="0">
	<iframe id="ifrempsg" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/images/throbber.gif"></iframe>  

	<br>
	<!-- Cargos Adicionales -->
	<% session.setAttribute("EMPCA","S"); %>
	<input type="hidden" name="CAIMP" id="CAIMP" value="0">
	<input type="hidden" name="CACOM" id="CACOM" value="0">
	<input type="hidden" name="CADED" id="CADED" value="0">
	<input type="hidden" name="CAIVA" id="CAIVA" value="0">
	<input type="hidden" name="CAOTH" id="CAOTH" value="0">
	<iframe id="ifrempca" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/images/throbber.gif"> </iframe>

	<br>
	<!-- Destino de Fondos -->
	<% session.setAttribute("EMPDF","S"); %>
	<iframe id="ifrempdf" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168?SCREEN=101&ACT=N&E01PDFCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PDFNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>

	<h4>Distribuci&oacute;n</h4> 
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
										<div align="right">Monto del Cr&eacute;dito :</div>
									</td>
											<td nowrap width="67%"> 
										<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false"/> 
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
										<div align="right">Cr&eacute;ditos Reestructurados :</div>
									</td>
											<td nowrap width="67%"> 
										 <eibsinput:text property="E01TOTCRN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
										<div align="right">Otras Reestructuraciones :</div>
									</td>
											<td nowrap width="67%"> 
										 <eibsinput:text property="E01TOTORN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
										<div align="right">Impuestos :</div>
									</td>
											<td nowrap width="67%"> 
										 <eibsinput:text property="E01TOTIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
										<div align="right">Comisiones :</div>
									</td>
											<td nowrap width="67%"> 
										 <eibsinput:text property="E01TOTCOM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
										<div align="right">Deducciones :</div>
									</td>
											<td nowrap width="67%"> 
										 <eibsinput:text property="E01TOTDED" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
									</td>
								</tr>
							 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
							<div align="right">I.V.A. :</div>
						</td>
						<td nowrap width="67%">
							 <eibsinput:text property="E01TOTIVA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>

					</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
										<div align="right">Seguros :</div>
									</td>
											<td nowrap width="67%"> 
										 <eibsinput:text property="E01TOTSGR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%" style="font-weight: bold;"> 
										<div align="right">Monto Neto :</div>
									</td>
											<td nowrap width="67%"> 
										 <eibsinput:text property="E01BALNET" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false" onchange="reverseCalculate(this)"/>
									</td>
								</tr>
										<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="10%"> 
											<div align="right"></div>
									</td>
									<td nowrap width="10%">
									</td>
									<td nowrap width="13%"> 
											<div align="right"><b>Recalcular</b></div>
									</td>
											<td nowrap width="67%"> 
											<input type="checkbox" name="RECALC" id="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnBasic.getE01FLGRCL().trim().equals("X")) out.print(" checked disabled");%>>
									</td>
							 </tr>
					</table>
				</td>
		</tr>
	</table>
	<% } %>
	
	<% } else { %>

	<!-- Destino de Fondos -->
	<% session.setAttribute("EMPDF","S"); %>
	<iframe id="ifrempdf" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168?SCREEN=101&ACT=N&E01PDFCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PDFNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>

	<h4>Distribuci&oacute;n</h4> 
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Monto del Cr&eacute;dito :</div>
						</td>
						<td nowrap width="15%"> 
							<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="updateAmount()"/> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
						</td>
						<td nowrap width="20%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="10%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Impuestos :</div>
						</td>
						<td nowrap width="15%"> 
							 <eibsinput:text property="E01TOTIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="20%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="10%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%" style="font-weight: bold;"> 
							<div align="right">Monto Neto(Desembolso) :</div>
						</td>
						<td nowrap width="15%"> 
							 <eibsinput:text property="E01BALNET" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="reverseCalculate(this)"/>
						</td>
						<td nowrap width="20%" style="font-weight: bold;">
							<div align="right">Saldo(Desembolso) :</div>
						</td>
						<td nowrap width="20%"> 
							<eibsinput:text property="SALNET" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
						</td>
						<td nowrap width="10%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
								<div align="right"><b>Recalcular</b></div>
						</td>
						<td nowrap width="15%"> 
								<input type="checkbox" name="RECALC" id="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnBasic.getE01FLGRCL().trim().equals("X")) out.print(" checked disabled");%>>
						</td>
						<td nowrap width="20%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="10%"></td>
					</tr>
					</table>
				</td>
		</tr>
	</table>

	<br> 
	<!-- Desembolso -->
	<div id="divDesembolso">
	<% session.setAttribute("EMPDS","S"); %>
	<input type="hidden" name="DSTOT" id="DSTOT" value="0">
	<input type="hidden" name="DSGMF" id="DSGMF" value="0">
	<iframe id="ifrempds" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=101&ACT=S&E01PVBCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PVBNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>  
	</div>
	
<% } %>

<% }else{ %>

<h4>Saldos</h4> 
<table class="tableinfo" >
	<tr > 
		<td nowrap> 
			<table cellpadding=2 cellspacing=0 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="10%"> 
										<div align="right"></div>
								</td>
								<td nowrap width="10%">
								</td>
								<td nowrap width="13%"> 
									<div align="right">Monto Inicial :</div>
								</td>
										<td nowrap width="67%"> 
									<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 
								</td>
							</tr>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="10%"> 
										<div align="right"></div>
								</td>
								<td nowrap width="10%">
								</td>
								<td nowrap width="13%"> 
									<div align="right">Saldo Capital :</div>
								</td>
										<td nowrap width="67%"> 
									 <eibsinput:text property="E01SALPRI" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
								</td>
							</tr>
				<% if ("R".equals(lnBasic.getH01FLGWK3())){ %>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="10%"> 
										<div align="right"></div>
								</td>
								<td nowrap width="10%">
								</td>
								<td nowrap width="13%"> 
									<div align="right">Saldo Reajuste :</div>
								</td>
										<td nowrap width="67%"> 
									 <eibsinput:text property="E01SALREA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
								</td>
							</tr>
							<%}%>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="10%"> 
										<div align="right"></div>
								</td>
								<td nowrap width="10%">
								</td>
								<td nowrap width="13%"> 
									<div align="right">Saldo Intereses :</div>
								</td>
										<td nowrap width="67%"> 
									 <eibsinput:text property="E01SALINT" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
								</td>
							</tr>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="10%"> 
										<div align="right"></div>
								</td>
								<td nowrap width="10%">
								</td>
								<td nowrap width="13%"> 
									<div align="right">Saldo Mora :</div>
								</td>
										<td nowrap width="67%"> 
									 <eibsinput:text property="E01SALMOR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
								</td>
							</tr>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="10%"> 
										<div align="right"></div>
								</td>
								<td nowrap width="10%">
								</td>
								<td nowrap width="13%"> 
									<div align="right">Otros Cargos :</div>
								</td>
										<td nowrap width="67%"> 
									 <eibsinput:text property="E01SALOTH" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
								</td>
							</tr>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="10%"> 
										<div align="right"></div>
								</td>
								<td nowrap width="10%">
								</td>
								<td nowrap width="13%"> 
									<div align="right">Total Deuda :</div>
								</td>
										<td nowrap width="67%"> 
									 <eibsinput:text property="E01SALDUE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
								</td>
							</tr>
				</table>
			</td>
	</tr>
</table>

<% } %>

<% if ("Y".equals(FLGFND) && "N".equals(FLGNEW)){ %>
<!-- Fomento -->
<h4>Fomento - Credito Pasivo</h4> 
<%int rowF = 0;%>  
<table class="tableinfo" >
	<tr > 
		<td nowrap> 
			<table id="tableCreditoPasivo" cellpadding=2 cellspacing=0 width="100%" border="0">
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right" style="font-weight: bold;">Plan de Fomento :</div></td>
					<td width="75%" nowrap="nowrap" colspan="3">
						<eibsinput:text name="lnBasic" property="E01PFNCOD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" onchange="passiveProduct.rateDisplay(); setRecalculate(); " />
						<a href="javascript: GetFomento('E01PFNCOD', document.forms[0].E01DEABNK.value, document.forms[0].E01DEAPRO.value, 'E01PFNDSC',
						'E01PFNCUP', 'E01PFNCNM', 'E01PFNPRD', 'E01PFNFTB', 'E01PFNFTY','E01PFNBNK', 'E01PFNBRN',
						'E01PFNOBK','E01PFNOBR', 'E01PFNOCY', 'E01PFNOGL','E01PDSPRD','E01PLGFLT','E01PLTDSC')"> 
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0"></a>
						<eibsinput:text name="lnBasic" property="E01PFNDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
					</td>
				</tr>
				<tr>
					<td width="25%" nowrap="nowrap">
						<div align="right">Codigo de Producto :</div>
					</td>
					<td width="75%" nowrap="nowrap" colspan="3">
						<eibsinput:text name="lnBasic" property="E01PFNPRD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true" />
						&nbsp;
						<eibsinput:text name="lnBasic" property="E01PDSPRD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
					</td>
				</tr>
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right">Cliente Fomento :</div></td>
					<td width="75%" nowrap="nowrap" colspan="3">
						<eibsinput:text name="lnBasic" property="E01PFNCUP" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true" />
						&nbsp;
						<eibsinput:text name="lnBasic" property="E01PFNCNM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
					</td>
				</tr>
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right">Prestamo Pasivo :</div></td>
					<td width="25%" nowrap="nowrap">
						<input type="text" name="E01PFNPAC" size="14" maxlength="12"  readonly value="<% if (lnBasic.getE01PFNPAC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(lnBasic.getE01PFNPAC().trim()); %>">
					</td>
					<td width="25%" nowrap="nowrap"><div align="right">Tabla Tasa Flotante :</div></td>
					<td width="25%" nowrap="nowrap">
						<div align="left">
							<eibsinput:help name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" 
								fn_param_one="E01PFNFTB" 
								fn_param_two="E01PLGFLT" 
								fn_param_three="E01PLTDSC" 
								fn_param_four="PRIMARYRATE_FOMENTO" 
								fn_param_five="SECONDARYRATE_FOMENTO" 
								fn_param_six="E01PFNFTY" 
								property="E01PFNFTB" help="<%=HelpTypes.FLOATING_RATE_TABLES%>" onchange="passiveProduct.rateDisplay();  passiveProduct.chgRate();setRecalculate();"/>       	
							<select name="E01PFNFTY" id="E01PFNFTY" onchange="passiveProduct.rateDisplay(); passiveProduct.chgRate(); setRecalculate()"> 
								<option value=" " <% if (!(lnBasic.getE01PFNFTY().equals("FP") || lnBasic.getE01PFNFTY().equals("FS"))) out.print("selected"); %>></option>
								<option value="FP" <% if (lnBasic.getE01PFNFTY().equals("FP")) out.print("selected"); %>>FP</option>
								<option value="FS" <% if (lnBasic.getE01PFNFTY().equals("FS")) out.print("selected"); %>>FS</option>
							</select>             	
						</div>
					</td>
				</tr>
				<tr id="FLOATINGTABLE_FOMENTO2" style="display: none;">
					<td><div align="right">Descripcion Tabla Flotante :</div></td>
					<td> 
						<eibsinput:text property="E01PLTDSC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
					</td>
					<td> 
						<div align="right">Tasa Flotante Base :</div>
					</td>
					<td nowrap>
						<%if(lnBasic.getE01PLGFLT().equals("2")){%>
						<INPUT TYPE=HIDDEN NAME="PRIMARYRATE_FOMENTO" id="PRIMARYRATE_FOMENTO" VALUE="<%=lnBasic.getE01PLTORG().trim()%>">
						<INPUT TYPE=HIDDEN NAME="SECONDARYRATE_FOMENTO" id="SECONDARYRATE_FOMENTO" VALUE="<%=lnBasic.getE01PLTORG().trim()%>">
						<%}else{%>
						<INPUT TYPE=HIDDEN NAME="PRIMARYRATE_FOMENTO" id="PRIMARYRATE_FOMENTO" VALUE="<%=lnBasic.getE01PFNFRT().trim()%>">
						<INPUT TYPE=HIDDEN NAME="SECONDARYRATE_FOMENTO" id="SECONDARYRATE_FOMENTO" VALUE="<%=lnBasic.getE01PFNFRT().trim()%>">
						<%}%>
						<eibsinput:text property="E01PLTORG" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
					</td>
				</tr>
				<tr id="FLOATINGTABLE_FOMENTO" style="display: none"> 
					<td><div align="right">Manejo Puntos Adicional  :</div></td>
					<td nowrap width="25%" > 
						<select name="E01PFNFLX" id="E01PFNFLX" onclick="setRecalculate()" >
							<OPTION value=" " <% if (!(lnBasic.getE01PFNFLX().equals("B") ||lnBasic.getE01PFNFLX().equals("E")||lnBasic.getE01PFNFLX().equals("N"))) out.print("selected"); %>></OPTION>
							<OPTION value="B" <% if(lnBasic.getE01PFNFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
							<OPTION value="E" <% if(lnBasic.getE01PFNFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
							<OPTION value="N" <% if(lnBasic.getE01PFNFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
						</select>
					</td>
					<td><div align="right">Valor Tasa Adicional :</div></td>
					<td nowrap width="25%"> 
						<eibsinput:text property="E01PFNRTX" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" onchange="setRecalculate();totalRateFomento()"/>
					</td>
				</tr>
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right">Monto Original :</div></td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PFNOAM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="false" />
					</td>
					<td width="25%" nowrap="nowrap">
						<div align="right">Tasa Flotante :</div>
					</td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PFNFRT" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
					</td>
				</tr>
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right">Valor de Cuota :</div></td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PFNVCU" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
					</td>
					<td width="25%" nowrap="nowrap">
						<div align="right">Tasa Fomento/Spread :</div>
					</td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PFNRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>"  onchange="setRecalculate(); passiveProduct.chgRate(); totalRateFomento()"  />
					</td>
				</tr>
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right">Comision :</div></td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PFNVCO" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
					</td>	
					<td width="25%" nowrap="nowrap">
						<div align="right">Tasa del Prestamo :</div>
					</td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PTORTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"  />
					</td>
				</tr>
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right">Banco/Surcusal :</div></td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PFNBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" />
						<eibsinput:help name="lnBasic" property="E01PFNBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" fn_param_one="E01PFNBRN" fn_param_two="document.forms[0].E01PFNBNK.value" />              	
					</td>
					<td width="25%" nowrap="nowrap"><div align="right">Tasa Efectiva :</div></td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PFNSPR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"  />
					</td>			
				</tr>
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right">Cuenta de Desembolso :</div></td>
					<td width="25%" nowrap="nowrap">
						<eibsinput:text name="lnBasic" property="E01PFNOBK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="true" />
						<eibsinput:text name="lnBasic" property="E01PFNOBR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="true" />
						<eibsinput:text name="lnBasic" property="E01PFNOCY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
						<eibsinput:text name="lnBasic" property="E01PFNOGL" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" readonly="true" />
					</td>			
					<td width="25%" nowrap="nowrap">
						<div align="right"></div>
					</td>
					<td width="25%" nowrap="nowrap"></td>
				</tr>
			</table>
		</td>
	</tr>
</table> 
<% } %>

<% if ("A".equals(FLGFND) && "N".equals(FLGNEW)){ %>
<!-- Fomento -->
<h4>Fomento - Credito Activo</h4> 
<% int rowF = 0; %>  
<table class="tableinfo" >
	<tr > 
		<td nowrap> 
			<table id="tableCreditoPasivo" cellpadding=2 cellspacing=0 width="100%" border="0">
				<tr>
					<td width="25%" nowrap="nowrap"><div align="right" style="font-weight: bold;">Paquete Redescuento :</div></td>
					<td width="75%" nowrap="nowrap" colspan="3">
						<eibsinput:text name="lnBasic" property="E01PFNCOD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" />
						<a href="javascript:GetPaqRedescuento('E01PFNCOD','E01PFNDSC')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0"></a> 
						<eibsinput:text name="lnBasic" property="E01PFNDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />	
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table> 
<% } %>

<!-- Reajuste por Correcci&oacute;n Monetaria -->
<%if (!lnBasic.getE01DEAACC().trim().equals("999999999999")) {%>
<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=lnBasic.getH01FLGWK3()%>" />
</jsp:include>
<%}%>

<% if ("Y".equals(ASSEST)&& "N".equals(FLGNEW)){ %>
<h4>Garantias</h4>
	<TABLE  id="mainTable" class="tableinfo" style="height:106px;">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
							<th nowrap width="16%" align="center">Cuenta</th>
							<th nowrap width="7%"  align="center">Prod</th>
							<th nowrap width="30%" align="center">Nombre</th>
							<th nowrap width="7%"  align="center">Moneda</th>
							<th nowrap width="20%" align="center">Monto Garantizado</th>
							<th nowrap width="20%" align="center">Valor del bien</th>
			</tr>
				</table>
			</td>
		</tr>    
			<tr  height="95%">    
				<td nowrap="nowrap">      
					 <div id="dataDiv1" style="height:106px; overflow:auto;"> 
					 <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					 for (int i=1;i<10;i++) {
					%> 
					<tr id="trclear"> 
						<td nowrap width="16%" align="center"> 
					<%= i %>
				<input type=text name="<%="E01CLACB"+i%>" size="13" maxlength="12" value="<%=lnBasic.getFieldString("E01CLACB"+i) %>" 
				class="context-menu-help garantiaInq" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01DEABNK.value,'',document.forms[0].E01DEACUN.value,'','91')">			</td>
						<td nowrap width="7%"  align="center"> 
				<input type="text" name="<%="E01CLTYB"+i %>" size="5" maxlength="4" value="<%=lnBasic.getFieldString("E01CLTYB"+i) %>" readonly>
			</td>
						<td nowrap width="30%" align="center"> 
							<input type="text" name="<%="E01CLDSC"+i %>" size="46" maxlength="45" value="<%=lnBasic.getFieldString("E01CLDSC"+i) %>" readonly> 
						</td>
						<td nowrap width="7%"  align="center"> 
							<input type="text" name="<%="E01CLCCY"+i %>" size="4" maxlength="3" value="<%=lnBasic.getFieldString("E01CLCCY"+i) %>" readonly>  
						</td>
						<td nowrap width="20%" align="center"> 
							<input type="text" class="txtright" name="<%="E01CLAMT"+i %>" size="19" maxlength="18" value="<%=lnBasic.getFieldString("E01CLAMT"+i) %>" onclick="this.select();" onkeypress="enterDecimal(event, 2)" onblur=" this.value = formatCCY(this.value);"  >  
						</td>
						<td nowrap width="20%" align="center"> 
								<input type="text" class="txtright" name="<%="E01CLBOP"+i %>" size="19" maxlength="18" value="<%=lnBasic.getFieldString("E01CLBOP"+i) %>" readonly> 
				<input class="styled-button-Search" id="garbtn<%=i%>" type=button name="Submit" value="Consulta" onClick="showCollateralList(getElement('E01CLACB<%=i%>').value.trim())" style="visibility: <%= lnBasic.getFieldString("E01CLACB"+i).trim().equals("0") ? "hidden;" : "visible"  %>">
						</td>
					</tr> 
				<%}%>
				</table>
			</div>
	 </td>
	</tr>
 </table>
<% } %>

<% if(error.getERWRNG().equals("Y")){%>
	 <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(lnBasic.getH01FLGWK2().equals("A")){ out.print("checked");} %> >Aceptar con Aviso</h4>
<% } %> 

<table class="tbenter" >
	<tr > 
	<td width="10%"> 
			<div align="center"> 
				<p> <input class="EIBSBTN" type="button" name="Submit"   value="Enviar" onclick="submitPage(this)"> </p>
		</div>
	</td>
		</tr>
</table>

</form >  
</body>
</html>
 