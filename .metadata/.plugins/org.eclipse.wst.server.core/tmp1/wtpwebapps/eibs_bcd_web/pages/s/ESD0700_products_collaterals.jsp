<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Mantenimiento Productos de Garantías</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="prd" class="datapro.eibs.beans.ESD070001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
	
<SCRIPT type="text/javascript">
function goRetrFld() {
	var type = "<%=prd.getE01APCTYP().trim()%>"    
	var product = "<%=prd.getE01APCCDE().trim()%>"    
	var opecod = "0005"    
   	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0070?SCREEN=102&E01TBLTYP="+type+"&E01TBLCDE="+product+"&OPECOD="+opecod;
   	CenterNamedWindow(page, 'Information', 950, 500, 2);
}
</SCRIPT>


<body>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
%>

<h3 align="center">Mantenimiento Producto Garantías <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="products_collaterals.jsp, ESD0700"></h3>
<hr size="4">

<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0700">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1"> 
<INPUT TYPE=HIDDEN NAME="E01APCACD" VALUE="<%= prd.getE01APCACD()%>">
<INPUT TYPE="hidden" NAME="H01FLGMAS" >

<%int row = 0; %>	
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" class="tbhead"
			align="center">
			<tr>
				<td nowrap width="10%" align="right">Banco:</td>
				<td nowrap width="12%" align="left">
					<input type="text" 	name="E01APCBNK" size="3" maxlength="2" value="<%= prd.getE01APCBNK()%>" readonly>
				</td>
				<td nowrap width="6%" align="right">Producto :</td>
				<td nowrap width="14%" align="left">
					<input type="text" name="E01APCCDE" size="6" maxlength="4" value="<%= prd.getE01APCCDE()%>" readonly>
				</td>
				<td nowrap width="8%" align="right">Tipo Producto :</td>
				<td nowrap width="50%" align="left">
					<input type="text" name="E01APCTYP" size="6" maxlength="4" value="<%= prd.getE01APCTYP()%>" readonly> 
						-
					<input type="text" name="E01DSCTYP" size="25" maxlength="25" value="<%= prd.getE01DSCTYP()%>" readonly>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<h4>Información General</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td>
				<div align="right">Descripción :</div>				</td>
				<td>
					<input type="text" name="E01APCDS1" size="50" maxlength="45" value="<%= prd.getE01APCDS1()%>">				</td>
				<td>
				<div align="right">Nombre de Mercadeo :</div>				</td>
				<td>
					<input type="text" name="E01APCDS2" size="28" maxlength="25" value="<%= prd.getE01APCDS2()%>">				</td>
			</tr>
			<tr id="trclear">
				<td>
				<div align="right">Código de Moneda :</div>				</td>
				<td>
					<input type="text" name="E01APCCCY" size="3" maxlength="3" value="<%= prd.getE01APCCCY()%>"> 
					<a href="javascript:GetCurrency('E01APCCCY','')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">					</a>				</td>
				<td>
					<div align="right">Ofrecimiento por :</div>				</td>
				<td>
					<SELECT name="E01APCFTT">
						<OPTION value="1" <%if (prd.getE01APCFTT().equals("1")) { out.print("selected"); }%>>Internet</OPTION>
						<OPTION value="I" <%if (prd.getE01APCFTT().equals("I")) { out.print("selected"); }%>>Internacional</OPTION>
						<OPTION value="L" <%if (prd.getE01APCFTT().equals("L")) { out.print("selected"); }%>>Local</OPTION>
						<OPTION value="3" <%if (prd.getE01APCFTT().equals("3")) { out.print("selected"); }%>>Plataforma</OPTION>
						<OPTION value="5" <%if (prd.getE01APCFTT().equals("5")) { out.print("selected"); }%>>Cualquier Medio</OPTION>
						<OPTION value="N" <%if (prd.getE01APCFTT().equals("N")) { out.print("selected"); }%>>No Ofrecer</OPTION>
					</SELECT>
				<td></td>
			</tr>
			<tr id="trdark">
				<td>
				<div align="right">Cuenta Contable :</div>				</td>
				<td>
					<input type="text" name="E01APCGLN" size="17" maxlength="16" value="<%= prd.getE01APCGLN().trim()%>"> 
					<a href="javascript:GetLedger('E01APCGLN',document.forms[0].E01APCBNK.value,document.forms[0].E01APCCCY.value,document.forms[0].E01APCACD.value,'','<%= prd.getE01APCTYP().trim()%>')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">					</a>				</td>
				<td>
					<div align="right">Tabla de Documentos :</div>				</td>
				<td>
					<INPUT type="text" name="E01APCDOC" size="4" maxlength="2" value="<%= prd.getE01APCDOC().trim()%>"> 
					<a href="javascript:GetDocInv('E01APCDOC')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">					</a>				</td>
			</tr>
			<tr id="trclear">
				<td>
					<div align="right">Tipo de Cliente :</div>				</td>
				<td>
					<select name="E01APCFL4">
						<option value=""  <%if (prd.getE01APCFL4().equals(""))   { out.print("selected"); }%>>Cualquiera</option>
						<option value="1" <%if (prd.getE01APCFL4().equals("1")) { out.print("selected"); }%>>Empresa</option>
						<option value="2" <%if (prd.getE01APCFL4().equals("2")) { out.print("selected"); }%>>Persona</option>
					</select>				</td>
				<td>
				<div align="right">Tipo de Garantía :</div>				</td>
				<td width="330">
					<input type="text" name="E01APCFRA" size="2" maxlength="1" value="<%= prd.getE01APCFRA().trim()%>">
					<a href="javascript:GetCodeCNOFC('E01APCFRA','05')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>				</td>
			</tr>
			<tr id="trdark">
				<td>
					<div align="right">Garantía/Fuente de Pago :</div>				</td>
				<td>
					<select name="E01APCCRF">
						<option value=" " <%if (prd.getE01APCCRF().equals(" ")) { out.print("selected"); }%>> </option>
						<option value="G" <%if (prd.getE01APCCRF().equals("G")) { out.print("selected"); }%>>Garantía</option>
						<option value="F" <%if (prd.getE01APCCRF().equals("F")) { out.print("selected"); }%>>Fuente de Pago</option>
					</select>				</td>
				<td>
					<div align="right">Con Tenencia :</div>				</td>
				<td>
            	    <input type="hidden" name="E01APCTX1" value="<%=prd.getE01APCTX1()%>">
                	<input type="radio" name="CE01APCTX1" value="S" onClick="document.forms[0].E01APCTX1.value='S'" <%if (prd.getE01APCTX1().equals("S")) out.print("checked");%>>
              		  Si 
                	<input type="radio" name="CE01APCTX1" value="N" onClick="document.forms[0].E01APCTX1.value='N'" <%if (prd.getE01APCTX1().equals("N")) out.print("checked");%>>
                	No				</td>
			 </tr>
			<tr id="trclear">
				<td>
				<div align="right">Requiere Seguro :</div>				</td>
				<td>
            	    <input type="hidden" name="E01APCFL1" value="<%=prd.getE01APCFL1()%>">
                	<input type="radio" name="CE01APCFL1" value="Y" onClick="document.forms[0].E01APCFL1.value='S'" <%if (prd.getE01APCFL1().equals("S")) out.print("checked");%>>
              		  Si 
                	<input type="radio" name="CE01APCFL1" value="N" onClick="document.forms[0].E01APCFL1.value='N'" <%if (prd.getE01APCFL1().equals("N")) out.print("checked");%>>
                	No				</td>
				<td>
					<div align="right">Abierta/Cerrada :</div>				</td>
				<td>
                	<input type="hidden" name="E01APCTX2" value="<%=prd.getE01APCTX2()%>">
                	<input type="radio" name="CE01APCTX2" value="A" onClick="document.forms[0].E01APCTX2.value='A'" <%if (prd.getE01APCTX2().equals("A")) out.print("checked");%>>
          		      Abierta 
                	<input type="radio" name="CE01APCTX2" value="C" onClick="document.forms[0].E01APCTX2.value='C'" <%if (prd.getE01APCTX2().equals("C")) out.print("checked");%>>
                	  Cerrada
                	<input type="radio" name="CE01APCTX2" value="" onClick="document.forms[0].E01APCTX2.value=' '" <%if (prd.getE01APCTX2().equals("")) out.print("checked");%>>
                	  Especificar en la Garantía				</td>
			 </tr>
			<tr id="trdark">
				<td>
				<div align="right">Requiere Avaluo:</div>				</td>
				<td>
            	    <input type="hidden" name="E01APCFL2" value="<%=prd.getE01APCFL2()%>">
                	<input type="radio" name="CE01APCFL2" value="Y" onClick="document.forms[0].E01APCFL2.value='S'" <%if (prd.getE01APCFL2().equals("S")) out.print("checked");%>>
              		  Si 
                	<input type="radio" name="CE01APCFL2" value="N" onClick="document.forms[0].E01APCFL2.value='N'" <%if (prd.getE01APCFL2().equals("N")) out.print("checked");%>>
                	No				</td>
				<td><div align="right">Porcentaje PDI :</div>				</td>
				<td>
				<eibsinput:text	name="prd" property="E01APAPPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />				</td>
			 </tr>			 
			<tr id="trclear">
				<td>
				<div align="right">Idoneidad :</div>				</td>
				<td>
            	    <input type="hidden" name="E01APCTX3" value="<%=prd.getE01APCTX3()%>">
                	<input type="radio" name="CE01APCTX3" value="Y" onClick="document.forms[0].E01APCTX3.value='Y'" <%if (prd.getE01APCTX3().equals("Y")) out.print("checked");%>>
              		  Si 
                	<input type="radio" name="CE01APCTX3" value="N" onClick="document.forms[0].E01APCTX3.value='N'" <%if (prd.getE01APCTX3().equals("N")) out.print("checked");%>>
                	No
                	<input type="radio" name="CE01APCTX3" value="" onClick="document.forms[0].E01APCTX3.value=' '" <%if (prd.getE01APCTX3().equals("")) out.print("checked");%>>
                	Especificar en la Garantía				</td>
				<td>
					<div align="right">Admisible :</div>				</td>
				<td>
                	<input type="hidden" name="E01APCTX4" value="<%=prd.getE01APCTX4()%>">
                	<input type="radio" name="CE01APCTX4" value="Y" onClick="document.forms[0].E01APCTX4.value='Y'" <%if (prd.getE01APCTX4().equals("Y")) out.print("checked");%>>
          		      Si 
                	<input type="radio" name="CE01APCTX4" value="N" onClick="document.forms[0].E01APCTX4.value='N'" <%if (prd.getE01APCTX4().equals("N")) out.print("checked");%>>
                	  No
                	<input type="radio" name="CE01APCTX4" value="" onClick="document.forms[0].E01APCTX4.value=' '" <%if (prd.getE01APCTX4().equals("")) out.print("checked");%>>
                	Especificar en la Garantía				</td>
			 </tr>
			 <tr id="trdark">
				<td width="25%" align="right">Permite Clientes Simplificados : </td>
				<td width="25%" >
					<input type="radio" name="E01APCTX9" value="Y" <%if (prd.getE01APCTX9().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01APCTX9" value="N" <%if (prd.getE01APCTX9().equals("N")) out.print("checked"); %>> No				</td>
				<td align="right"><div align="right">Tipo de Garantia SFC :</div>			</td>
			   <td><input type="text" name="E01APAPRD" size="5" maxlength="4" value="<%= prd.getE01APAPRD() %>" >
			    <a href="javascript:GetCodeDescCNOFC('E01APAPRD',' ','K5')" >
			    <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a></td>
			 </tr>	
		</table>
		</td>
	</tr>
</table>

<h4>L&iacute;mites</h4>

<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<%row++;%>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Porcentaje de Cobertura de la Garantía :</div>
				</td>
				<td><INPUT type="text" name="E01APACNV" size="11"
					maxlength="9" value="<%= prd.getE01APACNV().trim()%>"
					onKeyPress="enterDecimal(event, 2)"></td>
				<td>
				<div align="right">Periodicidad de Avalúo :</div>
				</td>
				<td><input type="text" name="E01APCROY" size="4" maxlength="3"
					value="<%= prd.getE01APCROY().trim()%>" onKeyPress="enterInteger(event)">
					<select name="E01APCRCL">
					<option value=""
						<%if (prd.getE01APCRCL().equals("")) { out.print("selected"); }%>>Sin Valorización Automàtica</option>
					<option value="D"
						<%if (prd.getE01APCRCL().equals("D")) { out.print("selected"); }%>>Dias</option>
					<option value="M"
						<%if (prd.getE01APCRCL().equals("M")) { out.print("selected"); }%>>Meses</option>
					<option value="Y"
						<%if (prd.getE01APCRCL().equals("Y")) { out.print("selected"); }%>>A#os</option>
				</select>
<br>Para Garantías Hipotecarias, la periodicidad se asigna en la tabla 'GO'
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td>
				<div align="right">Término de Vencimiento de la Garantía :</div>
				</td>
				<td>
					<INPUT type="text" name="E01APCAM1" size="5" maxlength="5" value="<%= prd.getE01APCAM1().trim()%>" onKeyPress="enterDecimal(event, 2)">
					<select name="E01APCAMC">
					<option value="D"
						<%if (prd.getE01APCAMC().equals("D")) { out.print("selected"); }%>>Dias</option>
					<option value="M"
						<%if (prd.getE01APCAMC().equals("M")) { out.print("selected"); }%>>Meses</option>
					<option value="Y"
						<%if (prd.getE01APCAMC().equals("Y")) { out.print("selected"); }%>>A#os</option>
					</select>
				</td>
				<td>
				<div align="right">Tipo de Garantia Mobiliaria :</div>
				</td>
				<td>
				  <input type="hidden" name="E01APCFL5" value="<%= prd.getE01APCFL5()%>">
                  <input type="radio" name="CE01APCFL5" value="Y" onClick="document.forms[0].E01APCFL5.value='Y'"
			      <%if(prd.getE01APCFL5().equals("Y")) out.print("checked");%>>
                  S&iacute; 
                  <input type="radio" name="CE01APCFL5" value="N" onClick="document.forms[0].E01APCFL5.value='N'"
			      <%if(prd.getE01APCFL5().equals("N")) out.print("checked");%>>
                  No 
                </td>
				
			 </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Monto M&iacute;nimo para Cancelar Garantia :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCAM2" size="21" maxlength="15" value="<%= prd.getE01APCAM2().trim()%>" onKeypress="enterDecimal(event, 2)">
				</td>
				<td width="25%">
					<div align="right">Meses a partir de la Mora para Descontabilizar Garantia :</div>
				</td>
				<td width="25%">
					<input type="text" name="E01APCCC1" size="3" maxlength="2" value="<%= prd.getE01APCCC1().trim()%>" onKeypress="enterDecimal(event, 0)">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<br>

<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trclear">
				<td colspan=4>
				<div align="center"><a href="javascript:goRetrFld()" id="btn19"><b>Definir Campos de Usuario para este Producto</b> </a></div>
				</td>
			 </tr>
		</table>
		</td>
	</tr>
</table>

<br>

<div align="center">
	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
</div>

</form>
</body>
</html>
