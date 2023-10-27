<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Reintegro/Reversión de Comisiones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="refCode" class="datapro.eibs.beans.ESD020601Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {

	document.forms[0].SCREEN.value = op;
	if (op == '3') {
    	if (confirm("Desea eliminar este registro seleccionado?")) {
			document.forms[0].submit();		
    	}
  	} else {
		document.forms[0].submit();		
	}
}

</script>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
	 out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<H3 align="center">
<% if (userPO.getPurpose().equals("MAINTENANCE"))  { %>
Reintegro de Comisiones
<% } else { %>
Reversión de Comisiones
<% } %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reversal_fees_det.jsp , ESD0206"> 
</H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0206" >
  
  <input type=HIDDEN name="SCREEN" value="300">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="2">

  <input type=HIDDEN name="E01CACBNK" value="<%= userPO.getBank().trim()%>">
  <input type=HIDDEN name="E01CACBRN" value="<%= userPO.getBranch().trim()%>">

<% if (userPO.getPurpose().equals("REVERSAL"))  { %>
  <input type=HIDDEN name="H01FLGWK1" value="R">
<% } else { %>
  <input type=HIDDEN name="H01FLGWK1" value="I">
<% } %>
 
 
   <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"><b> 
                <input type="text" readonly name="E01CACCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="30%"  > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E02CUSNA1" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                </font></font></font></div>
            </td>
			<td nowrap width="10%">
			</td>
			<td nowrap width="20%">
			</td>
			</tr>
          <tr id="trdark"> 
            <td nowrap width="10%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01CACACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"><b> 
                <input type="text" name="E01CACCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><b> 
                <input type="text" name="E01CACPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<BR>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Secuencia :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="refCode" property="E01CACSEQ" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" readonly="true" />
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Fecha Proceso :</div>
            </td>
            <td nowrap width="60%"> 
    	        <eibsinput:date name="refCode" readonly="false" fn_year="E01CACRDY" fn_month="E01CACRDM" fn_day="E01CACRDD" readonly="true" />
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
          <div align="right">Código de Comisión :</div>
            </td>
            <td nowrap width="60%"> 
	          <div align="left"> 
	            <input type="text" name="E01CACCDE" size="5" maxlength="4"  value="<%=refCode.getE01CACCDE().trim()%>" readonly>
	            <a href="javascript:GetCommDef('E01CACCDE','D01CACCDE')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
	            <input type="text" name="D01CACCDE" readonly size="35" maxlength="30" >
	          </div>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
          <div align="right">Monto Comisión :</div>
            </td>
            <td nowrap width="60%"> 
	          <div align="left"> 
	            <input type="text" name="E01CACCOA" size="16" maxlength="15"  value="<%=refCode.getE01CACCOA().trim()%>" readonly>
	          </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
  </form>
</body>
</html>
