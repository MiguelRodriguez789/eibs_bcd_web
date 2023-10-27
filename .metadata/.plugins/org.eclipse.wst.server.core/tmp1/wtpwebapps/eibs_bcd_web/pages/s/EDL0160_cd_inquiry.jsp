<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Consulta de Certificados de Deposito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="cdInquiry" class="datapro.eibs.beans.EDL016001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="pmnt" class="datapro.eibs.beans.JBListRec" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(cd_i_opt);
   initMenu(); 
    
</SCRIPT>
</head>

<%
		if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<div align="center"></div>
<h3 align="center">Consulta de Saldos<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="cd_inquiry, EDL0160"></h3>
<hr size="4">

<table border="0" cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td align="right" valign="top" width="85%"
			style="color:red;font-size:12;"><b><%=cdInquiry.getE01PENDAP()%></b></td>
		<td width="5%">
		<h4>&nbsp;</h4>
		</td>
	</tr>
</table>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PTYP" size="5" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Oficial :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<br>

<table class="tbenter">
	<tr>
		<td nowrap>
		<h4>Sumario</h4>
		</td>
		<td nowrap align="left"><b>DOCUMENTO :<font color="#ff6600">
		<%
					if (cdInquiry.getE01DEAECU().trim().equals("N")
					|| cdInquiry.getE01DEAECU().trim().equals("")) {
				out.print("EN NO CUSTODIA");
			} else if (cdInquiry.getE01DEAECU().trim().equals("1")) {
				out.print("EN CUSTODIA ELECTRONICA");
			} else if (cdInquiry.getE01DEAECU().trim().equals("2")) {
				out.print("FISICO");
			}
		%>
		</font></b></td>
		<td nowrap align="left"><b>CONTRATO :<font color="#ff6600">
		<%
				if (cdInquiry.getE01COLATR().trim().equals(""))
				out.print("NO GARANTIZADO");
			else
				out.print(cdInquiry.getE01COLATR());
		%> </font></b></td>
		<td nowrap align="right"><b>ESTADO :</b></td>
		<td nowrap><b><font color="#ff6600"><%=cdInquiry.getE01STATUS().trim()%></font></b>
		</td>
	</tr>
</table>

<%int row = 0; %>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="25%">
				<div align="right">Monto Original :</div>
				</td>
				<td nowrap width="23%"><eibsinput:text name="cdInquiry"
					property="E01DEAOAM"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
				<td nowrap width="26%">
				<div align="right">Fecha de Apertura :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="25%">
				<div align="right">Saldo Principal :</div>
				</td>
				<td nowrap width="23%"><eibsinput:text name="cdInquiry"
					property="E01DEAMEP"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
				<td nowrap width="26%">
				<div align="right">Fecha de Vencimiento :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="25%">
				<div align="right">Monto Reajuste :</div>
				</td>
				<td nowrap width="23%"><eibsinput:text name="cdInquiry"
					property="E01DEAREA"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
				<td nowrap width="26%">
				<div align="right">T&eacute;rmino :</div>
				</td>
				<td nowrap width="26%"><input type="text" name="E01DEATRM"
					size="5" maxlength="5"
					value="<%=cdInquiry.getE01DEATRM().trim()%>" readonly> <input
					type="text" name="E01DEATRC" size="10"
					value='<%if (cdInquiry.getE01DEATRC().equals("D"))
				out.print("D&iacute;a(s)");
			else if (cdInquiry.getE01DEATRC().equals("M"))
				out.print("Mes(es)");
			else if (cdInquiry.getE01DEATRC().equals("Y"))
				out.print("A&ntilde;o(s)");
			else
				out.print("");%>'
					readonly></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="25%">
				<div align="right">Saldo Intereses :</div>
				</td>
				<td nowrap width="23%"><eibsinput:text name="cdInquiry"
					property="E01DEAMEI"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
				<td nowrap width="26%">
				<div align="right">Tasa Interes :</div>
				</td>
				<td nowrap width="26%"><eibsinput:text name="cdInquiry"
					property="E01NOWRTE"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="25%">
				<div align="right">Monto Retenci&oacute;n :</div>
				</td>
				<td nowrap width="23%"><eibsinput:text name="cdInquiry"
					property="E01DEAHAM"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
				<td nowrap width="26%">
				<div align="right">Per&iacute;odo Base :</div>
				</td>
				<td nowrap width="26%"><input type="text" name="E01DEABAS"
					size="4" maxlength="3"
					value="<%=cdInquiry.getE01DEABAS().trim()%>" readonly></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="26%">
				<div align="right">D&iacute;as Retenci&oacute;n :</div>
				</td>
				<td nowrap width="26%"><input type="text" name="E01MORDYS"
					size="4" maxlength="3"
					value="<%=cdInquiry.getE01MORDYS().trim()%>" readonly>
				</td>
				<td nowrap width="26%">
				<div align="right">Inter&eacute;s al Vencimiento :</div>
				</td>
				<td nowrap width="26%"><eibsinput:text name="cdInquiry"
					property="E01MATINT"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
			</tr>

			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="25%">
					<div align="right">Saldo Actual :</div>
				</td>
				<td nowrap width="23%">
					<eibsinput:text name="cdInquiry" property="E01MEMBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
            	<td nowrap width="25%" >
					<div align="right">Monto Pago Final :</div>
            	</td> 
     	    	<td>
					<eibsinput:text name="cdInquiry" property="E01FUTNET" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
     			</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=cdInquiry.getH01FLGWK3()%>" />
