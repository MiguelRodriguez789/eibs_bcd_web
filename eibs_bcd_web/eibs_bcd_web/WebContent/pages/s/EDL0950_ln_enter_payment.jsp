<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.master.Util" %>
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Pago de Préstamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function CheckNum(){
  if(isNaN(document.forms[0].E01DEAACC.value)||(document.forms[0].E01DEAACC.value.length < 1)){
    alert("Debe ingresar un número de Prestamo valido");
    document.forms[0].E01DEAACC.value='';
    document.forms[0].E01DEAACC.focus();
    return false;
  } else {
    return true;
  }
}

</SCRIPT>
</head>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session"/>
<jsp:useBean id= "lnCancel" class= "datapro.eibs.beans.EDL095001Message"  scope="session" />

<body bgcolor="#FFFFFF">

<% String client = currClient != null ? currClient.getE01CUSCUN() : ""; %>
<% if (userPO.getOption().equals("PP_FV")) { %>
<H3 align="center">Prepago Retrofecha <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_payment, EDL0950"></H3>
<% } else if (userPO.getOption().equals("PP")) { %>
<h3 align="center">Prepago de Pr&eacute;stamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_payment, EDL0950"></h3> 
<% } else { %>
<h3 align="center">Pago de Pr&eacute;stamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_payment, EDL0950"></h3>
<% } %>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0950" onsubmit="return(CheckNum())">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">

  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr> 
            <td nowrap width="50%"> 
              <div align="right">Ingrese el N&uacute;mero del Pr&eacute;stamo :</div>
            </td>
            <% if (userPO.getOption().equals("PP_FV")) { %>
            <td nowrap width="50%"> 
              <input type="text" name="E01DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)" >
              <a href="javascript:GetAccount('E01DEAACC','','10','<%= client %>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <%} else { %>
            <td nowrap width="50%"> 
              <input type="text" name="E01DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)" <%if(!error.getERWRNG().equals("Y") ){ %>  onchange="submitForm();" <% } %>> 
              <a href="javascript:GetAccount('E01DEAACC','','10','<%= client %>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <%} %>
          </tr>
          <% if (userPO.getOption().equals("PP_FV")) { %>
          <tr>
            <td nowrap width="40%"></td>
            <td nowrap width="60%"></td>
          </tr>
          <tr>  
            <td nowrap width="40%"> 
              <div align="right">Fecha Valor :</div>
            </td>
            <td nowrap width="60%">  
              <eibsinput:date name="lnCancel"  fn_month="E01PAGVDM" fn_day="E01PAGVDD" fn_year="E01PAGVDY" /> 
            </td>
          </tr>
          <% } %>
        </table>
      </td>
    </tr>
  </table>
  
  <% if(error.getERWRNG().equals("Y") ){ %>
  <h4 style="text-align:center">
    <input type="checkbox" name="H01FLGWK2" value="A" <%if (lnCancel.getH01FLGWK2().equals("A")) { out.print("checked"); }%>>Aceptar con Advertencias</h4>
  <% } %>    
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>

  <script type="text/javascript">
    document.forms[0].E01DEAACC.focus();
    document.forms[0].E01DEAACC.select();
  </script>
  <% 
     if ( !error.getERRNUM().equals("0")  ) {
       error.setERRNUM("0");
  %>
  <SCRIPT type="text/javascript">;
    showErrors();
  </SCRIPT>
  <% } %>
</form>
</body>

<script type="text/javascript">
function submitForm(){
  document.forms[0].submit();
}
</script>

</html>
