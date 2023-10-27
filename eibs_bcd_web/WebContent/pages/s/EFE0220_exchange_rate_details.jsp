<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tasas de Cambio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="rates" class="datapro.eibs.beans.EFE022001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EFE022001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>


</head>
<body>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
     boolean readOnly=false; 

 	
	if ( userPO.getPurpose().equals("READONLY") ) { 
		  readOnly=true; 
	}	
	
%>


<H3 align="center">Mantenimiento de Tasas de Cambio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="exchange_rate_details.jsp, EFE0220"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEFE0220" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E01RATBNK" value="<%= rates.getE01RATBNK()%>">
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" align="right"><b>Moneda:</b></td> 
            <td nowrap width="25%" align="left"> 
                 <eibsinput:text name="rates" property="E01RATCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
                 <eibsinput:text name="rates" property="E01RATDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap >
            	<div align="right" style="font-weight: bold;white-space: nowrap;" > Fecha : </div>
            </td>
            <td nowrap colspan="3" align="left">
            	<b> 
                <eibsinput:date name="rates" fn_year="E01RATRDY" fn_month="E01RATRDM" fn_day="E01RATRDD" required="false" readonly="true"/>
				</b>	  
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
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Tipo de Cuenta :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
	              <select name="E01RATNAT" disabled>
		                <option value=" " <% if (!(rates.getE01RATNAT().equals("G") ||rates.getE01RATNAT().equals("R"))) out.print("selected"); %>></option>
						<option value="G" <%if (rates.getE01RATNAT().equals("G")) { out.print("selected"); }%>>Contable</option>
						<option value="R" <%if (rates.getE01RATNAT().equals("R")) { out.print("selected"); }%>>Detalle</option>
				  </select>
			  </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cuenta de M.E. :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rates" property="E01RATNAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
			  </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tolerancia Tesorero :</div>
            </td>
            <td nowrap width="25%"> 
                 <eibsinput:text name="rates" property="E01RATTLR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">D&iacute;as Base :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01RATBSE" maxlength="3" size="4" value="<%= rates.getE01RATBSE().trim()%>" >
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Tolerancia Operativa :</div>
            </td>
            <td nowrap width="25%">
                 <eibsinput:text name="rates" property="E01RATTLO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" />
            </td>
            <td nowrap width="25%" > 
              <div align="right">Permite Contabilidad :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="radio" disabled name="E01RATACF" value=" " <%if (!rates.getE01RATACF().equals("N")) out.print("checked"); %>>
                Si 
                <input type="radio" disabled name="E01RATACF" value="N" <%if (rates.getE01RATACF().equals("N")) out.print("checked"); %>>
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
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Tasa Spot Oficial :</div>
            </td>
            <td nowrap width="25%"> 
                 <eibsinput:text name="rates" property="E01RATEXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Operaci&oacute;n :</div>
            </td>
            <td nowrap> 
              <select name="E01RATMUD" disabled="disabled">
				<option value="M" <%if (rates.getE01RATMUD().equals("M")) { out.print("selected"); }%>>Multiplica</option>
				<option value="D" <%if (rates.getE01RATMUD().equals("D")) { out.print("selected"); }%>>Divide</option>
              </select>
            </td>
         </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Tasa Equivalente USD :</div>
            </td>
            <td nowrap width="25%"> 
                 <eibsinput:text name="rates" property="E01RATUSD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Impuesto IVA :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rates" property="E01RATRF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Tasa Referencia Operativa :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rates" property="E01RATRF3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="50%" colspan="2"> 
              <div align="center"><b>Tasa de Cambio Contra Valor</b></div>
            </td>
            <td nowrap width="50%" colspan="2"> 
              <div align="center"><b>Tasa de Cambio Mercado</b></div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Compras :</div>
            </td>
            <td nowrap width="25%"> 
                 <eibsinput:text name="rates" property="E01RATCPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Compras :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rates" property="E01RATFPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Ventas :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rates" property="E01RATCSR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Ventas :</div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                 <eibsinput:text name="rates" property="E01RATFSR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
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
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
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
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" height="23"> 
              <div align="right"><b>07 D&iacute;as :</b></div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                <input type="text" name="E01P7" maxlength="3" size="4" value="<%= rates.getE01P7().trim()%>" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="right"><b>15 D&iacute;as :</b></div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                <input type="text" name="E01P15" maxlength="3" size="4" value="<%= rates.getE01P15().trim()%>" >
              </div>
            </td>
            <td nowrap height="23"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right"><b>30 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01P30" maxlength="3" size="4" value="<%= rates.getE01P30().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="right"><b>60 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01P60" maxlength="3" size="4" value="<%= rates.getE01P60().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right"><b>90 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01P90" maxlength="3" size="4" value="<%= rates.getE01P90().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="right"><b>120 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01P120" maxlength="3" size="4" value="<%= rates.getE01P120().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR6" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%" height="19"> 
              <div align="right"><b>150 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01P150" maxlength="3" size="4" value="<%= rates.getE01P150().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR7" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="right"><b>180 D&iacute;as :</b></div>
            </td>

            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01P180" maxlength="3" size="4" value="<%= rates.getE01P180().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR8" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" height="19"> 
              <div align="right"><b>270 D&iacute;as :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01P270" maxlength="3" size="4" value="<%= rates.getE01P270().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATFR9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="right"><b>1 A&ntilde;o :</b></div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                <input type="text" name="E01P360" maxlength="3" size="4" value="<%= rates.getE01P360().trim()%>" >
              </div>
            </td>
            <td nowrap height="19"> 
              <div align="center"> 
                 <eibsinput:text name="rates" property="E01RATF10" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" />
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(rates.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Avisos</h4>
  <% } %>         
  
  <p>&nbsp;</p>
  <div align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  </form>
</body>
</html>
