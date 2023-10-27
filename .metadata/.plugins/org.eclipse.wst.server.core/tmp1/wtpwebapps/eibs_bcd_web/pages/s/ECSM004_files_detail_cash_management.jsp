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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECSM00402Message"  scope="session" />
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

<h3 align="center">Detalle del Registro <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="files_detail_cash_management.jsp, ECSM004"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM004" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01ILHNUM" value="<%= msgRcd.getE02ILDNUM() %>">
  <INPUT TYPE=HIDDEN NAME="E01ILHAGR" value="<%= msgRcd.getE02ILDAGR() %>">
  <INPUT TYPE=HIDDEN NAME="E01ILHTIP" value="<%= msgRcd.getE02ILDTIP() %>">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Banco : </td>
				<td nowrap width=80% align="left">
					<input type="text" name="E02ILDBNK" size="3" maxlength="2" value="<%= msgRcd.getE02ILDBNK() %>" readonly>
				</td>
	  		</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
           	<td nowrap width=20% align="right">Convenio : </td>
            	<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDAGR" size="13" maxlength="12" value="<%= msgRcd.getE02ILDAGR() %>" readonly>
            		<input type="text" name="D02ILHAGR" size="62" maxlength="60" value="<%= msgRcd.getD02ILDAGR() %>" readonly>
       			</td>
	  		</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Mensaje Nro: </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDNUM" size="13" maxlength="10" value="<%= msgRcd.getE02ILDNUM() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Secuencia : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDSEQ" size="4" maxlength="6" value="<%= msgRcd.getE02ILDSEQ() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Texto : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDTX1" size="102" maxlength="100" value="<%= msgRcd.getE02ILDTX1() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right"></td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDTX2" size="102" maxlength="100" value="<%= msgRcd.getE02ILDTX2() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right"></td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDTX3" size="102" maxlength="100" value="<%= msgRcd.getE02ILDTX3() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right"></td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDTX4" size="102" maxlength="100" value="<%= msgRcd.getE02ILDTX4() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right"></td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDTX5" size="102" maxlength="100" value="<%= msgRcd.getE02ILDTX5() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Estado : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDSTS" size="2" maxlength="1" value="<%= msgRcd.getE02ILDSTS() %>" readonly>
            		<input type="text" name="D02ILDSTS" size="62" maxlength="60" value="<%= msgRcd.getD02ILDSTS() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Mensaje: </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02ILDMSG" size="50" maxlength="50" value="<%= msgRcd.getE02ILDMSG() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Hora Creacion: </td>
				<td nowrap width=80% align="left"> <%= msgRcd.getE02ILDCTM()%>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Estado : </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02RADSTS" size="2" maxlength="1" value="<%= msgRcd.getE02RADSTS() %>" readonly>
            		<input type="text" name="D02RADSTS" size="62" maxlength="60" value="<%= msgRcd.getD02RADSTS() %>" readonly>
				</td>
			</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=20% align="right">Mensaje: </td>
				<td nowrap width=80% align="left">
            		<input type="text" name="E02RADMSG" size="50" maxlength="50" value="<%= msgRcd.getE02RADMSG() %>" readonly>
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
     			<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(4);">
     	  	</div>	
  		</td>
  	</tr>	
</table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
