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

<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX00501Message"  scope="session" />
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

<h3 align="center">Cambio de Sucursal y/o Cuenta Contable Activos Fijos y Amortizaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_change_reference.jsp, EFIX005"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX005" >
  <input type=HIDDEN name="SCREEN" id="SCREEN" value="500">
  
  <%int row = 0; %>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
             <td nowrap width="30%"> 
                <div align="right">Activo Fijo : </div>
             </td>
             <td nowrap width="70%"> 
             	<eibsinput:text property="E01CHGACC" name="fix" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>"/>
             </td>
           </tr>  
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
             <td nowrap width="30%"> 
                <div align="right">Sucursal Anterior : </div>
             </td>
             <td nowrap width="70%"> 
                <input type="text" id="E01CHGOBR" name="E01CHGOBR" size="5" maxlength="4" readonly " value="<%=fix.getE01CHGOBR()%>"> 
                <input type="text" id="E01OLDBRB" name="E01OLDBRB" size="46" maxlength="45" readonly " value="<%=fix.getE01OLDBRN()%>">
             </td>
            </tr> 
            <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
             <td nowrap width="30%"> 
                <div align="right">Cuenta Contable Anterior : </div>
             </td>
             <td nowrap width="70%"> 
                <input type="text" id="E01CHGOGL" name="E01CHGOGL" size="17" maxlength="16" readonly " value="<%=fix.getE01CHGOGL()%>">
                <input type="text" id="E01OLDGLD" name="E01OLDGLD" size="46" maxlength="45" readonly " value="<%=fix.getE01OLDGLD()%>">
             </td> 
            </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos Actualizar</h4>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="30%" > 
              <div align="right">Nueva Sucursal :</div>
            </td>
            <td nowrap colspan="3" width="70%" > 
              <div align="left">
                <input type="text" id="E01CHGNBR" name="E01CHGNBR" size="5" maxlength="4" value="<%= fix.getE01CHGNBR()%>" >
                 <a href="javascript:GetBranch('E01CHGNBR','01','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
                <input type="text" id="E01NEWBRN" name="E01NEWBRN" size="46" maxlength="45" value="<%= fix.getE01NEWBRN()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="30%" >
              <div align="right">Nueva Cuenta Contable :</div>
            </td>
            <td nowrap colspan="3" width="70%" >
              <input type="text" id="E01CHGNGL" name="E01CHGNGL" size="17" maxlength="16" value="<%= fix.getE01CHGNGL()%>" >
              <a href="javascript:GetLedger('E01CHGNGL','01','CNTBCU','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
              <input type="text" id="E01NEWGLD" name="E01NEWGLD" size="46" maxlength="45" value="<%= fix.getE01NEWGLD()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <p>&nbsp;</p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
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
