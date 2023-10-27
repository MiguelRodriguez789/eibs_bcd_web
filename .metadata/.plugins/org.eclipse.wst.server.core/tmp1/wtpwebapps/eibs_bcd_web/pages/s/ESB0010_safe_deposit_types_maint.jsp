<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Safe Deposit Types</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB001001Message"  	scope="session" />
<LINK rel="stylesheet" href="../style.css" type="text/css">
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>



</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<H3 align="center">Mantenimiento Tipos Caja de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_types_maint, ESB0010"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0010">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="500">
  
  <%int row = 0; %>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	      <td nowrap width="40%"> 
	        <div align="right">Tipo : </div>
	      </td>
	      <td nowrap width="60%"> 
	        <input type="text" name="E01SBTTYP" size="5" maxlength="4" value="<%= msgPart.getE01SBTTYP() %>" readonly>
	      </td>
     	</tr>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	      <td nowrap> 
	        <div align="right">Descripción : </div>
	      </td>
	      <td nowrap>
	      	<eibsinput:text property="E01SBTDSC" name="msgPart" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>"></eibsinput:text>
		  </td>
     	</tr>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
	      <td nowrap>	 
	        <div align="right">Proveedor : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" id="E01SBTVEN" name="E01SBTVEN" size="10" maxlength="9" value="<%= msgPart.getE01SBTVEN() %>">
      	    <a href="javascript:GetVendor('E01SBTVEN')">
      	    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0" ></a>
		  </td>
     	</tr>
     	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
		  <td> 
		     <div align="right">Marca : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBTBRA" id="E01SBTBRA" size="60" maxlength="60" value="<%= msgPart.getE01SBTBRA() %>">
      	  </td>     
      	</tr>
      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          <td nowrap>
              <div align="right">Modelo : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01SBTMOD" id="E01SBTMOD" size="60" maxlength="60" value="<%= msgPart.getE01SBTMOD() %>">
          </td>
        </tr>
     </table>
    </td>
   </tr>
  </table>
  <br>
  
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </p>
</form>
</body>
</html>
