<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>  
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title> Cupo Rotativo Basic Information for Utilizaciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="RecData" class="datapro.eibs.beans.EPV015404Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>



<script type="text/javascript">
 function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();
 }

 var total=0;
 function updateTotal(){
	total=0;
 	for (var i=1;i<10;i++) {
 		if( getElement("E04OFFCO"+i).trim() != "" ){//Add All the Valors
			total += parseFloat((getElement("E04OFFAM"+i).value));   
			getElement("E04OFFAM"+i).value = formatCCY(getElement("E04OFFAM"+i).value.replace(/,/g,""));		 	
 		}
     getElement("dataTable2").rows[0].cells[4].innerHTML = formatCCY(total).bold(); //Displays Total
 	}
 }
 
  function ShowTransfer() {
  		if(getElement("E04CPDAPC").value == ('3')){
   			 getElement("moneda1").style.display = 'none';
   			 getElement("titulo1").style.display = 'block';
   			 getElement("tblMulti").style.display = 'block';
  			 getElement("dataTable2").style.display = 'block';
  		  } else {
  		  	 getElement("moneda1").style.display = 'block';
   			 getElement("titulo1").style.display = 'none';
  		  	 getElement("tblMulti").style.display = 'none';
  			 getElement("dataTable2").style.display = 'none';
  		}
			 getElement("moneda1").style.display = 'none';
   			 getElement("titulo1").style.display = 'block';
   			 getElement("tblMulti").style.display = 'block';
  			 getElement("dataTable2").style.display = 'block';
	}  
	
	function setUtilizacion(val) {
	
	if (val == 'Y'){
		$('#trNovacion').show();	
		} else {
		$('#trNovacion').hide();	
		}
 	}
 	
 	function setReliquidacion(val) {
	
	if (val !== 'Y'){
	val = getElement("E04CPDROC").value;
	}
	
	if (val == 'Y'){
		$('#trReliquida').show();	
		} else {
		$('#trReliquida').hide();	
		}
 	}
	
  function updateMontos(){
 	 var monto_cupo = 0; var monto_used = 0; var total_desm = 0; var total_disp = 0;  
 	 var disponible = 0; var cupo = 0; var utilizado = 0 ;
 	  
	 monto_cupo = document.forms[0].E04CPAMNT;
	 monto_used = document.forms[0].E04CPUSED;
	 total_desm = document.forms[0].E04TOTDSB;
	 total_disp = document.forms[0].E04CPBALN;	 
	 
	 utilizado = total;
	 cupo = parseFloat(monto_cupo.value.replace(/,/g,""));	 
	 disponible = parseFloat(monto_used.value.replace(/,/g,""));	
	 
	 total_desm.value = formatCCY(String(total));
	 
	 if(disponible < 0){//Monto Used is negative
	 	total_disp.value = formatCCY(String(disponible - utilizado));   
	 }else{
	 	total_disp.value = formatCCY(String(cupo - disponible - utilizado));   
 	}
 }
 
 updateTotal;
 
</script>
</head>
<body >
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<%	
	boolean readOnly=false;
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}	
 %>


