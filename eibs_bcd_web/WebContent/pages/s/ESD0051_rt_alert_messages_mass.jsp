<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Alta Masiva Mensajes de Alerta</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "pmnt" class= "datapro.eibs.beans.JBListRec" scope="session" />

</head>

<body>

<SCRIPT type="text/javascript">


function FileGen() {
   	document.forms[0].submit();
}

  
</SCRIPT>

<H3 align="center"> Alta Masiva de Mensajes de Alerta

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_alert_messages_mass.jsp, ESD0051"></H3>
<hr size="4">


<FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.alerts.JSESD0051?SCREEN=5" ENCTYPE="multipart/form-data">

 <TABLE id=tbhelp class="tableinfo">
    <tr > 
      <td height="409"> 
        <p align="center">&nbsp; </p>
        <table width="100%">
          <tr> 
            <td width="2%" >&nbsp;</td>
            <td width="34%" > 
              <div align="right"></div>
            </td>
            <td width="64%" > 
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
            <td colspan="2" "width="36%">
              <div align="right">Seleccione Archivo :</div>
            </td>
            <td  width="64%" align=CENTER > 
              <div align="left"> 
 	            <input type="file" name="FILENAME" size="50" >
              </div>
            </td>

          </tr>
         <tr>
            <td width="2%">&nbsp;</td>
            <td width="34%">&nbsp;</td>
            <td width="64%">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="3" "width="100%" class="TDBKG">
              <div align="center"><a href="javascript:FileGen()">Procesar</a></div>
              
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>

</FORM>


</body>
</html>
