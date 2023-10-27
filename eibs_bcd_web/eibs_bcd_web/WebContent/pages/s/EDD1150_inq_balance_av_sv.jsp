<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page  import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Consulta de Cuentas sin GMF</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="rtCancel" class="datapro.eibs.beans.EDD115001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function CheckAcc(){
document.forms[0].submit();
  }


</SCRIPT>
</head>
<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 String blocked = "";
	if (!currUser.getE01AUT().equals("B")) {
		blocked = "readonly disabled";
	} 

%> 
<H3 align="center">Consulta de Cuentas Sin GMF<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="inq_balance_av_sv.jsp, EDD1150"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1150">
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="ACMACD" id="ACMACD" value="<%= rtCancel.getE01ACMACD().trim()%>">
 
 <% int row = 0;%>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01ACMCUN" size="10" maxlength="9" value="<%= rtCancel.getE01ACMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text"  name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= rtCancel.getE01CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text"  name="E01ACMACC" id="E01ACMACC" size="13" maxlength="12" value="<%= rtCancel.getE01ACMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text"  name="E01ACMCCY" size="3" maxlength="3" value="<%= rtCancel.getE01ACMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text"  name="E01ACMPRO" size="4" maxlength="4" readonly value="<%= rtCancel.getE01ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
    
  <h4>Saldos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"> <b>Saldo Contable :</b></div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="rtCancel" property="E01GRSBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">(-) Monto Diferido :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="rtCancel" property="E01UNCBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">(-) Monto Retenido :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="rtCancel" property="E01HLDAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"> <b>Saldo Neto :</b></div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="rtCancel" property="E01NETBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Comisiones :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01COMAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Otros Cargos :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01DDCAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Pendiente Amortizar :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01AMOAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>  
           <tr id="trclear">
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Monto Rte. Fte. :</div>
            </td>
            <td nowrap width="60%" height="19">
             <eibsinput:text name="rtCancel" property="E01MONRFT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>  
          <tr id="trdark">
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Monto G.M.F :</div>
            </td>
            <td nowrap width="60%" height="19">
             <eibsinput:text name="rtCancel" property="E01MONIDB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19">
              <div align="right"><b>Monto Maximo del Retiro :</b></div>
            </td>
            <td nowrap width="60%" height="19">
            <% if (Util.fcolorCCY(rtCancel.getE01PAGAMT().trim()).startsWith("<FONT COLOR=RED>")) { %>
		        <eibsinput:text name="rtCancel" property="E01PAGAMT" style="color:RED" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
			<% } else { %>
		        <eibsinput:text name="rtCancel" property="E01PAGAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
			<% } %>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <p align="center"> 
    <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
  </p>

 </form>
</body>
</html>
