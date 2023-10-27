<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.presentation.input.EibsInputFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<HTML>
<HEAD>
<TITLE> Lista de Cuentas a Aprobar </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "searchParameters" class= "datapro.eibs.beans.EPV140001Message"  scope="session" />
<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
	var reason = '';
	var accOfac = '';
	var accWarn = '';

	function goAction(op) {
		var op2 = '';
		if (op == 'Z') {op2 = 'A';} else {op2 = op;}

		getElement("action").value = op2;
		getElement("reason").value = reason;
     
		if (!isValidObject(getElement("ACCNUM"))) {
	 		if (op == 'Search'){
				getElement('SCREEN').value = 5; //Request Filtered List
        		document.getElementsByTagName('body')[0].className = 'waiting';		        	
        		document.forms[0].submit();			
	 		}else{
				alert("Debe seleccionar un registro.");
				return;
	 		}
		}
		
  		if (op == 'Search'){
			getElement('SCREEN').value = 5; //Request Filtered List
        	document.getElementsByTagName('body')[0].className = 'waiting';		        	
        	document.forms[0].submit();	
  		}else if (op == 'D') {
			if (confirm("Desea eliminar el registro seleccionado?")) {
				document.forms[0].submit();		
			}
		} else if (op == 'R'){
			if (confirm("Desea rechazar el registro seleccionado?")) {
				document.forms[0].submit();		
			}
		} else if (op == 'Z') {
			if (confirm("Desea aprobar el registro seleccionado?")) {
				document.forms[0].submit();		
			}
		} else if (op == 'M') {
			if (confirm("Desea modificar el registro seleccionado?")) {
				document.forms[0].SCREEN.value = '400';
				document.forms[0].submit();		
			}
		}else if (op == 'A') {
			if (accOfac.trim() != "") {
				var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + accOfac + "&shrCategory=ALL" + "&FromRecord=0&shrAction=APV";
				CenterWindow(page, 600, 500, 2);
			} else if (accWarn.trim() != "") {
				var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + accWarn+"&APP=1";
				CenterWindow(page, 420, 300, 2);
			} else {
				document.forms[0].submit();
			}
		}else{
			alert("Debe seleccionar un registro.");
			return;
		}
		
	}
  
 	function goExit(){
    	window.location.href="<%=request.getContextPath()%>/pages/background.jsp";
  	}

 	function extraInfo(textfields, noField) {
 		var pos = 0;
 		var s = textfields;
 		for ( var i=0; i<noField ; i++ ) {
   			pos = textfields.indexOf("<br>", pos+1);
  		}
 		s = textfields.substring(0, pos);
 		return s;
 	}
 
 	function showAddInfo(idxRow) {
   		getElement("tbAddInfo").rows[0].cells[1].style.color = "#d0122c";   
   		getElement("tbAddInfo").rows[0].cells[1].innerHTML = extraInfo(getElement("TXTDATA"+idxRow).value, 9);   
   		if (getElement("STSOFAC"+idxRow).value == "3") {
            accOfac = getElementChecked("ACCNUM").value;
   		} else {
      		accOfac = "";
   		}

 		if (getElement("STSWARN"+idxRow).value == "A") {
        	accWarn = getElementChecked("ACCNUM").value;
   		} else {
      		accWarn = "";
   		}

   		for ( var i=0; i<getElement("dataTable").rows.length; i++ ) {
       		getElement("dataTable").rows[i].className = "trnormal";
    	}
   		getElement("dataTable").rows[idxRow].className = "trhighlight";
  	}   

	function showInqOFAC(fieldValue){
		var formLength = document.forms[0].elements.length;
   		for (n=0; n<formLength; n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue = document.forms[0].elements[n].value;
      		if (elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
		CenterWindow(page, 600, 500, 2);    
 	}

	function showInqWarn(fieldValue) {
		var formLength = document.forms[0].elements.length;
   		for (n=0; n<formLength; n++) {
      		var elementName= document.forms[0].elements[n].name;
      		var elementValue= document.forms[0].elements[n].value;
      		if(elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		var page = "${pageContext.request.contextPath}/servlet/datapro.eibs.alerts.JSESD0000?ACCNUM=" + fieldValue;
		CenterWindow(page, 420, 300, 2);    
 	}

	
</script>

</HEAD>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif')">

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	} 
%>

<h3 align="center">Aprobaci&oacute;n de Cr&eacute;dito</h3>
<hr size="4">
	<% String appCode = userPO.getApplicationCode();
		String generic = "";
		String title = "Credito";%>	

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1400" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="3">
	<INPUT TYPE=HIDDEN NAME="action" id="action" VALUE="A">
	<INPUT TYPE=HIDDEN NAME="reason" id="reason" VALUE="">
	<INPUT TYPE=HIDDEN NAME="totalRow" id="totalRow" VALUE="<%= appList.getLastRec() %>">
	<input type="hidden" name="typCode" id="typCode" value="<%= userPO.getHeader1() %>" />
	<input type="hidden" name="oviCode" id="oviCode" value="<%= userPO.getHeader2() %>" />
	<input type="hidden" name="stsCode" id="stsCode" value="<%= userPO.getHeader3() %>" />
	<input type="hidden" name="appCode" id="appCode" value="<%= userPO.getApplicationCode() %>" />

	<% if ((userPO.getHeader1().equals("S")) && (userPO.getHeader3().equals("H"))) { %>
	<!-- Avalados Incompletos -->
  <TABLE class="tbenter" width="100%" align=center>
    <TR> 
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('M')"><b>Modificar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>  
    </TR>
  </TABLE>
	<% } else { %>
  <TABLE class="tbenter" width="100%" align=center>
    <TR> 
      <TD class=TDBKG width="25%"> 
        <div align="center"><a name="linkApproval" href="javascript:goAction('A')"><b>Aprobar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a name="linkReject" href="javascript:enterReason('R')"><b>Rechazar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')"><b>Eliminar</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </TD>  
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
				<a id="linkHelp" href="javascript:GetProduct('E01SELPRD','<%= appCode%>','<%=currUser.getE01UBK()%>','', 'E01SELTYP')">
				<img src="${pageContext.request.contextPath}/images/1b.gif" title="null" align="bottom" border="0"/>
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
  
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 <tr height="5%">
	<td NOWRAP valign="top" width="80%">
  		<TABLE id="headTable" width="100%" >
		  <TR id="trdark"> 
		    <TH ALIGN=CENTER rowspan="2" nowrap width="5%"><img id="searchIcon"src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" ></TH>
		    <TH ALIGN=CENTER rowspan="2" nowrap width="20%">Cuenta</TH>
		    <TH ALIGN=CENTER colspan="2" nowrap width="55%">Cliente</TH>
		    <TH ALIGN=CENTER rowspan="2" nowrap width="20%">Producto<br>Tipo C&oacute;digo </TH>
		  </TR>
		  <TR id="trdark"> 
		    <TH ALIGN=CENTER nowrap width="15%">N&uacute;mero</TH>
		    <TH ALIGN=CENTER nowrap width="40%">Nombre</TH>
		  </TR>
 		 </TABLE>
  		</TD>
  		<TD nowrap ALIGN="RIGHT" valign="top" width="20%">
	        <Table id="tbAddInfoH"  width="100%" >
	        <tr id="trdark">
	            <TH ALIGN=CENTER nowrap > Informaci&oacute;n B&aacute;sica</TH>
	        </tr>
	      	</Table>
  		</TD>
  	</TR>	
  	<TR height="95%"> 
    	<TD NOWRAP valign="top" width="80%">
			  	<div id="dataDiv1" style=" height:400px; overflow:auto;">  
			    <table id=dataTable cellspacing="0" cellpadding="1" border="0" width="100%" >
		<%
			if (appList.getNoResult()){
		%>		 
          <tr id="dataTable"> 
			<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
				<br><br><br><br> <font size=3>No hay <%=title%> para la Aparobaci&oacute;n con esta criteria. </font>
			</TD>          
		 </tr>
		 <%}else{ 
			                appList.initRow();
			                while (appList.getNextRow()) {
			                	out.println(appList.getRecord());
			                }
		 				}
			    %> 
   				</table>
   				</div>


    </td> 
    
   <td nowrap ALIGN="RIGHT" valign="top" width="20%">
   <%int row = 0; %>
     <Table id="tbAddInfo">
      <tr id="trclear"> 
         <TD ALIGN="RIGHT" nowrap><b>Comentario : <br>Capital : <br>Moneda : <br>Banco : <br>Sucursal : <br>Mayor General : <br>Centro de Costo : <br>Lote :<br>Operador : </b></TD>
         <TD ALIGN="LEFT" nowrap class="tdaddinfo"></TD>
      </tr>
     </Table>
  </td>
 </tr>	
</TABLE>

<SCRIPT type="text/javascript">
  showChecked("ACCNUM");
  getElement("tbAddInfoH").rows[0].cells[0].height = getElement("headTable").rows[0].cells[0].clientHeight;
  
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

	addEventHandler(document, 'click', closeHiddenDivApproval);	  
</SCRIPT>


</FORM>

</BODY>
</HTML>
