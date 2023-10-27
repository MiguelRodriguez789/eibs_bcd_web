<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script language="JavaScript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	
	if (op == 600) {
		getElement("E02CNOMID").value = getElement("G1").value +
										getElement("G2").value +
										getElement("G3").value + 
										getElement("G4").value +
										getElement("G5").value + 'X';
		getElement("E02CNOEML").value = pad(getElement("RI3").value, 11, 0) +
										pad(getElement("RF3").value, 11, 0) +
										pad(getElement("RI4").value, 11, 0) +
										pad(getElement("RF4").value, 11, 0); 
		getElement("E02CNORUT").value = pad(getElement("RI5").value, 11, 0) +
										pad(getElement("RF5").value, 11, 0);
		getElement("E02CNOSCG").value = pad(getElement("RI1").value, 11, 0);
		getElement("E02CNOMXC").value = pad(getElement("RF1").value, 11, 0);
		getElement("E02CNOMNC").value = pad(getElement("RI2").value, 11, 0);
		getElement("E02CNOPHN").value = pad(getElement("RF2").value, 11, 0);
	}
	
	document.forms[0].submit();
}

function pad(n, width, z) {
  z = z || '0';
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

function dropDec() {
	getElement("RI1").value = pad(Math.floor(getElement("RI1").value), 11, 0);
    getElement("RF1").value = pad(Math.floor(getElement("RF1").value), 11, 0);
    getElement("RI2").value = pad(Math.floor(getElement("RI2").value), 11, 0);
    getElement("RF2").value = pad(Math.floor(getElement("RF2").value), 11, 0);
}
</script>

</head>
<body>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
 		if (refCodes.getE02CNOMID().equals("")) refCodes.setE02CNOMID("XXXXXX");  
 		if (refCodes.getE02CNOEML().equals("")) refCodes.setE02CNOEML("000000000000000000000000000000000000000000000000000000000000");
 		if (refCodes.getE02CNORUT().equals("")) refCodes.setE02CNORUT("0000000000000000000000");
 		int row = 0;
%>

<H3 align="center">Códigos de Referencia del Sistema - Tipos Identificación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cnof_id_type_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNOMID" value="<%= refCodes.getE02CNOMID()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNOEML" value="<%= refCodes.getE02CNOEML()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNORUT" value="<%= refCodes.getE02CNORUT()%>"> 
  <INPUT TYPE=HIDDEN NAME="E02CNOSCG" value="<%= refCodes.getE02CNOSCG()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNOMXC" value="<%= refCodes.getE02CNOMXC()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNOMNC" value="<%= refCodes.getE02CNOMNC()%>">
  <INPUT TYPE=HIDDEN NAME="E02CNOPHN" value="<%= refCodes.getE02CNOPHN()%>">
  <input type=HIDDEN name="E01CNOFLD" id="E01CNOFLD" value="<%= refCodes.getE02CNORCD().trim()%>">
  <input type=HIDDEN name="TABLECODE" id="TABLECODE" value="<%= refCodes.getE02CNOCFL().trim()%>">
   
  <h4>Información Básica</h4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" align="right">Clasificación : </td>
            <td nowrap width="34%" align="left"> 
               	<input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>" readonly >
            </td>
            <td nowrap width="16%" align="right"></td>
            <td nowrap width="34%" align="left"> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" align="right">Código : </td>
            <td nowrap width="34%" align="left">
            	<eibsinput:text name="refCodes" property="E02CNORCD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="true"/>
            	<eibsinput:text name="refCodes" property="E02CNODSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" />
            </td>
            <td nowrap width="16%" align="right">Estado : </td>
            <td nowrap width="34%" align="left">
            	<select name="E02CNOIVA">
                  <option value="A" <%if (refCodes.getE02CNOIVA().equals("A")) { out.print("selected"); }%>>Activo</option>
                  <option value="I" <%if (!refCodes.getE02CNOIVA().equals("A")) { out.print("selected"); }%>>Inactivo</option> 
                 </select> 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
          	<td nowrap width="16%" align="right">Tipo de Persona : </td>
            <td nowrap width="34%" align="left">
            	<select name="E02CNOF03">
                  <option value="" <%if (refCodes.getE02CNOF03().equals("")) { out.print("selected"); }%>>No Aplica</option>
                  <option value="1" <%if (refCodes.getE02CNOF03().equals("1")) { out.print("selected"); }%>>Jurídica</option>
                  <option value="2" <%if (refCodes.getE02CNOF03().equals("2")) { out.print("selected"); }%>>Natural</option>
                  <option value="3" <%if (refCodes.getE02CNOF03().equals("3")) { out.print("selected"); }%>>Otros</option>
                </select> 
            </td>
            <td nowrap width="16%" align="right">Digito de Verificación : </td>
            <td nowrap width="34%" align="left">
                <select name="E02CNOF01">
                  <option value="" <%if (refCodes.getE02CNOF01().equals("")) { out.print("selected"); }%>>No Aplica</option>
                  <option value="0" <%if (refCodes.getE02CNOF01().equals("0")) { out.print("selected"); }%>>Módulo 10</option>
                  <option value="1" <%if (refCodes.getE02CNOF01().equals("1")) { out.print("selected"); }%>>Módulo 11</option>
                  <option value="C" <%if (refCodes.getE02CNOF01().equals("C")) { out.print("selected"); }%>>Versión Chile RUT</option>
                </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%" align="right">Tipo de Residencia : </td>
            <td nowrap width="34%" align="left">
                <select name="E02CNODCB">
                  <option value=" " <%if (refCodes.getE02CNODCB().equals("")) { out.print("selected"); }%>>No Aplica</option>
                  <option value="R" <%if (refCodes.getE02CNODCB().equals("R")) { out.print("selected"); }%>>Residente</option>
                  <option value="N" <%if (refCodes.getE02CNODCB().equals("N")) { out.print("selected"); }%>>No Residente</option>
                </select>
            </td>
            <td nowrap width="16%" align="right">País : </td>
            <td nowrap width="34%" align="left">
            	<eibsinput:cnofc name="refCodes" property="E02CNOCPC" required="false" flag="03" fn_code="E02CNOCPC" />
            	(Blancos = No Aplica).
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="16%" align="right">Uso para : </td>
            <td nowrap width="34%" align="left">
                <select name="E02CNOF04">
                  <option value=" " <%if (refCodes.getE02CNOF04().equals("")) { out.print("selected"); }%>>No Aplica</option>
                  <option value="N" <%if (refCodes.getE02CNOF04().equals("N")) { out.print("selected"); }%>>Nacional</option>
                  <option value="E" <%if (refCodes.getE02CNOF04().equals("E")) { out.print("selected"); }%>>Extranjero</option>
                </select>
            </td>
            <td nowrap width="16%" align="right"></td>
            <td nowrap width="34%" align="left"> 
            </td>
          </tr>           
        </table> 
      </td>
    </tr>
  </table>
 
  <br>

 


<% if (currUser.getE01INT().equals("05")) {%>
 
  <H4>Validaciones para Persona Natural</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%" align="right">Rango de Edad : </td>
            <td nowrap align="left">
            	Desde <eibsinput:text name="refCodes" property="E02CNOPXT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="false" />
                Hasta <eibsinput:text name="refCodes" property="E02CNOCCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="false" />
                Años (Dejar en ceros si no aplica). 
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
            <td nowrap width="16%" align="right">Rango Numeración por Genero : <br>(Dejar en blanco y ceros si no aplica) </td>
            <td nowrap align="left">
				<table  class="tableinfo">
    			<tr > 
      			<td nowrap> 
        			<table cellspacing="0" cellpadding="2" width="100%" border="0">
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            				<th nowrap>Genero</th>
            				<th nowrap>Desde</th>
            				<th nowrap>Hasta</th>
       					</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            				<td nowrap align="center"> 
	              				<select name="G1">
	                			<option value="X" <% if (!(refCodes.getE02CNOMID().substring(0,1).equals("F") || refCodes.getE02CNOMID().substring(0,1).equals("M") || refCodes.getE02CNOMID().substring(0,1).equals("B"))) out.print("selected"); %>></option>
	                			<option value="M" <% if (refCodes.getE02CNOMID().substring(0,1).equals("M")) out.print("selected"); %>>Masculino</option>
	                			<option value="F" <% if (refCodes.getE02CNOMID().substring(0,1).equals("F")) out.print("selected"); %>>Femenino</option>
	                			<option value="B" <% if (refCodes.getE02CNOMID().substring(0,1).equals("B")) out.print("selected"); %>>Ambos</option>        
	              				</select>                
            				</td>
            				<td nowrap align="center"> 
              					<input type="text" name="RI1"  size="13" maxlength="11" onkeypress="enterInteger(event)">             
            				</td>
            				<td nowrap align="center"> 
 								<input type="text" name="RF1" size="13" maxlength="11" onkeypress="enterInteger(event)">              
            				</td>
                        </tr>
                        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            				<td nowrap align="center"> 
	              				<select name="G2">
	                			<option value="X" <% if (!(refCodes.getE02CNOMID().substring(1, 2).equals("F") || refCodes.getE02CNOMID().substring(1, 2).equals("M") || refCodes.getE02CNOMID().substring(1, 2).equals("B"))) out.print("selected"); %>></option>
	                			<option value="M" <% if (refCodes.getE02CNOMID().substring(1, 2).equals("M")) out.print("selected"); %>>Masculino</option>
	                			<option value="F" <% if (refCodes.getE02CNOMID().substring(1, 2).equals("F")) out.print("selected"); %>>Femenino</option>
	                			<option value="B" <% if (refCodes.getE02CNOMID().substring(1, 2).equals("B")) out.print("selected"); %>>Ambos</option>        
	              				</select>                
            				</td>
            				<td nowrap align="center"> 
              					<input type="text" name="RI2"  size="13" maxlength="11" onkeypress="enterInteger(event)">             
            				</td>
            				<td nowrap align="center"> 
 								<input type="text" name="RF2" size="13" maxlength="11" onkeypress="enterInteger(event)">              
            				</td>
                        </tr>
                        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            				<td nowrap align="center"> 
	              				<select name="G3">
	                			<option value="X" <% if (!(refCodes.getE02CNOMID().substring(2, 3).equals("F") || refCodes.getE02CNOMID().substring(2, 3).equals("M") || refCodes.getE02CNOMID().substring(2, 3).equals("B"))) out.print("selected"); %>></option>
	                			<option value="M" <% if (refCodes.getE02CNOMID().substring(2, 3).equals("M")) out.print("selected"); %>>Masculino</option>
	                			<option value="F" <% if (refCodes.getE02CNOMID().substring(2, 3).equals("F")) out.print("selected"); %>>Femenino</option>
	                			<option value="B" <% if (refCodes.getE02CNOMID().substring(2, 3).equals("B")) out.print("selected"); %>>Ambos</option>        
	              				</select>                
            				</td>
            				<td nowrap align="center"> 
              					<input type="text" name="RI3" value="<%= refCodes.getE02CNOEML().substring(0,11) %>" size="13" maxlength="11" onkeypress="enterInteger(event)">             
            				</td>
            				<td nowrap align="center"> 
 								<input type="text" name="RF3" value="<%= refCodes.getE02CNOEML().substring(11,22) %>" size="13" maxlength="11" onkeypress="enterInteger(event)">              
            				</td>
                        </tr>
                        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            				<td nowrap align="center"> 
	              				<select name="G4">
	                			<option value="X" <% if (!(refCodes.getE02CNOMID().substring(3, 4).equals("F") || refCodes.getE02CNOMID().substring(3, 4).equals("M") || refCodes.getE02CNOMID().substring(3, 4).equals("B"))) out.print("selected"); %>></option>
	                			<option value="M" <% if (refCodes.getE02CNOMID().substring(3, 4).equals("M")) out.print("selected"); %>>Masculino</option>
	                			<option value="F" <% if (refCodes.getE02CNOMID().substring(3, 4).equals("F")) out.print("selected"); %>>Femenino</option>
	                			<option value="B" <% if (refCodes.getE02CNOMID().substring(3, 4).equals("B")) out.print("selected"); %>>Ambos</option>        
	              				</select>                
            				</td>
            				<td nowrap align="center"> 
              					<input type="text" name="RI4" value="<%= refCodes.getE02CNOEML().substring(22,33) %>" size="13" maxlength="11" onkeypress="enterInteger(event)">             
            				</td>
            				<td nowrap align="center"> 
 								<input type="text" name="RF4" value="<%= refCodes.getE02CNOEML().substring(33,44) %>" size="13" maxlength="11" onkeypress="enterInteger(event)">              
            				</td>
                        </tr>
                        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            				<td nowrap align="center"> 
	              				<select name="G5">
	                			<option value="X" <% if (!(refCodes.getE02CNOMID().substring(4, 5).equals("F") || refCodes.getE02CNOMID().substring(4, 5).equals("M") || refCodes.getE02CNOMID().substring(4, 5).equals("B"))) out.print("selected"); %>></option>
	                			<option value="M" <% if (refCodes.getE02CNOMID().substring(4, 5).equals("M")) out.print("selected"); %>>Masculino</option>
	                			<option value="F" <% if (refCodes.getE02CNOMID().substring(4, 5).equals("F")) out.print("selected"); %>>Femenino</option>
	                			<option value="B" <% if (refCodes.getE02CNOMID().substring(4, 5).equals("B")) out.print("selected"); %>>Ambos</option>        
	              				</select>                
            				</td>
            				<td nowrap align="center"> 
              					<input type="text" name="RI5" value="<%= refCodes.getE02CNORUT().substring(0,11) %>" size="13" maxlength="11" onkeypress="enterInteger(event)">             
            				</td>
            				<td nowrap align="center"> 
 								<input type="text" name="RF5" value="<%= refCodes.getE02CNORUT().substring(11,22) %>" size="13" maxlength="11" onkeypress="enterInteger(event)">              
            				</td>
                        </tr>
     				</table>
    			</td>
    			</tr>
  				</table>
            </td>
          </tr>
        </table> 
      </td>
    </tr>      
   </table>

  <H4>Códigos por Entidad de Control</H4>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para la Superintendencia Bancaria: </td>
        
            <td nowrap align="left">
                <select name="E02CNOF05">
                  <option value="0" <%if (refCodes.getE02CNOF05().equals("0")) { out.print("selected"); }%>>0 - No Aplica</option>
                  <option value="1" <%if (refCodes.getE02CNOF05().equals("1")) { out.print("selected"); }%>>1 - Cédula de Ciudadania</option>
                  <option value="2" <%if (refCodes.getE02CNOF05().equals("2")) { out.print("selected"); }%>>2 - Cédula Extranjeria</option>
                  <option value="3" <%if (refCodes.getE02CNOF05().equals("3")) { out.print("selected"); }%>>3 - NIT Sociedad</option>
                  <option value="4" <%if (refCodes.getE02CNOF05().equals("4")) { out.print("selected"); }%>>4 - Tarjeta de Identidad</option>
                  <option value="5" <%if (refCodes.getE02CNOF05().equals("5")) { out.print("selected"); }%>>5 - Pasaporte</option>
                  <option value="6" <%if (refCodes.getE02CNOF05().equals("6")) { out.print("selected"); }%>>6 - Carné Diplomático</option>
                  <option value="7" <%if (refCodes.getE02CNOF05().equals("7")) { out.print("selected"); }%>>7 - Sociedad Extranjera sin NIT en Colombia</option>
                  <option value="8" <%if (refCodes.getE02CNOF05().equals("8")) { out.print("selected"); }%>>8 - NIT Fideicomiso, fondo o patrimonio autónomo</option>
                  <option value="9" <%if (refCodes.getE02CNOF05().equals("9")) { out.print("selected"); }%>>9 - Registro Civil de Nacimiento</option>
                </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para la Superintendencia Financiera (UIAF): </td>
        
            <td nowrap align="left">
                <select name="E02CNOUS1">
					<option value="00" <%if (refCodes.getE02CNOUS1().equals("00")) { out.print("selected"); }%>>00 - Otro tipo de identificación</option>
					<option value="06" <%if (refCodes.getE02CNOUS1().equals("06")) { out.print("selected"); }%>>06 - Carné Diplomático</option>
					<option value="07" <%if (refCodes.getE02CNOUS1().equals("07")) { out.print("selected"); }%>>07 - Sociedad Extranjera sin NIT en Colombia</option>
					<option value="08" <%if (refCodes.getE02CNOUS1().equals("08")) { out.print("selected"); }%>>08 - Fideicomiso</option>
					<option value="11" <%if (refCodes.getE02CNOUS1().equals("11")) { out.print("selected"); }%>>11 - Registro Civil de Nacimiento</option>
					<option value="12" <%if (refCodes.getE02CNOUS1().equals("12")) { out.print("selected"); }%>>12 - Tarjeta de Identidad</option>
					<option value="13" <%if (refCodes.getE02CNOUS1().equals("13")) { out.print("selected"); }%>>13 - Cédula de Ciudadania</option>
					<option value="21" <%if (refCodes.getE02CNOUS1().equals("21")) { out.print("selected"); }%>>21 - Tarjeta de Extranjeria</option>
					<option value="22" <%if (refCodes.getE02CNOUS1().equals("22")) { out.print("selected"); }%>>22 - Cedula de Extranjeria</option>
					<option value="31" <%if (refCodes.getE02CNOUS1().equals("31")) { out.print("selected"); }%>>31 - NIT</option>
					<option value="41" <%if (refCodes.getE02CNOUS1().equals("41")) { out.print("selected"); }%>>41 - Pasaporte</option>
					<option value="42" <%if (refCodes.getE02CNOUS1().equals("42")) { out.print("selected"); }%>>42 - Tipo de Documento Extranjero</option>
                </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para Datacredito: </td>
        
            <td nowrap align="left">
                <select name="E02CNOUS2">
                  <option value="1" <%if (refCodes.getE02CNOUS2().equals("1")) { out.print("selected"); }%>>1 - Cédula de Ciudadania y NUIP</option>
                  <option value="2" <%if (refCodes.getE02CNOUS2().equals("2")) { out.print("selected"); }%>>2 - NIT Empresarial</option>
                  <option value="3" <%if (refCodes.getE02CNOUS2().equals("3")) { out.print("selected"); }%>>3 - NIT Extranjera</option>
                  <option value="4" <%if (refCodes.getE02CNOUS2().equals("4")) { out.print("selected"); }%>>4 - Cédula Extranjeria</option>
                </select>
            </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para CIFIN: </td>
        
            <td nowrap align="left">
                <select name="E02CNOUS3">
					<option value="01" <%if (refCodes.getE02CNOUS3().equals("01")) { out.print("selected"); }%>>01 - Cédula de Ciudadania</option>
					<option value="02" <%if (refCodes.getE02CNOUS3().equals("02")) { out.print("selected"); }%>>02 - NIT </option>
					<option value="03" <%if (refCodes.getE02CNOUS3().equals("03")) { out.print("selected"); }%>>03 - Cedula de Extranjeria</option>
					<option value="04" <%if (refCodes.getE02CNOUS3().equals("04")) { out.print("selected"); }%>>04 - Tarjeta de Identidad</option>
					<option value="05" <%if (refCodes.getE02CNOUS3().equals("05")) { out.print("selected"); }%>>05 - Pasaporte</option>
					<option value="06" <%if (refCodes.getE02CNOUS3().equals("06")) { out.print("selected"); }%>>06 - Tarjeta Seguro Social Extranjero</option>
					<option value="07" <%if (refCodes.getE02CNOUS3().equals("07")) { out.print("selected"); }%>>07 - Sociedad Extranjera sin Nit en Colombia</option>
					<option value="08" <%if (refCodes.getE02CNOUS3().equals("08")) { out.print("selected"); }%>>08 - Fideicomiso</option>
					<option value="09" <%if (refCodes.getE02CNOUS3().equals("09")) { out.print("selected"); }%>>09 - Registro Civil de Nacimiento</option>
					<option value="10" <%if (refCodes.getE02CNOUS3().equals("10")) { out.print("selected"); }%>>10 - Carnet Diplomatico</option>
                </select>
            </td>
          </tr>

          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para FRECH BanRep: </td>
             <td nowrap align="left">
                <select name="E02CNOACD">
                  <option value="  "<%if (refCodes.getE02CNOACD().equals("  ")) { out.print("selected"); }%>>  - No Aplica</option>
                  <option value="C" <%if (refCodes.getE02CNOACD().equals("C"))  { out.print("selected"); }%>>C - Cédula de Ciudadania</option>
                  <option value="E" <%if (refCodes.getE02CNOACD().equals("E"))  { out.print("selected"); }%>>E - Cédula Extranjeria</option>
                  <option value="P" <%if (refCodes.getE02CNOACD().equals("P"))  { out.print("selected"); }%>>P - Pasaporte</option>
                </select>
            </td>
          </tr>
          
          <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para Lista de Control : </td>
            <td nowrap align="left">
            	<select name="E02CNOF06">
                  <option value="0" <%if (refCodes.getE02CNOF06().equals(" ")) { out.print("selected"); }%>>  - No Aplica</option>
                  <option value="1" <%if (refCodes.getE02CNOF06().equals("1")) { out.print("selected"); }%>>1 - Cédula de Ciudadania</option>
                  <option value="2" <%if (refCodes.getE02CNOF06().equals("2")) { out.print("selected"); }%>>2 - Cédula Extranjeria</option>
                  <option value="3" <%if (refCodes.getE02CNOF06().equals("3")) { out.print("selected"); }%>>3 - NIT Persona Juridica</option>
                  <option value="4" <%if (refCodes.getE02CNOF06().equals("4")) { out.print("selected"); }%>>4 - Tarjeta de Identidad</option>
                  <option value="5" <%if (refCodes.getE02CNOF06().equals("5")) { out.print("selected"); }%>>5 - Pasaporte</option>
                  <option value="6" <%if (refCodes.getE02CNOF06().equals("6")) { out.print("selected"); }%>>6 - NIT Extranjeria</option>
                  <option value="7" <%if (refCodes.getE02CNOF06().equals("7")) { out.print("selected"); }%>>7 - Sociedad Extranjera</option>
                  <option value="8" <%if (refCodes.getE02CNOF06().equals("8")) { out.print("selected"); }%>>8 - Fideicomiso</option>
                  <option value="9" <%if (refCodes.getE02CNOF06().equals("9")) { out.print("selected"); }%>>9 - NIT Persona Natural</option>
                  <option value="6" <%if (refCodes.getE02CNOF06().equals("A")) { out.print("selected"); }%>>A - Carné Diplomático</option>
                  <option value="6" <%if (refCodes.getE02CNOF06().equals("U")) { out.print("selected"); }%>>U - National Identification Number</option>
                  <option value="6" <%if (refCodes.getE02CNOF06().equals("X")) { out.print("selected"); }%>>X - Tarjeta de Propiedad</option>
                  <option value="6" <%if (refCodes.getE02CNOF06().equals("Y")) { out.print("selected"); }%>>Y - Matricula</option>
                  <option value="6" <%if (refCodes.getE02CNOF06().equals("Z")) { out.print("selected"); }%>>Z - VISA</option>
                  <option value="6" <%if (refCodes.getE02CNOF06().equals("V")) { out.print("selected"); }%>>V - Cedula de Identidad de Venezuela</option>
            </td>
          </tr>

         <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para ACH : </td>
        
            <td nowrap align="left">
                <select name="E02CNOTYP">
                  <option value="00" <%if (refCodes.getE02CNOTYP().equals(" ")) { out.print("selected"); }%>>    - No Aplica</option>
                  <option value="01" <%if (refCodes.getE02CNOTYP().equals("01")) { out.print("selected"); }%>>01 - Cédula de Ciudadania</option>
                  <option value="02" <%if (refCodes.getE02CNOTYP().equals("02")) { out.print("selected"); }%>>02 - Cédula Extranjeria</option>
                  <option value="03" <%if (refCodes.getE02CNOTYP().equals("03")) { out.print("selected"); }%>>03 - NIT</option>
                  <option value="04" <%if (refCodes.getE02CNOTYP().equals("04")) { out.print("selected"); }%>>04 - Tarjeta de Identidad</option>
                  <option value="05" <%if (refCodes.getE02CNOTYP().equals("05")) { out.print("selected"); }%>>05 - Pasaporte</option>
                  <option value="06" <%if (refCodes.getE02CNOTYP().equals("06")) { out.print("selected"); }%>>06 - Carne Diplomatico</option>
                  <option value="07" <%if (refCodes.getE02CNOTYP().equals("07")) { out.print("selected"); }%>>07 - Soc. Ext. Sin NIT en Colombia</option>
                  <option value="08" <%if (refCodes.getE02CNOTYP().equals("08")) { out.print("selected"); }%>>08 - Fideicomiso</option>
                  <option value="09" <%if (refCodes.getE02CNOTYP().equals("09")) { out.print("selected"); }%>>09 - Codigo de Empleado</option>
                  <option value="10" <%if (refCodes.getE02CNOTYP().equals("10")) { out.print("selected"); }%>>10 - Grupo Economico</option>
                  <option value="11" <%if (refCodes.getE02CNOTYP().equals("11")) { out.print("selected"); }%>>11 - NIT Persona Natural</option>
                  <option value="15" <%if (refCodes.getE02CNOTYP().equals("11")) { out.print("selected"); }%>>15 - Sucursal</option>
                  <option value="17" <%if (refCodes.getE02CNOTYP().equals("17")) { out.print("selected"); }%>>17 - Pase Diplomático</option>
                  <option value="24" <%if (refCodes.getE02CNOTYP().equals("24")) { out.print("selected"); }%>>24 - Registro Civil</option> 
                 </select>
            </td>
          </tr> 
          
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para Confecamaras: </td>
 
             <td nowrap align="left">
                <select name="E02CNOTCF">    
                  <option value="1" <%if (refCodes.getE02CNOTCF().equals("1")) { out.print("selected"); }%>>1 - Cédula de Ciudadania</option>
                  <option value="3" <%if (refCodes.getE02CNOTCF().equals("3")) { out.print("selected"); }%>>3 - Registro Civil</option>
                  <option value="4" <%if (refCodes.getE02CNOTCF().equals("4")) { out.print("selected"); }%>>4 - Cédula Extranjeria</option>
                  <option value="5" <%if (refCodes.getE02CNOTCF().equals("5")) { out.print("selected"); }%>>5 - Pasaporte</option>
                  <option value="6" <%if (refCodes.getE02CNOTCF().equals("6")) { out.print("selected"); }%>>6 - Numero de Identificacion Tributaria</option>    
                  <option value="8" <%if (refCodes.getE02CNOTCF().equals("8")) { out.print("selected"); }%>>8 - Certificado Inscripcion o Existencia</option>                 
                  <option value="9" <%if (refCodes.getE02CNOTCF().equals("9")) { out.print("selected"); }%>>9 - Codigo Negocios Fiduciarios</option>                 
                </select> 
            </td>
          </tr>
          
           <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
            <td nowrap width="30%" align="right">Códigos para Bancoldex: </td>
 
             <td nowrap align="left">
                <select name="E02CNOF07">    
                  <option value=" " <%if (refCodes.getE02CNOF07().equals(" ")) { out.print("selected"); }%>>No Aplica</option>
                  <option value="1" <%if (refCodes.getE02CNOF07().equals("1")) { out.print("selected"); }%>>1 - NIT</option>
                  <option value="2" <%if (refCodes.getE02CNOF07().equals("2")) { out.print("selected"); }%>>2 - Cédula de Ciudadania</option>
                  <option value="3" <%if (refCodes.getE02CNOF07().equals("3")) { out.print("selected"); }%>>3 - Tarjeta de Identidad</option>
                  <option value="4" <%if (refCodes.getE02CNOF07().equals("4")) { out.print("selected"); }%>>4 - Cédula Extranjeria</option>
                </select> 
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
  </table>
  
<% } %>        
        
  <table width="100%">		
  	<tr>
  		<td width="50%" align="center">
  		   <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
  			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(600);">
   <%}%>
        	 </td>
  		<td width="50%" align="center">
     		<input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(400);">
  		</td>
  	</tr>	
  </table>	  

  </form>
  	<SCRIPT Language="javascript"> 
  		getElement("G1").value = '<%=refCodes.getE02CNOMID().substring(0, 1)%>';
  		getElement("G2").value = '<%=refCodes.getE02CNOMID().substring(1, 2)%>';
  		getElement("G3").value = '<%=refCodes.getE02CNOMID().substring(2, 3)%>';
  		getElement("G4").value = '<%=refCodes.getE02CNOMID().substring(3, 4)%>';
  		getElement("G5").value = '<%=refCodes.getE02CNOMID().substring(4, 5)%>';
  		getElement("RI1").value = '<%=refCodes.getE02CNOSCG()%>';
 		getElement("RF1").value = '<%=refCodes.getE02CNOMXC().replaceAll(",", "")%>';
 		getElement("RI2").value = '<%=refCodes.getE02CNOMNC().replaceAll(",", "")%>';
 		getElement("RF2").value = '<%=refCodes.getE02CNOPHN()%>';
 		dropDec();
 		
 	</script>  
  
</body>
</html>
