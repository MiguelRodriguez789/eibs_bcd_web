<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Tablas de prevision</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="loc" class="datapro.eibs.beans.EFIX05001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<H3 align="center">Ubicaciones de Activos Fijos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="locations_details.jsp, EFIX050"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX050" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="600">
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right">Localizaci&oacute;n :</div>
            </td>
            <td nowrap width="20%"  colspan="3"> 
              <%if (userPO.getPurpose().equals("NEW")) { %>
              <input type="text" id="E01LOCLOC" name="E01LOCLOC" size="5" maxlength="4"  value="<%= loc.getE01LOCLOC().trim()%>" >
              <% } else { %>
              <input type="text" id="E01LOCLOC" name="E01LOCLOC" readonly size="5" maxlength="4"  value="<%= loc.getE01LOCLOC().trim()%>" >
              <% } %>              
            </td>
       	  </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" > 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap colspan="3" >
            	<eibsinput:text property="E01LOCNME" name="loc" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <p><br>
  </p>
  <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
  </form>
</body>
</html>
