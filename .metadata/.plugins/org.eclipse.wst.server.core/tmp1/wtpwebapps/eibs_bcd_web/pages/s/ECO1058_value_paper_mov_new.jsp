<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Ingreso Manual de Adhesivos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO105801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<% 
   if (msgMT == null) msgMT = new datapro.eibs.beans.ECO105801Message();
   msgMT.setE01MOVBNK(userPO.getBank());
   msgMT.setE01MOVBRN(userPO.getBranch());   
%>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <% } %>
</head>
<body>

<H3 align="center">Ingreso Manual de Adhesivos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_mov_new,ECO1058"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1058">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>

  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id="trdark"> 	      
	      <td nowrap width="45%"> 
	        <div align="right">Banco/Oficina : </div>
	      </td>
	      <td nowrap width="55%">
	      	<input type="text" name="E01MOVBNK" size="3" maxlength="2" value="<%= msgMT.getE01MOVBNK() %>"><b>-</b> 
	        <input type="text" name="E01MOVBRN" size="5" maxlength="4" value="<%= msgMT.getE01MOVBRN() %>">
	        <a href="javascript:GetBranch('E01MOVBRN',document.forms[0].E01MOVBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
	        <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"> 
	      </td>
     	</tr>
     	<tr id="trdark"> 
		  <td> 
		     <div align="right">Tipo de Papel : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01MOVTIP" size="5" maxlength="4" value="<%= msgMT.getE01MOVTIP() %>">
      	    <input type="text" name="E01MOVTIN" size="35" maxlength="35" value="<%= msgMT.getE01MOVTIN() %>" readonly >
      	    <a href="javascript:GetCodeDescCNOFC('E01MOVTIP','E01MOVTIN','YJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	    <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">
      	  </td>     
      	</tr>
      	<tr id="trdark"> 
		  <td> 
		     <div align="right">Subtipo de Papel : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01MOVSUB" size="5" maxlength="4" value="<%= msgMT.getE01MOVSUB() %>">
      	    <input type="text" name="E01MOVSUN" size="35" maxlength="35" value="<%= msgMT.getE01MOVSUN() %>" readonly >
      	    <a href="javascript:GetCodeDescAuxCNOFC('E01MOVSUB','E01MOVSUN','YI',document.forms[0].E01MOVTIP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	    <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">
      	  </td>     
      	</tr>
        <tr id="trdark">          
          <td nowrap>
             <div align="right">Numero de Serie : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01MOVSER" value ="<%= msgMT.getE01MOVSER() %>" onkeypress="enterInteger(event)">             
          </td>
        </tr>
     	<tr id="trdark"> 	      
	      <td nowrap width="45%"> 
	        <div align="right">Oficina Solicitate: </div>
	      </td>
	      <td nowrap width="55%">
	        <input type="text" name="E01MOVBRS" size="5" maxlength="4" value="<%= msgMT.getE01MOVBRS() %>">
 			<input type="text" name="E01MOVBNS" size="30" maxlength="30" value="<%= msgMT.getE01MOVBNS() %>" readonly="readonly">	        
	        <a href="javascript:GetBranch('E01MOVBRS',document.forms[0].E01MOVBNK.value,'E01MOVBNS')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
	        <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"> 
	      </td>
     	</tr>
		<tr id=trdark>
			<td align="right" nowrap width="45%">Cajero Solicitante :&nbsp;</td>
			<td  width="55%">
	      	    <input type="text" name="E01MOVCSN" size="5" maxlength="4" value="<%= msgMT.getE01MOVCSN()%>">
	      	    <a href="javascript:GetTellerRequest('E01MOVCSN','E01MOVCSM',document.forms[0].E01MOVBNK.value,document.forms[0].E01MOVBRS.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				<input type="text" name="E01MOVCSM" size="40" maxlength="45" value="<%= msgMT.getE01MOVCSM()%>" readonly="readonly">      	    
	 		</td>
		</tr>      	        
       	<tr id="trdark">          
          <td nowrap>
             <div align="right">Codigo Proveedor : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01MOVVEN" size="9" maxlength="9" value="<%= msgMT.getE01MOVVEN().trim()%>">
             <a href="javascript:GetVendor('E01MOVVEN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
        <tr id="trdark">          
          <td nowrap>
             <div align="right">Documento Inicial : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01MOVINI" value ="<%= msgMT.getE01MOVINI() %>" onkeypress="enterInteger(event)">
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
       	<tr id="trdark">          
          <td nowrap>
             <div align="right">Documento Final : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01MOVFIN" value ="<%= msgMT.getE01MOVFIN() %>" onkeypress="enterInteger(event)">
             <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20">             
          </td>
        </tr>
        <tr id="trdark">          
          <td nowrap>
             <div align="right">Cantidad Recibida : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01MOVQTY" value ="<%= msgMT.getE01MOVQTY() %>" onkeypress="enterInteger(event)">
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
