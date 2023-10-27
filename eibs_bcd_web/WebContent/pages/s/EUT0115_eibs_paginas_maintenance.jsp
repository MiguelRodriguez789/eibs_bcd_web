<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Tabla de Opciones de las Paginas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.EUT011501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function cancel() {
	document.forms[0].SCREEN.value = 200;
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
    
    String readonly = "NEW".equals(userPO.getPurpose()) ? "" : "readonly";
    
%>


<H3 align="center">Tabla de Opciones de las Paginas <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="eibs_paginas_maintenance.jsp, EUT0115"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0115" >
  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN id="E01MMILIF" NAME="E01MMILIF" VALUE="<%= refCodes.getE01MOILIF() %>">
  
 <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Nombr&eacute; de Menu :</div>
            </td>
            <td nowrap width="80%" > 
              <div align="left"> 
                <input type="text" id="E01MOIDEN" name="E01MOIDEN" size="5" maxlength="3" value="<%= refCodes.getE01MOIDEN ().trim()%>" onKeypress="enterInteger">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
                <input type="text" id="E01MOENDS" name="E01MOENDS" size="50" maxlength="45" value="<%= refCodes.getE01MOENDS().trim()%>" 
                	style="text-transform: none">
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" height="23"> 
              <div align="right">Clave de Acceso :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
                <% 	if (userPO.getOption().trim().equals("Y") ){ %>
	                <input type="text" id="E01MOCODE" name="E01MOCODE" size="50" maxlength="45" value="<%= refCodes.getE01MOCODE().trim()%>" 
                	style="text-transform: none">
				<% } else {%>
    	            <input type="text" id="E01MOCODE" name="E01MOCODE" size="50" maxlength="45" value="<%= refCodes.getE01MOCODE().trim()%>" 
                	style="text-transform: none" readonly>
				<% } %>
                
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%"> 
              <div align="right">Total Hijos :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
                <% 	if (userPO.getOption().trim().equals("Y") ){ %>
	                <input type="text" id="E01MOHELP" name="E01MOHELP" size="5" maxlength="3" value="<%= refCodes.getE01MOHELP().trim()%>" onKeypress="enterInteger(event)">
				<% } else {%>
    	            <input type="text" id="E01MOHELP" name="E01MOHELP" size="5" maxlength="3" value="<%= refCodes.getE01MOHELP().trim()%>" onKeypress="enterInteger(event)" readonly>
				<% } %>
                
              </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%"> 
              <div align="right">Typo de Accesso :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
                <% 	if (userPO.getOption().trim().equals("Y") ){ %>
	                <input type="text" id="E01MOMENU" name="E01MOMENU" size="5" maxlength="5" value="<%= refCodes.getE01MOMENU().trim()%>" onKeypress="enterInteger(event)" >
				<% } else {%>
    	             <input type="text" id="E01MOMENU" name="E01MOMENU" size="5" maxlength="5" value="<%= refCodes.getE01MOMENU().trim()%>" onKeypress="enterInteger(event)" readonly>
				<% } %>
               
              </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
    <input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="cancel()">
  </div>
  </form>
</body>
</html>

