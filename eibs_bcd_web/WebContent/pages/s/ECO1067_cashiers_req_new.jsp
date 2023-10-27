<html> 
<head>
<title>Creacion de Cajeros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO106702Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<%

int NEW = 0;
try { NEW = Integer.parseInt(request.getParameter("NEW"));} catch (Exception e) {}
if (NEW == 1) {
msgMT.destroy();
}
 
if (msgMT == null) msgMT = new datapro.eibs.beans.ECO106702Message();
	msgMT.setE02TCHBNK(userPO.getBank());
	msgMT.setE02TCHBRN(userPO.getBranch());
      
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

<H3 align="center">Creacion de Cajeros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cashiers_req_new,ECO1067"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1067">
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
	      	<input type="text" name="E02TCHBNK" size="3" maxlength="2" value="<%= msgMT.getE02TCHBNK() %>"><b>-</b> 
	        <input type="text" name="E02TCHBRN" size="5" maxlength="4" value="<%= msgMT.getE02TCHBRN() %>">
	        <a href="javascript:GetBranch('E02TCHBRN',document.forms[0].E02TCHBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
	        <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"> 
	      </td>
     	</tr>
     	<tr id=trdark>
			<td align="right" nowrap>Cajero :&nbsp;</td>
			<td >
	      	     <input type="text" name="E02TCHCSN" size="5" maxlength="3" value="<%= msgMT.getE02TCHCSN()%>" onkeypress="enterInteger(event)">	      	    
				 <input type="text" name=E02TCHTID size="15" maxlength="10" value="<%= msgMT.getE02TCHTID()%>">      	    
	 		</td>
		</tr> 
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Estatus : </div>        
		  </td>
      	  <td nowrap> 
      	  		<select name="E02TCHSTS">
                    <option value="A" <% if (msgMT.getE02TCHSTS().equals("A")) out.print("selected"); %>>ACTIVO</option>
                    <option value="I" <% if (msgMT.getE02TCHSTS().equals("I")) out.print("selected"); %>>INACTIVO</option>                   
                </select>                 
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
