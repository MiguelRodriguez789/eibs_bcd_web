<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title> Credilinea Basic Information for Desembolso</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="RecData" class="datapro.eibs.beans.EPV015304Message"  scope="session" />
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


<h3 align="center"> Desembolso- L&iacute;nea Cr&eacute;dito:  <%=RecData.getE04DSCPRO()%>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cuplus_desmb_info.jsp, EPV0153"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0153DADC" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="TOTAL" ID="TOTAL">
  <INPUT TYPE=HIDDEN NAME="E04DEABNK" VALUE="<%= RecData.getE04DEABNK().trim()%>">
  

  <%int row = 0; %>
 <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left">
              	<eibsinput:text property="E04DEACUN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			  </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E04CUSNA1" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Tipo : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E04DEATYP" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="left"> 
              	<eibsinput:text property="E04DEAACC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E04DEACCY" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E04DEAPRO" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
 </table>
  
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n </h4>
  <table class="tableinfo" >
    <tr > 
	<%row++;%>    
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Monto de la L&iacute;nea :</div>
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
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Monto Retenido :</div>
            </td>
              <td nowrap width="52%"> 
             	<eibsinput:text property="E04CPDIFE" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="48%"> 
              <div align="right">Monto Desembolso :</div>
            </td>
              <td nowrap width="52%"> 
             	<eibsinput:text property="E04TOTDSB" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
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
  
 	<div>
		<h4>Cuentas de Desembolso</h4>
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
					<%	
						double total=0;
						for (int i=1;i<10;i++) {
					%> 
						<%if(!readOnly){%>
						<tr id="trclear"> 
							<td nowrap width="40%" align="center">
								<input type=text name="<%="E04OFFOP"+i%>" value="<%=RecData.getFieldString("E04OFFOP"+i).trim()%>" size="3" maxlength="3">
								<input type=HIDDEN name="<%="E04OFFGL"+i%>" value="<%=RecData.getFieldString("E04OFFGL"+i).trim()%>">
								<input type="text" name="<%="E04OFFCO"+i%>" size="45" maxlength="45" readonly value="<%=RecData.getFieldString("E04OFFCO"+i).trim()%>" class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E04DEABNK.value, document.forms[0].E04OFFCY<%=""+i%>.value,'E04OFFGL<%=i%>','E04OFFOP<%=i%>','10','01')">
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
								<input type="text" name="<%="E04OFFAC"+i%>" size="16" maxlength="16" value="<%=RecData.getFieldString("E04OFFAC"+i).trim()%>" class="context-menu-help" onmousedown="init(accountCustomerNameHelp,this.name,document.forms[0].E04DEABNK.value,'',document.forms[0].E04DEACUN.value,'','RT')">
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
	<table id="dataTable2" cellspacing="0" cellpadding="1" border="0" width="100%">   
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
	
	<%if(!userPO.getHeader1().equals("APPROVAL")){%>
      <div align="center" style="width:95%"> 
       <input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(100);">
	  </div>  
	<%}%> 
 </form>
</body>
</HTML>



