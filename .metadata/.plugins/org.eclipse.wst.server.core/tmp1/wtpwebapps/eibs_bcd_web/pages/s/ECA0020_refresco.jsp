<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA002001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Homini/jsHomini.js"> </SCRIPT>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>



<SCRIPT type="text/javascript">


function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	submitForm();
}


</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

  out.println("<SCRIPT> initMenu(); </SCRIPT>");
  
    String read = "";
    String inq  = "N"; 	
 	String disabled = "";

 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {
		read = " readonly ";
		  inq = "Y";
		  disabled = " disabled"; 
	}


%>



<h3 align="center">Datos Archivo Refresco<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="refresco.jsp, ECA0020"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0020" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CREBNK" size="3" maxlength="2" value="<%= msgRcd.getE01CREBNK() %>" readonly>
				</td>
				<td nowrap width=10% align="right">Cliente : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CRECUN" size="10" maxlength="9" value="<%=msgRcd.getE01CRECUN()%>" readonly>
                    <input type="text" name="D01CRECUN" size="62" maxlength="60" value="<%= msgRcd.getD01CRECUN().trim()%>" readonly>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Pan Virtual : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CREPAV" value="<%=msgRcd.getE01CREPAV()%>" maxlength="21" size="20" readonly>
				</td>
				<td nowrap width=10% align="right">Tipo de Red :
 				</td>
				<td nowrap width=40% align="left">
					<select name="E01CRETRE">
						<option value=" " <%if (msgRcd.getE01CRETRE().equals(" ")) { out.print("selected");}%>> </option>
						<option value="TES1" <%if (msgRcd.getE01CRETRE().equals("TES1")) { out.print("selected");}%>>Red de Pruebas</option>
						<option value="PRO1" <%if (msgRcd.getE01CRETRE().equals("PRO1")) { out.print("selected");}%>>Red de Produccion</option>
					</select>
				</td>
			</TR>

      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Tipo de Refresco :</td>
				<td nowrap width=40% align="left">
					<select name="E01CRETRF">
						<option value=" " <%if (msgRcd.getE01CRETRF().equals(" ")) { out.print("selected");}%>> </option>
						<option value="0" <%if (msgRcd.getE01CRETRF().equals("0")) { out.print("selected");}%>>Refresco Total</option>
						<option value="1" <%if (msgRcd.getE01CRETRF().equals("1")) { out.print("selected");}%>>Refresco Parcial</option>
					</select>
				</td>
				<td nowrap width=10% align="right">Estado :</td>
				<td nowrap width=40% align="left">
					<select name="E01CRESTS">
						<option value=" " <%if (msgRcd.getE01CRESTS().equals(" ")) { out.print("selected");}%>> </option>
						<option value="P" <%if (msgRcd.getE01CRESTS().equals("P")) { out.print("selected");}%>>Pendiente</option>
						<option value="R" <%if (msgRcd.getE01CRESTS().equals("R")) { out.print("selected");}%>>Revisado</option>
					</select>
				</td>
			</tr>
      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Tipo de Operacion : </td>
				<td nowrap width=40% align="left">
					<select name="E01CRETOP">
						<option value=" " <%if (msgRcd.getE01CRETOP().equals(" ")) { out.print("selected");}%>> </option>
						<option value="A" <%if (msgRcd.getE01CRETOP().equals("A")) { out.print("selected");}%>>Adicion</option>
						<option value="C" <%if (msgRcd.getE01CRETOP().equals("C")) { out.print("selected");}%>>Modificacion</option>
						<option value="D" <%if (msgRcd.getE01CRETOP().equals("D")) { out.print("selected");}%>>Eliminacion</option>
						<option value="B" <%if (msgRcd.getE01CRETOP().equals("B")) { out.print("selected");}%>>Bloqueo</option>
						<option value="F" <%if (msgRcd.getE01CRETOP().equals("F")) { out.print("selected");}%>>Refresco Total</option>
					</select>
				</td>
				<td nowrap width=10% align="right">Tipo de Tarjeta : </td>
				<td nowrap width=40% align="left">
					<select name="E01CRETTA">
						<option value=" "  <%if (msgRcd.getE01CRETTA().equals(" "))  { out.print("selected");}%>> </option>
						<option value="AD" <%if (msgRcd.getE01CRETTA().equals("AD")) { out.print("selected");}%>>Administrativa</option>
						<option value="DC" <%if (msgRcd.getE01CRETTA().equals("DC")) { out.print("selected");}%>>Diners Club</option>
						<option value="P" <%if (msgRcd.getE01CRETTA().equals("P")) { out.print("selected");}%>>Debito</option>
						<option value="C" <%if (msgRcd.getE01CRETTA().equals("C")) { out.print("selected");}%>>Credito</option>
					</select>
				</td>
			</tr>
           	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="10%" align="right">Entidad Finaciera: </TD>
				<TD nowrap width="40%">
					<input type="text" name="E01CREFFI" value="<%=msgRcd.getE01CREFFI()%>" maxlength="5" size="4" readonly>
				</TD>
				<TD nowrap width="10%" align="right">Estado de la tarjeta</TD>
				<TD nowrap width="40%">
					<select name="E01CRESTA">
						<option value=" " <%if (msgRcd.getE01CRESTA().equals(" ")) { out.print("selected");}%>> </option>
						<option value="0" <%if (msgRcd.getE01CRESTA().equals("0")) { out.print("selected");}%>>Tarjeta Nueva</option>
						<option value="1" <%if (msgRcd.getE01CRESTA().equals("1")) { out.print("selected");}%>>Tarjeta Activa</option>
						<option value="2" <%if (msgRcd.getE01CRESTA().equals("2")) { out.print("selected");}%>>Tarjeta Perdida</option>
						<option value="3" <%if (msgRcd.getE01CRESTA().equals("3")) { out.print("selected");}%>>Tarjeta Robada</option>
						<option value="4" <%if (msgRcd.getE01CRESTA().equals("4")) { out.print("selected");}%>>Tarjeta Bloqueada</option>
						<option value="9" <%if (msgRcd.getE01CRESTA().equals("9")) { out.print("selected");}%>>Tarjeta Cancelada</option>
					</select>
				</TD>
			</tr>
           	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="10%" align="right">Valor Consignado: </TD>
				<TD nowrap width="40%">
					<input type="text" name="E01CREVRA" value="<%=msgRcd.getE01CREVRA()%>" maxlength="12" size="12" readonly>
				</TD>
				<TD nowrap width="10%" align="right">Valor Maximo: </TD>
				<TD nowrap width="40%">
					<input type="text" name="E01CREMVR" value="<%=msgRcd.getE01CREMVR()%>" maxlength="12" size="12" readonly>
				</TD>
			</tr>

   		</table> 
      </td>  
    </tr>
  </table>

   	
<br>
	
	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	  		<td width="50%">
  				<div align="center"> 
     				<input id="EIBSBTN" type="button" name="cmdGrabar" value="Enviar" onClick="goAction(5);">
     	  		</div>	
  			</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(1);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
   <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= msgRcd.getE01CRECMU()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01CRELMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01CRECMM()),Integer.parseInt(msgRcd.getE01CRECDD()),Integer.parseInt(msgRcd.getE01CRECYY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01CRELMM()),Integer.parseInt(msgRcd.getE01CRELDD()),Integer.parseInt(msgRcd.getE01CRELYY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01CRECTT()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01CRELTT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
