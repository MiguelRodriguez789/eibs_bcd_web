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

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00208Message"  scope="session"  />
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
		Convenio - Programador<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sch_cash_management.jsp,ECSM002">
	</h3>
</div>
<hr size="4">
	<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">
	<h4>Información Básica</h4>
	<input type="hidden" name="SCREEN" value="40">
	<table class="tableinfo">
		<tr>
			<td nowrap>
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="15%">
							<DIV align="right">Convenio:</DIV>
						</TD>
						<TD nowrap width="35%">
							<INPUT type="text" name="E08SCHNUM" size="12" maxlength="12" value="<%=userPO.getAccNum().trim()%>" readonly>
						</TD>
						<TD nowrap width="15%">
							<DIV align="right">Secuencia :</DIV>
						</TD>
						<TD nowrap width="35%">
							<INPUT type="text" name="E08SCHSEQ" size="5" maxlength="5" value="<%=msgRcd.getE08SCHSEQ().trim()%>" readonly>
						</TD>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<TD nowrap width="15%">
							<DIV align="right">Fecha Efectiva de Inicio :</DIV>
						</TD>
						<TD nowrap width="35%">
							<eibsinput:date name="msgRcd" fn_year="E08SCHEYY" fn_month="E08SCHEMM" fn_day="E08SCHEDD" required="true" readonly="<%=isReadOnly %>"/>
						</TD>
						<TD nowrap width="15%" align="right">Dia de la Semana :</TD>
						<TD nowrap width="35%">
							<select name="E08SCHDAY">
								<option value=" " <%if (msgRcd.getE08SCHDAY().equals(" ")) { out.print("selected");}%>> </option>
								<option value="*ALL" <%if (msgRcd.getE08SCHDAY().equals("*ALL")) { out.print("selected");}%>>Todos</option>
								<option value="*WRK" <%if (msgRcd.getE08SCHDAY().equals("*WRK")) { out.print("selected");}%>>Habiles</option>
								<option value="*MON" <%if (msgRcd.getE08SCHDAY().equals("*MON")) { out.print("selected");}%>>Lunes</option>
								<option value="*TUE" <%if (msgRcd.getE08SCHDAY().equals("*TUE")) { out.print("selected");}%>>Martes</option>
								<option value="*WED" <%if (msgRcd.getE08SCHDAY().equals("*WED")) { out.print("selected");}%>>Miercoles</option>
								<option value="*THU" <%if (msgRcd.getE08SCHDAY().equals("*THU")) { out.print("selected");}%>>Jueves</option>
								<option value="*FRI" <%if (msgRcd.getE08SCHDAY().equals("*FRI")) { out.print("selected");}%>>Viernes</option>
								<option value="*SAT" <%if (msgRcd.getE08SCHDAY().equals("*SAT")) { out.print("selected");}%>>Sabado</option>
								<option value="*SUN" <%if (msgRcd.getE08SCHDAY().equals("*SUN")) { out.print("selected");}%>>Domingo</option>
							</select>
						</TD>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=10% align="right">Hora de Corte Desde (HH MM) : </td>
						<td nowrap width=40% align="left">
							<eibsinput:text name="msgRcd" property="E08SCHFTH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>:
							<eibsinput:text name="msgRcd" property="E08SCHFTM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>
						</td>
						<td nowrap width=10% align="right">Hora de Corte Hasta (HH MM) : </td>
						<td  nowrap width=40% align="left">
							<eibsinput:text name="msgRcd" property="E08SCHTTH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>:
							<eibsinput:text name="msgRcd" property="E08SCHTTM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>
						</td>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=10% align="right">Hora de Envío (HHMM) : </td>
						<td nowrap width=40% align="left">
							<eibsinput:text name="msgRcd" property="E08SCHMIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="true" 
							value="<%=msgRcd.getE08SCHMIN().trim()%>" />
						</td>
						<td nowrap width=10% align="right"></td>
						<td  nowrap width=40% align="left">
						</td>
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(40);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(36);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	


		
	</form>
	
</body>
</html>
