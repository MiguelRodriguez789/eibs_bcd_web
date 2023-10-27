<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Activos Fijos (Leasing)</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="fix" class="datapro.eibs.beans.EFIX20001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

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
<h3 align="center">Activos Fijos (Leasing) - Nuevo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fix_new.jsp, EFIX200"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX200" >
  <input type=HIDDEN name="SCREEN" value="600">
  <table class="tableinfo" width="100%" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr id="trclear"> 
            <td nowrap > 
              <div align="right">Número de Bien :</div>
            </td>
            <td nowrap colspan="3"> 
              <div align="left"> 
                <input type="hidden" readonly name="E01FXDTYP" size="1" maxlength="1" value="<%= userPO.getHeader8()%>" >
                <input type="text" readonly name="E01FIXBNK" size="3" maxlength="2" value="<%= fix.getE01FIXBNK()%>" >
                <input type="text" readonly name="E01FIXBRN" size="4" maxlength="3" value="<%= fix.getE01FIXBRN()%>" >
                <input type="text" readonly name="E01FIXASN" size="15" maxlength="12" readonly value="<% if (fix.getE01FIXASN().trim().equals("999999999999")) out.print(" NUEVO BIEN "); else out.print(fix.getE01FIXASN().trim()); %>">
              </div>
            </td>
            <td nowrap>
              <div align="right">N&uacute;mero de Cuenta Contable :</div>
            </td>
            <td nowrap>
              <input type="text" readonly name="E01FIXGLN" size="17" maxlength="16" value="<%= fix.getE01FIXGLN()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>


  <h4>Datos Generales</h4>
  <table  class="tableinfo" width="736">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

          <tr id="trdark"> 
            <td nowrap > 
              <div align="right">N&uacute;mero de Proveedor :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
              <input type="text" name="E01FIXPIN" size="10" maxlength="9" value="<%= fix.getE01FIXPIN().trim()%>" >
              <a href="javascript:GetVendor('E01FIXPIN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
              </div>
            </td>
            <td nowrap > 
              <div align="right">Estado del Activo :</div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <select name="E01FIXEST">
                  <option value=" " ></option>
                  <option value="A" <%if (fix.getE01FIXEST().equals("A")) {out.print("selected"); }%>>Activo</option>
                  <option value="D" <%if (fix.getE01FIXEST().equals("D")) { out.print("selected"); }%>>Depreciado Total</option>
                  <option value="R" <%if (fix.getE01FIXEST().equals("R")) { out.print("selected"); }%>>En Mal estado</option>
                  <option value="M" <%if (fix.getE01FIXEST().equals("M")) { out.print("selected"); }%>>Robado</option>
                  <option value="V" <%if (fix.getE01FIXEST().equals("V")) { out.print("selected"); }%>>Vendido</option>
                </select>
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Ubicaci&oacute;n :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXLOC" size="4" maxlength="3" value="<%= fix.getE01FIXLOC()%>">
              <a href="javascript:GetLoc('E01FIXLOC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="23%" > 
              <div align="right">Clasificaci&oacute;n :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXCLS" size="4" maxlength="3" value="<%= fix.getE01FIXCLS()%>">
                <a href="javascript:GetAct('E01FIXCLS', '')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Precio de Compra :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXPPR" size="16" maxlength="15" value="<%= fix.getE01FIXPPR().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="23%" > 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXTIC" size="12" maxlength="11" value="<%= fix.getE01FIXTIC().trim()%>" onkeypress="enterDecimal()">
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Valor en Dólares :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01FIXPUS" size="16" maxlength="15" value="<%= fix.getE01FIXPUS().trim()%>" onkeypress="enterDecimal()">
            </td>
            <td nowrap width="23%" > 
              <div align="right">Fecha de Compra :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
				<eibsinput:date name="fix" fn_month="E01FIXPDM" fn_day="E01FIXPDD" fn_year="E01FIXPDY" />
              </div>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="21%" > 
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXRMK" size="26" maxlength="25" value="<%= fix.getE01FIXRMK().trim()%>">
              </div>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Centro de Costos :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
                <input type="text" name="E01FIXCCN" size="9" maxlength="8" value="<%= fix.getE01FIXCCN()%>">
                <a href="javascript:GetCostCenter('E01FIXCCN',document.forms[0].E01FIXBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Centros de Costo" align="middle" border="0" ></a>
              </div>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="21%" > 
              <div align="right">Tipo Depreciación :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
              <input type="text" readonly name="E01FIXDTY" size="2" maxlength="1" value="<%= fix.getE01FIXDTY().trim()%>">
              <a href="javascript:GetDepTyp('E01FIXDTY','STATIC_ln_dep_typ.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </div>
            </td>
            <td nowrap width="23%" > 
              <div align="right">Porcentaje/Meses Depreciación :</div>
            </td>
            <td nowrap width="23%" > 
              <div align="left"> 
              <input type="text" name="E01FIXPRT" size="5" maxlength="4" value="<%= fix.getE01FIXPRT().trim()%>" onKeypress="enterDecimal()">
              <input type="text" name="E01FIXMTH" size="4" maxlength="3" value="<%= fix.getE01FIXMTH().trim()%>" onKeypress="enterInteger(event)">              
              </div>
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
	      <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>      </td>
    </tr>
  </table>
  </form>
</body>
</html>
