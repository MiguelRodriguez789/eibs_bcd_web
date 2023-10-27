<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<%@page import="com.datapro.constants.Entities"%>
<html>
<head>
<title>Evaluación de Convenio</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="cnvObj" class="datapro.eibs.beans.ECO001003Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

//  Process according with user selection
 function goAction(op) {
	
   	switch (op){
	//Cancel
	case 1:  {
 		document.forms[0].SCREEN.value = "101";
       	break;
		}
	}
	document.forms[0].submit();
 }
 
 function showAccount() {
	var opt= document.forms[0].E03COSAFP.value;   
	if ( opt == 1 ){
		getElement("account").style.display="";
		getElement("accountotherbank").style.display="none";
	}else if ( opt == 3 ){
		getElement("accountotherbank").style.display="";
		getElement("account").style.display="none";
	} else {
		getElement("account").style.display="none";
		getElement("accountotherbank").style.display="none";
	}
 }
 
 
 function showAccountpago() {
	var optp= document.forms[0].E03COSPFP.value;   
	if ( optp == 1 ){
		getElement("accountpago").style.display="";
		getElement("accountpagoTitle").style.display="";
		getElement("accountpagootherbank").style.display="none";
		getElement("accountpagootherbankTitle").style.display="none";
	}else if ( optp == 2 ){
		getElement("accountpagootherbank").style.display="";
		getElement("accountpagootherbankTitle").style.display="";
		getElement("accountpago").style.display="none";
		getElement("accountpagoTitle").style.display="none";
	} else {
		getElement("accountpago").style.display="none";
		getElement("accountpagoTitle").style.display="none";
		getElement("accountpagootherbank").style.display="none";
		getElement("accountpagootherbankTitle").style.display="none";

	}
 }
 
  function showRates() {
	var opt=  getElement("E03COSRBS").value;   
	if ( opt == 1 ){
		getElement("rates").style.display="none";
	} else {
		getElement("rates").style.display="";
	}
 }
 
 </script>
</head>

<%
	boolean readOnly=false;
	boolean maintenance=false;
%> 
          
<%
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}
%>
<body>
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
	if (!userPO.getPurpose().equals("NEW")) {
		maintenance = true;
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	}
%>

