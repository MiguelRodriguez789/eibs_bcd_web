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

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00207Message"  scope="session"  />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

<%int row = 0; %>

<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW"))) 
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
		Convenio - Beneficiarios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="beneficiaries_cash_management.jsp,ECSM002">
	</h3>
</div>
<hr size="4">
	<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">
	<h4>Información Básica</h4>
	<input type="hidden" name="SCREEN" value="35">
	<table class="tableinfo">
		<tr>
			<td nowrap>
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="15%">
							<DIV align="right">Convenio:</DIV>
						</TD>
						<TD nowrap width="35%">
							<INPUT type="text" name="E07BENNUM" size="12" maxlength="12" value="<%=userPO.getAccNum().trim()%>" readonly>
						</TD>
						<TD nowrap width="15%" align="right">Tipos de Dispersion :</TD>
						<TD nowrap width="35%">
							<INPUT type="text" name="E07BENTIP" size="1" maxlength="1" value="<%=msgRcd.getE07BENTIP()%>" readonly> / 
							<INPUT type="text" name="D07BENTIP" size="62" maxlength="60" value="<%=msgRcd.getD07BENTIP()%>" readonly>
						</TD>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="15%">
							<DIV align="right">Banco Destino :</DIV>
						</TD>
						<TD nowrap width="35%">
							<INPUT type="text" name="E07BENCOM" size="5" maxlength="4" value="<%=msgRcd.getE07BENCOM()%>" readonly>
							<% if (userPO.getPurpose().equals("NEW"))  { %>
                        	<a href="javascript:GetCodeDescCNOFC('E07BENCOM','D07BENCOM','92')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                        	<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"> 
     	  					<%}%>
                        	<input type="text" name="D07BENCOM" size="47" maxlength="45" value="<%= msgRcd.getD07BENCOM().trim()%>" readonly>
						</TD>
						<TD nowrap width="15%">
							<DIV align="right">Cuenta Destino :</DIV>
						</TD>
						<TD nowrap width="35%">
							<INPUT type="text" name="E07BENRAC" size="18" maxlength="17" value="<%=msgRcd.getE07BENRAC().trim()%>" <%=read%>>
						</TD>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="15%">
							<DIV align="right">Tipo Identificación : </DIV>
						</TD>
						<TD nowrap width="35%">
							<input type="text" name="E07BENTID" value="<%=msgRcd.getE07BENTID()%>" maxlength="4" size="4" <%=read%>>
						</td>
						<TD nowrap width="15%">
							<DIV align="right">Identificacion : </DIV>
						</TD>
						<TD nowrap width="35%">
							<% if (userPO.getPurpose().equals("NEW"))  { %>
							<eibsinput:text name="msgRcd" property="E07BENIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="true" readonly="false"/>
     	  					<%} else {%>
							<eibsinput:text name="msgRcd" property="E07BENIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
     	  					<%}%>
						</td>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="15%">
							<DIV align="right">Estado :</DIV>
						</TD>
						<TD nowrap width="35%">
							<select name="E07BENSTS">
								<option value=" " <%if (msgRcd.getE07BENSTS().equals(" ")) { out.print("selected");}%>> </option>
								<option value="A" <%if (msgRcd.getE07BENSTS().equals("A")) { out.print("selected");}%>>Activo</option>
								<option value="I" <%if (msgRcd.getE07BENSTS().equals("I")) { out.print("selected");}%>>Inactivo</option>
								<option value="R" <%if (msgRcd.getE07BENSTS().equals("R")) { out.print("selected");}%>>Rechazado</option>
							</select>
						</TD>
						<TD nowrap width="15%">
							<DIV align="right"></DIV>
						</TD>
						<TD nowrap width="35%">
						</TD>
					</tr>
				</table>
			</td>
		</tr>
	</table>

	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(35);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(31);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	


		
	</form>
	
</body>
</html>
