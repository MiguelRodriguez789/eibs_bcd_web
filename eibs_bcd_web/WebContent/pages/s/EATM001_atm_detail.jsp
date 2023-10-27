<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<%@ page import = "datapro.eibs.master.Util" %> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.EATM00101Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">


function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	submitForm();
}

 
</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

 	String read = " ";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
	}

out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">ATM<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="atm_detail.jsp, EATM001"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEATM001" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01PARBNK" size="3" maxlength="2" value="<%= msgRcd.getE01PARBNK() %>" readonly>
				</td>
				<td nowrap width=10% align="right">Moneda : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01PARCCY" size="4" maxlength="3" value="<%=msgRcd.getE01PARCCY().trim()%>" readonly>
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cajero</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01PARTID" size="13" maxlength="10" value="<%=msgRcd.getE01PARTID()%>" <%= read%>/>
			  		<% if (userPO.getPurpose().equals("NEW"))  { %>
                    <a href="javascript:GetTlmTeller('E01PARTID','E01TLRBRN','D01TLRBRN','E01TLRBTH')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					<%} %>
				</td>
				<td nowrap width=10% align="right">Oficina :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01TLRBRN" size="5" maxlength="4" value="<%=msgRcd.getE01TLMBRN()%>" readonly />
					<input type="text" name="D01TLRBRN" size="50" maxlength="45" value="<%=msgRcd.getD01TLMBRN()%>" readonly />
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Batch:</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01TLRBTH" size="5" maxlength="4" value="<%=msgRcd.getE01TLMBTH()%>" readonly />
				</td>
				<td nowrap width=10% align="right">Cuenta Contable :</td>
				<td nowrap width=40% align="left">
					<eibsinput:text name="msgRcd" property="E01PARGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                	<a href="javascript:GetLedger('E01PARGLN',document.forms[0].E01PARBNK.value,document.forms[0].E01PARCCY.value,'')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
				</td>
			</TR>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Periodo de Arqueo : </td>
				<td nowrap width=40% align="left">
					<select name="E01PARPER">
						<option value=" " <%if (msgRcd.getE01PARPER().equals(" ")) { out.print("selected");}%>> </option>
						<option value="D" <%if (msgRcd.getE01PARPER().equals("D")) { out.print("selected");}%>>Diario</option>
						<option value="W" <%if (msgRcd.getE01PARPER().equals("W")) { out.print("selected");}%>>Semanal</option>
						<option value="Q" <%if (msgRcd.getE01PARPER().equals("Q")) { out.print("selected");}%>>Quincenal</option>
						<option value="M" <%if (msgRcd.getE01PARPER().equals("M")) { out.print("selected");}%>>Mensual</option>
						<option value="T" <%if (msgRcd.getE01PARPER().equals("T")) { out.print("selected");}%>>Trimestral</option>
						<option value="S" <%if (msgRcd.getE01PARPER().equals("S")) { out.print("selected");}%>>Semestral</option>
						<option value="A" <%if (msgRcd.getE01PARPER().equals("A")) { out.print("selected");}%>>Anual</option>
					</select>
 				</td>
				<td nowrap width=10% align="right">Administracion Efectivo : </td>
				<td nowrap width=40% align="left">
					<select name="E01PARADM">
						<option value=" " <%if (msgRcd.getE01PARADM().equals(" ")) { out.print("selected");}%>> </option>
						<option value="O" <%if (msgRcd.getE01PARADM().equals("O")) { out.print("selected");}%>>Oficina</option>
						<option value="T" <%if (msgRcd.getE01PARADM().equals("T")) { out.print("selected");}%>>Transportadora</option>
					</select>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Fecha Instalacion : </td>
				<td nowrap width=40% align="left">
                    <eibsinput:date name="msgRcd" fn_month="E01PARIMM" fn_day="E01PARIDD" fn_year="E01PARIYY"/>
				</td>
				<td nowrap width=10% align="right">Fecha Desinstalacion : </td>
				<td nowrap width=40% align="left">
                   <eibsinput:date name="msgRcd" fn_month="E01PARUMM" fn_day="E01PARUDD" fn_year="E01PARUYY"/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cantidad Bandejas <br> Dispensar : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01PARDGA" size="5" maxlength="4" value="<%=msgRcd.getE01PARDGA()%>"/>
				</td>
				<td nowrap width=10% align="right">Cantidad Bandejas <br> Purga :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01PARDPU" size="5" maxlength="4" value="<%=msgRcd.getE01PARDPU()%>"/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Estado: </td>
				<td nowrap width=40% align="left">
					<select name="E01PARSTS">
						<option value=" " <%if (msgRcd.getE01PARSTS().equals(" ")) { out.print("selected");}%>> </option>
						<option value="I" <%if (msgRcd.getE01PARSTS().equals("I")) { out.print("selected");}%>>Instalado</option>
						<option value="D" <%if (msgRcd.getE01PARSTS().equals("D")) { out.print("selected");}%>>Desinstalado</option>
						<option value="X" <%if (msgRcd.getE01PARSTS().equals("X")) { out.print("selected");}%>>Inactivo</option>
					</select>
				</td>
				<td nowrap width=10% align="right"></td>
				<td nowrap width=40% align="left">
				</td>
			</tr>

   		</table> 
      </td>  
    </tr>
  </table>

   	
<br>
	
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

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
