
<%@page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.1 Transitional//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 

<TITLE>Print Time Deposits</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@page import="com.datapro.constants.Entities"%>
<%@page import="datapro.eibs.sockets.*, datapro.eibs.beans.* , datapro.eibs.master.*" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String txtch = !userPO.getApplicationCode().equals("12")?" Certificado de Depósito":" Bono";
	String txacd = !userPO.getApplicationCode().equals("12")?"11":"12";
%>

<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="JavaScript">

function checkInfo(){
	
	if  (getElement("R01ACC").value == "")
  		{
			alert("Favor ingrese los campos solicitados!!!");
			return;
		}
	var acc = getElement("R01ACC").value;
	
	var tip = 'V';
	var scr = document.forms[0].SCREEN.value;
   	var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.timedeposits.JSEDL2050?SCREEN=" + scr + "&R01ACC=" + acc+ "&TIP="+tip;
	CenterNamedWindow(page,'PDF',500,500,7);
 }

function checkInfoC(){
	
	if  (getElement("R01ACC").value == "")
  		{
			alert("Favor ingrese los campos solicitados!!!");
			return;
		}
	var acc = getElement("R01ACC").value;
	var tip = 'C';
	var scr = document.forms[0].SCREEN.value;
	var url = "<%=request.getContextPath()%>/pages/s/EFRM000_pdf_form.jsp?SCREEN=1&OPE_CODE=CO&APP_CODE=CD&ACCOUNT="+acc;
	getPdfForms(url);
   	
 }


</SCRIPT>

</HEAD>
<body>

<% 
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	int row = 0;
%>

<h3 align="center">Imprimir <%=txtch %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="print_time_deposit, EDL2050"></h3>

<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.timedeposits.JSEDL2050">	
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr> 
            <td width="20%" align="left"> </td>
            <td width="30%"> </td>
            <td width="50%" align="left"> </td>
          </tr>
          <tr> 
            <td width="20%" align="right"><B> </B></td>
            <td width="30%"> </td>
            <td width="50%" align="left"><B> </B></td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td width="20%" align="center"></td>
            <td nowrap width="30%">
            	<div align="right">Número <%=txtch %> a Imprimir : </div>
            </td>
            <td nowrap width="50%">
            	<input type="text" name="R01ACC" size="15" maxlength="12" onKeypress="enterInteger(event)">
              	<a href="javascript:GetAccount('R01ACC','','<%=txacd %>','<%=client%>')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              	<%=mandatory%>
            </td>
          </tr>
	    </table>
      </td>
    </tr>
  </table>

<p align="center">  
     <input id="EIBSBTN" type="Button" name="Process" value="Papel Valor" onClick="JavaScript:checkInfo()">
     &nbsp;&nbsp;
     <input id="EIBSBTN" type="Button" name="Process" value="Condiciones" onClick="JavaScript:checkInfoC()">
  </p>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %> <SCRIPT language="Javascript">
            showErrors();
     </SCRIPT> 
 <% } %>
 </FORM>
</BODY>
</HTML>
