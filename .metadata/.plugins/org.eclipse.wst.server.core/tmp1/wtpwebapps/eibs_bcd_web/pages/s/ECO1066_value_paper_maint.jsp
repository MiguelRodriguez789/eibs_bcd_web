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
   datapro.eibs.beans.ECO106602Message msgMT = (datapro.eibs.beans.ECO106602Message) mtList.getRecord();
   
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
	        <input type="text" name="E01ADHBNK" size="3" maxlength="2" readonly value="<%= msgMT.getE01ADHBNK() %>">
	        <input type="text" name="E01ADHBNN" size="35" maxlength="35" readonly value="<%//= msgMT.getE01ADHBNN() %>">
	      </td>
     	</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Oficina : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01ADHBRN" size="5" maxlength="4" readonly value="<%= msgMT.getE01ADHBRN() %>">
	      	<input type="text" name="E01ADHBRM" size="35" maxlength="35" readonly value="<%//= msgMT.getE01ADHBRM() %>">
	      </td>
     	</tr>
     	<tr id=trclear> 
	      <td nowrap> 
	        <div align="right">Cajero Solicitante : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01ADHCSN" size="5" maxlength="4" readonly value="<%= msgMT.getE01ADHCSN() %>">
	      	<input type="text" name="E01ADHCSM" size="40" maxlength="45" readonly value="<%= msgMT.getE01ADHCSM() %>">
	      </td>
     	</tr>     	
     	<tr id=trdark> 
		  <td> 
		     <div align="right">Tipo Papel : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01ADHTIP" size="5" maxlength="4" readonly value="<%= msgMT.getE01ADHTIP() %>">
      	    <input type="text" name="E01ADHTIN" size="35" maxlength="35" readonly value="<%= msgMT.getE01ADHTIN() %>">
      	  </td>     
      	</tr>
      	<tr id=trclear>
          <td nowrap>
              <div align="right">Subtipo Papel : </div>
          </td>
          <td nowrap>
              <input type="text" name="E01ADHSUB" size="5" maxlength="4" readonly value="<%= msgMT.getE01ADHSUB() %>">
              <input type="text" name="E01ADHSUN" size="35" maxlength="35" readonly value="<%= msgMT.getE01ADHSUN() %>"> 
          </td>
        </tr>
        <tr id=trdark>
          <td nowrap>
             <div align="right">Stock Minimo : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01ADHMIN" value ="<%//= msgMT.getE01ADHMIN() %>" onkeypress="enterInteger(event)">             
          </td>
        </tr>
        <tr id=trclear>
          <td nowrap>
             <div align="right">Stock Maximo : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01ADHMAX" value ="<%//= msgMT.getE01ADHMAX() %>" onkeypress="enterInteger(event)">             
          </td>
        </tr>
        <tr id=trdark>
          <td nowrap>
             <div align="right">Cantidad a Pedir : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01ADHQTY" value ="<%//= msgMT.getE01ADHQTY() %>" onkeypress="enterInteger(event)">             
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
