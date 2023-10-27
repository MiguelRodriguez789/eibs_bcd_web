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

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.EDD096301Message"  scope="session"  />
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
			Canje Rutas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cleaning_cover.jsp,EDD0963">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0963">
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
						<INPUT type="text" name="E01RUTBNK" id="E01RUTBNK" id="E01RUTBNK"size="2" maxlength="2" value="<%=msgRcd.getE01RUTBNK().trim()%>" readonly>
					</TD>
				</tr>
                <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          			<td nowrap width="25%" align="right">Centro de Canje :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01RUTCCA" size="5" maxlength="4" value="<%=msgRcd.getE01RUTCCA().trim()%>"  readonly>
						<% if (userPO.getPurpose().equals("NEW"))  { %>
	                        <a href="javascript:GetCca('E01RUTCCA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a>
     	  				<%}%>
					</td>
 				</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          			<td nowrap width="25%" align="right">Ruta :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01RUTNUM" size="5" maxlength="4" value="<%=msgRcd.getE01RUTNUM().trim()%>" readonly>
						<a href="javascript:GetCodeDescCNOFC('E01RUTNUM','D01RUTNUM','89')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
						<INPUT type="text" name="D01RUTNUM" size="30" maxlength="25" value="<%=msgRcd.getD01RUTNUM().trim()%>" readonly>
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
