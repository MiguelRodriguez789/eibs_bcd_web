<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Tabla de Menu</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.EUT011001Message"  scope="session" />
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
    
%>


<H3 align="center">Tabla de Menu de EIBS <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="eibs_menu_maintenance.jsp, EUT0110"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0110" >
  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN id="E01MMILIF" NAME="E01MMILIF" VALUE="<%= refCodes.getE01MMILIF() %>">
  
 <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Codigo :</div>
            </td>
            <td nowrap width="80%" > 
              <div align="left"> 
                <input type="text" id="E01MMIDEN" name="E01MMIDEN" size="5" maxlength="6" value="<%= refCodes.getE01MMIDEN ().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
                <input type="text" id="E01MMENDS" name="E01MMENDS" size="50" maxlength="45" value="<%= refCodes.getE01MMENDS().trim()%>" 
                	style="text-transform: none">
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
                	<input type="text" id="E01MMHELP" name="E01MMHELP" size="5" maxlength="3" value="<%= refCodes.getE01MMHELP().trim()%>" onKeypress="enterInteger(event)" >
				<% } else {%>
                	<input type="text" id="E01MMHELP" name="E01MMHELP" size="5" maxlength="3" value="<%= refCodes.getE01MMHELP().trim()%>" onKeypress="enterInteger(event)" readonly>
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
	                <input type="text" id="E01MMMENU" name="E01MMMENU" size="5" maxlength="5" value="<%= refCodes.getE01MMMENU().trim()%>" onKeypress="enterInteger(event)"  >
				<% } else {%>
    	            <input type="text" id="E01MMMENU" name="E01MMMENU" size="5" maxlength="5" value="<%= refCodes.getE01MMMENU().trim()%>" onKeypress="enterInteger(event)" readonly >
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

