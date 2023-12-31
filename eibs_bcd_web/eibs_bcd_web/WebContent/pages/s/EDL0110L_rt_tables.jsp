<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Cargos x Servicios</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "rates" class= "datapro.eibs.beans.EDL011002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL011001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


 
</head>

<body bgcolor="#FFFFFF">

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 %> 
 
 
<h3 align="center">Tasas Lideres<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_tables,EDL0110L" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0110L">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="PAG_SCR" VALUE="NEW">
  
  <h4>Informaci&oacute;n  Basica</h4>
 
 	<%int row = 0; %>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">N&uacute;mero de Tabla :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02PRRTBL" size="3" maxlength="2" value="<%= rates.getE02PRRTBL()%>">
             
              </div>
            </td>
            <td nowrap>
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap>                                                                         
              <input type="text" name="E02PRRNME" size="36" maxlength="35" value="<%= rates.getE02PRRNME()%>">              
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Rango Inicial :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02PRRTFR" size="3" maxlength="2" value="<%= rates.getE02PRRTFR()%>">
             
              </div>
            </td>
            <td nowrap>
              <div align="right">Rango Final :</div>
            </td>
            <td nowrap>                                                                         
              <input type="text" name="E02PRRTTO" size="3" maxlength="2" value="<%= rates.getE02PRRTTO()%>">              
            </td>
          </tr>
          
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tipo  Selecci&oacute;n:</div>
            </td>
            <td nowrap width="18%"> 
              <select name="E02PRRTSL">
                <option value="1" <% if (rates.getE02PRRTSL().equals("1")) out.print("selected"); %>>Usar la mas Alta</option>
                <option value="2" <% if (rates.getE02PRRTSL().equals("2")) out.print("selected"); %>>Usar la mas Baja</option>
              </select>
               
            </td>
            <td nowrap width="29%"> 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="31%"> 
              <div align="left">         
        		<eibsinput:date name="rates" fn_year="E02PRREFY" fn_month="E02PRREFM" fn_day="E02PRREFD" /> 
              </div>  
            </td>
          </tr>       
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="22%"> 
              <div align="right">Tasa Primaria :</div>
            </td>
            <td nowrap width="18%"> 
              <div align="left"> 
                <input type="text" name="E02PRRPRT" size="12" maxlength="10" value="<%= rates.getE02PRRPRT()%>" onKeypress="enterRate()">
              </div>
            </td>
            <td nowrap width="29%"> 
              <div align="right">Tasa Secundaria : </div>
            </td>
            <td nowrap width="31%" > 
                 <input type="text" name="E02PRRSRT" size="12" maxlength="10" value="<%= rates.getE02PRRSRT()%>" onKeypress="enterRate()">  
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
