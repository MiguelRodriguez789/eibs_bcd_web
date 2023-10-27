<html>
<head>
<title>Parametros Extractos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<jsp:useBean id= "rtExtrac" class= "datapro.eibs.beans.ESD006003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>




<SCRIPT type="text/javascript">

function goAction() {
	var freqVal = getElement("E03STMFRQ").value;
	var opt = 0;
	if (getElement('E03STMSTR').value > 0) {
	  opt = parseInt(getElement('E03STMSTR').value); 
	}
	if (opt > 100){            //ESTRUCTURA VALUES
   		if (freqVal == "D"){   //FREQUENCY VALUES
	   		getElement("E03STMSDY").value = getElement("diaFreqVal").value;
   		} else if (freqVal == "W"){
	   		getElement("E03STMSDY").value = getElement("semanalFreqVal").value;
   		} else if (freqVal == "B"){
	   		getElement("E03STMSDY").value = getElement("quincenalFreqVal").value;
   		} else if (freqVal == "M"){
   			if (getElement("mensualFreqVal").value == "NN"){
   				getElement("E03STMSDY").value = getElement("mensualFreqValNN").value;
   			} else {
	   			getElement("E03STMSDY").value = getElement("mensualFreqVal").value;
   			}
   		} else if (freqVal == "Y"){
	   		getElement("E03STMSDY").value = getElement("anualFreqDia").value;
	   		getElement("E03STMSMY").value = getElement("anualFreqMes").value;
   		}
	}
//	document.forms[0].EIBSBTN.disabled = true;
//	document.forms[0].submit();

	return true ;

}

</SCRIPT>

</head>

<body>
<% 
if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
out.println("<SCRIPT> initMenu(); </SCRIPT>");
   
Boolean isReadOnly = false;
String disabled = "";
String read = "";
   
if (!(userPO.getPurpose().equals("NEW"))) { 
	read = " readonly ";
	disabled = " disabled";
	isReadOnly = true;
}

%> 
<h3 align="center">Parámetros Extractos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_param_bank_statements_3.jsp, ESD0060"></h3>
<hr size="4">
<FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0031" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="603">
<input type=hidden name="E03STMBNK" value="<%=rtExtrac.getE03STMBNK().trim()%>">
<INPUT TYPE="hidden" NAME="H03FLGMAS" value="A" >

<%int row = 0; %>

