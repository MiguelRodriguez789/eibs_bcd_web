<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>C&aacute;lculo de Tasas Equivalente </title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="tasaData" class="datapro.eibs.beans.EDL098001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

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
<h3 align="center" > Conversi&oacute;n de Tasas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Tasa_Equivalente.jsp, EDL0980"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDL0980" >
	  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="800">

<%int row = 0; %>
<h4>Tasa Base:</h4>
<table class="tableinfo" style="width:100% ;">
  <tr>
    <td nowrap> 
      <table cellpadding=2 cellspacing=0 width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           	<td nowrap width="25%"> 
              <div align="right">Tasa de &Iacute;nteres(%): </div>
            </td>
              <td nowrap width="75%"> 
			    <eibsinput:text name="tasaData" property="E01TASBAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="false" />              
              </td>
        </tr>  
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           	<td nowrap width="25%"> 
              <div align="right">Periodicida (D&iacute;as):</div>
            </td>
              <td nowrap width="75%"> 
					<input type="text" name="E01NUMDYP" size="4" maxlength="3" onkeypress="enterInteger();" value="<%=tasaData.getE01NUMDYP().trim()%>"  >            
              </td>
        </tr>   
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Modalidad:</div>
            </td>
              <td nowrap width="75%"> 
              <div align="left">	              
               <select name="E01MODBAP" >
                    <option value="S" <% if (tasaData.getE01MODBAP().equals("S")) out.print("selected"); %>>Vencido</option>
                    <option value="P" <% if (tasaData.getE01MODBAP().equals("P")) out.print("selected"); %>>Anticipado </option>                   
                    <option value="R" <% if (tasaData.getE01MODBAP().equals("R")) out.print("selected"); %>>Reinvertido</option>  
                  </select>
               </div>
            </td>
        </tr>   
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Periodo Base(360/365):</div>
            </td>
              <td nowrap width="75%"> 
					<input type="text" name="E01PERBAP" size="4" maxlength="3" onkeypress="enterInteger();" value="<%=tasaData.getE01PERBAP().trim()%>"  >            
              </td>
        </tr>   
	 </table>
   <td>	
 </tr>
</table>       

<h4>Tasa Equivalente:</h4>
<table class="tableinfo" style="width:100% ;">
  <tr>
    <td nowrap> 
      <table cellpadding=2 cellspacing=0 width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           	<td nowrap width="25%"> 
              <div align="right">Periodicida (D&iacute;as):</div>
            </td>
              <td nowrap width="75%"> 
					<input type="text" name="E01NUMEQP" size="4" maxlength="3" onkeypress="enterInteger();" value="<%=tasaData.getE01NUMEQP().trim()%>"  >  
              </td>
        </tr>   
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Modalidad:</div>
            </td>
              <td nowrap width="75%"> 
              <div align="left">
               <select name="E01MODEQP" id="E01MODEQP" >
                    <option value="S" <% if (tasaData.getE01MODEQP().equals("S")) out.print("selected"); %>>Vencido</option>
                    <option value="P" <% if (tasaData.getE01MODEQP().equals("P")) out.print("selected"); %>>Anticipado </option>                   
                    <option value="R" <% if (tasaData.getE01MODEQP().equals("R")) out.print("selected"); %>>Reinvertido</option>  
                  </select>
               </div>
            </td>
        </tr>   
	 </table>
	 
   <td>	
 </tr>
</table>   

<h4>Resultado:</h4>
<table class="tableinfo" style="width:100% ;">
  <tr>
    <td nowrap> 
      <table cellpadding=2 cellspacing=0 width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
           	<td nowrap width="25%"> 
              <div align="right">Tasa Efectiva Anual:</div>
            </td>
              <td nowrap width="75%"> 
			    <eibsinput:text name="tasaData" property="E01TASEFP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />              
              </td>
        </tr>   
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Tasa Equivalente:</div>
            </td>
             <td nowrap width="75%"> 
			    <eibsinput:text name="tasaData" property="E01TASEQP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />              
            </td>
        </tr>   
	 </table>
   <td>	
 </tr>
</table>    

<div align="center">
<p>
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
</p>  
</div>        	    
            
        

</form>
</body>
