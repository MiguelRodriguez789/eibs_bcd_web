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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ESD107001Message"  scope="session" />
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
%>

<h3 align="center">Mantenimiento Parametros Nivel de Riesgo <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="client_param_riesgo.jsp, ESD1070"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1070" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
 

 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          		<td nowrap width=10% align="right">Tipo Persona : </td>
				<td nowrap width=30% align="left">
					<input type="text" name="E01TLG" size="3" maxlength="2" value="<%= msgRcd.getE01TLG() %>" >
					<td nowrap width=35% align="left"> 1 = Persona Juridica 2 = Pesona Natural </td> 
				</td>		
            </tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width=10% align="right">Descripción Calificación : </td>
            	<td nowrap width=30% align="left">
            		<input type="text" name="E01NIV" size="30" maxlength="25" value="<%= msgRcd.getE01NIV() %>" >
       			</td>
	  		</tr>
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width=10% align="right">Calificación Desde : </td>
            	<td nowrap width=30% align="left">
            		<input type="text" name="E01PDES" size="5" maxlength="7" value="<%= msgRcd.getE01PDES() %>" >
            		<td nowrap width=35% align="left"> %</td>
       			</td>
	  		</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width=10% align="right">Calificación Hasta : </td>
            	<td nowrap width=30% align="left">
            		<input type="text" name="E01PHAS" size="5" maxlength="7" value="<%= msgRcd.getE01PHAS() %>" >
            		<td nowrap width=35% align="left"> %</td>
       			</td>
	  		</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width=10% align="right"> Nro. Años Para Actualización : </td>
            	<td nowrap width=30% align="left">
            		<input type="text" name="E01YVEN" size="5" maxlength="4" value="<%= msgRcd.getE01YVEN() %>" >
            		
       			</td>
	  		</tr>

   		</table> 
      </td>  
    </tr>
  </table>

 <h4>Informaci&oacute;n Auditoria</h4>
  <table  class="tableinfo" >
    <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width=10% align="right">Usuario Crea : </td>
            	<%= msgRcd.getE01CUS()%>
	  		</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width=10% align="right">Fecha Creación : </td>
            	<td nowrap width=40% align="left">
            	<%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),msgRcd.getE01CDM(),msgRcd.getE01CDD(),msgRcd.getE01CDY())%>
       			</td>
	  		</tr>
	  		<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	  		<td nowrap width=10% align="right">Usuario Modifica : </td>
            <td nowrap width=40% align="left">
            <td nowrap align="left" width="35%">
            	<%= msgRcd.getE01MUS()%>
			</td>
  	  		</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width=10% align="right">Fecha Modificacion : </td>
            	<td nowrap width=40% align="left">
            		<%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),msgRcd.getE01MDM(),msgRcd.getE01MDD(),msgRcd.getE01MDY())%>       			</td>
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
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(11);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
