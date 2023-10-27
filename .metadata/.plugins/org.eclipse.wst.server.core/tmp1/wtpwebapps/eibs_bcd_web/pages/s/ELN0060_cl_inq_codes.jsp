<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title></title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "clCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
   builtNewMenu(cl_i_opt);
</SCRIPT>
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

<SCRIPT> initMenu(); </SCRIPT>

<h3 align="center">C&oacute;digos de Clasificaci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_inq_codes.jsp,ELN0060"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="28">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="CUSCUN" size="10" maxlength="9" value="<%= userPO.getCusNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="CUSNA1" size="45" readonly maxlength="45" value="<%= userPO.getCusName().trim()%>" >
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Tipo de Linea : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="PROCOD" size="4" readonly maxlength="4" value="<%= userPO.getCreditLineType().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>N&uacute;mero de Linea :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="ACCNUM" size="5" readonly maxlength="4" value="<%= userPO.getCreditLineNum().trim()%>" >
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="PROCCY" size="4" readonly maxlength="4" value="<%= userPO.getCurrency().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>C&oacute;digos de Clasificaci&oacute;n</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Oficial Principal :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" > 
              <div align="right">Oficial Secundario :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digo de Industria :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="3%"> 
              <div align="right">C&oacute;digo de Negocio :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
	  <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Pa&iacute;s de Riesgo     :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digo de Usuario 1 :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digo de Usuario 2 :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02UC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02UC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digo de Usuario 3 :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="clCodes" property="E02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="clCodes" property="D02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

