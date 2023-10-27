<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<title>Aprobación de Negocios</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="cdMant" class="datapro.eibs.beans.EDL013001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">  

 <% 
   if (userPO.getOption().equals("TREASURY") && userPO.getHeader16().equals("N")) {  
  %>
		builtNewMenu(cdt_a_act_opt);		// Treasury without SWIFT Payment
  <%      
   } else if (userPO.getOption().equals("TREASURY") && (!userPO.getHeader16().equals("N"))) {
  %>
		builtNewMenu(cdt_a_opt);			// Treasury with SWIFT Payment
  <%
   } else {
  %> 
   		builtNewMenu(cd_a_opt);			//  Normal
  <% 
   }
  %>
  
  function change(value){
  	return value =='Y' ? 'txtchanged':'';
  }

	function chgPago(val){
	document.getElementById('E01DEAPVI').value=val;
	if (getElement("E01DEAPVI").value == ("A")) {					// ACH
		document.getElementById("nonpaper1").style.display = 'block';
	} else {
		document.getElementById("nonpaper1").style.display = 'none';
	} 
}


</SCRIPT>

</head>

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Aprobaci&oacute;n de <%=cdMant.getE01DEANR1() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_ap_maint.jsp,EDL0140"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130A" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK"  value="<%= cdMant.getE01DEABNK().trim()%>">
  
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
                <input type="text" readonly <% if (cdMant.getF01DEACUN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEACUN" size="10" maxlength="9" value="<%= cdMant.getE01DEACUN().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" readonly name="E01CUSNA1" size="45" maxlength="45" value="<%= cdMant.getE01CUSNA1().trim()%>" >
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Certificado :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <input type="text" readonly name="E01DEAACC" size="13" maxlength="12" value="<%= cdMant.getE01DEAACC().trim()%>" >
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E01DEACCY2" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" >
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E01DEAPRO" size="4" maxlength="4" value="<%= cdMant.getE01DEAPRO().trim()%>" >
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n General</h4>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Nombre del Certificado :</div>
            </td>
            <td nowrap width="25%">               
              <eibsinput:text property="E01DEANME" name="cdMant" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"  modified="F01DEANME"/>   
            </td>
            <td nowrap width="25%"> 
            </td>
            <td nowrap width="25%"> 
            </td>
          </tr>        
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:date name="cdMant" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" readonly="true" modified="F01DEAODY;F01DEAODD;F01DEAODM"/> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="25%">          
              <eibsinput:text  name="cdMant" property="E01DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01DEAOAM"/>              
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:date name="cdMant" fn_month="E01DEAMDM" fn_day="E01DEAMDD" fn_year="E01DEAMDY" readonly="true" modified="F01DEAMDY;F01DEAMDD;F01DEAMDM"/> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Saldo Principal :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:text name="cdMant" property="E01DEAMEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />                 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%"> 
              <div align="right">Tasa Interes :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:text name="cdMant" property="E01RATE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"  modified="F01DEARTE"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Saldo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:text name="cdMant" property="E01DEAMEI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />                 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (cdMant.getF01DEABAS().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEABAS" size="3" maxlength="3" value="<%= cdMant.getE01DEABAS().trim()%>" >
            </td>
            <td nowrap width="25%"> 
              <div align="right"> Moneda :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (cdMant.getF01DEACCY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEACCY" size="3" maxlength="3" value="<%= cdMant.getE01DEACCY().trim()%>" >
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap width="25%"> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap > 
              <div align="right">Nueva Fecha Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:date name="cdMant" fn_month="E01NEWMDM" fn_day="E01NEWMDD" fn_year="E01NEWMDY" readonly="true" modified="F01NEWMDY;F01NEWMDD;F01NEWMDM"/> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (cdMant.getF01DEATRM().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEATRM" size="6" maxlength="5" value="<%= cdMant.getE01DEATRM().trim()%>">
              <input type="text" readonly <% if (cdMant.getF01DEATRC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEATRC" size="15" maxlength="15" 
				  value="<% if (cdMant.getE01DEATRC().equals("D")) out.print("D&iacute;a(s)");
							else if (cdMant.getE01DEATRC().equals("M")) out.print("Mes(es)");
							else if (cdMant.getE01DEATRC().equals("Y")) out.print("A&ntilde;o(s)");
							else out.print("");%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
          	<td nowrap width="25%" height="23"> 
              <div align="right">Tabla de Tasa Flotante :</div>
            </td>
            <td nowrap width="25%" height="23"> 
              <input type="text" readonly <% if (cdMant.getF01DEAFTB().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAFTB" size="2" maxlength="2" value="<%= cdMant.getE01DEAFTB().trim()%>">
              <input type="text" readonly <% if (cdMant.getF01DEAFTY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAFTY" size="3" maxlength="3" 
				  value="<% if (cdMant.getE01DEAFTY().equals("FP")) out.print("PRIMARIA");
							else if (cdMant.getE01DEAFTY().equals("FS")) out.print("SECUNDARIA");
							else out.print("");%>" 
				>
              <input type="text" readonly name="E01FLTDSC" size="30" maxlength="30" value="<%= cdMant.getE01FLTDSC().trim()%>">
            </td>
             <td width="25%" > 
              <div align="right">Tasa Flotante Base :</div>
            </td>
            <td width="25%" > 
              <input type="text" name="E01FLTORG" id="E01FLTORG" size="10" maxlength="9" value="<%= cdMant.getE01FLTORG().trim()%>" readonly>
            </td>
            
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width="25%">
              <div align="right"> Manejo Puntos Adicional :</div> 
            </td>
            <td nowrap width="25%" height="19"> 
              <eibsinput:text name="cdMant" property="E01DEAFLX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_FLAG %>" readonly="true" modified="F01DEAFLX"/>
              <input type="text" readonly name="D01DEAFLX" size="25" maxlength="25" 
				  value="<% if (cdMant.getE01DEAFLX().equals("B")) out.print("+/- Tasa Base");
							else if (cdMant.getE01DEAFLX().equals("E")) out.print("+/- Tasa Efectiva");
							else if (cdMant.getE01DEAFLX().equals("N")) out.print("+/- Tasa Nominal");
							else out.print("");%>" readonly <% if (cdMant.getF01DEAFLX().equals("Y")) out.print("class=\"txtchanged\"");%>>
             </td>
             <td nowrap width="25%">
              <div align="right"> Valor Tasa Adicional :</div> 
            </td>
            <td nowrap width="25%" > 
              <eibsinput:text name="cdMant" property="E01DEARTX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" modified="F01DEARTX"/>
            </td>
          </tr>   
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%"> 
              <div align="right">Ciclo/Fecha Revis. Tasa :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (cdMant.getF01DEARRP().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEARRP" size="3" maxlength="3" value="<%= cdMant.getE01DEARRP().trim()%>">
              / 
              <eibsinput:date name="cdMant" fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY" readonly="true" modified="F01DEARDY;F01DEARDD;F01DEARDM"/> 
            </td>
             <td width="25%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td width="25%" > 
                 <input type="text" readonly name="E01FLTRTE" size="10" maxlength="9" value="<%= cdMant.getE01FLTRTE().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width="25%" height="19"> 
              <div align="right">Tabla de Tasa :</div>
            </td>
            <td nowrap width="25%" height="19">
              <eibsinput:text name="cdMant" property="E01DEARTB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TABLE %>" readonly="true" modified="F01DEARTB"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Inter&eacute;s/Spread :</div>
            </td>
            <td nowrap width="25%"> 
				<eibsinput:text name="cdMant" property="E01DEARTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" modified="F01DEARTE"/>
           </td>  
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Retenci&oacute;n/Impuesto :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (cdMant.getF01DEAWHF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAWHF" size="2" maxlength="1" value="<%= cdMant.getE01DEAWHF().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">N&uacute;mero Referencia :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (cdMant.getF01DEAREF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAREF" size="12" maxlength="12" value="<%= cdMant.getE01DEAREF().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Condici&oacute;n de Contrato :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (cdMant.getF01DEADLC().equals("Y")) out.print("class=\"txtchanged\""); %>  name="E01DEADLC" size="15" maxlength="15" 
				  value="<% if (cdMant.getE01DEADLC().equals("1")) out.print("Vigente");
							else if (cdMant.getE01DEADLC().equals("2")) out.print("Vencido");
							else if (cdMant.getE01DEADLC().equals("3")) out.print("Embargado");
							else out.print("");%>" 
				>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="25%">
              <eibsinput:text name="cdMant" property="E01DEAEXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE %>" readonly="true" modified="F01DEAEXR"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%"> 
              <div align="right">Tipo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly <% if (cdMant.getF01DEAICT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAICT" size="2" maxlength="1" value="<%= cdMant.getE01DEAICT().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Calcular Inter&eacute;s :</div>
            </td>
            <td nowrap width="25%" >
              <input type="text" readonly <% if (cdMant.getF01DEAIFL().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEAIFL" size="2" maxlength="1" value="<%= cdMant.getE01DEAIFL().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
             <td nowrap width="29%" height="23"> 
              <div align="right">Uso de domicilio :</div>
            </td>
            <td nowrap width="22%" height="23"> 
               <input type="text" readonly name="E01DEAWHF" size="18" maxlength="18" <% if (cdMant.getF01DEAWHF().equals("Y")) out.print("class=\"txtchanged\""); %>
                                  value="<% if (cdMant.getE01DEAWHF().equals("C")) out.print("Correo Electrónico");
								       else if (cdMant.getE01DEAWHF().equals("R")) out.print("Dirección Fisica");
								       else if (cdMant.getE01DEAWHF().equals("O")) out.print("Oficina del Banco");
							           else out.print("");%>">
              <input type="text" name="E01DEAMLA" size="2" maxlength="1" value="<%= cdMant.getE01DEAMLA().trim()%>" readonly <% if (cdMant.getF01DEAMLA().equals("Y")) out.print("class=\"txtchanged\""); %>>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Clase de Certificado :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" readonly <% if (cdMant.getF01DEACLF().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01DEACLF" size="2" maxlength="1" value="<%= cdMant.getE01DEACLF().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Centro de Costos :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:text name="cdMant" property="E01DEACCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>" readonly="true" modified="F01DEACCN"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Porcentaje Garant&iacute;a :</div>
            </td>
            <td nowrap width="25%">
              <eibsinput:text name="cdMant" property="E01DEACPE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" readonly="true" modified="F01DEACPE"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" >
       			<div align="right">Fecha Cambio de Tasa :</div>
       		</td> 	
    		<td nowrap width="25%" > 
              <eibsinput:date name="cdMant"  fn_month="E01DLVSDM" fn_day="E01DLVSDD" fn_year="E01DLVSDY" readonly="true"/>  
            </td>
            <td nowrap width="25%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="25%">           
              <input type="text" name="E01DEABNK" size="2" maxlength="2" value="<%= cdMant.getE01DEABNK().trim()%>" readonly>
              <input type="text" name="E01DEABRN" size="4" maxlength="4" value="<%= cdMant.getE01DEABRN().trim()%>" readonly>
            </td>      
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<td nowrap width="25%" > 
              <div align="right">Comisionista :</div>
            </td>
            <td nowrap width="25%" >
            	<eibsinput:help fn_param_one="E01DEABRK" fn_param_three="S" property="E01DEABRK" name="cdMant" modified="F01DEABRK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER %>" readonly="true"/>
            </td>   
            <td nowrap width="25%" > 
            	<div align="right">Condición de Manejo :</div>
            </td>
            <td nowrap width="25%" >
            <eibsinput:text  name="cdMant"  property="E01DEAPAF" modified="F01DEAPAF" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_FLAG %>" readonly="true"/>
			</td>   
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <%if(!cdMant.getE01NEWGLN().equals("0")){ %>
<div>  
   <h4>Cambio de Producto</h4>
	<table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">             
    	    	<td nowrap width="25%" >
       				<div align="right">Cuenta Contable de acuerdo al Plazo :</div>
      	 		</td> 
    			<td nowrap width="25%" >
	            	<eibsinput:text modified="F01NEWPRC" property="E01NEWGLN" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
				</td>
				<td nowrap width="25%" >
       			</td> 
    			<td nowrap width="25%" >
	            </td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">             
    	        <td nowrap width="25%" >
	            	<div align="right">Nuevo Codigo de Producto :</div>  
	            </td>
	            <td nowrap width="25%">
	       			<eibsinput:help modified="F01NEWPRC" property="E01NEWPRC" name="cdMant" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true" required="true"
	       			fn_param_one="E01NEWPRC" fn_param_two="document.forms[0].E01DEAACD.value" fn_param_three="document.forms[0].E01DEABNK.value" fn_param_four="E01NEWPRD" />
	       			<eibsinput:text name="cdMant" property="E01NEWPRD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
		  		</td>
		  		<td nowrap width="25%" >
       			</td> 
    			<td nowrap width="25%" >
	            </td>
	   		</tr>
	      </table>
      </td>
    </tr>
  </table>
</div>
<%} %>
  
  <%-- if ((cdMant.getE01FLGFRA().trim().equals("Y"))) { --%> 
  <h4>Depositos Desmaterializados</h4> 
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">             
    	    	<td nowrap width="25%" >
       				<div align="right">ISIN ANNA :</div>
      	 		</td> 
    			<td nowrap width="25%" >
	             <input type="text" name="E01DEACUI" size="14" readonly value="<%= cdMant.getE01DEACUI().trim()%>"
	             <% if (cdMant.getF01DEACUI().equals("Y")) out.print("class=\"txtchanged\""); %>>
				</td>
	            <td nowrap width="25%" > 
    	          <div align="right">Forma de Compensacion :</div>
     	       </td>      
	            <td nowrap width="25%">
	       			<input type="radio" name="E01DEAF02" id="E01DEAF02" value="Y" disabled
		  			<%if(cdMant.getE01DEAF02().equals("Y")) out.print("checked");%>>
	          			DVP 
	       			<input type="radio" name="E01DEAF02" id="E01DEAF02" value="N" disabled
		  			<%if(!cdMant.getE01DEAF02().equals("Y")) out.print("checked");%>>
	           			LP 
	            </td>
	   		</tr>
		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
	        	<td nowrap width="25%" >
    	          <div align="right">Agente Comprador :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEADIB" size="5" maxlength="4" value="<%= cdMant.getE01DEADIB().trim()%>" readonly
	              <% if (cdMant.getF01DEADIB().equals("Y")) out.print("class=\"txtchanged\""); %>>
	              <input type="text" name="D01DEADIB" size="40" maxlength="35" value="<%= cdMant.getD01DEADIB().trim()%>" readonly>
	 			</td>
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta Inversionista :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEAIVC" size="22" maxlength="20" value="<%= cdMant.getE01DEAIVC().trim()%>" readonly
	              <% if (cdMant.getF01DEAIVC().equals("Y")) out.print("class=\"txtchanged\""); %>>
	 			</td>
	   		</tr>


		    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta SEBRA Vendedor :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEACRC" size="22" maxlength="20" value="<%= cdMant.getE01DEACRC().trim()%>" readonly
	              <% if (cdMant.getF01DEACRC().equals("Y")) out.print("class=\"txtchanged\""); %>>
	 			</td>
	        	<td nowrap width="25%" >
	       			<div align="right">Cuenta SEBRA Comprador :</div>
  	     		</td> 
	    		<td nowrap width="25%" >
	              <input type="text" name="E01DEAUNR" size="22" maxlength="20" value="<%= cdMant.getE01DEAUNR().trim()%>" readonly
	              <% if (cdMant.getF01DEAUNR().equals("Y")) out.print("class=\"txtchanged\""); %>>
	 			</td>
	   		</tr>
   		 

       </table>
      </td>
    </tr>
  </table>
<%-- } --%> 

<h4>Instrucciones al Vencimiento</h4> 
  
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
   		     	<td nowrap width="25%" >
       				<div align="right">Tipo de Prórroga :</div>
       			</td> 
    			<td nowrap width="25%" >
	              <input type="text" name="E01DEAROC" readonly size="2" maxlength="1" value="<%= cdMant.getE01DEAROC().trim()%>"
	              <% if (cdMant.getF01DEAROC().equals("Y")) out.print("class=\"txtchanged\""); %>>
				</td>
				<td nowrap width="25%" > 
    	   			<div align="right">Vía de Pago :</div>	            
	            </td>      
	            <td nowrap width="25%" >
	              <select name="E01DEAPVI" disabled="disabled" onchange="ChgPago();" 
	             	 <% if (cdMant.getF01DEAPVI().equals("Y")) out.print("class=\"txtchanged\""); %>>
	                <OPTION <%= cdMant.getE01DEAPVI().trim().equals("C")?"Selected":"" %> value="C">Cheque</OPTION>
	                <OPTION <%= cdMant.getE01DEAPVI().trim().equals("R")?"Selected":"" %> value="R">Cta Ahorros/Corriente</OPTION>
	                <OPTION <%= cdMant.getE01DEAPVI().trim().equals("G")?"Selected":"" %> value="G">Cta Contable</OPTION>
	                <OPTION <%= cdMant.getE01DEAPVI().trim().equals("1")?"Selected":"" %> value="1">Swift Formato MT-100</OPTION>
	                <OPTION <%= cdMant.getE01DEAPVI().trim().equals("2")?"Selected":"" %> value="2">Swift Formato MT-200</OPTION>
					<OPTION <%= cdMant.getE01DEAPVI().trim().equals("3")?"Selected":"" %> value="3">Swift Formato MT-300</OPTION>
					<option <%= cdMant.getE01DEAPVI().trim().equals("A")?"Selected":"" %> value="3">ACH</option>
	              </select>
  	            </td>	     
          </tr>  
                
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	        	<td nowrap width="25%" >
    	   			<div align="right">Cuenta Contable de Pago :</div>
    	   		</td> 
 		   		<td nowrap width="25%" >
	              <input type="text" name="E01DEARGL" readonly size="16" maxlength="16" value="<%= cdMant.getE01DEARGL().trim()%>" onKeypress="enterInteger()"
	              <% if (cdMant.getF01DEARGL().equals("Y")) out.print("class=\"txtchanged\""); %>>
 				</td>
	            <td nowrap width="25%" > 
        	      <div align="right">Cuenta Cta Ahorros/Corriente de Pago :</div>
	            </td>      
	            <td nowrap width="25%" >
	              <input type="hidden" name="E01FLGACC" size="2" maxlength="1">
  				  <input type="text" name="E01DEARAC" readonly size="12" maxlength="12" value="<%= cdMant.getE01DEARAC().trim()%>" onKeypress="enterInteger()"
  				  <% if (cdMant.getF01DEARAC().equals("Y")) out.print("class=\"txtchanged\""); %>>

     	       </td>        
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">            
   		     	<td nowrap width="50%" >
       				<div align="right">Periodo Pago Intereses :</div>
       			</td> 
    			<td nowrap width="50%" >
                <input type="text" name="E01DEAROY" size="3"  readonly maxlength="3" value="<%= cdMant.getE01DEAROY().trim()%>"
                <% if (cdMant.getF01DEAROY().equals("Y")) out.print("class=\"txtchanged\""); %>>
                <select name="E01DEAODA" disabled 
                	<% if (cdMant.getF01DEAODA().equals("Y")) out.print("class=\"txtchanged\""); %>>
                  <option value="" <% if (!(cdMant.getE01DEAODA().equals("D") || cdMant.getE01DEAODA().equals("M")||
				cdMant.getE01DEAODA().equals("Y")))out.print("selected"); %>> 
                  </option>
                  <option value="D" <% if (cdMant.getE01DEAODA().equals("D")){out.print("selected");} %>>Dias</option>
                  <option value="M" <% if (cdMant.getE01DEAODA().equals("M")){out.print("selected");} %>>De Cada Mes</option>
                  <option value="Y" <% if (cdMant.getE01DEAODA().equals("Y")){out.print("selected");} %>>A&ntilde;os</option>
                </select>
				</td>
		</tr>		

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
   		     	<td nowrap width="25%" >
       				<div align="right">Monto de Pago :</div>
       			</td> 
    			<td nowrap width="25%" >
                <input type="text" name="E01DEAROA" readonly size="16" maxlength="15" value="<%= cdMant.getE01DEAROA().trim()%>" onKeypress="enterDecimal()">
				</td>
	      	     <td nowrap width="25%" > 
       				<div align="right">Modalidad al Vencimiento :</div>
	            </td>      
	            <td nowrap width="25%" >
                <select name="E01DEARPT" disabled>
                  <option value="" <% if (!(cdMant.getE01DEARPT().equals("CR") ||
				cdMant.getE01DEARPT().equals("DR")))out.print("selected"); %>> 
                  </option>
                  <option value="DR" <% if (cdMant.getE01DEARPT().equals("DR")){out.print("selected");} %>>Débito</option>
                  <option value="CR" <% if (cdMant.getE01DEARPT().equals("CR")){out.print("selected");} %>>Crédito</option>
                </select>

     	       </td>      
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	        	<td nowrap width="25%" >
    	   			<div align="right">Formato Cheque IBS :
    	   			<br>
				(Si via de pago es Cheque)</div>
    	   		</td> 
 		   		<td nowrap width="25%" >
	              <input type="text" name="E01DEAOFT" size="5" maxlength="2" value="<%= cdMant.getE01DEAOFT().trim()%>" readonly="readonly"
	              <% if (cdMant.getF01DEAOFT().equals("Y")) out.print("class=\"txtchanged\""); %>>
	           </td>
	           <td nowrap width="25%" >
            		<div align="right">Tasa de Prorroga : </div>
            </td>
            <td nowrap width="25%" >
            	<input type="text" name="E01DEAROR" size="9" maxlength="9" value="<%= cdMant.getE01DEAROR().trim()%>" readonly="readonly">
             	<select name="E01DEAHTM" disabled="disabled">
                	<option value=" " <% if (!(cdMant.getE01DEAHTM().equals("4")|| cdMant.getE01DEAHTM().equals("3")|| cdMant.getE01DEAHTM().equals("2")||cdMant.getE01DEAHTM().equals("1"))) out.print("selected"); %>></option>
                	<option value="1" <% if (cdMant.getE01DEAHTM().equals("1")) out.print("selected"); %>>Sumar</option>
                	<option value="2" <% if (cdMant.getE01DEAHTM().equals("2")) out.print("selected"); %>>Restar</option>
                	<option value="3" <% if (cdMant.getE01DEAHTM().equals("3")) out.print("selected"); %>>Sustituir</option>
                	<option value="4" <% if (cdMant.getE01DEAHTM().equals("4")) out.print("selected"); %>>Mantener</option>
              	</select>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <div id="nonpaper1">
		<h4>Transferencia ACH</h4>
		<table class="tableinfo">
			<tr bordercolor="#FFFFFF"> 
				<td nowrap> 
					<table cellspacing="0" cellpadding="2" width="100%" border="0" > <%row = 1;%>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"><div align="right">Banco Destino (Ruta) :</div></td>
							<td width="30%">
								<input type="text" name="E01DEAABA" size="12" maxlength="9" value="<%= cdMant.getE01DEAABA().trim()%>" readonly="readonly"
								<% if (cdMant.getF01DEAABA().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</td>
							<td width="20%"><div align="right">Tipo de Cuenta :</div></td>
							<td width="30%">
								<select name="E01DEAACT" disabled="disabled" <% if (cdMant.getF01DEAACT().equals("Y")) out.print("class=\"txtchanged\""); %>>
							  		<option value="C" <% if (!(cdMant.getE01DEAACT().equals("C"))) out.print("selected"); %>>Corriente </option>
									<option value="S" <% if   (cdMant.getE01DEAACT().equals("S"))  out.print("selected"); %>>Ahorros   </option>
								</select>
							</td>
						</tr>
						
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Cuenta del Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAFAC" size="19" maxlength="17" value="<%= cdMant.getE01DEAFAC().trim()%>" readonly="readonly"
									<% if (cdMant.getF01DEAFAC().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</td>
							<td width="20%"> 
								<div align="right">Nombre Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAFNM" size="50" maxlength="45" value="<%= cdMant.getE01DEAFNM().trim()%>" readonly="readonly"
								<% if (cdMant.getF01DEAFNM().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</td>
						</tr>
						<tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
							<td width="20%"> 
								<div align="right">Descripcion ACH :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEATDS" size="50" maxlength="45" value="<%= cdMant.getE01DEATDS().trim()%>" readonly="readonly"
									<% if (cdMant.getF01DEATDS().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</td>
							<td width="20%"> 
								<div align="right">ID Beneficiario :</div>
							</td>
							<td width="30%">
								<input type="text" name="E01DEAAID" size="15" maxlength="15" value="<%= cdMant.getE01DEAAID().trim()%>" readonly="readonly"
									<% if (cdMant.getF01DEAAID().equals("Y")) out.print("class=\"txtchanged\""); %>>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>  
  
  
  
  <% if (cdMant.getH01FLGMAS().equals("N")) {%>
  
    
  <h4>Origen de Fondos</h4>
  
    <TABLE id="mainTable" class="tableinfo">
  <TR><TD>
  
   <table id="headTable" >
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
      <td nowrap align="center" > Concepto</td>
      <td nowrap align="center" >Banco </td>
      <td nowrap align="center" >Sucursal</td>
      <td nowrap align="center" >Moneda</td>
      <td nowrap align="center" >Referencia</td>
      <td nowrap align="center" >Monto</td>
    </tr>
    </table> 
      
    <div id="dataDiv" style="height:60; overflow-y :scroll; z-index:0" >
     <table id="dataTable" >
          <%
  				   int amount = 9;
 				   String name;
  					for ( int i=1; i<=amount; i++ ) {
   					  name = i + "";
   			%> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap > 
              <div align="center"> 
               	<%= i %>
                <input type="hidden" name="E01OFFOP<%= name %>" value="<%= cdMant.getField("E01OFFOP"+name).getString().trim()%>">
                <input type="hidden" name="E01OFFGL<%= name %>" value="<%= cdMant.getField("E01OFFGL"+name).getString().trim()%>">
                <input type="text" name="E01OFFCO<%= name %>" size="25" maxlength="25" readonly value="<%= cdMant.getField("E01OFFCO"+name).getString().trim()%>" 
                  >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01OFFBK<%= name %>" size="2" maxlength="2" value="<%= cdMant.getField("E01OFFBK"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01OFFBR<%= name %>" size="4" maxlength="4" readonlyvalue="<%= cdMant.getField("E01OFFBR"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01OFFCY<%= name %>" size="3" maxlength="3" value="<%= cdMant.getField("E01OFFCY"+name).getString().trim()%>" readonly >
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" name="E01OFFAC<%= name %>" size="13" maxlength="12"  value="<%= cdMant.getField("E01OFFAC"+name).getString().trim()%>"
                	 class="context-menu-inq" onmousedown="init(inqAccount, this.value)" readonly >
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" name="E01OFFAM<%= name %>" size="15" maxlength="15"  value="<%= cdMant.getField("E01OFFAM"+name).getString().trim()%>" readonly >
              </div>
            </td>
          </tr>
          <%
    		}
    		%> 
    	  </table>
        </div>
        
		<table id="footTable" > 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap align="right"><b>Equivalente Moneda del Certificado :</b>
            </td>
            <td nowrap align="center"><b><i><strong> 
                <input type="text" name="E01OFFEQV" size="15" maxlength="15" readonly value="<%= cdMant.getE01OFFEQV().trim()%>">
                </strong></i></b>
            </td>
          </tr>
        </table>
   </TD>  
</TR>	
</TABLE>    
 <SCRIPT type="text/javascript">
    function tableresize() {
     adjustEquTables(getElement('headTable'),getElement('dataTable'),getElement('dataDiv'),0,true);
   }
  tableresize();
  window.onresize=tableresize;
  </SCRIPT>
     <% } %>  
  </form>
</body>
</html>
