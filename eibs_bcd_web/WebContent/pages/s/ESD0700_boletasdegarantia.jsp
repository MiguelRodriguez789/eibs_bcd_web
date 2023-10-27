<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>

<html>
<head>
<title>Consulta de Productos para Boletas de Garant&iacute;a</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message" scope="session" />
<jsp:useBean id="lnCodes" class="datapro.eibs.beans.ESD000002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
%>

<h3 align="center">Producto de Boletas de Garant&iacute;a<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="boletasdegarantia.jsp, ESD0700"></h3>
<hr size="4">

<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1"> <INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
<INPUT TYPE="hidden" NAME="H01FLGMAS" >
	
<%int row = 0; %>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" class="tbhead">
			<tr id="trdark">
				<td nowrap width="10%" align="right">Banco:</td>
				<td nowrap width="12%" align="left">
					<input type="text" name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
				</td>
				<td nowrap width="6%" align="right">Producto:</td>
				<td nowrap width="14%" align="left">
					<input type="text" name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
				</td>
				<td nowrap width="8%" align="right">Tipo de Producto :</td>
				<td nowrap width="50%" align="left">
					<input type="text" name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly> - 
					<input type="text" name="E01DSCTYP" size="45" maxlength="45" value="<%= prd.getE01DSCTYP()%>" readonly>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Informaci&oacute;n General</h4>
<table class="tableinfo" >
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
				<div align="right">Descripci&oacute;n :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCDS1" size="50" maxlength="45" value="<%= prd.getE01APCDS1()%>">
				</td>
				<td width="25%">
				<div align="right">Nombre de Mercadeo :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCDS2" size="28" maxlength="25" value="<%= prd.getE01APCDS2()%>">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">C&oacute;digo de Moneda :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>"> <a
					href="javascript:GetCurrency('E01APCCCY','')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a>
				</td>
				<td width="25%">
					<div align="right">Ofrecimiento por :</div>
				</td>
				<td width="25%">
					<SELECT name="E01APCFTT">
						<OPTION value="1"
							<%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet</OPTION>
						<OPTION value="I"
							<%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional</OPTION>
						<OPTION value="L"
							<%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local</OPTION>
						<OPTION value="3"
							<%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma</OPTION>
						<OPTION value="5"
							<%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier
						Medio</OPTION>
						<OPTION value="N"
							<%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No
						Ofrecer</OPTION>
					</SELECT>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
				<div align="right">Cuenta Contable :</div>
				</td>
				<td width="25%"><input type="text" name="E01APCGLN" size="18"
					maxlength="16" value="<%= prd.getE01APCGLN().trim()%>"> <a
					href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></td>
				<td width="25%">
				<div align="right">Tabla Documentos :</div>
				</td>
				<td width="25%"><input type="text" name="E01APCDOC" size="4" maxlength="2"
					value="<%= prd.getE01APCDOC().trim()%>"> <a
					href="javascript:GetDocInv('E01APCDOC')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
					align="bottom" border="0"></a></td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Informaci&oacute;n del Producto</h4>
