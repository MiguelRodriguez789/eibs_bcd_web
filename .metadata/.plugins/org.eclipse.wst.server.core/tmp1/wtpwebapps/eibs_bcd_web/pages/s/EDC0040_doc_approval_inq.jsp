<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Consulta de Cobranza Documentaria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windowsss">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="dcNew"  class="datapro.eibs.beans.EDC000001Message" scope="session" />
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
<h3 align="center">Aprobación de Cobranza Documentaria<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="doc_approval_inq.jsp, EDC0040"></h3>
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
						<input readonly  type="text" name="E01DCMBNK" readonly size="4" maxlength="2" value="<%=dcNew.getE01DCMBNK().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Número de Cobranza   :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B> 
				<%if (dcNew.getE01DCMACC().trim().equals("999999999999"))
				{%>
					<input readonly  type="text" size="12" maxlength="12" value="Nuevo" readonly>
					<input readonly  type="hidden" name="E01DCMACC" value="<%=dcNew.getE01DCMACC().trim()%>">
				<%}
				else
				{%>
					<input readonly  type="text" name="E01DCMACC" size="12" maxlength="12" value="<%=dcNew.getE01DCMACC().trim()%>" readonly>
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
						<input readonly  type="text" name="E01DCMORF" size="20" maxlength="16" value="<%=dcNew.getE01DCMORF().trim()%>"
						<%if (dcNew.getF01DCMORF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Producto :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<input readonly  type="text" name="E01DCMPRO" size="4" maxlength="4" value="<%=dcNew.getE01DCMPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Tipo de Cobranza :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<input readonly  type="text" name="E01DCMTYP" size="20" maxlength="16" value="<%=dcNew.getE01DCMTYP().trim()%>">
					</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Descripcion de Producto :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<input readonly  type="text" name="E01DSCPRO" size="30" maxlength="30" value="<%=dcNew.getE01DSCPRO().trim()%>" readonly>
					</B></DIV>
				</TD>
			</TR>
			</TBODY></TABLE>
		</td>
	</tr>
</table>
<h4>Girador (Exportador)</h4><table class="tableinfo">
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
						<td align="left" colspan="2">
							<input readonly  type="text" name="E01DCMDRA" size="12" maxlength="12" value="<%=dcNew.getE01DCMDRA()%>"
							<%if (dcNew.getF01DCMDRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
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
						<input readonly  type="text" name="E01DCMDR1" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR1()%>"
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
						<input readonly  type="text" name="E01DCMDR2" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR2()%>"
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
						<input readonly  type="text" name="E01DCMDR3" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR3()%>"
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
						<input readonly  type="text" name="E01DCMDR4" size="45" maxlength="35" value="<%=dcNew.getE01DCMDR4()%>"
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
						<input readonly  type="text" name="E01DCMDRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMDRF()%>"
						<%if (dcNew.getF01DCMDRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Girado (Importador)</h4>
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
							<input readonly  type="text" name="E01DCMDWA" size="12" maxlength="12" value="<%=dcNew.getE01DCMDWA()%>"
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
						<input readonly  type="text" name="E01DCMDW1" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW1()%>"
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
						<input readonly  type="text" name="E01DCMDW2" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW2()%>"
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
						<input readonly  type="text" name="E01DCMDW3" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW3()%>"
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
						<input readonly  type="text" name="E01DCMDW4" size="45" maxlength="35" value="<%=dcNew.getE01DCMDW4()%>"
						<%if (dcNew.getF01DCMDW4().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</div>
				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Documento :</div>
				</td>
				<td>
					<div align="left">
						<input readonly  type="text" name="E01DSC101" size="45" maxlength="35" value="<%=dcNew.getE01DSC101()%>">
					</div>
				</td>
			</tr>
			
		</table>
		</td>
	</tr>
</table>

<h4>Remitido Por (Remitente)</h4>
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
								<input readonly  type="text" name="E01DCMRBA" size="12" maxlength="12" value="<%=dcNew.getE01DCMRBA()%>"
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
						<input readonly  type="text" name="E01DCMRB1" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB1()%>"
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
						<input readonly  type="text" name="E01DCMRB2" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB2()%>"
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
						<input readonly  type="text" name="E01DCMRB3" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB3()%>"
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
						<input readonly  type="text" name="E01DCMRB4" size="45" maxlength="35" value="<%=dcNew.getE01DCMRB4()%>"
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
						<input readonly  type="text" name="E01DCMRRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMRRF()%>"
						<%if (dcNew.getF01DCMRRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					</DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
		</td>
	</tr>
</table>

<H4>Banco <%= dcNew.getE01DCMTYP().trim().equals("I")?"Reembolsador":"Presentador" %> </H4>
<TABLE class="tableinfo">
	<TBODY>
		<TR>
			<TD>
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
					<TR id="trdark">
						<TD align="right">
						<TABLE border="0" cellspacing="0">
							<TBODY>
								<TR id="trdark">
									<TD align="right">Numero de Cliente o de Cuenta:</TD>
									<TD nowrap width="25%"><SELECT disabled="disabled" 
										name="E01DCMAF4" <%if (dcNew.getF01DCMAF4().equals("Y")) out.print("class=\"txtchanged\"");%>>
										<OPTION value=" "
											<%if (!(dcNew.getE01DCMAF4().equals("C") || dcNew.getE01DCMAF4().equals("A"))) out.print("selected");%>
											selected></OPTION>
										<OPTION value="C"
											<%if (dcNew.getE01DCMAF4().equals("C")) out.print("selected");%>>Cliente</OPTION>
										<OPTION value="A"
											<%if (dcNew.getE01DCMAF4().equals("A")) out.print("selected");%>>Cuenta</OPTION>
									</SELECT></TD>
								</TR>
							</TBODY>
						</TABLE>
						</TD>
						<TD>
						<TABLE border="0" cellspacing="0">
							<TBODY>
								<TR id="trdark">
									<TD align="left"><INPUT readonly type="text" name="E01DCMCLA"
										size="12" maxlength="12" value="<%=dcNew.getE01DCMCLA()%>"
										<%if (dcNew.getF01DCMAF4().equals("Y")) out.print("class=\"txtchanged\"");%>>
										<IMG src="<%=request.getContextPath()%>/images/Check.gif"
										title="mandatory field" border="0"></TD>
									<TD></TD>
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
							<INPUT readonly type="text" name="E01DCMCL1" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL1()%>"
							<%if (dcNew.getF01DCMCL1().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</DIV>
						</TD>
					</TR>
					<TR id="trdark">
						<TD>
						<DIV align="right">Dirección :</DIV>
						</TD>
						<TD>
						<DIV align="left">
							<INPUT readonly type="text" name="E01DCMCL2" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL2()%>"
							<%if (dcNew.getF01DCMCL2().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</DIV>
						</TD>
					</TR>
					<TR id="trclear">
						<TD>
						<DIV align="right"></DIV>
						</TD>
						<TD>
						<DIV align="left">
							<INPUT readonly type="text" name="E01DCMCL3" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL3()%>"
							<%if (dcNew.getF01DCMCL3().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</DIV>
						</TD>
					</TR>
					<TR id="trdark">
						<TD>
						<DIV align="right"></DIV>
						</TD>
						<TD>
						<DIV align="left">
							<INPUT readonly type="text" name="E01DCMCL4" size="45" maxlength="35" value="<%=dcNew.getE01DCMCL4()%>"
							<%if (dcNew.getF01DCMCL4().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</DIV>
						</TD>
					</TR>
					<TR id="trclear">
						<TD>
						<DIV align="right">Referencia :</DIV>
						</TD>
						<TD>
						<DIV align="left">
							<INPUT readonly type="text" name="E01DCMCRF" size="20" maxlength="16" value="<%=dcNew.getE01DCMCRF()%>"
							<%if (dcNew.getF01DCMCRF().equals("Y")) out.print("class=\"txtchanged\"");%>>
						</DIV>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>

<h4>Información de Fechas</h4>  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         <tr id="trdark">
            <td nowrap width="30%">
             	<div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMMAM" fn_day="E01DCMMAD" fn_year="E01DCMMAY" modified="F01DCMMAM, F01DCMMAD, F01DCMMAY" readonly="true"/>				           
			</td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Emisión :</div>
			</td>
            <td nowrap width="20%">
            	<eibsinput:date name="dcNew" fn_month="E01DCMIDM" fn_day="E01DCMIDD" fn_year="E01DCMIDY" modified="F01DCMIDM, F01DCMIDD, F01DCMIDY" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="30%">
             	<div align="right">Fecha de Remitente :</div>
            </td>
            <td nowrap width="20%">
            	<eibsinput:date name="dcNew" fn_month="E01DCMRMM" fn_day="E01DCMRMD" fn_year="E01DCMRMY" modified="F01DCMRMM, F01DCMRMD, F01DCMRMY" readonly="true"/>
			</td>
			<td nowrap width="30%">
             	<div align="right">Próxima Fecha de Rastreo :</div>
			</td>
            <td nowrap width="20%">
            	<eibsinput:date name="dcNew" fn_month="E01DCMNTM" fn_day="E01DCMNTD" fn_year="E01DCMNTY" modified="F01DCMNTM, F01DCMNTD, F01DCMNTY" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%">
             	<div align="right">Fecha de Acuse de Recibo :</div>
            </td>
            <td nowrap width="20%">
            	<eibsinput:date name="dcNew" fn_month="E01DCMAKM" fn_day="E01DCMAKD" fn_year="E01DCMAKY" readonly="true"/>
			</td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Aceptación :</div>
			</td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMACM" fn_day="E01DCMACD" fn_year="E01DCMACY"  readonly="true"/>
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
          <TR id="trdark"> 
            <TD nowrap width="30%"><DIV align="right">Monto Original Apertura:</DIV>
			</TD><TD nowrap width="20%">           	
            	<INPUT readonly type="text" name="E01DCMOAM" maxlength="19"	size="20" value="<%= dcNew.getE01DCMOAM().trim()%>">
            </TD>
			<TD nowrap width="30%"> 
             	<DIV align="right">
					<DIV align="right">Tasa de Cambio Mda. Extranjera
					:</DIV></DIV>
            </TD><TD nowrap width="20%">
            	<A href="javascript:GetCurrency('E01DCMFCY','')"></A> 
			<INPUT readonly type="text" name="E01DCMOFX" maxlength="19" size="20"
						value="<%= dcNew.getE01DCMOFX().trim()%>"
            	<%if (dcNew.getF01DCMOFX().equals("Y")) out.print("class=\"txtchanged\"");%>>
			</TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="30%">
             	<DIV align="right">Saldo de la Cobranza :</DIV>
			</TD><TD nowrap width="20%">
            	<input readonly  type="text" name="E01DCMMEB" maxlength="19" size="20" value="<%= dcNew.getE01DCMMEB().trim()%>" >
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%"> 
             	<DIV align="right">Centro de Costo :</DIV>
            </TD><TD nowrap width="20%">  
            	<input readonly  type="text" name="E01DCMCCN" maxlength="9" size="10" value="<%= dcNew.getE01DCMCCN().trim()%>"
            	<%if (dcNew.getF01DCMCCN().equals("Y")) out.print("class=\"txtchanged\"");%>>
			</TD>
          </TR>
		<TR id="trdark"> 
            <TD nowrap width="30%"> 
             	<DIV align="right">Entregar Documentos Contra :</DIV>
            </TD>
            <TD nowrap width="20%">  
				<select disabled="disabled" name="E01DCMRDF" <%if (dcNew.getF01DCMRDF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMRDF().equals("P")) && (!dcNew.getE01DCMRDF().equals("A"))) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew.getE01DCMRDF().equals("P")) out.println("selected"); %>>Pago</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMRDF().equals("A")) out.println("selected"); %>>Aceptación</OPTION>
				</SELECT>
			</TD>
			<TD nowrap width="30%"> 
             	<DIV align="right">Protestar :</DIV>
            </TD><TD nowrap width="20%">  
            	<input type="radio" name="E01DCMPTF" value="Y" disabled="disabled"  
            	<%
            		if(dcNew.getE01DCMPTF().equals("Y")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMPTF().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>Sí 
            	<input type="radio" name="E01DCMPTF" value="N" disabled="disabled"  
            	<%
            		if(dcNew.getE01DCMPTF().equals("N")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMPTF().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>No 
			</TD>
          </TR>
          <TR id="trclear"> 
            <TD nowrap width="30%"> 
             	<DIV align="right">Avisar Aceptación Vía :</DIV>
            </TD>
            <TD nowrap width="20%">  
				<select disabled="disabled" name="E01DCMAAF" <%if (dcNew.getF01DCMAAF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMAAF().equals("T")) && (!dcNew.getE01DCMAAF().equals("S")) && (!dcNew.getE01DCMAAF().equals("A")) && (!dcNew.getE01DCMAAF().equals("C")) && (!dcNew.getE01DCMAAF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="T" <% if (dcNew.getE01DCMAAF().equals("T")) out.println("selected"); %>>Télex</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMAAF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMAAF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMAAF().equals("C")) out.println("selected"); %>>Mensaje</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMAAF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
			</TD>
			<TD nowrap width="30%"> 
             	<DIV align="right">Condonar Cargos :</DIV>
            </TD><TD nowrap width="20%">  
            	<input type="radio" name="E01DCMWCF" value="Y" disabled="disabled"
            	<%
            		if(dcNew.getE01DCMWCF().equals("Y")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMWCF().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>Sí 
            	<input type="radio" name="E01DCMWCF" value="N" disabled="disabled"
            	<%
            		if(dcNew.getE01DCMWCF().equals("N")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMWCF().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>No 
			</TD>
          </TR>
		  <TR id="trdark"> 
            <TD nowrap width="30%">
             	<DIV align="right">Avisar No Aceptación Vía :</DIV>
			</TD><TD nowrap width="20%">
				<select disabled="disabled" name="E01DCMADF" <%if (dcNew.getF01DCMADF().equals("Y")) out.print("class=\"txtchanged\"");%>>
					<OPTION value=" " <% if ((!dcNew.getE01DCMADF().equals("T")) && (!dcNew.getE01DCMADF().equals("S")) && (!dcNew.getE01DCMADF().equals("A")) && (!dcNew.getE01DCMADF().equals("C")) && (!dcNew.getE01DCMADF().equals("F"))) out.println("selected"); %>></OPTION>
					<OPTION value="T" <% if (dcNew.getE01DCMADF().equals("T")) out.println("selected"); %>>Télex</OPTION>
					<OPTION value="S" <% if (dcNew.getE01DCMADF().equals("S")) out.println("selected"); %>>Swift</OPTION>
					<OPTION value="A" <% if (dcNew.getE01DCMADF().equals("A")) out.println("selected"); %>>Correo Aéreo</OPTION>
					<OPTION value="C" <% if (dcNew.getE01DCMADF().equals("C")) out.println("selected"); %>>Mensaje</OPTION>
					<OPTION value="F" <% if (dcNew.getE01DCMADF().equals("F")) out.println("selected"); %>>Fax</OPTION>
				</SELECT>
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Pagos Parciales :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<input type="radio" name="E01DCMPPF" value="Y" disabled="disabled"
            	<%
            		if(dcNew.getE01DCMPPF().equals("Y")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMPPF().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>Sí 
            	<input type="radio" name="E01DCMPPF" value="N" disabled="disabled"
            	<%
            		if(dcNew.getE01DCMPPF().equals("N")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMPPF().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>No
            </TD>
          </TR>
          <TR id="trclear"> 
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
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
            </TD>
			<TD nowrap width="30%">
             	<DIV align="right">Condonar Intereses :</DIV>
			</TD>
            <TD nowrap width="20%">
            	<input type="radio" name="E01DCMWIF" value="Y" disabled="disabled"
            	<%
            		if(dcNew.getE01DCMWIF().equals("Y")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMWIF().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>Sí 
            	<input type="radio" name="E01DCMWIF" value="N" disabled="disabled"
            	<%
            		if(dcNew.getE01DCMWIF().equals("N")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMWIF().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>No 
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

					<DIV align="right">Cargos del Otro Banco x Cta. del</DIV>
					</TD>
			<TD nowrap width="20%">
			<select disabled="disabled" name="E01DCMOBF" <%if (dcNew.getF01DCMOBF().equals("Y")) out.print("class=\"txtchanged\"");%>>
						<OPTION value=" "
							<% if ((!dcNew.getE01DCMOBF().equals("D")) && (!dcNew.getE01DCMOBF().equals("P"))) out.println("selected"); %>></OPTION>
						<OPTION value="D"
							<% if (dcNew.getE01DCMOBF().equals("D")) out.println("selected"); %>>Girado/Importador</OPTION>
						<OPTION value="P"
							<% if (dcNew.getE01DCMOBF().equals("P")) out.println("selected"); %>>Girador/Exportador</OPTION>
					</SELECT><IMG src="<%=request.getContextPath()%>/images/Check.gif"
						title="campo obligatorio" align="bottom" border="0"></TD>
          </TR>
		<TR id="trdark">
            <TD nowrap width="30%"> 
             	<DIV align="right">Estado de la Cobranza :</DIV>
            </TD>
            <TD nowrap width="20%">
				<A href="javascript:GetCustomer('E01DCMLNR')"></A>
				<SELECT
						disabled="disabled" name="E01DCMCST" <%if (dcNew.getF01DCMCST().equals("Y")) out.print("class=\"txtchanged\"");%>>
						<OPTION value=" "
							<% if ((!dcNew.getE01DCMCST().equals("0")) && (!dcNew.getE01DCMCST().equals("1")) && (!dcNew.getE01DCMCST().equals("2")) && (!dcNew.getE01DCMCST().equals("3")) && (!dcNew.getE01DCMCST().equals("4")) && (!dcNew.getE01DCMCST().equals("5")) && (!dcNew.getE01DCMCST().equals("6")) && (!dcNew.getE01DCMCST().equals("7")) && (!dcNew.getE01DCMCST().equals("8")) && (!dcNew.getE01DCMCST().equals("9")) && (!dcNew.getE01DCMCST().equals("P")) && (!dcNew.getE01DCMCST().equals("V")))out.println("selected"); %>></OPTION>
						<OPTION value="0"
							<% if (dcNew.getE01DCMCST().equals("0")) out.println("selected"); %>>Esperando
						Confirmación Recibida</OPTION>
						<OPTION value="1"
							<% if (dcNew.getE01DCMCST().equals("1")) out.println("selected"); %>>Pendiente
						de Aceptación</OPTION>
						<OPTION value="2"
							<% if (dcNew.getE01DCMCST().equals("2")) out.println("selected"); %>>Pendiente
						de Pago</OPTION>
						<OPTION value="3"
							<% if (dcNew.getE01DCMCST().equals("3")) out.println("selected"); %>>Aceptada</OPTION>
						<OPTION value="4"
							<% if (dcNew.getE01DCMCST().equals("4")) out.println("selected"); %>>Protestada
						Vigente</OPTION>
						<OPTION value="5"
							<% if (dcNew.getE01DCMCST().equals("5")) out.println("selected"); %>>Prorrogada
						Extendida</OPTION>
						<OPTION value="6"
							<% if (dcNew.getE01DCMCST().equals("6")) out.println("selected"); %>>Cancelada
						- Libre de Pago</OPTION>
						<OPTION value="7"
							<% if (dcNew.getE01DCMCST().equals("7")) out.println("selected"); %>>Cancelada
						- Devuelta</OPTION>
						<OPTION value="8"
							<% if (dcNew.getE01DCMCST().equals("8")) out.println("selected"); %>>Cerrada
						Parcialmente Pagada</OPTION>
						<OPTION value="9"
							<% if (dcNew.getE01DCMCST().equals("9")) out.println("selected"); %>>Cerrada
						Totalmente Pagada</OPTION>
						<OPTION value="P"
							<% if (dcNew.getE01DCMCST().equals("P")) out.println("selected"); %>>Vencida
						Protestada</OPTION>
						<OPTION value="V"
							<% if (dcNew.getE01DCMCST().equals("V")) out.println("selected"); %>>Vencida
						Sin Protestar</OPTION>
					</SELECT>
			</TD>
			<TD nowrap width="30%">
             	<DIV align="right">N° de Tarifa de Cargos :</DIV>
			</TD>
			<TD nowrap width="20%">
            	<input readonly  type="text" name="E01DCMTAR" maxlength="3" size="4" value="<%= dcNew.getE01DCMTAR().trim()%>" 
            	<%if (dcNew.getF01DCMTAR().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </TD>
          </TR>
		   <TR id="trclear"> 
            <TD nowrap width="30%"> 
             	<DIV align="right">Término:</DIV>
            </TD>
            <TD nowrap width="20%">  
				<SELECT name="E01DCMTRC" disabled="disabled" <%if (dcNew.getF01DCMTRC().equals("Y")) out.print("class=\"txtchanged\"");%>>
						<OPTION value="  " 
							<% if ((!dcNew.getE01DCMTRC().equals("AS")) && (!dcNew.getE01DCMTRC().equals("BE")) && (!dcNew.getE01DCMTRC().equals("BL")) && (!dcNew.getE01DCMTRC().equals("CC")) && (!dcNew.getE01DCMTRC().equals("FD")) && (!dcNew.getE01DCMTRC().equals("FP")) && (!dcNew.getE01DCMTRC().equals("GA")) && (!dcNew.getE01DCMTRC().equals("ID")) && (!dcNew.getE01DCMTRC().equals("ST")) && (!dcNew.getE01DCMTRC().equals("TD"))) out.println("selected"); %>></OPTION>
						<OPTION value="AS"
							<% if (dcNew.getE01DCMTRC().equals("AS")) out.println("selected"); %>>A
						la vista</OPTION>
						<OPTION value="BE"
							<% if (dcNew.getE01DCMTRC().equals("BE")) out.println("selected"); %>>Después
						de Fecha de Letra de Cambio</OPTION>
						<OPTION value="BL"
							<% if (dcNew.getE01DCMTRC().equals("BL")) out.println("selected"); %>>Después
						de Fecha de Embarque</OPTION>
						<OPTION value="CC"
							<% if (dcNew.getE01DCMTRC().equals("CC")) out.println("selected"); %>>Después
						de Pase de Mercancía por Aduana</OPTION>
						<OPTION value="FD"
							<% if (dcNew.getE01DCMTRC().equals("FD")) out.println("selected"); %>>Después
						de Pase de Mercancía por Revisión</OPTION>
						<OPTION value="FP"
							<% if (dcNew.getE01DCMTRC().equals("FP")) out.println("selected"); %>>Primera
						presentación</OPTION>
						<OPTION value="GA"
							<% if (dcNew.getE01DCMTRC().equals("GA")) out.println("selected"); %>>Después
						de Arribo de Mercancía</OPTION>
						<OPTION value="ID"
							<% if (dcNew.getE01DCMTRC().equals("ID")) out.println("selected"); %>>Después
						de Fecha de Factura</OPTION>
						<OPTION value="ST"
							<% if (dcNew.getE01DCMTRC().equals("ST")) out.println("selected"); %>>Después
						de Entregado</OPTION>
						<OPTION value="TD"
							<% if (dcNew.getE01DCMTRC().equals("TD")) out.println("selected"); %>>Después
						de Fecha de Doc. de Transporte</OPTION>
					</SELECT>
				
			</TD>
			<TD nowrap width="30%" height="15">
             	<DIV align="right">Plazo:</DIV>
			</TD>
            <TD nowrap width="20%" height="15">
				<INPUT readonly type="text" name="E01DCMDYS" maxlength="5" size="6" value="<%= dcNew.getE01DCMDYS().trim()%>"
				<%if (dcNew.getF01DCMDYS().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </TD>
          </TR>
		 
		   <% if(!dcNew.getE01DCMOPT().equals("N")){ %>
		  <TR id="trclear">
			<TD nowrap width="30%">
             	<DIV align="right">Aumento/Disminucion de Saldos :</DIV>
			</TD>
			<TD nowrap width="20%">
				<SELECT name="E01DCMOPT" disabled="disabled">
					<OPTION value=" " <% if (!dcNew.getE01DCMOPT().equals("I") && !dcNew.getE01DCMOPT().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="I" <%= dcNew.getE01DCMOPT().equals("I")?"selected":"" %>>Aumento</OPTION>
					<OPTION value="D" <%= dcNew.getE01DCMOPT().equals("D")?"selected":"" %>>Disminucion</OPTION>
				</SELECT>
                <INPUT type="text" name="E01AMTOPT" maxlength="16" size="17" value="<%= dcNew.getE01AMTOPT()%>" readonly>				
            </TD>
			<TD nowrap width="30%"></TD>
			<TD nowrap width="20%"></TD>
		  </TR>          
		  <% } %>
        </TBODY></TABLE>
      </td>
    </tr>
  </table>

  <h4>Información de la Mercancía</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="30%">
				<div align="right">N° de Guía del Embarque :</DIV>
            </td>
            <td nowrap width="20%"><INPUT type="text" name="E01DCMBLN" 	maxlength="16" size="17" value="<%= dcNew.getE01DCMBLN().trim()%>" readonly="readonly"></td>
			<td nowrap width="30%">
             	<div align="right">Fecha de Guía del Embarque :</div>
			</td>
            <td nowrap width="20%">
				<eibsinput:date name="dcNew" fn_month="E01DCMBDM" fn_day="E01DCMBDY" fn_year="E01DCMBDY" readonly="true" />
            </td>
          </tr>
		  <tr id="trclear">
            <td nowrap width="30%">
				<DIV align="right">Descripción :</DIV>
            </td>
            <td nowrap width="20%"><INPUT type="text" name="E01DCMMED" 	maxlength="35" size="50" value="<%= dcNew.getE01DCMMED().trim()%>" readonly="readonly"
            	 <%if (dcNew.getF01DCMMED().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
            <td nowrap width="30%"> 
             	<div align="right">Mercancía en Consignación :</div>
            </td>
            <td nowrap width="20%">  
            	<input type="radio" name="E01DCMMCO" value="Y" disabled="disabled"
            	<%
            		if(dcNew.getE01DCMMCO().equals("Y")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMMCO().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>Sí 
            	<input type="radio" name="E01DCMMCO" value="N" disabled="disabled"
            	<%
            		if(dcNew.getE01DCMMCO().equals("N")) {
            			out.print("checked = \"checked\"");
            			if (dcNew.getF01DCMMCO().equals("Y")) {
            				out.print("class=\"txtchanged\"");
            			}
            		}	
            	%>>No 
			</td>
		  </tr>
		  <tr id="trdark">
			<td nowrap>
             	<div align="right">Nombre del Navío :</div>
			</td>
            <td nowrap colspan=3>
            	<INPUT type="text" name="E01DCMVSL" maxlength="20" size="35" value="<%= dcNew.getE01DCMVSL().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMVSL().equals("Y")) out.print("class=\"txtchanged\"");%>>
            </td>
          </tr>
          <tr id="trclear">
             <td><DIV align="right">Agente :</div></td>
             <td colspan=3>
                <INPUT type="text" name="E01DCMAG1" maxlength="35" size="50" value="<%= dcNew.getE01DCMAG1().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMAG1().equals("Y")) out.print("class=\"txtchanged\"");%>>
                <br>
                <INPUT type="text" name="E01DCMAG2" maxlength="35" size="50" value="<%= dcNew.getE01DCMAG2().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMAG2().equals("Y")) out.print("class=\"txtchanged\"");%>>
                <br>
                <INPUT type="text" name="E01DCMAG3" maxlength="35" size="50" value="<%= dcNew.getE01DCMAG3().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMAG3().equals("Y")) out.print("class=\"txtchanged\"");%>>
                <br>
                <INPUT type="text" name="E01DCMAG4" maxlength="35" size="50" value="<%= dcNew.getE01DCMAG4().trim()%>" readonly="readonly"
            	<%if (dcNew.getF01DCMAG4().equals("Y")) out.print("class=\"txtchanged\"");%>>
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>
<H4>Información de Documentos Recibidos</H4>
<TABLE class="tableinfo">
	<TBODY>
		<TR bordercolor="#FFFFFF">
			<TD nowrap>
			<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
				<TBODY>
				    <tr id="trclear">
				      <td>Documento</td>
				      <td>Descripcion</td>
				      <td>Originales</td>
				      <td>Copias</td>
				      <td></td>
				      <td>Documento</td>
				      <td>Descripcion</td>
				      <td>Originales</td>
				      <td>Copias</td>
				      
				    </tr>
					<TR id="trdark">
						<TD><INPUT type="text" name="E01DCMDD1" maxlength="4" size="5"	value="<%= dcNew.getE01DCMDD1() %>" readonly></TD>
						<TD><INPUT type="text" name="E01DCMDS1" maxlength="35" size="35"	value="<%= dcNew.getE01DCMDS1() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDO1" maxlength="1"	size="2" value="<%= dcNew.getE01DCMDO1() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDC1" maxlength="1"	size="2" value="<%= dcNew.getE01DCMDC1() %>" readonly></TD>
						<TD></TD>
						<TD><INPUT type="text" name="E01DCMDD2" maxlength="4" size="5"	value="<%= dcNew.getE01DCMDD2() %>" readonly></TD>
						<TD><INPUT	type="text" name="E01DCMDS2" maxlength="35" size="35"	value="<%= dcNew.getE01DCMDS2() %>" readonly></TD>
						<TD><INPUT type="text" name="E01DCMDO2" maxlength="1" size="2"	value="<%= dcNew.getE01DCMDO2() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDC2" maxlength="1" size="2"	value="<%= dcNew.getE01DCMDC2() %>" readonly></TD>
					</TR>
					<TR id="trclear">
						<TD><INPUT type="text" name="E01DCMDD3" maxlength="4" size="5"	value="<%= dcNew.getE01DCMDD3() %>" readonly></TD>
						<TD><INPUT type="text" name="E01DCMDS3" maxlength="35" size="35" value="<%= dcNew.getE01DCMDS3() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDO3" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDO3() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDC3" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDC3() %>" readonly></TD>
						<TD></TD>
						<TD><INPUT type="text" name="E01DCMDD4" maxlength="4" size="5"			value="<%= dcNew.getE01DCMDD4() %>" readonly></TD>
						<TD><INPUT type="text" name="E01DCMDS4" maxlength="35" size="35"	value="<%= dcNew.getE01DCMDS4() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDO4" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDO4() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDC4" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDC4() %>" readonly></TD>
					</TR>
					<TR id="trdark">
						<TD><INPUT type="text" name="E01DCMDD5" maxlength="4" size="5"		value="<%= dcNew.getE01DCMDD5() %>" readonly></TD>
						<TD><INPUT type="text" name="E01DCMDS5" maxlength="35" size="35"	value="<%= dcNew.getE01DCMDS5() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDO5" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDO5() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDC5" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDC5() %>" readonly></TD>
						<TD></TD>
						<TD><INPUT type="text" name="E01DCMDD6" maxlength="4" size="5"		value="<%= dcNew.getE01DCMDD6() %>" readonly></TD>
						<TD><INPUT type="text" name="E01DCMDS6" maxlength="35" size="35"	value="<%= dcNew.getE01DCMDS6() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDO6" maxlength="1"	size="2" value="<%= dcNew.getE01DCMDO6() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDC6" maxlength="1"	size="2" value="<%= dcNew.getE01DCMDC6() %>" readonly></TD>
					</TR>
					<TR id="trclear">
						<TD><INPUT type="text" name="E01DCMDD7" maxlength="4" size="5"		value="<%= dcNew.getE01DCMDD7() %>" readonly></TD>
						<TD><INPUT type="text" name="E01DCMDS7" maxlength="35" size="35"	value="<%= dcNew.getE01DCMDS7() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDO7" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDO7() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDC7" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDC7() %>" readonly></TD>
						<TD></TD>
						<TD><INPUT type="text" name="E01DCMDD8" maxlength="4" size="5"		value="<%= dcNew.getE01DCMDD8() %>" readonly></TD>
						<TD><INPUT type="text" name="E01DCMDS8" maxlength="35" size="35"	value="<%= dcNew.getE01DCMDS8() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDO8" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDO8() %>" readonly></TD>
						<TD> <INPUT type="text" name="E01DCMDC8" maxlength="1"		size="2" value="<%= dcNew.getE01DCMDC8() %>" readonly></TD>
					</TR>
				</TBODY>
			</TABLE>
			</TD>
		</TR>
	</TBODY>
</TABLE>


</form>
</body>
</html>
