<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Consulta de Activos Fijos / Amortizaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX00001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">


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
<h3 align="center">Consulta de Activos Fijos / Amortizaciones
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_inquiry.jsp, EFIX000"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000" >
  <input type=HIDDEN name="SCREEN" value="1000">
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >

          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Activo Fijo/ IDAmortizaci&oacute;n :</div>
            </td>
            <td nowrap width="16%"> 
                <input type="text" name="E01FIXASN" size="13" maxlength="12" value="<%= fix.getE01FIXASN()%>" readonly>
            </td>
            <td nowrap width="16%" > 
              <div align="right">Categor�a :</div>
            </td>
            <td nowrap width="16%"> 
                <input type="text" name="E01FIXGRP" size="3" maxlength="2" value="<%= fix.getE01FIXGRP()%>" readonly>
                <input type="text" name="E01GRPDSC" size="32" maxlength="30" value="<%= fix.getE01GRPDSC().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right">N�mero de Placa :</div>
            </td>
            <td nowrap width="16%"> 
                <input type="text" name="E01FIXREF" size="12" maxlength="10" value="<%= fix.getE01FIXREF()%>" readonly>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Banco / Sucursal :</div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"> 
                <input type="text" name="E01FIXBNK" size="3" maxlength="2" value="<%= fix.getE01FIXBNK()%>" readonly>
                <input type="text" name="E01FIXBRN" size="5" maxlength="4" value="<%= fix.getE01FIXBRN()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="16%"> 
              <input type="text" name="E01FIXGLN" size="17" maxlength="16" value="<%= fix.getE01FIXGLN()%>" readonly>
              <input type="text" name="E01GLNDSC" size="32" maxlength="30" value="<%= fix.getE01GLNDSC().trim()%>" readonly>
            </td>
            <td nowrap width="16%"> 
              <div align="right">Clasificaci�n :</div>
            </td>
            <td nowrap width="16%"> 
                <input type="text" name="E01FIXCLS" size="6" maxlength="5" value="<%= fix.getE01FIXCLS()%>" readonly>
                <input type="text" name="E01CLSDSC" size="32" maxlength="30" value="<%= fix.getE01CLSDSC().trim()%>" readonly>
            </td>

          </tr>


        </table>
      </td>
    </tr>
  </table>
  <br>

  <table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right">Centro de Costos :</div>
            </td>
            <td nowrap width="30%"> 
                <input type="text" name="E01FIXCCN" size="9" maxlength="8" value="<%= fix.getE01FIXCCN()%>" readonly>
                <input type="text" name="E01CCNDSC" size="32" maxlength="30" value="<%= fix.getE01CCNDSC().trim()%>" readonly>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Estado del Activo :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E01FIXTYP" size="20" maxlength="20" 
				value="<% if (fix.getE01FIXTYP().equals("A")) out.print("ACTIVO");
							else if (fix.getE01FIXTYP().equals("V")) out.print("BAJA");
							else out.print("");%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Ubicaci&oacute;n (&quot;AMO&quot; Amortizaci&oacute;n) :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXLOC" size="5" maxlength="4" value="<%= fix.getE01FIXLOC()%>" readonly>
              <input type="text" name="E01LOCDSC" size="32" maxlength="30" value="<%= fix.getE01LOCDSC().trim()%>" readonly>
           </td>
            <td nowrap width="20%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E01FIXEST" size="20" maxlength="20" 
				value="<% if (fix.getE01FIXEST().equals("A")) out.print("En Uso");
							else if (fix.getE01FIXEST().equals("R")) out.print("En Desuso");
							else if (fix.getE01FIXEST().equals("V")) out.print("Venta");
							else if (fix.getE01FIXEST().equals("M")) out.print("Robo");
							else if (fix.getE01FIXEST().equals("E")) out.print("Mal Estado");
							else if (fix.getE01FIXEST().equals("N")) out.print("Donaci�n");
							else out.print("");%>" >
            </td>

          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Nombre Empleado a Cargo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXUID" size="12" maxlength="10" value="<%= fix.getE01FIXMOD()%>" readonly>
                <input type="text" name="D01FIXUID" size="32" maxlength="30" value="<%= fix.getE01FIXMOD()%>" readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Valor de Venta :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXREA" size="17" maxlength="15" value="<%= fix.getE01FIXREA()%>" readonly>
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">N�mero de Identificaci�n :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXRE1" size="13" maxlength="12" value="<%= fix.getE01FIXRE1()%>" readonly>
                <input type="text" name="E01UIDDSC" size="32" maxlength="30" value="<%= fix.getE01UIDDSC().trim()%>"  readonly>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Modelo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXMOD" size="17" maxlength="15" value="<%= fix.getE01FIXMOD()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">N�mero de Factura :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXFAC" size="12" maxlength="10" value="<%= fix.getE01FIXFAC().trim()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Serie :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXSER" size="17" maxlength="15" value="<%= fix.getE01FIXSER().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">N�mero de Orden de Compra :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXRE2" size="12" maxlength="10" value="<%= fix.getE01FIXRE2().trim()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Marca :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXMAR" size="17" maxlength="15" value="<%= fix.getE01FIXMAR()%>" readonly>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Monto de Amortizaci&oacute;n :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXPUS" size="17" maxlength="15" value="<%= fix.getE01FIXPUS().trim()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXTIC" size="10" maxlength="9" value="<%= fix.getE01FIXTIC().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Precio de Compra :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXPPR" size="17" maxlength="15" value="<%= fix.getE01FIXPPR().trim()%>" readonly>
            </td>
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Meses :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXMTH" size="4" maxlength="3" value="<%= fix.getE01FIXMTH().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Porcentaje Depreciaci&oacute;n :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" name="E01FIXPRT" size="5" maxlength="4" value="<%= fix.getE01FIXPRT().trim()%>" readonly>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Valor Residual :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXRVA" size="17" maxlength="15" value="<%= fix.getE01FIXRVA().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Fecha de Compra / Inicio :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXPDM" size="3" maxlength="2" value="<%= fix.getE01FIXPDM().trim()%>" readonly>
                <input type="text" name="E01FIXPDD" size="3" maxlength="2" value="<%= fix.getE01FIXPDD().trim()%>" readonly> 
                <input type="text" name="E01FIXPDY" size="5" maxlength="4" value="<%= fix.getE01FIXPDY().trim()%>" readonly> 
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Inicio Garant�a :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXD1M" size="3" maxlength="2" value="<%= fix.getE01FIXD1M().trim()%>" readonly>
                <input type="text" name="E01FIXD1D" size="3" maxlength="2" value="<%= fix.getE01FIXD1D().trim()%>" readonly> 
                <input type="text" name="E01FIXD1Y" size="5" maxlength="4" value="<%= fix.getE01FIXD1Y().trim()%>" readonly> 
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Fecha Terminaci�n Garant�a :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXD3M" size="3" maxlength="2" value="<%= fix.getE01FIXD3M().trim()%>" readonly>
                <input type="text" name="E01FIXD3D" size="3" maxlength="2" value="<%= fix.getE01FIXD3D().trim()%>" readonly> 
                <input type="text" name="E01FIXD3Y" size="5" maxlength="4" value="<%= fix.getE01FIXD3Y().trim()%>"  readonly> 
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Tel�fono de Contacto :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXD3M" size="17" maxlength="15" value="<%= fix.getE01FIXD3M().trim()%>" readonly>
              </div>
            </td>
          </tr>


          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Proveedor (Activos Fijos) :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" name="E01FIXPIN" size="10" maxlength="9" value="<%= fix.getE01FIXPIN().trim()%>" readonly>
              <input type="text" name="E01VENDSC" size="32" maxlength="30" value="<%= fix.getE01VENDSC().trim()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXRMK" size="52" maxlength="50" value="<%= fix.getE01FIXRMK().trim()%>" readonly>
              </div>
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Monto Opci�n a Compra :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FI2OCO" size="17" maxlength="15" value="<%= fix.getE01FI2OCO().trim()%>" onKeypress="enterDecimal(event, 2)" readonly="readonly">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">&nbsp;</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left">
              	&nbsp;
              </div>
            </td>
          </tr> 
                    
        </table>
      </td>
    </tr>
  </table>
  <%-- --------------------------------- CAMPOS NUEVOS  --------------------------------- --%>
