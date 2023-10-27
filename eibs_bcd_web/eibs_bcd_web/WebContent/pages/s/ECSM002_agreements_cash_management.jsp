<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Convenios - Motor de Pagos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00202Message"  scope="session"  />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

<% if(userPO.getPurpose().equals("MAINTENANCE")) {%>
	builtNewMenu(csm_m_opt);
 <% } %>


<%int row = 0; %>

<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly =isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>

	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
}
</SCRIPT>


</head>
<body>
	<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
		}
  out.println("<SCRIPT> initMenu(); </SCRIPT>");		
	%>
	<div align="center">
		<h3>
			Convenio Motor de Pagos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="agreements_cash_management.jsp,ECSM002">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="5">

		<table border="0" width="100%">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td width="82%">
					<div align="right">Estado :</div>
				</td>
				<td width="18%">
                  <%if(userPO.getPurpose().equals("NEW")) {%>
               	     <input type="text" readonly name="E02AGRSTS" size="10" maxlength="10" 
					     value="<% if (msgRcd.getE02AGRSTS().equals("A")) out.print("Activo");
								   else if (msgRcd.getE02AGRSTS().equals("B")) out.print("Bloqueado");
								   else if (msgRcd.getE02AGRSTS().equals("C")) out.print("Cancelado");
								   else if (msgRcd.getE02AGRSTS().equals("F")) out.print("Finalizado");
								   else if (msgRcd.getE02AGRSTS().equals("I")) out.print("Inactivo");
								   else if (msgRcd.getE02AGRSTS().equals("X")) out.print("Incompleto");
							       else out.print("");%>">
                  <%}else{%>   

					<select name="E02AGRSTS">
						<option value=" " <%if (msgRcd.getE02AGRSTS().equals(" ")) { out.print("selected");}%>> </option>
						<option value="A" <%if (msgRcd.getE02AGRSTS().equals("A")) { out.print("selected");}%>>Activo</option>
						<option value="B" <%if (msgRcd.getE02AGRSTS().equals("B")) { out.print("selected");}%>>Bloqueado</option>
						<option value="C" <%if (msgRcd.getE02AGRSTS().equals("C")) { out.print("selected");}%>>Cancelado</option>
						<option value="I" <%if (msgRcd.getE02AGRSTS().equals("I")) { out.print("selected");}%>>Inactivo</option>
						<option value="F" <%if (msgRcd.getE02AGRSTS().equals("F")) { out.print("selected");}%>>Finalizado</option>
						<option value="X" <%if (msgRcd.getE02AGRSTS().equals("X")) { out.print("selected");}%>>Incompleto</option>
					</select>
                  <%}%>
				</td>
			</tr>
		</table>
		<BR>
		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%">
								<DIV align="right">Convenio / Descripcion:</DIV>
							</TD>
							<TD nowrap width="25%">
								<INPUT type="text" name="E02AGRNUM" size="12" maxlength="9" value="<%=msgRcd.getE02AGRNUM().trim()%>" readonly>
							 /
							 	<INPUT type="text" name="E02AGRDSC" size="35" maxlength="35" value="<%=msgRcd.getE02AGRDSC()%>"> 
							</TD>
							<td nowrap width="25%" align="right">Fecha de Apertura :</td>
							<TD nowrap width="25%">
								<eibsinput:date name="msgRcd" fn_year="E02AGROYY" fn_month="E02AGROMM" fn_day="E02AGRODD" readonly="true"/>
							</td>
							
						</tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">Cliente : </TD>
							<TD nowrap width="25%">
								<INPUT type="text" name="E02AGRCUN" size="12" maxlength="9" value="<%=msgRcd.getE02AGRCUN().trim()%>" onkeypress="enterInteger(event)"
								<%if (userPO.getPurpose().equals("MAINTENANCE")) { out.print("readonly"); }%>>
								<INPUT type="text" name="D02AGRCUN" size="35" maxlength="35" value="<%=msgRcd.getD02AGRCUN().trim()%>" readonly> <%
 								if (!userPO.getPurpose().equals("MAINTENANCE")) { %>
								<a href="javascript:GetCustomerDescIdNP('E02AGRCUN', 'D02AGRCUN', '')"><%=help%></a> 
								<% } %> 
								<%=mandatory%>
							</TD>
									<TD nowrap width="25%" align="right">Banco / Oficina : </TD>
									<TD nowrap width="25%">
       	        					<input type="text" name="E02AGRBNK" size="2" value="<%= msgRcd.getE02AGRBNK().trim()%>" readonly> / 
              						<input type="text" name="E02AGRBRN" id="E02AGRBRN" size="5" maxlength="4" value="<%= msgRcd.getE02AGRBRN().trim()%>">
             						 <a href="javascript:GetBranch('E02AGRBRN','D02AGRBRN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a>
 						</tr>
				          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="25%" align="right">Oficial de Cuenta :</td>
							<TD nowrap width="25%">
								<eibsinput:cnofc name="E02AGROFC" property="E02AGROFC" value="<%=msgRcd.getE02AGROFC()%>" required="true" flag="15" fn_code="E02AGROFC" fn_description="D02AGROFC" readonly="<%=isReadOnly %>"/>
       	        				<input type="text" name="D02AGROFC" size="20" value="<%= msgRcd.getD02AGROFC().trim()%>" readonly>
							</td>
							<td nowrap width="25%">
								<div align="right">Tipos de convenio :</div>
							</td>
							<td nowrap width="25%">
								<select name="E02AGRTIC">
									<option value=" " <%if (msgRcd.getE02AGRTIC().equals(" ")) { out.print("selected");}%>> </option>
									<option value="S" <%if (msgRcd.getE02AGRTIC().equals("S")) { out.print("selected");}%>>Estandar</option>
									<option value="E" <%if (msgRcd.getE02AGRTIC().equals("E")) { out.print("selected");}%>>Especial</option>
									<option value="I" <%if (msgRcd.getE02AGRTIC().equals("I")) { out.print("selected");}%>>Simple</option>
								</select>
							</td>
						</tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="25%" align="right">Fecha de Inicio :</td>
							<TD nowrap width="25%">
								<eibsinput:date name="msgRcd" fn_year="E02AGRBYY" fn_month="E02AGRBMM" fn_day="E02AGRBDD" />
							</td>
							<td nowrap width="25%" align="right">Fecha de Final :</td>
							<TD nowrap width="25%">
								<eibsinput:date name="msgRcd" fn_year="E02AGREYY" fn_month="E02AGREMM" fn_day="E02AGREDD" />
							</td>
						</tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="25%">
								<div align="right">Reciprocidad Pactada :</div>
							</td>
							<TD nowrap width="25%">
								<div align="left">
									<select name="E02AGRREP">
										<option value=" " <%if (msgRcd.getE02AGRREP().equals(" ")) { out.print("selected");}%>> </option>
										<option value="Y" <%if (msgRcd.getE02AGRREP().equals("Y")) { out.print("selected");}%>>Si</option>
										<option value="N" <%if (msgRcd.getE02AGRREP().equals("N")) { out.print("selected");}%>>No</option>
									</select>
								</div>
							</td>
							<td nowrap width="25%">
								<div align="right">Tipo de Productos Reciprocidad :</div>
							</td>
							<TD nowrap width="25%">
								<div align="left">
										<INPUT type="checkbox" name="E02AGRRDT" value="Y" <%if (msgRcd.getE02AGRRDT().equals("Y")) out.print("checked");%>>CDT 
										<INPUT type="checkbox" name="E02AGRRAH" value="Y" <%if (msgRcd.getE02AGRRAH().equals("Y")) out.print("checked");%>>Cuenta/Ahorro 
										<INPUT type="checkbox" name="E02AGRRCT" value="Y" <%if (msgRcd.getE02AGRRCT().equals("Y")) out.print("checked");%>>Cuenta/corriente 
								</div>
							</td>

						</tr>
         				 <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="25%">
								<div align="right">Tipos de Servicio :</div>
							</td>
							<td nowrap width="25%">
								<INPUT type="checkbox" name="E02AGRTSR" value="Y" <%if (msgRcd.getE02AGRTSR().equals("Y")) out.print("checked");%>>Recaudo 
								<INPUT type="checkbox" name="E02AGRTSP" value="Y" <%if (msgRcd.getE02AGRTSP().equals("Y")) out.print("checked");%>>Disp/Proveedores
								<br> 
								<INPUT type="checkbox" name="E02AGRTSN" value="Y" <%if (msgRcd.getE02AGRTSN().equals("Y")) out.print("checked");%>>Disp/Nomina
								<INPUT type="checkbox" name="E02AGRTSA" value="Y" <%if (msgRcd.getE02AGRTSA().equals("Y")) out.print("checked");%>>Disp/Ahorro
							</td>
							<td nowrap width="25%"><div align="right">Lote :</div></td>
							<td nowrap width="25%">
								<INPUT type="text" name="E02AGRBTH" size="6" maxlength="5" value="<%=msgRcd.getE02AGRBTH().trim()%>">
							</td>
						</tr>
				          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<td nowrap width="25%" align="right">Codigo EAN :</td>
							<TD nowrap width="25%">
							 	<INPUT type="text" name="E02AGREAN" size="18" maxlength="18" value="<%=msgRcd.getE02AGREAN()%>"> 
							</td>
							<td nowrap width="25%">
								<div align="right">Tipo de EAN :</div>
							</td>
							<td nowrap width="25%">
								<eibsinput:cnofc name="E02AGRTEA" property="E02AGRTEA" value="<%=msgRcd.getE02AGRTEA()%>" required="false" flag="BC" fn_code="E02AGRTEA" fn_description=" " readonly="<%=isReadOnly %>"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(1);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	

		
	</form>
	
</body>
</html>
