<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page	language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.eibs.constants.StyleID"%>

<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/style.css" type="text/css" rel="stylesheet">
<title>Mantenimiento Directorio de Formas para e-IBS</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dir" class= "com.datapro.generic.beanutil.BeanList"  scope="session" />
<jsp:useBean id= "msg" class= "datapro.eibs.beans.ESD074201Message"  scope="session" />

<body>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<%
	String readonly = "0001".equals(msg.getH01OPECOD()) ? "" : "readonly"; 
	String title = "0001".equals(msg.getH01OPECOD()) ? "Nuevo" : "Mantenimiento";
%>

<script type="text/javascript">
	function goExit() {
  		window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}  
</SCRIPT>  

<h3 align="center">Mantenimiento Directorio de Formas para e-IBS
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="form_dir_maintenance.jsp, ESD0742"></h3>
<hr size="4">

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }

%> 


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSESD0742">
<INPUT TYPE=HIDDEN NAME="SCREEN" value="400">
<INPUT TYPE=HIDDEN NAME="H01OPECOD" value="<%=msg.getH01OPECOD()%>">

<% int row = 0; %>
<table class="tableinfo">
	<tr >
		<td nowrap>
			<table cellspacing="0" cellpadding="2" width="100%" border="0">
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="40%"><div align="right">Código de Producto :</div></td>
            		<td nowrap width="60%"> 
              			<div align="left"> 
                			<input type="text" readonly name="E01APFPRO" size="6" maxlength="4" value="<%= msg.getE01APFPRO().trim()%>">
                			<input type="text" readonly name="D01DSCPRO" size="40" maxlength="35" value="<%= msg.getD01DSCPRO().trim()%>">
              				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
                			<font color="#d0122c"><b>(<%=title%>)</b></font>
              			</div>
            		</td>
				</tr>
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap><div align="right">Tipo de Forma :</div></td>
            		<td nowrap> 
              			<div align="left"> 
                			<input type="text" readonly name="E01APFFTY" size="4" maxlength="2" value="<%= msg.getE01APFFTY().trim()%>">
              			</div>
            		</td>
				</tr>
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            		<td nowrap><div align="right">Código de Forma :</div></td>
            		<td nowrap> 
              			<div align="left"> 
                			<input type="text" <%=readonly%> name="E01APFFCD" size="18" maxlength="15" value="<%= msg.getE01APFFCD().trim()%>">
              				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
              			</div>
            		</td>
				</tr>
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap><div align="right">Descripción :</div></td>
            		<td nowrap> 
              			<div align="left"> 
                			<input type="text" name="E01APFDSC" size="40" maxlength="35" value="<%= msg.getE01APFDSC().trim()%>">
              			</div>
            		</td>
				</tr>
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            		<td nowrap><div align="right">Dirección Remota :</div></td>
            		<td nowrap> 
              			<div align="left"> 
              			  <input type="text" name="E01APFPTH" size="80" maxlength="75" value="<%= msg.getE01APFPTH().trim()%>">
<!-- 
                      		<select name="E01APFPTH">
                      			<option value="" selected >&nbsp;</option>
<%
								dir.initRow();
								while (dir.getNextRow()) {
								 	String path = dir.getRecord().toString();
%>                      		
                      				<option value="<%= path %>" <% if (path.toUpperCase().equals(msg.getE01APFPTH())) {out.print("selected");} %>><%= path %></option>
<%
								} 
%>   
                      		</select>
 -->                   			
              			</div>
            		</td>
				</tr>
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap><div align="right">Numero de Copias :</div></td>
            		<td nowrap> 
              			<div align="left"> 
                			<input type="text" name="E01APFCPI" size="4" maxlength="2" value="<%= msg.getE01APFCPI().trim()%>">
              			</div>
            		</td>
				</tr>
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            		<td nowrap><div align="right">Codigo de Operacion :</div></td>
            		<td nowrap> 
              			<div align="left"> 
                			<select name="E01APFOPE">
                				<option value="1" <% if ("1".equals(msg.getE01APFOPE())) {out.print("selected");} %>>Forma en Pantalla</option>
                				<option value="2" <% if ("2".equals(msg.getE01APFOPE())) {out.print("selected");} %>>Forma en Impresora</option>
                				<option value="3" <% if ("3".equals(msg.getE01APFOPE())) {out.print("selected");} %>>Completar Forma</option>
                			</select>
              			</div>
            		</td>
				</tr>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            		<td nowrap><div align="right">Formas :</div></td>
            		<td nowrap> 
              			<div align="left"> 
                			<select name="E01APFIFS">
                				<option value=" " <% if (" ".equals(msg.getE01APFIFS())) {out.print("selected");} %>>WORD</option>
                				<option value="B" <% if ("B".equals(msg.getE01APFIFS())) {out.print("selected");} %>>Bankers</option>
                				<option value="P" <% if ("P".equals(msg.getE01APFIFS())) {out.print("selected");} %>>PDF</option>
                			</select>
              			</div>
            		</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<!-- PG: Pagare de Prestamos -->
<%if(msg.getE01APFFTY().equals("PG")){%>
<br>
<table class="tableinfo">
	<tr >
		<td nowrap>
			<table cellspacing="0" cellpadding="2" width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap width="40%"><div align="right">Fuente de Recursos :</div></td>
					<td nowrap width="60%"> 
						<div align="left"> 
							<eibsinput:cnofc name="msg" flag="RS" property="E01APFUC1" fn_code="E01APFUC1" fn_description="" required="true"/>
						</div>
            		</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%}%>

<br>
   
<p align="center">
	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	<input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="goExit()">
</p>

</form>
</body>
</html>