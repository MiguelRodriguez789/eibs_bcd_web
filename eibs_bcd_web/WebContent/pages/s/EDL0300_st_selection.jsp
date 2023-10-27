<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Estado de Cuentas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body >

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% if (userPO.getPurpose().equals("INQUIRY")){ %>
	builtNewMenu(cd_i_opt);
<% } %>

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu(); </SCRIPT>");}
%> 


<h3 align="center"> Estado de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="st_selection.jsp,EDL0300"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDL0300" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PTYP" size="5" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Oficial :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap height="94"> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="27%"> 
              <div align="right"><b>Tipo de Fecha :</b></div>
            </td>
            <td nowrap width="1%">&nbsp;</td>
            <td nowrap width="15%"> 
              <input type="radio" name="E01VALBTH" value="B" checked>
              <b>Fecha Proceso</b><b></b></td>
            <td nowrap width="10%">&nbsp;</td>
            <td nowrap width="47%"> 
              <input type="radio" name="E01VALBTH" value="V">
              <b>Fecha Valor</b></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="27%"> 
              <div align="right"> <b>Seleccionar Fechas desde :</b></div>
            </td>
            <td nowrap width="1%">&nbsp;</td>
            <td nowrap width="15%"> 
              <div align="left"> 
                 <eibsinput:date name="Inquiry" fn_year="E01FRDTEY" fn_month="E01FRDTEM" fn_day="E01FRDTED" /> 
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>hasta :</b></div>
            </td>
            <td nowrap width="47%"> 
              <div align="left"> 
                 <eibsinput:date name="Inquiry" fn_year="E01TODTEY" fn_month="E01TODTEM" fn_day="E01TODTED" /> 
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="27%" height="26"> 
              <div align="right"><b>Seleccionar Montos desde :</b></div>
            </td>
            <td nowrap width="1%" height="26">&nbsp;</td>
            <td nowrap width="15%" height="26"> 
              <div align="left"> 
                <input type="text" name="E01FRAMNT" size="15" maxlength="15" onKeypress="enterDecimal(event, 2)">
              </div>
            </td>
            <td nowrap width="10%" height="26"> 
              <div align="right"><b>hasta :</b></div>
            </td>
            <td nowrap width="47%" height="26"> 
              <div align="left"> 
                <input type="text" name="E01TOAMNT" size="15" maxlength="15" onKeypress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>

  </form>
</body>
</html>
