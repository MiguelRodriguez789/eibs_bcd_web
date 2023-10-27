<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>

<head>
<title>Informacion Basica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
                                                  
<jsp:useBean id="bankOld" class="datapro.eibs.beans.ESD000502Message" 	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" 	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" 	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

</head>

<body bgcolor="#FFFFFF">

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
 
%>

<h3 align="center">Parametros Generales de Control Mantenimiento - Continuacion - <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="bank_setup_basic_maint_add, ESD0005"></h3>
<hr size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0005M">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="500">  

 <% int row = 0;%>
<h4>Informaci&oacute;n B&aacute;sica</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	    <td nowrap width="25%">
		  <div align="right">Codigo Interno IBS para el Banco :</div>
		</td>
		<td nowrap width="25%">
            <eibsinput:cnofc name="bankOld" flag="99" property="E02IBSCBK" fn_description=" " required="false"/>
		</td>
		<td nowrap width="25%">
		  <div align="right">Codigo Banco Superintendencia :</div>
		</td>
        <td nowrap width="25%">
            <eibsinput:cnofc name="bankOld" flag="92" property="E02IBSCSU" fn_description=" " required="false"/>
      </td>
	</tr>

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Transfer P&amp;G en Mda/Ext:</div>
		</td>
		<td nowrap width="25%">		 
		<select name="E02CNTPRF">
			<option value=" "
				<%if (!(bankOld.getE02CNTPRF().equals("B")
	                 || bankOld.getE02CNTPRF().equals("D")	 
	                 || bankOld.getE02CNTPRF().equals("M")	
	                 || bankOld.getE02CNTPRF().equals("N")))
	             out.print("selected");%>>
			</option>
			<option value="B" <%if (bankOld.getE02CNTPRF().equals("B")) out.print("selected");%>>Misma Cta Mayor Mda Base</option>
			<option value="D" <%if (bankOld.getE02CNTPRF().equals("D")) out.print("selected");%>>Revaluacion Diaria</option>
			<option value="M" <%if (bankOld.getE02CNTPRF().equals("M")) out.print("selected");%>>Revaluacion Mensual</option>
			<option value="N" <%if (bankOld.getE02CNTPRF().equals("N")) out.print("selected");%>>No Revaluacion PyG</option> 
		</select>		   
	  </td>
		<td nowrap width="25%">
		<div align="right">Codigo Moneda Base :</div>
		</td>        
		<td nowrap width="25%">
		        <eibsinput:help name="bankOld" property="E02CNTBCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="false"
               	    	fn_param_one="E02CNTBCU" fn_param_two="<%= bankOld.getE02CNTBNK() %>"/>
        </td> 
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	    <td nowrap width="25%">
		  <div align="right">Cuenta Transferencia P&amp;G M/E :</div>
		</td>
		<td nowrap width="25%">
                <eibsinput:help name="bankOld" property="E02CNTPRG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
               	    	fn_param_one="E02CNTPRG" fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>  
		</td>
		<td nowrap width="25%">
		   <div align="right">Moneda Casa Matriz :</div>
		</td>
        <td nowrap width="25%">
		    <eibsinput:help name="bankOld" property="E02CNTHCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="false"
                	fn_param_one="E02CNTHCU" fn_param_two="<%= bankOld.getE02CNTBNK() %>" />
      </td>
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Cuenta Suspenso Balance:</div>
		</td>
		<td nowrap width="25%">
             <eibsinput:help name="bankOld" property="E02CNTDGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E02CNTDGA" fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value" />
      </td>
		<td nowrap width="25%">
		   <div align="right">Lote Especial Contable :</div>
		</td>
        <td nowrap width="25%">
			<eibsinput:text name="bankOld" property="E02CNTGRF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH %>" />  
		    &nbsp;&nbsp; A &nbsp; 
			<eibsinput:text name="bankOld" property="E02CNTGRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BATCH %>" />  
		</td>     
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Cuenta Suspenso Contingente :</div>
		</td>
		<td nowrap width="25%">
              <eibsinput:help name="bankOld" property="E02CNTDCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E02CNTDCA" fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>
    	</td>
	 
	    <td nowrap width="25%">
		   <div align="right">
		   		<div align="right">Frecuencia Revaluacion :</div>
		   </div>
		</td>
		<td nowrap width="25%">
			<select name="E02CNTRVF">
				<option value=" "
					<%if (!(bankOld.getE02CNTRVF().equals("1")
		                 || bankOld.getE02CNTRVF().equals("2")	
		                 || bankOld.getE02CNTRVF().equals("3") 	
		                 || bankOld.getE02CNTRVF().equals("N")))
		           out.print("selected");%>>
				</option>
				<option value="1" <%if (bankOld.getE02CNTRVF().equals("1")) out.print("selected");%>>Posicion Global Diaria</option>
				<option value="2" <%if (bankOld.getE02CNTRVF().equals("2")) out.print("selected");%>>Posicion Global Mensual</option>
				<option value="3" <%if (bankOld.getE02CNTRVF().equals("3")) out.print("selected");%>>Reval. por Cuenta Diaria</option>
				<option value="N" <%if (bankOld.getE02CNTRVF().equals("N")) out.print("selected");%>>No Maneja Revaluacion</option> 
			</select>
	    </td>		
	</tr>
	
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		    <div align="right">Revaluación P/G No-IBF :</div>
		</td>
		<td nowrap width="25%">
              <eibsinput:help name="bankOld" property="E02CNTPLA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E02CNTPLA"  fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>
		</td>
		 
	 
		<td nowrap width="25%">
		    <div align="right">Revaluación P/G IBF :</div>
		</td>
		<td  nowrap width="25%">
              <eibsinput:help name="bankOld" property="E02CNTPLI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E02CNTPLI"  fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>
        </td>	
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
	    	<div align="right">Cuenta a Cobrar (IBF) :</div>
		</td>
		<td nowrap width="25%">		    
              <eibsinput:help name="bankOld" property="E02CNTDFA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E02CNTDFA"  fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>
		</td>	
		<td nowrap width="25%">
		<div align="right">Cuenta a Pagar (No IBF) :</div>
		</td>
		<td nowrap width="25%">
              <eibsinput:help name="bankOld" property="E02CNTDTI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E02CNTDTI"  fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>
		</td>	
	</tr>
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
			<div align="right">Producto Miscelaneos Para Rechazos :</div>
		</td>
		<td nowrap width="25%">
              <eibsinput:help name="bankOld" property="E02IBSUS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" required="false" fn_param_one="E02IBSUS1"   fn_param_four=" "  />
   		</td>
	    <td nowrap width="25%">
		   <div align="right">Cuenta Transito Para Prestamos :</div>
		</td>
		<td nowrap width="25%">
              <eibsinput:help name="bankOld" property="E02IBSGL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
          	    	fn_param_one="E02IBSGL1"  fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>		
	    </td>
	</tr>	