<H4>Información Básica</H4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
			<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap width="20%">
						<div align="right">Tipos de Extracto :</div>
					</td>
					<td nowrap width="30%"> 
						<input type="text" name="E03STMTYP" size="4" maxlength="4" <%=read%> value="<%= rtExtrac.getE03STMTYP().trim()%>">
						<% if (userPO.getPurpose().equals("NEW")){%>
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
						<%}%>
						<input type="text" name="E03STMDSC" size="65" maxlength="60"  value="<%= rtExtrac.getE03STMDSC().trim()%>">
					</td>
					<td nowrap width="20%">
						<div align="right">Estructura :</div>
					</td>
					<td nowrap width="30%">
						<select name="E03STMSTR" onchange="showStructureOpt(this); getElement('E03STMSDY').value = ''">
							<option value=" " <% if (rtExtrac.getE03STMSTR().equals("")) out.print("selected"); %>></option>
							<option value="0001" <%if (rtExtrac.getE03STMSTR().equals("0001")) out.print("selected"); %>>Cuenta de Ahorros</option>
							<option value="0002" <%if (rtExtrac.getE03STMSTR().equals("0002")) out.print("selected"); %>>Cuenta Corriente</option>
							<option value="0003" <%if (rtExtrac.getE03STMSTR().equals("0003")) out.print("selected"); %>>Cuenta AFC</option>
							<option value="0004" <%if (rtExtrac.getE03STMSTR().equals("0004")) out.print("selected"); %>>Cuentas Moneda Extranjera</option>
							<option value="0005" <%if (rtExtrac.getE03STMSTR().equals("0005")) out.print("selected"); %>>Multicash</option>
							<option value="0006" <%if (rtExtrac.getE03STMSTR().equals("0006")) out.print("selected"); %>>Petrobras</option>
							<option value="0007" <%if (rtExtrac.getE03STMSTR().equals("0007")) out.print("selected"); %>>Almacenes 14</option>
							<option value="0008" <%if (rtExtrac.getE03STMSTR().equals("0008")) out.print("selected"); %>>S.I.I.F</option>
							<option value="0009" <%if (rtExtrac.getE03STMSTR().equals("0009")) out.print("selected"); %>>SWIFT MT940</option>
							<option value="0010" <%if (rtExtrac.getE03STMSTR().equals("0010")) out.print("selected"); %>>SWIFT MT942</option>
							<option value="0101" <%if (rtExtrac.getE03STMSTR().equals("0101")) out.print("selected"); %>>Prestamos</option>
							<option value="0102" <%if (rtExtrac.getE03STMSTR().equals("0102")) out.print("selected"); %>>Hipotecario</option>
							<option value="0103" <%if (rtExtrac.getE03STMSTR().equals("0103")) out.print("selected"); %>>Credilinea</option>
							<option value="0104" <%if (rtExtrac.getE03STMSTR().equals("0104")) out.print("selected"); %>>Libranza</option>
							<option value="0105" <%if (rtExtrac.getE03STMSTR().equals("0105")) out.print("selected"); %>>Hipotecario Frech Mensual</option>
							<option value="0106" <%if (rtExtrac.getE03STMSTR().equals("0106")) out.print("selected"); %>>Hipotecario Frech Anual </option>
							<option value="0108" <%if (rtExtrac.getE03STMSTR().equals("0108")) out.print("selected"); %>>Cartas Avales</option>
							<option value="0109" <%if (rtExtrac.getE03STMSTR().equals("0109")) out.print("selected"); %>>Hipotecario Pesos Anual </option>
							<option value="0111" <%if (rtExtrac.getE03STMSTR().equals("0111")) out.print("selected"); %>>Hipotecario UVR Mensual</option>
							<option value="0112" <%if (rtExtrac.getE03STMSTR().equals("0112")) out.print("selected"); %>>Hipotecario UVR Anual</option>
							<option value="0114" <%if (rtExtrac.getE03STMSTR().equals("0114")) out.print("selected"); %>>Cuponeras</option>
							<option value="0116" <%if (rtExtrac.getE03STMSTR().equals("0116")) out.print("selected"); %>>Credito Rotativo</option>
							<option value="0118" <%if (rtExtrac.getE03STMSTR().equals("0118")) out.print("selected"); %>>Notas</option>
						</select>
					</td>
				</tr>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap width="20%">
						<div align="right">Frecuencia:</div>
					</td>
					<td nowrap width="30%">
						<select name="E03STMFRQ" onchange="showFrequencyOpt(getElement('E03STMSTR')); clearValues();">
							<option value=" " <% if (!(rtExtrac.getE03STMFRQ().equals("D") || rtExtrac.getE03STMFRQ().equals("W") || 
								rtExtrac.getE03STMFRQ().equals("B") || rtExtrac.getE03STMFRQ().equals("M") ||
								rtExtrac.getE03STMFRQ().equals("Y")))out.print("selected"); %>></option>
							<option value="D" <%if (rtExtrac.getE03STMFRQ().equals("D")) out.print("selected"); %>>Diario</option>
							<option value="W" <%if (rtExtrac.getE03STMFRQ().equals("W")) out.print("selected"); %>>Semanal</option>
							<option value="B" <%if (rtExtrac.getE03STMFRQ().equals("B")) out.print("selected"); %>>Quincenal</option>
							<option value="M" <%if (rtExtrac.getE03STMFRQ().equals("M")) out.print("selected"); %>>Mensual</option>
							<option value="Y" <%if (rtExtrac.getE03STMFRQ().equals("Y")) out.print("selected"); %>>Anual</option>
						</select>
						<div id="defFreq" style="display: none">					   
							Ciclo/Día:
							<input type="text" name="E03STMSDY" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSDY().trim()%>">
							<a href="javascript:GetCode('E03STMSDY','STATIC_statement_cycle.jsp')"><img src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" border="0" ></a>				  
							Mes:
							<input type="text" name="E03STMSMY" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSMY().trim()%>">
						</div>
						<div id="diaFreq" style="display: none">					   
							Días Antes del Vencimiento de la Cuota :
							<input type="text" name="diaFreqVal" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSDY().trim()%>" onchange="getElement('E03STMSDY').value = this.value">
						</div>
						<div id="semanalFreq" style="display: none" >
							Dia de la Semana :
							<select name="semanalFreqVal" onchange="getElement('E03STMSDY').value = this.value">
								<option value=" " <% if (!(rtExtrac.getE03STMSDY().equals("MO") || rtExtrac.getE03STMSDY().equals("TH") || 
									rtExtrac.getE03STMSDY().equals("TU") || rtExtrac.getE03STMSDY().equals("FR") ||
									rtExtrac.getE03STMSDY().equals("WE")))out.print("selected"); %>></option>
								<option value="MO" <%if (rtExtrac.getE03STMSDY().equals("MO")) out.print("selected"); %>>Lunes</option>
								<option value="TU" <%if (rtExtrac.getE03STMSDY().equals("TU")) out.print("selected"); %>>Martes</option>
								<option value="WE" <%if (rtExtrac.getE03STMSDY().equals("WE")) out.print("selected"); %>>Mi&eacute;rcoles</option>
								<option value="TH" <%if (rtExtrac.getE03STMSDY().equals("TH")) out.print("selected"); %>>Jueves</option>
								<option value="FR" <%if (rtExtrac.getE03STMSDY().equals("FR")) out.print("selected"); %>>Viernes</option>
							</select>
						</div>
						<div id="quincenalFreq" style="display: none">					   
							Ciclo 1 (1-15):
							<input type="text" name="quincenalFreqVal" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSDY().trim()%>" onchange="getElement('E03STMSDY').value = this.value">
							Ciclo 2 (16-31):
							<input type="text" name="E03STMSD2" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSD2().trim()%>">
						</div>
						<div id="mensualFreq" style="display: none">
							Día de Emisión:
							<select name="mensualFreqVal" onchange="getElement('E03STMSDY').value = this.value; showNNN(this)">
								<option value="NN" <% if (!(rtExtrac.getE03STMSDY().equals("FD") || rtExtrac.getE03STMSDY().equals("LD") )) out.print("selected"); %>>
									Dia 1...31					  
								</option>
								<option value="FD" <%if (rtExtrac.getE03STMSDY().equals("FD")) out.print("selected"); %>>Primer Dia Laboral</option>
								<option value="LD" <%if (rtExtrac.getE03STMSDY().equals("LD")) out.print("selected"); %>>Ultimo Dia Laboral</option>
							</select>
							<span id="mensualFreqNN" style="display: none">
							<input type="text" name="mensualFreqValNN" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSDY().trim()%>" onchange="getElement('E03STMSDY').value = this.value">
							</span>					   
						</div>
						<div id="anualFreq" style="display: none">					   
							Día:
							<input type="text" name="anualFreqDia" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSDY().trim()%>" onchange="getElement('E03STMSDY').value = this.value">
							Mes:
							<input type="text" name="anualFreqMes" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSMY().trim()%>" onchange="getElement('E03STMSMY').value = this.value">
						</div>
					</td>
					<td nowrap width="20%">
						<div align="right">Estado :</div>
					</td>
					<td nowrap width="30%">
						<input type="radio" name="E03STMSTS" value="A" <%if (rtExtrac.getE03STMSTS().equals("A")) out.print("checked"); %>> Activo 	
						<input type="radio" name="E03STMSTS" value="I" <%if (rtExtrac.getE03STMSTS().equals("I")) out.print("checked"); %>> Inactivo
					</td>
					<!--			
						<td nowrap width="20%"> 
						<div align="right">Frecuencia 2:</div>
						</td>
						<td nowrap width="30%">
						<select name="E03STMFR2" >
						<option value=" " <% if (!(rtExtrac.getE03STMFR2().equals("D") || rtExtrac.getE03STMFR2().equals("W") || 
							rtExtrac.getE03STMFR2().equals("B") || rtExtrac.getE03STMFR2().equals("M") ||
							rtExtrac.getE03STMFR2().equals("Y")))out.print("selected"); %>>
						</option>
						<option value="D" <%if (rtExtrac.getE03STMFR2().equals("D")) out.print("selected"); %>>Diario</option>
						<option value="W" <%if (rtExtrac.getE03STMFR2().equals("W")) out.print("selected"); %>>Semanal</option>
						<option value="B" <%if (rtExtrac.getE03STMFR2().equals("B")) out.print("selected"); %>>Quincenal</option>
						<option value="M" <%if (rtExtrac.getE03STMFR2().equals("M")) out.print("selected"); %>>Mensual</option>
						<option value="Y" <%if (rtExtrac.getE03STMFR2().equals("Y")) out.print("selected"); %>>Anual</option>
						</select>
						Ciclo/Día:
						<input type="text" name="E03STMSD2" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSD2().trim()%>">
						<a href="javascript:GetCode('E03STMSD2','STATIC_cash_pool_cycle.jsp')"><img src="${pageContext.request.contextPath}/images/1b.gif" title="Ayuda" border="0" ></a>				  
						Mes:
						<input type="text" name="E03STMSM2" size="3" maxlength="2" value="<%= rtExtrac.getE03STMSM2().trim()%>">
						</td>
						-->
						
				</tr>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap width="20%">
						<div align="right">Estado por Defecto (Producto) :</div>
					</td>
					<td nowrap width="30%">
						<input type="radio" name="E03STMFLG" value="Y" <%if (rtExtrac.getE03STMFLG().equals("Y")) out.print("checked"); %>>Si 	
						<input type="radio" name="E03STMFLG" value="N" <%if (!rtExtrac.getE03STMFLG().equals("Y")) out.print("checked"); %>>No
					</td>
					<td nowrap width="20%">
						<div align="right"> </div>
					</td>
					<td nowrap width="30%">
						<div align="right"> </div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<div id="infAdic" style="display: none">
