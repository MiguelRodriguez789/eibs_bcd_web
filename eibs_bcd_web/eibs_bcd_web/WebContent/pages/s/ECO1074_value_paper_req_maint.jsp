<html> 
<head>
<title>Mantenimiento Tipos/Subtipos Adhesivos</title>
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
   datapro.eibs.beans.ECO107401Message msgMT = (datapro.eibs.beans.ECO107401Message) mtList.getRecord();
   
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

<H3 align="center">Mantenimiento de Pedidos Adhesivos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_req_maint,ECO1074"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1074">
 
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="ROW" VALUE="<%= row %>">
  
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0"> 
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Tipo Adhesivo : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01ADHTIP" size="5" maxlength="4" readonly value="<%= msgMT.getE01ADHTIP() %>">
      	    <input type="text" name="E01ADHDTP" size="35" maxlength="35" readonly value="<%= msgMT.getE01ADHDTP() %>">
      	  </td>     
      	</tr>
      	<tr id=trdark>
          <td nowrap>
              <div align="right">Subtipo Adhesivo : </div>
          </td>
          <td nowrap>
              <input type="text" name="E01ADHSUB" size="5" maxlength="4" readonly value="<%= msgMT.getE01ADHSUB() %>">
              <input type="text" name="E01ADHDST" size="35" maxlength="35" readonly value="<%= msgMT.getE01ADHDST() %>"> 
          </td>
        </tr>       
     	<tr id=trclear> 
	      <td nowrap width="20%"> 
	        <div align="right">Banco : </div>
	      </td>
	      <td nowrap> 
	        <input type="text" name="E01ADHBNK" size="3" maxlength="2" readonly value="<%= msgMT.getE01ADHBNK() %>">
	      </td>
     	</tr>
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Moneda : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01ADHCCY" size="5" maxlength="4" readonly value="<%= msgMT.getE01ADHCCY() %>">
	      </td>
     	</tr>     	
        <tr id=trclear>
          <td nowrap>
             <div align="right">Cuenta Contable : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01ADHGLB" size="17" maxlength="16" value ="<%= msgMT.getE01ADHGLB() %>" onkeypress="enterInteger(event)" readonly>
             						  <!-- GetLedgerExtras(name, bnk, ccy, apc, desc, prodType,ccyback,desccy,bnkback)-->
             <A id="con1" href="javascript:GetLedgerExtras('E01ADHGLB','','','','','','E01ADHCCY','','E01ADHBNK')">
           		<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Cuenta Contable" border="0" align="top">
           	 </A>
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
