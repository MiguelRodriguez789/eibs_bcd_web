<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.master.*" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="java.lang.Object" %>
<%@page import="com.datapro.presentation.input.EibsInput"%><HTML>   

<HEAD>
<TITLE>
Payment Details
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="record" class="datapro.eibs.beans.EDL015501Message" scope="session"/>
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session"/>

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>

<script language="Javascript1.1" >

function goAction(opt) {
  if(opt == '2'){
    document.forms[0].SCREEN.value = opt;
  }
  document.forms[0].submit();
}

</SCRIPT>

</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Mantenimiento Interes de Gracia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_crn_pay_upd.jsp , EDL0155"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0155" >
  <input TYPE=HIDDEN name="SCREEN" value="7">
  <input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value="test">
  <input type="hidden" name="E01DLCIGF" id="E01DLCIGF" value="<%=record.getE01DLCIGF()%>">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01DEACUN" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" name="E01CUSNA1" size="46" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DLPACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEASPRO" size="5" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  
  <h4 align="left"> Informacion del Pago </h4> 
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%"> <div align="right">Periodo de gracia : </div></td>
            <td nowrap width="30%"> 
              <input type="text" name="DLCIGF" size="30" maxlength="28" readonly value="<% if (record.getE01DLCIGF().equals("")) out.print("Interes Deudor"); else if (record.getE01DLCIGF().equals("1")) out.print("Prepaga los Intereses"); else if (record.getE01DLCIGF().equals("2")) out.print("Cobrar en la 1ra Cuota"); else if (record.getE01DLCIGF().equals("3")) out.print("Cobrar en NN Cuotas"); else if (record.getE01DLCIGF().equals("4")) out.print("Cobrar en Todas las Cuotas"); else out.print(record.getE01DLCIGF().trim()); %>">
            </td>
            <td nowrap width="15%"> <div align="right"></div></td>
            <td nowrap width="30%"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%"> <div align="right">Total Cuotas : </div></td>
            <td nowrap width="30%"> 
              <input TYPE="TEXT" size="3" maxlength="2" name="E01DLCIGN" value="<%=record.getE01DLCIGN()%>" onKeyPress="enterInteger(event)">
            </td>
            <td nowrap width="15%"><div align="right">Cuotas Acumuladas</div></td>
            <td nowrap width="30%"  > 
              <input TYPE="TEXT" size="3" maxlength="2" name="E01DLCIGC" value="<%=record.getE01DLCIGC()%>" onKeyPress="enterInteger(event)">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"><div align="right">Monto Total Interes : </div></td>
            <td nowrap width="30%"> 
              <input TYPE="TEXT" size="16" maxlength="15" name="E01DLCIGA" value="<%=record.getE01DLCIGA()%>" onKeyPress="enterDecimal(event, 2)" class="txtright">
            </td>
            <td nowrap width="15%"><div align="right">Monto Acumulado Interes : </div></td>
            <td nowrap width="30%"  > 
              <input TYPE="TEXT" size="16" maxlength="15" name="E01DLCIGD" value="<%=record.getE01DLCIGD()%>" onKeyPress="enterDecimal(event, 2)" class="txtright">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <BR>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%" align="center"> 
           <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction('1');">
      </td>
      <td width="33%" align="center"> 
           <input id="EIBSBTN" type=button name="Submit" value="Regresar" onClick="goAction('2');">
      </td>       
    </tr>    
  </table>  
	
</FORM>
</BODY>
</HTML>
