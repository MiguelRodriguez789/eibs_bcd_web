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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001702Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

builtNewMenu(eca_m_opt);

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 9) {
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

<h3 align="center">Corresponsales - Sucursales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="corresponsales_detail.jsp, ECA0017"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0017" >

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
					<input type="text" name="E02CODBNK" size="3" maxlength="2" value="<%= msgRcd.getE02CODBNK() %>" readonly>
				</td>
				<td nowrap width=10% align="right">Cliente : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODCUN" size="10" maxlength="9" value="<%=userPO.getCusNum().trim()%>" readonly>
                    <input type="text" name="D02CODCUN" size="60" maxlength="60" value="<%= msgRcd.getD02CODCUN() %>" readonly>
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Sucursal :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODOFC" size="4" maxlength="4" value="<%=msgRcd.getE02CODOFC()%>" />
				</td>
				<td nowrap width=10% align="right">Linea de Credito :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODLNE" size="4" maxlength="4" value="<%=msgRcd.getE02CODLNE()%>" />
                    <a href="javascript:GetCreditLine('E02CODLNE',document.forms[0].E02CODCUN.value)">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Estado: </td>
				<td nowrap width=40% align="left">
					<select name="E02CODSTS">
						<option value=" " <%if (msgRcd.getE02CODSTS().equals(" ")) { out.print("selected");}%>> </option>
						<option value="A" <%if (msgRcd.getE02CODSTS().equals("A")) { out.print("selected");}%>>Activo</option>
						<option value="I" <%if (msgRcd.getE02CODSTS().equals("I")) { out.print("selected");}%>>Inactivo</option>
						<option value="B" <%if (msgRcd.getE02CODSTS().equals("B")) { out.print("selected");}%>>Bloqueado</option>
					</select>
				</td>
				<TD nowrap width="15%" align="right">Causal:</TD>
				<TD nowrap width="35%">
                <input type="text" name="E02CODCAU" size="5" maxlength="4" value="<%= msgRcd.getE02CODCAU().trim()%>" >
				<a href="javascript:GetCodeCNOFC('E02CODCAU','FY')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a> 
				</TD>
			</TR>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Codigo Unico de Comercio : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODNUC" size="13" maxlength="12" value="<%= msgRcd.getE02CODNUC() %>" >
				</td>
				<td nowrap width=10% align="right">Pan Virtual : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODPAV" size="25" maxlength="19" value="<%= msgRcd.getE02CODPAV() %>" >
					<A href="javascript:GetPanVirtual('E02CODPAV')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></A>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Fecha Instalacion : </td>
				<td nowrap width=40% align="left">
                    <eibsinput:date name="msgRcd" fn_month="E02CODIMM" fn_day="E02CODIDD" fn_year="E02CODIYY"/>
				</td>
				<td nowrap width=10% align="right">Fecha Desinstalacion : </td>
				<td nowrap width=40% align="left">
                   <eibsinput:date name="msgRcd" fn_month="E02CODUMM" fn_day="E02CODUDD" fn_year="E02CODUYY"/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Enlace :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODENL" size="20" maxlength="19" value="<%= msgRcd.getE02CODENL() %>" >
 				</td>
				<td nowrap width=10% align="right">Numero Terminal :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODNUT" size="13" maxlength="12" value="<%= msgRcd.getE02CODNUT() %>" >
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Proveedor : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODVND" size="6" maxlength="4" value="<%=msgRcd.getE02CODVND()%>" >
				    <a href="javascript:GetCodeDescCNOFC('E02CODVND','D02CODVND','BT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                    <input type="text" name="D02CODVND" size="47" maxlength="45" value="<%= msgRcd.getD02CODVND().trim()%>" readonly>
 				</td>
				<td nowrap width=10% align="right">Codigo Unico :</td>
				<td nowrap width=40% align="left">
                    <input type="text" name="E02CODSEQ" size="5" maxlength="4" value="<%= msgRcd.getE02CODSEQ().trim()%>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Referencia 1 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODRE1" size="28" maxlength="25" value="<%=msgRcd.getE02CODRE1()%>" >
 				</td>
				<td nowrap width=10% align="right">Referencia 2 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODRE2" size="28" maxlength="25" value="<%=msgRcd.getE02CODRE2()%>" >
 				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Referencia 3 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODRE3" size="28" maxlength="25" value="<%=msgRcd.getE02CODRE3()%>" >
 				</td>
				<td nowrap width=10% align="right">Referencia 4 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02CODRE4" size="28" maxlength="25" value="<%=msgRcd.getE02CODRE4()%>" >
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(10);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(6);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
