
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Consulta Documentos Varios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "checkSel" class= "datapro.eibs.beans.ETL051001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


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
<h3 align="center">
<% 
	if (userPO.getOption().equals("3"))
  		 out.print("Consulta de Orden de Pago");
 	else if (userPO.getOption().equals("4")) 	 
 		 out.print("Consulta de Cheques de Terceros");
 	else if (userPO.getOption().equals("1")) 
		 out.print("Aprobación de Cheques Oficiales");	 
 	else if (userPO.getOption().equals("OF")) 
		 out.print("Consulta de Cheques Oficiales");	 
  	else out.print("Consulta de Documentos Varios");
%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chk_off_inq_sel_identif.jsp,ETL0510"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="OPTION" VALUE="<%= userPO.getOption()%>">
  
  <h4>Informaci&oacute;n B&aacute;sica de Seleccion</h4> 
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%">
              <div align="right">Identificación Beneficiario :</div>
            </td>
            <td nowrap width="35%">
            	<eibsinput:text property="E01SELBNF" name="checkSel" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" />
            </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Numero Cliente Aplicante :</div>
            </td>
            <td nowrap width="35%">
            	<eibsinput:help fn_param_one="E01SELCUN" property="E01SELCUN" name="checkSel" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" />
            </td>
          </tr>            
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
              <div align="right">Estado del Documento :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELSCH" id="E01SELSCH" size="2" maxlength="1" value="T" readonly>              
              <a href="javascript:GetCode('E01SELSCH','STATIC_dv_stat.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
            <% if (userPO.getOption().equals("OF")){ %>
              <div align="right">N&uacute;mero de Cheque :</div>
              <% }else{ %>
              <div align="right">N&uacute;mero de Documento :</div>
              <%} %>
            </td>
            <td nowrap width="35%"> 
            	<eibsinput:text property="E01SELNCH" name="checkSel" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="12" maxlength="11" />
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap width="35%"> 
              <eibsinput:text property="E01SELACC" name="checkSel" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="13" maxlength="12" />	
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
