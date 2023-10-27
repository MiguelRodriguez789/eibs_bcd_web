<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Activos Fijos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX10001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</head>
<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<h3 align="center">Parametros de Control de Activos Fijos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_parameters, EFIX100"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX100" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="400">
  
  <%int row = 0; %>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="15%" >
              <div align="right">Banco :</div>
            </td>
            <td nowrap colspan="3" width="85%" > 
              <div align="left"> 
                  <eibsinput:text property="E01FIXBNK" name="fix" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="28%" > 
              <div align="right">Contabiliza Depreciaci&oacute;n :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="radio" id="E01FIXGIN" name="E01FIXGIN" value="Y"  <%if (fix.getE01FIXGIN().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" id="E01FIXGIN" name="E01FIXGIN" value="N"  <%if (fix.getE01FIXGIN().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="28%" > 
              <div align="right">Contabiliza en Otra Agencia :</div>
            </td>
            <td nowrap width="7%" >
              <input type="radio" id="E01FIXCDO" name="E01FIXCDO" value="Y"  <%if (fix.getE01FIXCDO().equals("Y")) out.print("checked"); %>>
              S&iacute; 
              <input type="radio" id="E01FIXCDO" name="E01FIXCDO" value="N"  <%if (fix.getE01FIXCDO().equals("N")) out.print("checked"); %>>
              No </td>
            <td nowrap width="21%" > 
              <div align="right">Agencia a Contabilizar :</div>
            </td>
            <td nowrap width="44%" >
              <input type="text" id="E01FIXCBR" name="E01FIXCBR" size="5" maxlength="4" onKeyPress="enterInteger(event)" value="<%= fix.getE01FIXCBR()%>">
              <a href="javascript:GetBranch('E01FIXCBR',document.getElementById('E01FIXBNK').value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="middle" border="0" ></a></td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="28%" > 
              <div align="right">Porcentaje de Ajuste por Inflaci&oacute;n :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
               <input type="text" id="E01FIXRTI" name="E01FIXRTI" size="7" maxlength="6" value="<%= fix.getE01FIXRTI()%>" onKeypress="enterDecimal(3)">
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="28%" > 
              <div align="right">D&iacute;a M&iacute;nimo del Mes a Calcular Depreciaci&oacute;n 
                :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="text" id="E01FIXDCM" name="E01FIXDCM" size="3" maxlength="2" value="<%= fix.getE01FIXDCM()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="28%" > 
              <div align="right">Para Compras se Deprecia todo el Mes :</div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
                <input type="radio" id="E01FIXDTM" name="E01FIXDTM" value="Y"  <%if (fix.getE01FIXDTM().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" id="E01FIXDTM" name="E01FIXDTM" value="N"  <%if (fix.getE01FIXDTM().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">
 <div align="center"> 
	      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>      </td>
    </tr>
  </table>
  </form>
</body>
</html>
