<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%><html>
<%@ page import = "datapro.eibs.master.Util" %>

<head>
<title>Draft Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String name = currClient != null ? currClient.getE01CUSNA1().trim() : ""; 
%>
<SCRIPT type="text/javascript">

function goAction(opt) {
		var exists = false;
		var page = "";

}



</SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
<h3 align="center"> <%= dftBasic.getE01DSCPRO().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_upload_enter.jsp, EDL0800"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800A" >
  <INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=dftBasic.getE01DEAACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="1510">
  <INPUT TYPE=HIDDEN NAME="ACTION" ID="ACTION" VALUE="F">
  <input type=HIDDEN name="E01DEATYP" ID="E01DEATYP" value="<%= dftBasic.getE01DEATYP() %>">
  <INPUT type="hidden" name="E01DEACLF" id="E01DEACLF" size="2" maxlength="1" value="<%= dftBasic.getE01DEACLF() %>" readonly>
  <input type=hidden name="GRP" id="GRP" value="0">


  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" size="10" maxlength="9"  value="<%= dftBasic.getE01DEACUN().trim().equals("0") ? client : dftBasic.getE01DEACUN() %>">
                <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="65" maxlength="60" value="<%= dftBasic.getE01CUSNA1().trim().equals("") ? name : dftBasic.getE01CUSNA1().trim() %>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right"><b>Producto :  </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= dftBasic.getE01DEAPRO() %>">
                <a href="javascript:GetProduct('E01DEAPRO','10','01','E01PRODSC','')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"></a>
                </b> </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Descripcion del Producto : </b></div>
            </td>
            <td nowrap width="40%"> 
              <div align="left"><b>
                <input type="text" name="E01PRODSC" size="60" maxlength="60" readonly value="<%= dftBasic.getE01DSCPRO() %>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


<p align="center">&nbsp;</p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"></div>
      </td>
      <td width="34%"> 
        <div align="center"> 
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
        </div>
      </td>
      <td width="33%"> 
        <div align="center"></div>
      </td>
    </tr>
    
  </table>
  <p align="center">&nbsp; </p>
  </form>

</body>
</html>
