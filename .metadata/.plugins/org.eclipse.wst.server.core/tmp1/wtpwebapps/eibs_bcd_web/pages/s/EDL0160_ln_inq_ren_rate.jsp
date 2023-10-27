<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tabla de Cargos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="lnServCharge" class="datapro.eibs.beans.ESD0713DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){ %>
	builtNewMenu(ln_i_1_opt);
<% } else  { %>
	builtNewMenu(ln_i_2_opt);
<% } %>

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
   if (userPO.getPurpose().equals("INQUIRY")){ 
   out.println("<SCRIPT> initMenu(); </SCRIPT>");}
%> 

<h3 align="center">Consulta de Tabla de Cargos de Pr&eacute;stamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_inq_ren_rate, EDL0160"></h3>
<hr size="4">
<form >
  <p></p>

  <%int row = 0; %>
  
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
                <input type="text" name="E02CUN2" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PTYP" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right"><b>Oficial :</b></div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
              </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n General</h4>
  
  <table class="tableinfo">
    <tr > 
      <td > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="49%"> 
              <div align="right">C&oacute;digo del Banco:</div>
            </td>
            <td width="51%"> 
              <input type="text" name="E01SELBNK" size="4" maxlength="2" value="<%= lnServCharge.getE01SELBNK().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="49%"> 
              <div align="right">Tipo de Producto :</div>
            </td>
            <td width="51%"> 
              <input type="text" name="E01SELTYP" size="6" maxlength="4" value="<%= lnServCharge.getE01SELTYP().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="49%"> 
              <div align="right">N&uacute;mero de Tabla:</div>
            </td>
            <td width="51%"> 
              <input type="text" name="E01SELTLN" size="4" maxlength="2" value="<%= lnServCharge.getE01SELTLN().trim()%>" readonly>
              <input type="text" name="E01DLSDSC" size="37" maxlength="35" value="<%= lnServCharge.getE01DLSDSC().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
			    <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="25%"> 
 		         <eibsinput:text name="lnServCharge" property="E01DLSDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
            <td nowrap width="20%">
			</td>
		    <td nowrap width="10%">
			<td nowrap  width="20%"> 
              Factor	        
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap> 
              <div align="right">Tipo de Interes :</div>
            </td>
            <td nowrap> 
            	<input type="text" name="E01DLSICT" size="2" maxlength="1"	value="<%= lnServCharge.getE01DLSICT()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Tasa Base o Puntos :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnServCharge" property="E01DLSRTF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
            <td nowrap colspan=3> 
              <input type="text" name="E01DLSRFT" size="2" maxlength="1"	value="<%= lnServCharge.getE01DLSRFT()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap> 
              <div align="right">Tasa Minima Permitida :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnServCharge" property="E01DLSMIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
 	        </td>
 	        <td nowrap> 
              <div align="right">Tasa Maxima Permitida :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnServCharge" property="E01DLSMAX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
 	        </td>
 	        <td nowrap colspan=3> 
              <input type="text" name="E01DLSMMT" size="2" maxlength="1"	value="<%= lnServCharge.getE01DLSMMT()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Peiodo Base Calculo de Interes :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01DLSDAB" size="4" maxlength="3" value="<%= lnServCharge.getE01DLSDAB()%>" readonly>	        
            </td>
            <td nowrap> 
              <div align="right">Cargo o Tasa x Mora :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnServCharge" property="E01DLSMRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
 	        </td>
            <td nowrap colspan=3>        
              <input type="text" name="E01DLSFL2" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSFL2()%>" readonly>
            </td>
          </tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Periodo Base Calculo de Mora :</div>
            </td>
            <td nowrap>
              <input type="text" name="E01DLSPBS" size="4" maxlength="3" value="<%= lnServCharge.getE01DLSPBS()%>" readonly>	        
            </td>
            <td nowrap> 
              <div align="right">Cargo Mínimo de Mora :</div>
            </td>
            <td nowrap colspan=4> 
		         <eibsinput:text name="lnServCharge" property="E01DLSMPA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
 	        </td>            
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Control Adelanto Capital :</div>
            </td>
			<td nowrap>
  				<input type="radio" disabled name="E01DLSFL1" value="Y" <%if(lnServCharge.getE01DLSFL1().equals("Y")) out.print("checked");%>>Si
  				<input type="radio" disabled name="E01DLSFL1" value="N" <%if(lnServCharge.getE01DLSFL1().equals("N")) out.print("checked");%>>No
			</td>
			<td nowrap>
              <div align="right">Dias de Gracia por Mora :</div>
            </td>
			<td nowrap colspan=4>
  				1- <input type="text" name="E01DLSGR1" size="3" maxlength="2" value="<%=lnServCharge.getE01DLSGR1()%>" readonly> 
  				2- <INPUT type="text" name="E01DLSGR2" size="3" maxlength="2" value="<%=lnServCharge.getE01DLSGR2()%>" readonly> 
  				3- <INPUT type="text" name="E01DLSGR3" size="3" maxlength="2" value="<%=lnServCharge.getE01DLSGR3()%>" readonly>
  			</td>
		  </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Vencimiento en Feriados :</div>
            </td>
			<td nowrap>
		              <input type="text" name="E01DLSFCO" size="60" maxlength="60" readonly
	              		 value="<% if (lnServCharge.getE01DLSFCO().equals("1")) out.print("Acepta Dias Feriados");
							      else if (lnServCharge.getE01DLSFCO().equals("2")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Anterior");
							      else if (lnServCharge.getE01DLSFCO().equals("3")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Siguiente");
								  else out.print("");%>">
  			<td nowrap>
              <div align="right">Dias de Paso a Vencido :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnServCharge" property="E01DLSPMD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Forma de Cambio Contable :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E01DLSTCG" size="2" maxlength="1" value="<%=lnServCharge.getE01DLSTCG()%>" readonly>
  			<td nowrap>
              <div align="right">Dias de Paso Castigo sin Garantia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnServCharge" property="E01DLSPC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Retiro Documentos de Custodia :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E01DLSCUP" size="3" maxlength="3" value="<%=lnServCharge.getE01DLSCUP()%>" readonly>
            </td>
  			<td nowrap>
              <div align="right">Dias de Paso Castigo con Garantia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnServCharge" property="E01DLSPC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Permite Pagos Parciales :</div>
            </td>
			<td nowrap>
	             <input type="text" name="E01DLSPPR" size="2" maxlength="1"	value="<%= lnServCharge.getE01DLSPPR()%>" readonly>
 			</td>			
 			<td nowrap>
              <div align="right">Dias Suspensi&oacute;n de Devengo :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnServCharge" property="E01DLSPSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">N&uacute;mero de Reincidencia en Mora :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E01DLSNSU" size="3" maxlength="2" value="<%=lnServCharge.getE01DLSNSU()%>" readonly>
            </td>
  			<td nowrap>
              <div align="right">Dias Suspensi&oacute;n por Reincidencia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnServCharge" property="E01DLSRSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap> 
              <div align="right">Intentos cobro Multicuentas :</div>
            </td>
            <td align="left">
  				<input type="text" name="E01DLSCMC" size="3" maxlength="2" value="<%=lnServCharge.getE01DLSCMC()%>" readonly>
            </td>
			<td nowrap>
              <div align="right">A&ntilde;os de Excencion Renta Gravable :</div>
            </td>
			<td nowrap colspan=4>
				<eibsinput:text name="lnServCharge" property="E01DLSNP1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="2" />
  			</td>
          </tr>
         </table>
       </td>
    </tr>
  </table>

<H4>Cambio de Cuenta Contable</H4>
  <table  class="tableinfo" >
    <tr > 
      <td nowrap> 
 			   <table cellspacing="0" cellpadding="2" width="100%" border="0">
	          <tr id="trclear">
	            <td nowrap> 
	            	<div align="right">Dias de Vencido :</div>
	            </td>
	            <td nowrap> 
	               (1)<eibsinput:text name="lnServCharge" property="E01DLSPL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	            <td nowrap> 
	               (2)<eibsinput:text name="lnServCharge" property="E01DLSPL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	            <td nowrap> 
	               (3)<eibsinput:text name="lnServCharge" property="E01DLSPL3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	            <td nowrap> 
	               (4)<eibsinput:text name="lnServCharge" property="E01DLSPL4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	            <td nowrap> 
	               (5)<eibsinput:text name="lnServCharge" property="E01DLSPL5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	          </tr>
	          <tr id="trdark">
	            <td nowrap> 
	            	<div align="right">% Capital Vencido :</div>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnServCharge" property="E01DLSPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnServCharge" property="E01DLSPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnServCharge" property="E01DLSPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnServCharge" property="E01DLSPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnServCharge" property="E01DLSPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	          </tr>
		   </table>
	   </td>
   </tr>
  </table>
  
  
<h4>Prioridad de Pagos </h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DLSPP1" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSPP1().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DLSPP2" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSPP2().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E01DLSPP3" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSPP3().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DLSPP4" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSPP4().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E01DLSPP5" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSPP5().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DLSPP6" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSPP6().trim()%>" readonly>
              </div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%"  > 
	              <div align="center"> 
	                <input type="text" name="E01DLSPP7" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSPP7().trim()%>" readonly>
	              </div>
	            </td>
			  <% } %>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DLSPP8" size="2" maxlength="1" value="<%= lnServCharge.getE01DLSPP8().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="12%" > 
              <div align="center">Principal</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Intereses</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Mora</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Comisiones</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Impuestos</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Deducciones</div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%" > 
	              <div align="center">FECI</div>
	            </td>
			  <% } %>
            <td nowrap width="12%" > 
              <div align="center">Cobranzas</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p align="center">&nbsp;</p>
  </form>
</body>
</html>
