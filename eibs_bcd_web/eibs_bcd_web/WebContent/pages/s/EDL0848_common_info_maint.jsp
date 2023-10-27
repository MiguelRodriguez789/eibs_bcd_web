<html> 
<head>
<title>Mantenimiento de Datos Comunes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="msgCD" class="datapro.eibs.beans.EDL084801Message"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
  <h3 align="center">Mantenimiento de Datos Comunes<br>Mantenimiento<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="common_info_maint.jsp, EDL0848"> 
  </h3>
  <hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0848" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E01DLRRTP" VALUE="<%= msgCD.getE01DLRRTP() %>">
<%int row1 = 0; %>
  <% if (currUser.getE01INT().equals("04") ) { %>
    <table class="tableinfo">
      <tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
              <td nowrap width="40%"> 
                <div align="right">Código :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRCOD" size="7" maxlength="6" value="<%= msgCD.getE01DLRCOD() %>" readonly>
              </td>
            </tr>

            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
              <td nowrap width="40%"> 
                <div align="right">Nombre :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRNME" size="48" maxlength="45" value="<%= msgCD.getE01DLRNME() %>">
              </td>
            </tr>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            	<td nowrap width="40%"> 
                	<div align="right">Identificación :</div>
              	</td>
              	<td nowrap width="60%">  
                	<input type="text" name="E01DLRIDN" size="26" maxlength="25" value="<%= msgCD.getE01DLRIDN() %>">
             	 </td>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            	<td nowrap width="40%"> 
                <div align="right">Teléfono :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRPHN" size="16" maxlength="15" value="<%= msgCD.getE01DLRPHN() %>">
              </td> 	 
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
              <td nowrap width="40%"> 
                <div align="right">Pais :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRCOC" size="5" maxlength="4" value="MX">
              <!--   <a href="javascript:GetCodeDescCNOFC('E01DLRCOC','E01DLRCTR','03')" id="countryhelp">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> --> 
                <input type="text" name="E01DLRCTR" size="36" maxlength="35" value="MEXICO">
              </td>
            </tr>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
              <td nowrap width="40%"> 
                <div align="right">Calle :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRDCA" size="42" maxlength="40" value="<%= msgCD.getE01DLRDCA() %>">
              </td>
            </tr>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
              <td nowrap width="40%"> 
                <div align="right">Numero Exterior :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRDNE" size="11" maxlength="10" value="<%= msgCD.getE01DLRDNE() %>">
              </td>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
              <td nowrap width="40%"> 
                <div align="right">Numero Interior :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRDNI" size="11" maxlength=10" value="<%= msgCD.getE01DLRDNI() %>">
              </td>
            </tr>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
              <td nowrap width="40%"> 
                <div align="right">Codigo Postal :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRZPC" size="16" maxlength="15" value="<%= msgCD.getE01DLRZPC() %>" readonly>
                <a href="javascript:GetSEPOMEXData('E01DLRZPC', 'E01DLRDCO', 'E01DLRDMU', 'E01DLRCIU', 'E01DLRDES')" > 
					<img src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" > </a>
                
              </td>
            </tr>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
              <td nowrap width="40%"> 
                <div align="right">Colonia :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRDCO" size="31" maxlength="30" value="<%= msgCD.getE01DLRDCO() %>" readonly>
              </td>
            </tr>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
              <td nowrap width="40%"> 
                <div align="right">Municipio/Delegacion :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRDMU" size="31" maxlength="30" value="<%= msgCD.getE01DLRDMU() %>" readonly>
              </td>
            </tr>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
              <td nowrap width="40%"> 
                <div align="right">Ciudad :</div>
              </td>
              <td nowrap width="60%">  
                <!--  <input type="text" name="E01DLRCIT" size="5" maxlength="4" value="<%= msgCD.getE01DLRCIT() %>"> -->
                <input type="text" name="E01DLRCIU" size="31" maxlength="30" value="<%= msgCD.getE01DLRCIU() %>" readonly>
              </td>
              <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
              <td nowrap width="40%"> 
                <div align="right">Estado :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRDES" size="46" maxlength="45" value="<%= msgCD.getE01DLRDES() %>" readonly>
              </td>
            </tr>
            </tr>
            <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
              <td nowrap width="40%"> 
                <div align="right">Agencia :</div>
              </td>
              <td nowrap width="60%">  
                <input type="text" name="E01DLRBRN" size="5" maxlength="4" value="<%= msgCD.getE01DLRBRN() %>">
                <input type="text" name="D01DLRBRN" size="46" maxlength="45" value="<%= msgCD.getD01DLRBRN() %>">
				<a href="javascript:GetBranch('E01DLRBRN','','D01DLRBRN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  <% } else { %>
  <table class="tableinfo">
      <tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="16%"> 
                <div align="right">Código :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRCOD" size="7" maxlength="6" value="<%= msgCD.getE01DLRCOD() %>" readonly>
              </td>
              <td nowrap width="16%"> 
              </td>
              <td nowrap width="20%">  
              </td>
            </tr>

            <tr id="trclear"> 
              <td nowrap width="16%"> 
                <div align="right">Nombre :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRNME" size="48" maxlength="45" value="<%= msgCD.getE01DLRNME() %>">
              </td>
              <td nowrap width="16%"> 
              </td>
              <td nowrap width="20%">  
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="16%"> 
                <div align="right">Dirección 1 :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRAD1" size="48" maxlength="45" value="<%= msgCD.getE01DLRAD1() %>">
              </td>
              <td nowrap width="16%"> 
                <div align="right">Identificación :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRIDN" size="26" maxlength="25" value="<%= msgCD.getE01DLRIDN() %>">
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="16%"> 
                <div align="right">Dirección 2 :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRAD2" size="48" maxlength="45" value="<%= msgCD.getE01DLRAD2() %>">
              </td>
              <td nowrap width="16%"> 
                <div align="right">Teléfono :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRPHN" size="16" maxlength="15" value="<%= msgCD.getE01DLRPHN() %>">
              </td>
            </tr>
            <tr id="trdark"> 
              <td nowrap width="16%"> 
                <div align="right">Estado/Provincia :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRCOM" size="5" maxlength="4" value="<%= msgCD.getE01DLRCOM() %>">
                <input type="text" name="D01DLRNME" size="46" maxlength="45" value="<%= msgCD.getD01DLRNME() %>">
			    <a href="javascript:GetCodeDescCNOFC('E01DLRCOM','D01DLRNME','PV')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
              </td>
              <td nowrap width="16%"> 
                <div align="right">Ciudad :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRCIT" size="5" maxlength="4" value="<%= msgCD.getE01DLRCIT() %>">
 				<a href="javascript:GetCNOFCFilteredCodes('E01DLRCIT','',document.forms[0].E01DLRCOM.value,'84')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
              </td>
            </tr>
            <tr id="trclear"> 
              <td nowrap width="16%"> 
                <div align="right">Agencia :</div>
              </td>
              <td nowrap width="20%">  
                <input type="text" name="E01DLRBRN" size="5" maxlength="4" value="<%= msgCD.getE01DLRBRN() %>">
                <input type="text" name="D01DLRBRN" size="46" maxlength="45" value="<%= msgCD.getD01DLRBRN() %>">
				<a href="javascript:GetBranch('E01DLRBRN','','D01DLRBRN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
              </td>
              <td nowrap width="16%"> 
              </td>
              <td nowrap width="20%">  
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
   <% } %>
  <BR>
<p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
</p>
      
</form>
</body>
</html>
