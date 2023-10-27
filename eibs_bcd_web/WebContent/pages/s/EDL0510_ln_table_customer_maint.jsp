<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tasas de Prestamos</title>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="lnParam" class="datapro.eibs.beans.EDL051002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>



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

<h3 align="center">Tabla de Parametros de Prestamos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_table_customer_maint.jsp,EDL0510"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0510" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="200">
  
  <%int row = 0; %>
  <table class="tableinfo" style="width: 1200px">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Banco :</b>
            </td>
            <td nowrap >                
 		         <eibsinput:text name="lnParam" property="E02DLSBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
            </td>
            <td nowrap width="20%" align=right> 
              <b>Producto :</b>
            </td>
            <td nowrap > 
 		         <eibsinput:text name="lnParam" property="E02DLSTYP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%" align=right> 
              <b>Codigo :</b>
            </td>
            <td nowrap>  
 		         <eibsinput:text name="lnParam" property="E02DLSTLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>" readonly="true"/>
            </td>
            <td nowrap width="20%" align=right> 
              <b>Cliente :</b>
            </td>
            <td nowrap>  
 		         <eibsinput:text name="lnParam" property="E02DLSCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <H4>Datos B&aacute;sicos</H4>
  <table  class="tableinfo" style="width: 1200px">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="25%"> 
			    <div align="right">Descripci&oacute;n :</div>
            </td>
            <td nowrap width="25%"> 
 		         <eibsinput:text name="lnParam" property="E02DLSDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
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
            	<input type="text" name="E02DLSICT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSICT()%>" readonly>
            </td>
            <td nowrap> 
              <div align="right">Tasa Base o Puntos :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnParam" property="E02DLSRTF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
            <td nowrap colspan=3> 
              <input type="text" name="E02DLSRFT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSRFT()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap> 
              <div align="right">Tasa Minima Permitida :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnParam" property="E02DLSMIN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
 	        </td>
 	        <td nowrap> 
              <div align="right">Tasa Maxima Permitida :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnParam" property="E02DLSMAX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
 	        </td>
 	        <td nowrap colspan=3> 
              <input type="text" name="E02DLSMMT" size="2" maxlength="1"	value="<%= lnParam.getE02DLSMMT()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Peiodo Base Calculo de Interes :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLSDAB" size="4" maxlength="3" value="<%= lnParam.getE02DLSDAB()%>" readonly>	        
            </td>
            <td nowrap> 
              <div align="right">Cargo o Tasa x Mora :</div>
            </td>
            <td nowrap> 
		         <eibsinput:text name="lnParam" property="E02DLSMRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
 	        </td>
            <td nowrap colspan=3>        
              <input type="text" name="E02DLSFL2" size="2" maxlength="1" value="<%= lnParam.getE02DLSFL2()%>" readonly>
            </td>
          </tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Periodo Base Calculo de Mora :</div>
            </td>
            <td nowrap>
              <input type="text" name="E02DLSPBS" size="4" maxlength="3" value="<%= lnParam.getE02DLSPBS()%>" readonly>	        
            </td>
            <td nowrap> 
              <div align="right">Cargo Mínimo de Mora :</div>
            </td>
            <td nowrap colspan=4> 
		         <eibsinput:text name="lnParam" property="E02DLSMPA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
 	        </td>            
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap>
              <div align="right">Control Adelanto Capital :</div>
            </td>
			<td nowrap>
  				<input type="radio" disabled name="E02DLSFL1" value="Y" <%if(lnParam.getE02DLSFL1().equals("Y")) out.print("checked");%>>Si
  				<input type="radio" disabled name="E02DLSFL1" value="N" <%if(lnParam.getE02DLSFL1().equals("N")) out.print("checked");%>>No
			</td>
			<td nowrap>
              <div align="right">Dias de Gracia por Mora :</div>
            </td>
			<td nowrap colspan=4>
  				1- <input type="text" name="E02DLSGR1" size="3" maxlength="2" value="<%=lnParam.getE02DLSGR1()%>" readonly> 
  				2- <INPUT type="text" name="E02DLSGR2" size="3" maxlength="2" value="<%=lnParam.getE02DLSGR2()%>" readonly> 
  				3- <INPUT type="text" name="E02DLSGR3" size="3" maxlength="2" value="<%=lnParam.getE02DLSGR3()%>" readonly>
  			</td>
		  </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Vencimiento en Feriados :</div>
            </td>
			<td nowrap>
			              <input type="text" name="E02DLSFCO" size="60" maxlength="60" readonly
	              		 value="<% if (lnParam.getE02DLSFCO().equals("1")) out.print("Acepta Dias Feriados");
							      else if (lnParam.getE02DLSFCO().equals("2")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Anterior");
							      else if (lnParam.getE02DLSFCO().equals("3")) out.print("No Acepta Dias Feriados, Vencimiento Dia Habil Siguiente");
								  else out.print("");%>">
  			<td nowrap>
              <div align="right">Dias de Paso a Vencido :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSPMD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Forma de Cambio Contable :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSTCG" size="2" maxlength="1" value="<%=lnParam.getE02DLSTCG()%>" readonly>
  			<td nowrap>
              <div align="right">Dias de Paso Castigo sin Garantia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSPC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Retiro Documentos de Custodia :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSCUP" size="3" maxlength="3" value="<%=lnParam.getE02DLSCUP()%>" readonly>
            </td>
  			<td nowrap>
              <div align="right">Dias de Paso Castigo con Garantia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSPC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">Permite Pagos Parciales :</div>
            </td>
			<td nowrap>
	             <input type="text" name="E02DLSPPR" size="2" maxlength="1"	value="<%= lnParam.getE02DLSPPR()%>" readonly>
 			</td>			
 			<td nowrap>
              <div align="right">Dias Suspensi&oacute;n de Devengo :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSPSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
		  <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap>
              <div align="right">N&uacute;mero de Reincidencia en Mora :</div>
            </td>
			<td nowrap>
  				<input type="text" name="E02DLSNSU" size="3" maxlength="2" value="<%=lnParam.getE02DLSNSU()%>" readonly>
            </td>
  			<td nowrap>
              <div align="right">Dias Suspensi&oacute;n por Reincidencia :</div>
            </td>
			<td nowrap colspan=4>
		         <eibsinput:text name="lnParam" property="E02DLSRSU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap> 
              <div align="right">Moneda Cobro Cargos :</div>
            </td>
            <td align="left">
  				<input type="text" name="E02DLSCCR" size="4" maxlength="3" value="<%=lnParam.getE02DLSCCR()%>" readonly>
            </td>
			<td nowrap>
              <div align="right">Fecha de Validez :</div>
            </td>
			<td nowrap colspan=4>
                   <eibsinput:date name="lnParam" fn_year="E02DLSMAY" fn_month="E02DLSMAM" fn_day="E02DLSMAD" required="true"/> 
  			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
			<td nowrap> 
              <div align="right">Intentos de cobro Multicuentas :</div>
            </td>
            <td align="left">
  				<input type="text" name="E02DLSCMC" size="3" maxlength="2" value="<%=lnParam.getE02DLSCMC()%>" onKeypress="enterInteger(event)">
            </td>
			<td nowrap>
              <div align="right"></div>
            </td>
			<td nowrap colspan=4>
  			</td>
          </tr>
         </table>
       </td>
    </tr>
  </table>

<H4>Cambio de Cuenta Contable</H4>
  <table  class="tableinfo" style="width: 1200px">
    <tr > 
      <td nowrap> 
 			   <table cellspacing="0" cellpadding="2" width="100%" border="0">
	          <tr id="trclear">
	            <td nowrap> 
	            	<div align="right">Dias de Vencido :</div>
	            </td>
	            <td nowrap> 
	               (1)<eibsinput:text name="lnParam" property="E02DLSPL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	            <td nowrap> 
	               (2)<eibsinput:text name="lnParam" property="E02DLSPL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	            <td nowrap> 
	               (3)<eibsinput:text name="lnParam" property="E02DLSPL3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	            <td nowrap> 
	               (4)<eibsinput:text name="lnParam" property="E02DLSPL4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	            <td nowrap> 
	               (5)<eibsinput:text name="lnParam" property="E02DLSPL5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="5" readonly="true"/>
	            </td>
	          </tr>
	          <tr id="trdark">
	            <td nowrap> 
	            	<div align="right">% Capital Vencido :</div>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	            <td nowrap> 
					<eibsinput:text name="lnParam" property="E02DLSPR5" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true"/>
	            </td>
	          </tr>
		   </table>
	   </td>
   </tr>
  </table>
  
  
<h4>Prioridad de Pagos </h4>
  <table class="tableinfo" style="width: 1200px">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DLSPP1" size="2" maxlength="1" value="<%= lnParam.getE02DLSPP1().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DLSPP2" size="2" maxlength="1" value="<%= lnParam.getE02DLSPP2().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E02DLSPP3" size="2" maxlength="1" value="<%= lnParam.getE02DLSPP3().trim()%>" readonly>
              </div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%"  > 
	              <div align="center"> 
	                <input type="text" name="E02DLSPP7" size="2" maxlength="1" value="<%= lnParam.getE02DLSPP7().trim()%>" readonly>
	              </div>
	            </td>
			  <% } %>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DLSPP4" size="2" maxlength="1" value="<%= lnParam.getE02DLSPP4().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E02DLSPP5" size="2" maxlength="1" value="<%= lnParam.getE02DLSPP5().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DLSPP6" size="2" maxlength="1" value="<%= lnParam.getE02DLSPP6().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E02DLSPP8" size="2" maxlength="1" value="<%= lnParam.getE02DLSPP8().trim()%>" readonly>
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
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%" > 
	              <div align="center">FECI</div>
	            </td>
			  <% } %>
            <td nowrap width="12%" > 
              <div align="center">Comisiones</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Impuestos</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Deducciones</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Cobranzas</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  
  <H4>Comisiones o Impuestos</H4>
	<table  id="mainTable" class="tableinfo" style="height: 90px; width: 1200px">
    	<tr height="5%"> 
    		<TD NOWRAP width="100%" >
  				<TABLE id="headTable" width="100%" >
         			 <TR id="trdark"> 
			            <th nowrap  width="20%">Descripcion</th>
			            <th nowrap  width="5%">Fac</th>
			            <th nowrap  width="10%">Monto</th>
			            <th nowrap  width="5%">Fre</th>
			            <th nowrap  width="10%">Mínimo</th>
			            <th nowrap  width="10%">Máximo</th>
			            <th nowrap  width="5%">Mda</th>
			            <th nowrap  width="10%">Cta/Contable</th>
			            <th nowrap  width="5%">Iva</th>
          			</TR>
       			</TABLE>
      		</td>
    	</tr>    
		<tr height="95%">    
			<td NOWRAP width="100%">       
  
   			    <div id="dataDiv1" class="scbarcolor" style="height:90px;  overflow:auto;">
    				<table id="dataTable" width="100%" > 
          <%
  				   int amount = 9;
 				   String name; 				   
  					for ( int i=1; i<=amount; i++ ) {
   					 name = i + "";
   			%> 
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="center" > 
	            <%= name %>
                <input type="text" name="E02DLSDE<%= name %>" value="<%= lnParam.getField("E02DLSDE"+name).getString() %>" size="35" maxlength="35">
              </div>
            </td>
            <td nowrap width="5%"> 
              <div align="center"> 
                <input type="text" name="E02DLSFA<%= name %>" size="2" maxlength="1" value="<%= lnParam.getField("E02DLSFA"+name).getString()%>"
				 class="context-menu-help" onmousedown="init(documentsFeeCharges,this.name,'','','','','')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02DLSAM<%= name %>" size="15" maxlength="15" value="<%= lnParam.getField("E02DLSAM"+name).getString()%>">
              </div>
            </td>
            <td nowrap width="5%"> 
              <div align="center"> 
                <input type="text" name="E02DLSAP<%= name %>" size="2" maxlength="1" value="<%= lnParam.getField("E02DLSAP"+name).getString()%>" 
			    class="context-menu-help" onmousedown="init(documentsFrecCharges,this.name,'','','','','')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02DLSMN<%= name %>" size="15" maxlength="15" value="<%= lnParam.getField("E02DLSMN"+name).getString()%>">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" class="txtright" name="E02DLSMX<%= name %>" size="15" maxlength="15"  value="<%= lnParam.getField("E02DLSMX"+name).getString()%>">
              </div>
            </td>
            <td nowrap width="5%"> 
              <div align="center"> 
                <input type="text"  name="E02DLSGB<%= name %>" size="3" maxlength="3" value="<%=lnParam.getField("E02DLSGB"+name).getString()%>"
				 class="context-menu-help" onmousedown="init(paramByCurrency,this.name,'','','','','')" >
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E02DLSGL<%= name %>" size="18" maxlength="17" value="<%= lnParam.getField("E02DLSGL"+name).getString()%>"  
			    class="context-menu-help" onmousedown="init(ledgerHelp,this.name,'','','','','')" >
              </div>
            </td>
            
            <td nowrap width="5%"> 
              <div align="center"> 
                <input type="text" name="E02DLSWH<%= name %>" size="2" maxlength="1"  value="<%= lnParam.getField("E02DLSWH"+name).getString()%>">
              </div>
            </td>
          </tr>
         <% } %> 
				</table>
			</div>
		</TD>
	</TR>	
	</TABLE>

  <p align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
 
  </form>
</body>
</html>
