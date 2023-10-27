<html>
<head>
<title>Cheques Oficiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
	if(isNaN(document.getElementById("E01OFMCKN").value)||(document.getElementById("E01OFMCKN").value.length < 1)){
		alert("Debe ingresar un número de Cheque valido");
		document.getElementById("E01OFMCKN").value='';
		document.getElementById("E01OFMCKN").focus();			
	} else {
		document.forms[0].submit();
	}
}

</SCRIPT>
</head>

<body bgcolor="#FFFFFF">
<%  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<h3 align="center">Re-Impresi&oacute;n de Cheques de Gerencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_enter_print, EOF0115"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115P" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="400">
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
              <input type="text" name="E01OFMCCY" id="E01OFMCCY" size="4" maxlength="3">
              <a href="javascript:GetCurrency('E01OFMCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" border="0"></a> 
            </td>
          </tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right">N&uacute;mero de Cheque :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01OFMCKN" id="E01OFMCKN" size="12" maxlength="11" onKeypress="enterInteger(event)">
              <a href="javascript:GetCheck('E01OFMCKN', '1', 'D', 'W')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" border="0" width="25" height="25" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <div align="center"> 
    <input id="EIBSBTN" type=Submit name="Submit" OnClick="CheckNum()" value="Enviar">
  </div>

<script type="text/javascript">
  document.getElementById("E01OFMCKN").focus();
  document.getElementById("E01OFMCKN").select();
</script>

</form>
</body>
</html>
