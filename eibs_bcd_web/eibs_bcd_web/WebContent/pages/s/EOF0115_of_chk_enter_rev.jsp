<html>
<head>
<title>Reversión de Cheques de Gerencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
	if(isNaN(document.forms[0].E01OFMCKN.value)||(document.forms[0].E01OFMCKN.value.length < 1)){
		alert("Debe ingresar un número de Cheque valido");
		document.forms[0].E01OFMCKN.value='';
		document.forms[0].E01OFMCKN.focus();
	}else {
		document.forms[0].submit();
	}
}

</SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body bgcolor="#FFFFFF">

<h3 align="center">Reverso de Cheques Oficiales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_enter_rev, EOF0115"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  </p>
 <!-- <h4>Por favor Ingrese el n&uacute;mero del Certificado de Dep&oacute;sito</h4>-->
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td nowrap width="50%">
              <div align="right">C&oacute;digo de Moneda : </div>
            </td>
            <td nowrap width="50%">
              <input type="text" name="E01OFMCCY" size="4" maxlength="3">
              <a href="javascript:GetCurrency('E01OFMCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a> 
            </td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right">N&uacute;mero de Cheque :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01OFMCKN" size="12" maxlength="11" onKeypress="enterInteger(event)">
              <a href="javascript:GetCheck('E01OFMCKN', '1', 'D', 'E')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <div align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="CheckNum()" value="Enviar">
  </div>
  
<script type="text/javascript">
  document.forms[0].E01OFMCKN.focus();
  document.forms[0].E01OFMCKN.select();
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
