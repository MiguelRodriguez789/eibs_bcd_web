<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">


<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Activos Fijos </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX20001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

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

</SCRIPT>

</head>
<body >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<h3 align="center">Activos Fijos (Leasing) - Mantenimiento<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_maintenance.jsp, EFIX200"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX200" >
  <input type=HIDDEN name="SCREEN" value="800">

  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Número de Bien :</div>
            </td>
            <td nowrap> 
              <div align="left"> 
               <eibsinput:text name="fix" property="E01FIXBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
               <eibsinput:help name="fix" property="E01FIXBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
              		fn_param_one="E01FIXBRN" fn_param_two="document.forms[0].E01FIXBNK.value"/>
                <input type="text" name="E01FIXASN" size="13" maxlength="12" value="<%= fix.getE01FIXASN()%>" >
              </div>
            </td>
            <td nowrap>
              <div align="right">N&uacute;mero de Cuenta Contable :</div>
            </td>
            <td nowrap>
               <eibsinput:help name="fix" property="E01FIXGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" required="true"
               		fn_param_one="E01FIXGLN" fn_param_two="document.forms[0].E01FIXBNK.value"/>
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
 	              <eibsinput:help name="fix" property="E01FIXCCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>" 
         	      		   fn_param_one="E01FIXCCN" fn_param_two="document.forms[0].E01FIXBNK.value"/>
			  </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Estado del Activo :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <select name="E01FIXEST">
                  <option value=" " ></option>
                  <option value="A" <%if (fix.getE01FIXEST().equals("A")) {out.print("selected"); }%>>Activo</option>
                  <option value="D" <%if (fix.getE01FIXEST().equals("D")) { out.print("selected"); }%>>Depreciado</option>
                  <option value="R" <%if (fix.getE01FIXEST().equals("R")) { out.print("selected"); }%>>Dañado</option>
                  <option value="M" <%if (fix.getE01FIXEST().equals("M")) { out.print("selected"); }%>>Robado</option>
                  <option value="V" <%if (fix.getE01FIXEST().equals("V")) { out.print("selected"); }%>>Vendido</option>
                </select>
              </div>
            </td>
          </tr>
         
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Descripci&oacute;n Marca :</div>
            </td>
            <td nowrap width="30%" > 
              <eibsinput:text name="fix" property="E01FIXMAR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
            <td nowrap width="20%" > 
              <div align="right">Localizaci&oacute;n (&quot;AMO&quot; Amortizaci&oacute;n) :</div>
             </td>
            <td nowrap width="30%" > 
                 <input type="text" name="E01FIXLOC" size="5" maxlength="4" value="<%= fix.getE01FIXLOC().trim()%>">
               <a href="javascript:GetLocations('E01FIXLOC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Modelo :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <eibsinput:text name="fix" property="E01FIXMOD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
              </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap width="30%" > 
               <div align="left"> 
           	    <eibsinput:help name="fix" property="E01FIXCLS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CLASS_FIXED %>" 
               		fn_param_one="E01FIXCLS" />
              </div> 
            </td>
          </tr>
         
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Precio / Compra Monto Amortizaci&oacute;n :</div>
            </td>
            <td nowrap width="30%" > 
               <eibsinput:text name="fix" property="E01FIXPPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>
            <td nowrap width="20%" > 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
               <eibsinput:text name="fix" property="E01FIXTIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
         
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Precio de Compra (USD) :</div>
            </td>
            <td nowrap width="30%" > 
               <eibsinput:text name="fix" property="E01FIXPUS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>

            <td nowrap width="20%" > 
              <div align="right">N&uacute;mero de Serie :</div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01FIXSER" size="22" maxlength="20" value="<%= fix.getE01FIXSER().trim()%>">
              </div>
            </td>
          </tr>
         
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Porcentaje Depreciaci&oacute;n :</div>
            </td>
            <td nowrap width="30%"> 
               <eibsinput:text name="fix" property="E01FIXPRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
            </td>
            <td nowrap width="20%"> 
              <div align="right">N&uacute;mero de Meses :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXMTH" size="4" maxlength="3" value="<%= fix.getE01FIXMTH().trim()%>"onkeypress=" enterInteger(event)" >
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Fecha de Compra / Inicio :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
	               <eibsinput:date name="fix" fn_year="E01FIXPDY" fn_month="E01FIXPDM" fn_day="E01FIXPDD" />
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Tipo de Depreciaci&oacute;n / Amortizaci&oacute;n 
                :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01FIXDTY" size="2" maxlength="1" value="<%= fix.getE01FIXDTY().trim()%>">
                <a href="javascript:GetDepTyp('E01FIXDTY','STATIC_ln_dep_typ.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                * </div>
            </td>
          </tr>
 
          <tr id="trclear"> 
            <td nowrap width="20%" > 
              <div align="right">Proveedor (Activos Fijos) :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" name="E01FIXPIN" size="10" maxlength="9" value="<%= fix.getE01FIXPIN().trim()%>" >
                            <a href="javascript:GetVendor('E01FIXPIN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
			  
            </td>
            <td nowrap width="20%"> 
              <div align="right">Valor Residual (Activos Fijos) :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
               <eibsinput:text name="fix" property="E01FIXRVA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
          </tr>
  
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <eibsinput:text name="fix" property="E01FIXRMK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right">Monto de Inflaci&oacute;n :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <eibsinput:text name="fix" property="E01FIXPXI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
              </div>
            </td>
          </tr>
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
              <div align="center"><b>Depreciaci&oacute;n / <br>
                Amortizaci&oacute;n Mensual</b></div>
            </td>
            <td nowrap > 
              <div align="center"><b>Depreciaci&oacute;n / <br>
                Amortizaci&oacute;n Acumulativa</b></div>
            </td>
            <td nowrap ><div align="center"><b>Valor en Libros</b></div></td>
            <td nowrap > 
              <div align="center"><b>Última Fecha<br>Depreciaci&oacute;n /<br>
                Amortizaci&oacute;n</b></div>
            </td>
          </tr>
         
          <tr id="trclear"> 
            <td nowrap  colspan="2"> 
              <div align="center">
              	<eibsinput:text name="fix" property="E01FIXMDP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT  %>" />
            </div>
            </td>
            <td nowrap > 
              <div align="center">
              	<eibsinput:text name="fix" property="E01FIXADP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT  %>" />
              </div>
            </td>
            <td nowrap >
              <div align="center">
              	<eibsinput:text name="fix" property="E01FIXBKV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT  %>" />
              </div>
            </td>
            <td nowrap > 
              <div align="center">
              <eibsinput:date name="fix" fn_year="E01FIXLDY" fn_month="E01FIXLDM" fn_day="E01FIXLDD" />
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
	      <input id="EIBSBTN" type=button name="Submit" value="Eliminar" onClick="javascript:goAction(2);">
  </div>      </td>
    </tr>
  </table>
  </form>
</body>
</html>
