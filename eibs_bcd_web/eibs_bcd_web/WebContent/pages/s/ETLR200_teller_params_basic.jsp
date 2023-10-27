<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<html>
<head>
<title>Control de Parámetros de Caja</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "msgCD" class= "datapro.eibs.beans.ETLR20001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body>
<h3 align="center">Control de Parámetros de Caja<BR><% if (userPO.getPurpose().equals("NEW")) { out.print("Nuevo"); } else { out.print("Mantenimiento"); } %>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="teller_params_basic.jsp, ETLR200"> 
</h3>
<hr size="4">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSETLR200" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Banco : </div>
            </td>
            <td nowrap width="5%" > 
              <div align="left"> 
                <input type="text" name="E01TLRBNK" size="3" maxlength="2" value="<%= msgCD.getE01TLRBNK() %>">
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="right">Moneda : </div>
            </td>
            <td nowrap width="35%" > 
              <div align="left"> 
                <input type="text" name="E01TLRCCY" size="4" maxlength="3" value="<%= msgCD.getE01TLRCCY() %>">
              	<a href="javascript:GetCurrency('E01TLRCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>L&iacute;mites</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">L&iacute;mite Diario de Dep&oacute;sitos en Efectivo : </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="E01TLRLDDE" size="18" maxlength="17" value="<%= msgCD.getE01TLRLDDE() %>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">L&iacute;mite por Transacci&oacute;n de Dep&oacute;sitos en Efectivo : </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="E01TLRLTDE" size="18" maxlength="17" value="<%= msgCD.getE01TLRLTDE() %>" onKeyPress="enterDecimal()">
              </div>
            </td>
          </tr>  
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">L&iacute;mite Diario de Retiros en Efectivo : </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="E01TLRLDWE" size="18" maxlength="17" value="<%= msgCD.getE01TLRLDWE() %>" onKeyPress="enterDecimal()">
              </div>
            </td>
            <td nowrap width="25%" > 
              <div align="right">L&iacute;mite por Transacci&oacute;n de Retiros en Efectivo : </div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="E01TLRLTWE" size="18" maxlength="17" value="<%= msgCD.getE01TLRLTWE() %>" onKeyPress="enterDecimal()">
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
