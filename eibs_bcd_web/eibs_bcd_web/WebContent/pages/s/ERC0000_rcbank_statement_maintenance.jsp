<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<%@page import="com.datapro.constants.Entities"%> 
<html>
<head>
<title>Conciliacion Bancaria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ERC000002Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
%> 
          
<%
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
%>
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA DATOS CARTOLA
<%} else if (maintenance){ %>
	MANTENIMIENTO DATOS CARTOLA
<%} else { %>
	NUEVA CARTOLA
<%} %>

 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rcbank_statement_maintenance.jsp, ERC0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01UBK" value="<%= currUser.getE01UBK().trim()%>">
  
 <% int row = 0;%>
 
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Codigo :</div>
            </td>
            <td width="70%" > 
	             <eibsinput:text property="E02RCSRBK" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Numero de Cuenta Banco :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E02RCSCTA" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR%>" size="20" maxlength="20" readonly="true"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Numero de Cartola :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E02RCSSTN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Fecha de la Cartola :</div>
            </td>
            <td width="70%" > 
    	        <eibsinput:date name="cnvObj" fn_year="E02RCSSDY" fn_month="E02RCSSDM" fn_day="E02RCSSDD" readonly="true"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Balance Inicial :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E02RCSBBL" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly %>"/>
	        </td>
           </tr>

        </table>
      </td>
    </tr>
  </table>

<%if  (!readOnly) { %>
    <div align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
    </div>
<% } %>  

  </form>
</body>
</HTML>