<br>
<table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Tipo de Impuesto :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <eibsinput:cnofc name="fix" flag="f3" property="E01FI2TIM" fn_code="E01FI2TIM" fn_description="E01FI2DTE" readonly="true" />
				<eibsinput:text  name="fix" property="E01FI2DTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Estado del Impuesto :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
              	  <select name="E01FI2DIM" disabled="disabled">
						<option  value=""> </option>                	  
						<option <%= fix.getE01FI2DIM().trim().equals("PAGADO")?"selected":"" %> value="PAGADO">PAGADO</option>
						<option <%= fix.getE01FI2DIM().trim().equals("PENDIENTE PAGO")?"selected":"" %> value="PENDIENTE PAGO">PENDIENTE PAGO</option>
					</select>
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Pagado Por :</div>
            </td>
            <td nowrap width="30%"> 
              	  <select name="E01FI2DPA" disabled="disabled">
						<option  value=""> </option>              	  
						<option <%= fix.getE01FI2DPA().trim().equals("SERFINANZAS")?"selected":"" %> value="SERFINANZAS">SERFINANZAS</option>
						<option <%= fix.getE01FI2DPA().trim().equals("CLIENTE")?"selected":"" %> value="CLIENTE">CLIENTE</option>
					</select>            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha de Pago:</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <eibsinput:date name="fix" fn_year="E01FI2PAY" fn_month="E01FI2PAM" fn_day="E01FI2PAD" readonly="true"/>
              </div>
            </td>
          </tr>          

          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Valor Impuesto :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FI2MTO" size="17" maxlength="15" value="<%= fix.getE01FI2MTO().trim()%>" onKeypress="enterDecimal(event, 2)" readonly="readonly">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Proximo Pago :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <eibsinput:date name="fix" fn_year="E01FI2PPY" fn_month="E01FI2PPM" fn_day="E01FI2PPD" readonly="true" />
              </div>
            </td>
          </tr>
