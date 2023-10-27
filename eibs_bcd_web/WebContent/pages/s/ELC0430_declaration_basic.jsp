<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<title>Declaraciones de Ingreso</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id="msg" class="datapro.eibs.beans.ELC043001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goHelp(fcode, famount) {
    code = fcode;
    amount = famount
    page = "<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0420?SCREEN=1600";
 	CenterWindow(page,820,600,2);
}

function getList() {
	getElement("ACTION").value = "1500";
	document.forms[0].submit();
}

</SCRIPT>



<%
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
} 

	String readonly = "";
	String lock = "";
	if (userPO.getPurpose().equals("INQUIRY")) {
		readonly = "readonly";
		lock = "readonly";
	}
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		lock = "readonly";
	}

String type = "Número de Operación";
if (userPO.getAccOpt().equals("L")) type = "Prestamo";
if (userPO.getAccOpt().equals("C")) type = "Cobranza";

%>

</head>
<body bgcolor="#FFFFFF">

<h3 align="center">Asociacion de Declaraciones de Ingreso/Salida
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="declaration_basic, ELC0430" ></h3>
<hr size="4">

<FORM name="form" METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0430" >
	<INPUT TYPE=HIDDEN ID="ACTION" NAME="SCREEN" VALUE="500">
	<INPUT TYPE=HIDDEN ID="E01DIPACC" NAME="E01DIPACC" VALUE="<%= Util.formatCell(userPO.getAccNum()) %>">
	<INPUT TYPE=HIDDEN ID="E01DDICUN" NAME="E01DDICUN" VALUE="<%= Util.formatCell(userPO.getCusNum()) %>">
	<INPUT TYPE=HIDDEN ID="E01CUSNME" NAME="E01CUSNME" VALUE="<%= Util.formatCell(userPO.getCusName()) %>">
	<INPUT TYPE=HIDDEN ID="E01DIPCOR" NAME="E01DIPCOR" VALUE="<%= Util.formatCell(userPO.getIdentifier()) %>">
	
	<TABLE  id="mainTable" class="tableinfo" >
		<TR> 
   			<TD NOWRAP valign=top>
 				<TABLE id="dataTable" width="100%">
					<TR id="trclear"> 
						<TD NOWRAP ALIGN="CENTER"><%= type %>: <%= Util.formatCell(userPO.getAccNum()) %></TD>
						<TD NOWRAP ALIGN="CENTER">Cliente: <%= Util.formatCell(userPO.getCusNum()) %></TD>
						<TD NOWRAP ALIGN="CENTER"> - <%= Util.formatCell(userPO.getCusName()) %></TD>
					</TR>
			     </TABLE>
		    </TD>
	   	</TR>	
   	</TABLE>

	<table  class="tableinfo">
    	<tr > 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Número de Documento :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01DIPNDI" size="24" maxlength="20" value="<%= msg.getE01DIPNDI().trim()%>" <%= lock %>>
              				<% if (lock.equals("")) { %>
               					<A href="javascript:goHelp('E01DIPNDI', 'E01DDIMTO')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></A> <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
              				<% } %>
             			</td>  
          			</tr>
          			<tr id="trdark"> 
            			<td nowrap><div align="right">Monto del  Documento en USD:</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01DDIMTO" size="12" maxlength="10" value="<%= msg.getE01DDIMTO().trim()%>" readonly>
             			</td>  
          			</tr>
          			<tr id="trclear"> 
            			<td nowrap><div align="right">Monto a Utilizar en la Moneda de la Operaci&oacute;n :</div></td>
            			<td nowrap colspan="3"> 
              				<input type="text" name="E01DIPMTX" size="18" maxlength="16" value="<%= msg.getE01DIPMTX().trim()%>" <%= readonly %> onkeypress="enterDecimal(event)"> 
            			</td>
          			</tr>
        		</table>
      		</td>
    	</tr>
  	</table>
 
  	<br>
  	<% if (!userPO.getPurpose().equals("INQUIRY")) { %>
   			<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Aceptar"></p>
   	<% } %>	
   	
</form>

</body>
</html>

