<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Mantenimiento de Cobranza Documentaria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="dcNew"  class="datapro.eibs.beans.EDC000001Message" scope="session" />
<jsp:useBean id="dcNew2"  class="datapro.eibs.beans.EDC000002Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript">

	builtNewMenu(dc_d_inquiry);

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

if (!userPO.getPurpose().equals("NEW")) {
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
}
%>

</head>
<body>
<h3 align="center">Aprobaci�n de Cobranza Documentaria<br>Comisiones y Cargos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="doc_commissions.jsp, EDC0040"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0000">
<input type="hidden" name="E01DCMBNK" value="<%= dcNew.getE01DCMBNK().trim() %>">

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
					<DIV align="right"><B>N�mero de Cobranza   :</B></DIV>
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
						<input readonly  type="text" name="E01DCMORF" size="20" maxlength="16" value="<%=dcNew.getE01DCMORF().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Producto :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<input readonly  type="text" name="E01DCMPRO" size="4" maxlength="4" value="<%=dcNew.getE01DCMPRO().trim()%>" readonly>
					</B><input readonly  type="text" name="E01DSCPRO" size="30" maxlength="30"
						value="<%=dcNew.getE01DSCPRO().trim()%>" readonly></DIV>
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
					<DIV align="right"><B>Tabla de Tarifas y Comisiones :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<input readonly  type="text" name="E02DCMTAR" size="4" maxlength="4" value="<%=dcNew2.getE02DCMTAR().trim()%>" readonly></B>
					</DIV>
				</TD>
			</TR>
			</TBODY></TABLE>
		</td>
	</tr>
</table>

  <br>  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr> 
            <th nowrap width="30%"> 
             	<div>Concepto</div>
            </th>
            <th nowrap width="20%">  
             	<div>Monto/Por cuenta de</div>
			</th>
			<th nowrap width="30%">
             	<div>Concepto</div>
			</th>
            <th nowrap width="20%">
             	<div>Monto/Por cuenta de</div>
            </th>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
             	<div align="right">Nuestra Comisi�n :</div>
            </td>
            <td nowrap width="20%">  
            	<input readonly  type="text" name="E02DCMC01" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC01().trim()%>">
				<select disabled="disabled" name="E02DCMF01">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF01().equals("P") || !dcNew2.getE02DCMF01().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF01().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF01().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Servicio de Courrier :</div>
			</td>
            <td nowrap width="20%">
            	<input readonly  type="text" name="E02DCMC03" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC03().trim()%>">
				<select disabled="disabled" name="E02DCMF03">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF03().equals("P") || !dcNew2.getE02DCMF03().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF03().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF03().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
             	<div align="right">Swift Acuse de Recibo  :</div>
            </td>
            <td nowrap width="20%">  
            	<input readonly  type="text" name="E02DCMC04" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC04().trim()%>">
				<select disabled="disabled" name="E02DCMF04">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF04().equals("P") || !dcNew2.getE02DCMF04().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF04().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF04().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%"><div align="right">Gastos Banco Remitente :</div>
			</td>
            <td nowrap width="20%">
            	<input readonly  type="text" name="E02DCMC05" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC05().trim()%>">
				<select disabled="disabled" name="E02DCMF05">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF05().equals("P") || !dcNew2.getE02DCMF05().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF05().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF05().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
             	<div align="right">
				<DIV align="right">Mensaje(s) Swift :</DIV></div>
            </td>
            <td nowrap width="20%">  
            	<input readonly  type="text" name="E02DCMC06" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC06().trim()%>">
				<select disabled="disabled" name="E02DCMF06">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF06().equals("P") || !dcNew2.getE02DCMF06().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF06().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF06().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%"><div align="right">Servicio de Fax/Telefono  :</div>
			</td>
            <td nowrap width="20%">
            	<input readonly  type="text" name="E02DCMC07" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC07().trim()%>">
				<select disabled="disabled" name="E02DCMF07">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF07().equals("P") || !dcNew2.getE02DCMF07().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF07().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF07().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"><div align="right">Swift de Remesa :</div>
            </td>
            <td nowrap width="20%">  
            	<input readonly  type="text" name="E02DCMC08" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC08().trim()%>">
				<select disabled="disabled" name="E02DCMF08">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF08().equals("P") || !dcNew2.getE02DCMF08().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF08().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF08().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Gastos Banco Corresponsal :</div>
			</td>
            <td nowrap width="20%">
            	<input readonly  type="text" name="E02DCMC12" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC12().trim()%>">
				<select disabled="disabled" name="E02DCMF12">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF12().equals("P") || !dcNew2.getE02DCMF12().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF12().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF12().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
             	<div align="right">Swift Aviso Aceptacion :</div>
            </td>
            <td nowrap width="20%">  
            	<input readonly  type="text" name="E02DCMC13" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC13().trim()%>">
				<select disabled="disabled" name="E02DCMF13">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF13().equals("P") || !dcNew2.getE02DCMF13().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF13().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF13().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Tracers :</div>
			</td>
            <td nowrap width="20%">
            	<input readonly  type="text" name="E02DCMC14" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC14().trim()%>">
				<select disabled="disabled" name="E02DCMF14">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF14().equals("P") || !dcNew2.getE02DCMF14().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF14().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF14().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
             	<div align="right">
				<DIV align="right">Portes :</DIV>
				</div>
            </td>
            <td nowrap width="20%">  
            	<input readonly  type="text" name="E02DCMC02" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC02().trim()%>">
				<select disabled="disabled" name="E02DCMF02">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF02().equals("P") || !dcNew2.getE02DCMF02().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF02().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF02().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%"><div align="right">Intereses :</div>
			</td>
            <td nowrap width="20%">
            	<input readonly  type="text" name="E02DCMC11" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC11().trim()%>">
				<select disabled="disabled" name="E02DCMF11">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF11().equals("P") || !dcNew2.getE02DCMF11().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF11().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF11().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
             	<div align="right">
				<DIV align="right">Swift Aviso de Pago:</DIV></div>
            </td>
            <td nowrap width="20%">  
            	<input readonly  type="text" name="E02DCMC09" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC09().trim()%>">
				<select disabled="disabled" name="E02DCMF09">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF09().equals("P") || !dcNew2.getE02DCMF09().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF09().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF09().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
			</td>
			<td nowrap width="30%">
             	<div align="right">Enmienda :</div>
			</td>
            <td nowrap width="20%">
            	<input readonly  type="text" name="E02DCMC10" maxlength="13" size="14" value="<%= dcNew2.getE02DCMC10().trim()%>">
				<select disabled="disabled" name="E02DCMF10">
					<OPTION value=" " <% if (!dcNew2.getE02DCMF10().equals("P") || !dcNew2.getE02DCMF10().equals("D")) out.println("selected"); %>></OPTION>
					<OPTION value="P" <% if (dcNew2.getE02DCMF10().equals("P")) out.println("selected"); %>>Principal</OPTION>
					<OPTION value="D" <% if (dcNew2.getE02DCMF10().equals("D")) out.println("selected"); %>>Girado</OPTION>
				</SELECT>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>  

</form>
</body>
</html>