</jsp:include>
 
<h4>Instrucciones al Vencimiento</h4>
<table class="tableinfo">
	<tr>
		<td nowrap height="33">
		<table width="100%">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<%
						if (cdInquiry.getE01DEAROC().equals("A"))
						out
						.print("Capital m&aacute;s Intereses ser&aacute;n prorrogados  por el mismo per&iacute;odo de tiempo. ");
					else if (cdInquiry.getE01DEAROC().equals("B")) {
						out
						.print("Inter&eacute;s ser&aacute; acreditado a "
								+ cdInquiry.getE01TEXTO2().trim()
								+ " que tendr&aacute; como n&uacute;mero "
								+ cdInquiry.getE01DEARAC().trim()
								+ ". El Capital ser&aacute; prorrogado por el mismo per&iacute;odo de tiempo ");
					} else if (cdInquiry.getE01DEAROC().equals("C")) {
						out
						.print("Inter&eacute;s ser&aacute; acreditado  a la cuenta contable n&uacute;mero "
								+ cdInquiry.getE01DEARGL().trim()
								+ ", emitiendo "
								+ cdInquiry.getE01TEXTO2().trim()
								+ ". El Capital ser&aacute; prorrogado por el mismo per&iacute;odo de tiempo ");
					} else if (cdInquiry.getE01DEAROC().equals("D")) {
						out
						.print("Al vencimiento cancelar el Capital del dep&oacute;sito mas los Intereses acreditando a la cuenta contable n&uacute;mero  "
								+ cdInquiry.getE01DEARAC().trim()
								+ ", emitiendo "
								+ cdInquiry.getE01TEXTO2().trim());
					} else if (cdInquiry.getE01DEAROC().equals("E")) {
						out
						.print("Al vencimiento cancelar el Capital del dep&oacute;sito mas los Intereses acreditando a la cuenta  (Corriente, Ahorro, etc.) n&uacute;mero  "
								+ cdInquiry.getE01DEARAC().trim());
					} else if (cdInquiry.getE01DEAROC().equals("F")) {
						out
						.print("Al vencimiento prorrogar el Capital del dep&oacute;sito y los Intereses,  "
								+ cdInquiry.getE01TEXTO2().trim()
								+ "  en  "
								+ cdInquiry.getE01DEAROA().trim()
								+ " contra la cuenta (Corriente, Ahorro, etc.) n&uacute;mero "
								+ cdInquiry.getE01DEARAC().trim());
					} else if (cdInquiry.getE01DEAROC().equals("G")) {
						out
						.print("Al vencimiento prorrogar el Capital del dep&oacute;sito y los Intereses por otro per&iacute;odo similar, disminuyendo los Intereses en "
								+ cdInquiry.getE01DEAROA().trim()
								+ " y acreditando los mismos en la Cuenta (Corriente, Ahorro, etc.) n&uacute;mero "
								+ cdInquiry.getE01DEARAC().trim());
					} else if (cdInquiry.getE01DEAROC().equals("H")) {
						out
						.print("Inter&eacute;s ser&aacute; pagado cada  "
								+ cdInquiry.getE01DEAROY().trim()
								+ "  "
								+ cdInquiry.getE01TEXTO1().trim()
								+ "  a "
								+ cdInquiry.getE01TEXTO2().trim()
								+ " que tendr&aacute;  como n&uacute;mero "
								+ cdInquiry.getE01DEARAC().trim()
								+ ". El Capital ser&aacute; prorrogado por el mismo per&iacute;odo de tiempo ");
					} else if (cdInquiry.getE01DEAROC().equals("I")) {
						out
						.print("Inter&eacute;s ser&aacute; pagado cada "
								+ cdInquiry.getE01DEAROY().trim()
								+ "  "
								+ cdInquiry.getE01TEXTO1().trim()
								+ "  a la cuenta contable n&uacute;mero "
								+ cdInquiry.getE01DEARGL().trim()
								+ ", emitiendo un "
								+ cdInquiry.getE01TEXTO2().trim()
								+ ". El Capital ser&aacute; prorrogado por el mismo per&iacute;odo de tiempo ");
					} else if (cdInquiry.getE01DEAROC().equals("J")) {
						out
						.print("Inter&eacute;s y Capital ser&aacute;n pagados al Certificado de Dep&oacute;sito n&uacute;mero  "
								+ cdInquiry.getE01DEARAC().trim()
								+ " .No hay prorroga en esta opci&oacute;n");
					} else if (cdInquiry.getE01DEAROC().equals("K")) {
						out.print("Inter&eacute;s ser&aacute; pagado cada "
						+ cdInquiry.getE01DEAROY().trim() + "  "
						+ cdInquiry.getE01TEXTO1().trim() + "  a "
						+ cdInquiry.getE01TEXTO2().trim()
						+ ",  que tendr&aacute; como n&uacute;mero "
						+ cdInquiry.getE01DEARAC().trim());
					} else if (cdInquiry.getE01DEAROC().equals("P")){
						out
						.print("El D&eacute;posito no tiene Instrucciones de Prorroga,  ser&aacute; prorrogado aut&oacute;maticamente despu&eacute;s del Per&iacute;odo  de Espera ");
					}else if (cdInquiry.getE01DEAROC().equals("S")){
						out
						.print("Inter&eacute;s ser&aacute; pagado cada "
								+ cdInquiry.getE01DEAROY().trim()
								+ "  "
								+ cdInquiry.getE01TEXTO1().trim()
								+ "  a la cuenta contable n&uacute;mero "
								+ cdInquiry.getE01DEARGL().trim()
								+ ". El Capital se amortiza de acuerdo al Plan de Pagos. ");
								
								
					}else if (cdInquiry.getE01DEAROC().equals("Q")){
						out
						.print("Inter&eacute;s ser&aacute; pagado cada "
								+ cdInquiry.getE01DEAROY().trim()
								+ "  "
								+ cdInquiry.getE01TEXTO1().trim()
								+ "  a la cuenta contable n&uacute;mero "
								+ cdInquiry.getE01DEARGL().trim()
								+ ". El Capital ser&aacute; prorrogado por el mismo per&iacute;odo de tiempo ");
				}%>
				<%if (cdInquiry.getE01DEAROC().equals("S")){ %>
				<a href="javascript:showCDPayInq()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Plan de Pagos" align="middle" border="0" ></a>
				<%} %>
				</td>
				
				
			</tr>
		</table>

		<%
		if (!pmnt.getNoResult() && 1==2){
		%>

		<table class="tableinfo" style="filter:''">
			<tr>
				<td nowrap>
				<table cellpadding="2" cellspacing="0" width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap>
						<div align="center">Cuota No.</div>
						</td>
						<td nowrap>
						<div align="center">Fecha</div>
						</td>
						<td nowrap>
						<div align="center">Principal</div>
						</td>
						<td nowrap>
						<div align="center">Intereses</div>
						</td>
					</tr>
					<%
							pmnt.initRow();
							while (pmnt.getNextRow()) {
								if (pmnt.getFlag().equals("")) {
							//out.println(coll.getRecord());
					%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap>
						<div align="center"><%=pmnt.getRecord(0)%></div>
						</td>
						<td nowrap>
						<div align="center"><%=pmnt.getRecord(1)%></div>
						</td>
						<td nowrap>
						<div align="center"><%=pmnt.getRecord(2)%></div>
						</td>
						<td nowrap>
						<div align="center"><%=pmnt.getRecord(3)%></div>
						</td>
					</tr>
					<%
							}
							}
					%>
				</table>
				</td>
			</tr>
		</table>
		<%
		}
		%>

		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="22%" height="29">
				<div align="right">Fecha Ultima Prorroga :</div>
				</td>
				<td nowrap width="11%" height="29">
					<eibsinput:date name="cdInquiry" fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY" readonly="true" />
				</td>				
				<td nowrap width="18%" height="29">
				<div align="right">N&uacute;mero de Prorrogas :</div>
				</td>
				<td nowrap width="13%" height="29"><input type="text"
					name="E01DEARON" size="9" maxlength="9"
					value="<%=cdInquiry.getE01DEARON().trim()%>" readonly></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="22%">
				<div align="right">Tipo de Prorroga :</div>
				</td>
				<td nowrap width="11%"><input type="text" name="E01DEAROC"
					size="2" maxlength="1"
					value="<%=cdInquiry.getE01DEAROC().trim()%>" readonly></td>
				<td nowrap width="18%">
				<div align="right">Tasa de Prorroga :</div>
				</td>
				<td nowrap width="13%"><input type="text" name="E01DEAROR"
					size="11" maxlength="11"
					value="<%=cdInquiry.getE01DEAROR().trim()%>" readonly></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Intereses</h4>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap>
				<div align="right">Interes Acumulado :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEAIAL"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
				<td nowrap>
				<div align="right">Inter&eacute;s Pagado A&ntilde;o :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEAIPY"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap>
				<div align="right">Inter&eacute;s Pagado :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEAIPL"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
				<td nowrap>
				<div align="right">Inter&eacute;s Diario :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DLYINT"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap>
				<div align="right">Inter&eacute;s Ajustado :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEAIJL"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
				<td nowrap>
				<div align="right">Inter&eacute;s de Ayer :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01YESINT"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Tasas</h4>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap>
				<div align="right">Tasa Base / Spread Actual :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEARTE"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
				</td>
				<td nowrap>
				<div align="right">Tasa Flotante Actual :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEAFRT"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap>
				<div align="right">Tasa Base / Spread Anterior :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEAPBR"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
				</td>
				<td nowrap>
				<div align="right">Tasa Flotante Anterior :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEAPFR"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap>
				<div align="right">Tasa Efectiva Anual :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEASPR"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
				</td>
				<td nowrap>
				<div align="right">Pr&oacute;xima Tasa Flotante :</div>
				</td>
				<td nowrap><eibsinput:text name="cdInquiry"
					property="E01DEANER"
					eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Retenciones</h4>
