<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Canje - Parametros Generales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.EDD096001Message"  scope="session"  />
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
			Canje - Parametros Generales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="params_cash_management.jsp,EDD0960">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0960">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="5">

		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%">
								<DIV align="right">Banco:</DIV>
							</TD>
							<TD nowrap width="25%">
								<input type="text" readonly name="E01CNJBNK" size="2" maxlength="2" value="<%=msgRcd.getE01CNJBNK()%>" /> 
							<TD nowrap width="25%" align="right">Moneda:</TD>
							<TD nowrap width="25%">
					            <input type="text" name="E01CNJCCY" size="4" maxlength="4" value="<%=msgRcd.getE01CNJCCY()%>"  />
            					<a href="javascript:GetCurrency('E01CNJCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="absmiddle" border="0" ></a>
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
								<TD nowrap width="25%" align="right">Codigo Compensacion:</TD>
							<TD nowrap width="25%">
							<eibsinput:cnofc name="msgRcd" flag="92" property="E01CNJCOM" fn_description="D01CNJCOM" required="false"/>
							</TD>
						<td nowrap width="25%" align="right">Aplicacion Automatica :</td>
						<TD nowrap width="25%">
							<INPUT type="radio" name="E01CNJFL0" value="Y" <%if (msgRcd.getE01CNJFL0().equals("Y")) out.print("checked");%>>Si 
							<INPUT type="radio" name="E01CNJFL0" value="N" <%if (msgRcd.getE01CNJFL0().equals("N")) out.print("checked");%>>No
						</td>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
								<TD nowrap width="25%" align="right">Dias de Purgue:</TD>
							<TD nowrap width="25%">
							 <INPUT type="text" name="E01CNJDAY" size="3" maxlength="2" value="<%=msgRcd.getE01CNJDAY().trim()%>" >
							</TD>
						<td nowrap width="25%" align="right"></td>
						<TD nowrap width="25%">
						</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>

		<h4>Información Contable</h4>
		<input type="hidden" name="SCREEN" value="5">

		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Canje Propio:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJGL0" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJGL0',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Canje Local:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJGL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJGL1',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Faltantes:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJGL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJGL2',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Sobrantes:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJGL3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJGL3',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Traslado Neto:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJGL4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJGL4',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>

							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Devolucion Productos:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJDEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJDEP',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
						</tr>
<%-- 
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Canje Recibido:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJFDI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJFDI',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Devolucion Enviada:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJGL5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJGL5',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Canje Enviado:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJFDO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJFDO',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
							<TD nowrap width="25%" align="right">
								<DIV >Cuenta Contable Devolucion Recibida:</DIV>
							</TD>
							<TD nowrap width="25%">
                                <eibsinput:text name="msgRcd" property="E01CNJGL6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
                				<a href="javascript:GetLedger('E01CNJGL6',document.forms[0].E01CNJBNK.value,document.forms[0].E01CNJCCY.value,'')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
							</TD>
						</tr>
--%>						
					</table>
				</td>
			</tr>
		</table>

		<h4>Información Archivos</h4>
		<input type="hidden" name="SCREEN" value="5">

		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">
								<DIV >Nombre Archivo <br>Canje Enviado:<DIV>
							</TD>
							<TD nowrap width="25%">
							  	<INPUT type="text" name="E01CNJNA0" size="25" maxlength="20" value="<%=msgRcd.getE01CNJNA0().trim()%>" >
							</TD>
							<TD nowrap width="25%" align="right">
								<DIV >Nombre Archivo <br>Devolucion Recibida:</DIV>
							</TD>
							<TD nowrap width="25%">
							  	<INPUT type="text" name="E01CNJNA1" size="25" maxlength="20" value="<%=msgRcd.getE01CNJNA1().trim()%>" >
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">
								<DIV >Nombre Archivo <br>Canje Recibido:<DIV>
							</TD>
							<TD nowrap width="25%">
							  	<INPUT type="text" name="E01CNJNA2" size="25" maxlength="20" value="<%=msgRcd.getE01CNJNA2().trim()%>" >
							</TD>
							<TD nowrap width="25%" align="right">
								<DIV >Nombre Archivo <br>Devolucion Enviada Automatica:</DIV>
							</TD>
							<TD nowrap width="25%">
							  	<INPUT type="text" name="E01CNJNA3" size="25" maxlength="20" value="<%=msgRcd.getE01CNJNA3().trim()%>" >
							</TD>
						</tr>
				        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="25%" align="right">
								<DIV >Nombre Archivo <br>Devolucion Tecnica:<DIV>
							</TD>
							<TD nowrap width="25%">
							  	<INPUT type="text" name="E01CNJNA4" size="25" maxlength="20" value="<%=msgRcd.getE01CNJNA4().trim()%>" >
							</TD>
							<TD nowrap width="25%" align="right">
								<DIV >Nombre Archivo <br>Devolucion Enviada Total:<DIV>
							</TD>
							<TD nowrap width="25%">
							  	<INPUT type="text" name="E01CNJNA5" size="25" maxlength="20" value="<%=msgRcd.getE01CNJNA5().trim()%>" >
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);">
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
     	  </div>	
  		</td>
  	</tr>	
  </table>	


		
	</form>
	
</body>
</html>
