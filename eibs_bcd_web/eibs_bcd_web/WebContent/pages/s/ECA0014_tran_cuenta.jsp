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
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001401Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
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
 	String readonly = "";

 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (!(userPO.getPurpose().equals("NEW"))) {
		read = " readonly ";
		  inq = "Y";
		  disabled = " disabled"; 
		  readonly ="true";
	}


%>



<h3 align="center">Asociacion de Cuentas - Transacciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="tran_cuenta.jsp, ECA0014"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0014" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
 
 <h4>Información Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cliente : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01TRICUN" size="10" maxlength="9" value="<%=msgRcd.getE01TRICUN()%>"<%= read %>>
             		<% if (userPO.getPurpose().equals("NEW")){ %>
                    <a href="javascript:GetCustomerDescId('E01TRICUN','D01TRICUN','')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Busqueda de Clientes" align="bottom" border="0" ></a>
            		<% } %>				    
                    <input type="text" name="D01TRICUN" size="62" maxlength="60" value="<%= msgRcd.getD01TRICUN().trim()%>" readonly>
				</td>
				<td nowrap width=10% align="right"> </td>
				<td nowrap width=40% align="left">
				</td>
			</tr>
      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cuenta  : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01TRIACC" size="15" maxlength="12" value="<%=msgRcd.getE01TRIACC()%>" onKeypress="enterInteger(event)" <%= read %> /> 
					<% if (userPO.getPurpose().equals("NEW"))  { %>
						<a href="javascript:GetAccountCustomer('E01TRIACC','<%=currUser.getE01CBK()%>','RT',document.forms[0].E01TRICUN.value,'')">
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
					<% } %>
					(0 = Todas las cuentas)
				</td>
				<td nowrap width=10% align="right"></td>
				<td nowrap width=40% align="left">
				</td>
			</tr>
		      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Proveedor : </td>
				<td nowrap width=40% align="left">
            			<eibsinput:cnofc name="msgRcd" property="E01TRIVND" value="<%=msgRcd.getE01TRIVND()%>" required="true" flag="BT" fn_code="E01TRIVND" fn_description="D01TRIVND" readonly="<%=readonly%>" />
            			<INPUT type="text" name="D01TRIVND" size="47" readonly value="<%= msgRcd.getD01TRIVND().trim()%>">
            			(Blanco = Todos los proveedores)
				</td>
				<td nowrap width=10% align="right"></td>
				<td nowrap width=40% align="left">
				</td>
				
			</tr>	
      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Transaccion : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01TRINOE" size="12" maxlength="10" value="<%=msgRcd.getE01TRINOE()%>" >
				    <a href="javascript:GetTransaction('E01TRINOE','D01TRINOE', ' ')" >
				    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            		<input type="text" name="D01TRINOE" size="47" maxlength="46"  value="<%=msgRcd.getD01TRINOE()%>" readonly>
            		(Blanco = Todas las Transaciones)
				</td>
				<td nowrap width=10% align="right"></td>
				<td nowrap width=40% align="left">
				</td>
			</tr>

   		</table> 
      </td>  
    </tr>
  </table>

   	
<br>
	
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
 

  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= msgRcd.getE01TRICMU()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01TRILMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01TRICMM()),Integer.parseInt(msgRcd.getE01TRICDD()),Integer.parseInt(msgRcd.getE01TRICYY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01TRILMM()),Integer.parseInt(msgRcd.getE01TRILDD()),Integer.parseInt(msgRcd.getE01TRILYY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01TRICTT()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01TRILTT()%>
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
