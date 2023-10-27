<html>
<head>
<title>Cuentas de Contrapartida</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="concept" class="datapro.eibs.beans.EGL034801Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<body>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Cuentas de Contrapartida para M&oacute;dulos eIBS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="concepts_details.jsp, EGL0348"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEGL0348" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01GLHM01" id="E01GLHM01" VALUE="<%= concept.getE01GLHM01().trim()%>">
  
  <table  class="tableinfo" style="width: 100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="10%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left"> 
                <input type="text" readonly name="E01GLHB01" size="3" maxlength="2"  value="<%= concept.getE01GLHB01().trim()%>" >
              </div>
            </td>
            <td nowrap width="5%" > 
              <div align="right"><b>Aplicaci&oacute;n :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
                <input type="text" readonly name="E01GLHA01" size="3"  maxlength="2" value="<%= concept.getE01GLHA01().trim()%>">
                <input type="text" readonly name="E01DESACD" maxlength="45" size="46" value="<%= concept.getE01DESACD().trim()%>" >
                </font></font></font></div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Modo de Utilizaci&oacute;n :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" readonly name="DSCMOD" size="35" maxlength="35"  
                	value="<% if (concept.getE01GLHM01().equals("")){ %>Generico<% } 
                				else if (concept.getE01GLHM01().equals("01")){%>Apertura<% } 
                				else if (concept.getE01GLHM01().equals("02")){ %>Pagos<% } 
                				else if (concept.getE01GLHM01().equals("03")){ %>Prorrogas<% } 
                				else if (concept.getE01GLHM01().equals("04")){ %>Reestructuraciones/Renovaciones<% } 
                				else if (concept.getE01GLHM01().equals("05")){ %>Transacciones<% } 
                				else if (concept.getE01GLHM01().equals("06")){ %>Cancelaciones<% } 
                				else if (concept.getE01GLHM01().equals("CO")){ %>Convenios<% } 
                				else if (concept.getE01GLHM01().equals("PM")){ %>Pagos Masivos<% } 
                				else if (concept.getE01GLHM01().equals("PL")){ %>Pagos Planillas<% } 
                				else if (concept.getE01GLHM01().equals("RN")){ %>Reliquidaciones<% } 
                				else { %> Sin Definir <% } %>" >
                
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  

	<TABLE  id="mainTable" class="tableinfo" style="height: 295px; width: 100%">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th nowrap align="center" width= "5%">Seq</th>
						<th nowrap align="center" width="30%">Concepto</th>
						<th nowrap align="center" width="15%">Tipo</th>
						<th nowrap align="center" width="5%">Moneda</th>
						<th nowrap align="center" width="10%">Contabilidad</th>
						<th nowrap align="center" width="25%">Descripci&oacute;n</th>
						<% if ((concept.getE01GLHA01().equalsIgnoreCase("11"))||(concept.getE01GLHA01().equalsIgnoreCase("12"))) {%>
						<th nowrap align="center" width="5%">Dias retenci&oacute;n</th>
						<%}%>
						<th nowrap align="center" width= "5%">Tbl/Com</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr  height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height: 295px; overflow:auto;" > 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					  int i = 0;
					  int amount = 20;
					  String seq;
					  for (i=1; i<=amount; i++ ) {
					    if (i <10) {
					      seq = "0" +i + "";
					    } else {	
					      seq = i + "";
					    }
					%>
						<tr id="trclear"> 
							<td nowrap width="5%"> 
								<div align="center" > 
									<input type="text" name="E01GLHS<%= seq %>" value="<%= seq %>" size="3" maxlength="2">
								</div>
							</td>
							<td nowrap width="30%"> 
								<div align="left"> 
									<input type="text" name="E01GLHD<%= seq %>" size="50" maxlength="45" value="<%= concept.getField("E01GLHD"+seq).getString().trim()%>">
								</div>
							</td>
							<td nowrap width="15%"> 
								<div align="center">
									<select name="E01GLHT<%= seq %>">
										<OPTION value=" " ></OPTION>
										<OPTION value="1" <% if(concept.getField("E01GLHT"+seq).getString().equals("1")) out.print("selected");%>>Cheque de Gerencia</OPTION>
										<OPTION value="2" <% if(concept.getField("E01GLHT"+seq).getString().equals("2")) out.print("selected");%>>Cuenta Corriente/Ahorros</OPTION>
										<OPTION value="3" <% if(concept.getField("E01GLHT"+seq).getString().equals("3")) out.print("selected");%>>Cuenta Contable</OPTION>
										<OPTION value="4" <% if(concept.getField("E01GLHT"+seq).getString().equals("4")) out.print("selected");%>>A Traves del Cajero</OPTION>
										<OPTION value="5" <% if(concept.getField("E01GLHT"+seq).getString().equals("5")) out.print("selected");%>>Tarjeta de Credito</OPTION>
										<OPTION value="6" <% if(concept.getField("E01GLHT"+seq).getString().equals("6")) out.print("selected");%>>Mensaje Swift 103</OPTION>
										<OPTION value="7" <% if(concept.getField("E01GLHT"+seq).getString().equals("7")) out.print("selected");%>>Mensaje Swift 202</OPTION>
										<OPTION value="8" <% if(concept.getField("E01GLHT"+seq).getString().equals("8")) out.print("selected");%>>Cuenta por Cobrar</OPTION>
										<OPTION value="R" <% if(concept.getField("E01GLHT"+seq).getString().equals("R")) out.print("selected");%>>Temporal Renovacion</OPTION>
										<OPTION value="A" <% if(concept.getField("E01GLHT"+seq).getString().equals("A")) out.print("selected");%>>Transferencia ACH</OPTION>
										<OPTION value="I" <% if(concept.getField("E01GLHT"+seq).getString().equals("I")) out.print("selected");%>>Transferencia Interna</OPTION>
										<OPTION value="L" <% if(concept.getField("E01GLHT"+seq).getString().equals("L")) out.print("selected");%>>Pago Prestamo</OPTION>
										<OPTION value="V" <% if(concept.getField("E01GLHT"+seq).getString().equals("V")) out.print("selected");%>>Convenio Recaudos</OPTION>
									</select>
								</div>
							</td>
							<td nowrap width="5%"> 
								<div align="center"> 
									<input type="text" name="E01GLHY<%= seq %>" size="4" maxlength="3" value="<%= concept.getField("E01GLHY"+seq).getString().trim()%>" onkeypress="enterInteger(event)" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01GLHB01.value,'','E01DESD<%= seq %>','','')">
								</div>
							</td>	
							<td nowrap width="10%"> 
								<div align="center"> 
									<input type="text" name="E01GLHG<%= seq %>" size="17" maxlength="16" value="<%= concept.getField("E01GLHG"+seq).getString().trim()%>" onkeypress="enterInteger(event)" class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01GLHB01.value,document.forms[0].E01GLHY<%= seq %>.value,'E01DESD<%= seq %>','','')">
								</div>
							</td>
							<td nowrap width="25%"> 
								<div align="center"> 
									<input type="text" name="E01DESD<%= seq %>" size="45" maxlength="45"  value="<%= concept.getField("E01DESD"+seq).getString().trim()%>" readonly>
								</div>
							</td>
					<%
					    if ((concept.getE01GLHA01().equalsIgnoreCase("11"))||(concept.getE01GLHA01().equalsIgnoreCase("12"))) { 
					%>
							<td nowrap width="5%"> 
								<div align="center"> 
									<input type="text" name="E01GLHF<%= seq %>" size="2" maxlength="1"  value="<%= concept.getField("E01GLHF"+seq).getString().trim()%>">
								</div>
							</td>
					<% 
					    } 
					%>
							<td nowrap width="5%"> 
								<div align="center"> 
									<input type="text" name="E01GLHC<%= seq %>" size="5" maxlength="4"  value="<%= concept.getField("E01GLHC"+seq).getString().trim()%>" class="context-menu-help" onmousedown="return(chooseHelpMenu(<%=seq%>,this))" >
								</div>
							</td>
						</tr>
					<%
					  }
					%>
					</table>
				</div>
			</td>
		</tr>             
	</table>

	<SCRIPT type="text/javascript">
		getElement("totalRow").value="<%= i %>";
	</SCRIPT> 
	  
	<br>
	<div align="center"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
	</div>

</form>
</body>
	<script type="text/javascript">
	function chooseHelpMenu(row,that){
		var rowNumber = (row < 10) ? "0" : ""; //Had to redo in JAVASCRIPT Convert Numbers to STRING FORMAT 
		rowNumber += row;
		var optionName = "E01GLHT"+rowNumber;
		getElement("E01GLHC"+rowNumber).className = "context-menu-help";
			if(getElement(optionName).value == "1" ) {
				return init(officialCheckFormat,that.name ); //CHECKFORMAT HELP
			}else if(getElement(optionName).value == "A"){
					return init(commDef,that.name ); //TRANSFERACH HELP
			}else{
			  getElement("E01GLHC"+rowNumber).className = ""; //IF NEITHER REMOVES INPUT CLASS.
			  return "";	
			}
	}
	</script>
	

</html>