<h3 align="center"> Utilizacion - Rotativo:  <%=RecData.getE04DSCPRO()%>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="crotat_desmb_info.jsp, EPV0154"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154DADC" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="TOTAL" ID="TOTAL">
  <INPUT TYPE=HIDDEN NAME="E04DEABNK" VALUE="<%= RecData.getE04DEABNK().trim()%>">
  <input type=HIDDEN name="E04CPDROC" VALUE="<%= RecData.getE04CPDROC().trim()%>">
  
  <%int row = 0; %>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="15%"><div align="right"><b>Cliente :</b></div></td>
            <td nowrap width="10%"><div align="left"><eibsinput:text property="E04DEACUN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/></div></td>
            <td nowrap width="10%"><div align="right"><b>Nombre :</b> </div></td>
            <td nowrap width="35%"><div align="left"><eibsinput:text property="E04CUSNA1" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/></div></td>
            <td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
            <td nowrap width="20%"><div align="left"><eibsinput:text property="E04DEATYP" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/></div></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
            <td nowrap width="10%"><div align="left"><eibsinput:text property="E04DEAACC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/></div></td>
            <td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
            <td nowrap width="35%"><div align="left"><eibsinput:text property="E04DEACCY" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/></div></td>
            <td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
            <td nowrap width="20%"><div align="left"><eibsinput:text property="E04DEAPRO" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
 </table>
 
  	<!-- Reliquidaciones de Creditos -->
  	<%-- 
  	<% if (RecData.getE04CPDROC().equals("Y")) { %>
	<input type="hidden" name="RCTOT" id="RCTOT" value="0">
	<% session.setAttribute("EMPRQ","S"); %>
	<iframe id="ifremprq" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1112?SCREEN=101&ACT=N&E01PCRCUN=<%=RecData.getE04DEACUN().trim()%>&E01PCRNUM=<%=RecData.getE04DEAACC().trim()%>"></iframe>
	<% } %>
	--%>
	
	
	<div id="trReliquida" style="display: none">
	<input type="hidden" name="RCTOT" id="RCTOT" value="0">
	<% session.setAttribute("EMPRQ","S"); %>
	<iframe id="ifremprq" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1112?SCREEN=101&ACT=N&E01PCRCUN=<%=RecData.getE04DEACUN().trim()%>&E01PCRNUM=<%=RecData.getE04DEAACC().trim()%>"></iframe>
	</div>
	
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n </h4>
  <table class="tableinfo" >
    <tr > 
	<%row++;%>    
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Monto del Cupo :</div>
            </td>
              <td nowrap width="52%"> 
             	<eibsinput:text property="E04CPAMNT" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"  />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Monto Utilizado :</div>
            </td>
              <td nowrap width="52%"> 
             	<eibsinput:text property="E04CPUSED" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <%--
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Monto Retenido :</div>
            </td>
              <td nowrap width="52%"> 
             	<eibsinput:text property="E04CPDIFE" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          --%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Monto Utilizacion :</div>
            </td>
              <td nowrap width="52%"> 
             	<eibsinput:text property="E04TOTDSB" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Monto Reliquidaciones (+) :</div>
            </td>
              <td nowrap width="52%"> 
             	<eibsinput:text property="E04CPRETQ" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Saldo Disponible :</div>
            </td>
              <td nowrap width="52%"> 
             	<eibsinput:text property="E04CPBALN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Fecha de Ultima Utlizaci&oacute;n :</div>
            </td>
              <td nowrap width="52%"> 
              <eibsinput:date name="RecData" fn_month="E04CPLTDM" fn_day="E04CPLTDD" fn_year="E04CPLTDY" readonly="true"/> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Cuenta de Desembolso :</div>
            </td>
              <td nowrap width="52%"> 
              <eibsinput:text property="E04DEAOAC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/> 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p></p>
    <h4>Utilizaciones</h4>
  <table class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table id="BASIC_TABLE" cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Utilizacion :</div></td>
            <td width="30%">
              <select name="E04CPDAPC" id="E04CPDAPC" onchange="ShowTransfer();">
               <%--
                <option value="1" <% if (RecData.getE04CPDAPC().equals("1")) out.print("selected");%>>AVANCES</option>
                <option value="2" <% if (RecData.getE04CPDAPC().equals("2")) out.print("selected");%>>COMPRAS</option>
               --%>
                <option value="3" <% if (RecData.getE04CPDAPC().equals("3")) out.print("selected");%>>TRANSFERENCIAS</option>
              </select>
            </td>
            <td width="20%" ><div align="right">Numero de Cuotas :</div></td>
            <td width="30%" >
             <eibsinput:text property="E04CPDCUO" name="RecData" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="<%=readOnly%>"/>
             </td>
          </tr>
          <%--
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Canal :</div></td>
            <td width="30%">
               <eibsinput:text property="E04CPDCAN" name="RecData" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="<%=readOnly%>"/>
            </td>
            <td width="20%"><div align="right">Referencia :</div></td>
            <td width="30%">
           	 <eibsinput:text property="E04CPDREF" name="RecData" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE%>" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          --%>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Referencia :</div></td>
            <td width="30%">
               <eibsinput:text property="E04CPDREF" name="RecData" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_REFERENCE%>" readonly="<%=readOnly%>"/>
            </td>
            <td width="20%"><div align="right"></div></td>
            <td width="30%">
           	 
            </td>
          </tr>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Tasa Efectiva :</div></td>
            <td width="30%">
              <eibsinput:text property="E04CPDRTE" name="RecData" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="<%=readOnly%>"/>
            </td>
            <td width="20%"><div align="right">Dia de Pago :</div></td>
            <td width="30%">
             <eibsinput:text name="RecData" property="E04CPDDAY" size="3" maxlength="2" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          <%-- 
          <tr id="moneda1" style="display: block;" class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Moneda :</div></td>
            <td width="30%">
              <input type="text" name="E04CPDCCY" size="3" maxlength="3" value="<%= RecData.getE04CPDCCY()%>"> 
			  <a href="javascript:GetCurrency('E04CPDCCY','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
            </td>
            <td width="20%"><div align="right">Monto :</div></td>
            <td width="30%">
             <eibsinput:text name="RecData" property="E04CPDAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>"/>
            </td>
          </tr>
          --%>
          <tr class='<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>'> 
            <td width="20%"><div align="right">Descripcion :</div></td>
            <td width="30%">
              <eibsinput:text property="E04DEANR1" name="RecData" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="<%=readOnly%>"/>
            </td>
            <td width="20%"><div align="right">Novaci&oacute;n :</div></td>
            <td width="30%">
            	<input type="radio" name="E04DEAECU" value="Y" <%if (RecData.getE04DEAECU().equals("Y"))  out.print("checked"); %> onchange="setUtilizacion(this.value);setReliquidacion(this.value);" > Si 
				<input type="radio" name="E04DEAECU" value="N" <%if (!RecData.getE04DEAECU().equals("Y")) out.print("checked"); %> onchange="setUtilizacion(this.value);setReliquidacion(this.value);" > No
				
            </td>
          </tr>
          <tr id="trNovacion" style="display: none">
			<td width="20"><div align="right">Tipo Novaci&oacute;n :</div></td>
			<td width="30"> 
				<input type="text" name="E04DLCTPR" size="3" maxlength="2" value="<%= RecData.getE04DLCTPR().trim()%>"   >
				<a href="javascript:GetCodeDescCNOFC('E04DLCTPR', 'E04DSCTPR','RY')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
				<eibsinput:text name="RecData" property="E04DSCTPR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
			</td>
			<td width="20"><div align="right">Condici&oacute;n Novaci&oacute;n :</div></td>
			<td width="30"> 
				<input type="text" name="E04DLCCDR" size="3" maxlength="2" value="<%= RecData.getE04DLCCDR().trim()%>"   >
				<a href="javascript:GetCodeDescCNOFC('E04DLCCDR', 'E04DSCCDR','RO')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
				<eibsinput:text name="RecData" property="E04DSCCDR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
			</td>
			</tr>
          
        </table>
      </td>
    </tr>
  </table>
  
  <div >
		<br>
		<h4>Cuenta de Desembolso </h4>
	</div>
	
	<table id="tblMulti" class="tableinfo" style="height:106px;">
		<tr height="5%"> 
			<td nowrap valign="top" width="100%"> 
				<table id="headTable" width="98%">
					<tr id="trdark">
						<th nowrap width="40%" align="center">Concepto</th>
						<th nowrap width="10%" align="center">Banco</th>
						<th nowrap width="10%" align="center">Sucursal</th>
						<th nowrap width="10%" align="center">Moneda</th>
						<th nowrap width="15%" align="center">Referencia</th>
						<th nowrap width="15%" align="center">Valor</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:106px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
						<%if(!readOnly){%>
						<tr id="trclear"> 
							<td nowrap width="40%" align="center">
								<input type=text name="E04OFFOP1" value="<%= RecData.getE04OFFOP1().trim()%>" size="3" maxlength="3">
								<input type=HIDDEN name="E04OFFGL1" value="<%= RecData.getE04OFFGL1().trim()%>">
								<input type="text" name="E04OFFCO1" size="45" maxlength="45" readonly value="<%= RecData.getE04OFFCO1().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E04DEABNK.value, document.forms[0].E04OFFCY1.value,'E04OFFGL1','E04OFFOP1','10', 'CU')">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E04OFFBK1" size="2" maxlength="2" value="<%= RecData.getE04OFFBK1().trim()%>">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E04OFFBR1" size="4" maxlength="4" value="<%= RecData.getE04OFFBR1().trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E04DEABNK.value,'','','','')">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E04OFFCY1" size="3" maxlength="3" value="<%= RecData.getE04OFFCY1().trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E04DEABNK.value,'','','','')">
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="E04OFFAC1" size="16" maxlength="16" value="<%= RecData.getE04OFFAC1().trim()%>" class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E04DEABNK.value,'',document.forms[0].E04DEACUN.value,'','RT')">
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="E04OFFAM1" class="txtright" size="20" maxlength="19" value="<%=RecData.getField("E04OFFAM1").getString().trim()%>" onKeypress="enterDecimal(event, 2)" onchange="updateTotal(); updateMontos();">
							</td>
						</tr> 
						<%}else{%>
							<tr id="trclear"> 
							<td nowrap width="40%" align="center">
								<input type=text name="E04OFFOP1" value="<%= RecData.getE04OFFOP1().trim()%>" size="3" maxlength="3">
								<input type=HIDDEN name="E04OFFGL1" value="<%= RecData.getE04OFFGL1().trim()%>">
								<input type="text" name="E04OFFCO1" size="45" maxlength="45" readonly value="<%= RecData.getE04OFFCO1().trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E04DEABNK.value, document.forms[0].E04OFFCY1.value,'E04OFFGL1','E04OFFOP1','10', 'CU')">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E04OFFBK1" size="2" maxlength="2" value="<%= RecData.getE04OFFBK1().trim()%>">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E04OFFBR1" size="4" maxlength="4" value="<%= RecData.getE04OFFBR1().trim()%>" readonly >
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="E04OFFCY1" size="3" maxlength="3" value="<%= RecData.getE04OFFCY1().trim()%>" readonly >
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="E04OFFAC1" size="16" maxlength="16" value="<%= RecData.getE04OFFAC1().trim()%>" readonly >
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="E04OFFAM1" class="txtright" size="20" maxlength="19" value="<%=RecData.getField("E04OFFAM1").getString().trim()%>" readonly >
							</td>
						</tr> 
						<%} %>
					</table>
				</div>
			</td>
		</tr>
	</table>

	<%--   
 	<div id="titulo1" style="display: none;">
		<h4>Cuentas de Desembolso</h4>
	</div>

	<table id="tblMulti" class="tableinfo" style="display: none;height:106px;">
		<tr height="5%"> 
			<td nowrap valign="top" width="100%"> 
				<table id="headTable" width="98%">
					<tr id="trdark">
						<th nowrap width="40%" align="center">Concepto</th>
						<th nowrap width="10%" align="center">Banco</th>
						<th nowrap width="10%" align="center">Sucursal</th>
						<th nowrap width="10%" align="center">Moneda</th>
						<th nowrap width="15%" align="center">Referencia</th>
						<th nowrap width="15%" align="center">Valor</th>
					</tr>
				</table>
			</td>
		</tr>    
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:106px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%	
						double total=0;
						for (int i=1;i<10;i++) {
					%>  
						<%if(!readOnly){%>
						<tr id="trclear"> 
							<td nowrap width="40%" align="center">
								<input type=text name="<%="E04OFFOP"+i%>" value="<%=RecData.getFieldString("E04OFFOP"+i).trim()%>" size="3" maxlength="3">
								<input type=HIDDEN name="<%="E04OFFGL"+i%>" value="<%=RecData.getFieldString("E04OFFGL"+i).trim()%>">
								<input type="text" name="<%="E04OFFCO"+i%>" size="45" maxlength="45" readonly value="<%=RecData.getFieldString("E04OFFCO"+i).trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E04DEABNK.value, document.forms[0].E04OFFCY<%=""+i%>.value,'E04OFFGL<%=i%>','E04OFFOP<%=i%>','10','CU')">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E04OFFBK"+i%>" size="2" maxlength="2" value="<%=RecData.getFieldString("E04OFFBK"+i).trim()%>">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E04OFFBR"+i%>" size="4" maxlength="4" value="<%=RecData.getFieldString("E04OFFBR"+i).trim()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E04DEABNK.value,'','','','')">
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E04OFFCY"+i%>" size="3" maxlength="3" value="<%=RecData.getFieldString("E04OFFCY"+i).trim()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E04DEABNK.value,'','','','')">
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E04OFFAC"+i%>" size="16" maxlength="16" value="<%=RecData.getFieldString("E04OFFAC"+i).trim()%>" class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E04DEABNK.value,'',document.forms[0].E04DEACUN.value,'','RT')">
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E04OFFAM"+i%>" class="txtright" size="20" maxlength="19" value="<%=RecData.getField("E04OFFAM"+i).getString().trim()%>" onKeypress="enterDecimal(event, 2)" onchange="updateTotal(); updateMontos();">
							</td>
						</tr> 
						<%}else{%>
						<tr id="trclear"> 
							<td nowrap width="40%" align="center">
								<input type=text name="<%="E04OFFOP"+i%>" value="<%=RecData.getFieldString("E04OFFOP"+i).trim()%>" size="3" maxlength="3" readonly> 
								<input type=HIDDEN name="<%="E04OFFGL"+i%>" value="<%=RecData.getFieldString("E04OFFGL"+i).trim()%>" readonly>
								<input type="text" name="<%="E04OFFCO"+i%>" size="45" maxlength="45" readonly value="<%=RecData.getFieldString("E04OFFCO"+i).trim()%>" readonly>
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E04OFFBK"+i%>" size="2" maxlength="2" value="<%=RecData.getFieldString("E04OFFBK"+i).trim()%>" readonly>
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E04OFFBR"+i%>" size="4" maxlength="4" value="<%=RecData.getFieldString("E04OFFBR"+i).trim()%>"  readonly>
							</td>
							<td nowrap width="10%" align="center"> 
								<input type="text" name="<%="E04OFFCY"+i%>" size="3" maxlength="3" value="<%=RecData.getFieldString("E04OFFCY"+i).trim()%>" readonly>
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E04OFFAC"+i%>" size="16" maxlength="16" value="<%=RecData.getFieldString("E04OFFAC"+i).trim()%>"  readonly>
							</td>
							<td nowrap width="15%" align="center"> 
								<input type="text" name="<%="E04OFFAM"+i%>" class="txtright" size="20" maxlength="19" value="<%=RecData.getField("E04OFFAM"+i).getString().trim()%>" readonly>
							</td>
						</tr> 
						<%} %>
					<%}%>
					</table>
				</div>
			</td>
		</tr>
	</table>
	
	<table id="dataTable2" style="display: none;" cellspacing="0" cellpadding="1" border="0" width="100%">   
		<tr bgcolor="#FFFFFF">
			<td nowrap width="2%">&nbsp;</td>
			<td nowrap width="5%">&nbsp;</td>
			<td nowrap width="15%">&nbsp;</td>
			<td nowrap align="right" width="58%"><b>TOTAL : </b> </td>
			<%if(!userPO.getHeader1().equals("APPROVAL")){%>
			<td nowrap align="center" width="12%"><b><%=Util.formatCCY(RecData.getE04TOTDSB())%></b></td>
			<%}else{%>
			<td nowrap align="center" width="12%"><b><%=Util.formatCCY(RecData.getE04TOTDSB())%></b></td>
			<%}%>
		</tr>								
	</table>	
	--%>
	<%if(!userPO.getHeader1().equals("APPROVAL")){%>
      <div align="center" style="width:95%"> 
       <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(100);">
	  </div>  
	<%}%> 
	
 </form>
</body>
<SCRIPT type="text/javascript">
	setUtilizacion(document.forms[0].E04DEAECU.value); 
	setReliquidacion(document.forms[0].E04CPDROC.value); 
</SCRIPT>
</HTML>



