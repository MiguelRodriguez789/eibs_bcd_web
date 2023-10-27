<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.presentation.input.EibsInputFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>
Lista de Cuentas a Aprobar
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.ELC525001Message"  scope="session" />
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
  	var reason = '';
  	var accOfac = '';
  	var accWarn = '';

  	function showInqApprovalBG(account, type) {
   		var formLength = document.forms[0].elements.length;
   		for (n=0;n<formLength;n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue = document.forms[0].elements[n].value;
      		if(elementName == "ACCNUM" && elementValue == account) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.bolgaran.JSELC5250?SCREEN=3&ACCNUM=" + account + "&typeCode=" + type;
		CenterWindow(page,900,600,2);
  	}

  	function goApproval() {
		document.forms[0].action.value = "A";
		document.forms[0].submit();
  	}

	function goAction(op) {
		var op2 = '';
		if (op == 'Z') {op2 = 'A';} else {op2 = op;}

		document.forms[0].action.value = op2;
		document.forms[0].reason.value = reason;

		var formLength = document.forms[0].elements.length;
		var ok = false;
		for (var n=0;n<formLength;n++) {
			var elementName = document.forms[0].elements[n].name;
			if(elementName == "ACCNUM") {
				ok = true;
				break;
			}
		}
		 	
		if (getElementChecked("ACCNUM") != null){
			if (ok) {
				if (op == 'Search'){
					getElement('SCREEN').value = 5; //Request Filtered List
					document.getElementsByTagName('body')[0].className = 'waiting';							
					document.forms[0].submit();				
			 	}else{			
					if (accOfac != "" && op != 'Z' && op != 'D') {
						page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accOfac + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
						CenterWindow(page, 600, 500, 2);
					} else {
						if (accWarn != "" && op != 'D') {
			 				page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accWarn+"&APP=1";
		 					CenterWindow(page, 420, 300, 2);
						} else {
							if (op == 'D') {
								if (confirm("Desea eliminar el registro seleccionado?")) {
									document.forms[0].submit();		
								}
							} else {
								document.forms[0].submit();
							}
						}
					} 
			 	}
			} else {
		 		if (op == 'Search'){
					getElement('SCREEN').value = 5; //Request Filtered List
					document.getElementsByTagName('body')[0].className = 'waiting';							
					document.forms[0].submit();				
		 		}else{	
	 				alert("Debe seleccionar un registro.");
		 		}
			}
		}
 	}

 	function goExit(){
    	window.location.href = "<%=request.getContextPath()%>/pages/background.htm";
  	}

 	function extraInfo(textfields, noField) {
 		var pos = 0;
 		var s = textfields;
 		for ( var i=0; i<noField ; i++ ) {
   			pos = textfields.indexOf("<br>", pos+1);
  		}
 		s = textfields.substring(0, pos);
 		return(s);
 	}

 	function showAddInfo(idxRow){
		var valor1 = 0.00;
		var valor2 = 0.00;
		if (isValidObject(getElement("ERWRNG"))){
			if (isValidObject(getElement("tblErr"))){
				valor1 = parseFloat((document.getElementById("ERWRNG").value));
				valor2 = parseFloat((""+idxRow));
				if (valor1 != valor2) {
					document.getElementById("tblErr").style.display = 'none';
					document.getElementById("ERWRNG").value    = ""+valor2;
					document.getElementById("H02FLGWK2").value = ""; 
				}
			}
		}	 	
   		tbAddInfo.rows[0].cells[1].style.color = "#d0122c";
   		tbAddInfo.rows[0].cells[1].innerHTML = extraInfo(getElement("TXTDATA"+idxRow).value, 9);
   		if (getElement("STSOFAC"+idxRow).value == "3") {
      		var formLength = document.forms[0].elements.length;
      		for (var n=0;n<formLength;n++) {
        		var elemt = document.forms[0].elements[n];
        		if ( elemt.type == "radio" && elemt.checked ) {
              		accOfac = elemt.value;
              		break;
        		}
      		}
   		} else {
      		accOfac = "";
   		}
 		if (getElement("STSWARN"+idxRow).value == "A") {
      		var formLength = document.forms[0].elements.length;
      		for (var n=0;n<formLength;n++) {
        		var elemt = document.forms[0].elements[n];
        		if (elemt.type == "radio" && elemt.checked ) {
              		accWarn = elemt.value;
              		break;
        		}
      		}
   		} else {
      		accWarn = "";
   		}
		if (isValidObject(tbAddInfo.rows[0].cells[1])) {
   			tbAddInfo.rows[0].cells[1].style.color = "";
   		}	
   		for ( var i=0; i<dataTable.rows.length; i++ ) {
       		dataTable.rows[i].className = "trnormal";
    	}
   		dataTable.rows[idxRow].className = "trhighlight";
   		adjustDifTables(headTable, dataTable, dataDiv1, 2, 1);
  	}

	function showInqOFAC(fieldValue){
        document.forms[0].ACCNUM.value = fieldValue;
		var formLength = document.forms[0].elements.length;
   		for (n=0;n<formLength;n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue = document.forms[0].elements[n].value;
      		if (elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
		CenterWindow(page, 600, 500, 2);
 	}

	function showInqWarn(fieldValue){
       	document.forms[0].ACCNUM.value = fieldValue;
		var formLength = document.forms[0].elements.length;
   		for (n=0;n<formLength;n++) {
      		var elementName= document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if (elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
		CenterWindow(page, 420, 300, 2);
 	}

</script>

</HEAD>

<BODY >

<%
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<form Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.bolgaran.JSELC5250" >
  <input type=HIDDEN name="SCREEN" VALUE="2">
  <input type=HIDDEN name="action" VALUE="A">
  <input type=HIDDEN name="reason" VALUE="">
  <input type=HIDDEN name="totalRow" VALUE="0">
  <input type=HIDDEN name="appCode" VALUE="BG">
  <input type=HIDDEN name="ERWRNG" id="ERWRNG" VALUE="0">
  <h3 align="center">Aprobación de Documentarias
    <% String appCode = "43";
       String generic = "";
       String title = "Documentarias";%>	
      </h3>
  
  <hr size="4">
  <table class="tbenter">
    <tr>
      <td class="TDBKG" width="25%"><a href="javascript:goAction('A')" id="linkApproval">Aprobar</a></TD>
      <td class="TDBKG" width="25%"><a href="javascript:enterReason('R')" id="linkReject">Rechazar</a></TD>
      <td class="TDBKG" width="25%"><a href="javascript:goAction('D')" id="linkDelete">Eliminar</a></TD>
      <td class="TDBKG" width="25%"><a href="javascript:goExit()" >Salir</a></TD>
    </tr>
  </table>

<% if (error.getERWRNG().equals("Y")){%>
  <table id="tblErr" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr bgcolor="#FFFFFF">
      <td width="25%"> 
        <h4 style="text-align:center"><input type="checkbox" name="H02FLGWK2" value="A">Aceptar con Aviso</h4>
      </td>
      <TD width="25%"> </TD>
      <TD width="25%"> </TD>
      <TD width="25%"> </TD>
    </TR>
  </TABLE>
<% } %> 

<div id="divSearch" class="hiddenDiv">
    <table class="approvalSearch" style="width: 500px">
    	<caption>B&uacute;squeda</caption>
      <tr > 
        <td align=CENTER nowrap="nowrap"> 
          <div align="right" >Numero de Cliente :</div>
        </td>
        <td align=CENTER  > 
          <div align="left">
			<eibsinput:help name="searchParameters" fn_param_one="E01SELCUN" property="E01SELCUN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" />
          </div>
        </td>
      </tr>
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" >Numero de Identificaci&oacute;n :</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
			<eibsinput:help name="searchParameters" fn_param_one="E01SELIDN" property="E01SELIDN" size="25"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" />
          </div> 
        </td>
      </tr>
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" style="vertical-align: bottom;" > Por Palabra :</div>
        </td>
        <td align=CENTER  > 
          <div align="left" style="vertical-align: bottom;"> 
          	<br style="margin: 1px">
          	<eibsinput:text property="E01SELNME" name="searchParameters" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="<%=String.valueOf(EibsFields.EIBS_FIELD_NAME_LENGTH)%>" />
          </div>
        </td>
      </tr>
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" >Tipo de Producto :</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
              <input type="text" name="E01SELTYP" size="5" maxlength="4" value="<%=searchParameters.getE01SELTYP()%>" class="TXTRIGHT">
              <a href="javascript:GetProductRates('E01SELTYP','<%=appCode%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="null" align="bottom" border="0" ></a>           
          </div>
        </td>
      </tr>      
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" > Codigo de Producto:</div>
        </td>
        <td align=CENTER  > 
          <div align="left">
			<input type="text" name="E01SELPRD" maxlength="4" size="5" value="<%=searchParameters.getE01SELPRD()%>" class="TXTRIGHT">
				<a id="linkHelp" href="javascript:GetProduct('E01SELPRD','<%= appCode%>','<%=currUser.getE01UBK()%>','', '<%=generic%>')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="null" align="bottom" border="0"/>
			</a>
          </div>
        </td>
      </tr> 
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" >Por Sucursal:</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
			<eibsinput:help name="searchParameters" fn_param_one="E01SELBRN" property="E01SELBRN" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" />
          </div> 
        </td>
      </tr>   
      <tr > 
        <td align=CENTER   nowrap="nowrap"> 
          <div align="right" >Por Moneda:</div>
        </td>
        <td align=CENTER  > 
          <div align="left"> 
			<eibsinput:help name="searchParameters" fn_param_one="E01SELCCY" property="E01SELCCY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" />
          </div> 
        </td>
      </tr>       
      <tr> 
        <td align=center nowrap colspan="2"> 
		<br>
          <input class="styled-button-Search" type=button name="Submit" value="Enviar" onClick="javascript:goAction('Search')">
        </td>
      </tr>      
    </table>
  </div>   
  
  <table id="mainTable" class="tableinfo" height="70%">
    <tr height="5%">
      <td NOWRAP valign="top" width="75%">
	  <TABLE id="headTable">
		    <TR id ="trdark">
            <TH ALIGN=CENTER rowspan="2"  ><img id="searchIcon"src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" ></TH>
            <TH ALIGN=CENTER rowspan="2"  >Cuenta</TH>
            <TH ALIGN=CENTER colspan="2"  >Cliente</TH>
            <TH ALIGN=CENTER rowspan="2"  >Producto</TH>
          </TR>
          <TR id="trdark">
            <TH ALIGN=CENTER >Número</TH>
            <TH ALIGN=CENTER >Nombre</TH>
          </TR>
        </TABLE>
      <TD nowrap ALIGN="RIGHT" valign="top" width="25%">
        <Table id="tbAddInfoH"  width="100%" >
          <tr id="trdark">
            <TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
          </tr>
        </Table>
      </TD>
    </TR>
    <TR height="95%"> 
      <TD NOWRAP valign="top" width="75%">
        <div id="dataDiv1" style=" height:400px; overflow:auto;">  
          <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
      <%  int k = 0;
        if (appList.getNoResult()){
      %>     
            <tr id="dataTable"> 
              <TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
                <br><br><br><br> <font size=3>No hay Documentarias para la Aprobaci&oacute;n con este criterio. </font>
              </TD>          
            </tr>
       <%}else{           
                  appList.initRow();
                  k=1;
                  while (appList.getNextRow()) {
                      if (appList.getFlag().equals("")) {
                          out.println(appList.getRecord());
                      k++;
                      }
                  }
      %>
          </table>
        </div>
      </TD>
      <td nowrap ALIGN="RIGHT" valign="top" width="25%">
        <Table id="tbAddInfo">
          <tr id="trclear"> 
            <TD ALIGN="RIGHT" valign="middle" nowrap><b>Comentario : <br>Principal : <br>Moneda : <br>Banco : <br>Sucursal : <br>Mayor General : <br>Centro de Costo : <br>Lote :<br>Operador : </b></TD>
            <TD ALIGN="LEFT" valign="middle" nowrap class="tdaddinfo"></TD>
          </tr>
        </Table>
      </td>
    </tr>  
  </TABLE>   

<%
  }
%>

<SCRIPT type="text/javascript">
  	document.forms[0].totalRow.value=<%= k %>;
   	function resizeDoc() {
      // divResize(true);
       adjustDifTables('headTable', 'dataTable', 'dataDiv1','','',75);
  	}
  	showChecked("ACCNUM");
  	resizeDoc();
    //getElement("tbAddInfoH").rows[0].cells[0].height = getElement("headTable").rows[0].cells[0].clientHeight;
  	
	function showHiddenDiv(evt) {
		evt = (evt) ? evt : ((window.event) ? window.event : "");
	 	
			var divSearch = document.getElementById("divSearch");
	
			var y=evt.clientY + document.body.scrollTop;
			var x=evt.clientX + document.body.scrollLeft;
		     
			cancelBub(evt);
	
			moveElement(divSearch, y, x);
			setVisibility(divSearch, "visible");
		 
	}
	
	function closeHiddenDivApproval(){
		setVisibility(getElement("divSearch"), "hidden");
	}

	getElement("divSearch").onclick = cancelBub;
	document.getElementById("searchIcon").onclick = showHiddenDiv;
	document.onclick = closeHiddenDivApproval;	
  	
</SCRIPT>

</FORM>

</BODY>
</HTML>
