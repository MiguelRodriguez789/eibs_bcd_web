<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sistema Bancario: Mantenedor Convenios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "bank" class= "datapro.eibs.beans.ERC100001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body>
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

<H3 align="center">Resultado Satisfactorio - Procesar Cartola para Reconciliacion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bank_reconciliation_enter.jsp, ERC1000"></H3>

<hr size="4">
<p>&nbsp;</p>

  <h4>&nbsp;</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">     


		    <tr id="trdark">
		      <td width="30%"> 
		        <div align="right"> Banco : </div>
		      </td>
		      <td width="70%"> 
		        <div align="left">
		        <b>
		        <%= bank.getE01BRMEID().trim()%> - <%= bank.getE01BRMNME().trim()%> 
		        </b>
		        </div>
		      </td>
		    </tr>
		    <tr id="trclear">
		      <td width="30%"> 
		        <div align="right">Nombre del Archivo Procesado : </div>
		      </td>
		      <td width="70%"> 
		        <div align="left"> 
		        <b>
		        	<%= bank.getE01BRMFNM().trim()%>
				</b>		        			       
		        </div>
		      </td>
		    </tr>
		    <tr id="trdark">
		      <td width="30%"> 
		        <div align="right">Numero Cuenta en el Banco : </div>
		      </td>
		      <td width="70%"> 
		        <div align="left">
		          <b> 
		          <%= bank.getE01BRMCTA().trim()%>
		          </b>
		        </div>
		      </td>
		    </tr>
		    <tr id="trclear">
		      <td width="30%"> 
		        <div align="right">Numero Cuenta en el IBS : </div>
		      </td>
		      <td width="70%"> 
		        <div align="left">
		        	<b> 
					<%= bank.getE01BRMACC().trim()%>
					</b>
		        </div>
		      </td>
		    </tr>
  
        </table>                       
        </td>
    </tr>
  </table>
  
<br>

<table class="tableinfo" width="100%">
    <tr > 
      <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">     
		    <tr>
		    	<td >
				<div align="center">
  					<h3>
  						<br>Archivo Procesado con exito.<br>
  					</h3>
  				 </div>		    
		      </td>
		    </tr>
		 </table>
	  </td>
	</tr>
</table>

<br>
</body>
</html>
