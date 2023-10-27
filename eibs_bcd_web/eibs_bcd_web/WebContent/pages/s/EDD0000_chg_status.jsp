<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Cambio de Status de Cuenta</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtStatus" class="datapro.eibs.beans.EDD000002Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_m_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_m_opt);
<%   
}
else if ( userPO.getOption().equals("CP") ) {
%>
	builtNewMenu(cpar_m_opt);
<%   
}
%>

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>


<H3 align="center">Cambio de Status de Cuenta 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_chg_status, EDD0000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="16">
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E02ACMCUN" readonly size="10" maxlength="9" value="<%= rtStatus.getE02ACMCUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="E02CUSNA1" size="45" readonly maxlength="45" value="<%= rtStatus.getE02CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E02ACMACC" size="13" readonly maxlength="12" value="<%= rtStatus.getE02ACMACC().trim()%>">
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= rtStatus.getE02ACMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E02ACMPRO" size="4" readonly maxlength="4" value="<%= rtStatus.getE02ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <BR>
 <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="41%"> 
              <div align="right">Status de la Cuenta:</div>
            </td>
            <td nowrap width="59%"> 
              <select name="E02ACMAST">
                <option value=" " <% if (!(rtStatus.getE02ACMAST().equals("A") ||rtStatus.getE02ACMAST().equals("C")
				||rtStatus.getE02ACMAST().equals("I")||rtStatus.getE02ACMAST().equals("D")
				||rtStatus.getE02ACMAST().equals("O")||rtStatus.getE02ACMAST().equals("E")
				||rtStatus.getE02ACMAST().equals("T"))) out.print("selected"); %>></option>
                <option value="A" <% if (rtStatus.getE02ACMAST().equals("A")) out.print("selected"); %>>Cuenta Activa</option>
                <option value="C" <% if (rtStatus.getE02ACMAST().equals("C")) out.print("selected"); %>>Cuenta Cancelada</option>
                <option value="I" <% if (rtStatus.getE02ACMAST().equals("I")) out.print("selected"); %>>Cuenta Inactiva 1</option>
                <option value="D" <% if (rtStatus.getE02ACMAST().equals("D")) out.print("selected"); %>>Cuenta Inactiva 2</option>
                <option value="O" <% if (rtStatus.getE02ACMAST().equals("O")) out.print("selected"); %>>Cuenta Controlada</option>
				<option value="E" <% if (rtStatus.getE02ACMAST().equals("E")) out.print("selected"); %>>Cuenta Embargada</option>
				<option value="T" <% if (rtStatus.getE02ACMAST().equals("T")) out.print("selected"); %>>Acepta Sólo Depósitos</option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="41%"> 
              <div align="right">Cambiado por (Funcionario):</div>
            </td>
            <td nowrap width="59%"> 
              <input type="text" name="E02ACMUIN" size="5" maxlength="4" value="<%= rtStatus.getE02ACMUIN().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02ACMUIN','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="41%" height="23"> 
              <div align="right">Fecha de Cambio:</div>
            </td>
            <td nowrap width="59%" height="23"> 
              <eibsinput:date name="rtStatus"  fn_month="E02ACMCHM" fn_day="E02ACMCHD" fn_year="E02ACMCHY" /> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="41%" height="19"> 
              <div align="right">Cambiar Fecha/ Ultima Actualizaci&oacute;n</div>
            </td>
            <td nowrap width="59%" height="19"> 
              <input type="hidden" name="E02ACMACT">
              <input type="radio" name="CE02ACMACT" value="Y" onClick="document.forms[0].E02ACMACT.value='Y'"
			  <%if(rtStatus.getE02ACMACT().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE02ACMACT" value="N" onClick="document.forms[0].E02ACMACT.value='N'"
			  <%if(rtStatus.getE02ACMACT().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="41%" height="19"> 
              <div align="right">Descripci&oacute;n:</div>
            </td>
            <td nowrap width="59%" height="19"> 
              <input type="text" name="E02ADECRI" size="50" maxlength="60" value="<%= rtStatus.getE02ADECRI().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
          <div align="center"> 
            <input class="EIBSBTN" type=submit name="Submit" value="Enviar">
          </div>
  </form>
</body>
</html>
