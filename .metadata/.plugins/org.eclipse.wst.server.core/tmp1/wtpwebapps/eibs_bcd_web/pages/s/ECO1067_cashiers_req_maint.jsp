<html> 
<head>
<title>Mantenimiento de Cajeros</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<% 
   int row = 0;
   try { row = Integer.parseInt(request.getParameter("ROW"));} catch (Exception e) {}
   mtList.setCurrentRow(row);
   datapro.eibs.beans.ECO106701Message msgMT = (datapro.eibs.beans.ECO106701Message) mtList.getRecord();
   
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

<H3 align="center">Mantenimiento de Cajeros<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cashiers_req_maint,ECO1067"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1067">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row %>">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">
     	<tr id=trdark> 
	      <td nowrap width="20%"> 
	        <div align="right">Banco : </div>
	      </td>
	      <td nowrap> 
	        <input type="text" name="E01TCHBNK" size="5" maxlength="2" readonly value="<%= msgMT.getE01TCHBNK() %>">
	        <input type="text" name="E01TCHBNN" size="35" maxlength="35" readonly value="<%= msgMT.getE01TCHBNN() %>">
	      </td>
     	</tr>
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Oficina : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01TCHBRN" size="5" maxlength="4" readonly value="<%= msgMT.getE01TCHBRN() %>">
	      	<input type="text" name="E01TCHBRM" size="35" maxlength="35" readonly value="<%= msgMT.getE01TCHBRM() %>">
	      </td>
     	</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Cajero : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01TCHCSN" size="5" maxlength="3" readonly value="<%= msgMT.getE01TCHCSN() %>">
	      	<input type="text" name="E01TCHTID" size="15" maxlength="10" readonly value="<%= msgMT.getE01TCHTID() %>">
	      </td>
     	</tr>     	
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Estatus : </div>        
		  </td>
      	  <td nowrap> 
      	  		<select name="E01TCHSTS">
                    <option value="A" <% if (msgMT.getE01TCHSTS().equals("A")) out.print("selected"); %>>ACTIVO</option>
                    <option value="I" <% if (msgMT.getE01TCHSTS().equals("I")) out.print("selected"); %>>INACTIVO</option>                   
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
