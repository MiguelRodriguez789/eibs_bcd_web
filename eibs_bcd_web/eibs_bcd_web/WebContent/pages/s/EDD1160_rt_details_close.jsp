<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Cierre Masivo de Cuentas</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id= "close" class= "datapro.eibs.beans.EDD116001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


 
</head>

<body bgcolor="#FFFFFF">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 %>
<h3 align="center">Cierre Masivo de Cuentas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_details_close, EDD1160" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSEDD1160">

    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <input type=HIDDEN name="E01ACCREF" value="<%= close.getE01ACCREF()%>">
  <h4>Información Básica</h4>
  <table class="tableinfo">
          <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
          <tr id="trdark"> 
            <td nowrap width="22%"> 
              <div align="right">Tipo de Producto :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01ACMATY" size="5" maxlength="4" value="<%= close.getE01ACMATY()%>">
                <a href="javascript:GetProductRates('E01ACMATY','RT')"> <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%"> 
              <div align="right">Tipo de Convenio :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E01ACMUC3" size="4" maxlength="3" value="<%= close.getE01ACMUC3()%>">
              <a href="javascript:GetCodeCNOFC('E01ACMUC3','2C')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="20%" align=right>Raz&oacute;n para Cancelaci&oacute;n 
              : </td>
            <td nowrap>
              <div align="left">
                <input type="text" name="E01CANRSN" size="4" maxlength="3" value="<%= close.getE01CANRSN()%>">
                <a href="javascript:GetCodeCNOFC('E01CANRSN','50')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" align=right> Agencia : </td>
            <td nowrap> 
              <input type="text" name="E01ACMBRN" size="5" maxlength="4" value="<%= close.getE01ACMBRN()%>">
              <a href="javascript:GetBranch('E01ACMBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="10%" > 
              <input type="text" onKeyPress="enterInteger(event)" name="E01PAGOGL" size="18" maxlength="16" value="<%= close.getE01PAGOGL().trim()%>">
              <a href="javascript:GetLedger('E01PAGOGL','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" align=right> 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap> 
              <input type="text" onKeyPress="enterInteger(event)" name="E01PAGOCN" size="9" maxlength="8" value="<%= close.getE01PAGOCN().trim()%>">
              <a href="javascript:GetCostCenter('E01PAGOCN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></td>
          </tr>
        </table>
        </td>
      </tr>


</table>
  <div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
</form>
</body>
</html>
