<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html> 
<head>
<title>Source Document Detail</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EBP0142Record" class="datapro.eibs.beans.EBP014201Message"  scope="session" />
<jsp:useBean id="EBP0130Record" class="datapro.eibs.beans.EBP013001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function goAction(op) { 
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}

function goExit() {
    document.forms[0].SCREEN.value = '1';
	document.forms[0].submit();
 
}

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	boolean display=false;
    String read = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) read = " readonly ";
%>


<H3 align="center">Beneficiaro  para el Pago Nro. <%= userPO.getIdentifier().trim() %> - <%= EBP0142Record.getE01BPYSEQ().trim()%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="source_document_detail.jsp, EBP0142"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0142" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier()%>">
  <INPUT TYPE=HIDDEN NAME="SEQUENCE" VALUE="<%= userPO.getProdCode()%>">
  <INPUT TYPE=HIDDEN NAME="E01BPYREF" VALUE="<%= EBP0142Record.getE01BPYREF().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BPYBSQ" VALUE="<%= EBP0142Record.getE01BPYBSQ() %>">
  <INPUT TYPE=HIDDEN NAME="E01BPYSTS" VALUE="<%= EBP0142Record.getE01BPYSTS() %>">
  <INPUT TYPE=HIDDEN NAME="E01BPYORD" VALUE="<%= EBP0142Record.getE01BPYORD() %>">
  <INPUT TYPE=HIDDEN NAME="E01BPYTYP" VALUE="<%= EBP0142Record.getE01BPYTYP() %>">
  
<h4>Información Factura</h4>  
<table width="100%"> <tr> <td nowrap>
  <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
    <table class="tableinfo" cellspacing="0" width="100%" border="0" >		
		<tr id="trclear"> 
		<% if (!EBP0130Record.getE01BPBTYP().equals("P"))  { %>
			<td nowrap width="13%" align="right"><B></B> </td>
			<td nowrap width="20%" align="left"></td>			
		<% } else { %>
			<td nowrap width="13%" align="right"><B>Tipo Documento :</B> </td>
			<td nowrap width="20%" align="left"><%= EBP0130Record.getE01BPBKIN().trim()%>  
					<%= EBP0130Record.getE01BPBKIND().trim()%>
			</td>
		<% } %>	
			<td nowrap width="13%" align="right"><B>Proveedor : </B></td>
			<td nowrap width="20%" align="left"><%= EBP0130Record.getE01BPBCOD().trim()%>
					<%= EBP0130Record.getE01BPBVCN().trim()%>
			</td>
			<td nowrap width="14%" align="right"><B>Referencia : </B></td>
			<td nowrap width="20%" align="left"><%= EBP0130Record.getE01BPBREF().trim()%></td>
		</tr>
		<tr id="trclear"> 
			<td nowrap width="13%" align="right"><B>Fecha Documento :</B> </td>
			<td nowrap width="20%" align="left">
				<%=datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), EBP0130Record.getE01BPBRDM(), EBP0130Record.getE01BPBRDD(),
							EBP0130Record.getE01BPBRDY())%>
					<B><%=currUser.getE01DTF()%></B>
			</td>    
			<td nowrap width="13%" align="right"><B>Banco :</B> <%= EBP0130Record.getE01BPBBNK().trim()%></td>
			<td nowrap width="20%" align="left"> <B>Oficina :</B> <%= EBP0130Record.getE01BPBBRN().trim()%>
												    <B>Moneda :</B> <%= EBP0130Record.getE01BPBCCY().trim()%>
			</td>
			<td nowrap width="14%" align="right"><B>Descripción Documento  : </B></td>
			<td nowrap width="20%" align="left" ><%= EBP0130Record.getE01BPBDSC().trim()%>
		</tr>
		<tr id="trclear"> 
				<td nowrap width="13%" align="right"><B>Monto Total : </B></td>
				<td nowrap width="20%" align="left"><%= EBP0130Record.getE01BPBBAM().trim()%></td>
				<td nowrap width="13%" align="right"><B>Observaciones :</B> </td>
				<td nowrap width="20%" align="left"> 
					<%= EBP0130Record.getE01BPBRM1().trim()%>
                	<BR>
					<%= EBP0130Record.getE01BPBRM2().trim()%>
				</td>
				<td nowrap width="14%" align="right"><B>Estado : </B></td>
				<td nowrap width="20%" align="left"> <%= EBP0130Record.getE01BPBSTD().trim()%></td>
			</tr>
	</table>
  </td></tr></table>	

  <h4>Información Beneficiario</h4>  
  
  <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		  
	<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="clear">
			<TD nowrap width="30%" align="right">Nombre : </TD>
			<TD nowrap align="left" width="70%">
				<INPUT type="text" name="E01BPYNM1" size="60" maxlength="50" value="<%= EBP0142Record.getE01BPYNM1().trim()%>" <%= read %>>
			</TD>
		<tr id="trdark">	
			<TD nowrap width="30%" align="right"></TD>
			<TD nowrap align="left" width="70%">
				<INPUT type="text" name="E01BPYNM2" size="60" maxlength="50" value="<%= EBP0142Record.getE01BPYNM2().trim()%>" <%= read %>> 
			</TD>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="30%" align="right">Fecha del Pago: </td>
			<td nowrap width="70%" align="left">
				<eibsinput:date name="EBP0142Record" fn_month="E01BPYPDM" fn_day="E01BPYPDD" fn_year="E01BPYPDY"  readonly="<%= read %>" required="true"/>
						<B><%=currUser.getE01DTF()%></B>
			</td>
		</tr>
		<tr id="trdark"> 
			<td nowrap width="30%" align="right">Valor A Pagar:  </td>
			<td nowrap width="70%" align="left">
				<INPUT type="text" name="E01BPYAMT" size="20" maxlength="15" value="<%= EBP0142Record.getE01BPYAMT().trim()%>" onkeypress="enterDecimal()" <%= read %>> 
			</td>
		</tr>
		<tr id="trclear"> 
			<td nowrap width="30%" align="right">Razón Cambio:  </td>
			<td nowrap width="70%" align="left">
				<INPUT type="text" name="E01BPYRSN" size="5" maxlength="4" value="<%= EBP0142Record.getE01BPYRSN().trim()%>" > 
				<input type="text" name="E01BPYRSND" maxlength="35" size="38" <%= read %> value="<%= EBP0142Record.getE01BPYRSND().trim()%>" >
				      	<a href="javascript:GetCodeDescCNOFC('E01BPYRSN','E01BPYRSND','V6')">
				      	<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
				      	<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0">
				      	</a>
			</td>
		</tr>
		</table>
	</td></tr></table>

	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table width="100%">
		<tr>
			<td width="33%" align="center">
				<input id="EIBSBTN" type=submit name="Submit" value="Enviar" onClick="goAction(5);">
			</td>
			<td width="33%" align="center"> 
				<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);"
					<% if (userPO.getPurpose().equals("NEW")) out.print(" disabled"); %>>
			</td>
			<td width="34%" align="center">
				<input id="EIBSBTN" type=submit name="Submit" value="Salir" onClick="goExit();">
			</td>
		</tr>	
	</table>
  </td> </tr> </table>
</td></tr></table>
</form>

</body>
</html>
