<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript">
function enter(){
	  document.forms[0].submit();
	 }
</script>

</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECH0110" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
  <h3 align="center">Parametros de Control de Chequeras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="checkbooks_enter_parameter.jsp, ECH0110"> 
  </h3>
  <hr size="4">
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="25%" nowrap> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap width="55%"> 
               <input type="text" name="E01CHKBNK" size="3" maxlength="2"  >
            </td>
          </tr>
          <tr>
            <td width="20%" nowrap>&nbsp;</td>
            <td width="25%" nowrap> 
              <div align="right">Moneda :</div>
            </td>
            <td nowrap width="55%"> 
              <input type="text" name="E01CHKCCY" size="4" maxlength="3"  >
              <a href="javascript:GetCurrency('E01CHKCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr>
            <td nowrap width="20%">&nbsp;</td>
            <td nowrap width="25%"> 
              <div align="right"></div>
              <div align="right">Tipo de Cuenta :</div>
            </td>
            <td nowrap width="55%"> 
		        <input type="text" name="E01CHKATY"  size=5 maxlength="4" >
		        <a href="javascript:GetProductRates('E01CHKATY','RT')"> 
		        <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
        <p>&nbsp;</p>
  <p><BR>
  </p>
  <p align="center">&nbsp; </p>
      
</form>
</body>
</html>
