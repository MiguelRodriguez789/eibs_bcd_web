<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Codigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "lnCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
	builtNewMenu(dft_a_opt);
	initMenu();
</SCRIPT>

<body  bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 
<h3 align="center">C&oacute;digos de Clasificaci&oacute;n <%= userPO.getHeader4().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_ap_codes.jsp, EDL0800" ></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
  </p>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>C&oacute;digos Especiales</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
           <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Oficial Principal :</div>
            </td>
            <td nowrap width="70%"> 
			  <eibsinput:text name="lnCodes" property="E02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>  
            </td>
          </tr>
          <tr id="trclear">
            <%  if (!(currUser.getE01INT().trim().equals("11"))) {%>  
            <td nowrap width="30%" > 
              <div align="right">Oficial Secundario :</div>
            </td>
               <% } else {%>
               <td nowrap width="30%" > 
                 <div align="right">Oficina :</div>
               </td>
               <% }%> 
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digo de Industria :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="3%"> 
              <div align="right">Pa&iacute;s de Riesgo :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="3%"> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Tipo de Negocio :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
            <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Canal de Ventas :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Fuentes de Informaci&oacute;n de Ventas :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>   
            </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Tipo de Actividad :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/> 
            </td>
          </tr>
           <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Forma de Pago :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Origen de los Fondos :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02ORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02ORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          
         <%  if (!(currUser.getE01INT().trim().equals("11"))) {%> 
               <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Destino de los Fondos :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02DST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02DST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Empresa de Cobro :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">C&oacute;digo de Usuario 5 :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Observaciones APC :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          
               <%
            } else {
         %>     
         <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Destino de los Fondos :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
         </tr> 
         <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Código BCR :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Código de Campaña :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="E02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%"> 
              <div align="right">Divisa :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="D02LA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02DS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%"> 
              <div align="right">Créditos Especiales :</div>
            </td>
            <td nowrap width="70%"> 
              <eibsinput:text name="lnCodes" property="D02LA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02DS4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>
         
        </table>
      </td>
    </tr>
  </table>
  </form>
</body>
</html>

