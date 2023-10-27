<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tasas de Cambio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="rateInfo" class="datapro.eibs.beans.EFE122002Message"  scope="session" />
<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=rateInfo"> </script>

<script type="text/javascript">

$(document).ready(function(){
	readOnlyPage();
});

</script>

</head>
<body>


<H3 align="center">Consulta de Tasas de Cambio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="exchange_rate_details.jsp, EFE0220"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE1220" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02RATBNK" value="<%= rateInfo.getE02RATBNK()%>">
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" align="right"><b>Moneda:</b></td> 
            <td nowrap width="25%" align="left"  > 
                 <eibsinput:text name="rateInfo" property="E02RATCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
                 <eibsinput:text name="rateInfo" property="E02RATDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>

          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n B&aacute;sica</h4>  
  
  <%int row = 0; %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>">
            <td nowrap width="25%"> 
              <div align="right">Tipo de Cuenta :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
	              <select name="E02RATNAT" disabled>
		                <option value=" " <% if (!(rateInfo.getE02RATNAT().equals("G") ||rateInfo.getE02RATNAT().equals("R"))) out.print("selected"); %>></option>
						<option value="G" <%if (rateInfo.getE02RATNAT().equals("G")) { out.print("selected"); }%>>Contable</option>
						<option value="R" <%if (rateInfo.getE02RATNAT().equals("R")) { out.print("selected"); }%>>Detalle</option>
				  </select>
			  </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cuenta de M.E. :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rateInfo" property="E02RATNAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
			  </div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tolerancia Tesorero :</div>
            </td>
            <td nowrap width="25%"> 
                 <eibsinput:text name="rateInfo" property="E02RATTLR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">D&iacute;as Base :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E02RATBSE" maxlength="3" size="4" value="<%= rateInfo.getE02RATBSE().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>">
            <td nowrap width="25%"> 
              <div align="right">Tolerancia Operativa :</div>
            </td>
            <td nowrap width="25%">
                 <eibsinput:text name="rateInfo" property="E02RATTLO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
            </td>
            <td nowrap width="25%" > 
              <div align="right">Permite Contabilidad :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="radio" disabled name="E02RATACF" value=" " <%if (!rateInfo.getE02RATACF().equals("N")) out.print("checked"); %>>
                Si 
                <input type="radio" disabled name="E02RATACF" value="N" <%if (rateInfo.getE02RATACF().equals("N")) out.print("checked"); %>>
                No</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n de Tasas</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>">
            <td nowrap width="25%"> 
              <div align="right">Tasa Spot Oficial :</div>
            </td>
            <td nowrap width="25%"> 
                 <eibsinput:text name="rateInfo" property="E02RATEXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Operaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <select name="E02RATMUD" disabled="disabled">
				<option value="M" <%if (rateInfo.getE02RATMUD().equals("M")) { out.print("selected"); }%>>Multiplica</option>
				<option value="D" <%if (rateInfo.getE02RATMUD().equals("D")) { out.print("selected"); }%>>Divide</option>
              </select>
            </td>
         </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tasa Equivalente USD :</div>
            </td>
            <td nowrap width="25%"> 
                 <eibsinput:text name="rateInfo" property="E02RATUSD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Impuesto IVA :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rateInfo" property="E02RATRF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>">
            <td nowrap width="25%"> 
              <div align="right">Tasa Referencia Operativa :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rateInfo" property="E02RATRF3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>

          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>">
            <td nowrap width="50%" colspan="2"> 
              <div align="center"><b>Tasa de Cambio Contra Valor</b></div>
            </td>
            <td nowrap width="50%" colspan="2"> 
              <div align="center"><b>Tasa de Cambio Mercado</b></div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>"> 
            <td nowrap width="25%"> 
              <div align="right">Compras :</div>
            </td>
            <td nowrap width="25%"> 
                 <eibsinput:text name="rateInfo" property="E02RATCPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Compras :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rateInfo" property="E02RATFPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>"> 
            <td nowrap width="25%"> 
              <div align="right">Ventas :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rateInfo" property="E02RATCSR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Ventas :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rateInfo" property="E02RATFSR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
                </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 
  <h4>Tasas de Cambio a Futuro</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>">
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="center"><b>Puntos</b></div>
            </td>
            <td nowrap> 
              <div align="center"><b>Tasa</b></div>
            </td>
            <td nowrap> 
              <div align="right"></div>
            </td>
            <td nowrap> 
              <div align="center"><b>Puntos</b></div>
            </td>
            <td nowrap> 
              <div align="center"><b>Tasa</b></div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right"><b>07 D&iacute;as :</b></div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                <input type="text" name="E02P7" maxlength="3" size="4" value="<%= rateInfo.getE02P7().trim()%>" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="right"><b>15 D&iacute;as :</b></div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                <input type="text" name="E02P15" maxlength="3" size="4" value="<%= rateInfo.getE02P15().trim()%>" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right"><b>30 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E02P30" maxlength="3" size="4" value="<%= rateInfo.getE02P30().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="right"><b>60 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E02P60" maxlength="3" size="4" value="<%= rateInfo.getE02P60().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right"><b>90 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E02P90" maxlength="3" size="4" value="<%= rateInfo.getE02P90().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="right"><b>120 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E02P120" maxlength="3" size="4" value="<%= rateInfo.getE02P120().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>">
            <td nowrap width="16%" height="19"> 
              <div align="right"><b>150 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E02P150" maxlength="3" size="4" value="<%= rateInfo.getE02P150().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="right"><b>180 D&iacute;as :</b></div>
            </td>

            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E02P180" maxlength="3" size="4" value="<%= rateInfo.getE02P180().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=( ++row % 2 == 1) ? "trdark" : "trclear"%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right"><b>270 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E02P270" maxlength="3" size="4" value="<%= rateInfo.getE02P270().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATFR9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="right"><b>1 A&ntilde;o :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E02P360" maxlength="3" size="4" value="<%= rateInfo.getE02P360().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rateInfo" property="E02RATF10" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>



<%--   
  <% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(rateInfo.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Avisos</h4>
  <% } %>         
--%>

  </form>
</body>
</html>
