<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html> 
<head>
<title>Source Document Rating</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EBP0138Record" class="datapro.eibs.beans.EBP013801Message"  scope="session" />
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


<H3 align="center">Calificación para el Documento Nro. <%= userPO.getIdentifier().trim() %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="source_rating_detail.jsp, EBP0138"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0138" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01BDCNUM" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDRNUM" VALUE="<%= EBP0138Record.getE01BDRNUM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDRKIN" VALUE="<%= EBP0138Record.getE01BDRKIN().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDRBNK" VALUE="<%= EBP0138Record.getE01BDCBNK().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDRBRN" VALUE="<%= EBP0138Record.getE01BDCBRN().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDRCCY" VALUE="<%= EBP0138Record.getE01BDCCCY().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E01BDRCOD" VALUE="<%= EBP0138Record.getE01BDCCOD().trim() %>">
  
  
<h4>Información Documento</h4>  
<table width="100%"> <tr> <td nowrap>
  <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
    <table class="tableinfo" cellspacing="0" width="100%" border="0" >		
		<tr id="trclear"> 
			<td nowrap width="13%" align="right"><B>Tipo Documento :</B> </td>
			<td nowrap width="20%" align="left"><%= EBP0138Record.getE01BDCKIN().trim()%>  
					<%= EBP0138Record.getE01BDCKIND().trim()%>
			</td>
			<td nowrap width="13%" align="right"><B>Proveedor : </B></td>
			<td nowrap width="20%" align="left"><%= EBP0138Record.getE01BDCCOD().trim()%>
					<%= EBP0138Record.getE01BDCVEND().trim()%>
			</td>
			<td nowrap width="14%" align="right"><B>Referencia : </B></td>
			<td nowrap width="20%" align="left"><%= EBP0138Record.getE01BDCREF().trim()%></td>
		</tr>
		<tr id="trclear"> 
			<td nowrap width="13%" align="right"><B>Fecha Documento :</B> </td>
			<td nowrap width="20%" align="left">
				<%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0138Record.getE01BDCDDM(), EBP0138Record.getE01BDCDDD(),
							EBP0138Record.getE01BDCDDY())%>
					<B><%=currUser.getE01DTF()%></B>
			</td>    
			<td nowrap width="13%" align="right"><B>Banco :</B> <%= EBP0138Record.getE01BDCBNK().trim()%></td>
			<td nowrap width="20%" align="left"> <B>Oficina :</B> <%= EBP0138Record.getE01BDCBRN().trim()%>
												    <B>Moneda :</B> <%= EBP0138Record.getE01BDCCCY().trim()%>
			</td>
			<td nowrap width="14%" align="right"><B>Descripción Documento  : </B></td>
			<td nowrap width="20%" align="left" ><%= EBP0138Record.getE01BDCDSC().trim()%>
		</tr>
		<tr id="trclear"> 
				<td nowrap width="13%" align="right"><B>Monto Total : </B></td>
				<td nowrap width="20%" align="left"><%= EBP0138Record.getE01BDCAMT().trim()%></td>
				<td nowrap width="13%" align="right"><B>Identificación Presupuesto :</B> </td>
				<td nowrap width="20%" align="left"><%= EBP0138Record.getE01BDCBID().trim()%></td>
				<td nowrap width="13%" align="right"><B>Código Presupuesto :</B> </td>
				<td nowrap width="20%" align="left"><%= EBP0138Record.getE01BDCBCD().trim()%></td>

		</tr>
		<tr id="trclear"> 
				<td nowrap width="13%" align="right"><B>% por Incumplimiento Fecha Entrega : </B></td>
				<td nowrap width="20%" align="left"><%= EBP0138Record.getE01BDCPPF().trim()%></td>
				<td nowrap width="13%" align="right"><B>% por Servicio No Conforme : </B> </td>
				<td nowrap width="20%" align="left"><%= EBP0138Record.getE01BDCPPC().trim()%></td>
				<td nowrap width="14%" align="right"><B>Fecha Inicio : </B></td>
				<td nowrap width="20%" align="left"> <%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), EBP0138Record.getE01BDCSTM(), EBP0138Record.getE01BDCSTD(),	EBP0138Record.getE01BDCSTY())%>
					<B><%=currUser.getE01DTF()%></B>
				</td>
		</tr>
	</table>
  </td></tr></table>	

  <h4>Información Línea</h4>  
  
  <table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 		  
	<table class="tableinfo" cellspacing="0" width="100%" border="0">
		<tr id="clear">
			<TD nowrap width="30%" align="right">Número Acta Inspección Final: </TD>
			<TD nowrap align="left" width="70%">
				<INPUT type="text" name="E01BDRNAC" size="30" maxlength="25" value="<%= EBP0138Record.getE01BDRNAC().trim()%> <%= read %>">
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom" border="0">
			</TD>
		<tr id="trdark">
			<TD nowrap width="30%" align="right">Fecha Acta:</TD>
			<TD nowrap align="left" width="70%">
				<eibsinput:date name="EBP0138Record" fn_month="E01BDRDDM" fn_day="E01BDRDDD" fn_year="E01BDRDDY" readonly="<%= read %>" required="true" />
					<B><%=currUser.getE01DTF()%></B>
			</TD>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="30%" align="right">Recibido por: </td>
			<td nowrap width="70%" align="left">
				<INPUT type="text" name="E01BDRRUN" size="46" maxlength="45" value="<%= EBP0138Record.getE01BDRRUN().trim()%>"  <%= read %>> 
			</td>
		</tr>
		<tr id="trdark">
            <td nowrap width="30%" align="right">Calificación: </td>
			<td nowrap width="70%" align="left">
					<select name="E01BDRSRT" >
						<option <%= EBP0138Record.getE01BDRSRT().trim().equals("")?"selected":"" %> value="">      </option>					
						<option <%= EBP0138Record.getE01BDRSRT().trim().equals("S")?"selected":"" %> value="S">Satisfactorio      </option>
						<option <%= EBP0138Record.getE01BDRSRT().trim().equals("U")?"selected":"" %> value="U">No Satisfactorio  </option>
					</select>
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">
			</td>
		</tr>
		<tr id="trclear"> 
			<td nowrap width="30%" align="right">Razón cuando No Satisfactorio:  </td>
			<td nowrap width="70%" align="left">
				<INPUT type="text" name="E01BDRRSN" size="5" maxlength="4" value="<%= EBP0138Record.getE01BDRRSN().trim()%>" > 
				<input type="text" name="E01BDRRSND" maxlength="45" size="46" <%= read %> value="<%= EBP0138Record.getE01BDRRSND().trim()%>" >
				      	<a href="javascript:GetCodeDescCNOFC('E01BDRRSN','E01BDRRSND','V5')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
			</td>
		</tr>
		<tr id="trdark"> 
			<td nowrap width="30%" align="right">Dias Incumplimiento:  </td>
			<td nowrap width="70%" align="left">
				<INPUT type="text" name="E01BDRNDI" size="5" maxlength="4" value="<%= EBP0138Record.getE01BDRNDI().trim()%>" onkeypress="enterInteger(event)"  <%= read %>> 
			</td>
		</tr>
		
		</table>
	</td></tr></table>

	<table width="100%" > <tr bordercolor="#FFFFFF"> <td width="100%" nowrap> 
		<table width="100%">
		<tr>
			<td width="33%" align="center">
				<input id="EIBSBTN" type=submit name="Submit" value="Enviar" onClick="goAction(6);">
			</td>
			<td width="33%" align="center"> 
				<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);">
			</td>
			<td width="34%" align="center">
				<input id="EIBSBTN" type=submit name="Exit" value="Salir" onClick="goAction(2);">
			</td>
		</tr>	
	</table>
  </td> </tr> </table>
</td></tr></table>
</form>

</body>
</html>
