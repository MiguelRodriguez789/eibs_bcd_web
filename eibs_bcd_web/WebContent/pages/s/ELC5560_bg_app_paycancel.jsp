<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Boleta de Garantia</title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "bolgaran" class= "datapro.eibs.beans.ELC556001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  <%
   String htitle ="";

   if (bolgaran.getE01TYPOPE().equals("1")) {
      htitle ="Pago al Beneficiario";
   } else {
      htitle ="Cancelacion";
   }
  %>

  //builtNewMenu(bg_i_opt);
  //initMenu();


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


<h3 align="center"><%=htitle%> - Boleta de Garantia<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bg_paycancel.jsp,ELC5560"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5560">

  <input type="hidden" id="SCREEN" name="SCREEN" value="3">
  <input type="hidden" id="E01TYPOPE" name="E01TYPOPE" value="<%=bolgaran.getE01TYPOPE()%>">
  <input type="hidden" id="E01LCMACD" name="E01LCMACD" value="<%=bolgaran.getE01LCMACD()%>">
  <input type="hidden" id="E01LCMBNK" name="E01LCMBNK" value="<%=bolgaran.getE01LCMBNK()%>">
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" >
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" >
              <div align="left">
                <input type="text" id="E01LCMCUN" name="E01LCMCUN" size="9" maxlength="9" readonly value="<%= bolgaran.getE01LCMCUN().trim()%>">
              </div>  
            </td>
            <td nowrap width="16%" >
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" >
              <div align="left">
              	<eibsinput:text property="E01CUSNA1" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="16%">
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%">
              <div align="left">
              	<eibsinput:text property="E01LCMACC" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
              	<eibsinput:text property="E01LCMCCY" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true"/>
                </b> </div>
            </td>
            <td nowrap width="16%">
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%">
              <div align="left"><b>
              	<eibsinput:text property="E01LCMPRO" name="bolgaran" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true"/>
                </b> </div>
            </td>
          </tr>
  <tr id="trclear">
  <td align="right" nowrap>Estado : </td>
  	<td colspan="5"><font color="red">
          <% if (bolgaran.getE01LCMSTS().equals("C")) out.print("Cancelado");
             else if (bolgaran.getE01LCMSTS().equals("X")) out.print("Con Aviso de Pago");
             else if (bolgaran.getE01LCMSTS().equals("P")) out.print("Pendiente");
             else out.print("Vigente"); %></font>
         </td></tr></table>
      </td>
    </tr>
  </table>
  <H4>Informaci&oacute;n Relevante</H4>
  <table class=tableinfo>
  <tr>
   <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr id=trdark>
	      <td align=right nowrap>Fecha Apertura :</td>
	      <td>
	      	<eibsinput:date name="bolgaran" fn_year="E01LCMID3" fn_month="E01LCMID1" fn_day="E01LCMID2" readonly="true"/>
		  </td>
	      <td align=right nowrap>Fecha Vcto. :</td>
          <td>
         	 <eibsinput:date name="bolgaran" fn_year="E01LCMEX3" fn_month="E01LCMEX1" fn_day="E01LCMEX2" readonly="true"/>
          </td>
    </tr>
    <tr id=trclear>
      <td align=right nowrap>Monto Origen :</td>
      <td><INPUT type="text" id="E01LCMOAM" name="E01LCMOAM" size="17" readonly value="<%=bolgaran.getE01LCMOAM()%>"> </td>
      <td align=right nowrap>Monto Comision :</td>
      <td><INPUT type="text" id="E01COMAMN" name="E01COMAMN" size="17" readonly value="<%=bolgaran.getE01COMAMN()%>"> </td>
    </tr>
    <tr id=trdark>
      <td align=right nowrap>Monto Reajuste :</td>
      <td colspan=3><INPUT type="text" id="E01REVAMN" name="E01REVAMN" readonly size="17" value="<%=bolgaran.getE01REVAMN()%>"></td>
    </tr>
   </table>
   </td>
  </tr>
  </table>
 <% if (bolgaran.getE01TYPOPE().equals("2")) {%>
 <H4>Cancelacion</H4>
 <table class=tableinfo>
  <tr>
   <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
      <td align=right nowrap>Monto Boleta :</td>
      <td colspan=3>
      	<INPUT type="text" id="E01PAGPRI" name="E01PAGPRI" size="15" maxlength="15" onkeypress="enterDecimal()" value="<%=bolgaran.getE01PAGPRI()%>" onChange="UpdateTotal()" onblur="verifyNum(this)">
      </td>
    </tr>
    <tr id=trclear>
      <td align=right nowrap>Monto Reajuste :</td>
      <td>
      	<INPUT type="text" id="E01PAGREV" name="E01PAGREV" size="15" maxlength="15" onkeypress="enterDecimal()" value="<%=bolgaran.getE01PAGREV()%>" onChange="RecalculateReaj()" onblur="verifyNum(this)">
      </td>
      <td align=right nowrap>Reversion Reajuste :</td>
      <td>
      	<INPUT type="text" id="E01REVREV" name="E01REVREV" size="15" maxlength="15" value="<%=bolgaran.getE01REVREV()%>" readonly>
      </td>
    </tr>
    <tr id=trdark>
      <td align=right nowrap>Monto Comision :</td>
      <td>
      	<INPUT type="text" id="E01PAGCOM" name="E01PAGCOM" onkeypress="enterDecimal()" maxlength="15" size="15" value="<%=bolgaran.getE01PAGCOM()%>" onChange="RecalculateComm()" onblur="verifyNum(this)">
      </td>
      <td align=right nowrap>Reversa Comision :</td>
      <td>
      	<INPUT type="text" id="E01REVCOM" name="E01REVCOM" size="15" maxlength="15" value="<%=bolgaran.getE01REVCOM()%>" readonly>
      </td>
    </tr>
    <tr id=trclear>
      <td align=right nowrap>Total a Pagar :</td>
      <td>
      	<INPUT type="text" id="E01PAGTOT" name="E01PAGTOT" onkeypress="enterDecimal()" size="15" maxlength="15" value="<%=bolgaran.getE01PAGTOT()%>" readonly>
      </td>
      <td align=right nowrap>Fecha Valor :</td>
      <td>
      		<eibsinput:date name="bolgaran" fn_year="E01PAGVD3" fn_month="E01PAGVD1" fn_day="E01PAGVD2" />
      </td>
    </tr>

    <tr id="trclear">
      <td nowrap colspan="4">
      <table id="headTable" class="tableinfo" style="filter:";>
   		  <tr id="trdark">
      		<td nowrap align="center" >Concepto</td>
      		<td nowrap align="center" >Banco </td>
      		<td nowrap align="center" >Sucursal</td>
      		<td nowrap align="center" >Moneda</td>
      		<td nowrap align="center" >Referencia</td>
    	  </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center">
                <input type="text" id="E01PAGEPC" name="E01PAGEPC" value="<%= bolgaran.getE01PAGEPC().trim()%>" size="3" maxlength="3" readonly="readonly">
                <input type="hidden" name="E01PAGEGL" name="E01PAGEGL" value="<%= bolgaran.getE01PAGEGL().trim()%>">
                <input type="text" name="E01PAGECO" name="E01PAGECO" size="25" maxlength="25" readonly value="<%= bolgaran.getE01PAGECO().trim()%>">
              </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" id="E01PAGEBK" name="E01PAGEBK" size="2" maxlength="2" value="<%= bolgaran.getE01PAGEBK().trim()%>" readonly="readonly">
              </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" id="E01PAGEBR" name="E01PAGEBR" size="4" maxlength="4" value="<%= bolgaran.getE01PAGEBR().trim()%>" readonly="readonly">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" id="E01PAGECY" name="E01PAGECY" size="3" maxlength="3" value="<%= bolgaran.getE01PAGECY().trim()%>" readonly="readonly">
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" id="E01PAGEAC" name="E01PAGEAC" size="12" maxlength="12"  value="<%= bolgaran.getE01PAGEAC().trim()%>" readonly="readonly">
              </div>
            </td>
          </tr>
   	  </table>
      </td>
     </tr>
   </table>
   </td>
  </tr>
  </table>
 <% } else {%>
  <H4>Beneficiario</H4>

 <table class=tableinfo>
  <tr>
   <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
      <td align=right nowrap>Monto Boleta :</td>
      <td colspan=3>
      	<INPUT type="text" id="E01PAGPRI" name="E01PAGPRI" size="15" maxlength="15" readonly value="<%=bolgaran.getE01PAGPRI()%>">
      </td>
    </tr>
    <tr id=trclear>
      <td align=right nowrap>Monto Reajuste :</td>
      <td>
      	<INPUT type="text" id="E01PAGREV" name="E01PAGREV" size="15" maxlength="15" readonly value="<%=bolgaran.getE01PAGREV()%>">
      </td>
      <td align=right nowrap>Reversion Reajuste :</td>
      <td>
      	<INPUT type="text" id="E01REVREV" name="E01REVREV" size="15" maxlength="15" value="<%=bolgaran.getE01REVREV()%>" readonly>
      </td>
    </tr>
    <tr id=trclear>
      <td align=right nowrap>Total a Pagar :</td>
      <td>
      	<INPUT type="text" id="E01PAGTOT" name="E01PAGTOT" readonly size="15" maxlength="15" value="<%=bolgaran.getE01PAGTOT()%>" readonly>
      </td>
      <td align=right nowrap>Fecha Valor :</td>
      <td>
            <eibsinput:date name="bolgaran" fn_year="E01PAGVD3" fn_month="E01PAGVD1" fn_day="E01PAGVD2" />
      </td>
    </tr>

    <tr id="trclear">
      <td nowrap colspan="4">
      <table id="headTable" class="tableinfo" style="filter:";>
   		  <tr id="trdark">
      		<td nowrap align="center" >Concepto</td>
      		<td nowrap align="center" >Banco </td>
      		<td nowrap align="center" >Sucursal</td>
      		<td nowrap align="center" >Moneda</td>
      		<td nowrap align="center" >Referencia</td>
    	  </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center" >
                <input type="text" id="E01PAGOPC" name="E01PAGOPC" value="<%= bolgaran.getE01PAGOPC().trim()%>" size="3" maxlength="3" readonly>
                <input type="hidden" id="E01PAGOGL" name="E01PAGOGL" value="<%= bolgaran.getE01PAGOGL().trim()%>">
                <input type="text" id="E01PAGCON" name="E01PAGCON" size="25" maxlength="25" readonly value="<%= bolgaran.getE01PAGCON().trim()%>">
              </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" id="E01PAGOBK" name="E01PAGOBK" size="2" maxlength="2" value="<%= bolgaran.getE01PAGOBK().trim()%>" readonly>
              </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" id="E01PAGOBR" name="E01PAGOBR" size="4" maxlength="4" value="<%= bolgaran.getE01PAGOBR().trim()%>" readonly>
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" id="E01PAGOCY" name="E01PAGOCY" size="3" maxlength="3" value="<%= bolgaran.getE01PAGOCY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" id="E01PAGOAC" name="E01PAGOAC" size="12" maxlength="12"  value="<%= bolgaran.getE01PAGOAC().trim()%>" readonly>
              </div>
            </td>
          </tr>
   	  </table>
      </td>
     </tr>
   </table>
   </td>
  </tr>
  </table>

  <H4>Cargos</H4>

 <table class=tableinfo>
  <tr>
   <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr id=trdark>
      <td align=right nowrap>Monto Comision :</td>
      <td>
      	<INPUT type="text" id="E01PAGCOM" name="E01PAGCOM" readonly maxlength="15" size="15" value="<%=bolgaran.getE01PAGCOM()%>">
      </td>
      <td align=right nowrap>Reversa Comision :</td>
      <td>
      	<INPUT type="text" id="E01REVCOM" name="E01REVCOM" size="15" maxlength="15" value="<%=bolgaran.getE01REVCOM()%>" readonly>
      </td>
    </tr>
    <tr id="trclear">
      <td nowrap colspan="4">
      <table id="headTable" class="tableinfo" style="filter:";>
   		  <tr id="trdark">
      		<td nowrap align="center" >Concepto</td>
      		<td nowrap align="center" >Banco </td>
      		<td nowrap align="center" >Sucursal</td>
      		<td nowrap align="center" >Moneda</td>
      		<td nowrap align="center" >Referencia</td>
    	  </tr>
          <tr id="trclear">
            <td nowrap >
              <div align="center" >
                <input type="text" id="E01PAGEPC" name="E01PAGEPC" value="<%= bolgaran.getE01PAGEPC().trim()%>" size="3" maxlength="3" readonly>
                <input type="hidden" id="E01PAGEGL" name="E01PAGEGL" value="<%= bolgaran.getE01PAGEGL().trim()%>">
                <input type="text" id="E01PAGECO" name="E01PAGECO" size="25" maxlength="25" readonly value="<%= bolgaran.getE01PAGECO().trim()%>">
              </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" id="E01PAGEBK" name="E01PAGEBK" size="2" maxlength="2" value="<%= bolgaran.getE01PAGEBK().trim()%>" readonly>
              </div>
            </td>
            <td nowrap >
              <div align="left">
                <input type="text" id="E01PAGEBR" name="E01PAGEBR" size="4" maxlength="4" value="<%= bolgaran.getE01PAGEBR().trim()%>" readonly>
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" id="E01PAGECY" name="E01PAGECY" size="3" maxlength="3" value="<%= bolgaran.getE01PAGECY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap >
              <div align="center">
                <input type="text" id="E01PAGEAC" name="E01PAGEAC" size="12" maxlength="12"  value="<%= bolgaran.getE01PAGEAC().trim()%>" readonly>
              </div>
            </td>
          </tr>
   	  </table>
      </td>
     </tr>
   </table>
   </td>
  </tr>
  </table>
 <% } %>

</FORM>
</BODY>
</html>
