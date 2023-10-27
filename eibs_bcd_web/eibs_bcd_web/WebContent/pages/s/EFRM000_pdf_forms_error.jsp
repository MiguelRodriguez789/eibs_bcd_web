<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "java.io.*,java.net.*" %>
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Error</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<body>
<h3 align="center">Error pedido de formularios<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="pdf_forms_error, EFRM000"></h3>
<hr size="4">
<table cellspacing="0" cellpadding="2" class="tbenter"  border=0  width=70% height=70% align="center" >
    <tr>
    <td align=center> 
      <div align="center"><font size="3"><b> 
           <% 
      				String error_msg = (String) session.getAttribute("error_msg");
      				if ( !error_msg.equals("") ) {
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
 