<H4>Información Adicional</H4>
<table class="tableinfo" border=1>
	<tr bordercolor="#FFFFFF">
		<td nowrap width="100%">
			<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap width="20%">
						<div align="right">Comisiones :</div>
					</td>
					<td nowrap width="30%">					   
						<input type="text" name="E03STMCDE" size="4" maxlength="5" value="<%=rtExtrac.getE03STMCDE().trim()%>" readonly>
						<a href="javascript:GetCommDef('E03STMCDE','D03STMCDE')"><img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"></a>
						<input type="text" name="D03STMCDE" readonly size="60" maxlength="60" value="<%=rtExtrac.getD03STMCDE().trim()%>">
					</td>
					<td nowrap width="20%">
						<div align="right">Consolidacion :</div>
					</td>
					<td nowrap width="30%">
						<input type="radio" name="E03STMCON" value="Y" <%if (rtExtrac.getE03STMCON().equals("Y")) out.print("checked"); %>> Si	
						<input type="radio" name="E03STMCON" value="N" <%if (rtExtrac.getE03STMCON().equals("N")) out.print("checked"); %>> No
					</td>
				</tr>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap width="20%">
						<div align="right"></div>
					</td>
					<td nowrap width="30%"> 
					</td>	
					<td nowrap width="20%">
						<div align="right">Formato de Envio :</div>
					</td>
					<td nowrap width="30%">
						<input type="radio" name="E03STMFME" value="F" <%if (rtExtrac.getE03STMFME().equals("F")) out.print("checked"); %>> Fin 	
						<input type="radio" name="E03STMFME" value="A" <%if (rtExtrac.getE03STMFME().equals("A")) out.print("checked"); %>> FileAct
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>

