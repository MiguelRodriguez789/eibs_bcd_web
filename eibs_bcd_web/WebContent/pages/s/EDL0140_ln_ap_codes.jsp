<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
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
<%if(userPO.getPurpose().equals("AppInquiry") || userPO.getPurpose().equals("APPROVAL_INQ")){ %>
   builtNewMenu(pv_a_opt);
<%}else{ %>
   builtNewMenu(ln_a_opt);
<%} %>
</SCRIPT>

<body bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 		error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>
 
<h3 align="center">C&oacute;digos de Clasificaci&oacute;n <%= userPO.getHeader4().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_ap_codes.jsp,EDL0140" width="35" ></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150" >
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
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
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
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>C&oacute;digos Especiales</h4>
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Ejecutivo Principal :</div>
            </td>
            <td nowrap width="60%"> 
			  <eibsinput:text name="lnCodes" property="E02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02OFC" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>  
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Ejecutivo Secundario :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02OF2" readonly="true"  />
              <eibsinput:text name="lnCodes" property="D02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Sector Econ&oacute;mico :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02INC" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="3%"> 
              <div align="right">Pa&iacute;s de Riesgo :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02GRC" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="3%"> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02GEC" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Actividad Econ&oacute;mica :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Canal de Ventas :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02SCH" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Fuentes de Informaci&oacute;n :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02SST" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>   
            </td>
          </tr>
         <% }%>  

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Nivel Socio-economico :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>"  modified="F02UC3" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/> 
            </td>
          </tr>
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Tipo Cartera :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02UC6" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Origen de los Fondos :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02ORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02ORG" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02ORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          
          
          <%  if (!(currUser.getE01INT().trim().equals("11"))) {%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Destino de los Fondos :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02DST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02DST" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02DST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
				<div align="right"><%= ParametersServices.getCnofTableDesc(request, "2D") %> :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02UC4" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  

         <%  if ((currUser.getE01INT().trim().equals("07"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Clasificacion (Acuerdo 4-2013) :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>"  modified="F02UC5" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  
         
         <%  if ((currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Vendedor :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02UC5" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Supervisor Vendedor :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02UC7" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  
          
         <%
            } else {
         %>     
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Destino de los Fondos :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02UC4" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
         </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Código BCR :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02UC5" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Código de Campaña :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="E02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02UC7" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Divisa :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="D02LA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02LA1" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02DS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Créditos Especiales :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnCodes" property="D02LA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F02LA4" readonly="true"/>
              <eibsinput:text name="lnCodes" property="D02DS4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>
           
        </table>
      </td>
    </tr>
  </table>
  <center>
  </center>
</form>
</body>
</html>

