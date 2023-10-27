<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@ page import = "datapro.eibs.master.*" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.eibs.constants.StyleID"%>

<html>
<head>
<title>Codigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="lnCodes" class="datapro.eibs.beans.ESD000002Message" scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

builtNewMenu(pv_m_opt);

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

<h3 align="center">C&oacute;digos de Clasificaci&oacute;n <%= userPO.getHeader4().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_codes.jsp,EDL0150" ></h3> 
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDL0150" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
  </p>

  <% int row = 0;%>
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
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Ejecutivo Principal :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="15" property="E02OFC" fn_description="D02OFC" required="true"/>
               <eibsinput:text name="lnCodes" property="D02OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Ejecutivo Secundario :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="15" property="E02OF2" fn_description="D02OF2" required="true"/>
               <eibsinput:text name="lnCodes" property="D02OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="09" property="E02INC" fn_description="D02INC" required="true"/>
               <eibsinput:text name="lnCodes" property="D02INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="3%"> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="03" property="E02GEC" fn_description="D02GEC" required="true"/>
                <eibsinput:text name="lnCodes" property="D02GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="3%"> 
              <div align="right">Pa&iacute;s de Riesgo :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="03" property="E02GRC" fn_description="D02GRC" required="true"/>
                <eibsinput:text name="lnCodes" property="D02GRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="12" property="E02BUC" fn_description="D02BUC" required="false"/>
                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "62") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="62" property="E02SCH" fn_description="D02SCH" required="false"/>
	             &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true" />
           </td>
          </tr>
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "65") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="65" property="E02SST" fn_description="D02SST" required="false"/>
	         &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
         <% }%>  

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2C") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="2C" property="E02UC3" fn_description="D02UC3" required="false"/>
               &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </td>
          </tr>
          
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2F") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="2F" property="E02UC6" fn_description="D02UC6" required="false"/>
	             &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>          
          </tr>        
         <% }%>  
         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "18") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="18" property="E02ORG" fn_description="D02ORG" required="false"/>
                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02ORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           </td>
          </tr>
         
<%  if (!(currUser.getE01INT().trim().equals("11"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "38") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="38" property="E02DST" fn_description="D02DST" required="false"/>
              &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02DST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          
         <%  if (!(currUser.getE01INT().trim().equals("18"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "2D") %> :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="2D" property="E02UC4" fn_description="D02UC4" required="false"/>
              &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td> 
          </tr> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "SG") %> :</div>
            </td>
               <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="SG" property="D02LA4" fn_description="D02DS4" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02DS4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>           
         <% }%>  

         <%  if ((currUser.getE01INT().trim().equals("07"))) {%>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Clasificacion (Acuerdo 4-2013) :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:cnofc name="lnCodes" flag="RW" property="E02UC5" fn_description="D02UC5" required="false"/>
	             &nbsp;&nbsp;&nbsp;
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
               <eibsinput:cnofc name="lnCodes" flag="CA" property="E02UC5" fn_description="D02UC5" required="false"/>
	             &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Supervisor Vendedor :</div>
            </td>
               <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="CA" property="E02UC7" fn_description="D02UC7" required="false" readonly="true"/>
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
             </td>
          </tr>
         <% }%>  
         
 <% } else {%>
         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "98") %> :</div>
            </td>
            <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="98" property="E02UC4" fn_description="D02UC4" 
                	help="<%= HelpTypes.CNOF_CODE_FILTERED %>" required="false"/>
	                &nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
       		</td>
          </tr>
         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "CB") %> :</div>
            </td>
               <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="CB" property="E02UC5" fn_description="D02UC5" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
           </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "CP") %> :</div>
            </td>
               <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="CP" property="E02UC7" fn_description="D02UC7" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02UC7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "GD") %> :</div>
            </td>
               <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="GD" property="D02LA1" fn_description="D02DS1" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02DS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "CE") %> :</div>
            </td>
               <td nowrap width="60%"> 
                <eibsinput:cnofc name="lnCodes" flag="CE" property="D02LA4" fn_description="D02DS4" required="false"/>
	                &nbsp;&nbsp;&nbsp;
               <eibsinput:text name="lnCodes" property="D02DS4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>           
         <% }%> 
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
