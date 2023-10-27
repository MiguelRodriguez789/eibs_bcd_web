<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Informacion Basica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008020Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String currclient = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String curridn = currClient != null ? currClient.getE01CUSIDN() : ""; 
	String currname = currClient != null ? currClient.getE01CUSNA1() : ""; 
	String currtid = currClient != null ? currClient.getE01CUSTID() : "RUT"; 
%>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
    //out.println("<SCRIPT> initMenu(); </SCRIPT>");
 
%> 
<h3 align="center">Informacion Basica del Cliente
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_short_enter_identification_option, ESD0080"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="7">
 <INPUT TYPE=HIDDEN NAME="H20WK1" VALUE="S">
 <input type="hidden" name="customer_name" value="<%=currname%>">
 <input type="hidden" name="E20CUN" value="<%=currclient%>">
    
  <br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%"> 
              <div align="right">Identificaci&oacute;n :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E20IDN" size="28" maxlength="25" value="<%= client.getE20IDN().trim().equals("") ? curridn : client.getE20IDN().trim() %>" >
           		<a href="javascript: GetCustomerDescId('E20CUN', 'customer_name', 'E20IDN')"> <img
					src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"	
					border="0"></a>
            </td>
            <td nowrap width="11%"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="20%"> 
              <input type="text" name="E20TID" size="5" maxlength="4" value="<%= client.getE20TID().trim().equals("") ? currtid : client.getE20TID().trim() %>" >
              <a href="javascript:GetCodeAuxCNOFC('E20TID','34','<%=client.getH20SCR().trim()%>_2' )">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >  	     		
            </td>
          </tr>
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
