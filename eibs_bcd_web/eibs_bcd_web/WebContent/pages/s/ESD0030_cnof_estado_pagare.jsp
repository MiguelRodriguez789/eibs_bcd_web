<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	document.forms[0].submit();
}

function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}

</script>

</head>
<body>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
%>

<H3 align="center">Códigos de Referencia del Sistema - Estados de Pagare<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_estado_pagare.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="<%= refCodes.getE02CNORCD().trim()%>">
  <input type=HIDDEN name="TABLECODE" id="TABLECODE" value="<%= refCodes.getE02CNOCFL().trim()%>">
   
  <h4>Información Básica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" align="right">Clasificación : </td>
            <td nowrap width="34%" align="left"> 
               	<input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly >
            </td>
            <td nowrap width="16%" align="right"></td>
            <td nowrap width="34%" align="left"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="16%" align="right">Código : </td>
            <td nowrap width="34%" align="left">
            	<eibsinput:text name="refCodes" property="E02CNORCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="true"/>
            	<eibsinput:text name="refCodes" property="E02CNODSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" />
            </td>
            <td nowrap width="16%" align="right">Estado : </td>
            <td nowrap width="34%" align="left">
            	<select name="E02CNOIVA">
                  <option value="A" <%if (refCodes.getE02CNOIVA().equals("A")) { out.print("selected"); }%>>Activo</option>
                  <option value="I" <%if (!refCodes.getE02CNOIVA().equals("A")) { out.print("selected"); }%>>Inactivo</option> 
                 </select> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%" align="right"> 
            </td>
            <td nowrap width="34%"align="left">
            </td>
            <td nowrap width="16%" align="right"></td>
            <td nowrap width="34%" align="left"> 
            </td>
          </tr>
          <tr id="trclear">
          	<td nowrap width="16%" align="right">Estado para Creacion de Pagare : </td>
            <td nowrap width="34%"align="left">
            	<input type="radio" name="E02CNOF06" value="Y" <%if (refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
                Sí 
                <input type="radio" name="E02CNOF06" value="N" <%if (!refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
                No  
            </td>
            <td nowrap width="16%" align="right">Cuenta Contable Credito :</td>
            <td nowrap width="34%" align="left">
            	<input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
                <a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,'','')"> 
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            </td>
          </tr>
        </table> 
      </td>
    </tr>
  </table>
 
        
  <table width="100%">		
  	<tr>
  		<td width="50%" align="center">
  		   <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
  			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(600);">
  			   <%}%>
     	 </td>
  		<td width="50%" align="center">
     		<input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(400);">
  		</td>
  	</tr>	
  </table>	  

  </form>
  	<SCRIPT Language="javascript"> 
  		
 	</script>  
  
</body>
</html>
