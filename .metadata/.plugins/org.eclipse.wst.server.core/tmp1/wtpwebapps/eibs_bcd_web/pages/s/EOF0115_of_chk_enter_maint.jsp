<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Cheques Oficiales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
	if(isNaN(document.getElementById("E01OFMCKN").value)||(document.getElementById("E01OFMCKN").value.length < 1)){
		alert("Debe ingresar un número de documento valido");
		document.getElementById("E01OFMCKN").value='';
		document.getElementById("E01OFMCKN").focus();
	}else {
		document.forms[0].submit();
	}
}

</SCRIPT>

</head>
<body bgcolor="#FFFFFF">

<h3 align="center">
  <% if (userPO.getOption().equals("3"))
  		 out.print("Mantenimiento Orden de Pago");
 	 else if (userPO.getOption().equals("4")) 	 
 	   		 out.print("Mantenimiento Cheques de Terceros");
  	 else out.print("Mantenimiento Cheques Oficiales");
  %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="of_chk_enter_maint, EOF0115"></h3>
<hr size="4">
<p>&nbsp;</p>

<%  if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115" >
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="400">
  </p>
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
              <input type="text" name="E01OFMCCY" id="E01OFMCCY" size="4" maxlength="3" value="<%=currUser.getE01BCU()%>" >
              <a href="javascript:GetCurrency('E01OFMCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a> 
            </td>
          </tr>
		  <% if (userPO.getOption().equals("3")) { %>          
          <tr> 
            <td nowrap width="50%">               
              <div align="right">N&uacute;mero de Orden :</div>            
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01OFMCKN" id="E01OFMCKN" size="12" maxlength="11" onKeypress="enterInteger(event)">
              <a href="javascript:GetCheck('E01OFMCKN','3','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
            </td>
          </tr>
		  <% } else if (userPO.getOption().equals("4")) {%>   
          <tr> 
            <td nowrap width="50%">               
              <div align="right">N&uacute;mero Referencia :</div>            
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01OFMCKN" id="E01OFMCKN" size="12" maxlength="11" onKeypress="enterInteger(event)">
              <a href="javascript:GetCheck('E01OFMCKN','4','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
            </td>
          </tr>
		  <% } else {%>   
          <tr> 
            <td nowrap width="50%">               
              <div align="right">N&uacute;mero de Cheque :</div>        
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01OFMCKN" id="E01OFMCKN" size="12" maxlength="11" onKeypress="enterInteger(event)">
              <a href="javascript:GetCheck('E01OFMCKN','1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
            </td>
          </tr>
		 <% }%>          
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>

	    <div align="center"> 
    	  <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
   		</div>

<script type="text/javascript">
  document.getElementById("E01OFMCKN").focus();
  document.getElementById("E01OFMCKN").select();
</script>
 
</form>
</body>
</html>
