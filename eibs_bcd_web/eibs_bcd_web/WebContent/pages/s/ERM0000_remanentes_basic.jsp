<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.datapro.constants.Entities"%> 

<html>
<head>
<title>Remanentes</title>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "remanentes" class= "datapro.eibs.beans.ERM000001Message"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">
<%
	// Determina si es solo lectura
	boolean readOnly=false;
	String read="";
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
			read=" readonly ";			
		} else {
			readOnly=false;
		}
	}
%>

function showMandato(){
	
	if( document.forms[0].E01RMMECU.value == "1" ){
				getElement('IDMAN').style.display='block' ;
	} else {
				getElement('IDMAN').style.display='block' ;
	}

}

function origenLogic(value){

    document.getElementById('CODEHELPACC').value='RA'; 
	if(value == "DP"){
		document.getElementById('CODEHELPACC').value='CD';
	}
	 
}

</script>

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

<h3 align="center">Remanentes <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="remanenetes_basic.jsp,ERM0000"></h3>
<hr size="4">

<form  method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSERM0000">
<input type="hidden" name="SCREEN" id="SCREEN" value="400">
<input type="hidden" name="E01RMMACD" id="E01RMMACD" value="<%= remanentes.getField("E01RMMACD").getString().trim()%>">
<input type="hidden" name="E01RMMTYP" id="E01RMMTYP" value="<%= remanentes.getField("E01RMMTYP").getString().trim()%>">
<input type="hidden" name="E01RMMGLN" id="E01RMMGLN" value="<%= remanentes.getField("E01RMMGLN").getString().trim()%>">
<input type="hidden" name="CODEHELPACC" id="CODEHELPACC" value=<%=remanentes.getField("E01RMMCOR").getString().trim().equals("DP")?"CD":"RA"%>>

 <% int row = 0;%>

 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
				<eibsinput:help name="remanentes" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01RMMCUN" 
					fn_param_one="E01RMMCUN" fn_param_two="E01CUSNA1"   readonly="<%=readOnly %>"/>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left">
	  			<eibsinput:text name="remanentes" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              <% if (remanentes.getE01RMMACC().trim().equals("999999999999")){ %>
               NUEVA CUENTA
				<input type="hidden" name="E01RMMACC" value="<%= remanentes.getE01RMMACC().trim()%>">
              <% } else { %>
	  			<eibsinput:text name="remanentes" property="E01RMMACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              <% } %>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
	  			<eibsinput:text name="remanentes" property="E01RMMCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
	  			<eibsinput:text name="remanentes" property="E01RMMPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
 <h4>Información Básica</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Fecha Inicio :</div>
            </td>
            <td nowrap width="30%" > 
    	        <eibsinput:date name="remanentes" fn_year="E01RMMOPY" fn_month="E01RMMOPM" fn_day="E01RMMOPD" readonly="<%=readOnly%>"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Monto Inicial :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="<%=readOnly%>"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Ejecutivo :</div>
            </td>
            <td nowrap width="30%" > 
                 <eibsinput:cnofc name="remanentes" property="E01RMMOFC" required="false" flag="15" fn_code="E01RMMOFC" fn_description="E01DSCOFC" readonly="<%=readOnly%>"/>
                 <eibsinput:text property="E01DSCOFC" name="remanentes" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>"  readonly="true"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Centro de Costos :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:help name="remanentes" property="E01RMMCCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>" fn_param_one="E01RMMCCN" fn_param_two="document.forms[0].E01RMMBNK.value" readonly="<%=readOnly%>"/>
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:text name="remanentes" property="E01RMMBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="<%=readOnly%>"/>
	            <eibsinput:help name="remanentes" property="E01RMMBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="<%=readOnly%>"
          	    	fn_param_one="E01RMMBRN" fn_param_two="document.forms[0].E01RMMBNK.value"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Referencia :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMREF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>"  readonly="<%=readOnly%>"/>
            </td>
          </tr>


        </table>
      </td>
    </tr>
  </table>

<% if (!remanentes.getH01FLGMAS().trim().equals("N")) {%>
 <h4>Información Adicional</h4>
 <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Periodo :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" name="E01RMMUTP" id="E01RMMUTP" size="4" maxlength="4" value="<%= remanentes.getE01RMMUTP().trim() %>" <%= read %>> 		        
            </td>
            <td nowrap width="20%" > 
              <div align="right">Origen :</div>
            </td>
            <td nowrap width="30%" > 
               <select name="E01RMMCOR" id="E01RMMCOR" <%=readOnly?"disabled":""%> onchange="origenLogic(this.value)">
                    <option value=" " <% if (!(remanentes.getE01RMMCOR().equals("RM")||
                    							remanentes.getE01RMMCOR().equals("RV") || 
                    							remanentes.getE01RMMCOR().equals("RP") || 
                    							remanentes.getE01RMMCOR().equals("PD") || 
                    							remanentes.getE01RMMCOR().equals("LS") ||                                        
                    							remanentes.getE01RMMCOR().equals("MS") ||
                    							remanentes.getE01RMMCOR().equals("PN") ||
                    							remanentes.getE01RMMCOR().equals("DP"))) out.print("selected"); %>> </option>
                    <option value="RM" <% if (remanentes.getE01RMMCOR().equals("RM")) out.print("selected"); %>>Remanentes</option>
                    <option value="RV" <% if (remanentes.getE01RMMCOR().equals("RV")) out.print("selected"); %>>Rechazos Varios</option>                   
                    <option value="RP" <% if (remanentes.getE01RMMCOR().equals("RP")) out.print("selected"); %>>Rechazo Planilla</option>                   
                    <option value="PD" <% if (remanentes.getE01RMMCOR().equals("PD")) out.print("selected"); %>>Primas Devueltas</option> 
                    <option value="LS" <% if (remanentes.getE01RMMCOR().equals("LS")) out.print("selected"); %>>Liquidacion Seguros</option>  
                    <option value="MS" <% if (remanentes.getE01RMMCOR().equals("MS")) out.print("selected"); %>>Miscelaneos</option>                                     
                    <option value="PN" <% if (remanentes.getE01RMMCOR().equals("PN")) out.print("selected"); %>>Prestamo Negociado</option>
                    <option value="DP" <% if (remanentes.getE01RMMCOR().equals("DP")) out.print("selected"); %>>Deposito a Plazo</option>                                     
                  </select> 		        
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Cuenta de Pago :</div>
            </td>
            <% if (readOnly) { %>
            <td nowrap width="30%" > 
              <input type="text" name="E01RMMPAC" id="E01RMMPAC" size="13" maxlength="12" value="<%= remanentes.getE01RMMPAC() %>" readonly>  	        
            </td>
            <% } else { %>
            <td nowrap width="30%" > 
              <input type="text" name="E01RMMPAC" id="E01RMMPAC" size="13" maxlength="12" value="<%= remanentes.getE01RMMPAC() %>" onKeypress="enterInteger(event)">
              <a href="javascript:GetAccount('E01RMMPAC','','RT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a>  	        
            </td>
            <% } %>            
            <td nowrap width="20%" > 
              <div align="right">Distribucion :</div>
            </td>
            <td nowrap width="30%" > 
               <select name="E01RMMCDS" id="E01RMMCDS" <%=readOnly?"disabled":""%>>
                    <option value=" " <% if (!(remanentes.getE01RMMCDS().equals("FA")||
                    							remanentes.getE01RMMCDS().equals("CP") || 
                    							remanentes.getE01RMMCDS().equals("MO") || 
                    							remanentes.getE01RMMCDS().equals("PB") || 
                    							remanentes.getE01RMMCDS().equals("PM") ||                                        
                    							remanentes.getE01RMMCDS().equals("OB"))) out.print("selected"); %>> </option>
                    <option value="FA" <% if (remanentes.getE01RMMCDS().equals("FA")) out.print("selected"); %>>Fallecidos</option>
                    <option value="CP" <% if (remanentes.getE01RMMCDS().equals("CP")) out.print("selected"); %>>Capitalizacion</option>                   
                    <option value="MO" <% if (remanentes.getE01RMMCDS().equals("MO")) out.print("selected"); %>>Morosos</option>                   
                    <option value="PB" <% if (remanentes.getE01RMMCDS().equals("PB")) out.print("selected"); %>>PAC Banco</option> 
                    <option value="PM" <% if (remanentes.getE01RMMCDS().equals("PM")) out.print("selected"); %>>PAC Multibanco</option>  
                    <option value="OB" <% if (remanentes.getE01RMMCDS().equals("OB")) out.print("selected"); %>>Pago Otro Banco</option>                                      
                  </select>
            </td>            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Codigo Otro Banco :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:cnofc name="remanentes" property="E01RMMCDB" required="false" flag="X3" fn_code="E01RMMCDB" readonly="<%=readOnly%>"/>	        
            </td>
            <td nowrap width="20%" > 
              <div align="right">Cuenta Otro Banco :</div>
            </td>
            <td nowrap width="30%" > 
				<INPUT type="text" name="E01RMMCOB" id="E01RMMCOB" size="22" maxlength="20" value="<%= remanentes.getE01RMMCOB() %>" <%= read %>> 		        
 		    </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           <td nowrap width="20%" > 
              <div align="right">Tipo Cta. Otro Banco :</div>
            </td>
            <td nowrap width="30%" > 
             <select name="E01RMMTYB" id="E01RMMTYB" <%=readOnly?"disabled":""%>>
                    <option value=" " <% if (!(remanentes.getE01RMMTYB().equals("CCTE")||
                    							remanentes.getE01RMMTYB().equals("CVIS") ||                                          
                    							remanentes.getE01RMMTYB().equals("AHOR"))) out.print("selected"); %>> </option>
                    <option value="CCTE" <% if (remanentes.getE01RMMTYB().equals("CCTE")) out.print("selected"); %>>Cuenta Corriente</option>
                    <option value="CVIS" <% if (remanentes.getE01RMMTYB().equals("CVIS")) out.print("selected"); %>>Cuenta Vista</option>                   
                    <option value="AHOR" <% if (remanentes.getE01RMMTYB().equals("AHOR")) out.print("selected"); %>>Cuenta Ahorro</option>                                                         
                  </select>
            </td>
            <td nowrap width="20%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="30%" > 
 		    </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Cod. Banco Intermediario :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:cnofc name="remanentes" property="E01RMMCDC" required="false" flag="X3" fn_code="E01RMMCDC" readonly="<%=readOnly%>"/>			        	        
            </td>
            <td nowrap width="20%" > 
              <div align="right">Cuenta Banco Intermediario :</div>
            </td>
            <% if (readOnly) { %>            
            <td nowrap width="30%" > 
              <input type="text" name="E01RMMCTC" id="E01RMMCTC" size="13" maxlength="12" value="<%= remanentes.getE01RMMCTC().trim()%>" readonly>  	         		        
            </td>  
         <% } else { %> 
            <td nowrap width="30%" > 
              <input type="text" name="E01RMMCTC" id="E01RMMCTC" size="13" maxlength="12" value="<%= remanentes.getE01RMMCTC().trim()%>">
              <a href="javascript:GetAccount('E01RMMCTC','',document.forms[0].CODEHELPACC.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align=middle" border="0"  ></a>  	         		        
            </td>          
         <% } %>                 
          </tr>   
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Num. Cuotas Participacion :</div>
            </td>
            <td nowrap width="30%" > 
		        <eibsinput:text name="remanentes" property="E01RMMNCU" size="10" maxlength="9" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" readonly="<%=readOnly%>"/>
            </td>
            <td nowrap width="20%" > 
              <div align="right">Valor Cuota :</div>
            </td>
            <td nowrap width="30%" > 
 		        <eibsinput:text name="remanentes" property="E01RMMVCU" size="16" maxlength="10" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE %>"  onkeypress="enterDecimal(event, 2)" readonly="<%=readOnly%>"/>
            </td>          
          </tr>  
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Cuenta Contrapartida :</div>
            </td>
          <% if (readOnly) { %> 
            <td nowrap width="30%" > 
              <input type="text"  name="E01RMMOGL" id="E01RMMOGL" size="18" maxlength="16" value="<%= remanentes.getE01RMMOGL().trim()%>" readonly >					        
            </td>
            <% } else { %>  
            <td nowrap width="30%" > 
              <input type="text"  name="E01RMMOGL" id="E01RMMOGL" size="18" maxlength="16" value="<%= remanentes.getE01RMMOGL().trim()%>"> <%=readOnly?"readonly":""%>
              <a href="javascript:GetLedger('E01RMMOGL',getElement('E01RMMBNK').value,getElement(')E01RMMCCY').value,'','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>  					        
            </td>            
            <% } %>                        
            <td nowrap width="20%" > 
              <div align="right">Cuenta Rechazo :</div>
            </td>
          <% if (readOnly) { %>             
            <td nowrap width="30%" >  
              <input type="text"  name="E01RMMRGL" id="E01RMMRGL" size="18" maxlength="16" value="<%= remanentes.getE01RMMRGL().trim()%>" readonly>          
            </td>  
          <% } else { %>   
            <td nowrap width="30%" >  
              <input type="text"  name="E01RMMRGL" id="E01RMMRGL" size="18" maxlength="16" value="<%= remanentes.getE01RMMRGL().trim()%>"> <%=readOnly?"readonly":""%>
              <a href="javascript:GetLedger('E01RMMRGL',getElement('E01RMMBNK').value,getElement(')E01RMMCCY').value,'','','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>              
            </td>          
          <% } %>                                               
          </tr>   
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Flag Exento Mora :</div>
            </td>
             <td nowrap width="30%" > 
				<input type="radio" name="E01RMMFL1" value="Y" <%if (remanentes.getE01RMMFL1().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E01RMMFL1" value="N" <%if (remanentes.getE01RMMFL1().equals("N")) out.print("checked"); %>> No
             </td>
            <td nowrap width="20%" > 
              <div align="right">Indicador Rechazo :</div>
            </td>
            <td nowrap width="30%" > 
				<input type="radio" name="E01RMMIND" value="Y" <%if (remanentes.getE01RMMIND().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E01RMMIND" value="N" <%if (remanentes.getE01RMMIND().equals("N")) out.print("checked"); %>> No
            </td>          
          </tr>                                              
        </table>
      </td>
    </tr>
  </table>
<% } %> 
  
<% if (remanentes.getH01FLGMAS().trim().equals("N")) {%>
  <h4>Origen de Fondos</h4>
  <table id="dataTable"  class="tableinfo" width="100%">
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap align="center" >Concepto</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Sucursal</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Referencia</td>
    </tr>
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
       <td nowrap > 
          <div align="center" >
            <input type="text" name="E01OFFOPC" id="E01OFFOPC" value="<%= remanentes.getE01OFFOPC().trim() %>" size="3" maxlength="3" <%=readOnly?"readonly":""%>> 
            <input type="hidden" name="E01OFFGLN" id="E01OFFGLN" value="<%= remanentes.getE01OFFGLN().trim() %>">
            <input type="text" name="E01OFFCON" id="E01OFFCON" size="35" maxlength="35" readonly value="<%= remanentes.getE01OFFCON().trim() %>"
              class="context-menu-help"
              onmousedown="init(conceptHelp,this.name,getElement('E01RMMBNK').value,'','E01OFFGLN','E01OFFOPC',document.forms[0].E01RMMACD.value)">
          </div>
       </td>
       <td nowrap > 
          <div align="center"> 
             <input type="text" name="E01OFFBNK" id="E01OFFBNK" size="2" maxlength="2" value="<%= remanentes.getE01OFFBNK().trim() %>" <%=readOnly?"readonly":""%>>
          </div>
       </td>
       <td nowrap > 
          <div align="center"> 
              <input type="text" name="E01OFFBRN" id="E01OFFBRN" size="4" maxlength="4" value="<%= remanentes.getE01OFFBRN().trim() %>" <%=readOnly?"readonly":""%>
                class="context-menu-help"
                onmousedown="init(branchHelp,this.name,getElement('E01OFFBNK').value,'','','','')">
          </div>
      </td>
      <td nowrap > 
          <div align="center"> 
              <input type="text" name="E01OFFCCY" id="E01OFFCCY" size="3" maxlength="3" value="<%= remanentes.getE01OFFCCY().trim() %>" <%=readOnly?"readonly":""%>
               class="context-menu-help"
               onmousedown="init(currencyHelp,this.name,getElement('E01OFFBNK').value,'','','','')">
          </div>
      </td>
      <td nowrap > 
          <div align="center"> 
             <input type="text" name="E01OFFACC" id="E01OFFACC" size="12" maxlength="12"  value="<%= remanentes.getE01OFFACC().trim() %>" <%=readOnly?"readonly":""%>
              class="context-menu-help"
              onmousedown="init(accountCustomerHelp,this.name,document.getElementById('E01OFFBNK').value,'',document.getElementById('E01RMMCUN').value,'','RT')">       
          </div>
      </td>
    </tr>
 </table>
 <% } %>     

 <%if  (!readOnly) { %>
   <div align="center"> 
        <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
   </div>
 <% } %>  
  
	
</form>
</body>
</html>
