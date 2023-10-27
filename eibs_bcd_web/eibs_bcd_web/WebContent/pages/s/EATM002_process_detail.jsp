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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.EATM00202Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">


function goAction(op) {
	document.forms[0].SCREEN.value = op;
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
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
		disabled = " disabled"; 
	}

out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">ATM<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="process_detail.jsp, EATM002"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEATM002" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="E01MOVBNK" VALUE="<%=msgRcd.getE02MOVBNK()%>">
  <INPUT TYPE=HIDDEN NAME="E01MOVCCY" VALUE="<%=msgRcd.getE02MOVCCY()%>">
  <INPUT TYPE=HIDDEN NAME="E01MOVTID" VALUE="<%=msgRcd.getE02MOVTID()%>">
  <INPUT TYPE=HIDDEN NAME="E01MOVTYY" VALUE="<%=msgRcd.getE02MOVTYY()%>">
  <INPUT TYPE=HIDDEN NAME="E01MOVTMM" VALUE="<%=msgRcd.getE02MOVTMM()%>">
  <INPUT TYPE=HIDDEN NAME="E01MOVTDD" VALUE="<%=msgRcd.getE02MOVTDD()%>">
  <INPUT TYPE=HIDDEN NAME="E01MOVTYR" VALUE="<%=msgRcd.getE02MOVTYR()%>">


<%int row = 0; %>
 
 <h4>Informacion Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02MOVBNK" size="3" maxlength="2" value="<%= msgRcd.getE02MOVBNK() %>" readonly />
				</td>
				<td nowrap width=10% align="right">Moneda : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02MOVCCY" size="4" maxlength="3" value="<%=msgRcd.getE02MOVCCY().trim()%>" readonly />
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Numero de Cajero :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02MOVTID" size="15" maxlength="12" value="<%=msgRcd.getE02MOVTID()%>" readonly>
				</td>
				<td nowrap width=10% align="right">Fecha: </td>
				<td nowrap width=40% align="left">
					<eibsinput:date readonly="true" name="msgRcd" fn_month="E02MOVTMM" fn_day="E02MOVTDD" fn_year="E02MOVTYY"/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Tipo :</td>
				<td nowrap width=40% align="left">
				     <input type="text" readonly name="E02MOVTYR" size="1" maxlength="1" value="<%=msgRcd.getE02MOVTYR()%>" readonly> 
				     <input type="text" readonly name="D02MOVTYR" size="20" maxlength="30" 
					     value="<% if (msgRcd.getE02MOVTYR().equals("A")) out.print("Arqueo");
								   else if (msgRcd.getE02MOVTYR().equals("P")) out.print("Aprovisionamiento");
								   else if (msgRcd.getE02MOVTYR().equals("M")) out.print("Movimiento Diario");
							       else out.print("");%>">
				</td>
				<td nowrap width=10% align="right">Tipo de Bandeja : </td>
				<td nowrap width=40% align="left">
					<select name="E02MOVBTY"   <%=disabled%> > 
						<option value=" " <%if (msgRcd.getE02MOVBTY().equals(" ")) { out.print("selected");}%>> </option>
						<option value="D" <%if (msgRcd.getE02MOVBTY().equals("D")) { out.print("selected");}%>>Dispersion</option>
						<option value="P" <%if (msgRcd.getE02MOVBTY().equals("P")) { out.print("selected");}%>>Purge</option>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Bandeja :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02MOVBAN" size="6" maxlength="4" value="<%=msgRcd.getE02MOVBAN()%>" <%=read %> />
				</td>
				<td nowrap width=10% align="right">Denominacion : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02MOVDEN" size="13" maxlength="7" value="<%=msgRcd.getE02MOVDEN()%>" <%=read %>/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cantidad : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E02MOVQTY" size="13" maxlength="7" value="<%=msgRcd.getE02MOVQTY()%>"/>
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(7);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(2);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
