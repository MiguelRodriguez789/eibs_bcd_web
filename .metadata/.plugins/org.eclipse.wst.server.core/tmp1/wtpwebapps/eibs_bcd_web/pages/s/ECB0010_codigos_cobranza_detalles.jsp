<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Mantenimiento de Plan de Fomento </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="RecData" class="datapro.eibs.beans.ECB001001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>


<script type="text/javascript">

 function goAction(op) {
	
	getElement("SCREEN").value = op;
	document.forms[0].submit();
 }
 </script>
</head>

<%
	boolean maintenance=false;
	boolean readOnly = false;
%> 
          
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<% if("1".equals( currUser.getH01WK1()) ){ %>      
	Consulta C&oacute;digo de Cobranza
<% 	readOnly = true;
 }else if (maintenance){ %>
	Mantenimiento C&oacute;digo de Cobranza
<%} else { %>
	Nuevo C&oacute;digo de Cobranza
<%} %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="codigos_cobranza_detalles.jsp, ECB0010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECB0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
 
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		   <tr id="trdark">
             <td nowrap width="25%" align="right"> Codigo : 
               </td>          
             <td nowrap align="left" width="75%">
                <input type="text" name="E01PFMCOD" size="5" maxlength="4" value="<%= RecData.getE01CBZCDE()%>" readonly >
             </td> 
       	 </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Detalles </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Descripci&oacute;n :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="RecData" property="E01CBZDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%" > 
              <div align="right">D&iacute;a de Mora Inicio :</div>
            </td>
            <td width="75%" > 
	  			<eibsinput:text name="RecData" property="E01CBZDMI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH%>" readonly="<%=readOnly%>"/>
          </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">D&iacute;a de Mora Final :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="RecData" property="E01CBZDMF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH%>" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Estado :</div>
            </td>
            <td width="35%"> 
                <select name="E01CBZSTS">
                <option value=" " <% if (!(RecData.getE01CBZSTS().equals("A") ||RecData.getE01CBZSTS().equals("C"))) out.print("selected"); %>></option>
                  <option value="A" <%if (RecData.getE01CBZSTS().equals("A")) { out.print("selected"); }%>> Activo</option>
                  <option value="C" <%if (RecData.getE01CBZSTS().equals("C")) { out.print("selected"); }%>> Inactivo</option>
                </select>  
             </td>
          </tr>
          <!--  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Tipo :</div>
            </td>
            <td width="35%"> 
                <select name="E01CBZTYP">
                <option value=" " <% if (!(RecData.getE01CBZTYP().equals("M") ||RecData.getE01CBZTYP().equals("F"))) out.print("selected"); %>></option>
                  <option value="M" <%if (RecData.getE01CBZTYP().equals("M")) { out.print("selected"); }%>> Mora</option>
                  <option value="F" <%if (RecData.getE01CBZTYP().equals("F")) { out.print("selected"); }%>> FAO</option>
                </select>  
             </td>
          </tr> 
          -->  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Manual :</div>
            </td>
            <td width="35%"> 
                <input type="radio" name="E01CBZFLG" value="Y" <%if (RecData.getE01CBZFLG().equals("Y")) out.print("checked"); %>> Si 
                <input type="radio" name="E01CBZFLG" value="N" <%if (RecData.getE01CBZFLG().equals("N")) out.print("checked"); %>> No
             </td>
          </tr>   
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="15%"> 
              <div align="right">Judicializado :</div>
            </td>
            <td width="35%"> 
                <input type="radio" name="E01CBZJUD" value="Y" <%if (RecData.getE01CBZJUD().equals("Y")) out.print("checked"); %>> Si 
                <input type="radio" name="E01CBZJUD" value="N" <%if (RecData.getE01CBZJUD().equals("N")) out.print("checked"); %>> No
             </td>
          </tr>   
        </table>
      </td>
    </tr>
  </table>
  
<br>
  
      <div align="center" style="width:95%"> 
		<% if(!"1".equals( currUser.getH01WK1()) ){ %>      
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<% } %>
          <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(500);">
      </div>
  </form>
</body>
</HTML>