<table class="tableinfo" >
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<TD align="right" width="25%">
						<DIV align="right">Tabla de Cargos :</DIV>
					</TD>
					<TD width="25%">
						<INPUT type="text" name="E01APCTLN" size="3" maxlength="2" value="<%= prd.getE01APCTLN().trim()%>">
						<a href="javascript:GetLoanChargeTable('E01APCTLN',document.forms[0].E01APCTYP.value)">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
					</TD>
					<td align="right" width="25%"> Forma de Pago :</td>
					<td width="25%">
						<SELECT name="E01APCFL2">
							<OPTION value="1" <%if (prd.getE01APCFL2().equals("1")) { out.print("selected"); }%>>Pago a la Vista</OPTION>
							<OPTION value="2" <%if (prd.getE01APCFL2().equals("2")) { out.print("selected"); }%>>Financiamineto</OPTION>
						</SELECT>
					</td>
				</TR>
				
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<TD width="25%" align="right">
					<DIV align="right">Provisi&oacute;n de Intereses :</DIV>
					</TD>
					<TD width="25%"><INPUT type="text" name="E01APCFRN" size="4"
						maxlength="2" value="<%= prd.getE01APCFRN().trim()%>"> <A
						href="javascript:GetCode('E01APCFRN','STATIC_cc_prov.jsp')"><IMG
						src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
						align="bottom" border="0"></A></TD>
					<TD width="25%" align="right">Tipo de Inter&eacute;s :</TD>
					<TD width="25%"><INPUT type="text" name="E01APCRES" size="4"
						maxlength="2" value="<%= prd.getE01APCRES().trim()%>"><A
						href="javascript:GetCode('E01APCRES','STATIC_tds_typ_int.jsp')"><IMG
						src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
						align="bottom" border="0"></A></TD>
				</TR>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<TD width="25%" align="right">
					<DIV align="right">Base C&aacute;lculo Anual :</DIV>
					</TD>
					<TD width="25%"><INPUT type="text" name="E01APCROY" size="4"
						maxlength="3" value="<%= prd.getE01APCROY().trim()%>"></TD>
					<TD width="25%" align="right">
					<DIV align="right">Comisiones por Cuenta de :</DIV>
					</TD>
					<TD width="25%"><SELECT name="E01APCITP">
						<OPTION value="B"
							<%if (prd.getE01APCITP().equals("B")) { out.print("selected"); }%>>Beneficiario</OPTION>
						<OPTION value="A"
							<%if (prd.getE01APCITP().equals("A")) { out.print("selected"); }%>>Aplicante</OPTION>
					</SELECT></TD>
				</TR>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<TD width="25%" align="right">
					<DIV align="right">Garantia Efectiva :</DIV>
					</TD>
					<TD width="25%">
						<INPUT type="radio" name="E01APCICT" value="Y" <%if (!prd.getE01APCICT().equals("N")) out.print("checked"); %>> Si 
						<INPUT type="radio" name="E01APCICT" value="N" <%if (prd.getE01APCICT().equals("N")) out.print("checked"); %>> 	No
					</TD>
				<TD width="25%" align="right">
				<div align="right">Tipo de Cliente :</div>
				</td>
				<TD width="25%">
				<select name="E01APCFRA">
					<option value=" "
						<%if (prd.getE01APCFRA().equals(" ")) { out.print("selected"); }%>>Cualquiera</option>
					<option value="0"
						<%if (prd.getE01APCFRA().equals("0")) { out.print("selected"); }%>>Socios</option>
					<option value="1"
						<%if (prd.getE01APCFRA().equals("1")) { out.print("selected"); }%>>Empresa</option>
					<option value="2"
						<%if (prd.getE01APCFRA().equals("2")) { out.print("selected"); }%>>Persona</option>
					<option value="3"
						<%if (prd.getE01APCFRA().equals("3")) { out.print("selected"); }%>>Menor
					de Edad</option>
				</select>
				</td>
		</TABLE>
		</td>
	</tr>
</table>  

<h4>Impuestos </h4>
<table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" > 
              <div align="center"> </div>
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
              
			  </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
        </tr>        
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E01APCTX1" name="E01APCTX1" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX1().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX1().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%"  > 
              <div align="center"> 
				<select id="E01APCTX2" name="E01APCTX2" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX2().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX2().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
				<select id="E01APCTX3" name="E01APCTX3" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX3().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX3().equals("0")) out.print("selected");%>> NO </option>
				</select>        
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
			<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("PA")) || currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("CL"))){ %> 
				<select id="E01APCTX4" name="E01APCTX4" >
				    <option value=" " selected> &nbsp; </option>
				    <option value="1" <% if(prd.getE01APCTX4().equals("1")) out.print("selected");%>> SI </option>
				    <option value="0" <% if(prd.getE01APCTX4().equals("0")) out.print("selected");%>> NO </option>
				</select>                 
			<% } %>				
			</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> </div>
            </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Controles Adicionales</h4>
