<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Mantenimiento de Plan de Redescuentos </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="recData" class="datapro.eibs.beans.EDL055001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>



<script type="text/javascript">

 function goAction(op) {
	
	getElement("SCREEN").value = op;
	document.forms[0].submit();
 }
 
 $().ready(function(){
	$('td').attr("nowrap","nowrap"); 
 });
 
 </script>
</head>

<%
	boolean maintenance=false;
	boolean readOnly = false;
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
<% if("1".equals( currUser.getH01WK1()) ){ %>      
	Consulta Paquete de Redescuentos
<% 	readOnly = true;
   }else if (maintenance){ %>
	Mantenimiento Paquete de Redescuentos
<%} else { %>
	Nuevo Paquete de Redescuentos
<%} %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="plan_fomento_activos_detalles.jsp, EDL0550"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0550" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
	<INPUT TYPE="hidden" NAME="H01FLGMAS" value="A"> 
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		  <tr id="trdark">
            <td nowrap width="10%" align="right"> Codigo :</td>          
            <td nowrap align="left" width="10%">
              <input type="text" name="E01PDSCOD" size="5" maxlength="4" value="<%= recData.getE01PDSCOD()%>" readonly >
            </td> 
            <td nowrap width="10%" align="right"></td>
            <td nowrap width="70%" align="left"></td>                    
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Detalles </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Nombre del Paquete :</div>
            </td>
            <td width="35%" > 
              <eibsinput:text name="recData" property="E01PDSNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/>
            </td>
            <td width="15%"><div align="right"></div></td>
            <td width="35%"></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" > 
              <div align="right">Entidad de Redescuento :</div>
            </td>
            <td width="35%" > 
              <eibsinput:text name="recData" property="E01PDSREC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="false" />
              <a href="javascript:GetFomento('E01PDSREC','0','','E01CUSNA1')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" ></a>
              <eibsinput:text name="recData" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td width="15%"><div align="right"></div></td>
            <td width="35%"></td>
          </tr>
          
          <% if (!recData.getE01PDSFRD().trim().equals("")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="15%" ><div align="right">Fecha Relacion :</div></td>
            <td width="35%" >
              <eibsinput:date name="recData" fn_month="E01PDSFRM" fn_day="E01PDSFRD" fn_year="E01PDSFRY" readonly="true"/> 
            </td>
            <td width="15%"><div align="right"></div></td>
            <td width="35%"></td>
          </tr>
          <% } %>

        </table>
      </td>
    </tr>
  </table>
  
<br>
  
      <div align="center" style="width:95%"> 
 	<% if( !"1".equals( currUser.getH01WK1()) ){ %>      
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <% } %> 
          <input class="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(500);">
      </div>
  </form>
</body>
</HTML>
