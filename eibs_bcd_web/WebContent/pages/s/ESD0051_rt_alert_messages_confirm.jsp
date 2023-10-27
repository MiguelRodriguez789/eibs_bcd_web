<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Mensajes de Alerta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
 function finish(){
         self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
  }

</SCRIPT>

</head>


<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 
<H3 align="center"> Alta Masiva de Instrucciones Especiales


<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_alert_messages_confirm.jsp, ESD0051"></H3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0051" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="44">
    <table class="tableinfo">
    <tr > 
      <td height="409"> 
        <p align="center">&nbsp; </p>
        <table width="100%">
          <tr> 
            <td width="2%" height="20">&nbsp;</td>
            <td width="34%" height="20"> 
              <div align="right"></div>
            </td>
            <td width="64%" height="20"> 
              <div align="center"></div>
            </td>
          </tr>
          <tr> 
            <td width="2%">&nbsp;</td>
            <td width="34%"> 
              <div align="right"></div>
            </td>
            <td width="64%">&nbsp;</td>
          </tr>
           <tr> 
            <td colspan="3" "width="100%">
              <div align="center">Los Mensajes de alerta han sido Procesados Satisfactoriamente</div>
            </td>
          </tr>
         <tr>
            <td width="2%">&nbsp;</td>
            <td width="34%">&nbsp;</td>
            <td width="64%">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="3" "width="100%">
              <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="finish()" ></div>
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <div align="center"> 
    <p>&nbsp;</p>
    </div>
</form>
</body>
</html>
