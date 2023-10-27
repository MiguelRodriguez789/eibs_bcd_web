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

<script type="text/javascript">
 function enterCode(){
	
	if (trim(document.forms[0].E01BRMEID.value).length > 0) {
	    return true;
	}else{
		alert("Es requerido que se entre un valor");
		document.forms[0].E01BRMEID.focus();
		return false;
	}
 }
</script>

</head>

<body>
 
<H3 align="center">Carga de Cartolas para Reconciliacion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bank_reconciliation_enter.jsp, ERC1000"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERC1000" 
onsubmit="return(enterCode());"  enctype="multipart/form-data">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

  <h4>&nbsp;</h4>
  <table class="tbenter tableinfo" cellspacing=0 cellpadding=2 width="100%" border="0"> 
    <tr id="trdark">
      <td width="50%"> 
        <div align="right">Codigo de Banco : </div>
      </td>
      <td width="50%"> 
        <div align="left"> 
          <input type="text" name="E01BRMEID" size="5" maxlength="4" value="<%= bank.getE01BRMEID().trim()%>">
            <a href="javascript:GetBankReconciliation('E01BRMEID','E01DSCRBK','E01BRMCTA')">
            <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
          <input type="hidden" name="E01DSCRBK">
        </div>
      </td>
    </tr>

  	<tr id="trdark"> 
        <td align=CENTER width="50%"> 
          <div align="right">Numero de Cuenta :</div>
        </td>
        <td align=CENTER width="50%"> 
          <div align="left"> 
 	         <input type="text" name="E01BRMCTA" size="23" maxlength="20" value="<%= bank.getE01BRMCTA().trim()%>">
          </div>
        </td>
      </tr>
  	<tr id="trdark"> 
        <td align=CENTER width="50%"> 
          <div align="right">Seleccione Archivo :</div>
        </td>
        <td align=CENTER width="50%"> 
          <div align="left"> 
 	         <input type="file" name="file" size="50" >
          </div>
        </td>
      </tr>
        
        
  </table>
  <p align="center">
      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
<script type="text/javascript">
  document.forms[0].E01BRMEID.focus();
  document.forms[0].E01BRMEID.select();
</script>
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
