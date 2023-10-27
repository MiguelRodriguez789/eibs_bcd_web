<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Consulta de Cobranza Simple</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="dcNew"  class="datapro.eibs.beans.EDC001001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript">
   builtNewMenu(dc_s_inquiry);
   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>
<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>
</head>
<body>
<h3 align="center">Aprobación de Cobranza Simple<BR>Consulta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sing_approval_inq.jsp, EDC0040"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0040">

<table class="tableinfo">
	<tr>
		<td nowrap>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
			<TBODY><TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Banco :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01DCMBNK" readonly size="4" maxlength="2" value="<%=dcNew.getE01DCMBNK().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Número de Cobranza :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B> 
				<%if (dcNew.getE01DCMACC().trim().equals("999999999999"))
				{%>
					<INPUT type="text" size="12" maxlength="12" value="Nuevo" readonly>
					<INPUT type="hidden" name="E01DCMACC" value="<%=dcNew.getE01DCMACC().trim()%>">
				<%}
				else
				{%>
					<INPUT type="text" name="E01DCMACC" size="12" maxlength="12" value="<%=dcNew.getE01DCMACC().trim()%>" readonly>
				<%}%>
					</B></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
					<DIV align="right"><B>Nuestra Referencia :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01DCMORF" size="20" maxlength="16" value="<%=dcNew.getE01DCMORF().trim()%>"
						<%if (dcNew.getF01DCMORF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Producto :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DCMPRO" size="4" maxlength="4" value="<%=dcNew.getE01DCMPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Tipo de Cobranza :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DCMTYP" size="20" maxlength="16" value="<%=dcNew.getE01DCMTYP().trim()%>">
					</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Descripcion de Producto :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DSCPRO" size="30" maxlength="30" value="<%=dcNew.getE01DSCPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
			</TR>
			</TBODY></TABLE>
		</td>
	</tr>
</table>
<h4>Banco Girado</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%">
							<select disabled="disabled" name="E01DCMAF4">
								<option value=" " <%if (!(dcNew.getE01DCMAF4().equals("C") || dcNew.getE01DCMAF4().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (dcNew.getE01DCMAF4().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (dcNew.getE01DCMAF4().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMCLA" size="12" maxlength="12" value="<%=dcNew.getE01DCMCLA()%>" readonly="readonly"
							<%if (dcNew.getF01DCMCLA().equals("Y")) out.print("class=\"txtchanged\"");%>>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" border="0">
						</td>
						<td>
							
							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Nombre :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL1" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL1()%>" readonly="readonly"
						<%if (dcNew.getF01DCMCL1().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Dirección :</div>
				</td>
				<td>
					<div align="left"><input type="text" name="E01DCMCL2" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL2()%>" readonly="readonly"
					<%if (dcNew.getF01DCMCL2().equals("Y")) out.print("class=\"txtchanged\"");%>>
				</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL3" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL3()%>" readonly="readonly"
						<%if (dcNew.getF01DCMCL3().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCL4" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL4()%>" readonly="readonly"
						<%if (dcNew.getF01DCMCL4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Referencia :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMCRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMCRF()%>" readonly="readonly"
						<%if (dcNew.getF01DCMCRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Girador del Instrumento</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%">
							<select disabled="disabled" name="E01DCMAF1">
								<option value=" " <%if (!(dcNew.getE01DCMAF1().equals("C") || dcNew.getE01DCMAF1().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (dcNew.getE01DCMAF1().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (dcNew.getE01DCMAF1().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMDRA" size="12" maxlength="12" value="<%=dcNew.getE01DCMDRA()%>" readonly="readonly"
							<%if (dcNew.getF01DCMDRA().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</td>
						<td>
							
							
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Nombre :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR1" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR1()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDR1().equals("Y")) out.print("class=\"txtchanged\"");%>>
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Dirección :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR2" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR2()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDR2().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR3" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR3()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDR3().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDR4" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR4()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDR4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Referencia :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMDRF()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Cliente / Beneficiario</h4>
<table class="tableinfo">
	<tr>
		<td>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY><TR id="trdark">
				<TD align="right">
				<TABLE border="0" cellspacing="0">
					<TBODY><TR id="trdark">
						<TD align="right">Numero de Cliente o de Cuenta:</TD>
						<TD nowrap width="25%"><select disabled="disabled" name="E01DCMAF3">
							<OPTION value=" "></OPTION>
							<OPTION value="C" <%if (dcNew.getE01DCMAF3().equals("C")) out.print("selected");%>>Cliente</OPTION>
							<OPTION value="A" <%if (dcNew.getE01DCMAF3().equals("A")) out.print("selected");%>>Cuenta</OPTION>
						</SELECT></TD>
					</TR>
				</TBODY></TABLE>
				</TD>
				<TD>
				<TABLE border="0" cellspacing="0">
					<TBODY>
						<TR id="trdark">
							<TD align="left">
								<INPUT type="text" name="E01DCMRBA" size="12" maxlength="12" value="<%=dcNew.getE01DCMRBA()%>" readonly="readonly"
								<%if (dcNew.getF01DCMRBA().equals("Y")) out.print("class=\"txtchanged\"");%>>
							</TD>
							<TD>
								
								
							</TD>
						</TR>
					</TBODY>
				</TABLE>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Nombre :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB1" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB1()%>" readonly="readonly"
						<%if (dcNew.getF01DCMRB1().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Dirección :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB2" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB2()%>" readonly="readonly"
						<%if (dcNew.getF01DCMRB2().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB3" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB3()%>" readonly="readonly"
						<%if (dcNew.getF01DCMRB3().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRB4" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB4()%>" readonly="readonly"
						<%if (dcNew.getF01DCMRB4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Referencia :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMRRF()%>" readonly="readonly"
						<%if (dcNew.getF01DCMRRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
		</td>
	</tr>
</table>

<h4>Banco Reembolsador</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td align="right">
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="right">Numero de Cliente o de Cuenta:</td>
						<td nowrap width="25%">
							<select disabled="disabled" name="E01DCMAF2">
								<option value=" " <%if (!(dcNew.getE01DCMAF2().equals("C") || dcNew.getE01DCMAF2().equals("A"))) out.print("selected");%> selected></option>
								<option value="C" <%if (dcNew.getE01DCMAF2().equals("C")) out.print("selected");%>>Cliente</option>
								<option value="A" <%if (dcNew.getE01DCMAF2().equals("A")) out.print("selected");%>>Cuenta</option>
							</select>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table border="0" cellspacing="0">
					<tr id="trdark">
						<td align="left">
							<input type="text" name="E01DCMDWA" size="12" maxlength="12" value="<%=dcNew.getE01DCMDWA()%>" readonly="readonly"
							<%if (dcNew.getF01DCMDWA().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</td>
						<td>
							
							</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Nombre :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW1" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW1()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDW1().equals("Y")) out.print("class=\"txtchanged\"");%>>
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Dirección :</div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW2" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW2()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDW2().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW3" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW3()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDW3().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right"></div>
				</td>
				<td>
					<div align="left">
						<input type="text" name="E01DCMDW4" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW4()%>" readonly="readonly"
						<%if (dcNew.getF01DCMDW4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

  <h4>Información de la Cobranza</h4>  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
          <TBODY>
          <tr id="trdark">
			<td nowrap width="30%">
             	<div align="right">Fecha de Emisión :</div>
			</td>
            <td nowrap width="20%">
              <eibsinput:date name="dcNew" fn_month="E01DCMIDM" fn_day="E01DCMIDD" fn_year="E01DCMIDY" readonly="true" modified="F01DCMIDY;F01DCMIDD;F01DCMIDM"/> 
            </td>
			<td nowrap width="30%">
             	<div align="right">Próxima Fecha de Rastreo :</div>
			</td>
            <td nowrap width="20%">
              <eibsinput:date name="dcNew" fn_month="E01DCMNTM" fn_day="E01DCMNTD" fn_year="E01DCMNTY" readonly="true" modified="F01DCMNTY;F01DCMNTD;F01DCMNTM"/> 
           </td>
          </tr>
          <TR id="trclear"> 
            <TD nowrap width="30%">
             	<DIV align="right">Tasa de Cambio Mda. Extranjera :</DIV>
			</TD>
			<TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMOFX" maxlength="19" size="20" value="<%= dcNew.getE01DCMOFX().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMOFX().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%"> 
             	<DIV align="right">
					<DIV align="right">N° de Tarifa de Cargos :</DIV>
					</DIV>
            </TD>
            <TD nowrap width="20%">
           		<INPUT	type="text" name="E01DCMTAR" maxlength="3" size="4"	value="<%= dcNew.getE01DCMTAR().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMTAR().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
			</TD>
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="30%">
             	<DIV align="right">Número del Cheque :</DIV>
			</TD>
			<TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMCKN" maxlength="11" size="13" value="<%= dcNew.getE01DCMCKN().trim()%>"  readonly="readonly"
            	<%if (dcNew.getF01DCMCKN().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%"> 
             	<DIV align="right">Centro de Costo :</DIV>
            </TD>
            <TD nowrap width="20%">  
            	<INPUT type="text" name="E01DCMCCN" maxlength="9" size="10" value="<%= dcNew.getE01DCMCCN().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMCCN().equals("Y")) out.print("class=\"txtchanged\"");%>>
			</TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="30%">
             	<DIV align="right">Saldo del Cheque :</DIV>
			</TD>
			<TD nowrap width="20%">
            	<INPUT type="text" name="E01DCMAMN" maxlength="19" size="20" value="<%= dcNew.getE01DCMAMN().trim()%>" readonly="readonly" >
            </TD>
			<TD nowrap width="30%" align="right">Monto Apertura :</TD><TD nowrap width="20%">
				<INPUT	type="text" name="E01DCMMEB" maxlength="19" size="20"	value="<%= dcNew.getE01DCMOAM().trim()%>" readonly="readonly">
			</TD>            
          </TR>
          <TR id="trdark"> 
            <TD nowrap width="30%"> 
             	<DIV align="right">Cargos Nuestros x Cta. del :</DIV>
            </TD>
            <TD nowrap width="20%">  
				<select disabled="disabled" name="E01DCMOCF" <%if (dcNew.getF01DCMOCF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMOCF().equals("D")) && (!dcNew.getE01DCMOCF().equals("P")) && (!dcNew.getE01DCMOCF().equals("N"))) out.println("selected"); %>></OPTION>
					<OPTION value="D" <% if (dcNew.getE01DCMOCF().equals("D")) out.println("selected"); %>>Girado/Importador</OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMOCF().equals("P")) out.println("selected"); %>>Girador/Exportador</OPTION>
					<OPTION value="N" <% if (dcNew.getE01DCMOCF().equals("N")) out.println("selected"); %>>Sin Cargos</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
			</TD>
			<TD nowrap width="30%">
             	<DIV align="right">Avisar No Pago Vía :</DIV>
			</TD>
			<TD nowrap width="20%">
				<select disabled="disabled" name="E01DCMADF" <%if (dcNew.getF01DCMADF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMADF().equals("T")) && (!dcNew.getE01DCMADF().equals("S")) && (!dcNew.getE01DCMADF().equals("A")) && (!dcNew.getE01DCMADF().equals("C")) && (!dcNew.getE01DCMADF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="T" <% if (dcNew.getE01DCMADF().equals("T")) out.println("selected"); %>>Télex</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMADF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMADF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMADF().equals("C")) out.println("selected"); %>>Mensaje</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMADF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
            </TD>
          </TR>
		  <TR id="trclear">
			<TD nowrap width="30%">
             	<DIV align="right">Cargos del Otro Banco x Cta. del :</DIV>
			</TD>
			<TD nowrap width="20%">
				<select disabled="disabled" name="E01DCMOBF" <%if (dcNew.getF01DCMOBF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMOBF().equals("D")) && (!dcNew.getE01DCMOBF().equals("P"))) out.println("selected"); %>></OPTION>
					<OPTION value="D" <% if (dcNew.getE01DCMOBF().equals("D")) out.println("selected"); %>>Girado/Importador</OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMOBF().equals("P")) out.println("selected"); %>>Girador/Exportador</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Avisar Pago Vía :</DIV>
			</TD>
			<TD nowrap width="20%">
				<select disabled="disabled" name="E01DCMAPF" <%if (dcNew.getF01DCMAPF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMAPF().equals("T")) && (!dcNew.getE01DCMAPF().equals("S")) && (!dcNew.getE01DCMAPF().equals("A")) && (!dcNew.getE01DCMAPF().equals("C")) && (!dcNew.getE01DCMAPF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="T" <% if (dcNew.getE01DCMAPF().equals("T")) out.println("selected"); %>>Télex</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMAPF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMAPF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMAPF().equals("C")) out.println("selected"); %>>Mensaje</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMAPF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
            </TD>
		  </TR>
		  <TR id="trdark">
            <TD nowrap width="30%"> 
             	<DIV align="right">N°/Cliente de Línea de Crédito :</DIV>
            </TD>
            <TD nowrap width="20%">  
            	<INPUT type="text" name="E01DCMCMN" maxlength="5" size="6" value="<%= dcNew.getE01DCMCMN().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMCMN().equals("Y")) out.print("class=\"txtchanged\"");%>>
				<INPUT type="text" name="E01DCMLNR" maxlength="10" size="11" value="<%= dcNew.getE01DCMLNR().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMLNR().equals("Y")) out.print("class=\"txtchanged\"");%>>
			</TD>
			<TD nowrap width="30%"><DIV align="right"></DIV>
			</TD>
			<TD nowrap width="20%">
            </TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="30%"> 
             	<DIV align="right">Estado de la Cobranza :</DIV>
            </TD>
            <TD nowrap width="20%">  
				<select disabled="disabled" name="E01DCMCST" <%if (dcNew.getF01DCMCST().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMCST().equals("0")) && (!dcNew.getE01DCMCST().equals("1")) && (!dcNew.getE01DCMCST().equals("2")) && (!dcNew.getE01DCMCST().equals("3")) && (!dcNew.getE01DCMCST().equals("4")) && (!dcNew.getE01DCMCST().equals("5")) && (!dcNew.getE01DCMCST().equals("6")) && (!dcNew.getE01DCMCST().equals("7")) && (!dcNew.getE01DCMCST().equals("8")) && (!dcNew.getE01DCMCST().equals("9")) && (!dcNew.getE01DCMCST().equals("P")) && (!dcNew.getE01DCMCST().equals("V")))%>></OPTION>
					<OPTION value="0" <% if (dcNew.getE01DCMCST().equals("0")) out.println("selected"); %>>Esperando Confirmación Recibida</OPTION>
					<OPTION value="1" <% if (dcNew.getE01DCMCST().equals("1")) out.println("selected"); %>>Pendiente de Aceptación</OPTION>
					<OPTION value="2" <% if (dcNew.getE01DCMCST().equals("2")) out.println("selected"); %>>Pendiente de Pago</OPTION>
					<OPTION value="3" <% if (dcNew.getE01DCMCST().equals("3")) out.println("selected"); %>>Aceptada</OPTION>
					<OPTION value="4" <% if (dcNew.getE01DCMCST().equals("4")) out.println("selected"); %>>Protestada Vigente</OPTION>
					<OPTION value="5" <% if (dcNew.getE01DCMCST().equals("5")) out.println("selected"); %>>Prorrogada Extendida</OPTION>
					<OPTION value="6" <% if (dcNew.getE01DCMCST().equals("6")) out.println("selected"); %>>Cancelada - Libre de Pago</OPTION>
					<OPTION value="7" <% if (dcNew.getE01DCMCST().equals("7")) out.println("selected"); %>>Cancelada - Devuelta</OPTION>
					<OPTION value="8" <% if (dcNew.getE01DCMCST().equals("8")) out.println("selected"); %>>Cerrada Parcialmente Pagada</OPTION>
					<OPTION value="9" <% if (dcNew.getE01DCMCST().equals("9")) out.println("selected"); %>>Cerrada Totalmente Pagada</OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMCST().equals("P")) out.println("selected"); %>>Vencida Protestada</OPTION>
					<OPTION value="V" <% if (dcNew.getE01DCMCST().equals("V")) out.println("selected"); %>>Vencida Sin Protestar</OPTION>
				</SELECT>
			</TD>
			<TD nowrap width="30%"></TD>
            <TD nowrap width="20%"></TD>
          </TR>
        </TBODY></TABLE>
      </td>
    </tr>
  </table>
<BR>

</form>
</body>
</html>
