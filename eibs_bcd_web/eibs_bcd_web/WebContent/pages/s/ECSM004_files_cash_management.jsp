<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECSM00401Message"  scope="session" />
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
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
	}
%>

<h3 align="center">Archivos Recibidos y Procesados <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="files_cash_management.jsp, ECSM004"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM004" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="E01ILHAGR" value="<%= msgRcd.getE01ILHAGR() %>">
  <INPUT TYPE=HIDDEN NAME="E01ILHTIP" value="<%= msgRcd.getE01ILHTIP() %>">


<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Banco : </td>
				<td nowrap width=80% align="left">
					<input type="text" name="E01ILHBNK" size="3" maxlength="2" value="<%= msgRcd.getE01ILHBNK() %>" readonly>
				</td>
	  		</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
           	<td nowrap width=20% align="right">Convenio : </td>
            	<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHAGR" size="13" maxlength="12" value="<%= msgRcd.getE01ILHAGR() %>" readonly>
            		<input type="text" name="D01ILHAGR" size="62" maxlength="60" value="<%= msgRcd.getD01ILHAGR() %>" readonly>
       			</td>
	  		</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Cliente : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHCUN" size="10" maxlength="9" value="<%= msgRcd.getE01ILHCUN() %>" readonly>
            		<input type="text" name="D01ILHCUN" size="62" maxlength="60" value="<%= msgRcd.getD01ILHCUN() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Mensaje Nro: </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHNUM" size="13" maxlength="10" value="<%= msgRcd.getE01ILHNUM() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Tipo : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHTIP" size="2" maxlength="1" value="<%= msgRcd.getE01ILHTIP() %>" readonly>
            		<input type="text" name="D01ILHTIP" size="62" maxlength="60" value="<%= msgRcd.getD01ILHTIP() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Texto : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHTX1" size="82" maxlength="80" value="<%= msgRcd.getE01ILHTX1() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right"></td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHTX2" size="82" maxlength="80" value="<%= msgRcd.getE01ILHTX2() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right"></td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHTX3" size="82" maxlength="80" value="<%= msgRcd.getE01ILHTX3() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right"></td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHTX4" size="82" maxlength="80" value="<%= msgRcd.getE01ILHTX4() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right"></td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHTX5" size="82" maxlength="80" value="<%= msgRcd.getE01ILHTX5() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Estado : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHSTS" size="2" maxlength="1" value="<%= msgRcd.getE01ILHSTS() %>" readonly>
            		<input type="text" name="D01ILHSTS" size="60" maxlength="60" value="<%= msgRcd.getD01ILHSTS() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Mensaje : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01ILHMSG" size="50" maxlength="50" value="<%= msgRcd.getE01ILHMSG() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Hora Creacion: </td>
				<td nowrap width=80% align="left"> <%= msgRcd.getE01ILHCTM()%>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Estado: </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01RAHSTS" size="2" maxlength="1" value="<%= msgRcd.getE01RAHSTS() %>" readonly>
            		<input type="text" name="D01RAHSTS" size="60" maxlength="60" value="<%= msgRcd.getD01RAHSTS() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Mensaje : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E01RAHMSG" size="50" maxlength="50" value="<%= msgRcd.getE01RAHMSG() %>" readonly>
				</td>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>

  	
   	
<br>
	
<table width="100%">		
	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="100%">
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
