<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<%@page import="com.datapro.constants.Entities"%> 
<html>
<head>
<title>Conciliacion Bancaria</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ERC000004Message"  scope="session" />
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
	CONSULTA DATOS TRANSACCION
<%} else if (maintenance){ %>
	MANTENIMIENTO DATOS TRANSACCION
<%} else { %>
	NUEVA TRANSACCION
<%} %>

 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnvObj_statement_maintenance.jsp, ERC0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1600">
  <input type=HIDDEN name="E04RCIUID" value="<%= cnvObj.getE04RCIUID().trim()%>">
  <input type=HIDDEN name="E04RCISEQ" value="<%= cnvObj.getE04RCISEQ().trim()%>">
  <input type=HIDDEN name="E04RCICOD" value="<%= cnvObj.getE04RCICOD().trim()%>">
  
 <% int row = 0;%>

<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="20%" align="right"> Codigo Banco : 
              </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="cnvObj" property="E04RCIRBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right"> Nombre : 
               </td>
             <td nowrap width="30%"align="left">
                <input type="text" name="CusName" size="60" maxlength="60" value="<%= userPO.getCusName().trim()%>" readonly>
             </td>
         </tr>
          <tr>
             <td nowrap width="20%" align="right"> Cuenta Banco : </td>
             <td nowrap width="30%" align="left">
	  			<eibsinput:text name="cnvObj" property="E04RCICTA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="20" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right"> Cuenta IBS : </td>
             <td nowrap width="30%"align="left">
                <input type="text" name="Header14" size="13" maxlength="12" value="<%= userPO.getHeader14().trim()%>" readonly>
             </td>
         </tr>
          <tr>
             <td nowrap width="20%" align="right"> Numero de Cartola : </td>
             <td nowrap width="30%" align="left">
                 <eibsinput:text name="cnvObj" property="E04RCISTN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
             </td>
             <td nowrap width="20%" align="right"> Fecha de la Cartola : </td>
             <td nowrap width="30%"align="left">
    	        <eibsinput:date name="cnvObj" fn_year="E04RCISDY" fn_month="E04RCISDM" fn_day="E04RCISDD" readonly="true"/>
             </td>
         </tr>
        </table>
      </td>
    </tr>
</table>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Fecha Transaccion :</div>
            </td>
            <td width="70%" > 
    	        <eibsinput:date name="cnvObj" fn_year="E04RCIBDY" fn_month="E04RCIBDM" fn_day="E04RCIBDD" readonly="<%=readOnly%>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Numero Referencia :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E04RCICKN" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHECK_NUMBER%>" readonly="<%=readOnly%>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Codigo transaccion :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E04RCICDE" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR%>" size="5" maxlength="4" readonly="<%=readOnly%>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Monto :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E04RCIAMT" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Tipo de Monto :</div>
            </td>
            <td width="70%" > 
				<select name="E04RCIDCC" <%=readOnly?"disabled":""%> >
					<option></option>
					<option value="D" <% if (cnvObj.getE04RCIDCC().equals("D")) out.print("selected");%>>Debito</option>
					<option value="C" <% if (cnvObj.getE04RCIDCC().equals("C")) out.print("selected");%>>Credito</option>
				</select>
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
