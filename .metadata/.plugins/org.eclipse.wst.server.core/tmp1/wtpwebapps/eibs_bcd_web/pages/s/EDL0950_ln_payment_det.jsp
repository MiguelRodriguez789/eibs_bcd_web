<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.math.BigDecimal"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Pago de Prestámos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "lnCancelDet" class= "datapro.eibs.beans.EDL095002Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function show_hide_column() {
	var tbl = document.getElementById('middle_table');
	var col = tbl.getElementsByTagName('col')[4];
	if ( getElement('E02PAGVDM').value == 0 &&  getElement('E02PAGVD').value == 0 &&  getElement('E02PAGVD').value == 4 ){
		col.style.visibility="";
	}else{
		col.style.visibility="collapse";
	}
}	

</script>

<%
	boolean optionPP = false;
	if (userPO.getOption().equals("PP")) {
			optionPP = true;
	}
%>


</head>

<body >
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%> 

<% if (userPO.getOption().equals("PP_FV")) { %>
<H3 align="center">Prepago Retrofecha <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment_det.jsp, EDL0950"></H3> 
<% } else if (userPO.getOption().equals("CU")) { %>
<H3 align="center">Pago de Utilizaciones <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment_det.jsp, EDL0950"></H3> 
<%} else { %>
<H3 align="center">Pago de Pr&eacute;stamos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_payment_det.jsp, EDL0950"></H3> 
<% } %>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
	<INPUT TYPE=HIDDEN NAME="E02DEABNK" VALUE="<%= lnCancelDet.getE02DEABNK().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E02PAGFLG" VALUE="<%= lnCancelDet.getE02PAGFLG().trim()%>"> 
	<INPUT TYPE=HIDDEN NAME="E02OFLPAG" VALUE="<%= lnCancelDet.getE02OFLPAG().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E02SELPPM" VALUE="<%= lnCancelDet.getE02SELPPM().trim()%>">
	<INPUT TYPE=HIDDEN NAME="H02FLGWK1" VALUE="<%= lnCancelDet.getH02FLGWK1().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E02FPGFLG" VALUE="<%= lnCancelDet.getE02FPGFLG().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E02APGINT" VALUE="<%= lnCancelDet.getE02APGINT().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E02APGMOR" VALUE="<%= lnCancelDet.getE02APGMOR().trim()%>">
	<INPUT TYPE=HIDDEN NAME="E02FLGCON" VALUE="C">  
 
	<div id="hiddenDivNew" class="hiddenDiv">
	<% int row1 = 0;%>
		<table id=tbhelp style=" width:170px; border-top-width : 2px;border-right-width : 2px;border-bottom-width : 2px;border-left-width : 2px;
		border-color: #0b23b5;
		border-style : solid solid solid solid;
		filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
			<tr id="trdark" >
				<td align=CENTER colspan="2" width="18%"><div align="center" >% Condonacion</div></td>
			</tr>
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Principal :</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="principal" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
			<tr id="trclear">
				<td align=CENTER width="18%"><div align="right">Reajuste :</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="reajuste" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<%} %>  
			<%--       
			<tr id="trclear" >
				<td align=CENTER width="18%"> 
					<div align="right">Interes :</div>
				</td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="interest" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			--%>
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Int.Bal.:</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="intervig" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Int.Con.:</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="intercon" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<%--
			<tr id="trclear" >
				<td align=CENTER width="18%"> 
					<div align="right">Mora :</div>
				</td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="mora" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			--%>
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Mora Bal.:</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="moravig" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Mora Con:</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="moracon" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
			<tr id="trclear">
				<td align=CENTER width="18%"><div align="right">Reajuste Mora:</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="reajusteMora" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<% } %>         
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Impuesto :</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="impuesto" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Comisi&oacute;n :</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="comision" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Deduci&oacute;n :</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="deducion" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">Cobranza :</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="cobranza" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>      
			<tr id="trclear" >
				<td align=CENTER width="18%"><div align="right">IVA :</div></td>
				<td align=CENTER width="34%"> 
					<div align="left"> 
						<eibsinput:text property="iva" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" maxlength="3" size="4" onchange="checkPercentage(event,0)" />
					</div>
				</td>
			</tr>
			<tr id="trdark" >
				<td align=center nowrap colspan="2"> 
					<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:checkCalcular()">
				</td>
			</tr>
		</table>
	</div>

	<% int row = 0;%>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark"> 
						<td nowrap width="10%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%" > 
							<div align="left">
								<input type="text" size="10" maxlength="9" name="E02DEACUN" value="<%= lnCancelDet.getE02DEACUN().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="40%" > 
							<div align="left"><font face="Arial"><font face="Arial"><font size="2">
								<input type="text" size="50" maxlength="50" name="E02CUSNA1" value="<%= lnCancelDet.getE02CUSNA1().trim()%>" readonly>
								</font></font></font>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"></div></td>
						<td nowrap width="20%"><div align="left"></div></td>
					</tr>
					<tr id="trdark"> 
						<td nowrap width="10%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"> 
							<div align="left">
								<input type="text" size="13" maxlength="12" name="E02DEAACC" value="<%= lnCancelDet.getE02DEAACC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="40%"> 
							<div align="left"><b> 
								<input type="text" name="E02DEACCY" size="3" maxlength="3" value="<%= lnCancelDet.getE02DEACCY().trim()%>" readonly></b>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left"><b>
								<input type="text" size="4" maxlength="4" name="E02DEAPRO" value="<%= lnCancelDet.getE02DEAPRO().trim()%>" readonly></b>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<br>
	<table class=tbenter>
		<tr > 
			<td nowrap> 
				<h4>Saldos</h4>
			</td>
			<td nowrap align=right> 
				<b><font color="#ff6600"><%= lnCancelDet.getE02REMARK().trim()%></font></b>
			</td>
		</tr>
	</table>
	
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right"><b>Concepto</b></div></td>
						<td nowrap width="20%"><div align="right"><b>Saldo Anterior</b></div></td>
						<td nowrap width="20%"><div align="right"><b>Transacci&oacute;n</b></div></td>
						<td nowrap width="20%"><div align="right"><b>Nuevo Saldo</b></div></td>
						<td nowrap width="20%"> <div align="center"></div></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%" height="23"><div align="right">Principal :</div></td>
						<td nowrap width="20%" height="23"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFPRI().trim())%></div>
						</td>
						<td nowrap width="20%" height="23"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNPRI().trim())%></div>
						</td>
						<td nowrap height="20" width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTPRI().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
		 			<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%" height="19"><div align="right">Reajuste :</div></td>
						<td nowrap width="20%" height="19"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFREA().trim())%></div>
						</td>
						<td nowrap width="20%" height="19"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNREA().trim())%></div>
						</td>
						<td nowrap height="19" width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTREA().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right">Intereses :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFINT().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNINT().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTINT().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			 			<td nowrap width="20%"><div align="right">Mora :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFMOR().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNMOR().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTMOR().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
		 			<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%" height="19"><div align="right">Reajuste Mora:</div></td>
						<td nowrap width="20%" height="19"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFREX().trim())%></div>
						</td>
						<td nowrap width="20%" height="19"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNREX().trim())%></div>
						</td>
						<td nowrap height="19" width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTREX().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<%}%>
		 			<%if(currUser.getE01INT().equals("07")){%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right">F.E.C.I :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFOTH().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNOTH().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTOTH().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right">Impuesto :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFIMP().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNIMP().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTIMP().trim())%></div>
						</td><td nowrap  width="20%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			 			<td nowrap width="20%"><div align="right">Comisiones :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFCOM().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNCOM().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTCOM().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right">Deducciones :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFDED().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNDED().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTDED().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right">Cobranzas :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFCBZ().trim())%></div> 
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNCBZ().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTCBZ().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right">I.V.A. :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFIVA().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNIVA().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTIVA().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<%if(lnCancelDet.getE02FLGFL9().equals("Y")){%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right">Ahorro Milagroso :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFAHO().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNAHO().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTAHO().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<% } %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right">Total :</div></td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFTOT().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNTOT().trim())%></div>
						</td>
						<td nowrap width="20%"> 
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTTOT().trim())%></div>
						</td>
						<td nowrap  width="20%"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<h4>Prioridad de Pagos </h4>
	<table class="tableinfo" >
		<tr > 
			<td nowrap > 
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" class="txtright" name="E02DEAPP1" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP1().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" class="txtright" name="E02DEAPP2" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP2().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<input type="text" class="txtright" name="E02DEAPP3" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP3().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" class="txtright" name="E02DEAPP4" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP4().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="12%" > 
							<div align="center"> 
								<input type="text" name="E02DEAPP5" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP5().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" class="txtright" name="E02DEAPP6" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP6().trim()%>" readonly>
							</div>
						</td>
						<%if(currUser.getE01INT().equals("07")){%> 
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" class="txtright" name="E02DEAPP7" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP7().trim()%>" readonly>
							</div>
						</td>
						<% } %>
						<td nowrap width="12%"  > 
							<div align="center"> 
								<input type="text" class="txtright" name="E02DEAPP8" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP8().trim()%>" readonly>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="12%" ><div align="center">Principal</div></td>
						<td nowrap width="12%" ><div align="center">Intereses</div></td>
						<td nowrap width="12%" ><div align="center">Mora</div></td>
						<td nowrap width="12%" ><div align="center">Comisiones</div></td>
						<td nowrap width="12%" ><div align="center">Impuestos</div></td>
						<td nowrap width="12%" ><div align="center">Deducciones</div></td>
						<%if(currUser.getE01INT().equals("07")){%> 
						<td nowrap width="12%" ><div align="center">FECI</div></td>
						<% } %>
						<td nowrap width="12%" ><div align="center">Cobranzas</div></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br>
	<table class="tbenter" style="height: auto;">
		<tr>
			<% if (!lnCancelDet.getE02PAGFLG().equals("MA")){%>
			<td nowrap  width="10%" align="left"><h4>Distribuci&oacute;n del Pago</h4></td>
			<td nowrap  width="20%">&nbsp;</td>
			<td nowrap  width="20%">&nbsp;</td>
			<td nowrap  width="20%">&nbsp;</td>
			<td nowrap  width="20%">&nbsp;</td>
			<td nowrap  width="10%"></td>
			<% } else { %>
			<td nowrap  width="10%" align="left"><h4>Distribuci&oacute;n del Pago</h4></td>
			<td nowrap  width="20%">&nbsp;</td>
			<td nowrap  width="20%">&nbsp;</td>
			<td nowrap  width="20%">&nbsp;</td>
			<td nowrap  width="20%">&nbsp;</td>
			<td nowrap  width="10%"></td>
			<% } %>
		</tr>
	</table>
	<table id="middle_table" class="tableinfo" >
		<col class="col1"/>
		<col class="col2"/>
		<col class="col3"/>
		<col class="col4"/>   
		<tr></tr>
		<tr >
			<td colspan="4" nowrap> 
				<table cellspacing=0 cellpadding=4 width="100%" border="0" >
					<%if(lnCancelDet.getE02PAGFLG().equals("MA")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right"> <b>CONCEPTOS</b></div></td>
						<td nowrap width="20%"> <div align="center"><b>POR PAGAR</b></div></td>
						<td nowrap width="20%"> <div align="center"><b>CONDONACION </b></div></td>
						<td nowrap width="20%"> <div align="center"><b>VALOR A PAGAR</b></div></td>
						<td nowrap width="20%"> <div align="center"><b>AJUSTES</b></div></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">PRINCIPAL :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGPRI" id="E02APGPRI" value="<%= lnCancelDet.getE02APGPRI().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"  class="txtright" size="21" maxlength="21" name="E02XCNPRI" id="E02XCNPRI" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNPRI().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGPRI" id="E02PAGPRI" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGPRI().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="10%"> 
							<div align="center">
								<input type="text" class="txtright" name="NoInput" size="21" maxlength="21" disabled readonly>
								</div> 
						</td>
					</tr>	
					<%	if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">REAJUSTE :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGREA" id="E02APGREA" value="<%= lnCancelDet.getE02APGREA().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNREA" id="E02XCNREA" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNREA().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGREA" id="E02PAGREA" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGREA().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJREA" id="E02PAJREA" value="<%= lnCancelDet.getE02PAJREA().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<%	}%>
					<%--
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			 			<td nowrap  width="20%"><div align="right">INTERESES :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGINT" id="E02APGINT" value="<%= lnCancelDet.getE02APGINT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNINT" id="E02XCNINT" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNINT().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGINT" id="E02PAGINT" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGINT().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJINT" id="E02PAJINT"  value="<%= lnCancelDet.getE02PAJINT().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					--%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">INTERESES BALANCE :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGINV" id="E02APGINV" value="<%= lnCancelDet.getE02APGINV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNINV" id="E02XCNINV" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNINV().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGINV" id="E02PAGINV" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGINV().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJINV" id="E02PAJINV"  value="<%= lnCancelDet.getE02PAJINV().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">INTERESES CONTINGENTE :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGINC" id="E02APGINC" value="<%= lnCancelDet.getE02APGINC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNINC" id="E02XCNINC" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNINC().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGINC" id="E02PAGINC" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGINC().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJINC" id="E02PAJINC"  value="<%= lnCancelDet.getE02PAJINC().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<%--
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">MORA :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGMOR" id="E02APGMOR" value="<%= lnCancelDet.getE02APGMOR().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNMOR" id="E02XCNMOR" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNMOR().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGMOR" id="E02PAGMOR" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGMOR().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJMOR" id="E02PAJMOR" value="<%= lnCancelDet.getE02PAJMOR().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					--%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">MORA BALANCE :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGMOV" id="E02APGMOV" value="<%= lnCancelDet.getE02APGMOV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNMOV" id="E02XCNMOV" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNMOV().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGMOV" id="E02PAGMOV" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGMOV().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJMOV" id="E02PAJMOV" value="<%= lnCancelDet.getE02PAJMOV().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">MORA CONTINGENTE:</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGMOC" id="E02APGMOC" value="<%= lnCancelDet.getE02APGMOC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNMOC" id="E02XCNMOC" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNMOC().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGMOC" id="E02PAGMOC" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGMOC().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJMOC" id="E02PAJMOC" value="<%= lnCancelDet.getE02PAJMOC().trim()%>" readonly>
							</div>
						</td>            
					</tr>
			 		<%	if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">REAJUSTE MORA:</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGREX" id="E02APGREX" value="<%= lnCancelDet.getE02APGREX().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNREX" id="E02XCNREX" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNREX().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGREX" id="E02PAGREX" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGREX().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJRMO" id="E02PAJRMO" value="<%= lnCancelDet.getE02PAJRMO().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<%	}%>
		 			<%	if(currUser.getE01INT().equals("07")){%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">F.E.C.I. :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGOTH" id="E02APGOTH" value="<%= lnCancelDet.getE02APGOTH().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNOTH" id="E02XCNOTH" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNOTH().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGOTH" id="E02PAGOTH" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGOTH().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"></td>            
					</tr>
					<%	}%>
					<%
							String seq="";
							for (int i = 1;i < 26;i++) {
								if (i < 10) seq = "0"+i; else seq = ""+i;
								if(!lnCancelDet.getField("E02PDSC"+seq).getString().trim().equals("")){
					%> 
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap  width="20%"> 
							<input TYPE=HIDDEN name="E02PTYP<%= seq%>" id="E02PTYP<%= seq%>" value="<%= lnCancelDet.getField("E02PTYP"+seq).getString().trim()%>"> 
							<div align="right"><%= lnCancelDet.getField("E02PDSC"+seq).getString().trim()%> : </div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02APAM<%= seq%>" id="E02APAM<%= seq%>" value="<%= lnCancelDet.getField("E02APAM"+seq).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02XCAM<%= seq%>" id="E02XCAM<%= seq%>" onchange="calculateSecuencia(this);" value="<%= lnCancelDet.getField("E02XCAM"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02PAMT<%= seq%>" id="E02PAMT<%= seq%>" onchange="calculateSecuencia(this);" value="<%= lnCancelDet.getField("E02PAMT"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"></td>            
					</tr>
					<%
								}
							}
					%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right"><b>TOTALES :</b></div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02APGTOT" value="<%= lnCancelDet.getE02APGTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02XCNTOT" id="E02XCNTOT" value="<%= lnCancelDet.getE02XCNTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02PAGTOT" id="E02PAGTOT" value="<%= lnCancelDet.getE02PAGTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02PAJTOT" id="E02PAJTOT" value="<%= lnCancelDet.getE02PAJTOT().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<%}%>
					<%if(!lnCancelDet.getE02PAGFLG().equals("MA")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right"> <b>CONCEPTOS</b></div></td>
						<td nowrap width="20%"> <div align="center"> <b>POR PAGAR</b></div></td>
						<td nowrap width="20%"> 
							<div align="center"><b>CONDONACION</b>
								<%if(!optionPP){%>
								<img id="eibsNew" src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" >
								<%}%>
							</div>
						</td>
						<td nowrap width="20%"> <div align="center"><b>VALOR A PAGAR</b></div></td>
						<td nowrap width="20%"> <div align="center"><b>AJUSTES</b></div></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">PRINCIPAL :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGPRI" id="E02APGPRI" value="<%= lnCancelDet.getE02APGPRI().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNPRI" id="E02XCNPRI" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNPRI().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGPRI" id="E02PAGPRI" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGPRI().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="No_Value" disabled readonly>
							</div>
						</td>
					</tr>	
					<%	if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">REAJUSTE :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGREA" id="E02APGREA" value="<%= lnCancelDet.getE02APGREA().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNREA" id="E02XCNREA" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNREA().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGREA" id="E02PAGREA" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGREA().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJREA" id="E02PAJREA" value="<%= lnCancelDet.getE02PAJREA().trim()%>" readonly>
							</div>
						</td>
					</tr>
					<%	}%>
					<%--
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">INTERESES :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGINT" id="E02APGINT" value="<%= lnCancelDet.getE02APGINT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNINT" id="E02XCNINT" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNINT().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGINT" id="E02PAGINT" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGINT().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJINT" id="E02PAJINT" value="<%= lnCancelDet.getE02PAJINT().trim()%>" readonly>
							</div>
						</td>
					</tr>
					--%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">INTERESES BALANCE :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGINV" id="E02APGINV" value="<%= lnCancelDet.getE02APGINV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNINV" id="E02XCNINV" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNINV().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGINV" id="E02PAGINV" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGINV().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJINV" id="E02PAJINV"  value="<%= lnCancelDet.getE02PAJINV().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">INTERESES CONTINGENTE :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGINC" id="E02APGINC" value="<%= lnCancelDet.getE02APGINC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNINC" id="E02XCNINC" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNINC().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGINC" id="E02PAGINC" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGINC().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJINC" id="E02PAJINC"  value="<%= lnCancelDet.getE02PAJINC().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<%--
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">MORA :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGMOR" id="E02APGMOR" value="<%= lnCancelDet.getE02APGMOR().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNMOR" id="E02XCNMOR" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNMOR().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGMOR" id="E02PAGMOR" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGMOR().trim()%>" onKeypress="enterDecimal(event, 2)">
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGMOR" id="E02PAGMOR"  value="<%= lnCancelDet.getE02PAJMOR().trim()%>" readonly >
							</div>
						</td>
					</tr>
					--%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">MORA BALANCE :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGMOV" id="E02APGMOV" value="<%= lnCancelDet.getE02APGMOV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNMOV" id="E02XCNMOV" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNMOV().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGMOV" id="E02PAGMOV" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGMOV().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJMOV" id="E02PAJMOV" value="<%= lnCancelDet.getE02PAJMOV().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">MORA CONTINGENTE:</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGMOC" id="E02APGMOC" value="<%= lnCancelDet.getE02APGMOC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNMOC" id="E02XCNMOC" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNMOC().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGMOC" id="E02PAGMOC" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGMOC().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJMOC" id="E02PAJMOC" value="<%= lnCancelDet.getE02PAJMOC().trim()%>" readonly>
							</div>
						</td>            
					</tr>
					<%	if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">REAJUSTE MORA:</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGREX" id="E02APGREX" value="<%= lnCancelDet.getE02APGREX().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNREX" id="E02XCNREX" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNREX().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGREX" id="E02PAGREX" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGREX().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAJRMO" id="E02PAJRMO" value="<%= lnCancelDet.getE02PAJRMO().trim()%>" readonly>
							</div>
						</td>
					</tr>
					<%	}%>
					<%	if(currUser.getE01INT().equals("07")){%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">F.E.C.I. :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGOTH" id="E02APGOTH" value="<%= lnCancelDet.getE02APGOTH().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNOTH" id="E02XCNOTH" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNOTH().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGOTH" id="E02PAGOTH" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGOTH().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%	}%>
					<%
							String seq="";
							for (int i = 1;i < 26;i++) {
								if (i < 10) seq = "0"+i; else seq = ""+i;
								if(!lnCancelDet.getField("E02PDSC"+seq).getString().trim().equals("")){
					%> 
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
						<td nowrap  width="20%"> 
							<input TYPE=HIDDEN name="E02PTYP<%= seq%>" id="E02PTYP<%= seq%>" value="<%= lnCancelDet.getField("E02PTYP"+seq).getString().trim()%>"> 
							<div align="right"><%= lnCancelDet.getField("E02PDSC"+seq).getString().trim()%> : </div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02APAM<%= seq%>" id="E02APAM<%= seq%>" value="<%= lnCancelDet.getField("E02APAM"+seq).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02XCAM<%= seq%>" id="E02XCAM<%= seq%>" onchange="calculateSecuencia(this);" value="<%= lnCancelDet.getField("E02XCAM"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02PAMT<%= seq%>" id="E02PAMT<%= seq%>" onchange="calculateSecuencia(this);" value="<%= lnCancelDet.getField("E02PAMT"+seq).getString().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						 </td>
						<td nowrap  width="10%"></td>
					</tr>
					<%
								}
			 				}
					%> 
					<%	if(lnCancelDet.getE02FLGFL9().equals("Y")){%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">AHORRO MILAGROSO :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGAHO" id="E02APGAHO" value="<%= lnCancelDet.getE02APGAHO().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNAHO" id="E02XCNAHO" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNAHO().trim()%>" readonly >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGAHO" id="E02PAGAHO" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGAHO().trim()%>" readonly >
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%	}%>
			 		<%	if(lnCancelDet.getE02PAGFLG().equals("TO")||lnCancelDet.getE02PAGFLG().equals("TP")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">ABONO A PRINCIPAL :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02APGABO" id="E02APGABO" value="<%= lnCancelDet.getE02APGABO().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02XCNABO" id="E02XCNABO" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNABO().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text" class="txtright" size="21" maxlength="21" name="E02PAGABO" id="E02PAGABO" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGABO().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%		if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right">REAJUSTE POR ABONO :</div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02APGABD" value="<%= lnCancelDet.getE02APGABD().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02XCNABD" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02XCNABD().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02PAGABD" onchange="calculateConcepto(this);" value="<%= lnCancelDet.getE02PAGABD().trim()%>" onKeypress="enterDecimal(event, 2)" <%=optionPP ? "readonly" : ""%> >
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%		}%>
				<%	}%>
				<%	if(lnCancelDet.getE02PAGFLG().equals("TO")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right"> <b>DEVOLUCIONES</b></div></td>
						<td nowrap width="20%"> </td>
						<td nowrap width="20%"> </td>
						<td nowrap width="20%"> </td>
						<td nowrap width="10%"> </td>
					</tr>
				<%
							for (int i=1;i<9;i++) {
								if(!lnCancelDet.getField("E02DVPDS"+i).getString().trim().equals("")){
				%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="20%"><div align="right"><%= lnCancelDet.getField("E02DVPDS"+i).getString().trim()%> : </div></td>
						<td nowrap width="20%"> </td>
						<td nowrap width="20%"> </td>
						<td nowrap width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02DVPAM<%= i%>" value="<%= lnCancelDet.getField("E02DVPAM"+i).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%"></td>
					</tr>
				<%
								}
			 				}
						}
				%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="20%"><div align="right"><b>TOTALES :</b></div></td>
						<td nowrap  width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02APGTOT" value="<%= lnCancelDet.getE02APGTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02XCNTOT" id="E02XCNTOT" value="<%= lnCancelDet.getE02XCNTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02PAGTOT" id="E02PAGTOT" value="<%= lnCancelDet.getE02PAGTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="20%"> 
							<div align="center">
								<input type="text"class="txtright" size="21" maxlength="21" name="E02PAJTOT" id="E02PAJTOT" value="<%= lnCancelDet.getE02PAJTOT().trim()%>" readonly>
							</div>
						</td>            
					</tr>
				<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">&nbsp;</td>
						<td nowrap  width="20%">&nbsp;</td>
						<td nowrap  width="20%">&nbsp;</td>
						<td nowrap  width="20%">&nbsp;</td>
					</tr>
				<%
					boolean isAbono = lnCancelDet.getBigDecimalE02EXABAM().compareTo(BigDecimal.ZERO) > 0 || lnCancelDet.getBigDecimalE02EXABAM().compareTo(BigDecimal.ZERO) < 0;
					boolean isCXC = lnCancelDet.getBigDecimalE02EXCCAM().compareTo(BigDecimal.ZERO) > 0 || lnCancelDet.getBigDecimalE02EXCCAM().compareTo(BigDecimal.ZERO) < 0;;		
					boolean isValorExtracto = false;
					BigDecimal valorExtro = lnCancelDet.getBigDecimalE02EXSTAM();
					isValorExtracto = valorExtro.compareTo(BigDecimal.ZERO) > 0 || valorExtro.compareTo(BigDecimal.ZERO) < 0 ;
					boolean isOdd = (row % 2 == 1);
				%>
					<tr>
						<td colspan="6">
							<table class="tableinfo" style="filter:''; border: 1px;" id="tableinfoValor" >
				<%if(isValorExtracto) {%>
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= isAbono ? "table-row" : "none" %> "> 
									<td nowrap  width="30%"><div align="right">Abono a la Pr&oacute;xima Cuota : </div></td>
									<td nowrap  width="70%"> 
										<eibsinput:text property="E02EXABAM" name="lnCancelDet" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
									</td>
								</tr>         
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= isCXC ? "table-row" : "none" %> "> 
									<td nowrap  width="30%"><div align="right">Por Cobrar en Proxima Cuota :</div></td>
									<td nowrap  width="70%"> 
										<eibsinput:text property="E02EXCCAM" name="lnCancelDet" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
									</td>
								</tr>
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" > 
									<td nowrap  width="30%"><div align="right">Valor a Pagar por Extracto :</div></td>
									<td nowrap  width="70%"> 
										<eibsinput:text property="E02EXSTAM" name="lnCancelDet" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
									</td>
								</tr>         
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<td nowrap  width="30%"></td>
									<td nowrap  width="70%"></td>
								</tr>
				<%}%> 
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<td nowrap  width="30%"><div align="right">Fecha Valor :</div></td>
									<td nowrap  width="70%"> 
										<eibsinput:date name="lnCancelDet"  fn_month="E02PAGVDM" fn_day="E02PAGVDD" fn_year="E02PAGVDY" readonly="true"/> 
									</td>
								</tr>
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<td nowrap  width="30%"><div align="right">Descripci&oacute;n :</div></td>
									<td nowrap  width="70%"> 
										<input type="text" size="70" maxlength="60" name="E02DEANR1" value="<%= lnCancelDet.getE02DEANR1().trim()%>">
									</td>
								</tr>
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<td nowrap  width="30%">&nbsp;</td>
									<td nowrap  width="70%"> 
										<input type="text" size="70" maxlength="60" name="E02DEANR2" value="<%= lnCancelDet.getE02DEANR2().trim()%>">
									</td>
								</tr> 
							<%if(lnCancelDet.getE02PAGFLG().equals("TO")) { %>
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<td nowrap  width="30%"><div align="right">Motivo de Cancelación :</div></td>
									<td nowrap  width="70%"> 
										<input type="text" name="E02DEASUC" size="5" maxlength="4" value="<%= lnCancelDet.getE02DEASUC().trim()%>">
										<input type="text" name="D02DEASUC" size="40" maxlength="35" value="<%= lnCancelDet.getD02DEASUC().trim()%>" readonly>
										<a href="javascript:GetCodeDescCNOFC('E02DEASUC','D02DEASUC','MC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
									</td>
								</tr>
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<td nowrap  width="30%"><div align="right">Tipo de Pago :</div></td>
									<td nowrap  width="70%"> 
										<input type="text" name="E02DEANID" size="5" maxlength="4" value="<%= lnCancelDet.getE02DEANID().trim()%>">
										<input type="text" name="D02DEANID" size="40" maxlength="35" value="<%= lnCancelDet.getD02DEANID().trim()%>" readonly>
										<a href="javascript:GetCodeDescCNOFC('E02DEANID','D02DEANID','MQ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
									</td>
								</tr>
								<% } else { %>
								<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
									<td nowrap  width="30%"><div align="right">Tipo de Pago :</div></td>
									<td nowrap  width="70%"> 
										<input type="text" name="E02DEANID" size="5" maxlength="4" value="<%= lnCancelDet.getE02DEANID().trim()%>">
										<input type="text" name="D02DEANID" size="40" maxlength="35" value="<%= lnCancelDet.getD02DEANID().trim()%>" readonly>
										<a href="javascript:GetCodeDescCNOFC('E02DEANID','D02DEANID','MQ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
									</td>
								</tr>
							<%}%>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<div id="mnuUni">
		<br>
		<h4>Cuenta de Pago - <a href="#mnuMulti" onclick="showMulti(true,true);"><b>Multiple</b></a></h4>
	</div>
	
	<table id="tblUni" class="tableinfo" style="height:106px;">
		<tr height="5%"> 
			<td nowrap valign="top" width="100%"> 
				<table id="headTable" width="98%">
					<tr id="trdark">
						<th nowrap width="50%" align="center">Concepto</th>
						<th nowrap width="10%" align="center">Banco</th>
						<th nowrap width="10%" align="center">Sucursal</th>
						<th nowrap width="10%" align="center">Moneda</th>
						<th nowrap width="20%" align="center">Referencia</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:106px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
						<tr id="trclear"> 
							<td nowrap width="50%" align="center">
								<input type=text name="E02PAGOPC" value="<%= lnCancelDet.getE02PAGOPC().trim()%>" size="3" maxlength="3">
								<input type=HIDDEN name="E02PAGOGL" value="<%= lnCancelDet.getE02PAGOGL().trim()%>">
								<input type="text" name="E02PAGCON" size="45" maxlength="45" readonly value="<%= lnCancelDet.getE02PAGCON().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E02DEABNK.value, document.forms[0].E02PAGOCY.value,'E02PAGOGL','E02PAGOPC','10', '02')">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E02PAGOBK" size="2" maxlength="2" value="<%= lnCancelDet.getE02PAGOBK().trim()%>">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E02PAGOBR" size="4" maxlength="4" value="<%= lnCancelDet.getE02PAGOBR().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02DEABNK.value,'','','','')">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E02PAGOCY" size="3" maxlength="3" value="<%= lnCancelDet.getE02PAGOCY().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02DEABNK.value,'','','','')">
							</td>
							<td nowrap width="20%" align="center"> 
								<input type="text" name="E02PAGOAC" size="16" maxlength="16" value="<%= lnCancelDet.getE02PAGOAC().trim()%>" class="context-menu-help" onmousedown="init(accountCustomerNameHelp,this.name,document.forms[0].E02DEABNK.value,'','','','RM')">
							</td>
						</tr> 
					</table>
				</div>
			</td>
		</tr>
	</table>

	<div id="mnuMulti">
		<br>
		<h4>Cuenta de Pago Multiple - <a href="#mnuUni" onclick="showMulti(false,true);"><b>Unica</b></a></h4>
	</div>
	<table id="tblMulti" class="tableinfo" style="height:106px;">
		<tr height="5%"> 
			<td nowrap valign="top" width="100%"> 
				<table id="headTable" width="98%">
					<tr id="trdark">
						<th nowrap width="40%" align="center">Concepto</th>
						<th nowrap width="10%" align="center">Banco</th>
						<th nowrap width="10%" align="center">Sucursal</th>
						<th nowrap width="10%" align="center">Moneda</th>
						<th nowrap width="15%" align="center">Referencia</th>
						<th nowrap width="15%" align="center">Valor</th>
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
							<td nowrap width="40%" align="center">
								<input type=text name="<%="E02PAGOP"+i%>" value="<%=lnCancelDet.getFieldString("E02PAGOP"+i).trim()%>" size="3" maxlength="3">
								<input type=HIDDEN name="<%="E02PAGGL"+i%>" value="<%=lnCancelDet.getFieldString("E02PAGGL"+i).trim()%>">
								<input type="text" name="<%="E02PAGCO"+i%>" size="45" maxlength="45" readonly value="<%=lnCancelDet.getFieldString("E02PAGCO"+i).trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E02DEABNK.value, document.forms[0].E02PAGCY<%=i%>.value ,'E02PAGGL<%=i%>','E02PAGOP<%=i%>','10','02')">
							</td>
							<td nowrap width="10%" align="center">  
								<input type="text" name="<%="E02PAGBK"+i%>" size="2" maxlength="2" value="<%=lnCancelDet.getFieldString("E02PAGBK"+i).trim()%>">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E02PAGBR"+i%>" size="4" maxlength="4" value="<%=lnCancelDet.getFieldString("E02PAGBR"+i).trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E02DEABNK.value,'','','','')">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E02PAGCY"+i%>" size="3" maxlength="3" value="<%=lnCancelDet.getFieldString("E02PAGCY"+i).trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E02DEABNK.value,'','','','')">
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E02PAGAC"+i%>" size="16" maxlength="16" value="<%=lnCancelDet.getFieldString("E02PAGAC"+i).trim()%>" class="context-menu-help" onmousedown="init(accountCustomerNameHelp,this.name,document.forms[0].E02DEABNK.value,'','','','RM')">
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E02PAGAM"+i%>" class="txtright" size="20" maxlength="19" value="<%=lnCancelDet.getField("E02PAGAM"+i).getString().trim()%>" onKeypress="enterDecimal(event, 2)" >
							</td>
						</tr> 
						<%}%>
					</table>
				</div>
			</td>
		</tr>
	</table>
	
	<% if(error.getERWRNG().equals("Y")){%>
	 <h4 style="text-align:center"><input type="checkbox" name="H02FLGWK3" value="A" <% if(lnCancelDet.getH02FLGWK3().equals("A")){ out.print("checked");} %>>
			Aceptar con Avisos</h4>
	<% } %>         

	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</div>

<SCRIPT type="text/javascript">

function setMulti() {
	if (getElement("E02SELPPM").value == "M") {
		showMulti(true,false);
	} else {
		showMulti(false,false);	
	}
}

function showMulti(lMulti,lMove) {
	if (!(document.getElementById("tblMulti") == null) && !(document.getElementById("tblUni") == null)) {
		if (lMulti) {
			document.getElementById("tblMulti").style.display = '';
			document.getElementById("mnuMulti").style.display = '';
			document.getElementById("tblUni").style.display = 'none';
			document.getElementById("mnuUni").style.display = 'none';
		} else {
			document.getElementById("tblMulti").style.display = 'none';
			document.getElementById("mnuMulti").style.display = 'none';
			document.getElementById("tblUni").style.display = '';
			document.getElementById("mnuUni").style.display = '';
		}
		if (lMove) {
			moveMulti(lMulti);
		}
	}
}

function moveMulti(lMulti) {
	if (lMulti) {

		getElement("E02PAGOP1").value = getElement("E02PAGOPC").value;
		getElement("E02PAGGL1").value = getElement("E02PAGOGL").value;
		getElement("E02PAGCO1").value = getElement("E02PAGCON").value;
		getElement("E02PAGBK1").value = getElement("E02PAGOBK").value;
		getElement("E02PAGBR1").value = getElement("E02PAGOBR").value;
		getElement("E02PAGCY1").value = getElement("E02PAGOCY").value;
		getElement("E02PAGAC1").value = getElement("E02PAGOAC").value;

		getElement("E02PAGOPC").value = '';
		getElement("E02PAGOGL").value = '';
		getElement("E02PAGCON").value = '';
		getElement("E02PAGOBK").value = '';
		getElement("E02PAGOBR").value = '0';
		getElement("E02PAGOCY").value = '';
		getElement("E02PAGOAC").value = '0';
		
		getElement("E02SELPPM").value = 'M';
		
	} else {

		getElement("E02PAGOPC").value = getElement("E02PAGOP1").value;
		getElement("E02PAGOGL").value = getElement("E02PAGGL1").value;
		getElement("E02PAGCON").value = getElement("E02PAGCO1").value;
		getElement("E02PAGOBK").value = getElement("E02PAGBK1").value;
		getElement("E02PAGOBR").value = getElement("E02PAGBR1").value;
		getElement("E02PAGOCY").value = getElement("E02PAGCY1").value;
		getElement("E02PAGOAC").value = getElement("E02PAGAC1").value;

		getElement("E02PAGOP1").value = '';
		getElement("E02PAGGL1").value = '';
		getElement("E02PAGCO1").value = '';
		getElement("E02PAGBK1").value = '';
		getElement("E02PAGBR1").value = '0';
		getElement("E02PAGCY1").value = '';
		getElement("E02PAGAC1").value = '0';
		
		getElement("E02SELPPM").value = '';

	}
}

function checkPercentage(e, dec) {
	enterInteger(e);
	var elem = EventElement(e);
	if (elem.value.length > 0) {
		if (parseInt(elem.value) > 100) {
			elem.value = "100";
		}
	}	
}

function checkCalcular(){
	
	var apgvalue;
	var xcnvalue;
	var pagvalue;
	
	var valpercent;
	var impuestoperc;
	var comisionperc;
	var deducionperc;
	var ivaperc;
	var cobranzaperc;

	if (getElement("principal").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("principal"), 10) / 100;
	}
	if (valpercent != 0){
		apgvalue = parseFloat(validateValue("E02APGPRI"), 10);
		xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
		pagvalue = fixedValue(apgvalue - xcnvalue);
		getElement("E02XCNPRI").value = formatCCY( xcnvalue);
		getElement("E02PAGPRI").value = formatCCY( pagvalue);
		calculateConcepto(getElement('E02XCNPRI'));		
	}
	
//	if (getElement("interest").value.length == 0) {
//		valpercent = 0;
//	} else {
//		valpercent = parseFloat(validateValue("interest")) / 100;
//	}
//	if (valpercent != 0){
//		apgvalue = parseFloat(validateValue("E02APGINT"), 10);
//		xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
//		pagvalue = fixedValue(apgvalue - xcnvalue);
//		getElement("E02XCNINT").value = formatCCY( xcnvalue);
//		getElement("E02PAGINT").value = formatCCY( pagvalue);
//		calculateConcepto(getElement('E02XCNINT'));		
//	}
	
	if (getElement("intervig").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("intervig")) / 100;
	}
	if (valpercent != 0){
		apgvalue = parseFloat(validateValue("E02APGINV"), 10);
		xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
		pagvalue = fixedValue(apgvalue - xcnvalue);
		getElement("E02XCNINV").value = formatCCY( xcnvalue);
		getElement("E02PAGINV").value = formatCCY( pagvalue);
		calculateConcepto(getElement('E02XCNINV'));		
	}
	
	if (getElement("intercon").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("intercon")) / 100;
	}
	if (valpercent != 0){
		apgvalue = parseFloat(validateValue("E02APGINC"), 10);
		xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
		pagvalue = fixedValue(apgvalue - xcnvalue);
		getElement("E02XCNINC").value = formatCCY( xcnvalue);
		getElement("E02PAGINC").value = formatCCY( pagvalue);
		calculateConcepto(getElement('E02XCNINC'));		
	}