<h3 align="center">
<%if (readOnly){ %>
	CONSULTA DE
<%} %>
EVALUACION DE CONVENIO <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="convenant_evaluation.jsp, ECO0010"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="303">
  <input type=HIDDEN name="E03COSBNK"  value="<%= cnvObj.getE03COSBNK().trim()%>">
 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
  		  <tr id="trdark"> 
             <td nowrap width="10%" align="right"> Empleador: 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E03COSECU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">Identificación:  
             </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E03EMPIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Nombre: 
               </td>
             <td nowrap width="50%"align="left">
	  			<eibsinput:text name="cnvObj" property="E03EMPNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
             </td>
         </tr>
          <tr id="trdark">
             <td nowrap width="10%" align="right"> Solicitud Nro: 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="cnvObj" property="E03COSNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right">  
             </td>
             <td nowrap width="10%" align="left">
             </td>
             <td nowrap width="10%" align="right"> 
               </td>
             <td nowrap width="50%"align="left">
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
<H4>Datos Cliente Convenio</H4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="15%" > 
              <div align="right">Cliente Convenio :</div>
            </td>
            <td width="35%" > 
				<eibsinput:text name="cnvObj" property="E03COSCCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"  readonly="true" />
          </td>
            <td width="15%"> 
              <div align="right">Nombre :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="cnvObj" property="E03CONNME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
            </td>
          </tr>

          <tr id="tclear"> 
            <td width="15%"> 
              <div align="right">Identificación :</div>
            </td>
            <td width="35%"> 
	  			<eibsinput:text name="cnvObj" property="E03CONIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" readonly="true"/>
            </td>
            <td width="15%"> 
            </td>
            <td width="50%" align="left"> 
	      </td>
          </tr>
  

        </table>
      </td>
    </tr>
  </table>  
 
		<%if(currUser.getE01INT().equals("18")){%> 
  <h4>Información para Evaluación </h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td width="15%" valign="middle"> 
              <div align="right">Empresa :</div>
            </td>
            <td width="35%" > 
			  <input type="checkbox" name="E03COSEE1" value="Y" <%if (cnvObj.getE03COSEE1().equals("Y")){out.print(" checked");}; %>/>Dicom <br>
  			  <input type="checkbox" name="E03COSEE2" value="Y" <%if (cnvObj.getE03COSEE2().equals("Y")){out.print(" checked");}; %>/>Deuda SBIF<br>
  			  <input type="checkbox" name="E03COSEE3" value="Y" <%if (cnvObj.getE03COSEE3().equals("Y")){out.print(" checked");}; %>/>Identificacion<br>
          </td>
            <td width="15%"> 
              <div align="right">Representante Legal :</div>
            </td>
            <td width="35%"> 
			  <input type="checkbox" name="E03COSRE1" value="Y" <%if (cnvObj.getE03COSRE1().equals("Y")){out.print(" checked");}; %>/>Dicom &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="E03COSRE4" value="Y"<%if (cnvObj.getE03COSRE4().equals("Y")){out.print(" checked");}; %>/>Documento de Designación Rep. Leg.<br>
  			  <input type="checkbox" name="E03COSRE3" value="Y" <%if (cnvObj.getE03COSRE3().equals("Y")){out.print(" checked");}; %>/>Deuda SBIF &nbsp;&nbsp;<input type="checkbox" name="E03COSRE5" value="Y" <%if (cnvObj.getE03COSRE5().equals("Y")){out.print(" checked");}; %>/>Ultima declaracion de Renta en Impuestos<br>
  			  <input type="checkbox" name="E03COSRE2" value="Y"<%if (cnvObj.getE03COSRE2().equals("Y")){out.print(" checked");}; %>/>Identificacion &nbsp;<input type="checkbox" name="E03COSRE6" value="Y"<%if (cnvObj.getE03COSRE6().equals("Y")){out.print(" checked");}; %>/>Liquidacion Sueldo<br>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="15%"> 
              <div align="right">Empresas Privadas:</div>
            </td>
            <td width="35%"> 
			  <input type="checkbox" name="E03COSBL1" value="Y" <%if (cnvObj.getE03COSBL1().equals("Y")){out.print(" checked");}; %>/>Balance General&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="E03COSBL2" value="Y" <%if (cnvObj.getE03COSBL2().equals("Y")){out.print(" checked");}; %>/>Flujo de Caja<br>
  			  <input type="checkbox" name="E03COSBL3" value="Y" <%if (cnvObj.getE03COSBL3().equals("Y")){out.print(" checked");}; %>/>Declaración de Impuestos &nbsp;&nbsp;<input type="checkbox" name="E03COSBL4" value="Y" <%if (cnvObj.getE03COSBL4().equals("Y")){out.print(" checked");}; %>/>Declaración IVA<br>
  			  <input type="checkbox" name="E03COSBL5" value="Y" <%if (cnvObj.getE03COSBL5().equals("Y")){out.print(" checked");}; %>/>Despidos Ultimos 2 años<br>
            </td>
            <td width="15%" > 
            </td>
            <td width="35%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
          <%}%>
  
  <h4>Operación Convenio </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="20%" > 
              <div align="right">Cobertura :</div>
            </td>
            <td width="10%" > 
	  			<select name="E03COSCOB">
                  <option value="1" <% if (cnvObj.getE03COSCOB().equals("1")) out.print("selected"); %>>Internacional</option>
                  <option value="2" <% if (cnvObj.getE03COSCOB().equals("2")) out.print("selected"); %>>Nacional</option>                   
                  <option value="3" <% if (cnvObj.getE03COSCOB().equals("3")) out.print("selected"); %>>Regional</option>
                  <option value="4" <% if (cnvObj.getE03COSCOB().equals("4")) out.print("selected"); %>>Provincial</option>
                  <option value="5" <% if (cnvObj.getE03COSCOB().equals("5")) out.print("selected"); %>>Comunal</option>
                </select>
         	</td>
            <td width="20%"> 
              <div align="right">Habilitados :</div>
            </td>
            <td width="10%"> 
				<select name="E03COSABL">
                  <option value="1" <% if (cnvObj.getE03COSABL().equals("1")) out.print("selected"); %>>Solo Asociados</option>
                  <option value="2" <% if (cnvObj.getE03COSABL().equals("2")) out.print("selected"); %>>Todos</option>                                     
                </select>            
            </td>
	         <td width="40%" > 
             </td>
          </tr>
          <tr id="trclear"> 
	         <td width="20%" > 
             </td>
	         <td width="10%" > 
            	<div align="right"><b>Sel.</b></div>
             </td>
            <td width="20%" > 
            	<div align="center"><b>Productos</b></div>
            </td> 
            <td width="10%" > 
            	<div align="center"><b>Alias</b></div>
            </td>              
	         <td width="40%" > 
             </td>
   		  </tr>
          <tr id="trdark"> 
	         <td width="20%" > 
             </td>
           	<td width="10%" align="right"> 
        		<input type="checkbox" name="E03COSPAH" value="Y" <%if (cnvObj.getE03COSPAH().equals("Y")){out.print(" checked");}; %>/>
	        </td>  
	        <td width="20%" align="left"> 
          		Cuenta de Ahorros
	        </td>  
            <td width="10%" align="center"> 
				<input type="text"  name="E03COSAAH" size="7" maxlength="6" value="<%= cnvObj.getE03COSAAH()%>">
            </td>
	         <td width="40%" > 
             </td>
          </tr> 

          <tr id="trclear"> 
	         <td width="20%" > 
             </td>
          	<td width="10%" align="right">
          		<input type="checkbox" name="E03COSPCC" value="Y" <%if (cnvObj.getE03COSPCC().equals("Y")){out.print(" checked");}; %>/>             
	        </td> 
	        <td width="20%" align="left"> 
          		Cuenta Vista
	        </td>  
            <td width="10%"  align="center"> 
				<input type="text"  name="E03COSACC" size="7" maxlength="6" value="<%= cnvObj.getE03COSACC()%>">
            </td>      
	         <td width="40%" > 
             </td>
          </tr> 
          <tr id="trdark"> 
	         <td width="20%" > 
             </td>
          	<td width="10%" align="right"> 
          		<input type="checkbox" name="E03COSPAV" value="Y" <%if (cnvObj.getE03COSPAV().equals("Y")){out.print(" checked");}; %>/>               			    				    				    				    				  
	        </td> 
	        <td width="20%" align="left"> 
          		Ahorros Vivienda
	        </td>  
            <td width="10%"  align="center"> 
				<input type="text"  name="E03COSAAV" size="7" maxlength="6" value="<%= cnvObj.getE03COSAAV()%>">
            </td>   
	         <td width="40%" > 
             </td>
          </tr>   
          <tr id="trclear"> 
	         <td width="20%" > 
             </td>
          	<td width="10%" align="right"> 
          		<input type="checkbox" name="E03COSPPR" value="Y" <%if (cnvObj.getE03COSPPR().equals("Y")){out.print(" checked");}; %>/>             
	        </td> 
	        <td width="20%" align="left"> 
          		Créditos
	        </td>  
            <td width="10%"  align="center"> 
				<input type="text"  name="E03COSAPR" size="7" maxlength="6" value="<%= cnvObj.getE03COSAPR()%>">
            </td>      
	         <td width="40%" > 
             </td>
          </tr> 
          <tr id="trdark"> 
	         <td width="20%" > 
             </td>
          	<td width="10%" align="right"> 
          		<input type="checkbox" name="E03COSPCP" value="Y" <%if (cnvObj.getE03COSPCP().equals("Y")){out.print(" checked");}; %>/>               
	        </td> 
	        <td width="20%" align="left"> 
          		Cuota Participación
	        </td>  
            <td width="10%"  align="center"> 
				<input type="text"  name="E03COSACP" size="7" maxlength="6" value="<%= cnvObj.getE03COSACP()%>">
            </td>      
	         <td width="40%" > 
             </td>
          </tr> 
          <tr id="trclear"> 
	         <td width="20%" > 
             </td>
          	<td width="10%" align="right"> 
          		<input type="checkbox" name="E03COSPHI" value="Y" <%if (cnvObj.getE03COSPHI().equals("Y")){out.print(" checked");}; %>/>               
	        </td>  
	        <td width="20%" align="left"> 
          		Hipotecarios
	        </td>  
            <td width="10%"  align="center"> 
				<input type="text"  name="E03COSAHI" size="7" maxlength="6" value="<%= cnvObj.getE03COSAHI()%>">
            </td>     
	         <td width="40%" > 
             </td>
          </tr>    
          <tr id="trdark"> 
	         <td width="20%" > 
             </td>
            <td width="10%" align="right"> 
            	<input type="checkbox" name="E03COSPTC" value="Y" <%if (cnvObj.getE03COSPTC().equals("Y")){out.print(" checked");}; %>/>                
	        </td> 
	        <td width="20%" align="left"> 
          		Tarjeta Crédito
	        </td>  
            <td width="10%"  align="center"> 
				<input type="text"  name="E03COSATC" size="7" maxlength="6" value="<%= cnvObj.getE03COSATC()%>">
            </td>      
	         <td width="40%" > 
             </td>
          </tr> 
          <tr id="trclear"> 
	         <td width="20%" > 
             </td>
          	<td width="10%" align="right"> 
          		<input type="checkbox" name="E03COSPSG" value="Y" <%if (cnvObj.getE03COSPSG().equals("Y")){out.print(" checked");}; %>/>               
	        </td> 
	        <td width="20%" align="left"> 
          		 Seguros
	        </td>	        
            <td width="10%"  align="center"> 
				<input type="text"  name="E03COSASG" size="7" maxlength="6" value="<%= cnvObj.getE03COSASG()%>">
            </td>      
	         <td width="40%" > 
             </td>
          </tr>         
        </table>
      </td>
    </tr>
  </table>

  
