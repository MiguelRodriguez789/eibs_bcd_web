<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Maestro de Agencias</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="ovRates" class="datapro.eibs.beans.EDD050501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<H3 align="center">Tablas de Colocaciones a 24 Horas (Overnight)<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="overnight_rates_detail.jsp, EDD0505"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDD0505" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> <b> 
                <input type="text" name="E01ONRBNK" size="3" maxlength="2"  value="<%= ovRates.getE01ONRBNK().trim()%>" >
                </b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><b><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01ONRCCY" size="4"  maxlength="3" value="<%= ovRates.getE01ONRCCY().trim()%>">
                <a href="javascript:GetCurrency('E01ONRCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
                </font></font></font></b></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" >  
              <div align="right"><b>Tabla :</b></div>
            </td>
            <td nowrap width="25%" > <b> 
              <input type="text" name="E01ONRTBL" size="3" maxlength="2"  value="<%= ovRates.getE01ONRTBL().trim()%>" >
              </b></td>
            <td nowrap width="10%" > 
              <div align="right"><b>Fecha Efectiva :</b></div>
            </td>
            <td nowrap colspan="3" ><b> 
				<eibsinput:date name="ovRates" fn_year="E01ONREMY" fn_month="E01ONREMM" fn_day="E01ONREMD" />
              </b></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>&nbsp;</h4>  
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width="5%">
       		</td>
            <td nowrap width="5%"> 
              <div align="center"><b>Tasa de Intereses por Monto</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="left"><b>Tasas</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%" height="23"> 
              <div align="right">Mayor o Igual :</div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM1" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM1().trim()%>" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="left"> 
                <input type="text" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE1().trim()%>" name="E01ONRTE1" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%" height="19"> 
              <div align="right">Mayor o Igual :</div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM2" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM2().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="left"> 
                <input type="text" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE2().trim()%>" name="E01ONRTE2" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%" height="19"> 
              <div align="right">Mayor o Igual :</div>
            </td>
            <td nowrap width="5%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM3" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM3().trim()%>" >
              </div>
            </td>
            <td nowrap width="5%" height="19"> 
              <div align="left"> 
                <input type="text" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE3().trim()%>" name="E01ONRTE3" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%" height="19"> 
              <div align="right">Mayor o Igual :</div>
            </td>
            <td nowrap width="5%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM4" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM4().trim()%>" >
              </div>
            </td>
            <td nowrap width="5%" height="19"> 
              <div align="left"> 
                <input type="text" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE4().trim()%>" name="E01ONRTE4" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%" height="19"> 
              <div align="right">Mayor o Igual :</div>
            </td>
            <td nowrap width="5%" height="19"> 
              <div align="center"> 
                <input type="text" name="E01ONRAM5" size="17" maxlength="15" value="<%= ovRates.getE01ONRAM5().trim()%>" >
              </div>
            </td>
            <td nowrap width="5%" height="19"> 
              <div align="left"> 
                <input type="text" size="10" maxlength="9" value="<%= ovRates.getE01ONRTE5().trim()%>" name="E01ONRTE5" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="5%" height="19"> 
              <div align="right">Base usada para el C&aacute;lculo :</div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" size="4" maxlength="3" value="<%= ovRates.getE01ONRBAS().trim()%>" name="E01ONRBAS" >
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