//	if (getElement("mora").value.length == 0) {
//		valpercent = 0;
//	} else {
//		valpercent = parseFloat(validateValue("mora"), 10)/ 100;
//	}
//	if (valpercent != 0){
//		apgvalue = parseFloat(validateValue("E02APGMOR"), 10);
//		xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
//		pagvalue = fixedValue(apgvalue - xcnvalue);
//		getElement("E02XCNMOR").value = formatCCY( xcnvalue);
//		getElement("E02PAGMOR").value = formatCCY( pagvalue);
//		calculateConcepto(getElement('E02XCNMOR'));		
//	}
	
	if (getElement("moravig").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("moravig"), 10)/ 100;
	}
	if (valpercent != 0){
		apgvalue = parseFloat(validateValue("E02APGMOV"), 10);
		xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
		pagvalue = fixedValue(apgvalue - xcnvalue);
		getElement("E02XCNMOV").value = formatCCY( xcnvalue);
		getElement("E02PAGMOV").value = formatCCY( pagvalue);
		calculateConcepto(getElement('E02XCNMOV'));		
	}
	
	if (getElement("moracon").value.length == 0) {
		valpercent = 0;
	} else {
		valpercent = parseFloat(validateValue("moracon"), 10)/ 100;
	}
	if (valpercent != 0){
		apgvalue = parseFloat(validateValue("E02APGMOC"), 10);
		xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
		pagvalue = fixedValue(apgvalue - xcnvalue);
		getElement("E02XCNMOC").value = formatCCY( xcnvalue);
		getElement("E02PAGMOC").value = formatCCY( pagvalue);
		calculateConcepto(getElement('E02XCNMOC'));		
	}
	
	if(isValidObject(getElement("reajuste"))){
		if (getElement("reajuste").value.length == 0) {
			valpercent = 0;
		} else {
			valpercent = parseFloat(validateValue("reajuste"), 10) / 100;
		}	
		
		if (valpercent != 0){
			apgvalue = parseFloat(validateValue("E02APGREA"), 10);
			xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
			relvalue = fixedValue(apgvalue - xcnvalue);
			getElement("E02XCNREA").value = formatCCY(String(xcnvalue));
			getElement("E02PAGREA").value = formatCCY(String(relvalue));
			calculateConcepto(getElement('E02XCNREA'));		
		}
	}
	
	if(isValidObject(getElement("reajusteMora"))){	
		if (getElement("reajusteMora").value.length == 0) {
			valpercent = 0;
		} else {
			valpercent = parseFloat(validateValue("reajusteMora"), 10) / 100;
		}		
		
		if (valpercent != 0){
			apgvalue = parseFloat(validateValue("E02APGREX"), 10);
			xcnvalue = fixedValue(parseFloat(apgvalue * valpercent));
			relvalue = fixedValue(apgvalue - xcnvalue);
			getElement("E02XCNREX").value = formatCCY(String(xcnvalue));
			getElement("E02PAGREX").value = formatCCY(String(relvalue));
			calculateConcepto(getElement('E02XCNREX'));		
		}	
	}	
	
	if (getElement("impuesto").value.length == 0) {
		impuestoperc = 0;
	} else {
		impuestoperc = parseFloat(validateValue("impuesto"), 10) / 100;
	}

	if (getElement("comision").value.length == 0) {
		comisionperc = 0;
	} else {
		comisionperc = parseFloat(validateValue("comision"), 10)/ 100;
	}

	if (getElement("deducion").value.length == 0) {
		deducionperc = 0;
	} else {
		deducionperc = parseFloat(validateValue("deducion"), 10)/ 100;
	}

	if (getElement("iva").value.length == 0) {
		ivaperc = 0;
	} else {
		ivaperc = parseFloat(validateValue("iva"), 10) / 100;
	}
	
	if (getElement("cobranza").value.length == 0) {
		cobranzaperc = 0;
	} else {
		cobranzaperc = parseFloat(validateValue("cobranza"), 10) / 100;
	}	
	
	for (var k=1; k<26; k++) {
		if (k < 10) sq = "0"+k; else sq = ""+k;
		try {
			apgvalue = parseFloat(validateValue("E02APAM"+sq), 10);
			xcnvalue = parseFloat(validateValue("E02XCAM"+sq), 10);
			if((impuestoperc != 0 && getElement("E02PTYP"+sq).value=='1')) {
				xcnvalue = parseFloat(apgvalue * impuestoperc);
			}
			if((comisionperc != 0 && getElement("E02PTYP"+sq).value=='2')) {
				xcnvalue = parseFloat(apgvalue * comisionperc);
			}
			if((deducionperc != 0 && getElement("E02PTYP"+sq).value=='3')) {
				xcnvalue = parseFloat(apgvalue * deducionperc);
			}
			if((ivaperc != 0 && getElement("E02PTYP"+sq).value=='4')) {
				xcnvalue = parseFloat(apgvalue * ivaperc);
			}
			if((cobranzaperc != 0 && getElement("E02PTYP"+sq).value=='5')) {
				xcnvalue = parseFloat(apgvalue * cobranzaperc);
			}	
			xcnvalue = fixedValue(xcnvalue);
			pagvalue = fixedValue(apgvalue - xcnvalue);
			getElement("E02XCAM"+sq).value = formatCCY( xcnvalue);
			getElement("E02PAMT"+sq).value = formatCCY( pagvalue);
		} catch (e) {
		}
	}

	TOTALS();		
	setVisibility(getElement("hiddenDivNew"), "hidden");
	
}

