<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Accesos Usuarios por Banco - Oficina</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD0018Record" class="datapro.eibs.beans.ESD001801Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isApprovalInquiry || isInquiry;
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" title=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String tf = "false";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  tf = "true";
		  mandatory = "";
		
    }  
%>

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
    
%>

<H3 align="center">Acceso Banco - Oficina<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="users_bank_branch_access.jsp, ESD0018"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESD0018" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01USR" VALUE="<%=userPO.getHeader2() %>">

 <table class="tableinfo">
  <tr> 
    <td nowrap> 
      <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr>
          <td nowrap width="25%" align="right"> Usuario: </td>
          <td nowrap width="25%" align="left"><%= userPO.getHeader2()%></td>
          <td nowrap width="25%" align="right"> Nombre Usuario: </td>
          <td nowrap width="25%"align="left"><%= userPO.getHeader3()%></td>
        </tr>
      </table>
    </td>
  </tr>
 </table>


<div id="HOLDERINFO" style="position:relative; display:block;">
  <h4>Información</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
       
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Banco :</td>
            <td nowrap width="35%" align="left">
                <% if (isApprovalInquiry || isInquiry) {%> 
            		<input type="text" name="E01BNK" size="5" value="<%= ESD0018Record.getE01BNK().trim()%>" readonly 
               	<%	if (ESD0018Record.getF01BNK().equals("Y")) out.print("class=\"txtchanged\"");%>> 
               	<% } else { %>
            		<eibsinput:text name="ESD0018Record" property="E01BNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" required="true" />
            	<% } %>
            </td>
            <td nowrap width="15%" align="right">Todas las Oficinas :</td>
            <td nowrap width="35%" align="left">
            	<% if (isApprovalInquiry || isInquiry) {%> 
            		<input type="radio" name="E01ALL"  value="<%= ESD0018Record.getE01ALL().trim()%>" readonly 
               	<%	if (ESD0018Record.getF01ALL().equals("Y")) out.print("class=\"txtchanged\"");%> maxlength="1"> 
               	<% } else { %>
            		<p> 
                	<input type="radio" name="E01ALL" value="*" <%if (ESD0018Record.getE01ALL().equals("*")) out.print("checked"); %>>
                    Si 
                    <input type="radio" name="E01ALL" value="N" <%if (!ESD0018Record.getE01ALL().equals("*")) out.print("checked"); %>>
                    No
              	</p> 
            	<% } %>
            </td>
         </tr>
         <%if (!ESD0018Record.getE01ALL().equals("*")) { %>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Oficina :</td>
            <td nowrap width="35%" align="left">
                <% if (isApprovalInquiry || isInquiry) {%> 
            		<input type="text" name="E01BRN" size="5" value="<%= ESD0018Record.getE01BRN().trim()%>" readonly 
               	<%	if (ESD0018Record.getF01BNK().equals("Y")) out.print("class=\"txtchanged\"");%>> 
               	<% } else { %>
	                <eibsinput:help name="ESD0018Record" property="E01BRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
               	    	fn_param_one="E01BRN" fn_param_two="document.forms[0].E01BNK.value"/>

            	<% } %>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="D01BRN" size="45" value="<%= ESD0018Record.getD01BRN().trim()%>" readonly >
               	
            </td>
         </tr>
         <% } %>
       </table>
            
       </td>
       </tr>
    </table>

</div>   
   
 <br> 
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" >
     	  </div>	
  		</td>

  	</tr>	
  </table>	

  </form>
</body>

<SCRIPT type="text/javascript">

</SCRIPT>
</html>
