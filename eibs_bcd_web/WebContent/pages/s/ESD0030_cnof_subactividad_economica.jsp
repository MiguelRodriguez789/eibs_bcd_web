<html>
<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT>
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>

</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<H3 align="center">Códigos de Referencia del Sistema - Sub-Actividad Económica
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_actividad_economica_12.jsp, ESD0030">
</H3>

<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <h4>Información Básica</h4>

 <% int row = 0;%>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%"> 
              <div align="right">Clasificación :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Código de Sub-Actividad :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
				<% if ( !userPO.getPurpose().equals("NEW") ) { %>
                <input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>" readonly>
				<% } else { %>
                <input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
				<% } %>
                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Sector Económico : </td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E02CNOUS1" value="<%=refCodes.getE02CNOUS1()%>" required="true" flag="09" fn_code="E02CNOUS1" fn_description="E02DSCUS1" readonly="false"/> 
				<input TYPE="text" NAME="E02DSCUS1" value="<%=refCodes.getE02DSCUS1()%>" readonly>
              </td>
            <td nowrap width="15%" align="right">Actividad Económica (CIIU) : </td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E02CNOUS2" size="5" maxlength="4" value="<%= refCodes.getE02CNOUS2().trim()%>">
              	<a href="javascript:Get2FilterCodes('E02CNOUS2','E02DSCUS2','12', '',document.forms[0]['E02CNOUS1'].value)" >
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				<input TYPE="text" NAME="E02DSCUS2" value="<%=refCodes.getE02DSCUS2()%>" readonly>
            </td>
         </tr>
		</table>
      </td>
    </tr>
  </table>

   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  
	    
 </form>
</body>
</html>
