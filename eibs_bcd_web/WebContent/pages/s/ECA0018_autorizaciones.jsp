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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001801Message"  scope="session" />
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

function DesHabilitarBotones(){
		document.forms[0].cmdGrabar.disabled = true;
    }

function HabilitarBotones(){
        document.forms[0].cmdGrabar.disabled = false;
    }

// Verificar Persona //
function VerificarPersona() {
	hominiVerificarPersona(getElement("E01AUTTID").value,getElement("E01AUTIDN").value);
}
function VerificarPersonaSuc(res){
	var msg = "Verificar exitoso [" + res + "]";
	HabilitarBotones();
	getElement("E01RMK").value = getElement("E01RMK").value + res + '|';
	getElement("JSONRES").value = "ResVerificacionSuc: " + res + " - " + res;
	viewMessage(msg, false);
}
// Resultado error
function VerificarPersonaErr(res) {
	msg = "Verificar con error [" + res + "]";
	getElement("E01RMK").value  = getElement("E01RMK").value + res + '|';
	getElement("JSONRES").value = "ResVerificacionError: " + res;
	viewMessage(msg, true);
}


    function viewMessage(msg, dtl) {
      var ok = false;
      if (dtl) {
        var ok = confirm(msg + "\n\nDesea ver el detalle?");
      } else {
        alert(msg);
      }
      if (ok) {
        var jSol = getElement("JSONSOL").value;
        var jRes = getElement("JSONRES").value;
        var text = jSol + "<br><br>" + jRes;
        page = "${pageContext.request.contextPath}/pages/s/MISC_message_viewer.jsp?MESSAGE=" + text;
        CenterWindow(page,600,200,2);
      };
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



<h3 align="center">Autorizaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="autorizaciones.jsp, ECA0018"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0018" >

  	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
	<INPUT TYPE=HIDDEN NAME="E01RMK" VALUE="">
	<INPUT TYPE=HIDDEN NAME="JSONSOL" VALUE="">
	<INPUT TYPE=HIDDEN NAME="JSONRES" VALUE="">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01AUTBNK" size="3" maxlength="2" value="<%= msgRcd.getE01AUTBNK() %>" readonly>
				</td>
				<td nowrap width=10% align="right">Cliente : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01AUTCUN" size="10" maxlength="9" value="<%=msgRcd.getE01AUTCUN()%>" readonly>
             		<% if (userPO.getPurpose().equals("NEW")){ %>
                  		<a href="javascript:GetCustomerDetails('E01AUTCUN','D01AUTCUN','E01AUTIDN','E01AUTTID','','','','','','','','','','','','','','')"> 
				  		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Busqueda de Clientes" align="bottom" border="0" ></a>
            		<% } %>				    
                    <input type="text" name="D01AUTCUN" size="62" maxlength="60" value="<%= msgRcd.getD01AUTCUN().trim()%>" readonly>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Tipo Identificacion : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01AUTTID" value="<%=msgRcd.getE01AUTTID()%>" maxlength="4" size="5" readonly>
				</td>
				<td nowrap width=10% align="right">Identificacion :
 				</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01AUTIDN" value="<%=msgRcd.getE01AUTIDN()%>" maxlength="24" size="25" readonly>			
				</td>
			</TR>

      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cuenta 1 : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01AUTACO" size="15" maxlength="12" value="<%=msgRcd.getE01AUTACO()%>" onKeypress="enterInteger(event)" <%= read %> /> 
					<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
						<a href="javascript:GetAccountCustomer('E01AUTACO',document.forms[0].E01AUTBNK.value,'RT',document.forms[0].E01AUTCUN.value,'')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
					<% } %>
				</td>
				<td nowrap width=10% align="right">Cuenta 2: </td>
				<td nowrap width=40% align="left">
					<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
 						<input type="text" name="E01AUTACD" size="15" maxlength="12" value="<%=msgRcd.getE01AUTACD()%>" onKeypress="enterInteger(event)" <%= read %> /> 
                        <a href="javascript:GetAccount('E01AUTACD','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a> 
					<% } %>
				</td>
			</tr>
      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Estado : </td>
				<td nowrap width=40% align="left">
					<select name="E01AUTSTS">
						<option value=" " <%if (msgRcd.getE01AUTSTS().equals(" ")) { out.print("selected");}%>> </option>
						<option value="A" <%if (msgRcd.getE01AUTSTS().equals("A")) { out.print("selected");}%>>Activo</option>
						<option value="I" <%if (msgRcd.getE01AUTSTS().equals("I")) { out.print("selected");}%>>Inactivo</option>
					</select>
				</td>
				<TD nowrap width="10%" align="right"></TD>
				<TD nowrap width="40%">
				</TD>
			</tr>
           	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="10%" align="right">Fecha Inicio: </TD>
				<TD nowrap width="40%">
                    <eibsinput:date name="msgRcd" fn_month="E01AUTBMM" fn_day="E01AUTBDD" fn_year="E01AUTBYY"/>
				</TD>
				<TD nowrap width="10%" align="right">Fecha Finalizacion:</TD>
				<TD nowrap width="40%">
                    <eibsinput:date name="msgRcd" fn_month="E01AUTEMM" fn_day="E01AUTEDD" fn_year="E01AUTEYY"/>
				</TD>
			</tr>

   		</table> 
      </td>  
    </tr>
  </table>

   	
<br>
	
	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
	  		<td width="35%">
  				<div align="center"> 
     				<input id="EIBSBTN" type="button" name="cmdGrabar" value="Enviar" onClick="goAction(5);" disabled>
     	  		</div>	
  			</td>
  			<td width="35%">
  		  	 	<div align="center">
  		  	 		<input id="EIBSBTN" type=button name="cmdVerificar" value="Ver Biometria" onClick="VerificarPersona();"> 
     	  		</div>	
  			</td>
     	 <%} %>
  		<td width="30%">
  		  <div align="center"> 
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(1);">
   		 <%} %>
  		<% if (userPO.getPurpose().equals("INQUIRY"))  { %>
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(6);">
   		 <%} %>
     		
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
            	<%= msgRcd.getE01AUTCMU()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01AUTLMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01AUTCMM()),Integer.parseInt(msgRcd.getE01AUTCDD()),Integer.parseInt(msgRcd.getE01AUTCYY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01AUTLMM()),Integer.parseInt(msgRcd.getE01AUTLDD()),Integer.parseInt(msgRcd.getE01AUTLYY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01AUTCTT()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01AUTLTT()%>
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
