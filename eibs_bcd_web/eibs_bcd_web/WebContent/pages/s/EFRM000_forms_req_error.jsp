<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "java.io.*,java.net.*" %>
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Error</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<%
boolean option = true;
if ( !userPO.getPurpose().equals("APPROVAL_INQ") ) {

if ( userPO.getOption().equals("RT") ) {
%>
	 
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	
<%   
}
else if (userPO.getOption().equals("LN")){
%>
	
   <%   
 }
else if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		
  <%      
 }
else if ( userPO.getOption().equals("CLIENT_C") ) {
   %>
		
  <%      
 }
else if ( userPO.getOption().equals("LC") ) {
   %>
		
  <%      
 }
else if ( userPO.getOption().equals("DV") ) {
   %>
		
   <%
   }
 else {
     option = false;
   }  
   }

else
{   
   if ( userPO.getOption().equals("RT") ) {
%>
	
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	
<%   
}
else if (userPO.getOption().equals("LN")){
%>
	
   <%   
 }
else if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		
  <%      
 }
else if ( userPO.getOption().equals("CLIENT_C") ) {
   %>
		
  <%      
 }
 else {
     option = false;
   }  
   }

%>

	  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   <%} else {%>
<%

if ( !userPO.getPurpose().equals("APPROVAL_INQ") ) {

if ( userPO.getOption().equals("RT") ) {
%>
	   builtNewMenu(rt_m_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_m_opt);
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	builtNewMenu(cd_m_opt);
<%   
}
else if (userPO.getOption().equals("LN")){
%>
	builtNewMenu(ln_m_opt);
   <%   
 }
else if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_personal_opt);
  <%      
 }
else if ( userPO.getOption().equals("CLIENT_C") ) {
   %>
		builtNewMenu(client_corp_opt);
  <%      
 }
else if ( userPO.getOption().equals("LC") ) {
   %>
		builtNewMenu(lc_i_opt);
  <%      
 }
else if ( userPO.getOption().equals("DV") ) {
   %>
		builtNewMenu(coll_i_opt);
   <%
   }

   }

else
{   
   if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_a_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_a_opt);
<%   
}
else if (userPO.getOption().equals("CD")){
%>
	builtNewMenu(cd_a_opt);
<%   
}
else if (userPO.getOption().equals("LN")){
%>
	builtNewMenu(ln_a_opt);
   <%   
 }
else if ( userPO.getOption().equals("CLIENT_P") ) {
   %>
		builtNewMenu(client_ap_personal_opt);
  <%      
 }
else if ( userPO.getOption().equals("CLIENT_C") ) {
   %>
		builtNewMenu(client_ap_corp_opt);
  <%      
 }
 
   }

%>
<%}%>
</SCRIPT>

</HEAD>

<BODY >

<%
 if ( option ) {
%>
<SCRIPT type="text/javascript"> 
   initMenu(); 
</SCRIPT>
<%
}
%>
  
<h3 align="center">Error pedido de formularios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="forms_req_error, EFRM000"></h3>
<hr size="4">
<table cellspacing="0" cellpadding="2" class="tbenter"  border=0  width=70% height=70% align="center" >
    <tr>
      
    <td align=center> 
      <div align="center"><font size="3"><b> 
           <% 
				String error_msg = (String) session.getAttribute("error_msg");
      			if ( error_msg != null && !error_msg.equals("") ) {
               		out.print(error_msg);
         		} else {
            %> 
             		No Hay Formularios Asociados a esta Solicitud. 
            <%        
				}
            %> 
      </b></font> </div>
    </td>
    </tr>
</table>
</BODY>
</HTML>
 