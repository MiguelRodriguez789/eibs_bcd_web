<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<%@page import="com.datapro.constants.Entities"%> 
<html>
<head>
<title>Plataforma de Venta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.EPV118501Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSBillsP.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

 builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
	init(opth,field,bank,ccy,field1,field2,opcod);
	showPopupHelp();
}

 </script>
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
	CONSULTA SEGUROS EN PLATAFORMA DE VENTA
<%} else if (maintenance){ %>
	MANTENIMIENTO SEGUROS EN PLATAFORMA DE VENTA
<%} else { %>
	NUEVO SEGUROS EN PLATAFORMA DE VENTA
<%} %>

 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="PVSGT_maintenance.jsp, EPV1185"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1185" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01UBK" value="<%= currUser.getE01UBK().trim()%>">
  
 <% int row = 0;%>
 
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Codigo Seguro :</div>
            </td>
            <td width="70%" > 
	             <eibsinput:text property="E01PSTDED" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER%>" readonly="true"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="30%" > 
              <div align="right">Nombre :</div>
            </td>
            <td width="70%" > 
                 <eibsinput:text property="E01PSTNME" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" readonly="true"/>
	        </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%" > 
              <div align="right">Forma de Cobro :</div>
            </td>
            <td width="60%" > 
               <select name="E01PSTCOP" <%=readOnly?"disabled":""%>>
                    <option value=" " <% if (!(cnvObj.getE01PSTCOP().equals("O")||cnvObj.getE01PSTCOP().equals("L"))) out.print("selected"); %>> 
                    </option>
                    <option value="O" <% if (cnvObj.getE01PSTCOP().equals("O")) out.print("selected"); %>>Apertura</option>
                    <option value="L" <% if (cnvObj.getE01PSTCOP().equals("L")) out.print("selected"); %>>Pago Cuotas</option>                   
                  </select>
	        </td>
           </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="40%" > 
              <div align="right">Pre Seleccionado :</div>
            </td>
            <td width="60%" > 
 		       <p> 
                 <input type="radio" name="E01PSTREQ"  value="Y" <%if (cnvObj.getE01PSTREQ().equals("Y")) out.print("checked"); %>>
                  Si 
                 <input type="radio" name="E01PSTREQ"  value="N" <%if (cnvObj.getE01PSTREQ().equals("N")) out.print("checked"); %>>
                  No 
               </p> 
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