function calculateConcepto(obj) {
	var fldnam; var fldcpt; var pagflg;
	var valapg;	var valxcn;	var valpag;	var valtot; var valchg;
	fldnam = obj.name.substring(0,6);
	fldcpt = obj.name.substring(6);
	pagflg = getElement("E02PAGFLG").value;
	valapg = validateValue("E02APG" + fldcpt);
	valxcn = validateValue("E02XCN" + fldcpt);
	valpag = validateValue("E02PAG" + fldcpt);
	valtot = 0.00;
	valchg = 0.00;
	if (pagflg != "MA") {
		// Recalcula el valor a pagar basado en el valor a condonar
		if (fldnam == "E02XCN") {
			valtot = fixedValue(valapg - valxcn);
			if (valtot < 0) {
				valxcn = 0.00;
			}
			valpag = fixedValue(valapg - valxcn);
		}
		// Recalcula el valor a condonar basado en el valor a pagar
		if (fldnam == "E02PAG") {
			valtot = fixedValue(valapg - valpag);
			if (valtot < 0) {
				valpag = 0.00;
			}
			valxcn = fixedValue(valapg - valpag);
		}
	}
	valtot = fixedValue(valapg - valxcn - valpag);
	if (valtot < 0) {
		getElement(fldnam+fldcpt).value = formatCCY(valchg);
		valapg = validateValue("E02APG" + fldcpt);
		valxcn = validateValue("E02XCN" + fldcpt);
		valpag = validateValue("E02PAG" + fldcpt);
		valtot = fixedValue(valapg - valxcn - valpag);
	}
	if(isValidObject(getElement("E02XCN" + fldcpt))){
		getElement("E02XCN" + fldcpt).value = formatCCY(valxcn);
	}
	getElement("E02PAG" + fldcpt).value = formatCCY(valpag);
	TOTALS();
}

