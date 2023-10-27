<%@page import="datapro.eibs.services.ParametersServices"%>
<%@ page import = "datapro.eibs.master.*" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.eibs.constants.StyleID"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Codigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "cdCodes" class= "datapro.eibs.beans.ESD000002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(cd_m_opt);


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

<h3 align="center">C&oacute;digos de Clasificaci&oacute;n
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_codes.jsp,EDL0130" width="35" ></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0130" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
  </p>

  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark" > 
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
          <tr id="trdark" > 
            <td nowrap width="16%"> 
              <div align="right"><b>Certificado :</b></div>
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
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E02PRO2" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>C&oacute;digos Especiales</h4>
  
  <%int row = 0; %>
  <table class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Ejecutivo Principal :</div>
            </td>
            <td nowrap width="60%"> 
           	   <eibsinput:cnofc name="cdCodes" flag="15" property="E02OFC" fn_description="D02OFC" />
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Ejecutivo Secundario :</div>
            </td>
            <td nowrap width="60%"> 
           	   <eibsinput:cnofc name="cdCodes" flag="15" property="E02OF2" fn_description="D02OF2" />
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</div>
            </td>
            <td nowrap width="60%"> 
           	   <eibsinput:cnofc name="cdCodes" flag="09" property="E02INC" fn_description="D02INC" />
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="60%"> 
           	   <eibsinput:cnofc name="cdCodes" flag="03" property="E02GEC" fn_description="D02GEC" />
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Pa&iacute;s de Riesgo:</div>
            </td>
            <td nowrap width="60%"> 
           	   <eibsinput:cnofc name="cdCodes" flag="03" property="E02GRC" fn_description="D02GRC" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</div>
            </td>
            <td nowrap width=60%%"> 
           	   <eibsinput:cnofc name="cdCodes" flag="12" property="E02BUC" fn_description="D02BUC" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "62") %> :</div>
            </td>
            <td nowrap width="60%"> 
           	   <eibsinput:cnofc name="cdCodes" flag="62" property="E02SCH" fn_description="D02SCH" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "65") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="cdCodes" flag="65" property="E02SST" fn_description="D02SST" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2C") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="cdCodes" flag="2C" property="E02UC3" fn_description="D02UC3" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2D") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="cdCodes" flag="2D" property="E02UC4" fn_description="D02UC4" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2E") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="cdCodes" flag="2E" property="E02UC5" fn_description="D02UC5" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2F") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="cdCodes" flag="2F" property="E02UC6" fn_description="D02UC6" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2G") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="cdCodes" flag="2G" property="E02UC7" fn_description="D02UC7" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% } else {%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "02") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="cdCodes" flag="02" property="E02UC5" fn_description="D02UC5" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="cdCodes" flag="" property="E02UC7" fn_description="D02UC7" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="cdCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>

         <% }%>  
        </table>
      </td>
    </tr>
  </table>

  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
   </p>

  </form>
</body>
</html>

