<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Untitled Document</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id= "codes" class= "datapro.eibs.beans.ESD008003Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<SCRIPT type="text/javascript">

   <% if ( userPO.getOption().equals("CLIENT_P") ) {   %>
		builtNewMenu(client_personal_opt);
   <% } else { %>
		builtNewMenu(client_corp_opt);
   <% } %>

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
      <td nowrap > 
        <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
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
  </tr></table>


  <p>&nbsp;</p><table cellspacing="0" cellpadding="2" width="100%" border="1">
</table>


  <center> 
    <table class="tableinfo">
      <tr > 
        <td nowrap>
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right">Ejecutivo Principal :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03OFC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03OFC','D03OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0"> 
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "10") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03OF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03OF2','D03OF2','10')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0">
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right">Pa&iacute;s de Residencia 
                  :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03GEC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03GEC','D03GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0">
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03INC','D03INC','09')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0">
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="3%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03BUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03BUC','E03BUC','12')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0">
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="3%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "62") %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03SCH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03SCH','D03SCH','62')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              </td>
            </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "65") %> : </div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03SST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03SST','D03SST','65')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
                </td>
            </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1A")  %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03UC1','D03UC1','1A')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
			  </td>
            </tr>
 	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1B")  %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03UC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03UC2','D03UC2','1B')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              </td>
            </tr>

 	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1C")  %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03UC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03UC3','D03UC3','1C')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              </td>
            </tr>
 	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1D")  %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03UC4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03UC4','D03UC4','1D')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
				<%if(currUser.getE01INT().equals("03")){%>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
				<% } %>
              </td>
            </tr>
 	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1E")  %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03UC5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03UC5','D03UC5','1E')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              </td>
            </tr>

 	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="30%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1F")  %> :</div>
              </td>
              <td nowrap width="70%"> 
                <eibsinput:text name="codes" property="E03UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="false"/>
                <eibsinput:text name="codes" property="D03UC6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                <a href="javascript:GetCodeDescCNOFC('E03UC6','D03UC6','1F')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
              </td>
            </tr>
 
          </table>
        </td>
      </tr>
    </table>
<TABLE width="100%" border="0" cellspacing="0" cellpadding="0"
	bgcolor="#FFFFFF" bordercolor="#FFFFFF">
	<TR bgcolor="#FFFFFF">
		<TD width="33%">
		<DIV align="center"><INPUT type="checkbox" name="H03WK2" value="1">Aceptar
		con Avisos</DIV>
		</TD>
	</TR>
</TABLE>

<div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>

</center></form>
</body>
</html>

