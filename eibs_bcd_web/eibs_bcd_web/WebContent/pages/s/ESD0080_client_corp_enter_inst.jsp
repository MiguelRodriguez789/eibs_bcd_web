<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Instrucciones Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


   <SCRIPT type="text/javascript">
       
     // builtNewMenu(client_corp_opt);
 
   </SCRIPT>


<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
    //out.println("<SCRIPT> initMenu(); </SCRIPT>");
 
%> 
<h3 align="center">Instrucciones Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_corp_enter_inst, ESD0080"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0082">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="62">
  </p><br>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%"> 
              <div align="right">Cliente :</div>
            </td>
            <td nowrap align="left" valign="middle" colspan="2"> 
              <input type="text" name="E11CUS" maxlength="9" size="10">
              <a href="javascript:GetCustomerDescId('E11CUS','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
          </tr>                
          <tr id="trclear"> 
            <td nowrap align="right" valign="middle" width="49%"> 
              <div align="right">C�digo Moneda :</div>
            </td>
            <td nowrap align="left" valign="middle" colspan="2"> 
              <input type="text" name="E11CCY" maxlength="3" size="4">
              <a href="javascript:GetCurrency('E11CCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap align="right" valign="middle" width="49%"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap align="left" valign="middle" colspan="2">
              <select name="E11TYP">
                <option value=" "></option>
                <option value="1">Por Omisi�n</option>
                <option value="2">Inversiones</option>
                <option value="3">Moneda Extranjera</option>
                <option value="4">FRA</option>
              </select>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center"> 
   <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>

</form>
</body>
</html>
