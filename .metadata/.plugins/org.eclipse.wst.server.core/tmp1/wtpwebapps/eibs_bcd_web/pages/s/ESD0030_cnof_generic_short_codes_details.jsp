<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields" %>

<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</head>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<%
	boolean nroRef = true;

	// Numero de referencia
	if (currUser.getE01INT().trim().equals("05") && refCodes.getE02CNOCFL().trim().equals("Y9")) {
		nroRef = false;
	}
%>

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	document.forms[0].submit();
}

function updateRedescuento() {
	if (isValidObject(getElement("E02CNOF03"))) {
		if (getRadioVal("E02CNOF03") == ("Y")) {
			getElement("c3").style.display = 'table-cell';
			getElement("c4").style.display = 'table-cell';
		} else {
			getElement("c3").style.display = 'none';
			getElement("c4").style.display = 'none';
		}
	} 
}

</script>
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		out.println("<SCRIPT Language=\"Javascript\">");
		error.setERRNUM("0");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<H3 align="center">Códigos de Referencia del Sistema <br> <%= userPO.getSource()%> 
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_generic_short_codes_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
	<INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
	<input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="<%=(request.getParameter("E01CNOFLD")!=null?request.getParameter("E01CNOFLD"):"4")%>">
	<input type=HIDDEN name="TABLECODE" id="TABLECODE" value="<%= refCodes.getE02CNOCFL().trim()%>">
	<input type=HIDDEN name="NMECIA" id="NMECIA" value="">

	<% int row = 0;%>
	<h4>Informaci&oacute;n B&aacute;sica</h4>
	<table  class="tableinfo">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0">
				
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%"><div align="right">Clasificación :</div></td>
						<td nowrap> 
							<div align="left"> 
								<input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly>
							</div>
						</td>
					</tr>
					
					<% if (refCodes.getE02CNOCFL().trim().equals("CV")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="23"><div align="right">Código :</div></td>
						<td nowrap height="23"> 
							<div align="left"> 
								<input type="text" name="E02CNORCD" size="8" maxlength="2" value="<%= refCodes.getE02CNORCD().trim()%>">
								<input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
							</div>
						</td>
					</tr>
					<% } else { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="23"><div align="right">Código :</div></td>
						<td nowrap height="23"> 
							<div align="left"> 
								<input type="text" name="E02CNORCD" size="8" maxlength="6" value="<%= refCodes.getE02SETRCD().trim()%>">
								<input type="text" name="E02CNODSC" size="50" maxlength="45" value="<%= refCodes.getE02CNODSC().trim()%>" >
							</div>
						</td>
					</tr>
					<% } %>
					
					<% if (refCodes.getE02CNOCFL().trim().equals("AB")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Actualiza Fecha Ultima Transacci&oacute;n :</div></td>
						 <td nowrap height="19">
							 <input type="hidden" name="E02CNOPAF" value="<%= refCodes.getE02CNOPAF()%>">
							 <input type="radio" name="CE02CNOPAF" value="1" onClick="document.forms[0].E02CNOPAF.value='1'"
							 <%if(refCodes.getE02CNOPAF().equals("1")) out.print("checked");%>>
								S&iacute; 
							 <input type="radio" name="CE02CNOPAF" value="2" onClick="document.forms[0].E02CNOPAF.value='2'"
							 <%if(refCodes.getE02CNOPAF().equals("2")) out.print("checked");%>>
							 No <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
							</td>
						</tr>            
					<% } else if (refCodes.getE02CNOCFL().trim().equals("YN")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Codigo de Moneda :</div></td>
						<td nowrap height="19"> 
							<eibsinput:help name="refCodes" property="E02CNOSCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E02CNOSCY" fn_param_two="<%=currUser.getE01UBK() %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Valor Referencial :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text name="refCodes" property="E02CNOCHG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("IT")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Compania de Seguros :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:help name="refCodes" property="E02CNOUS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BROKER %>" fn_param_one="E02CNOUS1" fn_param_two=" " fn_param_three="I" />
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("X3")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="39%"><div align="right">Identificación :</div></td>
						<td nowrap width="61%">  
							<input type="text" name="E02CNORUT" size="28" maxlength="25" value="<%= refCodes.getE02CNORUT().trim()%>" >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">N&uacute;mero de Cuenta :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:help name="refCodes" property="E02CNOSCG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" required="false" fn_param_one="E02CNOSCG" fn_param_two="<%=currUser.getE01UBK() %>" fn_param_three="RT" />
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Tipo Papel Valor :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:cnofc name="refCodes" flag="YJ" property="E02CNOUS1" fn_description="E02DSCUS1" required="false"/>
								<eibsinput:text name="refCodes" property="E02DSCUS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Subtipo Papel Valor :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOUS2" size="5" maxlength="4" value="<%= refCodes.getE02CNOUS2()%>">
								<a href="javascript:GetCodeDescAuxCNOFC('E02CNOUS2','E02DSCUS2','YI',document.forms[0].E02CNOUS1.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" ></a> 
								<eibsinput:text name="refCodes" property="E02DSCUS2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("K0")) {%>
		 			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Fecha Prestamos Reestructurados desembolsados a Partir de DDMMAAAA: </div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNODCC" size="4" maxlength="2" value="<%= refCodes.getE02CNODCC() %>" onKeypress="enterInteger(event)" >
								<input type="text" name="E02CNOACD" size="4" maxlength="2" value="<%= refCodes.getE02CNOACD() %>" onKeypress="enterInteger(event)" >
								<input type="text" name="E02CNOCPC" size="6" maxlength="4" value="<%= refCodes.getE02CNOCPC() %>" onKeypress="enterInteger(event)" >				
							</div>
						</td>
					</tr> 			  		  
					<% } else if (refCodes.getE02CNOCFL().trim().equals("K3")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Porcentaje Incremento Capital segun SFC:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text  name="refCodes" property="E02CNOPER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
							</div>
						</td>
					</tr>   
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Porcentaje Incremento Interés segun SFC:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text  name="refCodes" property="E02CNOCST" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
							</div>
						</td>
					</tr>   
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Porcentaje Incremento Otros segun SFC:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text  name="refCodes" property="E02CNOACS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />
							</div>
						</td>
					</tr>    
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Días de Incumplimiento:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text name="refCodes" property="E02CNOPXT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="4"/>         
							</div>
						</td>
					</tr>                 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Línea Información Financiera Detallada:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text name="refCodes" property="E02CNOUS2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3"/>         
							</div>
						</td>
					</tr>        
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Línea Información Financiera General:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text name="refCodes" property="E02CNOUS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3"/>         
							</div>
						</td>
					</tr>          
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">% Provision General :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text  name="refCodes" property="E02CNOCHG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PERCENTAGE %>" />     
							</div>
						</td>      
					</tr>      
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Calificaci&oacute;n  inicial Reestructurado : </div></td>
						<td nowrap height="19"> 
							<div align="left">
								<input type="text" name="E02CNOAPC" size="4" maxlength="2" value="<%= refCodes.getE02CNOAPC() %>"  >			
								<a href="javascript:GetCodeDescCNOFC('E02CNOAPC',' ','SA')" > <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
							</div>
						</td>
					</tr> 		
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">D&iacute;as  Mora antes de fecha para paso Incumplimiento Reestructurado :</div></td>
						<td nowrap height="19"> 
							<div align="left">
								<input type="text" name="E02CNOCCN" size="5" maxlength="4" value="<%= refCodes.getE02CNOCCN() %>" onKeypress="enterInteger(event)" >								
							</div>
						</td>
					</tr> 			 
			 		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">D&iacute;as  Mora despu&eacute;s de fecha para paso Incumplimiento Reestructurado :</div></td>
						<td nowrap height="19"> 
							<div align="left">
								<input type="text" name="E02CNOPHN" size="5" maxlength="4" value="<%= refCodes.getE02CNOPHN() %>" onKeypress="enterInteger(event)" >								
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Calificaci&oacute;n  incumplimiento Reestructurado :</div></td>
						<td nowrap height="19"> 
							<div align="left">
								<input type="text" name="E02CNODCC" size="4" maxlength="2" value="<%= refCodes.getE02CNODCC() %>"  >			
								<a href="javascript:GetCodeDescCNOFC('E02CNODCC',' ','SA')" > <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
							</div>
						</td>			  
					</tr> 	 	
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Porcentaje  cuotas Reestructurado para aplicar Modelo Referencia :</div></td>
						<td nowrap height="19"> 
							<div align="left">
								<input type="text" name="E02CNOSCG" size="4" maxlength="2" value="<%= refCodes.getE02CNOSCG() %>" onKeypress="enterInteger(event)" >								
							</div>
						</td>			  
					</tr> 	 			  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Porcentaje Cálculo PNR :</div></td>
						<td nowrap height="19"> 
							<div align="left">
								<input type="text" name="E02CNOBRN" size="4" maxlength="3" value="<%= refCodes.getE02CNOBRN() %>" onKeypress="enterInteger(event)" >								
							</div>
						</td>			  
					</tr> 	 			  					
					<% } else if (refCodes.getE02CNOCFL().trim().equals("K1")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Tipo de Incumplimiento:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="radio" name="E02CNOF01" value="2" <%if(refCodes.getE02CNOF01().equals("2")) out.print("checked");%>>Castigos
								<input type="radio" name="E02CNOF01" value="3" <%if(refCodes.getE02CNOF01().equals("3")) out.print("checked");%>>Manual                  
								<input type="radio" name="E02CNOF01" value="4" <%if(refCodes.getE02CNOF01().equals("4")) out.print("checked");%>>Reestructuracion
								<input type="radio" name="E02CNOF01" value="6" <%if(refCodes.getE02CNOF01().equals("6")) out.print("checked");%>>Judicial
								<input type="radio" name="E02CNOF01" value="7" <%if(refCodes.getE02CNOF01().equals("7")) out.print("checked");%>>Morosidad                  
							</div>
						</td>
					</tr>                 
					<% } else if (refCodes.getE02CNOCFL().trim().equals("K6")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Prestamos desembolsados a Partir de DDMMAAAA: </div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNODCC" size="4" maxlength="2" value="<%= refCodes.getE02CNODCC() %>" onKeypress="enterInteger(event)" >
								<input type="text" name="E02CNOACD" size="4" maxlength="2" value="<%= refCodes.getE02CNOACD() %>" onKeypress="enterInteger(event)" >
								<input type="text" name="E02CNOCPC" size="6" maxlength="4" value="<%= refCodes.getE02CNOCPC() %>" onKeypress="enterInteger(event)" >        
							</div>
						</td>
					</tr>   
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Plazo:</div></td>
						<td nowrap height="19"> 
							<div align="left">
								<input type="text" name="E02CNOPXT" size="4" maxlength="3" value="<%= refCodes.getE02CNOPXT() %>" onKeypress="enterInteger(event)" >                
							</div>
						</td>
					</tr>                 
					<% } else if (refCodes.getE02CNOCFL().trim().equals("K7") || refCodes.getE02CNOCFL().trim().equals("K8")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Porcentaje :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOCHG" size="10" maxlength="10" value="<%= refCodes.getE02CNOCHG() %>" onKeypress="enterDecimal(event, 6)" >
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="center">Tiempo de Mora del Credito, en Días</div></td>
						<td nowrap height="19"><div align="left"></div></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Desde :</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOPHN" size="6" maxlength="5" value="<%= refCodes.getE02CNOPHN() %>" onKeypress="enterInteger(event)" >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Hasta :</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOSCG" size="6" maxlength="5" value="<%= refCodes.getE02CNOSCG() %>" onKeypress="enterInteger(event)" >
						</td>
					</tr>       
<% } else if (refCodes.getE02CNOCFL().trim().equals("KA")) {%>
		 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Fecha Prestamos Circular 013 desembolsados a Partir de DDMMAAAA:                  </div>
              </td>
              <td nowrap height="19"> 
                <div align="left"> 
                <input type="text" name="E02CNODCC" size="4" maxlength="2" value="<%= refCodes.getE02CNODCC() %>" onKeypress="enterInteger(event)" >
                <input type="text" name="E02CNOACD" size="4" maxlength="2" value="<%= refCodes.getE02CNOACD() %>" onKeypress="enterInteger(event)" >
                <input type="text" name="E02CNOCPC" size="6" maxlength="4" value="<%= refCodes.getE02CNOCPC() %>" onKeypress="enterInteger(event)" >				
                </div>
              </td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Tipo de Garantia SFC a Trabajar por Desembolso Menor a la Fecha Estipulada:
                  </div>
              </td>
              <td nowrap height="19"> 
                <div align="left">
				  <input type="text" name="E02CNOSUP" size="5" maxlength="2" value="<%= refCodes.getE02CNOSUP() %>" >
			    <a href="javascript:GetCodeDescCNOFC('E02CNOSUP',' ','K5')" >
			    <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 						
                </div>
              </td>
          </tr> 			  		
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Tipo de Garantia SFC a Trabajar por Desembolso Mayor o Igual a la Fecha Estipulada:
                  </div>
              </td>
              <td nowrap height="19"> 
                <div align="left">
				  <input type="text" name="E02CNOAPC" size="5" maxlength="2" value="<%= refCodes.getE02CNOAPC() %>" >
			    <a href="javascript:GetCodeDescCNOFC('E02CNOAPC',' ','K5')" >
			    <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 						
                </div>
              </td>
          </tr>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Dias de Mora a Evaluar Coodeudores o Avalistas:
                  </div>
              </td>
              <td nowrap height="19"> 
                <div align="left">
                  <input type="text" name="E02CNOPXT" size="6" maxlength="5" value="<%= refCodes.getE02CNOPXT() %>" onKeypress="enterInteger(event)" >								
                </div>
              </td>
          </tr> 	
<% } else if (refCodes.getE02CNOCFL().trim().equals("KB")) {%>
		 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Fecha Prestamos Circular C007 desembolsados a Partir de DDMMAAAA:                  </div>
              </td>
              <td nowrap height="19"> 
                <div align="left"> 
                <input type="text" name="E02CNODCC" size="4" maxlength="2" value="<%= refCodes.getE02CNODCC() %>" onKeypress="enterInteger(event)" >
                <input type="text" name="E02CNOACD" size="4" maxlength="2" value="<%= refCodes.getE02CNOACD() %>" onKeypress="enterInteger(event)" >
                <input type="text" name="E02CNOCPC" size="6" maxlength="4" value="<%= refCodes.getE02CNOCPC() %>" onKeypress="enterInteger(event)" >				
                </div>
              </td>
          </tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Calcula Componente Contra-Cíclico Consumo:
                  </div>
              </td>
              <td nowrap height="19"> 
			               <div align="left"> 
								<input type="radio" name="E02CNOF01" value="Y" <%if (!refCodes.getE02CNOF01().equals("N")) out.print("checked"); %> >Si 
								<input type="radio" name="E02CNOF01" value="N" <%if (refCodes.getE02CNOF01().equals("N")) out.print("checked"); %>>No 
							</div>
              </td>
          </tr> 			  		
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap width="16%" height="19"> 
                <div align="right">Calcula Componente Contra-Cíclico Comercial:
                  </div>
              </td>
              <td nowrap height="19"> 
                			      <div align="left"> 
								<input type="radio" name="E02CNOF03" value="Y" <%if (!refCodes.getE02CNOF03().equals("N")) out.print("checked"); %> >Si 
								<input type="radio" name="E02CNOF03" value="N" <%if (refCodes.getE02CNOF03().equals("N")) out.print("checked"); %>>No 
							</div>
              </td>
          </tr>
	  
					<% } else if (refCodes.getE02CNOCFL().trim().equals("38")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Calculo Impuesto :</div></td>
						<td nowrap height="19"> 
							<input type="radio" name="E02CNOIVA" value="Y" <%if(refCodes.getE02CNOIVA().equals("Y")) out.print("checked");%>>S&iacute; 
							<input type="radio" name="E02CNOIVA" value="N" <%if(refCodes.getE02CNOIVA().equals("N")) out.print("checked");%>>No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Destinación Específica :</div></td>
						<td nowrap height="19"> 
							<input type="radio" name="E02CNOF01" value="Y" <%if(refCodes.getE02CNOF01().equals("Y")) out.print("checked");%>>S&iacute; 
							<input type="radio" name="E02CNOF01" value="N" <%if(refCodes.getE02CNOF01().equals("N")) out.print("checked");%>>No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Valor Referencial :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text name="refCodes" property="E02CNOCHG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("I1")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Valor Referencial :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOCHG" size="16" maxlength="15" value="<%= refCodes.getE02CNOCHG() %>" onKeypress="enterDecimal(event, 6)" >
							</div>
						</td>
					</tr>
					<!-- NC - Novedades de Convenios -->
					<% } else if (refCodes.getE02CNOCFL().trim().equals("NC")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Procesa en Reportes :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="radio" name="E02CNOF01" value="Y" <%if (refCodes.getE02CNOF01().equals("Y")) out.print("checked"); %> >Si 
								<input type="radio" name="E02CNOF01" value="N" <%if (!refCodes.getE02CNOF01().equals("Y")) out.print("checked"); %>>No 
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Marca Fecha Exclusion :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="radio" name="E02CNOF03" value="Y" <%if (refCodes.getE02CNOF03().equals("Y")) out.print("checked"); %> >Si 
								<input type="radio" name="E02CNOF03" value="N" <%if (!refCodes.getE02CNOF03().equals("Y")) out.print("checked"); %>>No 
							</div>
						</td>
					</tr>
					<!-- AS - CONCURSO ACREEDORES -->
					<% } else if (refCodes.getE02CNOCFL().trim().equals("AS")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Predeterminado :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="radio" name="E02CNOF01" value="Y" <%if (refCodes.getE02CNOF01().equals("Y"))  out.print("checked"); %> >Si 
								<input type="radio" name="E02CNOF01" value="N" <%if (!refCodes.getE02CNOF01().equals("Y")) out.print("checked"); %> >No 
							</div>
						</td>
					</tr>
					<!-- AI - ACUERDO INFORMATIVO -->
					<% } else if (refCodes.getE02CNOCFL().trim().equals("AI")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Predeterminado :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="radio" name="E02CNOF01" value="Y" <%if (refCodes.getE02CNOF01().equals("Y"))  out.print("checked"); %> >Si 
								<input type="radio" name="E02CNOF01" value="N" <%if (!refCodes.getE02CNOF01().equals("Y")) out.print("checked"); %> >No 
							</div>
						</td>
					</tr>
					<!-- RY - TIPO REESTRUCTURACION -->
					<% } else if (refCodes.getE02CNOCFL().trim().equals("RY")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Predeterminado :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="radio" name="E02CNOF01" value="Y" <%if (refCodes.getE02CNOF01().equals("Y"))  out.print("checked"); %> >Si 
								<input type="radio" name="E02CNOF01" value="N" <%if (!refCodes.getE02CNOF01().equals("Y")) out.print("checked"); %> >No 
							</div>
						</td>
					</tr>
					<!-- RO CONDICION REESTRUCTURACION-->
					<% } else if (refCodes.getE02CNOCFL().trim().equals("RO")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Predeterminado :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="radio" name="E02CNOF01" value="Y" <%if (refCodes.getE02CNOF01().equals("Y"))  out.print("checked"); %> >Si 
								<input type="radio" name="E02CNOF01" value="N" <%if (!refCodes.getE02CNOF01().equals("Y")) out.print("checked"); %> >No 
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("RE")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">N&uacute;mero de Cuenta :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOSCG" size="20" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
								<a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,document.forms[0].E02CNOSCY.value,'')"> 
								<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Producto Remanentes :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:text name="refCodes" property="E02CNOUS1"  eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false"/>
								<eibsinput:text name="refCodes" property="E02DSCUS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
								<a href="javascript:GetProduct('E02CNOUS1','97','','E02DSCUS1')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="absbottom" border="0" ></a> 
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("V3")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Codigo de Retencion en la Fuente :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOUS1" size="5" maxlength="4" value="<%= refCodes.getE02CNOUS1().trim()%>">
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Cuenta Contable de Gasto :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOSCG" size="20" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
								<a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,'COP','')"> 
								<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="absbottom" border="0" ></a>
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("TL")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Moneda :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:help name="refCodes" property="E02CNOSCY" required="true" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E02CNOSCY" fn_param_two="<%=currUser.getE01UBK() %>"/>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Cuenta Contable :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<eibsinput:help name="refCodes" property="E02CNOSCG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" required="true" fn_param_one="E02CNOSCG" fn_param_two="<%= currUser.getE01UBK() %>" fn_param_three="document.forms[0].E02CNOSCY.value" />
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("CV")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19">  
							<div align="right">Indicativo en Cuota Prestamo: <br>
								D=Cuota Desistida, <br>P=Perdida Aval, <br>V=Devolucion Ente:
							</div>
						</td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOF03" size="3" maxlength="1" value="<%= refCodes.getE02CNOF03().trim()%>">
							</div>
						</td>
					</tr> 
					<% } else if (refCodes.getE02CNOCFL().trim().equals("Z3")) {%>
					<tr id="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>"> 
						<td nowrap width="16%" height="19" align="right">Largo M&iacute;nimo Identificaci&oacute;n :</td>
						<td nowrap height="19" align="left">
							<input type="text" name="E02CNOPXT" size="6" maxlength="4" value="<%= refCodes.getE02CNOPXT() %>" onKeypress="enterDecimal(event)" >
						</td>
					</tr>
					<tr id="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>"> 
						<td nowrap width="16%" height="19" align="right">Largo M&aacute;ximo Identificaci&oacute;n :</td>
						<td nowrap height="19" align="left">
							<input type="text" name="E02CNOBRN" size="6" maxlength="4" value="<%= refCodes.getE02CNOBRN() %>" onKeypress="enterDecimal(event)" >
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("Z4")) {%>
					<tr id="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>"> 
						<td nowrap width="16%" height="19" align="right">Identificaci&oacute;n no Valida :</td>
						<td nowrap height="19" align="left">
							<input type="text" name="E02CNORUT" size="24" maxlength="25" value="<%= refCodes.getE02CNORUT() %>">
						</td>
					 </tr>                  
					<% } else {%>
					<%   if (nroRef) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">N&uacute;mero de Referencia :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
							</div>
						</td>
					</tr>
					<%   }%>
					<% }%>
					
					<!-- COLOMBIA -->
					<% if (currUser.getE01INT().trim().equals("05")) {%>
					<%   if (refCodes.getE02CNOCFL().trim().equals("Y9")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Tipo de Gestor de Cobranzas :</td>
						<td nowrap width="34%" align="left">
							<select name="E02CNOCPC">
								<option value=" " <% if (!(refCodes.getE02CNOCPC().equals("1") ||refCodes.getE02CNOCPC().equals("2"))) out.print("selected"); %>>Agente Interno</option>
								<option value="1" <% if(refCodes.getE02CNOCPC().equals("1")) out.print("selected");%>>Agente Externo</option>
								<option value="2" <% if(refCodes.getE02CNOCPC().equals("2")) out.print("selected");%>>Otros</option>
							</select>
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Identificaci&oacute;n Gestor :</td>
						<td nowrap width="34%" align="left">
							<input type="text" name="E02CNORUT" size="28" maxlength="25" value="<%= refCodes.getE02CNORUT().trim()%>" >
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Cuenta Contable Asociada :</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%= refCodes.getE02CNOSCG().trim()%>">
								<a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,'','')"> 
								<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
							</div>
						</td>
					</tr>
					<%   }%>
					<%   if (refCodes.getE02CNOCFL().trim().equals("RN")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Códigos para Bancoldex: </td>
						<td nowrap width="34%" align="left">
							<select name="E02CNOF07">
								<option value="0"  <% if (refCodes.getE02CNOF07().equals("0"))  out.print("selected"); %>> Persona Natural</option>
								<option value="1"  <% if (refCodes.getE02CNOF07().equals("1"))  out.print("selected"); %>> Sociedad Privada Nac.</option>
								<option value="2"  <% if (refCodes.getE02CNOF07().equals("2"))  out.print("selected"); %>> Entidad y Org. Público Nacional</option>
								<option value="3"  <% if (refCodes.getE02CNOF07().equals("3"))  out.print("selected"); %>> Empresa Ind. y Cial. del estado</option>
								<option value="4"  <% if (refCodes.getE02CNOF07().equals("4"))  out.print("selected"); %>> Sociedad de Economía Mixta</option>
								<option value="5"  <% if (refCodes.getE02CNOF07().equals("5"))  out.print("selected"); %>> Sociedad Privada Extranjera</option>
								<option value="6"  <% if (refCodes.getE02CNOF07().equals("6"))  out.print("selected"); %>> Sociedad Multinacional</option>
								<option value="7"  <% if (refCodes.getE02CNOF07().equals("7"))  out.print("selected"); %>> Soc. Extranj. sin NIT en Colombia</option>
								<option value="8"  <% if (refCodes.getE02CNOF07().equals("8"))  out.print("selected"); %>> Sociedad  sin ánimo de lucro</option>
								<option value="9"  <% if (refCodes.getE02CNOF07().equals("9"))  out.print("selected"); %>> Sociedad Cooperativa</option>
								<option value="10" <% if (refCodes.getE02CNOF07().equals("10")) out.print("selected"); %>> Entidad Pública Extranjera</option>
								<option value="11" <% if (refCodes.getE02CNOF07().equals("11")) out.print("selected"); %>> Sociedad Ltda.</option>
								<option value="12" <% if (refCodes.getE02CNOF07().equals("12")) out.print("selected"); %>> Sociedad Anónima</option>
							</select>
						</td>
					</tr> 
					<%   }%>
					<%   if (refCodes.getE02CNOCFL().trim().equals("29")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Códigos para Bancoldex: </td>
						<td nowrap width="34%" align="left">
							<select name="E02CNOF07">
								<option value=" " <% if (refCodes.getE02CNOF07().equals(" ")) out.print("selected"); %>>No Aplica</option>
								<option value="1" <% if (refCodes.getE02CNOF07().equals("1")) out.print("selected"); %>>1 - No lee ni escribe</option>
								<option value="2" <% if (refCodes.getE02CNOF07().equals("2")) out.print("selected"); %>>2 - Sabe leer y escribir</option>
								<option value="3" <% if (refCodes.getE02CNOF07().equals("3")) out.print("selected"); %>>3 - Primaria</option>
								<option value="4" <% if (refCodes.getE02CNOF07().equals("4")) out.print("selected"); %>>4 - Secundaria</option>
								<option value="5" <% if (refCodes.getE02CNOF07().equals("5")) out.print("selected"); %>>5 - Universitario</option>
								<option value="6" <% if (refCodes.getE02CNOF07().equals("6")) out.print("selected"); %>>6 - Postgrado</option>
							</select>
						</td>
					</tr> 
					<%   }%>
					<%   if (refCodes.getE02CNOCFL().trim().equals("DF")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Códigos para Bancoldex: </td>
						<td nowrap width="34%" align="left">
							<select name="E02CNOF07">
								<option value="0" <% if (refCodes.getE02CNOF07().equals("0")) out.print("selected"); %>>0 - No Aplica</option>
								<option value="1" <% if (refCodes.getE02CNOF07().equals("1")) out.print("selected"); %>>1 - Capital de trabajo</option>
								<option value="2" <% if (refCodes.getE02CNOF07().equals("2")) out.print("selected"); %>>2 - Inversion Fija</option>
								<option value="3" <% if (refCodes.getE02CNOF07().equals("3")) out.print("selected"); %>>3 - Capitalización Empresarial</option>
								<option value="4" <% if (refCodes.getE02CNOF07().equals("4")) out.print("selected"); %>>4 - Asistencia Técnica</option>
								<option value="5" <% if (refCodes.getE02CNOF07().equals("5")) out.print("selected"); %>>5 - Capacitación</option>
								<option value="6" <% if (refCodes.getE02CNOF07().equals("6")) out.print("selected"); %>>6 - Adquisición de Activos</option>
							</select>
						</td>
					</tr> 
					<%   }%>
					<% }%>
			 
					<% if (currUser.getE01INT().trim().equals("11")) {%>
					<%   if (refCodes.getE02CNOCFL().trim().equals("Y9")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Moneda de Control de Morosidad:</div></td>
						<td nowrap height="19"> 
							<eibsinput:help name="refCodes" property="E02CNOSCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E02CNOSCY" fn_param_two="<%=currUser.getE01UBK() %>"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Ciclo de Control de Morosidad:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<select name="E02CNOF04">
									<option value="N" <% if (!(refCodes.getE02CNOF04().equals("D") ||refCodes.getE02CNOF04().equals("W")||refCodes.getE02CNOF04().equals("M")||refCodes.getE02CNOF04().equals("Q")||refCodes.getE02CNOF04().equals("S")||refCodes.getE02CNOF04().equals("Y"))) out.print("selected"); %>> No Aplica</option>
									<option value="D" <% if(refCodes.getE02CNOF04().equals("D")) out.print("selected");%>>Diario</option>
									<option value="W" <% if(refCodes.getE02CNOF04().equals("W")) out.print("selected");%>>Semanal</option>
									<option value="M" <% if(refCodes.getE02CNOF04().equals("M")) out.print("selected");%>>Mensual</option>
									<option value="Q" <% if(refCodes.getE02CNOF04().equals("Q")) out.print("selected");%>>Trimestral</option>
									<option value="S" <% if(refCodes.getE02CNOF04().equals("S")) out.print("selected");%>>Semestral</option>
									<option value="Y" <% if(refCodes.getE02CNOF04().equals("Y")) out.print("selected");%>>Anual</option>
								</select>
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Monto Total de Morosidad:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOCHG" size="16" maxlength="15" value="<%= refCodes.getE02CNOCHG() %>" onKeypress="enterDecimal(event, 2)" >
							</div>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Porcentaje Total de Morosidad:</div></td>
						<td nowrap height="19"> 
							<div align="left"> 
								<input type="text" name="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST() %>" onKeypress="enterDecimal(event, 2)" >
							</div>
						</td>
					</tr>
					<%   } %>
					<%   if (refCodes.getE02CNOCFL().trim().equals("9I"))  {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Riesgo del Cr&eacute;dito:</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST() %>" onKeypress="enterDecimal(event, 2)" >
						</td>
					</tr>  
					<%   } %>
					<%   if (refCodes.getE02CNOCFL().trim().equals("8E")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Reserva:</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOACS" size="8" maxlength="7" value="<%= refCodes.getE02CNOACS() %>" onKeypress="enterDecimal(event, 2)" >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">   
						<td nowrap width="16%" height="19"><div align="right">D&iacute;as Mora Hasta:</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOFRP" size="6" maxlength="5" value="<%= refCodes.getE02CNOFRP() %>" onKeypress="enterInteger(event)" >
						</td>
					</tr> 
					<%   } %>
					<%   if (refCodes.getE02CNOCFL().trim().equals("10")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19"><div align="right">C&oacute;digo de Agencia:</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOBRN" size="5" maxlength="4" value="<%= refCodes.getE02CNOBRN() %>" onKeypress="enterInteger(event)" >
							<a href="javascript:GetBranch('E02CNOBRN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
						</td>
					</tr> 
					<%   } %>
					<% } %>    
			
					<% if (refCodes.getE02CNOCFL().trim().equals("FU")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Aplica para Estado del Cliente :</td>
						<td nowrap width="34%" align="left">
							<select name="E02CNOCPC">
								<option value="T" <% if (!(refCodes.getE02CNOCPC().equals("1") ||refCodes.getE02CNOCPC().equals("2")||refCodes.getE02CNOCPC().equals("3"))) out.print("selected"); %>>Todos</option>
								<option value="1" <% if(refCodes.getE02CNOCPC().equals("1")) out.print("selected");%>>Inactivo</option>
								<option value="2" <% if(refCodes.getE02CNOCPC().equals("2")) out.print("selected");%>>Activo</option>
								<option value="3" <% if(refCodes.getE02CNOCPC().equals("3")) out.print("selected");%>>Bloqueado</option>
							</select>
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Estado de la Causal :</td>
						<td nowrap width="34%" align="left">
							<select name="E02CNOIVA">
								<option value="A" <%if (refCodes.getE02CNOIVA().equals("A")) { out.print("selected"); }%>>Activo</option>
								<option value="I" <%if (!refCodes.getE02CNOIVA().equals("A")) { out.print("selected"); }%>>Inactivo</option> 
							</select>  
						</td>
					</tr> 
					<% } %>
					<% if (refCodes.getE02CNOCFL().trim().equals("31") )    {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Desde Calificación :</td>
						<td nowrap width="34%" align="left">
							<eibsinput:text name="refCodes" property="E02CNOMNC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" maxlength="6"/>
							(0 - 100)
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Hasta Calificación :</td>
						<td nowrap width="34%" align="left">
							<eibsinput:text name="refCodes" property="E02CNOMXC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" maxlength="6"/>
							(0 - 100)
						</td>
					</tr> 
					<% } %>
					<% if (refCodes.getE02CNOCFL().trim().equals("NI")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" align="right">Aplica solo a Gran Contribuyente :</td>
						<td nowrap width="34%" align="left">
							<input type="radio" name="E02CNOPAF" value="Y" <%if (refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %> >Si 
							<input type="radio" name="E02CNOPAF" value="N" <%if (!refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %>>No 
						</td>  
					</tr> 
					<% }%>
					<% if (refCodes.getE02CNOCFL().trim().equals("M1")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" align="right">Requiere Grupo de Moneda Extranjera :</td>
						<td nowrap width="34%" align="left">
							<input type="radio" name="E02CNOPAF" value="Y" <%if (refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %> >Si 
							<input type="radio" name="E02CNOPAF" value="N" <%if (!refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %>>No 
						</td>  
					</tr> 
					<% }%>
					<% if (refCodes.getE02CNOCFL().trim().equals("18")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" align="right">Cobrar GMF :</td>
						<td nowrap width="34%" align="left">
							<input type="radio" name="E02CNOPAF" value="Y" <%if (refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %> >Si 
							<input type="radio" name="E02CNOPAF" value="N" <%if (!refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %>>No 
						</td>  
					</tr> 
					<% }%>
					<%  if (refCodes.getE02CNOCFL().trim().equals("M2")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" align="right">País :</td>
						<td nowrap width="34%" align="left">
							<eibsinput:cnofc name="refCodes" property="E02CNOCPC" value="<%= refCodes.getE02CNOCPC() %>"  maxlength="2" required="false" flag="03" fn_code="E02CNOCPC" fn_description="" readonly="false" />
						</td>  
					</tr> 
					<% }%>
					<% if (refCodes.getE02CNOCFL().trim().equals("M1") || refCodes.getE02CNOCFL().trim().equals("M2")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Estado :</td>
						<td nowrap width="34%" align="left">
							<select name="E02CNOIVA">
								<option value="A" <%if (refCodes.getE02CNOIVA().equals("A")) { out.print("selected"); }%>>Activo</option>
								<option value="I" <%if (!refCodes.getE02CNOIVA().equals("A")) { out.print("selected"); }%>>Inactivo</option> 
							</select>  
						</td>
					</tr> 
					<% } %>   
					<% if (refCodes.getE02CNOCFL().trim().equals("MR") || (refCodes.getE02CNOCFL().trim().equals("W1") ))   { %>  
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Mínimo :</td>
						<td nowrap width="34%" align="left">
							<eibsinput:text name="refCodes" property="E02CNOMNC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" maxlength="6"/>
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="16%" height="19" align="right">Máximo :</td>
						<td nowrap width="34%" align="left">
							<eibsinput:text name="refCodes" property="E02CNOMXC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" maxlength="6"/>
						</td>
					</tr> 
					<% } %>
					<% if (refCodes.getE02CNOCFL().trim().equals("SP")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Banca :</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOCPC" size="5" maxlength="4" value="<%= refCodes.getE02CNOCPC() %>" >
							<a href="javascript:GetCodeDescCNOFC('E02CNOCPC',' ','2E')" >
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">   
						<td nowrap width="16%" height="19"><div align="right">Naturaleza :</div></td>
						<td nowrap height="19"> 
							<select name="E02CNOADI">
								<option value=" " <% if(refCodes.getE02CNOADI().equals(" ")) out.print("selected");%>>Ambos</option>
								<option value="1" <% if(refCodes.getE02CNOADI().equals("1")) out.print("selected");%>>Juridica</option>
								<option value="2" <% if(refCodes.getE02CNOADI().equals("2")) out.print("selected");%>>Natural</option>
							</select>
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Control :</div></td>
						<td nowrap height="19"> 
							<input type="radio" name="E02CNOPAF" value="Y" <%if(refCodes.getE02CNOPAF().equals("Y")) out.print("checked");%>>S&iacute; 
							<input type="radio" name="E02CNOPAF" value="N" <%if(refCodes.getE02CNOPAF().equals("N")) out.print("checked");%>>No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Porcentaje Cupo:</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOCST" size="8" maxlength="7" value="<%= refCodes.getE02CNOCST() %>" onKeypress="enterDecimal(event, 3)" >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">   
						<td nowrap width="16%" height="19"><div align="right">Monto Máximo :</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOMXC" size="14" maxlength="13" value="<%= refCodes.getE02CNOMXC() %>" onKeypress="enterDecimal(event, 2)" >
						</td>
					</tr> 
					<% } %>
					<% if (refCodes.getE02CNOCFL().trim().equals("SG") && (refCodes.getE02CNORCD().trim().equals("1") || refCodes.getE02CNORCD().trim().equals("2") || refCodes.getE02CNORCD().trim().equals("3"))) { %>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Rango M&iacute;nimo (SMMLV):</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOMNC" size="18" maxlength="17" value="<%= refCodes.getE02CNOMNC() %>" onKeypress="enterDecimal(event, 2)" >
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Rango M&aacute;ximo (SMMLV):</div></td>
						<td nowrap height="19"> 
							<input type="text" name="E02CNOMXC" size="18" maxlength="17" value="<%= refCodes.getE02CNOMXC() %>" onKeypress="enterDecimal(event, 2)" >
						</td>
					</tr>
					<% } %>
					<% if (refCodes.getE02CNOCFL().trim().equals("14")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">   
						<td nowrap width="16%" height="19"><div align="right">Moneda de Apertura :</div></td>
						<td nowrap height="19"> 
							<select name="E02CNOADI">
								<option value=" " <% if(refCodes.getE02CNOADI().equals(" ")) out.print("selected");%>>Moneda de Apertura</option>
								<option value="1" <% if(refCodes.getE02CNOADI().equals("1")) out.print("selected");%>>SMMLV</option>
							</select>
						</td>
					</tr> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">M&iacute;nimo :</div></td>
						<td nowrap height="19"> 
							<eibsinput:text name="refCodes" property="E02CNOMNC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" maxlength="6"/>
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">M&aacute;ximo :</div></td>
						<td nowrap height="19"> 
							<eibsinput:text name="refCodes" property="E02CNOMXC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" maxlength="6"/>
						</td>
					</tr>
					<% }%>
					<%  if (refCodes.getE02CNOCFL().trim().equals("27")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Codigo de Pais :</div></td>
						<td nowrap height="19"> 
							<eibsinput:cnofc name="refCodes" property="E02CNOCPC" value="<%= refCodes.getE02CNOCPC() %>"  required="false" flag="03" fn_code="E02CNOCPC" fn_description="" readonly="false" />
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("84") || refCodes.getE02CNOCFL().trim().equals("85")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"> 
					<%   if (currUser.getE01INT().trim().equals("05")) {%>
							<div align="right">Codigo de Departamento :</div>
					<%   } else {%>
							<div align="right">Codigo de Estado :</div>
					<%   } %>
						</td>
						<td nowrap height="19"> 
							<eibsinput:cnofc name="refCodes" property="E02CNOMIC" value="<%= refCodes.getE02CNOMIC() %>"  required="false" flag="27" fn_code="E02CNOMIC" fn_description="" readonly="false" />
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("RS")) {%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Pagar&eacute; preimpreso :</div></td>
						<td nowrap height="19"> 
							<input type="radio" name="E02CNOF01" value="Y" <%if(refCodes.getE02CNOF01().equals("Y")) out.print("checked");%>>S&iacute; 
							<input type="radio" name="E02CNOF01" value="N" <%if(refCodes.getE02CNOF01().equals("N")) out.print("checked");%>>No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19"><div align="right">Redescuento :</div></td>
						<td nowrap height="19"> 
							<input type="radio" name="E02CNOF03" value="Y" <%if(refCodes.getE02CNOF03().equals("Y")) out.print("checked");%> onClick="javascript:updateRedescuento();">S&iacute; 
							<input type="radio" name="E02CNOF03" value="N" <%if(refCodes.getE02CNOF03().equals("N")) out.print("checked");%> onClick="javascript:updateRedescuento();">No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19" id="c3" style="display: block"><div align="right">Lista Entidad de Redescuento :</div></td>
						<td nowrap height="19" id="c4" style="display: block"> 
							<div align="left"> 
								<eibsinput:text name="refCodes" property="E02CNOUS2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="false" />
								<a href="javascript:GetFomento('E02CNOUS2','0','','E02DSCUS2')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" ></a>
								<eibsinput:text name="refCodes" property="E02DSCUS2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("TB")) {%>         
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19" align="right">Multi Oficina : </td>
						<td nowrap height="19"> 
							<input type="radio" name="E02CNOPAF" value="Y" <%if(refCodes.getE02CNOPAF().equals("Y")) out.print("checked");%>>Sí 
							<input type="radio" name="E02CNOPAF" value="N" <%if(refCodes.getE02CNOPAF().equals("N")) out.print("checked");%>>No
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19" align="right">Zonificar : </td>
						<td nowrap height="19"> 
							<input type="radio" name="E02CNOADI" value="Y" <%if(refCodes.getE02CNOADI().equals("Y")) out.print("checked");%>>Sí 
							<input type="radio" name="E02CNOADI" value="N" <%if(refCodes.getE02CNOADI().equals("N")) out.print("checked");%>>No
						</td>
					</tr>
					<% } else if (refCodes.getE02CNOCFL().trim().equals("LC")) {%>         
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19" align="right">Región Comercial : </td>
						<td nowrap height="19"> 
							<eibsinput:cnofc name="refCodes" property="E02CNOUS1" value="<%= refCodes.getE02CNOUS1() %>"  maxlength="2" required="true" flag="TG" fn_code="E02CNOUS1" fn_description="" readonly="false" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19" align="right">Estado : </td>
						<td nowrap height="19"> 
							<select name="E02CNOIVA" id="E02CNOIVA">
								<option value=" " <% if (!(refCodes.getE02CNOIVA().equals("A")||refCodes.getE02CNOIVA().equals("I"))) out.print("selected"); %> ></option>
								<option value="A" <% if (refCodes.getE02CNOIVA().equals("A")) out.print("selected"); %>>Activo</option>
								<option value="I" <% if (refCodes.getE02CNOIVA().equals("I")) out.print("selected"); %>>Inactivo</option>                   
							</select>
						</td>
					</tr>         
					<% } else if (refCodes.getE02CNOCFL().trim().equals("TG")) {%>         
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
						<td nowrap width="16%" height="19" align="right">Estado : </td>
						<td nowrap height="19"> 
							<select name="E02CNOIVA" id="E02CNOIVA">
								<option value=" " <% if (!(refCodes.getE02CNOIVA().equals("A")||refCodes.getE02CNOIVA().equals("I"))) out.print("selected"); %>></option>
								<option value="A" <% if (refCodes.getE02CNOIVA().equals("A")) out.print("selected"); %>>Activo</option>
								<option value="I" <% if (refCodes.getE02CNOIVA().equals("I")) out.print("selected"); %>>Inactivo</option>                   
							</select>
						</td>
					</tr>         
					<% }%>         
				</table>
			</td>
		</tr>
	</table>
	
	<table width="100%">    
		<tr>
			<td width="50%" align="center">
				<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(600);">
			</td>
			<td width="50%" align="center">
				<input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(400);">
			</td>
		</tr>  
	</table>  

</form>

<% if (refCodes.getE02CNOCFL().trim().equals("RS")) { %>
<SCRIPT type="text/javascript">
	updateRedescuento();          
</SCRIPT>
<% } %>

</body>
</html>
