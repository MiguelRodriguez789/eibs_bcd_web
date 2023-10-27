<%@page import="com.datapro.constants.EntitiesHtml"%>
<%@page import="java.util.logging.Logger"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.constants.Entities"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Entity</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="entity" class="datapro.eibs.beans.ESD400001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<%-- FOR CUSTOMER ADDRESS FORMAT CHANGE VIA AJAX
THERE IS NO FIELD TO STORE THE ADDRESS COUNTRY CODE IN ESD008001 --%> 

<% 
	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
	boolean isReadOnly = isApprovalInquiry || isInquiry;
	boolean isCustomer = !entity.getField("E01RCN").getString().trim().equals("0");  
	String type = userPO.getHeader10(); 
	int row = 0;
%>


</head>
<body>

<script type="text/javascript">
<% if(!isInquiry && !isApprovalInquiry) {%>
	var menu = String('<%= EntitiesHtml.getMenu(userPO) %>');
	builtNewMenu('<%= EntitiesHtml.getMenu(userPO) %>');
	initMenu();
<% }%>
</script>
 
<%  
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");  
%>


<H3 align="center"><%= EntitiesHtml.getTitle(type) %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="entity_maintenance.jsp, ESD4000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
 
<% if(userPO.getAccNum() == null || userPO.getAccNum().trim().equals("")){ %>
 <table class="tableinfo">
  <tr > 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" style="width: 100%; margin:0 auto;"  class="tbhead" >
        <tr>
			<td nowrap width="10%" align="right"> Cliente:</td>
			<td nowrap width="12%" align="left"><%= userPO.getCusNum()%></td>
            <td nowrap width="6%" align="right">ID:  </td>
			<td nowrap width="14%" align="left"><%= userPO.getHeader2()%></td>
			<td nowrap width="8%" align="right"> Nombre: </td>
          <td nowrap width="50%"align="left"><%= userPO.getCusName()%></td>
          <td nowrap width="8%" align="right"> Secuencia: </td>
          <td nowrap width="20%"align="left">
           <input type="text" name="E01SEQ" size="7" maxlength="5" value="<%= entity.getE01SEQ()%>"> 
          </td>  
        </tr>
      </table>
      </td>
      </tr>
 </table>
 <% } else { %>
   <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" style="width: 100%; margin:0 auto; border: 0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="customerNumber" id="customerNumber" size="10" maxlength="9" value="<%= userPO.getCusNum()%>">
               </div> 
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="customerName" id="customerName" size="45" maxlength="45" readonly value="<%= userPO.getCusName()%>">
              </div>
            </td>
            <td nowrap width="16%" align="right"> Secuencia: </td>
          <td nowrap width="20%"align="left">
           <input type="text" name="E01SEQ" size="7" maxlength="5" value="<%= entity.getE01SEQ()%>"> 
          </td>  
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="accountNumber" id="accountNumber" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="currency" id="currency" size="3" maxlength="3" value="<%= userPO.getCurrency()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="product" id="product" size="4" maxlength="4" readonly value="<%= userPO.getProdCode()%>">
                </b> </div>
            </td>
          </tr>
        </table>
        </td>
        </tr>
  </table>
  <% } %>
  
<%-- MAIN BODY TABLE --%>
   <% if (!entity.getE01RTP().equals("1")) { //Others %>
   
 <h4>Datos B&aacute;sicos </h4> 
  	<jsp:include page="ESD4000_basic_info_template.jsp" flush="true" />
  
  <br>
	<%if( ! (type.equals(Entities.ENTITY_TYPE_CUSTOMER_ASSETS) || type.equals(Entities.ENTITY_TYPE_CUSTOMER_LIABILITIES) || type.equals(Entities.ENTITY_TYPE_BANK_REFERENCES))){ %>
	   <h4>Relaci&oacute;n </h4> 
		<jsp:include page="ESD4000_entity_relation_template.jsp" flush="true" />
  
   <% }
	} %>
  <br>
  
     <%if  (!isReadOnly) { %>
       <div align="center"> 
           <input class="EIBSBTN" type=submit name="Submit" value="Enviar">
           <input class="EIBSBTN" type="button" value="Cancelar" onclick="goBack()">
       </div>
     <% } %>  
  </form>
  
<script type="text/javascript">
function goBack(){
	document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4000?SCREEN=100&RECTYP=<%=userPO.getHeader10()%>";  
	document.forms[0].submit();
}
</script>  
</body>
</HTML>
