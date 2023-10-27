<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Codigos Especiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "codes" class= "datapro.eibs.beans.ESD008003Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<SCRIPT type="text/javascript">

     <% 
   if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_inq_personal_opt);
  <%      
   }
   else
   {
   %>
		builtNewMenu(client_inq_corp_opt);
   <%
   }
   %>

</SCRIPT>

<body bgcolor="#FFFFFF">

 
 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%>

<h3 align="center">C&oacute;digos de Clasificaci&oacute;n <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_both_codes, ESD0080"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="32">
  
 <% int row = 0;%>
<table class="tableinfo">
  <tr > 
    <td> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead"   align="center">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="10%" align="right"> Cliente: 
               </td>
          <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
          </td>
            <td nowrap width="6%" align="right">ID:  
            </td>
          <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
          </td>
            <td nowrap width="8%" align="right"> Nombre: 
               </td>
          <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<p>&nbsp;</p><center> 
    <table class="tableinfo" >
      <tr > 
        <td >
          <table cellspacing="0" cellpadding="2" width="100%" border="0" >

           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right">Ejecutivo Principal :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right">Ejecutivo Secundario :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right">Pa&iacute;s de Residencia :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="3%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="3%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "62") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "65") %> : </div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                </td>
            </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1A") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1B") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03UC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1C") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1D") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1E") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1F") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                <eibsinput:text name="codes" property="D03UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
              </td>
            </tr>

          </table>
        </td>
      </tr>
    </table>
  
</center></form>
</body>
</html>

