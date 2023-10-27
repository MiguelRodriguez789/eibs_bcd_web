<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Motor de Pagos - Parametros Generales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00302Message"  scope="session"  />
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

  out.println("<SCRIPT> initMenu(); </SCRIPT>");				
		
		}
	%>
	<div align="center">
		<h3>
			Motor de Pagos - Parametros Generales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="params_cash_management.jsp,ECSM003">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM003">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="6">

		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="30%">
								<DIV align="right">Banco:</DIV>
							</TD>
							<TD nowrap width="50%">
								<input type="text" name="E02CSMBNK" size="2" maxlength="2" value="<%=msgRcd.getE02CSMBNK()%>" /> 
						</tr>
<%--				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							</TD>
							<TD nowrap width="30%" align="right">Moneda:</TD>
							<TD nowrap width="50%">
					            <input type="text" name="E02CSMCCY" size="4" maxlength="4" value="<%=msgRcd.getE02CSMCCY()%>"  />
            					<a href="javascript:GetCurrency('E02CSMCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absmiddle" border="0" ></a>
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="30%" align="right">
								<DIV >Cuenta Contable / Consolidacion :</DIV>
							</TD>
							<TD nowrap width="50%">
                                <eibsinput:text name="msgRcd" property="E02CSMGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E02CSMGLN',document.forms[0].E02CSMBNK.value,document.forms[0].E02CSMCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
						</tr>
 --%>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="30%" align="right">Sufijo Archivo Respuesta Nomina:</TD>
							<TD nowrap width="50%">
					            <input type="text" name="E02CSMNOM" size="4" maxlength="5" value="<%=msgRcd.getE02CSMNOM()%>"  />
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="30%" align="right">Sufijo Archivo Respuesta Ahorro:</TD>
							<TD nowrap width="50%">
					            <input type="text" name="E02CSMAHO" size="4" maxlength="5" value="<%=msgRcd.getE02CSMAHO()%>"  />
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="30%" align="right">Sufijo Archivo Respuesta Proveedor Interno:</TD>
							<TD nowrap width="50%">
					            <input type="text" name="E02CSMPRO" size="4" maxlength="5" value="<%=msgRcd.getE02CSMPRO()%>"  />
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="30%" align="right">Sufijo Archivo Respuesta Proveedor Externo:</TD>
							<TD nowrap width="50%">
					            <input type="text" name="E02CSMPRB" size="4" maxlength="5" value="<%=msgRcd.getE02CSMPRB()%>"  />
							</TD>
						</tr>
 
 
 
 
 
 					</table>
				</td>
			</tr>
		</table>

	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(10);">
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
			<a href="<%=request.getContextPath()%>/pages/background.jsp" class="botonrojo"><b>Salir</b></a>
     	  </div>	
  		</td>
  	</tr>	
  </table>	


		
	</form>
	
</body>
</html>