<div align="center"> 
  <input id="EIBSBTN" type="button" name="Submit" onClick="return goAction();" value="Enviar">
</div>
          
<script type="text/javascript">

function showStructureOpt(elem){
	var select = getElement("E03STMFRQ");
	var freqVal = getElement("E03STMFRQ").value;
	var opt = 0;
	select.options.length = 0;
	select.options[select.options.length] = new Option('Diario',    'D');
	select.options[select.options.length] = new Option('Semanal',   'W');
	select.options[select.options.length] = new Option('Quincenal', 'B');
	select.options[select.options.length] = new Option('Mensual',   'M');
	select.options[select.options.length] = new Option('Anual',     'Y');
	if (elem.value > 0) {
	  opt = parseInt(elem.value); 
	}
	if (opt > 0 && opt < 100) {              // Pasivos
		document.getElementById("infAdic").style.display = 'block';
	} else if (opt > 100 && opt < 200) {     // Activos 
		select.options.length = 0;
		document.getElementById("infAdic").style.display = 'none';
		if (elem.value == "0103") {          // Activos - Credilinea 
			select.options[select.options.length] = new Option('Quincenal', 'B');
		} else if (elem.value == "0114") {   // Activos - Cuponera 
			select.options[select.options.length] = new Option('Semanal',   'W');
		} else {                             // Activos - Otros Prestamos 
			select.options[select.options.length] = new Option('Diario',    'D');
			select.options[select.options.length] = new Option('Quincenal', 'B');
			select.options[select.options.length] = new Option('Mensual',   'M');
			select.options[select.options.length] = new Option('Anual',     'Y');
		}
	}
	getElement("E03STMFRQ").value = freqVal;
	showFrequencyOpt(elem);
}

