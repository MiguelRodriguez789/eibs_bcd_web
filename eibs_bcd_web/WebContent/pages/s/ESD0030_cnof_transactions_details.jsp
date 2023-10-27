<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Codigos de Referencia</title>
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

<H3 align="center">Códigos de Referencia del Sistema <br> <%= userPO.getSource()%> 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_transactions_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
   <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
   <input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="<%= refCodes.getE02CNORCD().trim()%>">
   <input type=HIDDEN name="TABLECODE" id="TABLECODE" value="<%= refCodes.getE02CNOCFL().trim()%>">
   <input type=HIDDEN name="NMECIA" id="NMECIA" value="">

    <% int row = 0;%>
  <h4>Informaci&oacute;n B&aacute;sica</h4>
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
              <div align="right">Código :</div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" name="E02CNORCD" size="4" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
                <input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
              </div>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Número de Lote :</div>
            </td>
            <td nowrap height="19"> 
                  <input type="text" name="E02CNOFRP" size="17" maxlength="16" value="<%= refCodes.getE02CNOFRP().trim()%>">
            </td>
          </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Cuenta Contable :</div>
              </td>
              <td nowrap height="19"> 
                <div align="left"> 
                  <input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                  <a href="javascript:GetLedger('E02CNOSCG','','','')"> 
                  <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" > </a>
                </div>
              </td>
          </tr>

              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="16%" height="19" align="right">Tipo de Transacción :</td>
                <td nowrap width="34%" align="left">
                  <input type="text" name="E02CNOCPC" size="5" maxlength="4" value="<%= refCodes.getE02CNOCPC().trim()%>">
                </td>
              </tr> 

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Programa a Ejecutar :</div>
              </td>
              <td nowrap height="19"> 
                <div align="left"> 
                  <input type="text" name="E02CNOMID" size="7" maxlength="6" value="<%= refCodes.getE02CNOMID().trim()%>">
                </div>
              </td>
          </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Mnemónico Débito :</div>
              </td>
              <td nowrap height="19"> 
                <div align="left"> 
                <input type="text" name="E02CNODCC" size="3" maxlength="2" value="<%= refCodes.getE02CNODCC() %>">
                <a href="javascript:GetCodeCNOFC('E02CNODCC','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
                </div>
              </td>
          </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Mnemónico Crédito :</div>
              </td>
              <td nowrap height="19"> 
                <div align="left"> 
                <input type="text" name="E02CNOACD" size="3" maxlength="2" value="<%= refCodes.getE02CNOACD() %>">
                <a href="javascript:GetCodeCNOFC('E02CNOACD','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
                </div>
              </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Cantidad de Transacciones Exentas :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST() %>" onKeypress="enterDecimal(event, 0)">
             </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="16%" height="19"> 
               <div align="right">Código de Comisión :</div>
             </td>
             <td nowrap height="19"> 
               <input type="text" name="E02CNOMIC" size="4" maxlength="5" value="<%=refCodes.getE02CNOMIC().trim()%>" readonly>
                 <a href="javascript:GetCommDef('E02CNOMIC','E02DSCUS1')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
                  <input type="text" name="E02DSCUS1" readonly size="60" maxlength="60" value="<%=refCodes.getE02DSCUS1().trim()%>">
             </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right">Comisión por Sobregiro :</div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" name="E02CNOPXT" size="5" maxlength="4" value="<%= refCodes.getE02CNOPXT() %>">
             </div>
            </td>
          </tr>


        </table>
      </td>
    </tr>
  </table>
  
  <table width="100%">		
  	<tr>
  		<td width="50%" align="center">
  			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(600);">
     	 </td>
  		<td width="50%" align="center">
     		<input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(400);">
  		</td>
  	</tr>	
  </table>	

</form>
</body>
</html>
