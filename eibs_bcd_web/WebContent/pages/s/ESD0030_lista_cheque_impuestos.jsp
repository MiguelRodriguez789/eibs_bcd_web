<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT Language="javascript">
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

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
 
	document.forms[0].SCREEN.value = op;
	document.forms[0].submit();

}

</script>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<H3 align="center">Códigos de Referencia del Sistema <br> <%= userPO.getSource()%> 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lista_cheque_impuestos.jsp;ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
   <input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="<%= refCodes.getE02CNORCD().trim()%>">
   <input type=HIDDEN name="TABLECODE" id="TABLECODE" value="<%= refCodes.getE02CNOCFL().trim()%>">
   <input type=HIDDEN name="NMECIA" id="NMECIA" value="">

    <% int row = 0;%>
  <h4>Información Básica</h4>
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
              <div align="right">Casilla :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left">  
                	<input type="text" name="E02CNORCD" size="5" maxlength="2" value="<%= refCodes.getE02SETRCD().trim()%>">           
              </div>
            </td>
          </tr>
 	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left">             
                	<input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>    
 	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right">Condición :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left">             
                	<input type="text" name="E02CNOEML" size="50" maxlength="45" value="<%= refCodes.getE02CNOEML().trim()%>" >
              </div>
            </td>
          </tr>                   
          
<!-- 
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">N&uacute;mero de Referencia :</div>
              </td>
              <td nowrap height="19"> 
                <div align="left"> 
                  <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                </div>
              </td>
          </tr>
 -->
        </table>
      </td>
    </tr>
  </table>
  
  
  <div align="center">
   <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
  	<input align="left" id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="pasar();goAction(600);"> &nbsp;
   <%}%>
  	<input align="right" id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(400);">
  </div>
  

</form>
</body>
  <script >
     
      function pasar(){
      	if(isValidObject(document.forms[0].oculto)){
	        var x=document.forms[0].oculto.value;
	          if(x==1){
	             document.forms[0].E02CNORUT.value= document.forms[0].VALOR.value;
	                 }
		}
	}
  </script>
</html>
