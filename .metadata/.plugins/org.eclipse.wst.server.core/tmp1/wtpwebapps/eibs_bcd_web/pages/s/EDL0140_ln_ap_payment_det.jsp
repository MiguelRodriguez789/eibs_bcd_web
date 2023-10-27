<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="java.math.BigDecimal"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Pago de Prestámos Aprobacion</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<jsp:useBean id= "lnCancelDet" class= "datapro.eibs.beans.EDL095002Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">
 <%if(userPO.getPurpose().equalsIgnoreCase("APPROVAL_INQ")){ %>
	builtNewMenu(pv_a_opt);
<%}else{%>
   builtNewMenu(ln_a_opt);
<%}%>
</SCRIPT>

<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
	  error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<H3 align="center">Pago de Pr&eacute;stamos <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_ap_payment_det.jsp, EDL0140"></H3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
	<INPUT TYPE=HIDDEN NAME="E02DEABNK" VALUE="<%= lnCancelDet.getE02DEABNK().trim()%>">
	<% int row = 0;%>
	<table class="tableinfo" >
		<tr >
			<td nowrap>
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="10%" >
							<div align="right"><b>Cliente :</b></div>
						</td>
						<td nowrap width="10%" >
							<div align="left">
								<input type="text" size="10" maxlength="9" name="E02DEACUN" value="<%= lnCancelDet.getE02DEACUN().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%" >
							<div align="right"><b>Nombre :</b> </div>
						</td>
						<td nowrap width="40%" >
							<div align="left"><font face="Arial"><font face="Arial"><font size="2">
								<input type="text" size="50" maxlength="50" name="E02CUSNA1" value="<%= lnCancelDet.getE02CUSNA1().trim()%>" readonly>
								</font></font></font>
							</div>
						</td>
						<td nowrap width="10%">
							<div align="right"></div>
						</td>
						<td nowrap width="20%">
							<div align="left"></div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="10%">
							<div align="right"><b>Cuenta :</b></div>
						</td>
						<td nowrap width="10%">
							<div align="left">
								<input type="text" size="13" maxlength="12" name="E02DEAACC" value="<%= lnCancelDet.getE02DEAACC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="10%">
							<div align="right"><b>Moneda : </b></div>
						</td>
						<td nowrap width="40%">
							<div align="left"><b> 
								<input type="text" name="E02DEACCY" size="3" maxlength="3" value="<%= lnCancelDet.getE02DEACCY().trim()%>" readonly>
								</b> 
							</div>
						</td>
						<td nowrap width="10%">
							<div align="right"><b>Producto : </b></div>
						</td>
						<td nowrap width="20%">
							<div align="left"><b>
								<input type="text" size="4" maxlength="4" name="E02DEAPRO" value="<%= lnCancelDet.getE02DEAPRO().trim()%>" readonly>
								</b> 
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Saldos</h4>
	<table class="tableinfo" >
		<tr >
			<td nowrap>
				<table cellspacing=0 cellpadding=2 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%">
							<div align="right"><b>Concepto</b></div>
						</td>
						<td nowrap width="20%">
							<div align="right"><b>Saldo Anterior</b></div>
						</td>
						<td nowrap width="20%">
							<div align="right"><b>Transacci&oacute;n</b></div>
						</td>
						<td nowrap width="20%">
							<div align="right"><b>Nuevo Saldo</b></div>
						</td>
						<td nowrap width="20%">
							<div align="center"></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%" height="23">
							<div align="right">Principal :</div>
						</td>
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
						<td nowrap width="20%" height="19">
							<div align="right">Reajuste :</div>
						</td>
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
						<td nowrap width="20%">
							<div align="right">Intereses :</div>
						</td>
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
						<td nowrap width="20%">
							<div align="right">Mora :</div>
						</td>
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
						<td nowrap width="20%" height="19">
							<div align="right">Reajuste Mora:</div>
						</td>
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
						<td nowrap width="20%">
							<div align="right">F.E.C.I :</div>
						</td>
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
						<td nowrap width="20%">
							<div align="right">Impuesto :</div>
						</td>
						<td nowrap width="20%">
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFIMP().trim())%></div>
						</td>
						<td nowrap width="20%">
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNIMP().trim())%></div>
						</td>
						<td nowrap width="20%">
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTIMP().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%">
							<div align="right">Comisiones :</div>
						</td>
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
						<td nowrap width="20%">
							<div align="right">Deducciones :</div>
						</td>
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
						<td nowrap width="20%">
							<div align="right">Cobranzas :</div>
						</td>
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
						<td nowrap width="20%">
							<div align="right">I.V.A. :</div>
						</td>
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
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="20%">
							<div align="right">Total :</div>
						</td>
						<td nowrap width="20%">
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02BEFTOT().trim())%></div>
						</td>
						<td nowrap width="20%">
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02TRNTOT().trim())%></div>
						</td>
						<td nowrap width="20%">
							<div align="right"><%= Util.fcolorCCY(lnCancelDet.getE02AFTTOT().trim())%></div>
						</td>
						<td nowrap  width="20%"> 
						</td>
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
                <input type="text" name="E02DEAPP1" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP1().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DEAPP2" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP2().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E02DEAPP3" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP3().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DEAPP4" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP4().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E02DEAPP5" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP5().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DEAPP6" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP6().trim()%>" readonly>
              </div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%"  > 
	              <div align="center"> 
	                <input type="text" name="E02DEAPP7" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP7().trim()%>" readonly>
	              </div>
	            </td>
			  <% } %>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DEAPP8" size="2" maxlength="1" value="<%= lnCancelDet.getE02DEAPP8().trim()%>" readonly> 
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
	
	<h4>Distribuci&oacute;n del Pago</h4>
	<table class="tableinfo" >
		<tr >
			<td nowrap>
				<table cellspacing=0 cellpadding=4 width="100%" border="0">
					<%if(lnCancelDet.getE02PAGFLG().equals("MA") || lnCancelDet.getE02PAGFLG().equals("DS") ){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="40%">
							<div align="right"> <b>CONCEPTOS</b></div>
						</td>
						<td nowrap width="20%">
							<div align="center"><b>VALOR A PAGAR</b></div>
						</td>
						<td nowrap width="40%">
							<div align="center"></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right">PRINCIPAL :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGPRI" value="<%= lnCancelDet.getE02PAGPRI().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right">REAJUSTE :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGREA" value="<%= lnCancelDet.getE02PAGREA().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right">INTERESES :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGINT" value="<%= lnCancelDet.getE02PAGINT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right">MORA :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGMOR" value="<%= lnCancelDet.getE02PAGMOR().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right">REAJUSTE MORA:</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGREX" value="<%= lnCancelDet.getE02PAGREX().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<%}%>
					<%if(currUser.getE01INT().equals("07")){%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right">F.E.C.I. :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGOTH" value="<%= lnCancelDet.getE02PAGOTH().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<%}%>
					<%
						String seq="";
						for (int i = 1;i < 26;i++) {
						 if (i < 10) seq = "0"+i; else seq = ""+i;
						if(!lnCancelDet.getField("E02PDSC"+seq).getString().trim().equals("")){
						%> 
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap  width="40%">
							<div align="right"><%= lnCancelDet.getField("E02PDSC"+seq).getString().trim()%> : </div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02PAMT<%= seq%>" value="<%= lnCancelDet.getField("E02PAMT"+seq).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<%
						}
						}
						%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right">ABONO A PRINCIPAL :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGABO" value="<%= lnCancelDet.getE02PAGABO().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right">REAJUSTE POR ABONO :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02PAGABD" value="<%= lnCancelDet.getE02PAGABD().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="40%"> 
						</td>
					</tr>
					<%}%>
					<%if(lnCancelDet.getE02PAGFLG().equals("TO")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right"> <b>DEVOLUCIONES</b></div>
						</td>
						<td nowrap width="20%"> </td>
						<td nowrap width="40%"> </td>
					</tr>
					<%
						for (int i=1;i<9;i++) {
						if(!lnCancelDet.getField("E02DVPDS"+i).getString().trim().equals("")){
						%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="40%">
							<div align="right"><%= lnCancelDet.getField("E02DVPDS"+i).getString().trim()%> : </div>
						</td>
						<td nowrap width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02DVPAM<%= i%>" value="<%= lnCancelDet.getField("E02DVPAM"+i).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="40%"> </td>
					</tr>
					<%
						}
						}
						%> 
					<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="40%">
							<div align="right"><b>TOTAL :</b></div>
						</td>
						<td nowrap width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02PAGTOT" value="<%= lnCancelDet.getE02PAGTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="40%"> </td>
						<% } else { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="10%">
							<div align="center"></div>
						</td>
						<td nowrap width="20%">
							<div align="right"> <b>CONCEPTOS</b></div>
						</td>
						<td nowrap width="20%">
							<div align="center"> <b>POR PAGAR</b></div>
						</td>
						<td nowrap width="20%">
							<div align="center"><b>CONDONACION </b></div>
						</td>
						<td nowrap width="20%">
							<div align="center"><b>VALOR A PAGAR</b></div>
						</td>
						<td nowrap width="10%">
							<div align="center"></div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">PRINCIPAL :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGPRI" value="<%= lnCancelDet.getE02APGPRI().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"  class="txtright" size="15" maxlength="15" name="E02XCNPRI" value="<%= lnCancelDet.getE02XCNPRI().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGPRI" value="<%= lnCancelDet.getE02PAGPRI().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">REAJUSTE :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGREA" value="<%= lnCancelDet.getE02APGREA().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNREA" value="<%= lnCancelDet.getE02XCNREA().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGREA" value="<%= lnCancelDet.getE02PAGREA().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%}%>
					<%--
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">INTERESES :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGINT" value="<%= lnCancelDet.getE02APGINT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNINT" value="<%= lnCancelDet.getE02XCNINT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGINT" value="<%= lnCancelDet.getE02PAGINT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					--%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">INTERESES BALANCE :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGINV" value="<%= lnCancelDet.getE02APGINV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNINV" value="<%= lnCancelDet.getE02XCNINV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGINV" value="<%= lnCancelDet.getE02PAGINV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">INTERESES CONTINGENTE :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGINC" value="<%= lnCancelDet.getE02APGINC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNINC" value="<%= lnCancelDet.getE02XCNINC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGINC" value="<%= lnCancelDet.getE02PAGINC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%--
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">MORA :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGMOR" value="<%= lnCancelDet.getE02APGMOR().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNMOR" value="<%= lnCancelDet.getE02XCNMOR().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGMOR" value="<%= lnCancelDet.getE02PAGMOR().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					--%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">MORA BALANCE :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGMOV" value="<%= lnCancelDet.getE02APGMOV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNMOV" value="<%= lnCancelDet.getE02XCNMOV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGMOV" value="<%= lnCancelDet.getE02PAGMOV().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">MORA CONTINGENTE:</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGMOC" value="<%= lnCancelDet.getE02APGMOC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNMOC" value="<%= lnCancelDet.getE02XCNMOC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGMOC" value="<%= lnCancelDet.getE02PAGMOC().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">REAJUSTE MORA:</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGREX" value="<%= lnCancelDet.getE02APGREX().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNREX" value="<%= lnCancelDet.getE02XCNREX().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGREX" value="<%= lnCancelDet.getE02PAGREX().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%}%>
					<%if(currUser.getE01INT().equals("07")){%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">F.E.C.I. :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGOTH" value="<%= lnCancelDet.getE02APGOTH().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNOTH" value="<%= lnCancelDet.getE02XCNOTH().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGOTH" value="<%= lnCancelDet.getE02PAGOTH().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%}%>
					<%
						String seq="";
						for (int i = 1;i < 26;i++) {
						 if (i < 10) seq = "0"+i; else seq = ""+i;
						if(!lnCancelDet.getField("E02PDSC"+seq).getString().trim().equals("")){
						%> 
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right"><%= lnCancelDet.getField("E02PDSC"+seq).getString().trim()%> : </div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02APAM<%= seq%>" value="<%= lnCancelDet.getField("E02APAM"+seq).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02XCAM<%= seq%>" value="<%= lnCancelDet.getField("E02XCAM"+seq).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02PAMT<%= seq%>" value="<%= lnCancelDet.getField("E02PAMT"+seq).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%
						}
						}
						%> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">ABONO A PRINCIPAL :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02APGABO" value="<%= lnCancelDet.getE02APGABO().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02XCNABO" value="<%= lnCancelDet.getE02XCNABO().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text" class="txtright" size="15" maxlength="15" name="E02PAGABO" value="<%= lnCancelDet.getE02PAGABO().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%if(lnCancelDet.getH02FLGWK3().equals("R")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right">REAJUSTE POR ABONO :</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02APGABD" value="<%= lnCancelDet.getE02APGABD().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02XCNABD" value="<%= lnCancelDet.getE02XCNABD().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02PAGABD" value="<%= lnCancelDet.getE02PAGABD().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%}%>
					<%if(lnCancelDet.getE02PAGFLG().equals("TO")){%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right"> <b>DEVOLUCIONES</b></div>
						</td>
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
						<td nowrap  width="10%"></td>
						<td nowrap width="20%">
							<div align="right"><%= lnCancelDet.getField("E02DVPDS"+i).getString().trim()%> : </div>
						</td>
						<td nowrap width="20%"> </td>
						<td nowrap width="20%"> </td>
						<td nowrap width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02DVPAM<%= i%>" value="<%= lnCancelDet.getField("E02DVPAM"+i).getString().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<%
						}
						}
						%> 
					<%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">
							<div align="right"><b>TOTAL :</b></div>
						</td>
						<td nowrap  width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02APGTOT" value="<%= lnCancelDet.getE02APGTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02XCNTOT" value="<%= lnCancelDet.getE02XCNTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap width="20%">
							<div align="center">
								<input type="text"class="txtright" size="15" maxlength="15" name="E02PAGTOT" value="<%= lnCancelDet.getE02PAGTOT().trim()%>" readonly>
							</div>
						</td>
						<td nowrap  width="10%"></td>
					</tr>
					<% } %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap  width="10%"></td>
						<td nowrap  width="20%">&nbsp;</td>
						<td nowrap  width="20%">&nbsp;</td>
						<td nowrap  width="20%">&nbsp;</td>
						<td nowrap  width="10%"></td>
					</tr>
		<%
			boolean isAbono = lnCancelDet.getBigDecimalE02EXABAM().compareTo(BigDecimal.ZERO) > 0 || lnCancelDet.getBigDecimalE02EXABAM().compareTo(BigDecimal.ZERO) < 0;
			boolean isCuenta = lnCancelDet.getBigDecimalE02EXCCAM().compareTo(BigDecimal.ZERO) > 0 || lnCancelDet.getBigDecimalE02EXCCAM().compareTo(BigDecimal.ZERO) < 0;;		
			boolean isValorExtracto = false;
			BigDecimal valorExtro = lnCancelDet.getBigDecimalE02EXSTAM();
			isValorExtracto = valorExtro.compareTo(BigDecimal.ZERO) > 0 || valorExtro.compareTo(BigDecimal.ZERO) < 0 ;
			boolean isOdd = (row % 2 == 1);

		 %>
		 <tr><td colspan="6">
         <table class="tableinfo" style="filter:''; border: 1px;" id="tableinfoValor" >
		<%if(isValorExtracto) {%>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= isAbono ? "table-row" : "none" %> "> 
			 <td nowrap  width="30%"> 
              <div align="right">Abono a la Pr&oacute;xima Cuota : </div>
             </td>
             <td nowrap  width="70%"> 
             	<eibsinput:text property="E02EXABAM" name="lnCancelDet" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
             </td>
          </tr>         
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= isCuenta ? "table-row" : "none" %> "> 
			 <td nowrap  width="30%"> 
              <div align="right">Por Cobrar en Proxinma Cuota :</div>
             </td>
             <td nowrap  width="70%"> 
             	<eibsinput:text property="E02EXCCAM" name="lnCancelDet" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
             </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" > 
			 <td nowrap  width="30%"> 
              <div align="right">Valor a Pagar por Extracto :</div>
             </td>
             <td nowrap  width="70%"> 
             	<eibsinput:text property="E02EXSTAM" name="lnCancelDet" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
             </td>
          </tr>         
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			 <td nowrap  width="30%"> 
             </td>
             <td nowrap  width="70%"> 
             </td>
          </tr>
         <%}%>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap  width="30%">
										<div align="right">Fecha Valor :</div>
									</td>
									<td nowrap  width="70%">
										<eibsinput:date name="lnCancelDet"  fn_month="E02PAGVDM" fn_day="E02PAGVDD" fn_year="E02PAGVDY" readonly="true"/>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap  width="30%">
										<div align="right">Descripci&oacute;n :</div>
									</td>
									<td nowrap  width="70%"> 
										<input type="text" size="70" maxlength="60" name="E02DEANR1" value="<%= lnCancelDet.getE02DEANR1().trim()%>" readonly>
									</td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap  width="30%">&nbsp;</td>
									<td nowrap  width="70%"> 
										<input type="text" size="70" maxlength="60" name="E02DEANR2" value="<%= lnCancelDet.getE02DEANR2().trim()%>" readonly>
									</td>
								</tr>


					          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
								 <td nowrap  width="30%"> 
					              <div align="right">Motivo de Cancelación :</div>
					            </td>
					            <td nowrap  width="70%"> 
					              <input type="text" name="E02DEASUC" size="5" maxlength="4" value="<%= lnCancelDet.getE02DEASUC().trim()%>" readonly>
					              <input type="text" name="D02DEASUC" size="40" maxlength="35" value="<%= lnCancelDet.getD02DEASUC().trim()%>" readonly>
					            </td>
					          </tr>


							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<% if (lnCancelDet.getE02SELPPM().equals("M")){ %>
	<!-- Cuentas Multiples -->
	<h4>&nbsp;</h4>
	<table class="tableinfo" >
		<tr >
			<td nowrap>
				<table cellspacing=0 cellpadding=4 width="100%" border="0">
					<tr>
						<td colspan="6">
							<table class="tableinfo" style="filter:''; border: 0px;" >
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td align=center colspan="6"><b>Cuenta de Pago </b></td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="30%"><div align="center">Concepto</div></td>
									<td nowrap width="05%"><div align="center">Banco</div></td>
									<td nowrap width="10%"><div align="center">Sucursal</div></td>
									<td nowrap width="10%"><div align="center">Moneda</div></td>
									<td nowrap width="15%"><div align="center">Referencia</div></td>
									<td nowrap width="30%"><div align="center">Valor</div></td>
								</tr>
								<% for (int i=1; i<10; i++) { %>
								<%   if (!lnCancelDet.getFieldString("E02PAGAM"+i).equals("0.00")){ %>		
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="30%">
										<div align="center"> 
											<input type=text name="<%="E02PAGOP"+i%>" value="<%=lnCancelDet.getFieldString("E02PAGOP"+i).trim()%>" size="3" maxlength="3" readonly>
											<input type=HIDDEN name="<%="E02PAGGL"+i%>" value="<%=lnCancelDet.getFieldString("E02PAGGL"+i).trim()%>" >
											<input type="text" name="<%="E02PAGCO"+i%>" size="45" maxlength="45" readonly value="<%=lnCancelDet.getFieldString("E02PAGCO"+i).trim()%>" >
										</div>
									</td>
									<td nowrap width="05%">
										<div align="center"> 
											<input type="text" name="<%="E02PAGBK"+i%>" size="2" maxlength="2" value="<%=lnCancelDet.getFieldString("E02PAGBK"+i).trim()%>" readonly>
										</div>
									</td>
									<td nowrap width="10%">
										<div align="center"> 
											<input type="text" name="<%="E02PAGBR"+i%>" size="4" maxlength="4" value="<%=lnCancelDet.getFieldString("E02PAGBR"+i).trim()%>" readonly>
										</div>
									</td>
									<td nowrap width="10%">
										<div align="center"> 
											<input type="text" name="<%="E02PAGCY"+i%>" size="3" maxlength="3" value="<%=lnCancelDet.getFieldString("E02PAGCY"+i).trim()%>" readonly>
										</div>
									</td>
									<td nowrap width="15%">
										<div align="center"> 
											<input type="text" name="<%="E02PAGAC"+i%>" size="16" maxlength="16" value="<%=lnCancelDet.getFieldString("E02PAGAC"+i).trim()%>" readonly>
										</div>
									</td>
									<td nowrap width="30%" >
										<div align="center"> 
											<input type="text" name="<%="E02PAGAM"+i%>" class="txtright" size="20" maxlength="19" value="<%=lnCancelDet.getField("E02PAGAM"+i).getString().trim()%>" readonly >
										</div>
									</td>
								</tr>
								<%   } %>
								<% } %>								
								
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<% } else { %>
	<!-- Cuenta Unica -->
	<h4>&nbsp;</h4>
	<table class="tableinfo" >
		<tr >
			<td nowrap>
				<table cellspacing=0 cellpadding=4 width="100%" border="0">
					<tr>
						<td colspan="6">
							<table class="tableinfo" style="filter:''; border: 0px;" >
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td align=center colspan="6"><b>Cuenta de Pago </b></td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="30%"><div align="center">Concepto</div></td>
									<td nowrap width="15%"><div align="center">Banco</div></td>
									<td nowrap width="15%"><div align="center">Sucursal</div></td>
									<td nowrap width="15%"><div align="center">Moneda</div></td>
									<td nowrap width="25%"><div align="center">Referencia</div></td>
								</tr>
								<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
									<td nowrap width="30%">
										<div align="center"> 
											<input type=text name="E02PAGOPC" value="<%= lnCancelDet.getE02PAGOPC().trim()%>" size="3" maxlength="3" readonly>
											<input type=HIDDEN name="E02PAGOGL" value="<%= lnCancelDet.getE02PAGOGL().trim()%>" >
											<input type="text" name="E02PAGCON" size="45" maxlength="45" readonly value="<%= lnCancelDet.getE02PAGCON().trim()%>" >
										</div>
									</td>
									<td nowrap width="15%">
										<div align="center"> 
											<input type="text" name="E02PAGOBK" size="2" maxlength="2" value="<%= lnCancelDet.getE02PAGOBK().trim()%>" readonly>
										</div>
									</td>
									<td nowrap width="15%">
										<div align="center"> 
											<input type="text" name="E02PAGOBR" size="4" maxlength="4" value="<%= lnCancelDet.getE02PAGOBR().trim()%>" readonly>
										</div>
									</td>
									<td nowrap width="15%">
										<div align="center"> 
											<input type="text" name="E02PAGOCY" size="3" maxlength="3" value="<%= lnCancelDet.getE02PAGOCY().trim()%>" readonly>
										</div>
									</td>
									<td nowrap width="25%">
										<div align="center"> 
											<input type="text" name="E02PAGOAC" size="16" maxlength="16" value="<%= lnCancelDet.getE02PAGOAC().trim()%>" readonly>
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
	<% } %>
	
<script type="text/javascript">
function setRowColors(table, isodd){
	if(isodd){
     $('#'+table+ ' tr:visible:odd').removeClass().addClass('trclear');
	 $('#'+table+ ' tr:visible:even').removeClass().addClass('trdark'); 
	}else{
   	 $('#'+table+ ' tr:visible:odd').removeClass().addClass('trdark');
	 $('#'+table+ ' tr:visible:even').removeClass().addClass('trclear'); 	
	}
	setRowColors("tableinfoValor", <%=isOdd%>);
}

</script>	
			
</form>
</body>
</html>
