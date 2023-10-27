<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<html>
<head>
<title>Capital</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 


<SCRIPT type="text/javascript">

  builtNewMenu(client_inq_corp_opt);

</SCRIPT>

</head>


<jsp:useBean id= "capital" class= "datapro.eibs.beans.ESD008008Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

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
<h3 align="center">Balance del Cliente <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_corp_capital, ESD0080"></h3>
<hr size="4">
<p>&nbsp;</p>

 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
   

<table class="tableinfo">
  <tr > 
    <td> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead"   align="center">
        <tr>
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

 <p>&nbsp;</p>

 <table class="tableinfo">
      <tr id="trdark"> 
        <td width="44%" align="center">&nbsp;ACTIVOS&nbsp;</td>
        <td width="56%" align="center">&nbsp;PASIVOS&nbsp;</td>
      </tr>
 </table>
 <table class="tableinfo">
    <tr > 
      <td> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
         <tr id="trdark"> 
            <td width="20%">&nbsp;</td>
            <td width="24%">
                <eibsinput:text name="capital" property="E08A01" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%">&nbsp;</td>
            <td width="34%"> 
                <eibsinput:text name="capital" property="E08L01" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="20%" > </td>
            <td width="24%" > 
                <eibsinput:text name="capital" property="E08A02" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp; </td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L02" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="20%" >&nbsp;</td>
            <td width="24%" >
                <eibsinput:text name="capital" property="E08A03" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp;</td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L03" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="20%" >&nbsp;</td>
            <td width="24%" >
                <eibsinput:text name="capital" property="E08A04" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp;</td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L04" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="20%" >&nbsp;</td>
            <td width="24%" >
                <eibsinput:text name="capital" property="E08A05" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp;</td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L05" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="20%" >&nbsp;</td>
            <td width="24%" > 
                <eibsinput:text name="capital" property="E08A06" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp;</td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L06" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="20%" >&nbsp;</td>
            <td width="24%" > 
                <eibsinput:text name="capital" property="E08A07" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp;</td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L07" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="20%" >&nbsp;</td>
            <td width="24%" >
                <eibsinput:text name="capital" property="E08A08" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp;</td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L08" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="20%" >&nbsp;</td>
            <td width="24%" >
                <eibsinput:text name="capital" property="E08A09" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp;</td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L09" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr>
            <td width="20%" >&nbsp;</td>
            <td width="24%" >
                <eibsinput:text name="capital" property="E08A10" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >&nbsp;</td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L10" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark">
            <td width="20%" >
              <div align="right"><b>Total :</b></div>
            </td>
            <td width="24%" >
                <eibsinput:text name="capital" property="E08A11" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td width="22%" >
              <div align="right"><b>Total : </b></div>
            </td>
            <td width="34%" >
                <eibsinput:text name="capital" property="E08L11" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
  <table class="tableinfo">
      <tr id="trdark"> 
        <td width="50%" >
          <div align="right"><b>Capital Líquido :</b></div>
        </td>
        <td width="50%" >
          <input type="text" name="CAPITAL" value="<%= userPO.getHeader21() %>" size="16" maxlength="15" class="txtright" readonly>
        </td>
      </tr>
 </table>
 
</form>
</body>
</html>
