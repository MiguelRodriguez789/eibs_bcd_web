<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import = "datapro.eibs.master.*" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Aprobacion de Creditos Consulta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EPV015001Message" scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script    type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-paymentplan.jsp"></script>

<SCRIPT type="text/javascript">
		builtNewMenu(pv_a_opt);
		initMenu();
		
		$( document ).ready(function() {
				setRowColors('tableInfoID');
				iFrameCheck();
		});
		
</SCRIPT>

</head>
<body onload="forma();">
<% 
	
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	
	boolean isDEAIPDNum = true;
	boolean isDEAPPDNum = true;
	String DEAIPD = lnBasic.getE01DEAIPD().trim();
	String DEAPPD = lnBasic.getE01DEAPPD().trim();
	String FLGDED = lnBasic.getE01FLGDED().trim();
	String FLGREF = lnBasic.getE01FLGREF().trim();
	String FLGPAY = lnBasic.getE01FLGPAY().trim();
	String FLGCOL = lnBasic.getE01FLGCOL().trim();
	String FLGNEW = lnBasic.getE01FLGNEW().trim();
	String FLGFND = lnBasic.getE01FLGFND().trim();
	String ASSEST = lnBasic.getE01FLGACT().trim();
	String FLGSBS = lnBasic.getE01FLGSBS().trim();
	String FLGDIA = lnBasic.getE01DLCFL5().trim();
 
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

<h3 align="center"> Informaci&oacute;n de Credito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="loans_approval_basic.jsp, EPV0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0150" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="301">
	<INPUT TYPE=HIDDEN NAME="H01FLGMAS" id="H01FLGMAS" VALUE="<%=lnBasic.getH01FLGMAS()%>">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="<%=lnBasic.getH01FLGWK1()%>">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK2" id="H01FLGWK2" VALUE="<%=lnBasic.getH01FLGWK2()%>">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK3" id="H01FLGWK3" VALUE="<%=lnBasic.getH01FLGWK3()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=lnBasic.getE01DEAACD().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAACC" id="E01DEAACC" VALUE="<%=lnBasic.getE01DEAACC().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAGLN" id="E01DEAGLN" VALUE="<%=lnBasic.getE01DEAGLN().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAOFN" id="E01DEAOFN" VALUE="<%=lnBasic.getE01DEAOFN().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPPD" id="E01DEAPPD" VALUE="<%=lnBasic.getE01DEAPPD().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAIPD" id="E01DEAIPD" VALUE="<%=lnBasic.getE01DEAIPD().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01OLDOAM" id="E01OLDOAM" VALUE="<%=lnBasic.getE01OLDOAM().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGDED" id="E01FLGDED" VALUE="<%=lnBasic.getE01FLGDED().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGREF" id="E01FLGREF" VALUE="<%=lnBasic.getE01FLGREF().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGPAY" id="E01FLGPAY" VALUE="<%=lnBasic.getE01FLGPAY().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGCOL" id="E01FLGCOL" VALUE="<%=lnBasic.getE01FLGCOL().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGRCL" id="E01FLGRCL" VALUE="<%=lnBasic.getE01FLGRCL().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGNEW" id="E01FLGNEW" VALUE="<%=lnBasic.getE01FLGNEW().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFVE" id="E01FLGFVE" VALUE="<%=lnBasic.getE01FLGFVE().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFND" id="E01FLGFND" VALUE="<%=lnBasic.getE01FLGFND().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGAVL" id="E01FLGAVL" VALUE="<%=lnBasic.getE01FLGAVL().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGSBS" id="E01FLGSBS" VALUE="<%=lnBasic.getE01FLGSBS().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGACT" id="E01FLGACT" VALUE="<%=lnBasic.getE01FLGACT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGFLT" id="E01FLGFLT" VALUE="<%=lnBasic.getE01FLGFLT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E01FLGCNV" id="E01FLGCNV" VALUE="<%=lnBasic.getE01FLGCNV().trim()%>">
	
<%int row = 0; %>
<table class="tableinfo" style="width: 100%" align="center">
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" > 
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="10%" > 
							<div align="left">
									<eibsinput:text property="E01DEACUN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="right"><b>Nombre :</b></div>
						</td>
						<td nowrap width="35%"> 
							<div align="left">
									<eibsinput:text property="E01CUSNA1" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Tipo :</b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left">
									<eibsinput:text property="E01DEATYP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"> 
							<div align="right"><b>Cuenta :</b></div>
						</td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly value="<% if (lnBasic.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(lnBasic.getE01DEAACC().trim()); %>">
							</div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Moneda :</b></div>
						</td>
						<td nowrap width="35%"> 
							<div align="left">
									<eibsinput:text property="E01DEACCY" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"> 
							<div align="right"><b>Producto :</b></div>
						</td>
						<td nowrap width="20%"> 
							<div align="left">
									<eibsinput:text property="E01DEAPRO" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
</table>

<% if ("Y".equals(ASSEST)){ %>
<h4>Cotitulares/Avales</h4>
	<TABLE  id="mainTable" class="tableinfo" style="height:106px; width: 100%" align="center">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="98%">
						<tr id="trdark">
								<th nowrap width="15%" align="center">Numero</th>
								<th nowrap width="45%" align="center">Nombre</th>
								<th nowrap width="15%" align="center">Identificacion</th>
								<th nowrap width="10%" align="center">Relacion</th>
								<th nowrap width="15%" align="center">Porcentaje</th>
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
						<td nowrap width="15%" align="center"> 
									<%= i %>
								<input type=text name="<%="E01TACUN"+i%>" size="10" maxlength="9" value="<%=lnBasic.getFieldString("E01TACUN"+i) %>" onKeyPress="enterInteger(event)" readonly>    
						</td>
						<td nowrap width="45%" align="center"> 
								<input type="text" name="<%="E01TANME"+i %>" size="60" maxlength="60" value="<%=lnBasic.getFieldString("E01TANME"+i) %>" readonly> 
							</td>
						<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E01TAIDN"+i %>" size="28" maxlength="25" value="<%=lnBasic.getFieldString("E01TAIDN"+i) %>" readonly>  
						</td>
						<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E01TAREL"+i %>" size="2" maxlength="1" value="<%=lnBasic.getFieldString("E01TAREL"+i) %>" readonly>  
						</td>
						<td nowrap width="15%" align="center"> 
								<input type="text" class="txtright" name="<%="E01TAPRC"+i %>" size="7" maxlength="6" value="<%=lnBasic.getFieldString("E01TAPRC"+i) %>" readonly>  
						</td>
					</tr> 
						<%}%>
						</table>
					</div>
				</td>
		</tr>
</table>
<% } %>
	
