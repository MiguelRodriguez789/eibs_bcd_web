<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"
	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"
	scope="session" />

<body>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
   
    
%>


<H3 align="center">C&oacute;digos de Referencia del Sistema -Tipos de
Papel Valor<img src="<%=request.getContextPath()%>/images/e_ibs.gif"
	align="left" name="EIBS_GIF"
	title="cnof_papel_valor_type_detail.jsp, ESD0030"></H3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> <INPUT TYPE=HIDDEN
	NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
	
<%int row = 0; %>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%">
				<div align="right">Clasificaci&oacute;n :</div>
				</td>
				<td nowrap>
				<div align="left">
					<input type="text" name="E02CNOCFL" readonly size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>">
				</div>
				</td>
			</tr>
			
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="23">
				<div align="right">C&oacute;digo :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>"> 
				</div>
				</td>
			</tr>
			
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="23">
				<div align="right">Descripci&oacute;n :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>">
				</div>
				</td>
			</tr>
			
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">Control Papel Valor :</div>
				</td>
				<td nowrap height="19">
				<div align="left"><SELECT name="E02CNOF03">
					<OPTION value=""  <%if(refCodes.getE02CNOF03().trim().equals("")){%> Selected <%}%>> </OPTION>
					<OPTION value="1" <%if(refCodes.getE02CNOF03().trim().equals("1")){%> Selected <%}%>>Papel Valor </OPTION>
					<OPTION value="2" <%if(refCodes.getE02CNOF03().trim().equals("2")){%> Selected <%}%>>Compra / Venta </OPTION>
					<OPTION value="3" <%if(refCodes.getE02CNOF03().trim().equals("3")){%> Selected <%}%>>Ambos </OPTION>
				</SELECT></div>
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">Operación Permitida ::</div>
				</td>
				<td nowrap height="19">
				<div align="left"><a href="javascript:GetCurrency('E02CNOSCY','')"></a>
				<SELECT name="E02CNOF04">
					<OPTION value=""  <%if(refCodes.getE02CNOF04().trim().equals("")){%> Selected <%}%>> </OPTION>
					<OPTION value="S" <%if(refCodes.getE02CNOF04().trim().equals("S")){%> Selected <%}%>>Ventas</OPTION>
					<OPTION value="P" <%if(refCodes.getE02CNOF04().trim().equals("P")){%> Selected <%}%>>Compras</OPTION>
					<OPTION value="B" <%if(refCodes.getE02CNOF04().trim().equals("B")){%> Selected <%}%>>Ambos</OPTION>
					<OPTION value="I" <%if(refCodes.getE02CNOF04().trim().equals("I")){%> Selected <%}%>>Ingresos</OPTION>
				</SELECT></div>
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">Tipo de Instrumento :</div>
				</td>
				<td nowrap height="19">
				<div align="left"><SELECT name="E02CNOIVA">
					<OPTION value=""  <%if(refCodes.getE02CNOIVA().trim().equals("")){%> Selected <%}%>> </OPTION>
					<OPTION value="1"  <%if(refCodes.getE02CNOIVA().trim().equals("1")){%> Selected <%}%>>Efectivo</OPTION>
					<OPTION value="2" <%if(refCodes.getE02CNOIVA().trim().equals("2")){%> Selected <%}%>>Cheques Moneda Extranjera</OPTION>
					<OPTION value="3" <%if(refCodes.getE02CNOIVA().trim().equals("3")){%> Selected <%}%>>Transferencias</OPTION>
					<OPTION value="4" <%if(refCodes.getE02CNOIVA().trim().equals("4")){%> Selected <%}%>>Remesa y Cobranzas</OPTION>
					<OPTION value="5" <%if(refCodes.getE02CNOIVA().trim().equals("5")){%> Selected <%}%>>Cheques Viajeros</OPTION>
				</SELECT></div>
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">Nemónico DB. Cliente :</div>
				</td>
				<td nowrap height="19">
				<div align="left"><input type="text" name="E02CNODCC" size="3"
					maxlength="2" value="<%= refCodes.getE02CNODCC().trim()%>"> <a
					href="javascript:GetCodeCNOFC('E02CNODCC','20')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
					align="bottom" border="0"></a></div>
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">Nemónico CR. Cliente :</div>
				</td>
				<td nowrap height="19">
				<div align="left"><input type="text" name="E02CNOACD" size="3"
					maxlength="2" value="<%= refCodes.getE02CNOACD().trim()%>">
                  <a href="javascript:GetCodeCNOFC('E02CNOACD','20')"><img
					src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda"
					align="bottom" border="0"></a></div>
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">Nombre del Formulario :</div>
				</td>
				<td nowrap height="19">
				<div align="left"><input type="text" name="E02CNOEML" size="41"
					maxlength="40" value="<%= refCodes.getE02CNOEML().trim()%>"></div>
				</td>
			</tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap width="30%" height="19">
				<div align="right">Nombre Impresora Serial :</div>
				</td>
				<td nowrap height="19">
				<div align="left"><input type="text" name="E02CNORUT" size="16"
					maxlength="15" value="<%= refCodes.getE02CNORUT().trim()%>"></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<div align="center"><input id="EIBSBTN" type=submit name="Submit"
	value="Enviar"></div>
</form>
</body>
</html>