function showFrequencyOpt(elem) {
	var opt = 0;
	if (elem.value > 0) {
	  opt = parseInt(elem.value); 
	}
	if (opt > 0 && opt < 100) {              // Pasivos
		getElement("diaFreq").style.display = 'none';
		getElement("semanalFreq").style.display = 'none';
		getElement("quincenalFreq").style.display = 'none';
		getElement("mensualFreq").style.display = 'none';
		getElement("anualFreq").style.display = 'none';   
		getElement("defFreq").style.display = 'inline';
	} else if (opt > 100 && opt < 200) {     // Activos
		getElement("defFreq").style.display = 'none';
		var freqVal = getElement("E03STMFRQ").value;
		if (freqVal == "D"){
			getElement("diaFreq").style.display = 'inline';
			getElement("semanalFreq").style.display = 'none';
			getElement("quincenalFreq").style.display = 'none';
			getElement("mensualFreq").style.display = 'none';
			getElement("anualFreq").style.display = 'none';
		} else if(freqVal == "W"){
			getElement("diaFreq").style.display = 'none';
			getElement("semanalFreq").style.display = 'inline';
			getElement("quincenalFreq").style.display = 'none';
			getElement("mensualFreq").style.display = 'none';
			getElement("anualFreq").style.display = 'none';   		
		} else if(freqVal == "B"){
			getElement("diaFreq").style.display = 'none';
			getElement("semanalFreq").style.display = 'none';
			getElement("quincenalFreq").style.display = 'inline';
			getElement("mensualFreq").style.display = 'none';
			getElement("anualFreq").style.display = 'none';   	   		
		} else if(freqVal == "M"){
			getElement("diaFreq").style.display = 'none';
			getElement("semanalFreq").style.display = 'none';
			getElement("quincenalFreq").style.display = 'none';
			getElement("mensualFreq").style.display = 'inline';
			getElement("anualFreq").style.display = 'none';   	
			showNNN(getElement("mensualFreqVal"));	   				
		} else if(freqVal == "Y"){
			getElement("diaFreq").style.display = 'none';
			getElement("semanalFreq").style.display = 'none';
			getElement("quincenalFreq").style.display = 'none';
			getElement("mensualFreq").style.display = 'none';
			getElement("anualFreq").style.display = 'inline';     		
		}
	}
}


function showNNN(elem){
	if(elem.value == "NN"){
		getElement("mensualFreqNN").style.display = 'inline';
	}else{
		getElement("mensualFreqNN").style.display = 'none';
	}
}

function clearValues(){
	getElement("diaFreqVal").value = "";
	getElement("semanalFreqVal").value = "";
	getElement("quincenalFreqVal").value = "";
	getElement("mensualFreqValNN").value = "";
	getElement("anualFreqDia").value = "";
	getElement("anualFreqMes").value = "";
}


showStructureOpt(getElement('E03STMSTR'));

</script>


</form>
</body>
</html>