function calculateSecuencia(obj) {
	var fldnam; var fldseq; var pagflg;
	var valapg;	var valxcn;	var valpag;	var valtot; var valchg;
	fldnam = obj.name.substring(0,7);
	fldseq = obj.name.substring(7);
	pagflg = getElement("E02PAGFLG").value;
	valapg = validateValue("E02APAM" + fldseq);
	valxcn = validateValue("E02XCAM" + fldseq);
	valpag = validateValue("E02PAMT" + fldseq);
	valtot = 0.00;
	valchg = 0.00;
	if (pagflg != "MA") {
		// Recalcula el valor a pagar basado en el valor a condonar
		if (fldnam == "E02XCAM") {
			valtot = fixedValue(valapg - valxcn);
			if (valtot < 0) {
				valxcn = 0.00;
			}
			valpag = fixedValue(valapg - valxcn);
		}
		// Recalcula el valor a condonar basado en el valor a pagar
		if (fldnam == "E02PAMT") {
			valtot = fixedValue(valapg - valpag);
			if (valtot < 0) {
				valpag = 0.00;
			}
			valxcn = fixedValue(valapg - valpag);
		}
	}
	valtot = fixedValue(valapg - valxcn - valpag);
	if (valtot < 0) {
		getElement(fldnam+fldseq).value = formatCCY(valchg);
		valapg = validateValue("E02APAM" + fldseq);
		valxcn = validateValue("E02XCAM" + fldseq);
		valpag = validateValue("E02PAMT" + fldseq);
		valtot = fixedValue(valapg - valxcn - valpag);
	}
	if(isValidObject(getElement("E02XCAM" + fldseq))){
		getElement("E02XCAM" + fldseq).value = formatCCY(valxcn);
	}
	getElement("E02PAMT" + fldseq).value = formatCCY(valpag);
	TOTALS();
}

