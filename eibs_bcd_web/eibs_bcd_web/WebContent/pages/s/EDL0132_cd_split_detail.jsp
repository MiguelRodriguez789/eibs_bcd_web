<%@ page import = "datapro.eibs.master.Util" %>
<html> 
<head>
<title>Fraccionamiento de CDs</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="dataMsg" class="datapro.eibs.beans.EDL013213Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

function goAction(op) { 
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar esta Fracción?")) {
			return;
		}
	}
	document.forms[0].submit();
}

function goInquiry(acc) {
	var pg = "";
  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=600&E01DEAACC=" + acc;
	CenterWindow(pg,600,500,2);
}
</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    String read = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) read = " readonly ";
%>

<% if (userPO.getPurpose().equals("NEW")) { %>

<H3 align="center">Nuevo Certificado fraccionado del Certificado <%= userPO.getIdentifier().trim() %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_split_detail.jsp, EDL0132"></H3>
<hr size="4">

<% } else { %>

<H3 align="center">Certificado <%= dataMsg.getE13FRCACC().trim()%> fraccionado del Certificado <%= userPO.getIdentifier().trim() %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_split_detail.jsp, EDL0132"></H3>
<hr size="4">

<% } %>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0132" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="E01DEAACC" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E13DEAACC" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E13FRCACC" VALUE="<%= dataMsg.getE13FRCACC().trim()%>">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
			<TD align="right" width="25%"><b>Saldo Capital : </b></TD>
			<TD align="left" width="25%"><%= dataMsg.getE13FRCOAM().trim()%></TD>
			<TD align="right" width="25%"><b>Saldo Interes : </b></TD>
			<TD align="left" width="25%"><%= dataMsg.getE13FRCOMI().trim()%></TD>	  	
		</tr>
		<tr id="trdark">	
			<TD align="right" width="25%"><b>Fecha Fracción : </b></TD>
			<TD align="left" width="25%"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
																	dataMsg.getBigDecimalE13FRCODM().intValue(),
																	dataMsg.getBigDecimalE13FRCODD().intValue(),
																	dataMsg.getBigDecimalE13FRCODY().intValue())%></TD>
			<TD align="right" width="25%"><b>Certificado Origen : </b></TD>
			<TD align="left" width="25%">
			<a href="javascript:goInquiry(<%= userPO.getIdentifier().trim() %>)"><%= userPO.getIdentifier().trim()%></a>
		</tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Porcentaje de Fracción : </td> 
            <td nowrap align="left" width="35%">
				<input type="text" name="E13FRCPER" size="10" maxlength="6" onKeypress="enterDecimal(event, 2)" value="<%= dataMsg.getE13FRCPER().trim()%>" <%= read %>></td>
            <TD nowrap width="15%" align="right">Cliente : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E13FRCCUN" size="10"  maxlength="9" value="<%= dataMsg.getE13FRCCUN().trim()%>" <%= read %>>
				<%if (read== "") { %>
				<a href="javascript:GetCustomerDescId('E13FRCCUN','E13FRCNA1','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" >
				</a>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
				<%}%>
			</TD>
          </tr>
		  <TR id="trclear">
			<TD nowrap width="15%" align="right">Monto de Capital Fraccionado : </TD>
			<TD nowrap align="left" width="35%">
				<INPUT type="text" name="E13FRCAMT" size="20" maxlength="18" onKeypress="enterDecimal(event, 2)" value="<%= dataMsg.getE13FRCAMT().trim()%>" <%= read %>>
			</TD>
			<TD nowrap width="15%" align="right">Nombre : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E13FRCNA1" value="<%= dataMsg.getE13FRCNA1().trim()%>" size="35" readonly>
			</TD>
			</TR>
		  <TR id="trdark">
			<TD nowrap width="15%" align="right">Monto de Interes Fraccionado : </TD>
			<TD nowrap align="left" width="35%">
				<INPUT type="text" name="E13FRCMEI" size="20" maxlength="18" onKeypress="enterDecimal(event, 2)" value="<%= dataMsg.getE13FRCMEI().trim()%>" <%= read %>>
			</TD>
			<TD nowrap width="15%" align="right"></TD>
			<TD nowrap width="35%" align="left">
			</TD>
			</TR>
        </table> 
      </td>  
    </tr>
  </table>
  
  <table width="100%">		
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
	if (dataMsg.getH13FLGWK2().trim().equals("W") || dataMsg.getH13FLGWK2().trim().equals("A") ){%>
	<tr>
		<td width="100%" align="center" colspan="3">
			<input type="checkbox" name="H01FLGWK2" value="A" <% if (dataMsg.getH13FLGWK2().trim().equals("A")) out.print(" checked"); %>>
			Aceptar con Advertencias
		</td>
	</tr>
	<% } %>
		  <TR id="trclear">
  		<td width="50%" align="center">
  			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(6);">
     	 </td>
     	 
  		<td width="50%" align="center">
     		<input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(2);">
  		</td>
  	</tr>	
<% } else { %>
		  <TR id="trclear">
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type=submit name="Submit" value="Salir" onClick="goAction(22);">
  		</td>
  	</tr>	

<% } %>
  </table>	

  </form>
</body>
</html>
