
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Cambio de Producto</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id="brnDetails" class="datapro.eibs.beans.ESD090001Message"  scope="session" />

<script type="text/javascript">
function cancel(){
	document.forms[0].SCREEN.value = 100;
	document.forms[0].submit();
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
  <h3 align="center">Cambio de Producto<br>Cambio Individual en Cuenta<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="product_change_account.jsp, ESD0900"> 
  </h3>
  <hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESD0900" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="CHANGE" VALUE="A">
  <INPUT TYPE=HIDDEN NAME="E01CHGTYP" VALUE="<% if (!brnDetails.getE01CHGTYP().equals("")) { out.print(brnDetails.getE01CHGTYP()); } else { out.print("1"); } %>">

<%int row = 0; %> 
 <h4>Informacion Actual</h4>
  <table class="tableinfo">
      <tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Número de Cuenta :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </td>
            </tr>
 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Nombre del Cliente :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
		        <eibsinput:text name="brnDetails" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
              </td>
            </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Banco :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
              </td>
            </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Moneda :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </td>
            </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Sucursal :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGOBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
		        <eibsinput:text name="brnDetails" property="E01OLDBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Módulo :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGACD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TEXT %>" size="3" maxlength="2" readonly="true"/>
		        <eibsinput:text name="brnDetails" property="E01MODDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Tipo de Producto :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGPRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
		        <eibsinput:text name="brnDetails" property="E01PRTDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Producto :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGPRO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
		        <eibsinput:text name="brnDetails" property="E01PRDDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Cuenta Contable :</div>
              </td>
              <td nowrap width="75%">  
		        <eibsinput:text name="brnDetails" property="E01CHGOGL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
		        <eibsinput:text name="brnDetails" property="E01OLDGLD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            
          </table>
        </td>
      </tr>
    </table>
 
 <h4>Nueva Informacion</h4>
  
  <table class="tableinfo">
      <tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Nueva Sucursal :</div>
              </td>
              <td nowrap width="75%">  
 	 			<eibsinput:help name="brnDetails" property="E01CHGNBR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" 
 	 				fn_param_one="E01CHGNBR" fn_param_two="document.forms[0].E01CHGBNK.value"  fn_param_three="E01NEWBRN"  />
		        <eibsinput:text name="brnDetails" property="E01NEWBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Nuevo Producto :</div>
              </td>
              <td nowrap width="75%">  
 	 			<eibsinput:help name="brnDetails" property="E01CHGPRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" 
 	 				fn_param_one="E01CHGPRC" fn_param_two="document.forms[0].E01CHGACD.value" fn_param_three="document.forms[0].E01CHGBNK.value" fn_param_four="document.forms[0].E01NEWPRD.value" />
		        <eibsinput:text name="brnDetails" property="E01NEWPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="10%"> 
              </td>
              <td nowrap width="15%"> 
                <div align="right">Nueva Cuenta Contable :</div>
              </td>
              <td nowrap width="75%">  
 	 			<eibsinput:help name="brnDetails" property="E01CHGNGL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" 
 	 				fn_param_one="E01CHGNGL" fn_param_two="document.forms[0].E01CHGBNK.value" fn_param_three="document.forms[0].E01CHGCCY.value" fn_param_four="document.forms[0].E01CHGACD.value" fn_param_five="E01NEWGLD" />
		        <eibsinput:text name="brnDetails" property="E01NEWGLD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>

          </table>
        </td>
      </tr>
    </table>
    
    
  <BR>
<p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar" >
    <input id="EIBSBTN" type=button name="Cancel" value="Regresar" onClick="javascript:cancel()">
  </p>
      
</form>
</body>
</html>
