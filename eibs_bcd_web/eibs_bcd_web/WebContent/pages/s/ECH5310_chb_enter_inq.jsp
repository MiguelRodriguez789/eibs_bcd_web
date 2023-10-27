<html>  
<head>
<title>Recepcion de Chequeras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 

<jsp:useBean id= "msgCHKB" class= "datapro.eibs.beans.ECH531001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body>

<H3 align="center">Consulta de Solicitudes a la Dispensadora<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_enter_inq, ECH5310"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH5310">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
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