<%-- --------------------------------- CAMPOS NUEVOS  --------------------------------- --%>          
          
        </table>
      </td>
    </tr>

  </table>
  <br>

  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table width="100%">
          <tr id="trdark"> 
            <td nowrap  colspan="2"> 
              <div align="center"><b>Depreciaci&oacute;n / Amortizaci&oacute;n Mensual</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Depreciaci&oacute;n / Amortizaci&oacute;n Acumulada</b></div>
            </td>
            <td nowrap ><div align="center"><b>Valor en Libros</b></div></td>
            <td nowrap > 
              <div align="center"><b>�ltima Fecha Depreciaci&oacute;n / Amortizaci&oacute;n</b></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="center">
              	<input type="text" name="E01FIXMDP" size="20" maxlength="19" value="<%= fix.getE01FIXMDP().trim()%>" readonly>
              </div>
            </td>
            <td nowrap > 
              <div align="center">
              	<input type="text" name="E01FIXADP" size="20" maxlength="19" value="<%= fix.getE01FIXADP().trim()%>" readonly>
              </div>
            </td>
            <td nowrap >
              <div align="center">
              	<input type="text" name="E01FIXBKV" size="20" maxlength="19" value="<%= fix.getE01FIXBKV().trim()%>" readonly>
              </div>
            </td>
            <td nowrap > 
              <div align="center">
              	<input type="text" name="E01FIXLDM" size="3" maxlength="2" value="<%= fix.getE01FIXLDM().trim()%>" readonly>
              	<input type="text" name="E01FIXLDD" size="3" maxlength="2" value="<%= fix.getE01FIXLDD().trim()%>" readonly>
              	<input type="text" name="E01FIXLDY" size="5" maxlength="4" value="<%= fix.getE01FIXLDY().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >

          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right">Valor de la transacci�n :</div>
            </td>
            <td nowrap width="18%"> 
              <input type="text" name="E01FIXAM1" size="17" maxlength="15" value="<%= fix.getE01FIXAM1()%>" readonly>
            </td>
            <td nowrap width="15%" > 
              <div align="right">Fecha de Baja :</div>
            </td>
            <td nowrap width="18%"> 
                <input type="text" name="E01FIXD2M" size="3" maxlength="2" value="<%= fix.getE01FIXD2M().trim()%>" readonly>
                <input type="text" name="E01FIXD2D" size="3" maxlength="2" value="<%= fix.getE01FIXD2D().trim()%>" readonly>
                <input type="text" name="E01FIXD2Y" size="5" maxlength="4" value="<%= fix.getE01FIXD2Y().trim()%>" readonly> 
            </td>
            <td nowrap width="15%"> 
              <div align="right">C�digo de Causal :</div>
            </td>
            <td nowrap width="18%"> 
                <input type="text" name="E01FIXCAU" size="3" maxlength="2" value="<%= fix.getE01FIXCAU()%>"  readonly>
                <input type="text" name="E01CAUDSC" size="32" maxlength="30" value="<%= fix.getE01CAUDSC().trim()%>" readonly>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

  <br>

  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%">
 <div align="center"> 
  </div>      </td>
    </tr>
  </table>
  </form>
</body>
</html>
