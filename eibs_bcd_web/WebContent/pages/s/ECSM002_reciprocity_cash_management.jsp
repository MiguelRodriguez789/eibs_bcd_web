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

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00203Message"  scope="session"  />
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
 	boolean isReadOnly = isInquiry;
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
			Convenio - Reciprocidad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reciprocity_cash_management.jsp,ECSM002">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="10">

		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">
								<DIV >Convenio:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E03RECNUM" size="12" maxlength="12" value="<%=userPO.getAccNum().trim()%>" readonly>
							</TD>
							<TD nowrap width="15%" align="right">
								<DIV >Cliente:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E03RECBNK" size="3" maxlength="2" value="<%=userPO.getBank().trim()%>" readonly> / 
								<INPUT type="text" name="E03RECCUN" size="10" maxlength="9" value="<%=userPO.getCusNum().trim()%>" readonly>
							</TD>

						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Numero de Producto : </TD>
							<TD nowrap width="35%">
								<INPUT type="text" readonly name="E03RECCDE" size="6" maxlength="4" value="<%=msgRcd.getE03RECCDE().trim()%>">
								<INPUT type="text" readonly name="E03RECACC" size="15" maxlength="12" value="<%=msgRcd.getE03RECACC().trim()%>">
							</TD>
							<td nowrap width="15%" align="right">Estado :</td>
							<TD nowrap width="35%">
								<select name="E03RECSTS">
									<option value=" " <%if (msgRcd.getE03RECSTS().equals(" ")) { out.print("selected");}%>> </option>
									<option value="A" <%if (msgRcd.getE03RECSTS().equals("A")) { out.print("selected");}%>>Activo</option>
									<option value="I" <%if (msgRcd.getE03RECSTS().equals("I")) { out.print("selected");}%>>Inactivo</option>
								</select>

						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Monto Minimo : </TD>
							<TD nowrap width="35%">
       	        				<input type="text" name="E03RECVRA" size="17" maxlength="15" value="<%= msgRcd.getE03RECVRA().trim()%>" >
       	        			</TD>
							<td nowrap width="15%" align="right">Cantidad en Meses :</td>
							<TD nowrap width="35%"><input type="text" name="E03RECQME" size="6" maxlength="5" value="<%= msgRcd.getE03RECQME().trim()%>" >
							</td>
						</tr>
		</table>

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
</html>