function TOTALS(){
	var valpri; var valrea; var valint; var valmor; var valrex; 
	var valoth; var valabo; var valabd;	var xcnchg; var pagchg;
	var valtot; var sq;
	
	xcnchg = 0.00; pagchg = 0.00;
	
	// Impuestos, Comisiones, Deducciones
	for (var ix=1; ix<=25; ix++) {
		if (ix < 10) sq = "0"+ix; else sq = ""+ix;
		xcnchg = xcnchg + validateValue("E02XCAM"+sq);
		pagchg = pagchg + validateValue("E02PAMT"+sq);
	}
	
	// Condonar
	valpri = validateValue("E02XCNPRI");	
	valrea = validateValue("E02XCNREA");
	valint = validateValue("E02XCNINT");
	valmor = validateValue("E02XCNMOR");
	valrex = validateValue("E02XCNREX");
	valoth = validateValue("E02XCNOTH");
	valabo = validateValue("E02XCNABO");
	valabd = validateValue("E02XCNABD");
	valinv = validateValue("E02XCNINV");
	valinc = validateValue("E02XCNINC");
	valmov = validateValue("E02XCNMOV");
	valmoc = validateValue("E02XCNMOC");
	valtot = valpri + valrea + valint + valmor + valoth + valabo + valabd + xcnchg + valrex + valinv + valinc + valmov + valmoc;
	if(isValidObject(getElement("E02XCNTOT"))){
		getElement("E02XCNTOT").value = formatCCY(fixedValue(valtot));
	}
	// Pagar
	valpri = validateValue("E02PAGPRI");
	valrea = validateValue("E02PAGREA");
	valint = validateValue("E02PAGINT");
	valmor = validateValue("E02PAGMOR");
	valrex = validateValue("E02PAGREX");
	valoth = validateValue("E02PAGOTH");
	valabo = validateValue("E02PAGABO");
	valabd = validateValue("E02PAGABD");
	valinv = validateValue("E02PAGINV");
	valinc = validateValue("E02PAGINC");
	valmov = validateValue("E02PAGMOV");
	valmoc = validateValue("E02PAGMOC");
	valtot = valpri + valrea + valint + valmor + valoth + valabo + valabd + pagchg + valrex + valinv + valinc + valmov + valmoc;
	getElement("E02PAGTOT").value = formatCCY(fixedValue(valtot));

}