<H4>Aportes al Empleador</H4>
  <table  class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

         <tr id="trdark"> 
           <td width="10%" > 
           </td>
           <td width="20%" > 
              <div align="Center">Factor</div>
           </td>
           <td width="10%" > 
              <div align="Center">Aporte</div>
           </td>
           <td width="20%" > 
              <div align="Center">Base</div>
           </td>
           <td width="10%" > 
              <div align="left">Moneda</div>
           </td>
           <td width="20%" > 
              <div align="Center">Monto</div>
           </td>
           <td width="10%" > 
           </td>
          </tr>
 
          <tr id="trclear"> 
           <td width="10%" > 
           </td>
            <td width="20%" > 
                 <select name="E03COSAF1" >
                    <option value=" " <% if ((cnvObj.getE03COSAF1().equals("1")||cnvObj.getE03COSAF1().equals("2")||cnvObj.getE03COSAF1().equals("3"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE03COSAF1().equals("1")) out.print("selected"); %>>% Monto Pagado</option>
                    <option value="2" <% if (cnvObj.getE03COSAF1().equals("2")) out.print("selected"); %>>Valor Fijo Transaccion</option>                   
                    <option value="3" <% if (cnvObj.getE03COSAF1().equals("3")) out.print("selected"); %>>Valor Fijo Por Planilla</option>                   
                  </select>
           </td>
           <td width="10%" > 
              <div align="Center">1</div>
           </td>
           <td width="20%" > 
                 <select name="E03COSAB1" >
                    <option value=" " <% if (!(cnvObj.getE03COSAB1().equals("1")||cnvObj.getE03COSAB1().equals("2")||cnvObj.getE03COSAB1().equals("3")
                  							 ||cnvObj.getE03COSAB1().equals("4")||cnvObj.getE03COSAB1().equals("5")||cnvObj.getE03COSAB1().equals("6")
                  							 ||cnvObj.getE03COSAB1().equals("7")||cnvObj.getE03COSAB1().equals("9")||cnvObj.getE03COSAB1().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE03COSAB1().equals("1")) out.print("selected"); %>>Cuenta Ahorros</option>
                    <option value="2" <% if (cnvObj.getE03COSAB1().equals("2")) out.print("selected"); %>>Ahorro Vivienda</option>                   
                    <option value="3" <% if (cnvObj.getE03COSAB1().equals("3")) out.print("selected"); %>>Prestamos</option>                   
                    <option value="4" <% if (cnvObj.getE03COSAB1().equals("4")) out.print("selected"); %>>Cuota Participacion</option>                   
                    <option value="5" <% if (cnvObj.getE03COSAB1().equals("5")) out.print("selected"); %>>Creditos Hipotecarios</option>                   
                    <option value="6" <% if (cnvObj.getE03COSAB1().equals("6")) out.print("selected"); %>>Tarjeta Credito</option>                   
                    <option value="7" <% if (cnvObj.getE03COSAB1().equals("7")) out.print("selected"); %>>Seguros</option>                   
                    <option value="9" <% if (cnvObj.getE03COSAB1().equals("9")) out.print("selected"); %>>Todos los Productos</option>                   
                  </select>
            </td>
           <td width="10%" > 
 	 			<eibsinput:help name="cnvObj" property="E03COSAM1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E03COSAM1" fn_param_two="document.forms[0].E03COSBNK.value"  required="false" />
           </td>
           <td width="20%" > 
 		        <eibsinput:text name="cnvObj" property="E03COSAR1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
           </td>
           <td width="10%" > 
           </td>
          </tr>
 
          <tr id="trdark"> 
           <td width="10%" > 
           </td>
           <td width="20%" > 
           </td>
           <td width="10%" > 
              <div align="Center">2</div>
           </td>
           <td width="20%" > 
                 <select name="E03COSAB2" >
                    <option value=" " <% if (!(cnvObj.getE03COSAB2().equals("1")||cnvObj.getE03COSAB2().equals("2")||cnvObj.getE03COSAB2().equals("3")
                  							 ||cnvObj.getE03COSAB2().equals("4")||cnvObj.getE03COSAB2().equals("5")||cnvObj.getE03COSAB2().equals("6")
                  							 ||cnvObj.getE03COSAB2().equals("7")||cnvObj.getE03COSAB2().equals("8")||cnvObj.getE03COSAB2().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE03COSAB2().equals("1")) out.print("selected"); %>>Cuenta Ahorros</option>
                    <option value="2" <% if (cnvObj.getE03COSAB2().equals("2")) out.print("selected"); %>>Ahorro Vivienda</option>                   
                    <option value="3" <% if (cnvObj.getE03COSAB2().equals("3")) out.print("selected"); %>>Prestamos</option>                   
                    <option value="4" <% if (cnvObj.getE03COSAB2().equals("4")) out.print("selected"); %>>Cuota Participacion</option>                   
                    <option value="5" <% if (cnvObj.getE03COSAB2().equals("5")) out.print("selected"); %>>Creditos Hipotecarios</option>                   
                    <option value="6" <% if (cnvObj.getE03COSAB2().equals("6")) out.print("selected"); %>>Tarjeta Credito</option>                   
                    <option value="7" <% if (cnvObj.getE03COSAB2().equals("7")) out.print("selected"); %>>Seguros</option>                   
                    <option value="8" <% if (cnvObj.getE03COSAB2().equals("8")) out.print("selected"); %>>Los Restantes</option>                   
                  </select>
            </td>
            <td width="10%" > 
 	 			<eibsinput:help name="cnvObj" property="E03COSAM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E03COSAM2" fn_param_two="document.forms[0].E03COSBNK.value"  required="false" />
           </td>
           <td width="20%" > 
 		        <eibsinput:text name="cnvObj" property="E03COSAR2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
           </td>
           <td width="10%" > 
           </td>
          </tr>
 
          <tr id="trclear"> 
           <td width="10%" > 
           </td>
           <td width="20%" > 
           </td>
           <td width="10%" > 
              <div align="Center">3</div>
           </td>
           <td width="20%" > 
                 <select name="E03COSAB3" >
                    <option value=" " <% if (!(cnvObj.getE03COSAB3().equals("1")||cnvObj.getE03COSAB3().equals("2")||cnvObj.getE03COSAB3().equals("3")
                  							 ||cnvObj.getE03COSAB3().equals("4")||cnvObj.getE03COSAB3().equals("5")||cnvObj.getE03COSAB3().equals("6")
                  							 ||cnvObj.getE03COSAB3().equals("7")||cnvObj.getE03COSAB3().equals("8")||cnvObj.getE03COSAB3().equals("9"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE03COSAB3().equals("1")) out.print("selected"); %>>Cuenta Ahorros</option>
                    <option value="2" <% if (cnvObj.getE03COSAB3().equals("2")) out.print("selected"); %>>Ahorro Vivienda</option>                   
                    <option value="3" <% if (cnvObj.getE03COSAB3().equals("3")) out.print("selected"); %>>Prestamos</option>                   
                    <option value="4" <% if (cnvObj.getE03COSAB3().equals("4")) out.print("selected"); %>>Cuota Participacion</option>                   
                    <option value="5" <% if (cnvObj.getE03COSAB3().equals("5")) out.print("selected"); %>>Creditos Hipotecarios</option>                   
                    <option value="6" <% if (cnvObj.getE03COSAB3().equals("6")) out.print("selected"); %>>Tarjeta Credito</option>                   
                    <option value="7" <% if (cnvObj.getE03COSAB3().equals("7")) out.print("selected"); %>>Seguros</option>                   
                    <option value="8" <% if (cnvObj.getE03COSAB3().equals("8")) out.print("selected"); %>>Los Restantes</option>                   
                  </select>
            </td>
           <td width="10%" > 
 	 			<eibsinput:help name="cnvObj" property="E03COSAM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E03COSAM3" fn_param_two="document.forms[0].E03COSBNK.value"  required="false" />
           </td>
           <td width="20%" > 
 		        <eibsinput:text name="cnvObj" property="E03COSAR3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
           </td>
           <td width="10%" > 
           </td>
          </tr>
 
 
         <tr id="trdark"> 
           <td width="10%" > 
           </td>
           <td width="20%" > 
           </td>
           <td width="10%" > 
               <div align="right">Forma de Pago :</div>
           </td>
           <td width="20%" > 
	  			<select name="E03COSAFP" onchange="javascript:showAccount();">
                    <option value=" " <% if (!(cnvObj.getE03COSAFP().equals("1")||cnvObj.getE03COSAFP().equals("2")||cnvObj.getE03COSAFP().equals("3"))) out.print("selected"); %>></option>
                    <option value="1" <% if (cnvObj.getE03COSAFP().equals("1")) out.print("selected"); %>>Cuenta Cliente</option>
                    <option value="2" <% if (cnvObj.getE03COSAFP().equals("2")) out.print("selected"); %>>Cheque</option>                   
                    <option value="3" <% if (cnvObj.getE03COSAFP().equals("3")) out.print("selected"); %>>Cta Otro Banco</option>                   
                  </select>
           </td>
           <td  width="30%" colspan="2"  > 
              <div id="account" align="left">Numero Cuenta :
	 	 			<eibsinput:help name="cnvObj" property="E03COSAAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" fn_param_one="E03COSAAC" fn_param_two="document.forms[0].E03COSBNK.value" fn_param_three="RT" required="false" />
			  </div>
              <div id="accountotherbank" align="left">Cuenta Otro Banco :
	  			<eibsinput:help name="cnvObj" property="E03COSAOB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ENTITY %>" fn_param_one="E03COSAOB"  fn_param_four="document.forms[0].E03COSCCU.value" fn_param_five="<%=Entities.ENTITY_TYPE_BANK_REFERENCES %>" fn_param_six="C" required="false" readonly="<%=readOnly%>"/>	  			
			  </div>
           </td>
           <td width="10%" > 
           </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>  
   
  <h4>Planilla y Descuento </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="15%"> 
              <div align="right">Maximo Cuotas Participacion :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="cnvObj" property="E03COSMXA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5"/>
            </td>
            <td width="15%"> 
              <div align="right">Envío :</div>
            </td>
            <td width="35%"> 
	  			<select name="E03COSPEV">
                	<option value="1" <% if (cnvObj.getE03COSPEV().equals("1")) out.print("selected"); %>>Empleador</option>
                	<option value="2" <% if (cnvObj.getE03COSPEV().equals("2")) out.print("selected"); %>>Oficina</option>         
                   	<option value="3" <% if (cnvObj.getE03COSPEV().equals("3")) out.print("selected"); %>>Ambos</option>         
          		</select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="15%"> 
              <div align="right">Medio de Envio :</div>
            </td>
            <td width="35%"> 
	  			<select name="E03COSMEV">
                <option value="1" <% if (cnvObj.getE03COSMEV().equals("1")) out.print("selected"); %>>Magnetico</option>
                <option value="2" <% if (cnvObj.getE03COSMEV().equals("2")) out.print("selected"); %>>Impreso</option>                   
                <option value="3" <% if (cnvObj.getE03COSMEV().equals("3")) out.print("selected"); %>>Internet</option>              				
          	   </select>
            </td>
            <td width="15%" > 
              <div align="right">Código Formato :</div>
            </td>
            <td width="35%" > 
              <eibsinput:text name="cnvObj" property="E03COSCFM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CODE %>" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td width="15%"> 
              <div align="right">Número de Copias :</div>
            </td>
            <td width="35%"> 
                <eibsinput:text property="E03COSNCO" name="cnvObj" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2" readonly="<%=readOnly%>"/>
            </td>
            <td width="15%" > 
            </td>
            <td width="35%" > 
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="15%"> 
              <div align="right">Rol de Pago :</div>
            </td>
            <td width="35%"> 
	  			<select name="E03COSROL">
                	<option value="1" <% if (cnvObj.getE03COSROL().equals("1")) out.print("selected"); %>>RUT</option>
                	<option value="2" <% if (cnvObj.getE03COSROL().equals("2")) out.print("selected"); %>>Otro</option>         
          		</select>
            </td>
            <td width="15%" > 
              <div align="right">Cuenta Administracion :</div>
            </td>
            <td width="35%" > 
 	 			<eibsinput:help name="cnvObj" property="E03COSADA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" fn_param_one="E03COSADA" fn_param_two="document.forms[0].E03COSBNK.value" fn_param_three="RT" required="false" />
	        </td>
          </tr>
          <tr id="trdark"> 
            <td width="15%" > 
              <div align="right">Forma de Pago Planilla :</div>
            </td>
            <td width="35%" > 
 		       <select name="E03COSPFP" onchange="javascript:showAccountpago();">
                <option value="1" <% if (cnvObj.getE03COSPFP().equals("1")) out.print("selected"); %>>Cuenta Cliente</option>
                <option value="2" <% if (cnvObj.getE03COSPFP().equals("2")) out.print("selected"); %>>Cuenta Contable</option>                   
          	   </select>
	        </td>
            <td width="15%" > 
              <div id="accountpagoTitle" align="right"> Numero Cuenta : </div>
              <div id="accountpagootherbankTitle" align="right">Cuenta Contable :</div>
		    </td>	        
           <td  width="34%"> 
              <div id="accountpago" align="left">
	 	 			<eibsinput:help name="cnvObj" property="E03COSPAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" fn_param_one="E03COSPAC" fn_param_two="document.forms[0].E03COSBNK.value" fn_param_three="RT" fn_param_five="document.forms[0].E03COSCCU.value" required="false" />
			  </div>
              <div id="accountpagootherbank" align="left"> 
 		        <eibsinput:text name="cnvObj" property="E03COSPBK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
 		        <eibsinput:help name="cnvObj" property="E03COSPBR" fn_param_one="E03COSPBR" fn_param_two="document.forms[0].E03COSPBK.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" />
 		        <eibsinput:help name="cnvObj" property="E03COSPCY" fn_param_one="E03COSPCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" />
 		        <eibsinput:help name="cnvObj" property="E03COSPGL" fn_param_one="E03COSPGL" fn_param_two="document.forms[0].E03COSPBK.value" fn_param_three="document.forms[0].E03COSPCY.value" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" />
			</div>
           </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>

		<%if(currUser.getE01INT().equals("18")){%> 
  <h4>Renta </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="15%" > 
              <div align="right">Número de Prioridad:</div>
            </td>
            <td width="35%" > 
	  			<eibsinput:text name="cnvObj" property="E03COSNPR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" readonly="<%=readOnly%>"/>
          </td>
            <td width="15%"> 
            </td>
            <td width="35%"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="15%" > 
              <div align="right">% Descuento :</div>
            </td>
            <td width="35%" > 
              	<eibsinput:text name="cnvObj" property="E03COSRBS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="<%= readOnly %>"/>
          </td>
            <td width="15%"> 
              <div align="right">Base de cálculo :</div>
            </td>
            <td width="35%"> 
	  			<select name="E03COSCBS">
                	<option value="1" <% if (cnvObj.getE03COSCBS().equals("1")) out.print("selected"); %>>Total Haberes</option>
                	<option value="2" <% if (cnvObj.getE03COSCBS().equals("2")) out.print("selected"); %>>Liquido</option>                                                				
					<option value="3" <% if (cnvObj.getE03COSCBS().equals("3")) out.print("selected"); %>>Imponible</option>                                                				
          	   </select>
            </td>
          </tr>         

        </table>
      </td>
    </tr>
  </table>
    
  <h4>Otorgar Creditos </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="15%" > 
              <div align="right">Tasa Creditos :</div>
            </td>
          <td width="35%" > 
              <div >
              	<eibsinput:text name="cnvObj" property="E03COSRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="<%= readOnly %>"/>
           	  </div>
            </td>
            <td width="15%" > 
              <div align="right">Factor Aplicacion :</div>
            </td>
            <td width="35%" > 
              	<select name="E03COSRTF">
                	<option value="S" <% if (cnvObj.getE03COSRTF().equals("S")) out.print("selected"); %>>Resta a la tasa del producto</option>
                	<option value="R" <% if (cnvObj.getE03COSRTF().equals("R")) out.print("selected"); %>>Reemplaza la tasa del crédito</option>                                                				
					<option value="%" <% if (cnvObj.getE03COSRTF().equals("%")) out.print("selected"); %>>Porcentaje de la tasa del producto</option>                                                				
          	   </select>
          </td>
          </tr>

          <tr id="trclear"> 
            <td width="15%"> 
              <div align="right">Minimo Cuotas :</div>
            </td>
            <td width="35%"> 
 		        <eibsinput:text name="cnvObj" property="E03COSMIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"/>
            </td>
            <td width="15%" > 
              <div align="right">Maximo Cuotas :</div>
            </td>
            <td width="35%" > 
 		        <eibsinput:text name="cnvObj" property="E03COSMXC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3"/>
          </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Descuentos</h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<% 
        	for (int i = 1; i<=9 ; i++){
        	%>
        	<tr id="trdark"> 
	            <td width="50%" > 
	              <div align="right">Descuento número <%=i%>:</div>
	            </td>
	            <td width="50%">             
	            	<input type="text" name="<%="E03COSDS"+i%>" size="3" maxlength="2" value="<%= cnvObj.getField("E03COSDS"+i)%>" <% if (readOnly)out.print(" readonly"); %>> 
					<a href="javascript:GetCodeDescCNOFC('<%="E03COSDS"+i%>','<%="D03COSDS"+i%>' ,'C3')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
					<input type="text" name="<%="D03COSDS"+i%>" size="35" maxlength="30" value="<%= cnvObj.getField("D03COSDS"+i)%>" readonly="readonly">              
	          	</td>            
          	</tr>
        	<%
        	}
        	 %>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Rebajas</h4>
    
   <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<% 
        	for (int i = 1; i<=9 ; i++){
        	%>
        	<tr id="trdark"> 
	            <td width="50%" > 
	              <div align="right">Rebaja número <%=i%>:</div>
	            </td>
	            <td width="50%" >             
	            	<input type="text" name="<%="E03COSRB"+i%>" size="3" maxlength="2" value="<%= cnvObj.getField("E03COSRB"+i)%>" <% if (readOnly)out.print(" readonly"); %>> 
					<a href="javascript:GetCodeDescCNOFC('<%="E03COSRB"+i%>','<%="D03COSRB"+i%>' ,'C4')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
					<input type="text" name="<%="D03COSRB"+i%>" size="35" maxlength="30" value="<%= cnvObj.getField("D03COSRB"+i)%>">   
	          	</td>            
          	</tr>
        	<%
        	}
        	 %>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Autorización Empleador </h4>
    
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trdark"> 
            <td width="15%" > 
              <div align="right">Ingreso :</div>
            </td>
            <td width="35%" > 
	  			<input type="checkbox" name="E03COSASL" value="Y" <%if (cnvObj.getE03COSASL().equals("Y")){out.print(" checked");}; %>/>Liquidación Sueldo <br>
  			  	<input type="checkbox" name="E03COSASO" value="Y" <%if (cnvObj.getE03COSASO().equals("Y")){out.print(" checked");}; %>/>Solicitud<br>
  			  	<input type="checkbox" name="E03COSACR" value="Y" <%if (cnvObj.getE03COSACR().equals("Y")){out.print(" checked");}; %>/>Certificado<br>
          	</td>
            <td width="15%"> 
              <div align="right">Crédito :</div>
            </td>
            <td width="35%"> 
	  			<input type="checkbox" name="E03COSPSL" value="Y" <%if (cnvObj.getE03COSPSL().equals("Y")){out.print(" checked");}; %>/>Liquidación Sueldo <br>
  			  	<input type="checkbox" name="E03COSPSO" value="Y" <%if (cnvObj.getE03COSPSO().equals("Y")){out.print(" checked");}; %>/>Solicitud<br>
  			  	<input type="checkbox" name="E03COSPCR" value="Y" <%if (cnvObj.getE03COSPCR().equals("Y")){out.print(" checked");}; %>/>Certificado<br>
            </td>
          </tr>
          <tr id="trclear"> 
            <td width="15%"> 
              <div align="right">Tipo Autorización :</div>
            </td>
            <td width="35%"> 
	  			<input type="checkbox" name="E03COSFRM" value="Y" <%if (cnvObj.getE03COSFRM().equals("Y")){out.print(" checked");}; %>/>Firma Autorizada <br>
  			  	<input type="checkbox" name="E03COSTBR" value="Y" <%if (cnvObj.getE03COSTBR().equals("Y")){out.print(" checked");}; %>/>Timbre Autorizado<br>
  			  	<input type="checkbox" name="C03COSOTH" value="Y" <%if (cnvObj.getC03COSOTH().equals("Y")){out.print(" checked");}; %>/>Otra
  			  	<eibsinput:text name="cnvObj" property="E03COSOTH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="<%=readOnly%>"/>
            </td>
            <td width="15%" > 
            </td>
            <td width="35%" >  		        
	        </td>
          </tr>
         </table>
      </td>
    </tr>
  </table>
           <%}%>
  
  <h4>Observaciones </h4>
    <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td> 
            	<textarea cols="88" rows="5" name="E03COSADS"><%= cnvObj.getE03COSADS().trim()%></textarea>             
            </td>                       
          </tr>          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Firmas </h4>
    
    <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td> 
            	<textarea cols="88" rows="5" name="E03COSEDS"><%= cnvObj.getE03COSEDS().trim()%></textarea>             
            </td>                       
          </tr>          
        </table>
      </td>
    </tr>
  </table>
     <%if  (!readOnly) { %>
       <div align="center"> 
           <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(1);">
       </div>
     <% } else { %>
       <div align="center"> 
           <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(1);">
       </div>     
     <% } %>  
  </form>
  
<script type="text/javascript">
  showAccount();
  showAccountpago();
  showRates();
</script>
</body>
</HTML>
