<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Códigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "cdCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
	builtNewMenu(ln_i_1_opt);
<% } else  { %>
	builtNewMenu(ln_i_2_opt);
<% } %>

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
    out.println("<SCRIPT> initMenu(); </SCRIPT>");

%>

<h3 align="center">C&oacute;digos de Clasificaci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_inq_codes.jsp,EDL0160"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0160" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  </p>

  <% int row = 0;%>
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
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PTYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
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
                <input type="text" name="E01DEACCY" size="4" maxlength="3" readonly value="<%= userPO.getCurrency().trim()%>">
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Ejecutivo Principal :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="cdCodes" property="E02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="cdCodes" property="D02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Ejecutivo Secundario :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="cdCodes" property="E02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="cdCodes" property="D02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="cdCodes" property="E02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>             
                <eibsinput:text name="cdCodes" property="D02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Pa&iacute;s de Riesgo :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="cdCodes" property="E02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>              
                <eibsinput:text name="cdCodes" property="D02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="cdCodes" property="E02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="cdCodes" property="D02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="cdCodes" property="E02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>             
                <eibsinput:text name="cdCodes" property="D02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%">
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "62") %> :</div>
            </td>
            <td nowrap width="60%">
                <eibsinput:text name="cdCodes" property="E02SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="cdCodes" property="D02SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>              
            </td>
          </tr>
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%">
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "65") %> :</div>
            </td>
            <td nowrap width="60%">
                <eibsinput:text name="cdCodes" property="E02SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="cdCodes" property="D02SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>              
            </td>
          </tr>
         <% }%>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2C") %>:</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="cdCodes" property="E02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>              
                <eibsinput:text name="cdCodes" property="D02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>             
            </td>
          </tr>
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2F") %> :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="cdCodes" property="E02UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>              
                <eibsinput:text name="cdCodes" property="D02UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%">
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "18") %> :</div>
            </td>
            <td nowrap width="60%">
                <eibsinput:text name="cdCodes" property="E02ORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="cdCodes" property="D02ORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>            
            </td>
          </tr>
          
 <%  if (!(currUser.getE01INT().trim().equals("11"))) {%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%">
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "38") %> :</div>
            </td>
            <td nowrap width="60%">
                <eibsinput:text name="cdCodes" property="E02DST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="cdCodes" property="D02DST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>              
            </td>
          </tr>
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2D") %> :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:text name="cdCodes" property="E02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>              
                <eibsinput:text name="cdCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  

         <%  if ((currUser.getE01INT().trim().equals("07"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Clasificacion (Acuerdo 4-2013) :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="cdCodes" property="E02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="cdCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  

         <%  if ((currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Vendedor :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="cdCodes" property="E02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>                    
                <eibsinput:text name="cdCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Supervisor Vendedor :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="cdCodes" property="E02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="cdCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  
 <% } else { %>       
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%">
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "98") %> :</div>
            </td>
            <td nowrap width="60%">
                <eibsinput:text name="cdCodes" property="E02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="cdCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>              
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "CB") %> :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="cdCodes" property="E02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="cdCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "CP") %> :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="cdCodes" property="E02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="cdCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "GD") %> :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="cdCodes" property="D02LA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="cdCodes" property="D02DS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "CE") %> :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="cdCodes" property="D02LA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
              <eibsinput:text name="cdCodes" property="D02DS4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
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

