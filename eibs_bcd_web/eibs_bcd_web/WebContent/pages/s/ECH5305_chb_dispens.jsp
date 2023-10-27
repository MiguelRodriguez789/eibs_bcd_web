<html>
<head>
<title>Recepcion de Chequeras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 

<jsp:useBean id= "msgCHKBSend" class= "datapro.eibs.beans.ECH530501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>
<body>

<H3 align="center">Solicitud Manual de Dispensadora<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_dispens, ECH5305"></H3>

<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH5305">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  </p>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     <tr id=trdark> 
      <td nowrap width="16%"> 
        <div align="right">Cliente : </div>
      </td>
      <td nowrap width="16%"> 
      	<div align="left"> 
        	<input type="text" name="E01CHPCUN" size="10" maxlength="9" value="<%=msgCHKBSend.getE01CHPCUN()%>" readonly>
        </div>
      </td>
      <td nowrap width="16%"> 
        <div align="right">Nombre : </div>
      </td>
      <td nowrap width="16%"> 
      	<div align="left"> 
        <input type="text" name="E01CHPNO1" size="50" maxlength="45" value="<%=msgCHKBSend.getE01CHPNO1()%>" readonly>
      	</div> 
      </td>
     </tr>
     <tr id=trclear> 
      <td nowrap width="16%"> 
        <div align="right">Cuenta : </div>
      </td>
      <td nowrap width="16%"> 
        <input type="text" name="E01CHPACC" size="13" maxlength="12" value="<%=msgCHKBSend.getE01CHPACC()%>" readonly>
      </td>
      <td nowrap width="16%"> 
        <div align="right">Oficina : </div>
      </td>
      <td nowrap width="16%"> 
        <input type="text" name="E01CHPBRN" size="5" maxlength="4" value="<%=msgCHKBSend.getE01CHPBRN()%>" readonly>
		<input type="text" name="E01CHPBNA" size="50" maxlength="45" value="<%=msgCHKBSend.getE01CHPBNA()%>" readonly>
      </td>
     </tr>
     <tr id=trdark> 
      <td nowrap width="16%"> 
         <div align="right">Tipo de Chequera : </div>        
      </td>
      <td nowrap width="16%"> 
      	  <input type="text" name="E01CHPTCB" size="4" maxlength="3" value="<%=msgCHKBSend.getE01CHPTCB()%>" >
      	  <a href="javascript:GetTypCHK('E01CHPTCB','','<%= msgCHKBSend.getE01CHPIPA().substring(0,4) %>','VEB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      </td>
      <td nowrap width="16%"> 
        <div align="right">Numero de Chequeras : </div>
      </td>
      <td nowrap width="16%"> 
        <input type="text" name="E01CHPNSC" size="3" maxlength="2" value="<%=msgCHKBSend.getE01CHPNSC()%>">
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
  document.forms[0].E01CHPNSC.focus();
  document.forms[0].E01CHPNSC.select();
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