<table class="tableinfo" >
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<TD width="25%" align="right">
						<DIV align="right">Tipo de Boleta Garantia :</DIV>
					</TD>
					<TD width="25%">
						<SELECT name="E01APCREL">
							<OPTION value=" " <%if (prd.getE01APCREL().equals(" ")) { out.print("selected"); }%>>General </OPTION>
							<OPTION value="1" <%if (prd.getE01APCREL().equals("1")) { out.print("selected"); }%>>Aval Bancario</OPTION>
							<OPTION value="2" <%if (prd.getE01APCREL().equals("2")) { out.print("selected"); }%>>Garant&iacute;a Bancaria</OPTION>
							<OPTION value="3" <%if (prd.getE01APCREL().equals("3")) { out.print("selected"); }%>>Aceptaci&oacute;n Bancaria</OPTION>
						    <OPTION value="4" <%if (prd.getE01APCREL().equals("4")) { out.print("selected"); }%>>Cupo Exigible</OPTION>
						</SELECT>
				
					</TD>
					<td width="25%" align="right"> Utilizacion de la Boleta :</td>
					<td width="25%">
						<SELECT name="E01APCCRF">
	
							<OPTION value=" " <%if (prd.getE01APCCRF().equals(" ")) { out.print("selected"); }%>> </OPTION>
							<OPTION value="1" <%if (prd.getE01APCCRF().equals("1")) { out.print("selected"); }%>>Unica</OPTION>
							<OPTION value="2" <%if (prd.getE01APCCRF().equals("2")) { out.print("selected"); }%>>Multiples</OPTION>
							<OPTION value="3" <%if (prd.getE01APCCRF().equals("3")) { out.print("selected"); }%>>Al Vencimiento</OPTION>
							<OPTION value="N" <%if (prd.getE01APCCRF().equals("N")) { out.print("selected"); }%>>No Permite</OPTION>
						
						</SELECT>
					</td>
				</TR>

				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<TD width="25%" align="right">
						<DIV align="right">Frecuencia Cobro de Cargos :</DIV>
					</TD>
					<TD width="25%">
						<INPUT type="text" name="E01APCRRD" size="4" maxlength="3" value="<%= prd.getE01APCRRD().trim()%>" onkeypress="enterInteger()" onblur="rightAlignCharNumber()">
						<SELECT name="E01APCFL1">
							<OPTION value=" " <%if (prd.getE01APCFL1().equals(" ")) { out.print("selected"); }%>> </OPTION>
							<OPTION value="D" <%if (prd.getE01APCFL1().equals("D")) { out.print("selected"); }%>>Dia</OPTION>
							<OPTION value="M" <%if (prd.getE01APCFL1().equals("M")) { out.print("selected"); }%>>Meses</OPTION>
							<OPTION value="Y" <%if (prd.getE01APCFL1().equals("Y")) { out.print("selected"); }%>>Años</OPTION>
						</SELECT>
				
					</TD>
					<TD width="25%" align="right">
					<DIV align="right">Permite Renovaciones :</DIV>
					</TD>
					<TD width="25%">
						<INPUT type="radio" name="E01APCFL4" value="Y" <%if (!prd.getE01APCFL4().equals("N")) out.print("checked"); %>> Si 
						<INPUT type="radio" name="E01APCFL4" value="N" <%if (prd.getE01APCFL4().equals("N")) out.print("checked"); %>> No
					</TD>
				</TR>
	
		</TABLE>
		</td>
	</tr>
</table>

<div align="center"><input id="EIBSBTN" type=Submit name="Submit" value="Enviar"></div>


</form>
</body>
</html>
