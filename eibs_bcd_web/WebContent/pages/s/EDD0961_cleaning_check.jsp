<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Informacion Basica del Cheque - Canje</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.EDD096101Message"  scope="session"  />
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
			Cheque<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cleaning_check.jsp,EDD0961">
		</h3>
	</div>
	
<hr size="4">
	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.cleaning.JSEDD0961">
	<h4>Información Básica</h4>
	<input type="hidden" name="SCREEN" value="5">

<table class="tableinfo">
	<tr>
		<td nowrap>
			<table cellpadding=2 cellspacing=0 width="100%" border="0">
            	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
					<TD nowrap width="25%">
						<DIV align="right">Banco / Moneda:</DIV>
					</TD>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CANBNK" id="E01CANBNK" size="2" maxlength="2" value="<%=msgRcd.getE01CANBNK().trim()%>" readonly>
						<INPUT type="text" name="E01CANCCY" size="4" maxlength="3" value="<%=msgRcd.getE01CANCCY().trim()%>" readonly>
					</TD>
					<td nowrap width="25%" align="right">Banco del Cheque :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CANCOM" size="5" maxlength="4" value="<%=msgRcd.getE01CANCOM().trim()%>"  readonly>
						<% if (userPO.getPurpose().equals("NEW"))  { %>
                        	<a href="javascript:GetCodeDescCNOFC('E01CANCOM','D01CANCOM','92')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                        	<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"> 
     	  				<%}%>
                        <input type="text" name="D01CANCOM" size="47" maxlength="45" value="<%= msgRcd.getD01CANCOM().trim()%>" readonly>
					</td>
				</tr>
                <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
					<TD nowrap width="25%" align="right">Cheque Numero : </TD>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CANCKN" size="13" maxlength="11" value="<%=msgRcd.getE01CANCKN().trim()%>" onkeypress="enterInteger(event)" <%=read%>>
					</TD>
					<TD nowrap width="25%" align="right">Digito Verificacion <br> posicion 46 : </TD>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CANDIG" size="3" maxlength="1" value="<%=msgRcd.getE01CANDIG().trim()%>" <%=read%>>
					</td>
 				</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
					<TD nowrap width="25%" align="right">Cuenta del Cheque : </TD>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CANACK" size="18" maxlength="16" value="<%=msgRcd.getE01CANACK().trim()%>" onkeypress="enterInteger(event)" <%=read%>>
					</td>
    				<TD nowrap width="25%" align="right">Numero de Chequera : </TD>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CANBCK" size="15" maxlength="12" value="<%=msgRcd.getE01CANBCK().trim()%>" onkeypress="enterInteger(event)" readonly>
					</td>
 				</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
					<td nowrap width="25%" align="right">Valor :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CANAMT" size="18" maxlength="15" value="<%=msgRcd.getE01CANAMT().trim()%>">
					</td>
					<td nowrap width="25%" align="right">Tipo de Cheque :</td>
					<TD nowrap width="25%">
						<INPUT type="radio" name="E01CANTCH" value="N" <%if (msgRcd.getE01CANTCH().equals("N")) out.print("checked");%>>Normal 
						<INPUT type="radio" name="E01CANTCH" value="G" <%if (msgRcd.getE01CANTCH().equals("G")) out.print("checked");%>>Gerencia
					</td>
 				</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          			<td nowrap width="25%" align="right">Centro de Canje :</td>
					<TD nowrap width="25%">
						<INPUT type="text" name="E01CANCCA" size="5" maxlength="4" value="<%=msgRcd.getE01CANCCA().trim()%>"  readonly>
                        <a href="javascript:GetCca('E01CANCCA','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"  ></a>
					</td>
 					<td nowrap width="25%" align="right">Tipo de Canje :</td>
					<TD nowrap width="25%">
						<INPUT type="checkbox" name="E01CANSCE" value="Y" <%if (msgRcd.getE01CANSCE().equals("Y")) out.print("checked");%>>Canje Enviado
						<INPUT type="checkbox" name="E01CANSDR" value="Y" <%if (msgRcd.getE01CANSDR().equals("Y")) out.print("checked");%>>Devolucion Recibida
						<br> 
						<INPUT type="checkbox" name="E01CANSCR" value="Y" <%if (msgRcd.getE01CANSCR().equals("Y")) out.print("checked");%>>Canje Recibido 
						<INPUT type="checkbox" name="E01CANSDE" value="Y" <%if (msgRcd.getE01CANSDE().equals("Y")) out.print("checked");%>>Devolucion Enviada
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
