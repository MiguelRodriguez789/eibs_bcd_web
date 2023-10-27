<html> 
<head>
<title>Mantenimiento de Niveles Adhesivos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<% 
   int row = 0;
   try { row = Integer.parseInt(request.getParameter("ROW"));} catch (Exception e) {}
   mtList.setCurrentRow(row);
   datapro.eibs.beans.ECO105401Message msgMT = (datapro.eibs.beans.ECO105401Message) mtList.getRecord();
   
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

<H3 align="center">Mantenimiento de Niveles Adhesivos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_lvl_maint,ECO1054"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1054">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row %>">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trclear> 
	      <td nowrap width="20%"> 
	        <div align="right">Banco : </div>
	      </td>
	      <td nowrap> 
	        <input type="text" name="E01LVLBNK" size="3" maxlength="2" readonly value="<%= msgMT.getE01LVLBNK() %>">
	        <input type="text" name="E01LVLBNN" size="35" maxlength="35" readonly value="<%= msgMT.getE01LVLBNN() %>">
	      </td>
     	</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Oficina : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01LVLBRN" size="5" maxlength="4" readonly value="<%= msgMT.getE01LVLBRN() %>">
	      	<input type="text" name="E01LVLBRM" size="35" maxlength="35" readonly value="<%= msgMT.getE01LVLBRM() %>">
	      </td>
     	</tr>
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Cajero Solicitante : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01LVLCSN" size="5" maxlength="4" readonly value="<%= msgMT.getE01LVLCSN() %>">
	      	<input type="text" name="E01LVLCSM" size="40" maxlength="45" readonly value="<%= msgMT.getE01LVLCSM() %>">
	      </td>
     	</tr>     	
     	<tr id=trdark> 
		  <td> 
		     <div align="right">Tipo Adhesivos : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01LVLTIP" size="5" maxlength="4" readonly value="<%= msgMT.getE01LVLTIP() %>">
      	    <input type="text" name="E01LVLTIN" size="35" maxlength="35" readonly value="<%= msgMT.getE01LVLTIN() %>">
      	  </td>     
      	</tr>
      	<tr id=trclear>
          <td nowrap>
              <div align="right">Subtipo Adhesivos : </div>
          </td>
          <td nowrap>
              <input type="text" name="E01LVLSUB" size="5" maxlength="4" readonly value="<%= msgMT.getE01LVLSUB() %>">
              <input type="text" name="E01LVLSUN" size="35" maxlength="35" readonly value="<%= msgMT.getE01LVLSUN() %>"> 
          </td>
        </tr>
        <tr id=trdark>
          <td nowrap>
             <div align="right">Stock Minimo : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01LVLMIN" value ="<%= msgMT.getE01LVLMIN() %>" onkeypress="enterInteger(event)">             
          </td>
        </tr>
        <tr id=trclear>
          <td nowrap>
             <div align="right">Stock Maximo : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01LVLMAX" value ="<%= msgMT.getE01LVLMAX() %>" onkeypress="enterInteger(event)">             
          </td>
        </tr>
<%--         
        <tr id=trdark>
          <td nowrap>
             <div align="right">Cantidad a Pedir : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01LVLQTY" value ="<%= msgMT.getE01LVLQTY() %>" onkeypress="enterInteger(event)">             
          </td>
        </tr>
--%>        
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
