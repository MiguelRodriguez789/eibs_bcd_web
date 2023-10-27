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
<jsp:useBean id= "msgSel" class= "datapro.eibs.beans.EATM00203Message"  scope="session" />
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

out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">Consulta ATM<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="inquiry_detail.jsp, EATM002"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEATM002" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="9">

<%int row = 0; %>
 
 <h4>Informacion Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03MOVBNK" size="3" maxlength="2" value="<%= msgSel.getE03MOVBNK() %>" />
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Moneda : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03MOVCCY" size="4" maxlength="3" value="<%=msgSel.getE03MOVCCY().trim()%>" />
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Cajero :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03MOVTID" size="15" maxlength="10" value="<%=msgSel.getE03MOVTID()%>" >
					<a href="javascript:GetAtm('E03MOVTID','')" >
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Fecha: </td>
				<td nowrap width=40% align="left">
					<eibsinput:date name="msgSel" fn_month="E03MOVTMM" fn_day="E03MOVTDD" fn_year="E03MOVTYY"/>
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(9);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