<h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4> 
	<table id="tableInfoID" class="tableinfo" style="width: 100%" align="center">
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %>">
						<td nowrap width="25%"> 
							<div align="right">Fecha de Apertura :</div>
						</td>
							<td nowrap width="25%"> 
							<eibsinput:date name="lnBasic" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" onclick="setRecalculate()"   readonly="true" modified="F01DEAODY;F01DEAODD;F01DEAODM"/> 
						</td>
						<td nowrap width="25%"> 
							<div align="right">T&eacute;rmino o Plazo :</div>
						</td>
						<td nowrap width="25%"> 
							<input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>"   readonly<% if (lnBasic.getF01DEATRM().equals("Y")) out.print("class=\"txtchanged\""); %>> 
							<select name="E01DEATRC" disabled="disabled"<% if (lnBasic.getF01DEATRC().equals("Y")) out.print("class=\"txtchanged\""); %>>
									<OPTION value=" "<% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></OPTION>
									<OPTION value="D"<% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
									<OPTION value="M"<% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
									<OPTION value="Y"<% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
							</select>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="25%"> 
							<div align="right">Fecha de Vencimiento :</div>
						</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="lnBasic"  fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY"    readonly="true" modified="F01DEAMAY;F01DEAMAD;F01DEAMAM"/> 
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tabla Tasa Flotante :</div>
						</td>
						<td nowrap> 
							<input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= lnBasic.getE01DEAFTB().trim()%>"   readonly<% if (lnBasic.getF01DEAFTB().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<select name="E01DEAFTY"   disabled="disabled"<% if (lnBasic.getF01DEAFTY().equals("Y")) out.print("class=\"txtchanged\""); %>> 
								<option value=" "<% if (!(lnBasic.getE01DEAFTY().equals("FP") ||lnBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
								<option value="FP"<% if (lnBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
								<option value="FS"<% if (lnBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
							</select>
						</td>
					</tr>
					<%if(lnBasic.getE01FLGFLT().equals("2")){%>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap width="25%" > 
							<div align="right">Manejo Puntos Adicional  :</div>
						</td>
						<td nowrap width="25%"<% if (lnBasic.getF01DEAFLX().equals("2")) out.print("class=\"txtchanged\""); %> > 
								<select name="E01DEAFLX" disabled="disabled" >
									<OPTION value=" "<% if (!(lnBasic.getE01DEAFLX().equals("B") ||lnBasic.getE01DEAFLX().equals("E")||lnBasic.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
									<OPTION value="B"<% if(lnBasic.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
									<OPTION value="E"<% if(lnBasic.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
									<OPTION value="N"<% if(lnBasic.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
								</select>
							</td>
						<td nowrap width="25%" > 
							<div align="right">Valor Tasa Adicional :</div>
						</td>
						<td nowrap width="25%" > 
								<eibsinput:text property="E01DEARTX" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" modified="F01DEARTX" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Descripcion Tabla Flotante :</div>
						</td>
						<td nowrap width="25%" > 
								<eibsinput:text property="E01FLTDSC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tasa Flotante Base :</div>
						</td>
						<td nowrap>
								<eibsinput:text property="E01FLTORG" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
						</td>
					</tr>
					<%}%>
					<% if (!("N".equals(FLGNEW))){ %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Monto Original :</div>
						</td>
						<td nowrap width="25%" > 
								<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />  
						</td>
						<td nowrap width="25%" > 
						</td>
						<td nowrap>
						</td>
					</tr>
					<% } %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Clase de Cr&eacute;dito :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEACLF" size="2" maxlength="1" value="<%= lnBasic.getE01DEACLF().trim()%>" readonly<% if (lnBasic.getF01DEACLF().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tasa Flotante :</div>
						</td>
						<td nowrap>
								<eibsinput:text property="E01FLTRTE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" modified="F01FLTRTE"/>  
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Tipo de Inter&eacute;s :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= lnBasic.getE01DEAICT().trim()%>"   readonly<% if (lnBasic.getF01DEAICT().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tasa Interes/Spread :</div>
						</td>
						<td nowrap width="20%" > 
								<eibsinput:text property="E01DEARTE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"    readonly="true" modified="F01DEARTE"/> 
								<b>&nbsp; &nbsp;Tasa Futuros</b>
								<a href="javascript: goFutureRates('true')"><img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Tasa Efectiva Anual :</div>
						</td>
						<td nowrap width="25%" > 
								<eibsinput:text property="E01DEASPR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" modified="F01DEASPR"/>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tasa Nominal del Prestamo :</div>
						</td>
						<td nowrap width="20%" > 
								<eibsinput:text property="E01LNSRTE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" modified="F01LNSRTE"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Per&iacute;odo Base :</div>
						</td>
						<td nowrap width="25%" > 
								<eibsinput:text property="E01DEABAS" name="lnBasic" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>"   readonly="true" modified="F01DEABAS"/>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tasa M&iacute;nima Permitida :</div>
						</td>
						<td nowrap width="20%" > 
								<eibsinput:text property="E01DEAMIR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  modified="F01DEAMIR"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">C&aacute;lculo  Interes Normal :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAIFL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAIFL().trim()%>" readonly<% if (lnBasic.getF01DEAIFL().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tasa M&aacute;xima Permitida :</div>
						</td>
						<td nowrap width="20%" > 
								<eibsinput:text property="E01DEAMXR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>"  readonly="true" modified="F01DEAMXR"/>
						</td>
					</tr>
		<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ></td>
						<td nowrap width="25%" ></td>
						<td nowrap width="25%" ><div align="right">Tasa CAE :</div></td>
						<td>
							<eibsinput:text property="E01DLCRT3" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
						</td>
					</tr>
		<% } %>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">C&aacute;lculo  Interes de Mora :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAPCL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPCL().trim()%>"   readonly<% if (lnBasic.getF01DEAPCL().equals("Y")) out.print("class=\"txtchanged\""); %>>
						<td nowrap width="25%" > 
							<div align="right">Tasa o Cargo por Mora :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAPEI" size="8" maxlength="7" value="<%= lnBasic.getE01DEAPEI().trim()%>" readonly<% if (lnBasic.getF01DEAPEI().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<input type="text" name="E01DEAPIF" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPIF().trim()%>" readonly<% if (lnBasic.getF01DEAPIF().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">L&iacute;nea de Cr&eacute;dito :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= lnBasic.getE01DEACMC().trim()%>" readonly<% if (lnBasic.getF01DEACMC().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= lnBasic.getE01DEACMN().trim()%>" readonly<% if (lnBasic.getF01DEACMN().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Centro de Costo :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= lnBasic.getE01DEACCN().trim()%>" readonly<% if (lnBasic.getF01DEACCN().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td align=right nowrap>
							<div align="right">Banco/Sucursal :</div>
						</td>
						<td nowrap>
								<eibsinput:text property="E01DEABNK" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" modified="F01DEABNK"/>
								<eibsinput:text property="E01DEABRN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true" modified="F01DEABRN"/>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Numero Referencia :</div>
						</td>
						<td nowrap width="25%" >
								<eibsinput:text property="E01DEAREF" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_REFERENCE %>" readonly="true" modified="F01DEAREF"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Tabla Tasas Matriz :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEARTB" size="3" maxlength="2" value="<%= lnBasic.getE01DEARTB().trim() %>" readonly<% if (lnBasic.getF01DEARTB().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tabla de Parametros :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEATLN" size="3" maxlength="2" value="<%= lnBasic.getE01DEATLN().trim()%>" readonly<% if (lnBasic.getF01DEATLN().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"  align="right">Direcci&oacute;n de Correo :</td>
						<td nowrap width="25%" >
									<input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMLA().trim()%>" readonly<% if (lnBasic.getF01DEAMLA().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Tabla de Cargos :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEAOFT" size="3" maxlength="2" value="<%= lnBasic.getE01DEAOFT().trim()%>" readonly<% if (lnBasic.getF01DEAOFT().equals("Y")) out.print("class=\"txtchanged\""); %>>
							<b>&nbsp; &nbsp; Personalizar</b>
								<a href="javascript: setComissionTable('true')"><img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
							<td nowrap width="25%" > 
									<div align="right">Condici&oacute;n  Cr&eacute;dito :</div>
							</td>
							<td width="25%" > 
									<input type="text" name="E01DEADLC" size="2" maxlength="1" readonly value="<%= lnBasic.getE01DEADLC().trim()%>"<% if (lnBasic.getF01DEADLC().equals("Y")) out.print("class=\"txtchanged\""); %> >
							</td> 
						<td nowrap width="25%" > 
							<div align="right">Per&iacute;odo de Gracia :</div>
						</td>
						<td nowrap width="27%" > 
							<input type="text" name="E01DEAGPD" size="3" maxlength="2" value="<%= lnBasic.getE01DEAGPD().trim()%>" readonly<% if (lnBasic.getF01DEAGPD().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Comisionista :</div>
						</td>
						<td nowrap width="25%" > 
								<eibsinput:text property="E01DEABRK" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER %>" readonly="true" modified="F01DEABRK"/>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Porcentaje Comisionista :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEABCP" size="10" maxlength="9" value="<%= lnBasic.getE01DEABCP().trim()%>"  readonly<% if (lnBasic.getF01DEABCP().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Ciclo Revisi&oacute;n de Tasa :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= lnBasic.getE01DEARRP().trim()%>" readonly<% if (lnBasic.getF01DEARRP().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Fecha Revisi&oacute;n de Tasa :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:date name="lnBasic"  fn_month="E01DEARRM" fn_day="E01DEARRD" fn_year="E01DEARRY" readonly="true" modified="F01DEARRY,F01DEARRM,F01DEARRD"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Ciclo Envio Estado de Cuenta :</div>
						</td>
						<td nowrap width="25%" > 
							<input type="text" name="E01DEASTC" size="3" maxlength="3" value="<%= lnBasic.getE01DEASTC().trim()%>" readonly<% if (lnBasic.getF01DEASTC().equals("Y")) out.print("class=\"txtchanged\""); %> >
						</td>
						<td nowrap width="25%" > 
							<div align="right">Fecha Envio Estado de Cuenta :</div>
						</td>
						<td nowrap width="25%" > 
							<eibsinput:date name="lnBasic" fn_month="E01DEAEDM" fn_day="E01DEAEDD" fn_year="E01DEAEDY" readonly="true" modified="F01DEAEDY,F01DEAEDD,F01DEAEDM"/> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Ciclo Revisi&oacute;n del Prestamo :</div>
						</td>
						<td nowrap width="25%"> 
							<input type="text" name="E01DLCRVC" size="3" maxlength="3" value="<%= lnBasic.getE01DLCRVC().trim()%>"  readonly<% if (lnBasic.getF01DLCRVC().equals("Y")) out.print("class=\"txtchanged\""); %>>
									<select name="E01DLCRVT" id="E01DLCRVT" disabled="disabled"<% if (lnBasic.getF01DLCRVT().equals("Y")) out.print("class=\"txtchanged\""); %>>
									<OPTION value=" "<% if (!(lnBasic.getE01DLCRVT().equals("D") ||lnBasic.getE01DLCRVT().equals("M")||lnBasic.getE01DLCRVT().equals("Y"))) out.print("selected"); %>></OPTION>
									<OPTION value="D"<% if(lnBasic.getE01DLCRVT().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
									<OPTION value="M"<% if(lnBasic.getE01DLCRVT().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
									<OPTION value="Y"<% if(lnBasic.getE01DLCRVT().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
									</select>
						</td>
						<td nowrap width="25%" >
						<div align="right">Fecha Revisi&oacute;n del Prestamo :</div>
							</td>
						<td nowrap width="25%"> 
							<eibsinput:date name="lnBasic"  fn_month="E01DLCRDM" fn_day="E01DLCRDD" fn_year="E01DLCRDY" readonly="true" modified="F01DLCRDY,F01DLCRDD,F01DLCRDM"/> 
						</td>
					</tr>

					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Tipo de Relacion 1 :</div>
						</td>
						<td nowrap width="23%" > 
							<input type="text" name="E01DEAPAR" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPAR().trim()%>" readonly<% if (lnBasic.getF01DEAPAR().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
						<td nowrap width="25%" > 
							<div align="right">Cuenta  Relacion 1 :</div>
						</td>
						<td nowrap width="27%" > 
							<input type="text" name="E01DEAPAC" size="12" maxlength="12" value="<%= lnBasic.getE01DEAPAC().trim()%>" readonly<% if (lnBasic.getF01DEAPAC().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Tipo de Relacion 2 :</div>
						</td>
						<td nowrap width="23%" >
							<input type="text" name="E01DEARET" size="2" maxlength="1" value="<%= lnBasic.getE01DEARET().trim()%>" readonly<% if (lnBasic.getF01DEARET().equals("Y")) out.print("class=\"txtchanged\""); %>>
						<td nowrap width="25%" >
							<div align="right">Cuenta  Relacion 2 :</div>
						</td>
						<td nowrap width="27%" >
							<input type="text" name="E01DEAREA" size="12" maxlength="12" value="<%= lnBasic.getE01DEAREA().trim()%>" readonly<% if (lnBasic.getF01DEAREA().equals("Y")) out.print("class=\"txtchanged\""); %>>
						</td>
					</tr>  
					<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width=25%>
							<div align="right">Informa x Reestructuraci&oacute;n :</div>
						</td>
						<td nowrap width="23%">
								<input type="hidden" name="E01DEAFLY" value="<%= lnBasic.getE01DEAFLY()%>" readonly >
								<input type="radio" name="CE01DEAFLY" disabled="disabled" readonly="readonly" value="Y"<%if(lnBasic.getE01DEAFLY().equals("Y")) out.print("checked");%><% if (lnBasic.getF01DEAFLY().equals("Y")) out.print("class=\"txtchanged\""); %>>S&iacute; 
								<input type="radio" name="CE01DEAFLY" disabled="disabled" readonly="readonly" value="N"<%if(!lnBasic.getE01DEAFLY().equals("Y")) out.print("checked");%><% if (lnBasic.getF01DEAFLY().equals("Y")) out.print("class=\"txtchanged\""); %>>No 
						</td>
						<td nowrap width="25%" >
								<div align="right">Acci&oacute;n Sobre un Cambio de Tasa :</div>
						</td>
						<td nowrap width="27%" >
							<select name="E01DEAXRF" disabled="disabled"<% if (lnBasic.getF01DEAXRF().equals("Y")) out.print("class=\"txtchanged\""); %>> 
								<option value="T"<% if (lnBasic.getE01DEAXRF().equals("T")) out.print("selected"); %>>Cambiar el Plazo</option>
								<option value="P"<% if (lnBasic.getE01DEAXRF().equals("P")) out.print("selected"); %>>Cambiar la Cuota</option>
							</select>
						</td>
					</tr>  
						<%if(lnBasic.getE01DEACLF().equals("H")){%>
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td width="25%">
										<div align="right">Valor de la Vivienda :</div>
								</td>
								<td width="25%">
										<eibsinput:text property="E01DLCVVI" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="TRUE" modified="F01DLCVVI"  /> 
								</td>
								<td width="25%">
								<div align="right">Aplica Renta Exenta :</div>
								</td>
								<td nowrap width="25%" > 
									<input type="hidden" name="E01DLCFRE" value="<%= lnBasic.getE01DLCFRE()%>" readonly >
									<input type="radio" name="CE01DLCFRE" disabled="disabled" readonly="readonly" value="Y"<%if(lnBasic.getE01DLCFRE().equals("Y")) out.print("checked");%><% if (lnBasic.getF01DLCFRE().equals("Y")) out.print("class=\"txtchanged\""); %>>S&iacute; 
									<input type="radio" name="CE01DLCFRE" disabled="disabled" readonly="readonly" value="N"<%if(!lnBasic.getE01DLCFRE().equals("Y")) out.print("checked");%><% if (lnBasic.getF01DLCFRE().equals("Y")) out.print("class=\"txtchanged\""); %>>No 
								</td>
						</tr>
						<% } %>     
						<%if(lnBasic.getE01DEACLF().equals("S")){%>
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="25%" > 
									<div align="right">Entidad Avaladora :</div>
								</td>
								<td width="75%" colspan="3">
									<eibsinput:text name="lnBasic" property="E01DLCCAV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" modified="F01DLCCAV" readonly="true" />
									<eibsinput:text name="lnBasic" property="E01DSCCAV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" modified="F01DLCCAV" readonly="true" />
								</td>
						</tr>    
				<% } %>      
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Fuente de Recurso :</div>
						</td>
						<td nowrap width="23%" >
							<eibsinput:cnofc name="lnBasic" flag="RS" property="E01DEAUC7" fn_code="E01DEAUC7" fn_description="" readonly="true" />
						<td nowrap width="25%" >
							<div align="right">N&uacute;mero de Pagar&eacute; :</div>
						</td>
						<td nowrap width="27%" >
							<input type="text" name="E01DEAIVC" size="14" maxlength="12" value="<%= lnBasic.getE01DEAIVC().trim()%>" readonly>                
						</td>
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Fecha de Suscripci&oacute;n :</div>
						</td>
						<td nowrap width="23%" >
							<eibsinput:date name="lnBasic" fn_year="E01DEAPSY" fn_month="E01DEAPSM" fn_day="E01DEAPSD" readonly="true"/>
						<td nowrap width="25%" >
							<div align="right">Abierto o Cerrado :</div>
						</td>
						<td nowrap width="27%" >
							<input type="radio" id="E01DEAF07" name="E01DEAF07" value="Y"<%if (!lnBasic.getE01DEAF07().equals("N")) out.print("checked"); %> disabled > Abierto 
							<input type="radio" id="E01DEAF07" name="E01DEAF07" value="N"<%if (lnBasic.getE01DEAF07().equals("N"))  out.print("checked"); %> disabled > Cerrado                
						</td>
					</tr>  
					<tr id="fngTR" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
						<td nowrap width="25%">
									<div align="right">Indice Cobertura de la Garantía :</div>
						</td>
						<td nowrap width="25%"> 
							<input type="text" name="E01DEAA01" size="10" maxlength="9" value="<%= lnBasic.getE01DEAA01().trim()%>" readonly>
						</td>
							<td nowrap width="25%" > 
									<div align="right">Tasa de Cambio M/E :</div>
							</td>
							<td nowrap width="25%" > 
									<input type="text" name="E01DEAEXR" size="13" maxlength="12" value="<%= lnBasic.getE01DEAEXR().trim()%>" readonly<% if (lnBasic.getF01DEAEXR().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</td>
				</tr>
					<%if (currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CO"))) {%>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Registra FG :</div><!-- FNG -->
						</td>
						<td nowrap width="23%" >
							<input type="radio" name="E01DLCFL6" value="Y"<%if (lnBasic.getE01DLCFL6().equals("Y"))  out.print("checked"); %> disabled > Si 
							<input type="radio" name="E01DLCFL6" value="N"<%if (!lnBasic.getE01DLCFL6().equals("Y")) out.print("checked"); %> disabled > No
						<td nowrap width="25%" >
							<div align="right">Numero de Reserva :</div>
						</td>
						<td nowrap width="27%" >
							<eibsinput:text property="E01DLCRF1" maxlength="12" size="14" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" readonly="true" /> 
						</td>
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" >
							<div align="right">Referido por :</div>
						</td>
						<td nowrap width="23%" >
							<input type="text" name="E01CMOREF" size="12" maxlength="10" value="<%= lnBasic.getE01CMOREF().trim()%>" readonly > 
						<td nowrap width="25%" >
							<div align="right">Amort. Nic 39 :</div>
						</td>
						<td nowrap width="27%" >
							<eibsinput:help fn_param_one="E01DEABRK" fn_param_three="S" property="E01DEABRK" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER %>" readonly="true" /> 
						</td>
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Credito Milagroso :</div></td>
						<td nowrap width="23%"<%=(lnBasic.getF01DLCFL9().equals("Y"))?"id=\"txtchanged\"":"" %> >
							<input type="radio" name="E01DLCFL9" disabled="disabled" readonly="readonly" value="Y"<%if( lnBasic.getE01DLCFL9().equals("Y")) out.print("checked");%> >S&iacute; 
							<input type="radio" name="E01DLCFL9" disabled="disabled" readonly="readonly" value="N"<%if(!lnBasic.getE01DLCFL9().equals("Y")) out.print("checked");%> >No 
						<td nowrap width="25%" ><div align="right">Tasa de Beneficio :</div></td>
						<td nowrap width="27%" >
							<eibsinput:text name="lnBasic" property="E01BNFRTE" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" /> 
						</td>
					</tr>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Novaci&oacute;n :</div></td>
						<td nowrap width="23%" >
							<input type="radio" name="E01DEAECU" disabled="disabled" readonly="readonly" value="Y"<%if( lnBasic.getE01DEAECU().equals("Y")) out.print("checked");%> >S&iacute; 
							<input type="radio" name="E01DEAECU" disabled="disabled" readonly="readonly" value="N"<%if(!lnBasic.getE01DEAECU().equals("Y")) out.print("checked");%> >No 
						<td nowrap width="25%" ><div align="right"></div></td>
						<td nowrap width="27%" >
						</td>
					</tr>  
					<%  if (lnBasic.getE01DEAECU().equals("Y")) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" ><div align="right">Tipo Novaci&oacute;n :</div></td>
						<td nowrap width="23%" >
							<eibsinput:cnofc name="lnBasic" flag="RY" property="E01DLCTPR" fn_code="E01DLCTPR" fn_description="" readonly="true" />
						<td nowrap width="25%" ><div align="right">Condici&oacute;n Novaci&oacute;n :</div></td>
						<td nowrap width="27%" >
							<eibsinput:cnofc name="lnBasic" flag="RO" property="E01DLCCDR" fn_code="E01DLCCDR" fn_description="" readonly="true" />
						</td>
					</tr>  
					<%  } %>
					<%} %>
				</table>
			</td>
		</tr>
	</table>
<%-- 
<H4>Información  Impuestos</H4>
	<table  class="tableinfo" style="width: 100%" align="center">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%"  align="right"></td>
						<td nowrap width="25%" > 
						</td>
						<td nowrap width="25%" ></td>
						<td nowrap width="25%" ></td>
					</tr> 
					<%if(currUser.getE01INT().equals("05")){%> 
						<%if (lnBasic.getE01FLGNEW().trim().equals("N")) {%>         
						<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
							<td nowrap width="25%" > 
									<div align="right">Afecto a G.M.F. :</div>
								</td>
								<td nowrap width="25%" > 
									<input type="hidden" name="E01FLGIDB" value="<%= lnBasic.getE01FLGIDB()%>" readonly >
									<input type="radio" disabled="disabled" name="CE01FLGIDB" value="Y" onClick="document.forms[0].E01FLGIDB.value = 'Y'"
										<%if(lnBasic.getE01FLGIDB().equals("Y")) out.print("checked");%><% if (lnBasic.getF01FLGIDB().equals("Y")) out.print("class=\"txtchanged\""); %> readonly>S&iacute; 
									<input type="radio" disabled="disabled" name="CE01FLGIDB" value="N" onClick="document.forms[0].E01FLGIDB.value = 'N'"
										<%if(!lnBasic.getE01FLGIDB().equals("Y")) out.print("checked");%><% if (lnBasic.getF01FLGIDB().equals("Y")) out.print("class=\"txtchanged\""); %>readonly>No 
								</td>
								<td nowrap width="25%" > 
									<div align="right">Monto Base Imponible G.M.F :</div>
								</td>
								<td nowrap width="25%" >
										<eibsinput:text property="E01BASIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01BASIMP"/> 
								</td>
							</tr>
						<%} else { %>
							<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
								<td nowrap width="25%" > 
									<div align="right"></div>
								</td>
								<td nowrap width="25%" > 
								</td>
								<td nowrap width="25%" > 
									<div align="right">Monto Base Imponible G.M.F :</div>
								</td>
								<td nowrap width="25%" >
										<eibsinput:text property="E01BASIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01BASIMP"/> 
								</td>
							</tr>
						<%}%>
					<%}%>
					<%if(currUser.getE01INT().equals("07")){%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
							<td width="25%"> 
								<div align="right">Cobro del FECI :</div>
							</td>
							<td width="25%"> 
								<input type="radio" name="E01DEATX2" value="F"<%if (lnBasic.getE01DEATX2().equals("F")) out.print("checked"); %> readonly<% if (lnBasic.getF01DEATX2().equals("Y")) out.print("class=\"txtchanged\""); %>>Si 
								<input type="radio" name="E01DEATX2" value="N"<%if (!lnBasic.getE01DEATX2().equals("F")) out.print("checked"); %> readonly<% if (lnBasic.getF01DEATX2().equals("Y")) out.print("class=\"txtchanged\""); %>>No
							</td>
								<td nowrap width="25%" > 
									<div align="right"></div>
								</td>
								<td nowrap width="25%" > 
								</td>
						</tr>  
					<% } %>
				</table>
			</td>
		</tr>
	</table> --%>
	
<% if ("Y".equals(FLGSBS)) { %>
<H4>Subsidio</H4>
	<table  class="tableinfo" style="width: 100%" align="center">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Entidad :</div>
						</td>
						<td nowrap width="75%" >
							<eibsinput:text name="lnBasic" property="E01DLCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" modified="F01DLCCFS" readonly="true" />
							<eibsinput:text name="lnBasic" property="E01DSCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" modified="F01DSCCFS" readonly="true" />
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Tasa Subsidio :</div>
						</td>
						<td nowrap width="75%" >
							<eibsinput:text name="lnBasic" property="E01DLCRFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" modified="F01DLCRFS" readonly="true" />
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Tasa Total de Prestamo :</div>
						</td>
						<td nowrap width="75%" >
							<eibsinput:text name="lnBasic" property="E01TOTRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"/>
						</td>
					</tr>           
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Referencia Subsidio :</div>
						</td>
						<td nowrap width="75%" >
							<eibsinput:text name="lnBasic" property="E01DLCNRS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="12" maxlength="12" readonly="true" modified="F01DLCNRS" />
						</td>
					</tr>           
					<% if (!("N".equals(FLGNEW))){ %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Terminaci&oacute;n Por :</div>
						</td>
						<td nowrap width="25%" >
								<select name="E01DLCFFS" disabled="disabled"<% if (lnBasic.getF01DLCFFS().equals("Y")) out.print("class=\"txtchanged\""); %>>
								<option value=" "
										<% if (!(lnBasic.getE01DLCFFS().equals("1") ||lnBasic.getE01DLCFFS().equals("2")||lnBasic.getE01DLCFFS().equals("3")|| lnBasic.getE01DLCFFS().equals("4")
											 || lnBasic.getE01DLCFFS().equals("5") || lnBasic.getE01DLCFFS().equals("6") || lnBasic.getE01DLCFFS().equals("7")))  out.print("selected"); %>></option>
									<OPTION value="1"<% if(lnBasic.getE01DLCFFS().equals("1")) out.print("selected");%>>Pago Anticipado</OPTION>
									<OPTION value="2"<% if(lnBasic.getE01DLCFFS().equals("2")) out.print("selected");%>>Vencido</OPTION>
									<OPTION value="3"<% if(lnBasic.getE01DLCFFS().equals("3")) out.print("selected");%>>Cesion de Contrato</OPTION>
									<OPTION value="4"<% if(lnBasic.getE01DLCFFS().equals("4")) out.print("selected");%>>Reestructuracion</OPTION>
									<OPTION value="5"<% if(lnBasic.getE01DLCFFS().equals("5")) out.print("selected");%>>Aceleracion</OPTION>
									<OPTION value="6"<% if(lnBasic.getE01DLCFFS().equals("6")) out.print("selected");%>>Peticion Cliente</OPTION>
									<OPTION value="7"<% if(lnBasic.getE01DLCFFS().equals("7")) out.print("selected");%>>Fallecimiento Cliente</OPTION>
							</select>
						</td>
					</tr>
					<%}%>          
						<%if(!lnBasic.getE01DEACLF().equals("H")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Valor de la Vivienda :</div>
						</td>
						<td nowrap width="75%" >
							<eibsinput:text name="lnBasic" property="E01DLCVVI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" modified="F01DLCVVI" readonly="true" />
					</tr> 
					<%}%>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="25%" > 
							<div align="right">Fecha de Expiraci&oacute;n :</div>
						</td>
						<td nowrap width="75%" >
							<eibsinput:date name="lnBasic" fn_month="E01DLCFSM" fn_day="E01DLCFSD" fn_year="E01DLCFSY" modified="F01DLCFSM,F01DLCFSD,F01DLCFSY" readonly="true" />
						</td>
					</tr> 
				</table>
			</td>
		</tr>
	</table>
<%}%>    

<h4>Impuestos</h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" > 
							<div align="center"></div>
						</td>
						<td nowrap width="10%" > 
							<div align="center">ISR</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center">IVA/ITBMS</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center">IDB/GMF</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
									<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA"))){ %>  
											FECI 
									<% } else if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))) {%>
											ITE
									<% } %>
						</div></td>
						<td nowrap width="10%" > 
							<div align="center"></div>
						</td>
				</tr>        
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="15%" > 
							<div align="center"></div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
								<select id="E01DEATX1" name="E01DEATX1" disabled="disabled"<% if (lnBasic.getF01DEATX1().equals("Y")) out.print("class=\"txtchanged\""); %>>
										<option value=" " selected> &nbsp;</option>
										<option value="1"<% if(lnBasic.getE01DEATX1().equals("1")) out.print("selected");%>> SI</option>
										<option value="0"<% if(lnBasic.getE01DEATX1().equals("0")) out.print("selected");%>> NO</option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%"  > 
							<div align="center"> 
								<select id="E01DEATX2" name="E01DEATX2" disabled="disabled"<% if (lnBasic.getF01DEATX2().equals("Y")) out.print("class=\"txtchanged\""); %>>
										<option value=" " selected> &nbsp;</option>
										<option value="1"<% if(lnBasic.getE01DEATX2().equals("1")) out.print("selected");%>> SI</option>
										<option value="0"<% if(lnBasic.getE01DEATX2().equals("0")) out.print("selected");%>> NO</option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<select id="E01DEATX3" name="E01DEATX3" disabled="disabled"<% if (lnBasic.getF01DEATX3().equals("Y")) out.print("class=\"txtchanged\""); %>>
										<option value=" " selected> &nbsp;</option>
										<option value="1"<% if(lnBasic.getE01DEATX3().equals("1")) out.print("selected");%>> SI</option>
										<option value="0"<% if(lnBasic.getE01DEATX3().equals("0")) out.print("selected");%>> NO</option>
								</select>        
							</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"> 
								<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %> 
								<select id="E01DEATX4" name="E01DEATX4" disabled="disabled"<% if (lnBasic.getF01DEATX4().equals("Y")) out.print("class=\"txtchanged\""); %>>
										<option value=" " selected> &nbsp;</option>
										<option value="1"<% if(lnBasic.getE01DEATX4().equals("1")) out.print("selected");%>> SI</option>
										<option value="0"<% if(lnBasic.getE01DEATX4().equals("0")) out.print("selected");%>> NO</option>
								</select>                 
								<% } %>
						</div>
						</td>
						<td nowrap width="10%" > 
							<div align="center"></div>
						</td>
				</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Prioridad de Pagos</h4>
	<table class="tableinfo" style="width: 100%" align="center">
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" name="E01DEAPP1" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP1().trim()%>" readonly<% if (lnBasic.getF01DEAPP1().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" name="E01DEAPP2" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP2().trim()%>" readonly<% if (lnBasic.getF01DEAPP2().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<input type="text" name="E01DEAPP3" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP3().trim()%>" readonly<% if (lnBasic.getF01DEAPP3().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" name="E01DEAPP4" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP4().trim()%>" readonly<% if (lnBasic.getF01DEAPP4().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<input type="text" name="E01DEAPP5" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP5().trim()%>" readonly<% if (lnBasic.getF01DEAPP5().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" name="E01DEAPP6" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP6().trim()%>" readonly<% if (lnBasic.getF01DEAPP6().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
						<%if(currUser.getE01INT().equals("07")){%> 
								<td nowrap width="12%"  > 
									<div align="center"> 
										<input type="text" name="E01DEAPP7" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP7().trim()%>" readonly<% if (lnBasic.getF01DEAPP7().equals("Y")) out.print("class=\"txtchanged\""); %>>
									</div>
								</td>
							<% } %>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" name="E01DEAPP8" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP8().trim()%>" readonly<% if (lnBasic.getF01DEAPP8().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
					</tr>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="12%" > 
							<div align="center">Principal</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Intereses</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Mora</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Comisiones</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Impuestos</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center">Deducciones</div>
						</td>
						<%if(currUser.getE01INT().equals("07")){%> 
								<td nowrap width="12%" > 
									<div align="center">FECI</div>
								</td>
							<% } %>
						<td nowrap width="12%" > 
							<div align="center">Cobranzas</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

 
<% if ("N".equals(FLGNEW) && "Y".equals(ASSEST)){ %>  
	<!-- Reliquidaciones de Creditos -->
	<% session.setAttribute("EMPRC","A"); %>
	<br>
	<iframe id="ifremprc" frameborder="0" scrolling="no" style="height: 200px; width: 100%;" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1110?SCREEN=101&E01PRLCUN=<%=lnBasic.getE01DEACUN()%>&E01PRLNUM=<%=lnBasic.getE01DEAOFN()%>"></iframe>  
	<br>
	<!-- Otros Conceptos a Reliquidar -->
	<% session.setAttribute("EMPRN","A"); %>
	<iframe frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1120?SCREEN=101&E01ORLCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01ORLNUM=<%=lnBasic.getE01DEAOFN().trim()%>&prdCode=<%=lnBasic.getE01DEAPRO().trim()%>"></iframe>  
<% } %> 

	<!-- Bloqueo Recepcion de Pago -->
	<br>
	<iframe id="ifrempbl" frameborder="0" scrolling="no" style="height:110px;width:100%;" src="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150?SCREEN=333&iFrame=true"></iframe>  
	<br>

	<h4>Cuenta de Pago</h4>
	<table class="tableinfo" >
		<tr> 
			<td nowrap align="left"> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0" >
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="30%" align="right"> Autoriza Sobregiro :</td>
						<td nowrap width="20%" > 
							<div align="left">
								<input type="text" name="E01DEAODA" size="2" maxlength="1" readonly value="<%= lnBasic.getE01DEAODA().trim()%>"<% if (lnBasic.getF01DEAODA().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
						<td nowrap width="30%" ><div align="right">Autoriza Pagos en Feriados :</div></td>
						<td nowrap width="20%" > 
							<div align="left">
								<input type="text" name="E01DEAHFQ" size="60" maxlength="60" readonly value="<% if (lnBasic.getE01DEAHFQ().equals("1")) out.print("Acepta Dias Feriados");
								else if (lnBasic.getE01DEAHFQ().equals("2")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Anterior");
								else if (lnBasic.getE01DEAHFQ().equals("3")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Siguiente");
								else out.print("");%>"<% if (lnBasic.getF01DEAHFQ().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="30%" align="right"> Forma de Pago :</td>
						<td nowrap width="20%" > 
							<div align="left">
								<select name="E01DEAPVI" id="E01DEAPVI" disabled="disabled"<% if (lnBasic.getF01DEAPVI().equals("Y")) out.print("class=\"txtchanged\""); %>>
									<option value=" "<% if (lnBasic.getE01DEAPVI().equals(" ")) out.print("selected"); %>>Caja</option>
									<option value="1"<% if (lnBasic.getE01DEAPVI().equals("1")) out.print("selected"); %>>Automatico</option>                   
									<option value="2"<% if (lnBasic.getE01DEAPVI().equals("2")) out.print("selected"); %>>Convenio</option>  
									<option value="3"<% if (lnBasic.getE01DEAPVI().equals("3")) out.print("selected"); %>>M&uacute;ltiple Cuentas</option>                 
									<option value="4"<% if (lnBasic.getE01DEAPVI().equals("4")) out.print("selected"); %>>PAC Multibanco</option>                   
								</select>
							</div>
						</td>
						<td nowrap width="30%" id="intento" style="border: 0px; display: none;">
							<div align="right">Intento Cobro :</div>
						</td>
						<td nowrap width="20%" id="intento2" style="border: 0px; display: none;"> 
							<div align="left">
								<eibsinput:text property="E01DLCCMC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="true" />
							</div>
						</td>
					</tr>
					<tr id="autocuenta" style="border: 0px; display: none; width: 100%" >
						<td colspan="5" style="width: 100%">
							<table style="border: 0px; width: 100%">
								<tr id="trdark"> 
									<td nowrap width="28%"><div align="center">Concepto</div></td>
									<td nowrap width="10%"><div align="center">Banco</div></td>
									<td nowrap width="10%"><div align="center">Sucursal</div></td>
									<td nowrap><div align="center">Moneda</div></td>
									<td nowrap><div align="center">Referencia</div></td>
									<td nowrap><div align="center">Titular</div></td>
									<td nowrap></td>
								</tr>
								<tr id="trclear">
									<td nowrap width="28%" > 
										<div align="center" >
											<input type="hidden" name="E01PAGGLN" readonly value="<%= lnBasic.getE01PAGGLN().trim()%>"<% if (lnBasic.getF01PAGGLN().equals("Y")) out.print("class=\"txtchanged\""); %>>
											<input type="text" name="E01PAGCON" id="E01PAGCON" size="25" maxlength="25" readonly value="<%= lnBasic.getE01PAGCON().trim()%>"<% if (lnBasic.getF01PAGCON().equals("Y")) out.print("class=\"txtchanged\""); %>>
										</div>
									</td>
									<td nowrap width="10%" > 
										<div align="center"> 
											<input type="text" name="E01PAGBNK" size="2" maxlength="2" readonly value="<%= lnBasic.getE01PAGBNK().trim()%>"<% if (lnBasic.getF01PAGBNK().equals("Y")) out.print("class=\"txtchanged\""); %>> 
										</div>
									</td>
									<td nowrap width="10%" > 
										<div align="center"> 
											<input type="text" name="E01PAGBRN" size="4" maxlength="4" readonly value="<%= lnBasic.getE01PAGBRN().trim()%>"<% if (lnBasic.getF01PAGBRN().equals("Y")) out.print("class=\"txtchanged\""); %>> 
										</div>
									</td>
									<td nowrap width="10%" > 
										<div align="center"> 
											<input type="text" name="E01PAGCCY" size="3" maxlength="3" readonly value="<%= lnBasic.getE01PAGCCY().trim()%>"<% if (lnBasic.getF01PAGCCY().equals("Y")) out.print("class=\"txtchanged\""); %>>
										</div>
									</td>
									<td nowrap width="14%" > 
										<div align="center"> 
											<input type="text" name="E01PAGACC" class="context-menu-inq" onmousedown="init(inqAccount, this.value)" size="12" maxlength="12" readonly value="<%= lnBasic.getE01PAGACC().trim()%>"<% if (lnBasic.getF01PAGACC().equals("Y")) out.print("class=\"txtchanged\""); %>>
										</div>
									</td>
									<td nowrap width="28%" > 
										<div align="center"> 
											<input type="text" readonly name="E01PAGNME" size="25" maxlength="25" readonly value="<%= lnBasic.getE01PAGNME().trim()%>"<% if (lnBasic.getF01PAGNME().equals("Y")) out.print("class=\"txtchanged\""); %>>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr id="convenioTable" style="display: none;width: 100%" >
						<td colspan="5" style="width: 100%">
							<table style="border-collapse: collapse;" cellpadding=2 cellspacing=0 width="100%" border="0">
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<td nowrap width="28%" ><div align="right">Codigo de Convenio :</div></td>
									<td nowrap width="72%" > 
										<div align="left" >
											<input type="text" name="E01DEACNV" id="" size="5" maxlength="4" value="<%= lnBasic.getE01DEACNV().trim()%>"   readonly<% if (lnBasic.getF01DEACNV().equals("Y")) out.print("class=\"txtchanged\""); %>>                    
											<eibsinput:text name="lnBasic" property="E01DSCCNV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
										</div>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="28%" ><div align="right">Pagadurias :</div></td>
									<td nowrap width="72%"> 
										<div align="left">
											<input type="text" name="E01DEAPGD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPGD().trim()%>" onKeypress="enterInteger(event);" readonly<% if (lnBasic.getF01DEAPGD().equals("Y")) out.print("class=\"txtchanged\""); %>>
											<eibsinput:text name="lnBasic" property="E01DSCPGD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
										</div>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="28%" ><div align="right">Novedad :</div></td>
									<td nowrap width="72%"> 
										<div align="left">
											<input type="text" name="E01DEAUC6" size="5" maxlength="4" value="<%= lnBasic.getE01DEAUC6().trim()%>"  readonly<% if (lnBasic.getF01DEAUC6().equals("Y")) out.print("class=\"txtchanged\""); %>>
											<eibsinput:text name="lnBasic" property="E01DSCUC6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
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
								<tr  height="95%">    
									<td nowrap="nowrap" valign="top">      
										<div id="dataDiv1" style="width: 100%; height:106px; overflow:auto;"> 
											<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
												<% for (int i=1;i<10;i++) {%>
												<tr id="trclear"> 
													<td nowrap width="15%" align="center"><%= i %>
														<input type=text name="<%="E01PGACC"+i%>" class="context-menu-inq" onmousedown="init(inqAccount, this.value)" size="13" maxlength="12" readonly value="<%=lnBasic.getFieldString("E01PGACC"+i) %>"> 
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
														<input type=text name="<%="E01PGPER"+i%>" size="8" maxlength="7" class="txtright" readonly value="<%=lnBasic.getFieldString("E01PGPER"+i) %>"> 
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
<div  id="planPago"></div>

<% if(isDEAIPDNum && DEAPPD.equals("SCH")){ %>
	<h5 align="center">Pagar el Inter&eacute;s seg&uacute;n Ciclo Preestablecido 
		y el Capital seg&uacute;n Plan de Pagos Irregular</h5>
<%}%>
 
<%if (DEAIPD.equals("SCH") && DEAPPD.equals("SCH")) { %> 
	<%if (!lnBasic.getE01DEAACC().trim().equals("999999999999") ){ %> 
		<% session.setAttribute("EMPPP","A"); %>
		<iframe id="ifremppp" frameborder="0" scrolling="no" style="height: 200px; width: 100%;" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155?SCREEN=2&E01DEAACC=<%=lnBasic.getE01DEAACC()%>"></iframe>
	<%}%>
<%}%>

<% if ("N".equals(FLGNEW)){ %>

<% if ("Y".equals(ASSEST)){ %>
	<br>
	<!-- Seguros Financiados -->
	<% session.setAttribute("EMPSG","A"); %>
	<iframe id="ifrempsg" frameborder="0" scrolling="no" style="height: 200px; width: 100%;" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&E01PSGCUN=<%=lnBasic.getE01DEACUN()%>&E01PSGNUM=<%=lnBasic.getE01DEAOFN()%>"></iframe>  

	<br>
	<!-- Cargos Adicionales -->
	<% session.setAttribute("EMPCA","A"); %>
	<iframe  id="ifrempca" frameborder="0" scrolling="no" style="height: 200px; width: 100%;" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&E01PVHCUN=<%=lnBasic.getE01DEACUN()%>&E01PVHNUM=<%=lnBasic.getE01DEAOFN()%>"></iframe>  
<%}%>

	<!-- Destino de Fondos -->
	<% session.setAttribute("EMPDF","A"); %>
	<iframe id="ifrempdf" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1168?SCREEN=101&ACT=N&E01PDFCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PDFNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>


<h4>Distribuci&oacute;n</h4> 
<table class="tableinfo" style="width: 100%" align="center">
		<tr > 
				<td nowrap> 
						<table cellpadding=2 cellspacing=0 width="100%" border="0">
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
													<div align="right"></div>
										</td>
										<td nowrap width="10%">
										</td>
										<td nowrap width="10%"> 
											<div align="right">Monto del Cr&eacute;dito :</div>
										</td>
										<td nowrap width="50%"> 
												<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"   readonly="true"/> 
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Cr&eacute;dito Renegociados :</div>
										</td>
										<td nowrap width="50%">
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
											<div align="right">Otras Reliquidaciones :</div>
										</td>
											<td nowrap width="67%"> 
												<eibsinput:text property="E01TOTORN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Impuestos :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01TOTIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Comisiones :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01TOTCOM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Deducciones :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01TOTDED" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Seguros :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01TOTSGR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">I.V.A. :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01TOTIVA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
										</td>
									</tr>
<%--<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">G.M.F. :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01TOTGMF" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr> --%>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Otros Cargos :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01TOTOTH" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
							<%if (!lnBasic.getE01TOTPIN().trim().equals("0.00") ){ %> 
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Interes Prepagado :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01TOTPIN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
							<%}%>
							<%if (!lnBasic.getE01INTGRA().trim().equals("0.00") ){ %> 
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Pago Interes de Gracia  :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01INTGRA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" modified="F01INTGRA" readonly="true"/>
										</td>
									</tr>
							<%}%>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Monto Neto(Desembolso) :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01BALNET" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
							</table>
					</td>
		</tr>
</table>

	<br> 
	<!-- Desembolso -->
	<% session.setAttribute("EMPDS","A"); %>
	<iframe frameborder="0" scrolling="no" style="height: 250px; width: 100%;" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=101&Act=S&E01PVBCUN=<%=lnBasic.getE01DEACUN()%>&E01PVBNUM=<%=lnBasic.getE01DEAOFN()%>"></iframe>  


<% }else{ %>

<h4>Saldos</h4> 
<table class="tableinfo" style="width: 100%" align="center">
		<tr > 
				<td nowrap> 
						<table cellpadding=2 cellspacing=0 width="100%" border="0">
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
													<div align="right"></div>
										</td>
										<td nowrap width="10%">
										</td>
										<td nowrap width="10%"> 
											<div align="right">Monto Inicial :</div>
										</td>
										<td nowrap width="50%"> 
												<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Saldo Capital :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01SALPRI" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
										</td>
									</tr>
								<% if ("R".equals(lnBasic.getH01FLGWK3())){ %>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Saldo Reajuste :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01SALREA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
									<%}%>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Saldo Intereses :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01SALINT" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Saldo Mora :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01SALMOR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Otros Cargos :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01SALOTH" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
										</td>
									</tr>
									<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
										<td nowrap width="20%"> 
											<div align="right"></div>
										</td>
										<td nowrap width="10%"> 
										</td>
										<td nowrap width="10%"> 
											<div align="right">Total Deuda :</div>
										</td>
										<td nowrap width="50%">
												<eibsinput:text property="E01SALDUE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"  readonly="true"/>
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
						<table cellpadding=2 cellspacing=0 width="100%" border="0">
								<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
													<div align="right" style="font-weight: bold;">Plan de Fomento :</div>
										</td>
										<td width="75%" nowrap="nowrap" colspan="3">
													<eibsinput:text name="lnBasic" property="E01PFNCOD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" />
													<eibsinput:text name="lnBasic" property="E01PFNDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
										</td>
								</tr>
								<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
											<div align="right">Codigo de Producto :</div>
										</td>
										<td width="75%" nowrap="nowrap" colspan="3">
													<eibsinput:text name="lnBasic" property="E01PFNPRD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true" />
													&nbsp;
													<eibsinput:text name="lnBasic" property="E01PDSPRD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
										</td>
								</tr>
								<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
											<div align="right">Cliente Fomento :</div>
										</td>
										<td width="75%" nowrap="nowrap" colspan="3">
													<eibsinput:text name="lnBasic" property="E01PFNCUP" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true" />
													&nbsp;
													<eibsinput:text name="lnBasic" property="E01PFNCNM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
										</td>
								</tr>
								<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
											<div align="right">Prestamo Pasivo :</div>
										</td>
										<td width="25%" nowrap="nowrap">
													<eibsinput:text name="lnBasic" property="E01PFNPAC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true" />
										</td>
										<td width="25%" nowrap="nowrap">
											<div align="right">Tabla Tasa Flotante :</div>
										</td>
										<td width="25%" nowrap="nowrap">
											<div align="left">
													<eibsinput:text name="lnBasic" property="E01PFNFTB" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="true" />
											<select name="E01PFNFTY" id="E01PFNFTY" disabled="disabled"> 
												<option value=" "<% if (!(lnBasic.getE01PFNFTY().equals("FP") || lnBasic.getE01PFNFTY().equals("FS"))) out.print("selected"); %>></option>
												<option value="FP"<% if (lnBasic.getE01PFNFTY().equals("FP")) out.print("selected"); %>>FP</option>
												<option value="FS"<% if (lnBasic.getE01PFNFTY().equals("FS")) out.print("selected"); %>>FS</option>
											</select>                 
											</div>
										</td>
								</tr>
					<%if("2".equals(lnBasic.getE01PLGFLT())){ %>     
							<tr id="FLOATINGTABLE_FOMENTO2" class="<%=(rowF % 2 == 1) ? "trdark" : "trclear"%><%rowF++;%>" >
								<td> 
									<div align="right">Descripcion Tabla Flotante :</div>
								</td>
								<td> 
										<eibsinput:text property="E01PLTDSC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
								</td>
								<td> 
									<div align="right">Tasa Flotante Base :</div>
								</td>
								<td nowrap>
										<eibsinput:text property="E01PLTORG" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
								</td>
							</tr>
							<tr id="FLOATINGTABLE_FOMENTO" class="<%=(rowF % 2 == 1) ? "trdark" : "trclear"%><%rowF++;%>"> 
								<td> 
									<div align="right">Manejo Puntos Adicional  :</div>
								</td>
								<td nowrap width="25%" > 
										<select name="E01PFNFLX" disabled="disabled">
											<OPTION value=" "<% if (!(lnBasic.getE01PFNFLX().equals("B") ||lnBasic.getE01PFNFLX().equals("E")||lnBasic.getE01PFNFLX().equals("N"))) out.print("selected"); %>></OPTION>
											<OPTION value="B"<% if(lnBasic.getE01PFNFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
											<OPTION value="E"<% if(lnBasic.getE01PFNFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
											<OPTION value="N"<% if(lnBasic.getE01PFNFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
										</select>
									</td>
									<td> 
									<div align="right">Valor Tasa Adicional :</div>
								</td>
								<td nowrap width="25%"> 
										<eibsinput:text property="E01PFNRTX" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
								</td>
							</tr>
				<%}%>              
								<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
													<div align="right">Monto Original :</div>
										</td>
										<td width="25%" nowrap="nowrap">
													<eibsinput:text name="lnBasic" property="E01PFNOAM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
										</td>
										<td width="25%" nowrap="nowrap">
													<div align="right">Tasa Flotante :</div>
										</td>
										<td width="25%" nowrap="nowrap">
													<eibsinput:text name="lnBasic" property="E01PFNFRT" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
										</td>
								</tr>
								<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
													<div align="right">Valor de Cuota :</div>
										</td>
										<td width="25%" nowrap="nowrap">
													<eibsinput:text name="lnBasic" property="E01PFNVCU" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
										</td>
										<td width="25%" nowrap="nowrap">
													<div align="right">Tasa Fomento/Spread :</div>
										</td>
										<td width="25%" nowrap="nowrap">
													<eibsinput:text name="lnBasic" property="E01PFNRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"  />
										</td>
								</tr>
								<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
													<div align="right">Comision :</div>
										</td>
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
									<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
													<div align="right">Banco/Surcusal :</div>
										</td>
										<td width="25%" nowrap="nowrap">
													<eibsinput:text name="lnBasic" property="E01PFNBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="true" />
													<eibsinput:text name="lnBasic" property="E01PFNBRN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="true" />
										</td>
										<td width="25%" nowrap="nowrap">
													<div align="right">Tasa Efectiva :</div>
										</td>
										<td width="25%" nowrap="nowrap">
													<eibsinput:text name="lnBasic" property="E01PFNSPR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"  />
										</td>            
								</tr>
									<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
										<td width="25%" nowrap="nowrap">
													<div align="right">Cuenta de Desembolso :</div>
										</td>
										<td width="25%" nowrap="nowrap">
													<eibsinput:text name="lnBasic" property="E01PFNOBK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="true" />
													<eibsinput:text name="lnBasic" property="E01PFNOBR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="true" />
													<eibsinput:text name="lnBasic" property="E01PFNOCY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
													<eibsinput:text name="lnBasic" property="E01PFNOGL" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" readonly="true" />
										</td>            
										<td width="25%" nowrap="nowrap">
													<div align="right"></div>
										</td>
										<td width="25%" nowrap="nowrap">
										</td>
								</tr>
							</table>
					</td>
		</tr>
</table>   
	
	
	
<%--<% session.setAttribute("EMPFM","A"); %>
	<iframe id="ifrempfm" frameborder="0" scrolling="no" style="height: 235px; width: 100%;" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1130?SCREEN=100&E01PFNCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PFNNUM=<%=lnBasic.getE01DEAOFN().trim()%>&E01PFNACC=<%=lnBasic.getE01DEAACC().trim()%>&E01PFNCNM=<%=lnBasic.getE01CUSNA1().trim()%>"></iframe>  
 --%><% } %>

	<!-- Reajuste por Correcci&oacute;n Monetaria -->
<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
		<jsp:param name="flag" value="<%=lnBasic.getH01FLGWK3()%>" />
</jsp:include>


<% if ("Y".equals(ASSEST)){ %>
<h4>Garantias</h4>
	<TABLE  id="mainTable" class="tableinfo" style="height:106px; width: 100%" align="center">
		<tr  height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="98%">
						<tr id="trdark">
								<th nowrap width="15%" align="center">Cuenta</th>
								<th nowrap width="15%" align="center">Tipo</th>
								<th nowrap width="25%" align="center">Nombre</th>
								<th nowrap width="15%" align="center">Moneda</th>
								<th nowrap width="15%" align="center">Monto</th>
								<th nowrap width="15%" align="center">Porcentaje</th>
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
						<td nowrap width="15%" align="center"> 
									<%= i %>
								<input type=text name="<%="E01CLACB"+i%>" size="13" maxlength="12" value="<%=lnBasic.getFieldString("E01CLACB"+i) %>" readonly>
						</td>
						<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E01CLTYB"+i %>" size="5" maxlength="4" value="<%=lnBasic.getFieldString("E01CLTYB"+i) %>" readonly>
						</td>
						<td nowrap width="25%" align="center"> 
								<input type="text" name="<%="E01CLDSC"+i %>" size="46" maxlength="45" value="<%=lnBasic.getFieldString("E01CLDSC"+i) %>" readonly> 
							</td>
						<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E01CLCCY"+i %>" size="4" maxlength="3" value="<%=lnBasic.getFieldString("E01CLCCY"+i) %>" readonly>  
						</td>
						<td nowrap width="15%" align="center"> 
								<input type="text" class="txtright" name="<%="E01CLAMT"+i %>" size="19" maxlength="18" value="<%=lnBasic.getFieldString("E01CLAMT"+i) %>" readonly>  
						</td>
						<td nowrap width="15%" align="center"> 
								<input type="text" class="txtright" name="<%="E01CLPRC"+i %>" size="7" maxlength="6" value="<%=lnBasic.getFieldString("E01CLPRC"+i) %>" readonly> 
								<input class="styled-button-Search" type=button name="Submit" value="Utilizado" onClick="showCollateralList(getElement('E01CLACB<%=i%>').value)" style="visibility:<%= lnBasic.getFieldString("E01CLACB"+i).trim().equals("0") ? "hidden;" : "visible"  %>">
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
	<h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A"<% if(lnBasic.getH01FLGWK2().equals("A")){ out.print("checked");} %>>Aceptar con Aviso</h4>
<% } %> 


</form>

<script type="text/javascript">
function goFutureRates(readOnly) {
		var acc = getElement('E01DEAACC').value;
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV0158?SCREEN=100&E01FTRACC="+acc+"&APPROVAL="+readOnly;
		CenterWindow(page, 400, 500, 2);
}

function showLimits(bank,prod){
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0380?loan=true&bnk=" + bank + "&prd=" + prod;
		CenterWindow(page, 700, 500, 2);
}


function setRowColors(table){
		$('#'+table+ ' tr:visible:odd').removeClass().addClass('trclear');
		$('#'+table+ ' tr:visible:even').removeClass().addClass('trdark'); 
}

function cuentas(){
		if(document.getElementById("E01DEAPVI").value == ("3")){
				document.getElementById("convenioTable").style.display = 'none';
				document.getElementById("multicuenta").style.display = 'table-row';
				document.getElementById("autocuenta").style.display = 'none';
				document.getElementById("convenioAsignar").style.display = 'none';
				document.getElementById("intento").style.display = 'block';
				document.getElementById("intento2").style.display = 'block';
		} else if (document.getElementById("E01DEAPVI").value == ("1") || document.getElementById("E01DEAPVI").value == ("4")) {
				document.getElementById("convenioTable").style.display = 'none';
				document.getElementById("multicuenta").style.display = 'none';
				document.getElementById("autocuenta").style.display = 'table-row';
				document.getElementById("convenioAsignar").style.display = 'none';
				document.getElementById("intento").style.display = 'none';
				document.getElementById("intento2").style.display = 'none';
		} else if (document.getElementById("E01DEAPVI").value == ("2")) {
				document.getElementById("convenioTable").style.display = 'table-row';
				document.getElementById("multicuenta").style.display = 'none';
				document.getElementById("autocuenta").style.display = 'none';
				document.getElementById("convenioAsignar").style.display = 'table-row';
				document.getElementById("intento").style.display = 'none';
				document.getElementById("intento2").style.display = 'none';
		} else {
				document.getElementById("convenioTable").style.display = 'none';
				document.getElementById("multicuenta").style.display = 'none';
				document.getElementById("autocuenta").style.display = 'none';
				document.getElementById("convenioAsignar").style.display = 'none';
				document.getElementById("intento").style.display = 'none';
				document.getElementById("intento2").style.display = 'none';
		}    
}

function forma() {
		cuentas();
		goSubsidizedRate();
}

function UpdateFlag(val) {
		getElement("E01FLGRCL").value = (val) ? "X" : "";
}

function setRecalculate() {
		if (isValidObject(getElement("RECALC"))) {
				getElement("RECALC").checked = true;
				getElement("RECALC").disabled = true;
				UpdateFlag(true);  
		}
}
 
function UpdateFlag3(val) {
	document.forms[0].H02FLGWK3.value = (val==true)?"X":"";
}

function setRecalculate3() {
			UpdateFlag3(false);      
 }

function goSubsidizedRate() {
		if (isValidObject(getElement("E01DLCRFS"))){
				var total = 0;
				total = parseFloat(getElement("E01DLCRFS").value)+ parseFloat(getElement("E01LNSRTE").value);
				getElement("E01TOTRTE").value = String(total.toFixed(<%=EibsFields.EIBS_FIELD_RATE_LENGTH_PART_DECIMAL%>));
		}
}     

function setComissionTable(readOnly) {
		var notMissingInfo = true;
		var cun = getElement('E01DEACUN').value;
		var apcd = getElement('E01DEAACD').value;
		var bank = getElement('E01DEABNK').value;
		var type = getElement('E01DEATYP').value;
		var table = getElement('E01DEAOFT').value;
		var alertMessage = "Por Favor Ingresse : ";
		
		if(readOnly === "true" ){    
				page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table+"&readOnly="+readOnly;
		}else{
				page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table;
				
				if(trim(bank) == "") {
						alert(alertMessage + "Banco")
						notMissingInfo = false;            
				}
				
				if(trim(table) == "") {
						alert(alertMessage + "Tabla de Cargos")
						notMissingInfo = false;            
				}        
		}
		
		if(notMissingInfo){            
				CenterWindow(page, 1200, 1000, 2);
		}    
		
}

function reloadIFrame(name) {        // Esta funcion se llama desde los iframes
		if (isValidObject(document.getElementById(name))) {
				var iframe = document.getElementById(name);
				var source = iframe.src.replace("ACT=N", "ACT=S");;
				iframe.src = source;
		}
}

function iFrameCheck() {
			
		var totalFrames = $('iframe').length;
		
		$("iframe").each(function(index) { 
					var $index = index; 
					var $this = $(this);
					setTimeout(function(){
								if ($index == totalFrames -1){
										//recalcDist();
								}                  
								var title = $this.contents().find('title').text();
								if (title.indexOf('Error') == -1 && title.indexOf('Untitled Document') == -1 && title.indexOf('PSocket no open') == -1) {
										return;
								} else {
										$this.attr("src", $this.attr("src"));
										return;
								}
							}, 5000);
		});
}

//Field Used to Set Readonly
//The "Condiciones de Pago" in ln-paymentplan.js
window.inquiry = true;

</script>
	
</body>
</html>
 