<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.General"%>
<%@page import="com.datapro.presentation.input.EibsInputConstants"%>
<%@page import="com.datapro.eibs.constants.EibsInputTypes"%>
<%@page import="java.math.BigDecimal"%>
<html>
<head>
<title>XML Files</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

	function goAction(){
		document.forms[0].submit();
	}

</SCRIPT>


</head>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "repInfo" class= "datapro.eibs.beans.EGL810001Message"  scope="session" />


<body bgcolor="#FFFFFF">

<h3 align="center">
<% if (userPO.getOption().equals("CC")) out.print("Catalogo de Cuentas");
	else if (userPO.getOption().equals("BA")) out.print("Balanza de Comprobacion");
	else if (userPO.getOption().equals("PO")) out.print("Polizas del Periodo");
	else if (userPO.getOption().equals("FO")) out.print("Auxiliar de Folios");
	else if (userPO.getOption().equals("AC")) out.print("Auxiliar de Cuentas");
%>		
</h3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="request_file, EGL8100"></h3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL8100">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  </p>
 
  <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr><td>&nbsp;</td></tr>
		   <tr><td>&nbsp;</td></tr>
		    <tr><td>&nbsp;</td></tr>
			 <tr><td>&nbsp;</td></tr>
		  <% if (!userPO.getOption().equals("CC")) { %>
		  <tr> 
            <td nowrap width="50%"> 
              <div align="right">Mes :</div>
            </td>
            <td nowrap width="50%"> 
              <input type="text" name="E01MONTH" size="3" maxlength="2" value="<%=repInfo.getE01MONTH()%>" onKeypress="enterInteger(event)" >
            </td>
          </tr>
          <TR>
         <% } %>
	  <TD ALIGN=right nowrap>
          Año : 
      </TD>
	  <TD ALIGN=left nowrap>
          <select name="E01YEAR">
          	<option value="<%=currUser.getE01RDY()%>">Año Actual</option>
          	<option value="<%=currUser.getBigDecimalE01RDY().subtract(General.ONE)%>">Año Anterior</option>
          </select>
      </TD>
   </TR>
   <TR>
	  <TD ALIGN=right nowrap>
          Tipo de Proceso : 
      </TD>
	  <TD ALIGN=left nowrap>
          <INPUT type="radio" name="E01PRCTYP" value="N" <%=!"C".equals(repInfo.getE01PRCTYP()) ? "checked" : ""%>> Normal 
		<INPUT type="radio" name="E01PRCTYP" value="C" <%="C".equals(repInfo.getE01PRCTYP()) ? "checked" : ""%>> Complementario
      </TD>
   </TR>

        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>


	<div align="center"> 
    	<input class="EIBSBTN" type="button" onclick="goAction()" name="Submit" value="Enviar">
  	</div>


<script type="text/javascript">
  document.forms[0].E01MONTH.focus();
  document.forms[0].E01MONTH.select();
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