</table>

<h4>Informaci&oacute;n Adicional</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Tipo de Institución :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTTYP">
			<option value=" "
				<%if (!(bankOld.getE02CNTTYP().equals("B")	       	
	                 || bankOld.getE02CNTTYP().equals("R")))
	             out.print("selected");%>>
			</option>
			<option value="B" <%if (bankOld.getE02CNTTYP().equals("B")) out.print("selected");%>>Institucion Base</option>
			<option value="R" <%if (bankOld.getE02CNTTYP().equals("R")) out.print("selected");%>>Institucion Consolidar</option> 
		</select>
		</td>
		<td nowrap width="25%">
		<div align="right">Instituci&oacute;n a Consolidar :</div>
		</td>
        <td nowrap width="25%">
            <input type="text" name="E02CNTREG" size="3" maxlength="2" value="<%=bankOld.getE02CNTREG().trim()%>">
        </td>
	</tr>

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Balance Usado Moneda/Extr :</div>
		</td>
		<td nowrap width="25%">
           <input type="text" name="E02CNTIEB" size="2" maxlength="1" value="<%=bankOld.getE02CNTIEB().trim()%>">
           <A href="javascript:GetCode('E02CNTIEB','STATIC_par_bal_mond_extrg.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>			
		</td>
		<td nowrap width="25%">
		<div align="right">Institucion a Donde Duplicar :</div>
		</td>
        <td nowrap width="25%">
            <input type="text" name="E02CNTBDB" size="17" maxlength="16" value="<%=bankOld.getE02CNTBDB().trim()%>">
        </td>
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Ingreso por Compra/Venta :</div>
		</td>
		<td nowrap width="25%">
               <eibsinput:help name="bankOld" property="E02CNTFXI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
               	    	fn_param_one="E02CNTFXI"  fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>
 		</td>
		<td nowrap width="25%">
		<div align="right">Nivel Estado Financieros :</div>
		</td>
		<td nowrap width="25%">
		    <input type="text" name="E02CNTFSL" size="2" maxlength="1" value="<%=bankOld.getE02CNTFSL().trim()%>">
			<A href="javascript:GetCode('E02CNTFSL','STATIC_par_estd_finan.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>			
		</td>
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Egreso por Compra/Venta :</div>
		</td>
		<td nowrap width="25%">
            <eibsinput:help name="bankOld" property="E02CNTFXO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="false"
               	    	fn_param_one="E02CNTFXO"  fn_param_two="<%= bankOld.getE02CNTBNK() %>" fn_param_three="document.forms[0].E02CNTBCU.value"/>
 		</td>
		<td nowrap width="25%">	
		<div align="right">Numeración de Chequeras :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTFL4"> 
			<option value=" " <%if (bankOld.getE02CNTFL4().equals(" ")) out.print("selected");%>>Numeracion por cuenta</option>
			<option value="1" <%if (bankOld.getE02CNTFL4().equals("1")) out.print("selected");%>>Numeracion por Banco</option>
 
		</select> 
		</td>
	</tr>

   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">% Máximo a Garantizar :</div>
		</td>
		<td nowrap width="25%">
           <eibsinput:text name="bankOld" property="E02CNTCPE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
	    </td>
		<td nowrap width="25%">
		<div align="right">Dias Paso Interes Sobrgiro Suspenso :</div>
		</td>
		<td nowrap width="25%">
		   <input type="text" name="E02CNTIPA" size="3" maxlength="2" 	value="<%= bankOld.getE02CNTIPA().trim()%>">
		</td>	    

	</tr>
 
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Estado Cuenta Giros/Val.Cobro :</div>
		</td>
		<td nowrap width="25%">		 
		<select name="E02CNTFL7">		  		
		  <option value=" "
				<% if (!(bankOld.getE02CNTFL7().equals("D")
                	  || bankOld.getE02CNTFL7().equals("M")
                  	  || bankOld.getE02CNTFL7().equals("N")))
                	out.print("selected"); %>>
          </option> 
		  <option value="D" <%if (bankOld.getE02CNTFL7().equals("D"))  out.print("selected");%>>Dia</option>
		  <option value="M" <%if (bankOld.getE02CNTFL7().equals("M"))  out.print("selected");%>>Mes</option>
	      <option value="N" <%if (bankOld.getE02CNTFL7().equals("N"))  out.print("selected");%>>No genera</option>     
		</select>   
		</td>
	    <td nowrap width="25%">
		<div align="right">Tipo de Previsión :</div>
		</td>
		<td nowrap width="25%">
 		<select name="E02CNTPVF">		  		
		  <option value=" "
				<% if (!(bankOld.getE02CNTPVF().equals("N")
                      || bankOld.getE02CNTPVF().equals("C")
                  	  || bankOld.getE02CNTPVF().equals("G")))
                	out.print("selected"); %>>
          </option> 
		  <option value="N" <%if (bankOld.getE02CNTPVF().equals("N"))  out.print("selected");%>>No Previsión</option>
		  <option value="C" <%if (bankOld.getE02CNTPVF().equals("C"))  out.print("selected");%>>A Nivel de Cliente</option>
	      <option value="G" <%if (bankOld.getE02CNTPVF().equals("G"))  out.print("selected");%>>A Nivel de Grupo</option>     
		</select>  
	    </td>		
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Forma Contable Constructores :</div>
		</td>
        <td nowrap width="25%">
 		    <input type="text" name="E02CNTFL8" size="2" maxlength="1" value="<%=bankOld.getE02CNTFL8().trim()%>">
			<A href="javascript:GetCode('E02CNTFL8','STATIC_par_contbl_contruc.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>	
        </td>
	    <td nowrap width="25%">
		<div align="right"> Dias traspaso sobregiro :</div>
		</td>
        <td nowrap width="25%">
            <input type="text" name="E02CNTOVD" size="5" maxlength="4" 	value="<%= bankOld.getE02CNTOVD().trim()%>">
        </td>        

	</tr>
 
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Deudores a Nivel del Cliente :</div>
		</td>
		<td nowrap width="25%"> 
	       <p>
           <input type="radio" name="E02CNTFG5" value="1"   <%if (bankOld.getE02CNTFG5().equals("1")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTFG5" value="0"   <%if (bankOld.getE02CNTFG5().equals("0")) 	out.print("checked");%>> No</p>		    
	    </td>
	    <td nowrap width="25%" align="right">Reserva Tecnica :</td>
	    <td nowrap width="25%"><input type="text" name="E02CNTRTC" size="5" maxlength="4" value="<%=bankOld.getE02CNTRTC().trim()%>"></td> 
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	    <td nowrap width="25%">
     	    <div align="right">Monto Limite Control Efectivo :</div>
		</td>
		<td nowrap width="25%">
			<eibsinput:text name="bankOld" property="E02CNTCSL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />  
	    </td>
		<td nowrap width="25%">
			<div align="right">Moneda Control Efectivo :</div>
 		</td>
        <td nowrap width="25%">
    	        <eibsinput:help name="bankOld" property="E02CNTCLM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" required="false"
               	    	fn_param_one="E02CNTCLM" fn_param_two="<%= bankOld.getE02CNTBNK() %>"/>
       </td>	 
 	</tr>			
	 
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	    <td nowrap width="25%">
     	    <div align="right">Valor Salario Minimo Diario :</div>
		</td>
		<td nowrap width="25%">
			<eibsinput:text name="bankOld" property="E02IBSAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />  
	    </td>
	    <td nowrap width="25%">
     	    <div align="right">Dias Base ISR :</div>
		</td>
		<td nowrap width="25%">
            <input type="text" class="txtright" name="E02IBSDY1" size="4" maxlength="3" value="<%=bankOld.getE02IBSDY1().trim()%>" onKeyPress="enterInteger(event)">  
	    </td>

	</tr>

	 
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	    <td nowrap width="25%">
		<div align="right">Generar Notificaciones IBS :</div>
		</td>
		<td nowrap width="25%">
     	    <div align="left"> 
           <input type="radio" name="E02IBSFU1" value="Y"
	                 <%if (bankOld.getE02IBSFU1().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02IBSFU1" value="N" 
                     <%if (bankOld.getE02IBSFU1().equals("N")) 	out.print("checked");%>> No     	    
     	    </div>  
	    </td>
		<td nowrap width="25%">
			<div align="right">Generacion Archivos MISPYG :</div>
		</td>
		<td nowrap width="25%">
		  <p>
           <input type="radio" name="E02IBSFL3" value="Y" <%if (bankOld.getE02IBSFL3().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02IBSFL3" value="N" <%if (bankOld.getE02IBSFL3().equals("N")) 	out.print("checked");%>> No
          </p>
		</td>
	</tr>	
	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	    <td nowrap width="25%">
     	    <div align="right">Inactividad condici&oacute;n crediticia :</div>
		</td>
		<td nowrap width="25%">
			 <input type="text" name="E02CNTLL1" size="4" maxlength="3" value="<%= bankOld.getE02CNTLL1().trim()%>">&nbsp;(Meses)
	    </td>
	    <td nowrap width="25%">
     	    <div align="right">Comportamiento Min. Condicion Crediticia :</div>
		</td>
		<td nowrap width="25%">
             <input type="text" name="E02CNTLL2" size="4" maxlength="3" value="<%= bankOld.getE02CNTLL2().trim()%>">&nbsp;(Cuotas)
 
	    </td>

	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%"><div align="right">Maximo Negociaciones (Anual) :</div></td>
		<td nowrap width="25%">
			<input type="text" name="E02CNTLL3" size="4" maxlength="3" value="<%= bankOld.getE02CNTLL3().trim()%>">
		</td>
		<td nowrap width="25%"><div align="right">Maximo Cuotas Vencidas a Prorrogar :</div></td>
		<td nowrap width="25%">
			<input type="text" name="E02CNTPG1" size="4" maxlength="3" value="<%= bankOld.getE02CNTPG1().trim()%>">
		</td>
	</tr>
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%"><div align="right">Dias Eliminacion Cupos sin Utilizaciones :</div></td>
		<td nowrap width="25%">
			<input type="text" class="txtright" name="E02IBSDY2" size="4" maxlength="3" value="<%=bankOld.getE02IBSDY2().trim()%>" onKeyPress="enterInteger(event)"> 
		</td>
		<td nowrap width="25%"><div align="right">Aplicacion Monto Minimo Cuotas Vencidas :</div></td>
		<td nowrap width="25%">
		 <eibsinput:text name="bankOld" property="E02IBSAM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />  
		</td>
	</tr>

</table>


<h4>Notificaciones Ciclicas por Concepto de Pagos Vencidos</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Imprimir Nivel 1 de Notificación Vencida :</div>
		</td>
		<td nowrap width="25%">
            <input type="text" class="txtright" name="E02CNTML2" size="3" maxlength="2" value="<%=bankOld.getE02CNTML2().trim()%>" onKeyPress="enterInteger(event)">  
		</td>		 
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Imprimir Nivel 2 de Notificación Después de 1ra :</div>
		</td>
		<td nowrap width="25%">
             <input type="text" class="txtright" name="E02CNTML3" size="3" maxlength="2" value="<%=bankOld.getE02CNTML3().trim()%>" onKeyPress="enterInteger(event)">   
		</td>
		
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Imprimir Nivel 3 de Notificación Después de 2da :</div>
		</td>
		<td nowrap width="25%">
            <input type="text" class="txtright" name="E02CNTML4" size="3" maxlength="2" value="<%=bankOld.getE02CNTML4().trim()%>" onKeyPress="enterInteger(event)">   
		</td>
		
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Imprimir Nivel 4 de Notificación Después de 3ra :</div>
		</td>
		<td nowrap width="25%">
		     <input type="text" class="txtright" name="E02CNTML5" size="3" maxlength="2" value="<%=bankOld.getE02CNTML5().trim()%>" onKeyPress="enterInteger(event)">   
		</td>
		
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Imprimir Nivel 5 de Notificación Después de 4ta :</div>
		</td>
		<td nowrap width="25%">
		    <input type="text" class="txtright" name="E02CNTML6" size="3" maxlength="2" value="<%=bankOld.getE02CNTML6().trim()%>" onKeyPress="enterInteger(event)">   
	    </td>

	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias Anticipados para Enviar Aviso de Pago (Facturación) :</div>
		</td>
		<td nowrap width="25%">
		   <INPUT type="text" class="txtright" name="E02CNTNPA" size="3" maxlength="2" value="<%= bankOld.getE02CNTNPA().trim()%>" onKeyPress="enterInteger(event)">
		 		
		</td>
	   
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Actualización Estadisticas al Vencimiento o Período de Gracia :</div>
		</td>
        <td nowrap width="25%">
    	<select name="E02CNTUDS">
    	     <option value=" "
				<% if (!(bankOld.getE02CNTUDS().equals("D")                 
                  	  || bankOld.getE02CNTUDS().equals("G")))
                	out.print("selected"); %>>
             </option>  	
			 <option value="D" <%if (bankOld.getE02CNTUDS().equals("D")) out.print("selected");%>>Actualizar en Fecha de Mora</option> 
             <option value="G" <%if (bankOld.getE02CNTUDS().equals("G")) out.print("selected");%>>Actualizar en Periodo de Gracia</option> 	          	
        </select>  
        </td>
	
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Enviar a Protesto un Documento :</div>
		</td>
		<td nowrap width="25%"> 
			<INPUT type="text" class="txtright" name="E02CNTGPD" size="2" maxlength="1" value="<%= bankOld.getE02CNTGPD().trim()%>">		     		
	    </td>
	</tr>	 
</table>

<h4>Parametros de Cartera</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Imprimir 1er Ciclo Notificaciones de Seguro. :</div>
		</td>
    	<td nowrap width="25%">
    		<input type="text" class="txtright" name="E02CNTIC2" size="3" maxlength="2" value="<%=bankOld.getE02CNTIC2().trim()%>" onKeyPress="enterInteger(event)">  
    	</td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Imprimir 2do Ciclo Notificaciones de Seguro :</div>
		</td>
		<td nowrap width="25%">
            <input type="text" class="txtright" name="E02CNTIC3" size="3" maxlength="2" value="<%=bankOld.getE02CNTIC3().trim()%>" onKeyPress="enterInteger(event)">   
		</td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Imprimir Alerta Vencimiento P&oacute;liza :</div>
		</td>
		<td nowrap width="25%">
            <input type="text" class="txtright" name="E02CNTIC4" size="3" maxlength="2" value="<%=bankOld.getE02CNTIC4().trim()%>" onKeyPress="enterInteger(event)">   
		</td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Dias Consecutivos de Mora para Llevar Intereses a Suspenso :</div>
		</td>
		<td nowrap width="25%">
		    <input type="text" class="txtright" name="E02CNTIPA" size="4" maxlength="3" value="<%=bankOld.getE02CNTIPA().trim()%>">
		</td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Forma de Cobro para las Cuotas Vencidas :</div>
		</td>
		<td nowrap width="25%">	
		   <input type="text" name="E02CNTPDP" size="2" maxlength="1" value="<%= bankOld.getE02CNTPDP().trim()%>">
 	   	   <A href="javascript:GetCode('E02CNTPDP','STATIC_par_cuota_venc.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>	  
	    </td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Cambio Contable, Regresa a la cuenta Anterior :</div>
		</td>
		<td nowrap width="25%"> 	
		  <p>	 
           <input type="radio" name="E02CNTWF2" value="1"
	                 <%if (bankOld.getE02CNTWF2().equals("1")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTWF2" value="0" 
                     <%if (bankOld.getE02CNTWF2().equals("0")) 	out.print("checked");%>> No
          </p>			
	    </td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Cambio Contable, Mueve la Cuenta de Ingresos :</div>
		</td>
		<td nowrap width="25%"> 	
		  <p>	 
           <input type="radio" name="E02CNTCGL" value="Y"
	                 <%if (bankOld.getE02CNTCGL().equals("Y")) 	out.print("checked");%>> Si
           <input type="radio" name="E02CNTCGL" value="N" 
                     <%if (bankOld.getE02CNTCGL().equals("N")) 	out.print("checked");%>> No
          </p>			
	    </td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Forma de Contabilización de los Cargos por Mora :</div>
		</td>
        <td nowrap width="25%">
     	<select name="E02CNTAPI">
		    <option value=" "
				<% if (!(bankOld.getE02CNTAPI().equals("1")
                      || bankOld.getE02CNTAPI().equals("2")
                  	  || bankOld.getE02CNTAPI().equals("N")))
                	out.print("selected"); %>>
          </option>       	
			 <option value="1" <%if (bankOld.getE02CNTAPI().equals("1")) out.print("selected");%>>Diariamente</option> 
             <option value="2" <%if (bankOld.getE02CNTAPI().equals("2")) out.print("selected");%>>Cuando se Cobra</option> 
             <option value="N" <%if (bankOld.getE02CNTAPI().equals("N")) out.print("selected");%>>No Calcula Mora</option> 	          	
        </select> 
        </td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	  <td nowrap width="25%">
		  <div align="right">Forma Calculo de los Cargos por Mora :</div>
	  </td>
	  <td nowrap width="25%">
	      <select name="E02IBSFL5">
	  	    <option value=" " <% if (!(bankOld.getE02IBSFL5().equals("1") || bankOld.getE02IBSFL5().equals("2"))) out.print("selected"); %>> </option>        
	    	<option value="1" <%if (bankOld.getE02IBSFL5().equals("1")) out.print("selected");%>>Por Tramos</option> 
	 	    <option value="2" <%if (bankOld.getE02IBSFL5().equals("2")) out.print("selected");%>>Tasa Actual</option> 
		  </select> 
	  </td>
	</tr>	
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Tasa Máxima  Permitida :</div>
		</td>
		<td nowrap width="25%">
           <eibsinput:text name="bankOld" property="E02CNTMPI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
 	    </td>
	</tr>
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Tasa Máxima Permitida Interes de Mora :</div>
		</td>
		<td nowrap width="25%">
           <eibsinput:text name="bankOld" property="E02CNTMXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
 	    </td>
	</tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Base de Cálculo Tasa Efectiva :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTPGP">
			<option value=" "
				<%if (!(bankOld.getE02CNTPGP().equals("360")
	                 || bankOld.getE02CNTPGP().equals("365")))	 
	             out.print("selected");%>>
			</option>
			<option value="360" <%if (bankOld.getE02CNTPGP().equals("360")) out.print("selected");%>> 360</option>
			<option value="365" <%if (bankOld.getE02CNTPGP().equals("365")) out.print("selected");%>> 365</option>
		</select>	
		</td>
	</tr>	
	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Tipo Provisión :</div>
		</td>
		<td nowrap width="25%">
		<select name="E02CNTDEC">
			<option value=" "
				<%if (!(bankOld.getE02CNTDEC().equals("1")
	                 || bankOld.getE02CNTDEC().equals("2")
					 || bankOld.getE02CNTDEC().equals("3")
					 || bankOld.getE02CNTDEC().equals("4")
					 ))	 
	             out.print("selected");%>>
			</option>
			<option value="1" <%if (bankOld.getE02CNTDEC().equals("1")) out.print("selected");%>> Modelo Referencia Estandar IBS</option>
			<option value="2" <%if (bankOld.getE02CNTDEC().equals("2")) out.print("selected");%>> Modelo Referencia Colombia Mensual</option>
			<option value="3" <%if (bankOld.getE02CNTDEC().equals("3")) out.print("selected");%>> Modelo Referencia Colombia Diaria</option>
			<option value="4" <%if (bankOld.getE02CNTDEC().equals("4")) out.print("selected");%>> Modelo Referencia Honduras CIC</option>
		</select>	
		</td>
	</tr>		
</table>


<h4>Eliminacion de registros No Aprobados en los Archivos de Trabajo</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Borrar registros No aprobados de Clientes :</div>
		</td>
    	<td nowrap width="25%">
    		<input type="text" class="txtright" name="E02IBSDCU" size="3" maxlength="2" value="<%=bankOld.getE02IBSDCU().trim()%>" onKeyPress="enterInteger(event)">  
    	</td>
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Borrar registros No aprobados de cuentas de Detalle :</div>
		</td>
    	<td nowrap width="25%">
    		<input type="text" class="txtright" name="E02IBSDAC" size="3" maxlength="2" value="<%=bankOld.getE02IBSDAC().trim()%>" onKeyPress="enterInteger(event)">  
    	</td>
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Borrar registros No aprobados de cuentas Modulo de Negocios :</div>
		</td>
    	<td nowrap width="25%">
    		<input type="text" class="txtright" name="E02IBSDDL" size="3" maxlength="2" value="<%=bankOld.getE02IBSDDL().trim()%>" onKeyPress="enterInteger(event)">  
    	</td>
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Borrar registros No aprobados de cuentas Cartas de Credito :</div>
		</td>
    	<td nowrap width="25%">
    		<input type="text" class="txtright" name="E02IBSDLC" size="3" maxlength="2" value="<%=bankOld.getE02IBSDLC().trim()%>" onKeyPress="enterInteger(event)">  
    	</td>
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Borrar registros No aprobados de cuentas Cobranzas :</div>
		</td>
    	<td nowrap width="25%">
    		<input type="text" class="txtright" name="E02IBSDDC" size="3" maxlength="2" value="<%=bankOld.getE02IBSDDC().trim()%>" onKeyPress="enterInteger(event)">  
    	</td>
	</tr>

    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">No. Dias para Borrar registros No aprobados de cuentas otros Modulos :</div>
		</td>
    	<td nowrap width="25%">
    		<input type="text" class="txtright" name="E02IBSDOT" size="3" maxlength="2" value="<%=bankOld.getE02IBSDOT().trim()%>" onKeyPress="enterInteger(event)">  
    	</td>
	</tr>


</table>

<h4>Procesos Dirección del Tesoro Nacional (DTN)</h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>
		<td nowrap width="25%">
		<div align="left">Traslados</div>
		</td>
    	<td nowrap width="25%">
		<div align="left">Reintegros</div>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Corte Primer Trimestre :</div>
		</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLTY1" fn_month="E02CNLTM1" fn_day="E02CNLTD1"/>  
    	</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLRY1" fn_month="E02CNLRM1" fn_day="E02CNLRD1"/>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Corte Segundo Trimestre :</div>
		</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLTY2" fn_month="E02CNLTM2" fn_day="E02CNLTD2"/>  
    	</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLRY2" fn_month="E02CNLRM2" fn_day="E02CNLRD2"/>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Corte Tercer Trimestre :</div>
		</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLTY3" fn_month="E02CNLTM3" fn_day="E02CNLTD3"/>  
    	</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLRY3" fn_month="E02CNLRM3" fn_day="E02CNLRD3"/>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Corte Cuarto Trimestre :</div>
		</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLTY4" fn_month="E02CNLTM4" fn_day="E02CNLTD4"/>  
    	</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLRY4" fn_month="E02CNLRM4" fn_day="E02CNLRD4"/>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>

	 
</table>

<h4>Procesos ICETEX </h4>
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>
		<td nowrap width="25%">
		<div align="left">Traslados</div>
		</td>
    	<td nowrap width="25%">
		<div align="left">Reintegros</div>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Corte Primer Trimestre :</div>
		</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLSY1" fn_month="E02CNLSM1" fn_day="E02CNLSD1"/>  
    	</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLIY1" fn_month="E02CNLIM1" fn_day="E02CNLID1"/>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Corte Segundo Trimestre :</div>
		</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLSY2" fn_month="E02CNLSM2" fn_day="E02CNLSD2"/>  
    	</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLIY2" fn_month="E02CNLIM2" fn_day="E02CNLID2"/>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>

     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Corte Tercer Trimestre :</div>
		</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLSY3" fn_month="E02CNLSM3" fn_day="E02CNLSD3"/>  
    	</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLIY3" fn_month="E02CNLIM3" fn_day="E02CNLID3"/>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
		<td nowrap width="25%">
		<div align="right">Corte Cuarto Trimestre :</div>
		</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLSY4" fn_month="E02CNLSM4" fn_day="E02CNLSD4"/>  
    	</td>
    	<td nowrap width="25%">
    	    <eibsinput:date name="bankOld" fn_year="E02CNLIY4" fn_month="E02CNLIM4" fn_day="E02CNLID4"/>  
    	</td>
		<td nowrap width="25%">
		<div align="right"> </div>
		</td>

	</tr>

	 
</table>


<% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H02WK2" value="A" <% if(bankOld.getH02WK2().equals("A")){ out.print("checked");} %> >Aceptar con Aviso</h4>
<% } %> 

<div align="center">
	<input class="EIBSBTN" type="button" value="Regressar" onClick="goBack()">
	<input class="EIBSBTN" type=submit name="Submit" value="Enviar">
</div>

<script type="text/javascript">
	function goBack(){
		document.forms[0].action = "<%=request.getContextPath()%>/pages/s/ESD0005_bank_setup_basic_maint.jsp";
		document.forms[0].submit();
	}

</script>
</form>
</body>
</html>

