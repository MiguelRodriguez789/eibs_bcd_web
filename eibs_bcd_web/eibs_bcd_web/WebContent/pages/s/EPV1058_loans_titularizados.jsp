<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.*" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Venta de Cartera / Titularizaci&oacute;n</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="datarec" class="datapro.eibs.beans.EPV105801Message" scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function cancel() {
	getElement("SCREEN").value = 100;
	document.forms[0].submit();
}

function chgStatus(){
	<%-- Called Onchange of Concept Field. Determisn Which Div/Table to Show --%>
	if (getElement("E01NEWTFL").value == ("V")) { // ACH
		$('#vtaCrtera').show();
	} else {
		$('#vtaCrtera').hide();
	} 
}


</SCRIPT>

</head>
<body>
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
%>

<h3 align="center">Venta de Cartera / Titularizaci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="loans_titularizados.jsp, EPV1058"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1058" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E01DLCTFL" id="E01DLCTFL" VALUE="<%=datarec.getE01DLCTFL().trim()%>">

  <%int row = 0; %>
  <h4>&nbsp;</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left">
              	<eibsinput:text property="E01DEACUN" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			  </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E01CUSNA1" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Tipo : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E01DEATYP" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly value="<% if (datarec.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(datarec.getE01DEAACC().trim()); %>">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E01DEACCY" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E01DEAPRO" name="datarec" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Informaci&oacute;n de Venta de Cartera / Titularizaci&oacute;n</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Estado Venta de Cartera / Titularizaci&oacute;n :</div>
            </td>
            <td nowrap width="60%"> 
              <select name="DLCTFL" disabled >
	              <option value=" " <% if (!(datarec.getE01DLCTFL().equals("T") || datarec.getE01DLCTFL().equals("D") || datarec.getE01DLCTFL().equals("V"))) out.print("selected"); %>></OPTION>
	              <option value="T" <% if(datarec.getE01DLCTFL().equals("T")) out.print("selected");%>>Titularizado</OPTION>
	              <option value="D" <% if(datarec.getE01DLCTFL().equals("D")) out.print("selected");%>>Destitularizado</OPTION>
	              <option value="V" <% if(datarec.getE01DLCTFL().equals("V")) out.print("selected");%>>Venta Cartera</OPTION>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Nuevo Estado :</div>
            </td>
            <td nowrap width="60%"> 
              <select name="E01NEWTFL" onchange="chgStatus();" >
	              <option value=" " <% if (!(datarec.getE01NEWTFL().equals("T") || datarec.getE01NEWTFL().equals("D") || datarec.getE01NEWTFL().equals("V"))) out.print("selected"); %>></OPTION>
	              <option value="T" <% if(datarec.getE01NEWTFL().equals("T")) out.print("selected");%>>Titularizado</OPTION>
	              <option value="D" <% if(datarec.getE01NEWTFL().equals("D")) out.print("selected");%>>Destitularizado</OPTION>
	              <option value="V" <% if(datarec.getE01NEWTFL().equals("V")) out.print("selected");%>>Venta Cartera</OPTION>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Entidad Venta de Cartera / Titularizadora :</div>
            </td>
            <td nowrap width="60%"> 
							<eibsinput:help name="datarec" property="E01DLCTCD" fn_param_one="E01DLCTCD" fn_param_two="E01DSCTCD" fn_param_three="K" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" />
							<eibsinput:text name="datarec" property="E01DSCTCD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Motivo :</div>
            </td>
            <td nowrap width="60%"> 
              <select name="E01DLCTMT" >
	              <option value="1" <% if(datarec.getE01DLCTMT().equals("1")) out.print("selected");%>>Normal</OPTION>
	              <option value="2" <% if(datarec.getE01DLCTMT().equals("2")) out.print("selected");%>>Cesion</OPTION>
	              <option value="3" <% if(datarec.getE01DLCTMT().equals("3")) out.print("selected");%>>Sustitucion</OPTION>
	              <option value="4" <% if(datarec.getE01DLCTMT().equals("4")) out.print("selected");%>>Recompras</OPTION>
	              <option value="5" <% if(datarec.getE01DLCTMT().equals("5")) out.print("selected");%>>Readquision</OPTION>
              </select>
            </td>
          </tr>
<!-- 
          <tr id="<= (row % 2 == 1) ? "trdark" : "trclear" ><row++;>">
            <td nowrap width="40%"> 
              <div align="right">Portafolio :</div>
            </td>
            <td nowrap width="60%"> 
            	<eibsinput:cnofc property="E01DLCTPF" name="datarec" flag="B1" fn_code="E01DLCTPF" fn_description="E01DSCTPF" />
            	<eibsinput:text name="datarec" property="E01DSCTPF" eibsType="<=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION>" />
            </td>
          </tr>
          <tr id="<= (row % 2 == 1) ? "trdark" : "trclear" %><row++;>">
            <td nowrap width="40%"> 
              <div align="right">Universalidad :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:cnofc property="E01DLCTUN" name="datarec" flag="B2" fn_code="E01DLCTUN" fn_description="E01DSCTUN" /> 
            	<eibsinput:text name="datarec" property="E01DSCTUN" eibsType="<=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION>" />
            </td>
          </tr>
 -->
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Fecha de Venta :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:date name="datarec" fn_month="E01DLCTDM" fn_day="E01DLCTDD" fn_year="E01DLCTDY" /> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <div id="vtaCrtera">
  <h4>Venta de Cartera</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Saldo Total :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="datarec" property="E01PAGTOT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Valor Venta de Cartera :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="datarec" property="E01PAGVCR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  </div>

  <table class="tbenter" >
	<tr > 
	  <td width="25%"></td> 
	  <td width="25%" align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></td>
	  <td width="25%" align="center"><input id="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="cancel()"></td>
	  <td width="25%"></td>
    </tr>
  </table>

</form>

<script type="text/javascript">
	chgStatus();	  
</script>


</body>
</html>
 