<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT >
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>
</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script >



 function goAction() {
 		
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
    boolean readonly = (userPO.getPurpose().equals("NEW")?false:true);
%>
<body>
<H3 align="center">Códigos de Referencia del Sistema - Perfil Crediticio de Clientes<br> <%= userPO.getSource()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_generic_perfil_crediticio_client.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNOMXC" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="E02CNOMNC" VALUE="O">
   
  <% int row = 0;%>
  <h4>Información Básica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Clasificación : </td>
            <td nowrap align="left"> 
               	<input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly >
            </td>
          </tr>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right">Código : </td>
            <td nowrap align="left">
            	<eibsinput:text name="refCodes" property="E02CNORCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="true" readonly="<%=readonly%>"/>
            	<eibsinput:text name="refCodes" property="E02CNODSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="false"/>
            </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" align="right"> </td>
            <td nowrap align="left">
            </td>
          </tr>
         
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Cupo Rotativo : </td>
            <td nowrap align="left">
                <select name="E02CNOF06" >
                  <option <%= refCodes.getE02CNOF06().trim().equals("")?"Selected":"" %> value=""  >No Aplica</option>                
                  <option <%= refCodes.getE02CNOF06().trim().equals("1")?"Selected":"" %> value="1"  >No Revolvente</option>
                  <option <%= refCodes.getE02CNOF06().trim().equals("2")?"Selected":"" %> value="2"  >Revolvente</option>
                  <option <%= refCodes.getE02CNOF06().trim().equals("3")?"Selected":"" %> value="3"  >Ambos</option>
                </select>
            </td>
          </tr> 
 		
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="16%" align="right">Maximo Creditos Activos: </td>
            <td nowrap align="left">
               	<input type="text" name="E02CNOMID" size="4" maxlength="4" value="<%= refCodes.getE02CNOMID().trim()%>" onKeypress="enterInteger(event)">
           	</td>
           </tr>
                 
        </table> 
      </td>
    </tr>
  </table>
 
  <br>

 
 
   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction();" >
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  
 
  </form>
  
</body>
	<SCRIPT language="JavaScript">
	
	</SCRIPT> 
	<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
		<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
	<% } %>
</html>


             


