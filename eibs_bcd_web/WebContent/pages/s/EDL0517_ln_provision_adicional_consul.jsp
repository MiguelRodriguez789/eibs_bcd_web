<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Calificación de Clientes</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<jsp:useBean id= "provis" class= "datapro.eibs.beans.EDL051701Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<jsp:useBean id= "lmParam" class= "datapro.eibs.beans.EDL051701Message"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


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
 
 <h3 align="center">Provisión Adicional <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_provision_adicional, EDL0517" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0517">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  	<table class="tableinfo">
      <tr > 
        <td nowrap>          
         <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            
            <td nowrap> 
              <div align="right">Nro Cliente :</div>
            </td>
            <td nowrap> 
              <input type="text" readonly name="E01CUSCUN" size="10" maxlength="9" value="<%= provis.getE01CUSCUN()%>">
            </td>
			<td nowrap> 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td nowrap> 
  			  <input type="text" readonly name="E01CUSTID" size="5" maxlength="4" value="<%= provis.getE01CUSTID()%>">
              <input type="text" readonly name="E01CUSIDN" size="26" maxlength="25" value="<%= provis.getE01CUSIDN()%>">
            </td>
			 <td nowrap> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="E01CUSNA1" size="60" maxlength="60" value="<%= provis.getE01CUSNA1().trim()%>">
            </td>
          </tr>
	        <tr id="trclear"> 
            <td nowrap> 
              <div align="right">Modalidad :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="D01DLCMOD" size="20" maxlength="20" value="<%= provis.getD01DLCMOD().trim()%>">
            </td>
			<td nowrap> 
              <div align="right">
                <div align="right">Préstamo :</div>
              </div>
            </td>
            <td nowrap colspan="3"><input type="text" readonly name="E01DEAACC" size="15" maxlength="12" value="<%= provis.getE01DEAACC().trim()%>"></td>
			
          </tr>    
         </table>
        </td>
      </tr>
    </table>
   
<table border="0" cellspacing="0" cellpadding="0" width="100%" style="visibility: <%= provis.getE01PENDAP().equals("") ? "hidden" : "visible" %>">
  	<tr>
  		<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=provis.getE01PENDAP()%></b></td>
  		<td width="5%"><h4>&nbsp;</h4></td>
  	</tr>
  </table>
    <br>
	<table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="2" cellpadding="2" width="100%" border="0" align="left">
            <tr id="trdark"> 
              <td nowrap width="50%"><div align="center"><b>Conceptos</b></div></td>
              <td nowrap width="50%" align=center><b>Provisi&oacute;n<br>Actual</b></td>
            </tr>
            <tr>
              <td nowrap id="trdark" align=right><B>Principal :</B> </td> 
              <td nowrap > 
               <div align=left><%=provis.getB01DLCMPR()%></div>              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Interés :
              </B></td> 
              <td nowrap > 
                <div align=left><%=provis.getB01DLCMIN()%></div>              </td>
            </tr>
            <tr >
              <td nowrap id="trdark" align=right><B>Otros :
              </B></td> 
              <td nowrap > 
                <div align=left><%=provis.getB01DLCMOT()%></div>              </td>
            </tr>
            
            
          </table>
        </td>
      </tr>
    </table>

	

</form>
</body>
</html>