<table class="tableinfo">
	<tr>
		<td nowrap height="33">
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="24%">
				<div align="right">Trimestral :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="cdInquiry" property="E01DEAWQT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />				
				</td>
				<td nowrap width="18%">
				<div align="right">Anual :</div>
				</td>
				<td nowrap width="32%">
					<eibsinput:text name="cdInquiry" property="E01DEAWYT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="24%">
				<div align="right">Retención sobre Interés al Vencimiento :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="cdInquiry" property="E01TOTRET" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />				
				</td>
				<td nowrap width="18%">
				<div align="right"></div>
				</td>
				<td nowrap width="32%">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Fechas</h4>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="31%">
				<div align="right">Fecha Valor :</div>
				</td>
				<td nowrap width="13%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEASDM" fn_day="E01DEASDD" fn_year="E01DEASDY" readonly="true" />
				</td>
				<td nowrap width="31%">
				<div align="right">Fecha Ultimo C&aacute;lculo :</div>
				</td>
				<td nowrap width="25%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEALCM" fn_day="E01DEALCD" fn_year="E01DEALCY" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="31%">
				<div align="right">Fecha Ultimo Cambio de Tasa :</div>
				</td>
				<td nowrap width="13%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEARCM" fn_day="E01DEARCD" fn_year="E01DEARCY" readonly="true" />
				</td>
				<td nowrap width="31%">
				<div align="right">Fecha Ultimo Pago Capital :</div>
				</td>
				<td nowrap width="25%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEALPM" fn_day="E01DEALPD" fn_year="E01DEALPY" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="31%">
				<div align="right">Fecha Pr&oacute;ximo Cambio de Tasa :</div>
				</td>
				<td nowrap width="13%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEANRM" fn_day="E01DEANRD" fn_year="E01DEANRY" readonly="true" />
				</td>
				<td nowrap width="31%">
				<div align="right">Fecha Ultimo Pago Intereses :</div>
				</td>
				<td nowrap width="25%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEALIM" fn_day="E01DEALID" fn_year="E01DEALIY" readonly="true" />
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="31%">
				<div align="right">Fecha Ultima Modificaci&oacute;n :</div>
				</td>
				<td nowrap width="13%">
					<eibsinput:date name="cdInquiry" fn_month="E01DEALMM" fn_day="E01DEALMD" fn_year="E01DEALMY" readonly="true" />
				</td>
				<td nowrap width="31%">
				<div align="right">Usuario Ultima Modificaci&oacute;n :</div>
				</td>
				<td nowrap width="25%"><input type="text" name="E01DEAUSR"
					size="15" maxlength="10"
					value="<%=cdInquiry.getE01DEAUSR().trim()%>" readonly></td>
			</tr>
		</table>
		</td>
	</tr>
</table>


</html>
