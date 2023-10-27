<html>
<head>
<title>Codigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "lcCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/dynlayer.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/pop_out.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/nav_aid.js"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	var myNavAid = new NavAid(10, 10, lc_i_w, lc_i_h);
	
	myNavAid.Position = "top";
	myNavAid.html = lc_i_opt;
	
	myNavAid.build();

function init() {
	myNavAid.activate();
}

window.onload = init;


</SCRIPT>
</head>
<body>


 <%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> document.write(myNavAid.div) </SCRIPT>");

%>

<h3 align="center">C&oacute;digos Especiales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_inq_codes.jsp,ELC0450"></h3>
<hr size="4">
 <FORM >

  <table cellspacing="0" cellpadding="2" width="100%" border="1" bordercolor="#000000">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>C&oacute;digos de Clasificaci&oacute;n</h4>
  
  <%int row = 0; %>
  <table cellpadding=2 cellspacing=0 width="100%" border="1" bordercolor="#000000"  >
    <tr bordercolor="#FFFFFF">
      <td nowrap >
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">Oficial Principal :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02OFC" size="5" maxlength="4" value="<%= lcCodes.getE02OFC().trim()%>" readonly>
              <input type="text" name="D02OFC" size="40" maxlength="35" value="<%= lcCodes.getD02OFC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%" >
              <div align="right">Oficial Secundario :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02OF2" size="5" maxlength="4" value="<%= lcCodes.getE02OF2().trim()%>" readonly>
              <input type="text" name="D02OF2" size="40" maxlength="35" value="<%= lcCodes.getD02OF2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">C&oacute;digo de Industria :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02INC" size="5" maxlength="4" value="<%= lcCodes.getE02INC().trim()%>" readonly>
              <input type="text" name="D02INC" size="40" maxlength="35" value="<%= lcCodes.getD02INC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="3%">
              <div align="right">C&oacute;digo de Negocio :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02BUC" size="5" maxlength="4" value="<%= lcCodes.getE02BUC().trim()%>" readonly>
              <input type="text" name="D02BUC" size="40" maxlength="35" value="<%= lcCodes.getD02BUC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02GEC" size="5" maxlength="4" value="<%= lcCodes.getE02GEC().trim()%>" readonly>
              <input type="text" name="D02GEC" size="40" maxlength="35" value="<%= lcCodes.getD02GEC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">Pa&iacute;s de Riesgo :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02GRC" size="5" maxlength="4" value="<%= lcCodes.getE02GRC().trim()%>" readonly>
              <input type="text" name="D02GRC" size="40" maxlength="35" value="<%= lcCodes.getD02GRC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">C&oacute;digo de Usuario 1 :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02UC1" size="5" maxlength="4" value="<%= lcCodes.getE02UC1().trim()%>" readonly>
              <input type="text" name="D02UC1" size="40" maxlength="35" value="<%= lcCodes.getD02UC1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">C&oacute;digo de Usuario 2 :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02UC2" size="5" maxlength="4" value="<%= lcCodes.getE02UC2().trim()%>" readonly>
              <input type="text" name="D02UC2" size="40" maxlength="35" value="<%= lcCodes.getD02UC2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">C&oacute;digo de Usuario 3 :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02UC3" size="5" maxlength="4" value="<%= lcCodes.getE02UC3().trim()%>" readonly>
              <input type="text" name="D02UC3" size="40" maxlength="35" value="<%= lcCodes.getD02UC3().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">C&oacute;digo de Usuario 4 :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02UC4" size="5" maxlength="4" value="<%= lcCodes.getE02UC4().trim()%>" readonly>
              <input type="text" name="D02UC4" size="40" maxlength="35" value="<%= lcCodes.getD02UC4().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">Origen de los Fondos :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02ORG" size="5" maxlength="4" value="<%= lcCodes.getE02ORG().trim()%>" readonly>
              <input type="text" name="D02ORG" size="40" maxlength="35" value="<%= lcCodes.getD02ORG().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="30%">
              <div align="right">Destino de los Fondos :</div>
            </td>
            <td nowrap width="70%">
              <input type="text" name="E02DST" size="5" maxlength="4" value="<%= lcCodes.getE02DST().trim()%>" readonly>
              <input type="text" name="D02DST" size="40" maxlength="35" value="<%= lcCodes.getD02DST().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

