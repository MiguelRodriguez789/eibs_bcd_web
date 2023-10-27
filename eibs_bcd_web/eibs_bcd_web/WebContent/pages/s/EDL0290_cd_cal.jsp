<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title> Simulador de Certificados de Deposito </title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="calcLoans" class="datapro.eibs.beans.EDL029001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">


	function printPDF() {
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0290?SCREEN=200";
		CenterWindow(page, 600, 500, 2); 
	}
	
	function clearData() {
		//Plazo
		getElement("E01DEATRM").value = "0";
		getElement("E01DEATRC").value = "";
		//Tasa de Interes
		getElement("E01DEARTE").value = "0,000000";
		//Fecha Final
		getElement("E01DEAMDM").value = "";
		getElement("E01DEAMDD").value = "";
		getElement("E01DEAMDY").value = "";
		//Periodo Base
		getElement("E01DEABAS").value = "0";
		//Tipo de Tasa
		radioClick("E01FLGTAS", 1);
		//Tipo de Tasa Flotante
		getElement("E01DEAFTB").value = "";
		getElement("E01DEAFTY").value = "";
		//Tasa Variable Nominal
		getElement("E01FLTRTE").value = "0,000000";
		//Tipo de Calculo
		getElement("E01DEAICT").value = "";
		//Periodo Pago Intereses
		getElement("E01DEAROY").value = "0";
		getElement("E01DEAODA").value = "";
		//Principal
		getElement("E01DEAPRI1").value = "0,00";
		//Tasa Equivalente
		getElement("E01APYRTE").value = "0,000000";
		//Intereses Devengados Brutos
		getElement("E01DEAINT").value = "0,00";
		//Retencion en la Fuente
		getElement("E01TOTHLD").value = "0,00";
		//Interes Devengado Neto
		getElement("E01WRKAM1").value = "0,00";
		//Total
		getElement("E01TOTDUE").value = "0,00";
	}

</SCRIPT>
</head>
<%
	String txtch = !userPO.getApplicationCode().equals("12")?" Certificado de Depósito":" Bono";
	String txacd = !userPO.getApplicationCode().equals("12")?"11":"12";
 %>
<body >
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
	}
%> 
<div align="center"></div>
<h3 align="center">Simulador de <%=txtch %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_cal.jsp, EDL0290"></h3>
<hr size="4">
			

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0290" >
  <input type=HIDDEN name="SCREEN" value="102">
  <input type=HIDDEN name="ACD" value="<%=txacd %>">

