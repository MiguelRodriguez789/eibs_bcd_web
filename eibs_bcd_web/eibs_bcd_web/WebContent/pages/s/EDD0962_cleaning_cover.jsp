<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Canje Enviado - Canje</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.EDD096201Message"  scope="session"  />
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
 	boolean isReadOnly =isInquiry;
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
			Canje Cubiertas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cleaning_cover.jsp,EDD0962">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0962">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="5">

<table class="tableinfo">
	<tr>
		<td nowrap>
			<table cellpadding=2 cellspacing=0 width="100%" border="0">
            	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
					<TD nowrap width="25%">
						<DIV align="right">Banco :</DIV>
					</TD>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CACBNK" id="E01CACBNK" id="E01CACBNK"size="2" maxlength="2" value="<%=msgRcd.getE01CACBNK().trim()%>" readonly>
					</TD>
					<td nowrap width="25%" align="right">Banco de Compensacion :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CACCOM" size="5" maxlength="4" value="<%=msgRcd.getE01CACCOM().trim()%>"  readonly>
						<% if (userPO.getPurpose().equals("NEW"))  { %>
                        <a href="javascript:GetCodeDescCNOFC('E01CACCOM','D01CACCOM','92')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                        <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"> 
     	  				<%}%>
                        <input type="text" name="D01CACCOM" size="47" maxlength="45" value="<%= msgRcd.getD01CACCOM().trim()%>" readonly>
					</td>
				</tr>
                <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          			<td nowrap width="25%" align="right">Centro de Canje :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CACCCA" size="5" maxlength="4" value="<%=msgRcd.getE01CACCCA().trim()%>"  readonly>
						<% if (userPO.getPurpose().equals("NEW"))  { %>
	                        <a href="javascript:GetCca('E01CACCCA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a>
     	  				<%}%>
					</td>
          			<td nowrap width="25%" align="right">Oficina :</td>
					<TD nowrap width="25%">
             			<eibsinput:help name="msgRcd" property="E01CACBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" required="false" fn_param_one="E01CACBRN" fn_param_two="document.getElementById('E01CACBNK').value" fn_param_three="D01CACBRN"/>
              			<eibsinput:text name="msgRcd" property="D01CACBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>              			
              		</TD>
 				</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
					<TD nowrap width="25%" align="right">Tipo de Canje : </TD>
					<TD nowrap width="25%">
                  <%if(userPO.getPurpose().equals("NEW")) {%>
					<select name="E01CACTCA">
						<option value=" " <%if (msgRcd.getE01CACTCA().equals(" ")) { out.print("selected");}%>> </option>
						<option value="CE" <%if (msgRcd.getE01CACTCA().equals("CE")) { out.print("selected");}%>>Canje Enviado</option>
						<option value="CR" <%if (msgRcd.getE01CACTCA().equals("CR")) { out.print("selected");}%>>Canje Recibido</option>
						<option value="DE" <%if (msgRcd.getE01CACTCA().equals("DE")) { out.print("selected");}%>>Devolucion Enviada</option>
						<option value="DR" <%if (msgRcd.getE01CACTCA().equals("DR")) { out.print("selected");}%>>Devolucion Recibida</option>
					</select>
                  <%}else{%>
                    <input type="text" readonly name="E01CACTCA" size="2" maxlength="2" value="<%=msgRcd.getE01CACTCA().trim()%>"  readonly>
                    <input type="text" readonly name="D01CACTCA" size="30" maxlength="30" value="<%=msgRcd.getD01CACTCA().trim()%>"  readonly>
                  <%}%>
 					<TD nowrap width="25%" align="right">Fecha Cubierta : </TD>
					<TD nowrap width="25%">
					 	<eibsinput:date name="msgRcd" fn_year="E01CACTYY" fn_month="E01CACTMM" fn_day="E01CACTDD" />
					</td>
 				</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          			<td nowrap width="25%" align="right">Cantidad de Cheques :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CACQTY" size="7" maxlength="5" value="<%=msgRcd.getE01CACQTY().trim()%>" >
					</td>
					<td nowrap width="25%">
						<div align="right">Valor :</div>
					</td>
					<td nowrap width="25%">
						<INPUT type="text" name="E01CACAMT" size="22" maxlength="20" value="<%=msgRcd.getE01CACAMT().trim()%>">
					</td>
 				</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          			<td nowrap width="25%" align="right">Numero <br> Cubierta :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CACNCU" size="12" maxlength="12" value="<%=msgRcd.getE01CACNCU().trim()%>" readonly>
					</td>
					<td nowrap width="25%">
						<div align="right"></div>
					</td>
					<td nowrap width="25%">
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(1);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	

		
	</form>
	
</body>
</html>
