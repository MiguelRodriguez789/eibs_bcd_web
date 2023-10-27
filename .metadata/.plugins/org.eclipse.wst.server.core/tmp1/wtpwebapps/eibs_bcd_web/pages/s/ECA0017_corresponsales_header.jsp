<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001701Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

<% if(userPO.getPurpose().equals("MAINTENANCE")) {%>
	builtNewMenu(eca_m_opt);
 <% } %>

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
  
 	String read = " ";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
	}


%>



<h3 align="center">Corresponsales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="corresponsales_header.jsp, ECA0017"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0017" >

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
					<input type="text" name="E01CORBNK" size="3" maxlength="2" value="<%= msgRcd.getE01CORBNK() %>" readonly>
				</td>
				<td nowrap width=10% align="right">Cliente : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CORCUN" size="10" maxlength="9" value="<%=msgRcd.getE01CORCUN()%>"<%= read %>>
             		<% if (userPO.getPurpose().equals("NEW")){ %>
                    <a href="javascript:GetCustomerDescId('E01CORCUN','D01CORCUN','')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Busqueda de Clientes" align="bottom" border="0" ></a>
            		<% } %>				    
                    <input type="text" name="D01CORCUN" size="62" maxlength="60" value="<%= msgRcd.getD01CORCUN().trim()%>" readonly>
				</td>
			</tr>
      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Tipo : </td>
				<td nowrap width=40% align="left">
					<select name="E01CORTIP">
						<option value=" " <%if (msgRcd.getE01CORTIP().equals(" ")) { out.print("selected");}%>> </option>
						<option value="C" <%if (msgRcd.getE01CORTIP().equals("C")) { out.print("selected");}%>>Corresponsal</option>
						<option value="O" <%if (msgRcd.getE01CORTIP().equals("O")) { out.print("selected");}%>>Contigencia Oficina</option>
					</select>
				</td>
				<td nowrap width=10% align="right">Cuenta Detalle: </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CORACC" size="15" maxlength="12" value="<%=msgRcd.getE01CORACC()%>" onKeypress="enterInteger(event)" /> 
					<a href="javascript:GetAccountCustomer('E01CORACC',document.forms[0].E01CORBNK.value,'CR',document.forms[0].E01CORCUN.value,'')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Linea de Credito :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CORLNE" size="4" maxlength="4" value="<%=msgRcd.getE01CORLNE()%>" />
                    <a href="javascript:GetCreditLine('E01CORLNE',document.forms[0].E01CORCUN.value)">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				</td>
				<TD nowrap width="15%" align="right">Dias Maximos Utilizacion : </TD>
				<TD nowrap width="35%">
					<input type="text" name="E01CORDMX" size="5" maxlength="5" value="<%=msgRcd.getE01CORDMX()%>" onKeypress="enterInteger(event)"/> 
				</TD>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">% Maximo Utilizacion :</TD>
				<TD nowrap width="35%">
					<input type="text" name="E01CORPMX" size="9" maxlength="9" value="<%=msgRcd.getE01CORPMX()%>" onKeypress="enterInteger(event)"/> 
				</TD>
				<TD nowrap width="15%" align="right">Banco/Moneda/Cuenta Contable<br> Pago Comision</TD>
				<TD nowrap width="35%">
					<input type="text" name="E01CORCBK" size="2" maxlength="2" value="<%=msgRcd.getE01CORCBK()%>" />/ 
			    	<input type="text" name="E01CORCCY" size="4" maxlength="4" value="<%=msgRcd.getE01CORCCY()%>"  />
            		<a href="javascript:GetCurrency('E01CORCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" border="0" ></a>/
                	<eibsinput:text name="msgRcd" property="E01CORCLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
              		<a href="javascript:GetLedger('E01CORCLN','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" border="0" ></a>
				</TD>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">Lote :</TD>
				<TD nowrap width="35%">
					<input type="text" name="E01CORBTH" size="6" maxlength="5" value="<%=msgRcd.getE01CORBTH()%>" onKeypress="enterInteger(event)"/> 
				</TD>
				<TD nowrap width="15%" align="right">Estado :</TD>
				<TD nowrap width="35%">                  
					<select name="E01CORSTS">
						<option value=" " <%if (msgRcd.getE01CORSTS().equals(" ")) { out.print("selected");}%>> </option>
						<option value="A" <%if (msgRcd.getE01CORSTS().equals("A")) { out.print("selected");}%>>Activo</option>
						<option value="C" <%if (msgRcd.getE01CORSTS().equals("C")) { out.print("selected");}%>>Bloqueado</option>
						<option value="I" <%if (msgRcd.getE01CORSTS().equals("I")) { out.print("selected");}%>>Inactivo</option>
					</select>
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

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
