<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Detalle de Indicadores de Cartera</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.EDL053602Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body bgcolor="#FFFFFF">

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Detalle De Indicadores Para Provisi&oacute;n de Cartera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ind_detail_formula, JSEDL0536" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0536" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="14">
    <INPUT TYPE=HIDDEN NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
  </p>
  <table  class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark">
            <td nowrap>
               <div align="right">Indicador :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02INDCDE" size="5" maxlength="4" value="<%= msg.getE02INDCDE().trim()%>" readonly>

             </td>
            <td nowrap>
            	<div align="right">Descripción :</div>
            </td>
            <td nowrap>
            <input type="text" name="D02INDCDE" size="50" maxlength="45" value="<%= msg.getD02INDCDE().trim()%>" readonly></td>
          </tr>
          
          <tr id="trclear">
            <td nowrap>
              <div align="right">Secuencia:</div>
            </td>
            <td nowrap>
		 		<INPUT type="text" name="E02INDSEQ" size="6" maxlength="5" value="<%= msg.getE02INDSEQ() %>" readonly>
			 </td>
            <td nowrap>
              <div align="right">Ubicaci&oacute;n en F&oacute;rmula:</div>
            </td>
            <td nowrap>
              <select name="E02INDPOS" id="E02INDPOS" readonly disabled>
                <option value=" " <% if (!(msg.getE02INDPOS().equals("N")|| msg.getE02INDPOS().equals("D"))) out.print("selected"); %>></option>
                <option value="N" <% if(msg.getE02INDPOS().equals("N")) out.print("selected");%>>Numerador</option>
                <option value="D" <% if(msg.getE02INDPOS().equals("D")) out.print("selected");%>>Denominador</option>
              </select>
      
            </td>
          </tr>

          <tr id="trclear">
            <td nowrap>
              <div align="right">Cuenta Contable Inicial:</div>
            </td>

            <td nowrap>
            
		 		<INPUT type="text" name="E02INDGLI" size="17" maxlength="16" value="<%= msg.getE02INDGLI() %>" readonly>
                
            </td>
            <td nowrap>
              <div align="right">Cuenta Contable Final:</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E02INDGLF" size="17" maxlength="16" value="<%= msg.getE02INDGLF() %>" readonly>
             
            </td>


          </tr>

          <tr id="trdark">
            <td nowrap>
              <div align="right">Operador de Suma/Resta:</div>
            </td>

            <td nowrap>
              <select name="E02INDOPE" id="E02INDOPE" readonly disabled>
                <option value=" " <% if (!(msg.getE02INDOPE().equals("+")|| msg.getE02INDOPE().equals("-"))) out.print("selected"); %>></option>
                <option value="+" <% if(msg.getE02INDOPE().equals("+")) out.print("selected");%>>Suma(+)</option>
                <option value="-" <% if(msg.getE02INDOPE().equals("-")) out.print("selected");%>>Resta(-)</option>
              </select>

            </td>

            <td nowrap>
            </td>

            <td nowrap>
            </td>

          </tr>

          <tr id="trclear">
            <td nowrap>
              <div align="right">Resultado de F&oacute;rmula (Real):</div>
            </td>

            <td nowrap>
            
		 		<INPUT type="text" name="E02INDVAL" size="20" maxlength="20" value="<%= msg.getE02INDVAL() %>" readonly>
                
            </td>
            <td nowrap>
              <div align="right">Resultado de F&oacute;rmula (Ajustado):</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E02INDVAA" size="20" maxlength="20" value="<%= msg.getE02INDVAA() %>" readonly>
             
            </td>


          </tr>


          <tr id="trdark">
            <td nowrap>
              <div align="right">Datos &Uacute;ltimo C&aacute;lculo:</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E02INDLCU" size="11" maxlength="10" value="<%= msg.getE02INDLCU() %>" readonly>
				/
		 		<INPUT type="text" name="E02INDLCD" size="3" maxlength="2" value="<%= msg.getE02INDLCD() %>" readonly>
		 		<INPUT type="text" name="E02INDLCM" size="3" maxlength="2" value="<%= msg.getE02INDLCM() %>" readonly>
		 		<INPUT type="text" name="E02INDLCY" size="5" maxlength="4" value="<%= msg.getE02INDLCY() %>" readonly>
				/
				<INPUT type="text" name="E02INDLCT" size="12" maxlength="12" value="<%= Util.getTimeFromTimestamp(msg.getE02INDLCT())%>" readonly>
				

            </td>
            <td nowrap>
              <div align="right">Datos Ultimo Mantenimiento:</div>
            </td>

            <td nowrap>
		 		<INPUT type="text" name="E02INDLMU" size="11" maxlength="10" value="<%= msg.getE02INDLMU() %>" readonly>
				/
		 		<INPUT type="text" name="E02INDLMD" size="3" maxlength="2" value="<%= msg.getE02INDLMD() %>" readonly>
		 		<INPUT type="text" name="E02INDLMM" size="3" maxlength="2" value="<%= msg.getE02INDLMM() %>" readonly>
		 		<INPUT type="text" name="E02INDLMY" size="5" maxlength="4" value="<%= msg.getE02INDLMY() %>" readonly>
				/
				<INPUT type="text" name="E02INDLMT" size="12" maxlength="12" value="<%= Util.getTimeFromTimestamp(msg.getE02INDLMT())%>" readonly>

            </td>
          </tr>



              
    </table>
      </td>
    </tr>
  </table>

  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Salir">
  </p>
</form>
</body>
</html>

