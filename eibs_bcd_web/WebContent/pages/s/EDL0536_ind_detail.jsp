<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Indicadores de Cartera</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.EDL053601Message"  scope="session" />
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

<h3 align="center">Indicadores Para Provisi&oacute;n de Cartera<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ind_detail, JSEDL0536" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0536" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
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
              <input type="text" name="E01CNICDE" size="5" maxlength="4" value="<%= msg.getE01CNICDE().trim()%>" readonly>

             </td>
            <td nowrap>
            	<div align="right">Descripción :</div>
            </td>
            <td nowrap>
            <input type="text" name="D01CNICDE" size="50" maxlength="45" value="<%= msg.getD01CNICDE().trim()%>" readonly></td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Umbral/Relaci&oacute;n :</div>
            </td>
            <td nowrap>
		 		<INPUT type="text" name="E01CNIUMB" size="15" maxlength="11" value="<%= msg.getE01CNIUMB() %>" readonly>
/
              <select name="E01CNIREL" id="E01CNIREL" readonly disabled>
                <option value=" " <% if (!(msg.getE01CNIREL().equals("1") ||msg.getE01CNIREL().equals("2")||msg.getE01CNIREL().equals("3")||msg.getE01CNIREL().equals("4"))) out.print("selected"); %>></option>
                <option value="1" <% if(msg.getE01CNIREL().equals("1")) out.print("selected");%>>Mayor(>)</option>
                <option value="2" <% if(msg.getE01CNIREL().equals("2")) out.print("selected");%>>Menor(<)</option>
                <option value="3" <% if(msg.getE01CNIREL().equals("3")) out.print("selected");%>>Mayor o Igual (>=)</option>
                <option value="4" <% if(msg.getE01CNIREL().equals("4")) out.print("selected");%>>Menor or Igual (<=)</option>
              </select>
			 </td>
            <td nowrap>
              <div align="right">Metodologia Resultante:</div>
            </td>
            <td nowrap>
              <select name="E01CNIMRE" id="E01CNIMRE" readonly disabled>
                <option value=" " <% if (!(msg.getE01CNIMRE().equals("A")|| msg.getE01CNIMRE().equals("D"))) out.print("selected"); %>></option>
                <option value="A" <% if(msg.getE01CNIMRE().equals("A")) out.print("selected");%>>Acumulativa</option>
                <option value="D" <% if(msg.getE01CNIMRE().equals("D")) out.print("selected");%>>Desacumulativa</option>
              </select>
      
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Per&iacute;odo del Numerador:</div>
            </td>

            <td nowrap>
              <select name="E01CNIPNU" id="E01CNIPNU" readonly disabled>
                <option value=" " <% if (!(msg.getE01CNIPNU().equals("1")|| msg.getE01CNIPNU().equals("2")|| msg.getE01CNIPNU().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if(msg.getE01CNIPNU().equals("1")) out.print("selected");%>>Per&iacute;odo (T)</option>
                <option value="2" <% if(msg.getE01CNIPNU().equals("2")) out.print("selected");%>>Per&iacute;odo (T-3)</option>
                <option value="3" <% if(msg.getE01CNIPNU().equals("3")) out.print("selected");%>>Per&iacute;odo (T-12)</option>

              </select>

            </td>
            <td nowrap>
              <div align="right">Per&iacute;odo del Denominador:</div>
            </td>

            <td nowrap>
              <select name="E01CNIPDE" id="E01CNIPDE" readonly disabled>
                <option value=" " <% if (!(msg.getE01CNIPDE().equals("1")|| msg.getE01CNIPDE().equals("2")|| msg.getE01CNIPDE().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if(msg.getE01CNIPDE().equals("1")) out.print("selected");%>>Per&iacute;odo (T)</option>
                <option value="2" <% if(msg.getE01CNIPDE().equals("2")) out.print("selected");%>>Per&iacute;odo (T-3)</option>
                <option value="3" <% if(msg.getE01CNIPDE().equals("3")) out.print("selected");%>>Per&iacute;odo (T-12)</option>

              </select>

            </td>


          </tr>

          <tr id="trdark">
            <td nowrap>
              <div align="right">Tipo de C&aacute;lculo del Numerador:</div>
            </td>

            <td nowrap>
              <select name="E01CNITCN" id="E01CNITCN" readonly disabled>
                <option value=" " <% if (!(msg.getE01CNITCN().equals("A")|| msg.getE01CNITCN().equals("R"))) out.print("selected"); %>></option>
                <option value="R" <% if(msg.getE01CNITCN().equals("R")) out.print("selected");%>>REAL</option>
                <option value="A" <% if(msg.getE01CNITCN().equals("A")) out.print("selected");%>>AJUSTADO</option>
              </select>

            </td>
            <td nowrap>
              <div align="right">Tipo de C&aacute;lculo del Denominador:</div>
            </td>

            <td nowrap>
              <select name="E01CNITCD" id="E01CNITCD" readonly disabled>
                <option value=" " <% if (!(msg.getE01CNITCD().equals("A")|| msg.getE01CNITCD().equals("R"))) out.print("selected"); %>></option>
                <option value="R" <% if(msg.getE01CNITCD().equals("R")) out.print("selected");%>>REAL</option>
                <option value="A" <% if(msg.getE01CNITCD().equals("A")) out.print("selected");%>>AJUSTADO</option>
              </select>

            </td>

          </tr>

          <tr id="trclear">
            <td nowrap>
              <div align="right">Valor de Ajuste Final:</div>
            </td>

            <td nowrap>
		 		<INPUT type="text" name="E01CNIADJ" size="20" maxlength="15" value="<%= msg.getE01CNIADJ() %>" readonly>

            </td>
            <td nowrap>
            </td>

            <td nowrap>
            </td>

          </tr>
          
          <tr id="trdark">
            <td nowrap>
              <div align="right">Total Numerador (Real):</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E01CNITNU" size="20" maxlength="15" value="<%= msg.getE01CNITNU() %>" readonly>

            </td>
            <td nowrap>
              <div align="right">Total Denominador (Real):</div>
            </td>

            <td nowrap>
		 		<INPUT type="text" name="E01CNITDE" size="20" maxlength="15" value="<%= msg.getE01CNITDE() %>" readonly>

            </td>

          </tr>

          <tr id="trclear">
            <td nowrap>
              <div align="right">Total Numerador (Ajustado):</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E01CNITNA" size="20" maxlength="15" value="<%= msg.getE01CNITNA() %>" readonly>

            </td>
            <td nowrap>
              <div align="right">Total Denominador (Ajustado):</div>
            </td>

            <td nowrap>
		 		<INPUT type="text" name="E01CNITDA" size="20" maxlength="15" value="<%= msg.getE01CNITDA() %>" readonly>

            </td>

          </tr>

          <tr id="trdark">
            <td nowrap>
              <div align="right">Resultado de C&aacute;lculo:</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E01CNIREC" size="20" maxlength="15" value="<%= msg.getE01CNIREC() %>" readonly>

            </td>
            <td nowrap>
              <div align="right">Metodolog&iacute;a Final:</div>
            </td>

            <td nowrap>

              <select name="E01CNIMFI" id="E01CNIMFI" readonly disabled>
                <option value=" " <% if (!(msg.getE01CNIMFI().equals("A")|| msg.getE01CNIMFI().equals("D"))) out.print("selected"); %>></option>
                <option value="A" <% if(msg.getE01CNIMFI().equals("A")) out.print("selected");%>>ACUMULATIVA</option>
                <option value="D" <% if(msg.getE01CNIMFI().equals("D")) out.print("selected");%>>DESACUMULATIVA</option>
              </select>
            </td>
          </tr>


          <tr id="trdark">
            <td nowrap>
              <div align="right">IPC del Numerador:</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E01CNIIPN" size="20" maxlength="15" value="<%= msg.getE01CNIIPN() %>" readonly>

            </td>
            <td nowrap>
              <div align="right">IPC del Denominador:</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E01CNIIPD" size="20" maxlength="15" value="<%= msg.getE01CNIIPD() %>" readonly>
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap>
              <div align="right">Fecha Corte Numerador:</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E01CNINDD" size="3" maxlength="2" value="<%= msg.getE01CNINDD() %>" readonly>
		 		<INPUT type="text" name="E01CNINDM" size="3" maxlength="2" value="<%= msg.getE01CNINDM() %>" readonly>
		 		<INPUT type="text" name="E01CNINDY" size="5" maxlength="4" value="<%= msg.getE01CNINDY() %>" readonly>

            </td>
            <td nowrap>
              <div align="right">Fecha Corte Denominador:</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E01CNIDDD" size="3" maxlength="2" value="<%= msg.getE01CNIDDD() %>" readonly>
		 		<INPUT type="text" name="E01CNIDDM" size="3" maxlength="2" value="<%= msg.getE01CNIDDM() %>" readonly>
		 		<INPUT type="text" name="E01CNIDDY" size="5" maxlength="4" value="<%= msg.getE01CNIDDY() %>" readonly>


            </td>
          </tr>

          <tr id="trclear">
            <td nowrap>
              <div align="right">Datos &Uacute;ltimo C&aacute;lculo:</div>
            </td>

            <td nowrap>

		 		<INPUT type="text" name="E01CNILCU" size="11" maxlength="10" value="<%= msg.getE01CNILCU() %>" readonly>
				/
		 		<INPUT type="text" name="E01CNILCD" size="3" maxlength="2" value="<%= msg.getE01CNILCD() %>" readonly>
		 		<INPUT type="text" name="E01CNILCM" size="3" maxlength="2" value="<%= msg.getE01CNILCM() %>" readonly>
		 		<INPUT type="text" name="E01CNILCY" size="5" maxlength="4" value="<%= msg.getE01CNILCY() %>" readonly>
				/
				<INPUT type="text" name="E01CNILCT" size="12" maxlength="12" value="<%= Util.getTimeFromTimestamp(msg.getE01CNILCT())%>" readonly>
				

            </td>
            <td nowrap>
              <div align="right">Datos Ultimo Mantenimiento:</div>
            </td>

            <td nowrap>
		 		<INPUT type="text" name="E01CNILMU" size="11" maxlength="10" value="<%= msg.getE01CNILMU() %>" readonly>
				/
		 		<INPUT type="text" name="E01CNILMD" size="3" maxlength="2" value="<%= msg.getE01CNILMD() %>" readonly>
		 		<INPUT type="text" name="E01CNILMM" size="3" maxlength="2" value="<%= msg.getE01CNILMM() %>" readonly>
		 		<INPUT type="text" name="E01CNILMY" size="5" maxlength="4" value="<%= msg.getE01CNILMY() %>" readonly>
				/
				<INPUT type="text" name="E01CNILMT" size="12" maxlength="12" value="<%= Util.getTimeFromTimestamp(msg.getE01CNILMT())%>" readonly>

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

