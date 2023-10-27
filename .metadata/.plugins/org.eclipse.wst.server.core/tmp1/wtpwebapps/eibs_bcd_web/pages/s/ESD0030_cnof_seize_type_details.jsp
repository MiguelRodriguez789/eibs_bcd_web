<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<SCRIPT Language="javascript">
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>

</head>
<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<body>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
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

<H3 align="center">C&oacute;digos de Referencia del Sistema - Conceptos de Embargo<img src="<%=request.getContextPath()%>/images/e_ibs.gif"
	align="left" name="EIBS_GIF"
	title="cnof_seize_type_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">

<%int row = 0; %>

<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%">
					<div align="right">Clasificaci&oacute;n :</div>
				</td>
				<td nowrap>
					<div align="left"><input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>"></div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">C&oacute;digo :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
					<input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>">
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Prioridad de Embargo :</div>
	            </td>
	            <td nowrap height="19"> 
					<input type="text" name="E02CNOF01" size="2" maxlength="1" value="<%= refCodes.getE02CNOF01().trim()%>" onkeypress="enterInteger()">

	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Cobro de Cargo Banco Agrario :</div>
	            </td>
	            <td nowrap height="19"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOTCF" value="Y" <%if (refCodes.getE02CNOTCF().equals("Y")) out.print("checked"); %> />
	                Sí 
	                <input type="radio" name="E02CNOTCF" value="N" <%if (!refCodes.getE02CNOTCF().equals("Y")) out.print("checked"); %> />
	                No
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Tipo de Bloqueo Cuenta Embargada :</div>
	            </td>
	            <td nowrap height="19">
	            	<input type="hidden" name="E02CNOIVA_S" value="<%=refCodes.getE02CNOIVA() %>" /> 
					<SELECT name="E02CNOIVA" >
						<OPTION value=""  <%if(refCodes.getE02CNOIVA().trim().equals("")){%> Selected <%}%>>No Aplica</OPTION>
						<OPTION value="D" <%if(refCodes.getE02CNOIVA().trim().equals("D")){%> Selected <%}%>>Bloquea Debitos</OPTION>
						<OPTION value="C" <%if(refCodes.getE02CNOIVA().trim().equals("C")){%> Selected <%}%>>Bloquea Creditos</OPTION>
						<OPTION value="B" <%if(refCodes.getE02CNOIVA().trim().equals("B")){%> Selected <%}%>>Bloquea Ambos</OPTION>
					</SELECT>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Motivo de Bloqueo de Cliente :</div>
	            </td>
	            <td nowrap height="19">
	            	<input type="text" name="E02CNOUS3" value="<%=refCodes.getE02CNOUS3() %>" size="5" maxlength="4"/> 
					<a href="javascript:GetCodeCNOFC('E02CNOUS3','FM')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>	            	
	            </td>
	          </tr>
	          
			<!--

			<tr id="trclear">
				<td nowrap width="30%" height="19">
					<div align="center"><b>Tipos de Embargo por Módulo</b></div>
				</td>
				<td nowrap height="19">
					<div align="right"> </div>
				</td>
			</tr>
			
			
			<tr id="trdark">
				<td nowrap width="30%" height="19">
					<div align="right">Cheques de Gerencia :</div>
				</td>
				<td nowrap height="19">
					<SELECT name="E02CNOF04">
						<OPTION value=""  <%if(refCodes.getE02CNOF04().trim().equals("")){%> Selected <%}%>> </OPTION>
						<OPTION value="T" <%if(refCodes.getE02CNOF04().trim().equals("T")){%> Selected <%}%>>Embargo por Monto Total</OPTION>
						<OPTION value="P" <%if(refCodes.getE02CNOF04().trim().equals("P")){%> Selected <%}%>>Embargo por Monto Parcial</OPTION>
						<OPTION value="N" <%if(refCodes.getE02CNOF04().trim().equals("N")){%> Selected <%}%>>No Aplica Embargo</OPTION>
					</SELECT>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%" height="19">
					<div align="right">Cuentas de Ahorro :</div>
				</td>
				<td nowrap height="19">
					<SELECT name="E02CNOADI">
						<OPTION value=""  <%if(refCodes.getE02CNOADI().trim().equals("")){%> Selected <%}%>> </OPTION>
						<OPTION value="T" <%if(refCodes.getE02CNOADI().trim().equals("T")){%> Selected <%}%>>Embargo por Monto Total</OPTION>
						<OPTION value="P" <%if(refCodes.getE02CNOADI().trim().equals("P")){%> Selected <%}%>>Embargo por Monto Parcial</OPTION>
						<OPTION value="N" <%if(refCodes.getE02CNOADI().trim().equals("N")){%> Selected <%}%>>No Aplica Embargo</OPTION>
					</SELECT>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%" height="19">
					<div align="right">Cuentas Corrientes :</div>
				</td>
				<td nowrap height="19">
					<SELECT name="E02CNODCB">
						<OPTION value=""  <%if(refCodes.getE02CNODCB().trim().equals("")){%> Selected <%}%>> </OPTION>
						<OPTION value="T" <%if(refCodes.getE02CNODCB().trim().equals("T")){%> Selected <%}%>>Embargo por Monto Total</OPTION>
						<OPTION value="P" <%if(refCodes.getE02CNODCB().trim().equals("P")){%> Selected <%}%>>Embargo por Monto Parcial</OPTION>
						<OPTION value="N" <%if(refCodes.getE02CNODCB().trim().equals("N")){%> Selected <%}%>>No Aplica Embargo</OPTION>
					</SELECT>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%" height="19">
					<div align="right">Depósitos a Plazo :</div>
				</td>
				<td nowrap height="19">
					<SELECT name="E02CNOPAF">
						<OPTION value=""  <%if(refCodes.getE02CNOPAF().trim().equals("")){%> Selected <%}%>> </OPTION>
						<OPTION value="T" <%if(refCodes.getE02CNOPAF().trim().equals("T")){%> Selected <%}%>>Embargo por Monto Total</OPTION>
						<OPTION value="P" <%if(refCodes.getE02CNOPAF().trim().equals("P")){%> Selected <%}%>>Embargo por Monto Parcial</OPTION>
						<OPTION value="N" <%if(refCodes.getE02CNOPAF().trim().equals("N")){%> Selected <%}%>>No Aplica Embargo</OPTION>
					</SELECT>
				</td>
			</tr>



	        
	        
	        <tr id="trdark"> 
				<td nowrap width="30%" height="19">
					<div align="center"><b>Protección de Montos por Producto</b></div>
				</td>
				<td nowrap height="19">
					<div align="right"> </div>
				</td>
			</tr>
	        <tr id="trclear"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Cuentas de Ahorro :</div>
	            </td>
	            <td nowrap height="19"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOCPF" value="Y" <%if (refCodes.getE02CNOCPF().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOCPF" value="N" <%if (refCodes.getE02CNOCPF().equals("N")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>
	        <tr id="trdark"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Cuentas Corrientes :</div>
	            </td>
	            <td nowrap height="19"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOTCF" value="Y" <%if (refCodes.getE02CNOTCF().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOTCF" value="N" <%if (refCodes.getE02CNOTCF().equals("N")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>

	        <tr id="trclear"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Monto Inembargable :</div>
	            </td>
	            <td nowrap height="19"> 
					<input type="text" name="E02CNOCHG" size="17" maxlength="15" value="<%= refCodes.getE02CNOCHG().trim()%>" onkeypress="enterDecimal()">

	            </td>
	          </tr>

	        <tr id="trdark"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Estado de Cuenta Embargada :</div>
	            </td>
	            <td nowrap height="19"> 
					<SELECT name="E02CNOIVA">
						<OPTION value=""  <%if(refCodes.getE02CNOIVA().trim().equals("")){%> Selected <%}%>>No Aplica</OPTION>
						<OPTION value="A" <%if(refCodes.getE02CNOIVA().trim().equals("A")){%> Selected <%}%>>Activa</OPTION>
						<OPTION value="T" <%if(refCodes.getE02CNOIVA().trim().equals("T")){%> Selected <%}%>>Solo Permite Depositos</OPTION>
						<OPTION value="D" <%if(refCodes.getE02CNOIVA().trim().equals("D")){%> Selected <%}%>>Bloquea Debitos</OPTION>
						<OPTION value="C" <%if(refCodes.getE02CNOIVA().trim().equals("C")){%> Selected <%}%>>Bloquea Creditos</OPTION>
						<OPTION value="B" <%if(refCodes.getE02CNOIVA().trim().equals("B")){%> Selected <%}%>>Bloquea Ambos</OPTION>
					</SELECT>
	            </td>
	          </tr>

	        <tr id="trdark"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Tipo de Persona para Monto Protegido :</div>
	            </td>
	            <td nowrap height="19"> 
					<SELECT name="E02CNODCC">
						<OPTION value=""  <%if(refCodes.getE02CNODCC().trim().equals("")){%> Selected <%}%>> No Aplica</OPTION>
						<OPTION value="N" <%if(refCodes.getE02CNODCC().trim().equals("N")){%> Selected <%}%>>Natural</OPTION>
						<OPTION value="J" <%if(refCodes.getE02CNODCC().trim().equals("J")){%> Selected <%}%>>Juridica</OPTION>
						<OPTION value="A" <%if(refCodes.getE02CNODCC().trim().equals("A")){%> Selected <%}%>>Ambas</OPTION>
					</SELECT>

	            </td>
	          </tr>

	        -->

		</table>
		</td>
	</tr>
</table>

   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  

</form>
</body>
</html>
