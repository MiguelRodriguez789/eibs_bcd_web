<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html> 
<head>
<title>Consulta Entrega de Documentos Valorados</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import ="datapro.eibs.master.Util" %>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgSearch" class= "datapro.eibs.beans.EVL012001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</head>
<body>

<H3 align="center">Consulta Entrega de Documentos Valorados<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="vl_inquiry_deatail,EVL0120"></H3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0120">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="310">
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trdark> 
	      <td nowrap> 
	        <div align="right">Tipo de Documento : </div>
	      </td>
	      <td nowrap>
	      	<input type="text" name="E01IMPACD" size="3" maxlength="2" readonly value="<%= msgSearch.getE01IMPACD() %>"> 
	      </td>
     	</tr>
     	<tr id=trclear> 
		  <td> 
		     <div align="right">Numero de Operacion : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01IMPACC" size="15" maxlength="12" readonly value="<%= msgSearch.getE01IMPACC() %>">
      	  </td>     
      	</tr>
      	<tr id=trdark>
          <td nowrap>
              <div align="right">Numero Folio Papel Valor : </div>
          </td>
          <td nowrap>
              <input type="text" name="E01IMPSER" size="15" maxlength="12" readonly value="<%= msgSearch.getE01IMPSER() %>">
          </td>
        </tr>
     	<tr id=trclear>
          <td nowrap>
             <div align="right">Sucursal de Retiro : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01IMPBR1" size="5" maxlength="4" value ="<%= msgSearch.getE01IMPBR1() %>" readonly>             
          </td>
        </tr>
      	<tr id=trdark>
          <td nowrap>
             <div align="right">Usuario : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01IMPUSR" value ="<%= msgSearch.getE01IMPUSR() %>" readonly>             
          </td>
        </tr>
        <tr id=trclear>
          <td nowrap>
             <div align="right">Nombre de quien Retira : </div>
          </td>
          <td nowrap>
             <input type="text" name="E01IMPNRE" size="65" maxlength="60" value ="<%= msgSearch.getE01IMPNRE() %>" readonly>             
              <a href="javascript:GetEntregaCheques('','',document.forms[0].E01IMPACC.value,'G')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Autorizados a Entrega" align="middle" border="0"></a>
          </td>
        </tr>
        <tr id=trdark> 
		  <td> 
		     <div align="right">RUT de quien retira : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01IMPRRE" size="27" maxlength="25" value="<%= msgSearch.getE01IMPRRE() %>" readonly>
      	  </td>     
      	</tr>
     </table>
    </td>
   </tr>
  </table>
   <p align="center"> 
    <input id="EIBSBTN" type="submit" name="Submit" value="Regresa">
  </p>
  
</form>
</body>
</html>
