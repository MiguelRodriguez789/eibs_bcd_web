<html>
<head>
<title>Reconciliacion Bancos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>


<jsp:useBean id= "rcbank" class= "datapro.eibs.beans.ERC004001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<H3 align="center">Selección del Banco
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rcbank_enter_selection, ERC0065"></H3>
<hr size="4">

<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC0065?SCREEN=200" >

<h4>&nbsp;</h4>
  <table class="tbenter tableinfo" cellspacing=0 cellpadding=2 width="100%" border="0">
    
    <tr id="trclear">
      <td align="right">Codigo de Banco : </td>
	  <td nowrap width="50%"> 
      	<input type="text" name="E01BRMEID" size="5" maxlength="4" value="<%= rcbank.getE01BRMEID() %>">
        <a href="javascript:GetBankReconciliation('E01BRMEID','E01DSCRBK','E01BRMCTA')">
        	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
        <input type="hidden" name="E01DSCRBK">
      </td>
    </tr>

 	<tr id="trdark"> 
        <td align=CENTER width="50%"> 
          <div align="right">Numero de Cuenta :</div>
        </td>
        <td align=CENTER width="50%"> 
          <div align="left"> 
          	<input type="text" name="E01BRMCTA" size="23" maxlength="20" value="<%= rcbank.getE01BRMCTA() %>">
          </div>
        </td>
    </tr>
        
  </table>

  
	<div align="center"> 
    	<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  	</div>
  

<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
