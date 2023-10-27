<html> 
<head>
<title>Creacion de Pedidos Adhesivos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO105502Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<%

int NEW = 0;
try { NEW = Integer.parseInt(request.getParameter("NEW"));} catch (Exception e) {}
if (NEW == 1) {
msgMT.destroy();
}
 
if (msgMT == null) msgMT = new datapro.eibs.beans.ECO105502Message();
msgMT.setE02REQBNK(userPO.getBank());
msgMT.setE02REQBRN(userPO.getBranch());
      
%>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</head>
<body>

<H3 align="center">Creacion de Pedidos Adhesivos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_req_new,ECO1055"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1055">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 	      
	      <td nowrap width="20%"> 
	        <div align="right">Banco/Oficina : </div>
	      </td>
	      <td nowrap width="80%"> 
	      	<input type="text" name="E02REQBNK" size="3" maxlength="2" value="<%= msgMT.getE02REQBNK() %>"><b>-</b> 
	        <input type="text" name="E02REQBRN" size="5" maxlength="4" value="<%= msgMT.getE02REQBRN() %>">
	        <a href="javascript:GetBranch('E02REQBRN',document.forms[0].E02REQBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
	        <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"> 
	      </td>
     	</tr>
     	<tr id=trdark>
			<td align="right" nowrap>Cajero Solicitante :&nbsp;</td>
			<td >
	      	    <input type="text" name="E02REQCSN" size="5" maxlength="4" value="<%= msgMT.getE02REQCSN()%>">
	      	    <a href="javascript:GetTellerRequest('E02REQCSN','E02REQCSM',document.forms[0].E02REQBNK.value,document.forms[0].E02REQBRN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				<input type="text" name="E02REQCSM" size="40" maxlength="45" value="<%= msgMT.getE02REQCSM()%>" readonly="readonly">      	    
	 		</td>
		</tr> 
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Tipo de Adhesivos : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E02REQTIP" size="5" maxlength="4" value="<%= msgMT.getE02REQTIP() %>">
      	    <a href="javascript:GetCodeCNOFC('E02REQTIP','YJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	    <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">
      	  </td>     
      	</tr>
      	<tr id=trdark> 
		  <td> 
		     <div align="right">Subtipo de Adhesivos : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E02REQSUB" size="5" maxlength="4" value="<%= msgMT.getE02REQSUB() %>">
      	    <a href="javascript:GetCodeAuxCNOFC('E02REQSUB','YI',document.forms[0].E02REQTIP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	    <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">
      	  </td>     
      	</tr>
        <tr id=trclear>          
          <td nowrap>
             <div align="right">Cantidad Solicitada : </div>
          </td>
          <td nowrap>
             <input type="text" name="E02REQRQT" value ="<%= msgMT.getE02REQRQT() %>" onkeypress="enterInteger(event)">
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
       
        
     </table>
    </td>
   </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
  </p>
  
</form>
</body>
</html>
