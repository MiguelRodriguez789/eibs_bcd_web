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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001703Message"  scope="session" />
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
	name="EIBS_GIF" title="corresponsales_inq_detail.jsp, ECA0017"></h3>
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
					<input type="text" name="E03CODBNK" size="3" maxlength="2" value="<%= msgRcd.getE03CORBNK() %>" readonly/>
				</td>
				<td nowrap width=10% align="right">Cliente : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CORCUN" size="10" maxlength="9" value="<%=userPO.getCusNum().trim()%>" readonly/>
                    <input type="text" name="D03CORCUN" size="60" maxlength="60" value="<%= msgRcd.getD03CORCUN() %>" readonly/>
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Sucursal :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODOFC" size="4" maxlength="4" value="<%=msgRcd.getE03CODOFC()%>"  readonly/>
				</td>
				<td nowrap width=10% align="right">Linea de Credito :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODLNE" size="4" maxlength="4" value="<%=msgRcd.getE03CODLNE()%>"  readonly/>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Estado: </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODSTS" size="2" maxlength="1" value="<%=msgRcd.getE03CODSTS()%>"  readonly/>
					<input type="text" name="D03CODLNE" size="60" maxlength="60" value="<%=msgRcd.getD03CODSTS()%>"  readonly/>
				</td>
				<TD nowrap width="15%" align="right">Causal:</TD>
				<TD nowrap width="35%">
                <input type="text" name="E03CODCAU" size="5" maxlength="4" value="<%= msgRcd.getE03CODCAU().trim()%>" readonly/>
                <input type="text" name="D03CODCAU" size="60" maxlength="60" value="<%= msgRcd.getD03CODCAU().trim()%>" readonly/>
				</TD>
			</TR>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Codigo Unico de Comercio : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODNUC" size="13" maxlength="12" value="<%= msgRcd.getE03CODNUC() %>" readonly/>
				</td>
				<td nowrap width=10% align="right">Pan Virtual : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODPAV" size="25" maxlength="19" value="<%= msgRcd.getE03CODPAV() %>" readonly/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Fecha Instalacion : </td>
				<td nowrap width=40% align="left">
                    <eibsinput:date name="msgRcd" fn_month="E03CODIMM" fn_day="E03CODIDD" fn_year="E03CODIYY" readonly="true" />
				</td>
				<td nowrap width=10% align="right">Fecha Desinstalacion : </td>
				<td nowrap width=40% align="left">
                   <eibsinput:date name="msgRcd" fn_month="E03CODUMM" fn_day="E03CODUDD" fn_year="E03CODUYY" readonly="true"/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Enlace :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODENL" size="20" maxlength="19" value="<%= msgRcd.getE03CODENL() %>" readonly>
 				</td>
				<td nowrap width=10% align="right">Numero Terminal :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODNUT" size="13" maxlength="12" value="<%= msgRcd.getE03CODNUT() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Proveedor : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODVND" size="6" maxlength="4" value="<%=msgRcd.getE03CODVND()%>" readonly>
					<input type="text" name="D03CODVND" size="60" maxlength="61" value="<%=msgRcd.getD03CODVND()%>" readonly>
				</td>
				<td nowrap width=10% align="right">Codigo Unico :</td>
				<td nowrap width=40% align="left">
                    <input type="text" name="E03CODSEQ" size="5" maxlength="4" value="<%= msgRcd.getE03CODSEQ().trim()%>" readonly/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Referencia 1 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODRE1" size="28" maxlength="25" value="<%=msgRcd.getE03CODRE1()%>" readonly/>
 				</td>
				<td nowrap width=10% align="right">Referencia 2 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODRE2" size="28" maxlength="25" value="<%=msgRcd.getE03CODRE2()%>" readonly/>
 				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">Valor de Uso :</TD>
				<TD nowrap width="35%">
					<input type="text" name="E03CODVRA" size="15" maxlength="15" value="<%=msgRcd.getE03CODVRA()%>" readonly /> 
				</TD>
				<TD nowrap width="15%" align="right">Fecha de Uso :</TD>
				<TD nowrap width="35%">                  
					<eibsinput:date name="msgRcd" fn_year="E03CODBYY" fn_month="E03CODBMM" fn_day="E03CODBDD" readonly="true" />
				</TD>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Referencia 3 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODRE3" size="28" maxlength="25" value="<%=msgRcd.getE03CODRE3()%>" readonly/>
 				</td>
				<td nowrap width=10% align="right">Referencia 4 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CODRE4" size="28" maxlength="25" value="<%=msgRcd.getE03CODRE4()%>" readonly/>
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
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(13);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
