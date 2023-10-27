<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "msgCheck" class= "datapro.eibs.beans.ECL0100DSMessage"  scope="session" />

<html>
<head>
<title>Conformación de Cheques</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<%if(currUser.getE01INT().equals("03")){%>

<script type="text/javascript">
function getIdTypeHelp(){
   // Get the client type selected
   var clientTypeSelected="CORPORATIVE";
   for (counter = 0; counter < document.forma.TYPE.length; counter++)
   {
      if (document.forma.TYPE[counter].checked)
        clientTypeSelected = document.forma.TYPE[counter].value; 
   }
   // Display the id screen help 
   if (clientTypeSelected == "CORPORATIVE") 
     GetCode('E01TIIDCL','STATIC_client_help_id_type.jsp?clientType=CORPORATIVE');
   else
     GetCode('E01TIIDCL','STATIC_client_help_id_type.jsp?clientType=PERSONAL');
 }
</script>
<% } %>

</head>

<body bgcolor="#FFFFFF">

<h3 align="center">Conformación de Cheques<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_check_holding_enter.jsp, ECL0100"></h3>
<hr size="4">
<form name="forma" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0100">
    <INPUT TYPE="hidden" NAME="SCREEN" VALUE="1">

  <table class="tableinfo">
<%if(currUser.getE01INT().equals("03")){%>
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%">Identificaci&oacute;n :
            </td>
            <td nowrap align="left" valign="middle" colspan="2"> 
            	<input type="text" name="E01TIIDCL" value="" maxlength="1" size="1" readonly>
				<a href="javascript:GetCode('E01TIIDCL','STATIC_client_help_id_type.jsp?clientType=PERSONAL')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
            	<input type="text" name="E01IDNCLI" value="" size="10" maxlength="9" onBlur="refillLeftField('0',9,'E01IDNCLI');" onKeyPress="enterInteger(event)">
            </td>
          </tr>
        </table>
      </td>
    </tr>
<% } else { %>
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%">N&uacute;mero de Cliente :</td>
            <td nowrap align="left" valign="middle" colspan="2"> 
              <input type="text" name="CUN" value="0" maxlength="9" size="10" onKeypress="enterInteger(event)" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="right" valign="middle" width="49%">Identificaci&oacute;n :
           </td>
            <td nowrap align="left" valign="middle" colspan="2"> 
              <input type="text" name="IDN" value="" maxlength="15" size="16">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" colspan="3" > 
              <div align="center">Tipo de Cliente</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap align="right" valign="middle" colspan="2"> Corporativo 
              :</td>
            <td nowrap width="46%" align="left" valign="middle"> 
              <input type="radio" name="TYPE" value="CORPORATIVE">
            </td>
          </tr>
          <tr  id="trclear"> 
            <td nowrap colspan="2" align="right" valign="middle"> 
              Personal :</td>
            <td nowrap width="46%" align="left" valign="middle"> 
              <input type="radio" name="TYPE" value="PERSONAL" checked>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap colspan="2" align="right" valign="middle"> Otros :</td>
            <td nowrap width="46%" align="left" valign="middle"> 
              <input type="radio" name="TYPE" value="OTHER">
            </td>
          </tr>
        </table>
      </td>
    </tr>
<% } %>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
</form>
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
</body>
</html>
