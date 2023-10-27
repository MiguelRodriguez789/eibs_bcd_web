<html>
<head>
<title>Codigos de Referencia - Detalle Tipo 14</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
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

<H3 align="center">C&oacute;digos de Referencia del Sistema - Detalle Tipo 14 <br> <%= userPO.getSource()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_generic_short_codes_extended.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
   <input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="<%= refCodes.getE02CNORCD().trim()%>">
   <input type=HIDDEN name="TABLECODE" id="TABLECODE" value="<%= refCodes.getE02CNOCFL().trim()%>">
   
  <% int row = 0;%>
  <h4>Información Básica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <!-- Principal -->
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
              <div align="right">Código :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="5" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  <h4>Referencias Tipo Usuario</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <!-- Users -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 1:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOUS1" size="5" maxlength="4" value="<%= refCodes.getE02CNOUS1() %>" >
             [Carácter (4)]</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 2:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOUS2" size="5" maxlength="4" value="<%= refCodes.getE02CNOUS2() %>" >
             [Carácter (4)]</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 3:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOUS3" size="5" maxlength="4" value="<%= refCodes.getE02CNOUS3() %>" >
             [Carácter (4)]</div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  <h4>Referencias Tipo Bandera</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <!-- Flags -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 4:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOF01" size="2" maxlength="1" value="<%= refCodes.getE02CNOF01() %>" >
             [Carácter (1)]</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 5:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOF03" size="2" maxlength="1" value="<%= refCodes.getE02CNOF03() %>" >
             [Carácter (1)]</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 6:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOF04" size="2" maxlength="1" value="<%= refCodes.getE02CNOF04() %>" >
             [Carácter (1)]</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 7:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOF05" size="2" maxlength="1" value="<%= refCodes.getE02CNOF05() %>" >
             [Carácter (1)]</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 8:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOF06" size="2" maxlength="1" value="<%= refCodes.getE02CNOF06() %>" >
             [Carácter (1)]</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 9:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOF07" size="2" maxlength="1" value="<%= refCodes.getE02CNOF07() %>" >
             [Carácter (1)]</div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  <h4>Otras Referencias</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <!-- Especificos -->
          <!-- Valor de Referencia 1 CNOSCG -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 10:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG() %>" onkeypress="enterInteger(event)">
             [Numérico (16)]</div>
            </td>
          </tr>
          <!-- Valor de Referencia 2 CNORUT -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 11:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNORUT" size="30" maxlength="25" value="<%= refCodes.getE02CNORUT() %>" >
             [Carácter (25)]</div>
            </td>
          </tr>
          <!-- Valor de Referencia 3 CNOPHN -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Referencia 12:</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOPHN" size="18" maxlength="15" value="<%= refCodes.getE02CNOPHN() %>" onkeypress="enterInteger(event)">
             [Numérico (15)]</div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  <table width="100%">		
  	<tr>
  		<td width="50%" align="center">
  		   <%if(!userPO.getPurpose().equals("INQUIRY")) {%>    		
  			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(600);">
  			   <%}%>
     	 </td>
  		<td width="50%" align="center">
     		<input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(400);">
  		</td>
  	</tr>	
  </table>	
 
  </form>
</body>
</html>
