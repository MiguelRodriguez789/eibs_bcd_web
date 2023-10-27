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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.EATM00204Message"  scope="session" />
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

<h3 align="center">Cierre Manual ATM<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="closed_detail.jsp, EATM002"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEATM002" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">


<%int row = 0; %>
 
 <h4>Informacion Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E04MOVBNK" size="3" maxlength="2" value="<%= msgRcd.getE04MOVBNK() %>" readonly />
				</td>
				<td nowrap width=10% align="right">Moneda : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E04MOVCCY" size="4" maxlength="3" value="<%=msgRcd.getE04MOVCCY().trim()%>" readonly />
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Numero de Cajero :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E04MOVTID" size="15" maxlength="12" value="<%=msgRcd.getE04MOVTID()%>" readonly>
				</td>
				<td nowrap width=10% align="right">Fecha Cajero: </td>
				<td nowrap width=40% align="left">
					<eibsinput:date readonly="true" name="msgRcd" fn_month="E04PARRMM" fn_day="E04PARRDD" fn_year="E04PARRYY"/>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Valor Timbre :</td>
				<td nowrap width=40% align="left">
				     <input type="text" readonly name="E04TOTTIM" size="15" maxlength="15" value="<%=msgRcd.getE04TOTTIM()%>" readonly> 
				</td>
				<td nowrap width=10% align="right">Valor Aprovisionamiento : </td>
				<td nowrap width=40% align="left">
				     <input type="text" readonly name="E04TOTAPR" size="15" maxlength="15" value="<%=msgRcd.getE04TOTAPR()%>" readonly> 
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Valor Arqueo :</td>
				<td nowrap width=40% align="left">
				     <input type="text" readonly name="E04TOTARQ" size="15" maxlength="15" value="<%=msgRcd.getE04TOTARQ()%>" readonly> 
				</td>
				<td nowrap width=10% align="right">Valor Movimiento : </td>
				<td nowrap width=40% align="left">
				     <input type="text" readonly name="E04TOTMOV" size="15" maxlength="15" value="<%=msgRcd.getE04TOTMOV()%>" readonly> 
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cierre :</td>
				<td nowrap width=40% align="left">
					<INPUT type="radio" name="E04FLGCLO" value="Y" <%if (msgRcd.getE04FLGCLO().equals("Y")) out.print("checked");%>>Si
					<INPUT type="radio" name="E04FLGCLO" value="N" <%if (msgRcd.getE04FLGCLO().equals("N")) out.print("checked");%>>No 
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
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(12);">
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(10);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
