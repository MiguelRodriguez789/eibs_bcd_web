<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>


<html>
<head>
<title>Mantenimiento de Activos Fijos / Amortizaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX00001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(value){
	if (value == 1) {
		document.forms[0].SCREEN.value = 800;
		document.forms[0].submit();
	}
	else {
		if (confirm("¿Está seguro que desea eliminar este activo fijo?")) {
			document.forms[0].SCREEN.value = 1000;
			document.forms[0].submit();
		}
	}
}

function showActive(obj){
   if (obj.checked) {
   		document.getElementById("STATACTIVE").style.display = "block"; 
   } else {
    	document.getElementById("STATACTIVE").style.display = "none";
    	getElement("E01FIXEST").value = "";
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
<h3 align="center">Mantenimiento de Activos Fijos / Amortizaciones
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_maintenance.jsp, EFIX000"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000" >
  <input type=HIDDEN name="SCREEN" value="800">
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >

          <tr id="trdark">
            <td nowrap width="20%" > 
              <div align="right">Activo Fijo/ IDAmortizaci&oacute;n :</div>
            </td>
            <td nowrap width="10%"> 
                <input type="text" name="E01FIXASN" size="13" maxlength="12" value="<%= fix.getE01FIXASN()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Banco / Sucursal :</div>
            </td>
            <td nowrap width="10%"> 
              <div align="left"> 
                <input type="text" name="E01FIXBNK" size="3" maxlength="2" value="<%= fix.getE01FIXBNK()%>" readonly>
                <input type="text" name="E01FIXBRN" size="5" maxlength="4" value="<%= fix.getE01FIXBRN()%>" readonly>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right">Clasificación :</div>
            </td>
            <td nowrap width="30%"> 
                <input type="text" name="E01FIXCLS" size="6" maxlength="5" value="<%= fix.getE01FIXCLS()%>" readonly>
                <input type="text" name="E01CLSDSC" size="42" maxlength="30" value="<%= fix.getE01CLSDSC().trim()%>" readonly>
            </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Categoría :</div>
            </td>
            <td nowrap colspan="2"> 
                <input type="text" name="E01FIXGRP" size="3" maxlength="2" value="<%= fix.getE01FIXGRP()%>" >
                <a href="javascript:GetCodeDescCNOFC('E01FIXGRP','E01GRPDSC','F1')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
                <input type="text" name="E01GRPDSC" size="32" maxlength="30" value="<%= fix.getE01GRPDSC().trim()%>" readonly>
            </td>
            <td nowrap width="10%"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E01FIXGLN" size="17" maxlength="16" value="<%= fix.getE01FIXGLN()%>" readonly>
              <input type="text" name="E01GLNDSC" size="40" maxlength="30" value="<%= fix.getE01GLNDSC().trim()%>" readonly>
       		  <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
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
              <div align="right"> Centro de Costos :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXCCN" size="9" maxlength="8" value="<%= fix.getE01FIXCCN()%>">
                <a href="javascript:GetCostCenter('E01FIXCCN',document.forms[0].E01FIXBNK.value)">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Centros de Costo" align="middle" border="0" ></a>
                <input type="text" name="E01CCNDSC" size="32" maxlength="30" value="<%= fix.getE01CCNDSC().trim()%>" readonly>
			  </div>	
            </td>
            <td nowrap width="20%" align="right">Estado del Activo :
            </td>
            <td width="30%" valign="top"> 
              	<input type="checkbox" name="E01FIXTYP" value="A"  onclick="showActive(this)" 
              		<% if (fix.getE01FIXTYP().equals("A")) out.print("checked"); %>>Activo
              <div id="STATACTIVE" style="display: none; position: relative; vertical-align: top; margin-left: 70px; margin-top: -16px;" align="center"> 
                <select name="E01FIXEST">
                  <option value=" " ></option>
                  <option value="A" <%if (fix.getE01FIXEST().equals("A")) {out.print("selected"); }%>>En Uso</option>
                  <option value="R" <%if (fix.getE01FIXEST().equals("R")) { out.print("selected"); }%>>En Desuso</option>
                </select>
              </div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Ubicaci&oacute;n (&quot;AMO&quot; Amortizaci&oacute;n) :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXLOC" size="5" maxlength="4" value="<%= fix.getE01FIXLOC()%>">
              <a href="javascript:GetLocations('E01FIXLOC', 'E01LOCDSC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
             <input type="text" name="E01LOCDSC" size="32" maxlength="30" value="<%= fix.getE01LOCDSC().trim()%>" readonly>
       		  <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
           </td>
            <td nowrap width="20%" > 
              <div align="right">Número de Placa :</div>
            </td>
            <td nowrap width="30%"> 
                <input type="text" name="E01FIXREF" size="12" maxlength="10" value="<%= fix.getE01FIXREF()%>" readonly>
            </td>

          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Nombre Empleado a Cargo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXUID" size="12" maxlength="10" value="<%= fix.getE01FIXUID()%>">
                <input type="text" name="E01UIDDSC" size="32" maxlength="30" value="<%= fix.getE01UIDDSC().trim()%>" readonly>
   			    <a href="javascript:GetUser('E01FIXUID','E01UIDDSC',' ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
        		<img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Valor de Venta :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXREA" size="17" maxlength="15" value="<%= fix.getE01FIXREA()%>"  onKeypress="enterDecimal(event, 2)">
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Número de Identificación :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXRE1" size="13" maxlength="12" value="<%= fix.getE01FIXRE1()%>" onKeypress="enterInteger(event)">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Modelo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXMOD" size="17" maxlength="15" value="<%= fix.getE01FIXMOD()%>">
       		  <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Número de Factura :</div>
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
              <div align="right">Número de Orden de Compra :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXRE2" size="12" maxlength="10" value="<%= fix.getE01FIXRE2().trim()%>" readonly>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Marca :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01FIXMAR" size="17" maxlength="15" value="<%= fix.getE01FIXMAR()%>" readonly>
       		  <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
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
       		  <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
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
              <input type="text" name="E01FIXPRT" size="7" maxlength="6" value="<%= fix.getE01FIXPRT().trim()%>" readonly>
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
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),fix.getBigDecimalE01FIXPDM().intValue(),fix.getBigDecimalE01FIXPDD().intValue(),fix.getBigDecimalE01FIXPDY().intValue())%>                         
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Inicio Garantía :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),fix.getBigDecimalE01FIXD1M().intValue(),fix.getBigDecimalE01FIXD1D().intValue(),fix.getBigDecimalE01FIXD1Y().intValue())%>                         
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Fecha Terminación Garantía :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),fix.getBigDecimalE01FIXD3M().intValue(),fix.getBigDecimalE01FIXD3D().intValue(),fix.getBigDecimalE01FIXD3Y().intValue())%>                         
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Teléfono de Contacto :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01BPVPH1" size="17" maxlength="15" value="<%= fix.getE01BPVPH1().trim()%>">
                <input type="text" name="E01BPVPH2" size="17" maxlength="15" value="<%= fix.getE01BPVPH2().trim()%>">
              </div>
            </td>
          </tr>


          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Proveedor (Activos Fijos) :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" name="E01FIXPIN" size="6" maxlength="9" value="<%= fix.getE01FIXPIN().trim()%>" readonly>
              <input type="text" name="E01VENDSC" size="40" maxlength="30" value="<%= fix.getE01VENDSC().trim()%>" readonly>
       		  <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
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
              <div align="right">Monto Opción a Compra :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FI2OCO" size="17" maxlength="15" value="<%= fix.getE01FI2OCO().trim()%>" onKeypress="enterDecimal(event, 2)">
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
                <eibsinput:cnofc name="fix" flag="f3" property="E01FI2TIM" fn_code="E01FI2TIM" fn_description="E01FI2DTE" required="true" />
				<eibsinput:text  name="fix" property="E01FI2DTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>                
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Estado del Impuesto :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
              	  <select name="E01FI2DIM" >
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
              	  <select name="E01FI2DPA" >
						<option  value=""> </option>              	  
						<option <%= fix.getE01FI2DPA().trim().equals("B")?"selected":"" %> value="B">BANCO</option>
						<option <%= fix.getE01FI2DPA().trim().equals("C")?"selected":"" %> value="C">CLIENTE</option>
					</select>            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha de Pago:</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <eibsinput:date name="fix" fn_year="E01FI2PAY" fn_month="E01FI2PAM" fn_day="E01FI2PAD" />
              </div>
            </td>
          </tr>          

          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Valor Impuesto :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FI2MTO" size="17" maxlength="15" value="<%= fix.getE01FI2MTO().trim()%>" onKeypress="enterDecimal(event, 2)">
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Fecha Proximo Pago :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <eibsinput:date name="fix" fn_year="E01FI2PPY" fn_month="E01FI2PPM" fn_day="E01FI2PPD" />
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
              <div align="center"><b>Última Fecha Depreciaci&oacute;n / Amortizaci&oacute;n</b></div>
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
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),fix.getBigDecimalE01FIXLDM().intValue(),fix.getBigDecimalE01FIXLDD().intValue(),fix.getBigDecimalE01FIXLDY().intValue())%>                         
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
		<td width="33%">
		 <div align="center"> 
	      <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction(1);">
		 </div>
		</td>
    </tr>
  </table>
  </form>
 
 <script type="text/javascript">
 	showActive(getElement("E01FIXTYP"));	
 </script> 
  
</body>
</html>
