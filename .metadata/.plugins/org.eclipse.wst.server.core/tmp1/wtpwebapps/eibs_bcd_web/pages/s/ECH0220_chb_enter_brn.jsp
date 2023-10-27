<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Recepcion de Chequeras Universal</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "msgCHKB" class= "datapro.eibs.beans.ECH022001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body>

<H3 align="center">Recepci&oacute;n de Chequeras Universal de Proveedores - <% if (userPO.getOption().equals("L")) out.print("Ciclo Largo"); else out.print("Ciclo Corto"); %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_enter_brn,ECH0220"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0220">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  </p>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     <tr id=trdark> 
      <td nowrap width="40%"> 
        <div align="right">Banco : </div>
      </td>
      <td nowrap colspan=2> 
        <input type="text" name="E01SELBNK" size="3" maxlength="2" value="<%=msgCHKB.getE01SELBNK()%>" onKeypress="enterInteger(event)">
      </td>
     </tr>
     <tr id=trclear> 
      <td nowrap width="40%"> 
        <div align="right">Oficina de Entrega : </div>
      </td>
      <td nowrap colspan=2> 
        <input type="text" name="E01SELBRN" size="5" maxlength="4" value="<%=msgCHKB.getE01SELBRN()%>" onKeypress="enterInteger(event)">
        <a href="javascript:GetBranch('E01SELBRN',document.forms[0].E01SELBNK.value)">
        <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
      </td>
     </tr>
     <tr id=trdark> 
      <td>         
      </td>
      <td><div align="left">Desde </div>
      </td>
      <td><div align="left">Hasta </div>
      </td>
     </tr>
     <tr id=trclear> 
      <td> 
         <div align="right">Fecha de Solicitud : </div>        
      </td>
      <td nowrap> 
      	<eibsinput:date name="msgCHKB" fn_month="E01SELIDM" fn_day="E01SELIDD" fn_year="E01SELIDY" />
      </td>
      <td nowrap> 
      	<eibsinput:date name="msgCHKB" fn_month="E01SELFDM" fn_day="E01SELFDD" fn_year="E01SELFDY" />
      </td>
      </tr>
     </table>
    </td>
   </tr>
  </table>
  <br>
          <div align="center"> 
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
<script type="text/javascript">
  document.forms[0].E01SELBNK.focus();
  document.forms[0].E01SELBNK.select();
</script>
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
</form>
</body>
</html>