<% int row = 0;%>
<% if (!userPO.getHeader9().equals("S")) { %>

  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<%} %>
  
  <h4>Informaci&oacute;n Opcional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">

		<%if (!userPO.getHeader9().equals("S")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right">N&uacute;mero del Contrato :</div>
            </td>
            <td nowrap width="28%" > 
	              <eibsinput:help name="calcLoans" property="E01DEAACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" 
        	      		fn_param_one="E01DEAACC" fn_param_two="" fn_param_three="10" fn_param_four="" />
            </td>
            <td nowrap colspan="2" >N&uacute;mero de Cliente : 
	              <eibsinput:help name="calcLoans" property="E01DEACUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"
	              		fn_param_one="E01DEACUN"/>
            </td>
          </tr>
          <% } else {%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right">N&uacute;mero de Cliente :</div>
            </td>
            <td nowrap width="28%" > 
	              <input type="text" name="E01DEACUN" value="<%=calcLoans.getE01DEACUN()%>" maxlength="9" size="11" onclick="enterInteger(event)">
	              <a href="javascript:GetCustomerDetails('E01DEACUN', 'E01CUMMA1','','','E01CUMCTR','E01CUMMA2','E01CUMMA3','E01CUMMA4','E01CUMCTY','E01CUMSTE')">
	              	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda de Cliente" align="bottom" border="0"/></a>
            </td>
            <td nowrap colspan="2" > </td>
          </tr>
          <% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap colspan="3" > 
                <eibsinput:text name="calcLoans" property="E01CUMMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right">Direcci&oacute;n :</div>
            </td>
            <td nowrap > 
                <eibsinput:text name="calcLoans" property="E01CUMMA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>	
            <td nowrap colspan="2" > </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right"></div>
            </td>
            <td nowrap > 
                <eibsinput:text name="calcLoans" property="E01CUMMA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
            <td nowrap colspan="2" > </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="19%" > 
              <div align="right"></div>
            </td>
            <td nowrap > 
                <eibsinput:text name="calcLoans" property="E01CUMMA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" />
            </td>
            <td nowrap colspan="2" > </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
		<%if (userPO.getHeader9().equals("S")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right"> Producto :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DEAPRO" size="5" maxlength="4" value="<%= calcLoans.getE01DEAPRO()%>" onchange="clearData()">
	            <a href="javascript:GetProduct('E01DEAPRO','ACD','01','E01PRDDSC','')" ><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a> 
              <input type="text" name="E01PRDDSC" size="55" readonly value="<%= calcLoans.getE01PRDDSC()%>">
            </td>
            <td nowrap > 
              <div align="right"> Capital :</div>
            </td>
            <td nowrap >
                <eibsinput:text property="E01DEAPRI" name="calcLoans" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="clearData()" required="true"/>
            </td>
          </tr>
          <% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Fecha Inicial :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <eibsinput:date name="calcLoans"  fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" /> 
      		</td>

            <td nowrap > 
              <div align="right"> Plazo :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <input type="text" name="E01DEATRM" size="5" maxlength="5" value="<%= calcLoans.getE01DEATRM().trim()%>">
              <select name="E01DEATRC">
                <option value=" " <% if (!(calcLoans.getE01DEATRC().equals("D") ||calcLoans.getE01DEATRC().equals("M")||calcLoans.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(calcLoans.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(calcLoans.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(calcLoans.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" align="bottom" border="0"/>
            </td>

          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Fecha Final :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
              <eibsinput:date name="calcLoans"  fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" /> 
             </td>
            <td nowrap  bordercolor="#000000" > 
              <div align="right">Tipo de C&aacute;lculo :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= calcLoans.getE01DEAICT().trim()%>" >
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Tasa Flotante :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text"  name="E01DEAFTB" id="E01DEAFTB" size="3" maxlength="2" value="<%= calcLoans.getE01DEAFTB().trim()%>">
              <a href="javascript:GetFloating('E01DEAFTB','','E01FLTDSC','','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
              <select name="E01DEAFTY" id="E01DEAFTY" >
                <option value=" " <% if (!(calcLoans.getE01DEAFTY().equals("FP") ||calcLoans.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (calcLoans.getE01DEAFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                <option value="FS" <% if (calcLoans.getE01DEAFTY().equals("FS")) out.print("selected"); %>>Secundaria</option>
              </select>
              <input type="text" name="E01FLTDSC" id="E01FLTDSC" size="40" maxlength="40" readonly value="<%= calcLoans.getE01FLTDSC().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa Flotante Base :</div>
            </td>
            <td nowrap width="25%" > 
              <eibsinput:text name="calcLoans" property="E01FLTORG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%">
              <div align="right"> Manejo Puntos Adicional :</div> 
            </td>
            <td nowrap width="25%"> 
	             <select name="E01DEAFLX" id="E01DEAFLX">
	              <OPTION value=" " <% if (!(calcLoans.getE01DEAFLX().equals("B") || calcLoans.getE01DEAFLX().equals("E")|| calcLoans.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(calcLoans.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(calcLoans.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(calcLoans.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	      	</td>
            <td nowrap width="25%">
              <div align="right"> Valor Tasa Adicional :</div> 
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEARTX" class="txtright" size="9" maxlength="9" value="<%= calcLoans.getE01DEARTX().trim()%>">
            </td> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		    <td nowrap  > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <eibsinput:text name="calcLoans" property="E01FLTRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          	<td nowrap  bordercolor="#FFFFFF" > 
              <div align="right">Tasa de Inter&eacute;s o Spread :</div>
            </td>
            <td nowrap  bordercolor="#FFFFFF" > 
                <eibsinput:text name="calcLoans" property="E01DEARTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" />
            </td>
	      </tr>	
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap  > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEABAS" size="3" maxlength="3" value="<%= calcLoans.getE01DEABAS().trim()%>" >
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa Interes :</div>
            </td>
            <td nowrap width="25%" > 
              <eibsinput:text name="calcLoans" property="E01TOTRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  > 
               <div align="right">Periodo Pago Intereses: </div>
            </td>
            <td nowrap  bordercolor="#000000" > 
              <input type="text" name="E01DEAROY" size="4" maxlength="3" value="<%= calcLoans.getE01DEAROY().trim()%>">
              <select name="E01DEAODA">
					<option value=" "
						<% if (!(calcLoans.getE01DEAODA().equals("D") || calcLoans.getE01DEAODA().equals("M") || calcLoans.getE01DEAODA().equals("Y"))) out.print("selected"); %>></option>
					<option value="D"
						<% if(calcLoans.getE01DEAODA().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
					<option value="M"
						<% if(calcLoans.getE01DEAODA().equals("M")) out.print("selected");%>>De Cada Mes</option>
					<option value="Y"
						<% if(calcLoans.getE01DEAODA().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
				</select>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right">Tasa Efectiva Anual :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 
                <eibsinput:text name="calcLoans" property="E01APYRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />             
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right"><b>RESULTADO</b></div>
            </td>
            <td nowrap  bordercolor="#000000">
              <div align="right"> </div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right"> </div>
            </td>
            <td nowrap  bordercolor="#000000"> 
              <div align="right"> </div>
          </tr>


          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Monto del Principal :</div>
            </td>
            <td nowrap  bordercolor="#000000">
	           <input type="text" class="txtright"  name="E01DEAPRI1" size="22" maxlength="15" value="<%= calcLoans.getE01DEAPRI().trim()%>" readonly>
            </td>
            <td nowrap  bordercolor="#000000"> 
            </td>
            <td nowrap  bordercolor="#000000"> 
              </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Intereses Calculado :</div>
            </td>
            <td nowrap  bordercolor="#000000">
                <eibsinput:text name="calcLoans" property="E01DEAINT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap  bordercolor="#000000">&nbsp;</td>
            <td nowrap  bordercolor="#000000">&nbsp;</td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Impuesto Retenido :</div>
            </td>
            <td nowrap  bordercolor="#000000">
                <eibsinput:text name="calcLoans" property="E01TOTHLD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap  bordercolor="#000000">&nbsp;</td>
            <td nowrap  bordercolor="#000000">&nbsp;</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Interes a Pagar :</div>
            </td>
            <td nowrap  bordercolor="#000000">
                <eibsinput:text name="calcLoans" property="E01WRKAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap  bordercolor="#000000">&nbsp;</td>
            <td nowrap  bordercolor="#000000">&nbsp;</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap > 
              <div align="right">Total :</div>
            </td>
            <td nowrap  bordercolor="#000000"> 
                <eibsinput:text name="calcLoans" property="E01TOTDUE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap  bordercolor="#000000">&nbsp;</td>
            <td nowrap  bordercolor="#000000">&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>




<% if(error.getERWRNG().equals("Y")){%>
	<div align="center"> 
   <h4 style="text-align:center">
   	<input type="checkbox" name="H01FLGWK2" id="H01FLGWK2" value="A" <% if(calcLoans.getH01FLGWK2().equals("A")){ out.print("checked");} %> >Aceptar con Aviso</h4>
   </div>
<% } %> 

	<div align="center"> 
		<% if (userPO.getAccNum().length() > 0) { %>
    	<input class="EIBSBTN" type=button name="Print" value="Imprimir" onclick="printPDF()">
    	&nbsp;&nbsp;&nbsp;&nbsp;
    	<input class="EIBSBTN" type=submit name="Submit" value="Enviar">
    	&nbsp;&nbsp;&nbsp;&nbsp;
    	<input class="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="checkClose()">
		<% } else { %>
    	<input class="EIBSBTN" type=submit name="Submit" value="Enviar">
    	<% } %>
  	</div>
 
  </form>
</body>
</html>
