
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Consulta de Cheques Oficiales</title>
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
<h3 align="center">Consulta de Cheques de Gerencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chk_off_inq_sel.jsp,ETL0510"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <h4>Informaci&oacute;n B&aacute;sica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Tipo de Documento :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELDTY" size="2" maxlength="1" value="<%= checkSel.getE01SELDTY() %>">
              <a href="javascript:GetCode('E01SELDTY','STATIC_dv_typ.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Estado del Cheque :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELSCH" size="2" maxlength="1" value="<%= checkSel.getE01SELSCH() %>">
              <a href="javascript:GetCode('E01SELSCH','STATIC_dv_stat.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap width="35%"> 
       	       <eibsinput:text 	name="checkSel" property="E01SELBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Sucursal :</div>
            </td>
            <td nowrap width="35%"> 
               <eibsinput:help name="checkSel" property="E01SELBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="false"
               	    	fn_param_one="E01SELBRN" fn_param_two="document.forms[0].E01SELBNK.value"/>
	     	   
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="35%"> 
               <eibsinput:help name="checkSel" property="E01SELCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="false"
               	    	fn_param_one="E01SELCCY" fn_param_two="document.forms[0].E01SELBNK.value"/>
	      	
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Formato Cheque :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELFTY" size="3" maxlength="2" value="<%= checkSel.getE01SELFTY() %>">
		        <a href="javascript:GetOffChkPar('E01SELFTY')"> 
        	      <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" > 
               </a>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n Adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Cliente :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELCUN" size="10" maxlength="9" value="<%= checkSel.getE01SELCUN() %>"  onKeypress="enterInteger(event)">
                <a href="javascript:GetCustomer('E01SELCUN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
            </td>
            <td nowrap width="5%"> 
            </td>
            <td nowrap width="15%"> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Cheque :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELNCH" size="12" maxlength="11" value="<%= checkSel.getE01SELNCH() %>"  onKeypress="enterInteger(event)">
              <a href="javascript:GetCheck('E01SELNCH', document.forms[0].E01SELDTY.value,document.forms[0].E01SELSCH.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0" ></a> 
            </td>
            <td nowrap width="5%"> 
            </td>
            <td nowrap width="15%"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap width="35%"> 
              <input type="text" name="E01SELACC" size="13" maxlength="12" value="<%= checkSel.getE01SELACC() %>"  onKeypress="enterInteger(event)">
            </td>
            <td nowrap width="5%"> 
            </td>
            <td nowrap width="15%"> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%">
              <div align="right">Beneficiario :</div>
            </td>
            <td nowrap width="35%">
      	       <eibsinput:text 	name="checkSel" property="E01SELBNF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" />
            </td>
            <td nowrap width="5%"> 
            </td>
            <td nowrap width="15%"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> 
              <div align="right">Remitente :</div>
            </td>
            <td nowrap width="35%"> 
      	       <eibsinput:text 	name="checkSel" property="E01SELAPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" />
           </td>
            <td nowrap width="5%"> 
            </td>
            <td nowrap width="15%"> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Seleccionar Fechas Desde :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="left">
              	<eibsinput:date name="checkSel" fn_day="E01DTEFRD" fn_month="E01DTEFRM" fn_year="E01DTEFRY"/>
              </div>
            </td>
            <td nowrap width="5%"> 
              <div align="right">Hasta :</div>
            </td>
            <td nowrap width="15%"> 
              <div align="left">
              	<eibsinput:date name="checkSel" fn_day="E01DTETOD" fn_month="E01DTETOM" fn_year="E01DTETOY"/>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" height="26"> 
              <div align="right">Seleccionar Montos Desde :</div>
            </td>
            <td nowrap width="15%" height="26"> 
              <div align="left"> 
      	       <eibsinput:text 	name="checkSel" property="E01SELAFR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
            <td nowrap width="5%" height="26"> 
              <div align="right">Hasta :</div>
            </td>
            <td nowrap width="15%" height="26"> 
              <div align="left"> 
      	       <eibsinput:text 	name="checkSel" property="E01SELATO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
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