function validateValue(valamt) {
	try {
		valamt = getElement(valamt).value;
		valamt = valamt.replace(/\,/g,'');
		valamt = parseFloat(valamt);
		if (isNaN(valamt)) { 
			valamt = 0.00;
		}
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function fixedValue(valamt) {
	var maxvalue = 9999999999999.99;
	try {
		valamt = Number(valamt.toFixed(2));
	} catch (e) {
		valamt = 0.00;
	}
	return valamt;
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
	
	getElement("principal").value = "";
//	getElement("interest").value = "";
	getElement("intervig").value = "";
	getElement("intercon").value = "";
//	getElement("mora").value = "";
	getElement("moravig").value = "";
	getElement("moracon").value = "";
	getElement("impuesto").value = "";
	getElement("comision").value = "";
	getElement("deducion").value = "";
	getElement("iva").value = "";
	getElement("cobranza").value = "";
	if(isValidObject(getElement("reajuste")))getElement("reajuste").value = "";
	if(isValidObject(getElement("reajusteMora")))getElement("reajusteMora").value = "";	
		 
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}

function setRowColors(table, isodd){
	if(isodd){
		 $('#'+table+ ' tr:visible:odd').removeClass().addClass('trclear');
	 $('#'+table+ ' tr:visible:even').removeClass().addClass('trdark'); 
	}else{
		 $('#'+table+ ' tr:visible:odd').removeClass().addClass('trdark');
	 $('#'+table+ ' tr:visible:even').removeClass().addClass('trclear'); 	
	}
}

	addEventHandler(document, 'click', closeHiddenDivNew);
	document.getElementById("hiddenDivNew").onclick = cancelBub;
	if (isValidObject(document.getElementById("eibsNew"))) {
		document.getElementById("eibsNew").onclick = showHiddenDivNew;
	}
	setMulti();
	setRowColors("tableinfoValor", <%=isOdd%>);
	
	
	
</SCRIPT>

</form>
</body>
</html>