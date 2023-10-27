<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Tabla de Menu</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="msgURL" class="datapro.eibs.beans.EUT012001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
function cancel() {
	document.forms[0].SCREEN.value = 100;
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


<H3 align="center">Ayudas del EIBS <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="maintenance.jsp, EUT0120"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0120" >
  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="4">
  
 <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Codigo/ID :</div>
            </td>
            <td nowrap width="80%" > 
              <div align="left"> 
          		<eibsinput:text name="msgURL" property="E01WEBID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" maxlength="30" size="35" style="text-transform: none;" readonly="true" />
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" height="23"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
             	 <% 	if (userPO.getOption().trim().equals("Y") ){ %>
          			<eibsinput:text name="msgURL" property="E01WEBDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" maxlength="30" size="35" style="text-transform: none;" />
                <% } else {%>
          			<eibsinput:text name="msgURL" property="E01WEBDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" maxlength="30" size="35" style="text-transform: none;"  readonly="true"/>
                <% } %>              
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%"> 
              <div align="right">URL address :</div>
            </td>
            <td nowrap width="80%"> 
              <div align="left"> 
              <% 	if (userPO.getOption().trim().equals("Y") ){ %>
					<textarea name="E01WEBRAW" cols="100" rows="5" maxlength="512" style="text-transform: none;"><%= "".equals(msgURL.getE01WEBRAW().trim())  ? msgURL.getE01WEBURL() :msgURL.getE01WEBRAW()%></textarea>
                <% } else {%>
					<textarea name="E01WEBRAW" cols="100" rows="5" maxlength="512" disabled="disabled"><%= "".equals(msgURL.getE01WEBRAW().trim())  ? msgURL.getE01WEBURL() :msgURL.getE01WEBRAW() %></textarea>
                <% } %>              
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%" colspan="4"> 
				(*) En el caso cuanda el URI contiene variables de Javascript , el sistema transforma el path con "place holder" (a[0], a[1],etc). 
				<br>(*) No incluye el context path. 
			</td>
		  </tr>          
        </table>
      </td>
    </tr>
  </table>
  <div align="center">
  <% 	if (userPO.getOption().trim().equals("Y") ){ %>
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar"> 
  <% } %>              
    <input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="cancel()">
  </div>
  </form>
</body>
</html>

