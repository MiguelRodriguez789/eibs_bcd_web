<html>
<head>
<title>Nuevo Tipo Caja de Seguridad</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgPart" 	class= "datapro.eibs.beans.ESB001001Message"  	scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<% 
if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
%>
<SCRIPT type="text/javascript">
        showErrors();
</SCRIPT>
<%}%>

</head>
<body>

<H3 align="center">Nuevo Tipo Caja de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_types_new, ESB0010"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0010">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trdark> 
	      <td nowrap width="40%"> 
	        <div align="right">Tipo : </div>
	      </td>
	      <td nowrap width="60%"> 
	        <input type="text" name="E01SBTTYP" size="5" maxlength="4" value="<%= userPO.getHeader1() %>" readonly>
	      </td>
     	</tr>
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Descripci�n : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01SBTDSC" size="60" maxlength="60" value="<%= msgPart.getE01SBTDSC() %>">
		  </td>
     	</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Proveedor : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01SBTVEN" size="10" maxlength="9" value="<%= msgPart.getE01SBTVEN() %>">
	      	<input type="text" name="D01BAVNM1" size="45" maxlength="45" value="<%= msgPart.getD01BAVNM1() %>" readonly >
      	    <a href="javascript:GetVendor('E01SBTVEN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0" ></a>
		  </td>
     	</tr>
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Marca : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01SBTBRA" size="60" maxlength="60" value="<%= msgPart.getE01SBTBRA() %>">
      	  </td>     
      	</tr>
      	<tr id=trdark>
          <td nowrap>
              <div align="right">Modelo : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01SBTMOD" size="60" maxlength="60" value="<%= msgPart.getE01SBTMOD() %>">
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
