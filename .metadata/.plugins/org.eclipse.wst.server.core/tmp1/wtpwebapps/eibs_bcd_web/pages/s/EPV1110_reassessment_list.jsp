<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV111001Message"%>
<%@ page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Reliquidaciones</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EPV1110List" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>
<script	type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/json2.js"></script>

<script type="text/javascript">

function closeHiddenDivNew(){
  setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
  evt = (evt) ? evt : ((window.event) ? window.event : "");
  var hiddenDivNew = getElement("hiddenDivNew");
  var y=evt.clientY + document.body.scrollTop;
  var x=evt.clientX + document.body.scrollLeft;
  cancelBub(evt);
  moveElement(hiddenDivNew, y, x);
  setVisibility(hiddenDivNew, "visible");
}
addEventHandler(document, 'click', closeHiddenDivNew);

function goNew(op,row) {
	var serialize = $('form').serialize();
	var prlAcr = getElement('E01PRLACR').value;
	var url = "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1110?SCREEN="+ op + "&ajaxRequest=Y&E01PRLACR=" + prlAcr;
	
	$.ajax({
		  type: 'POST',
		  url: "${pageContext.request.contextPath}/servlet/datapro.eibs.salesplatform.JSEPV1110?SCREEN="+ op + "&ajaxRequest=Y&E01PRLACR=" + prlAcr,
          cache: false,
          data: serialize,
	  
        error: function(e) { 
			//todo;
        },
        success : function(response){
        	var data = response;
        	if (data.type == "error") {
        		showErrors();
        	} else {
        		goAction('200');
        	}        
        }
	});	
	closeHiddenDivNew();
}

function goAction(op ,row) {
	clickElement("keys", row);
	var prlAcr = getElement('E01PRLACR').value;
	if (op == '400') {
		if (confirm("Desea eliminar este registro seleccionado?")) {
			getElement("SCREEN").value = op;
			document.forms[0].submit();		
		}
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1110?SCREEN="+op;		
		url += "&E01PRLACR=" + prlAcr;
		if (op =='300' || op == '301') {				
			url += "&keys=" + getElementChecked('keys').value;		
		}	
		openWindow(url, 1000, 480, 2);		
	}
	hideMenu();		
}

function openWindow(u, w1, h1, tp){
	var name = getNameFromUrl(u);
	var nm = name;
	var w = screen.width;
	var h = screen.height+150;
	var posTop = (h-h1)/2;
	var posLeft = (w-w1)/2; 
	var position = 'left='+posLeft+',top='+posTop+',height='+h1+',width='+w1;
	var listin = null;
	switch (tp){
    	case 1:
			listin = window.open(u,nm,position);
			break;
    	case 2:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
    		break;
    	case 3:
			listin = window.open(u,nm,'scrollbars=yes,'+position);
			break;
    	case 4:
			listin = window.open(u,nm,'toolbar=yes,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
    		break;
    	case 5:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,'+position);
    		break;
    	case 6:
			listin = window.open(u,nm,'scrollbars=yes,'+position);
			break;
    	case 7:
			listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,'+position);
    		break;
	}
	listin.focus();
	return listin;	
}

function updateTotal(nSuma) {  
  try {
  	<%--Update Values in Distribution Section, Argument Notifies that 
		"Reliquidates Assets" called the function.
	  --%>	
		if (isValidObject(parent.document.forms[0].RCTOT)) {
			parent.document.forms[0].RCTOT.value = formatCCY(nSuma);
			parent.updateDist("RC");
		}
  } catch(e) {
     scriptLog("updateTotal: "+ e, false);
  }
}

function hideMenu() {
	if (!(document.getElementById("menuRC") == null)) {
		if (document.getElementById("menuRC").style.display == 'none') {
			document.getElementById("menuRC").style.display = '';
			resizeIFrame(true);
		} else {
			document.getElementById("menuRC").style.display = 'none';
			resizeIFrame(false);
		}
	}
}

function showMenu(firstTime) {
	if(isValidObject(document.getElementById("menuRC") && !firstTime)){
		if (document.getElementById("menuRC").style.display == 'none') {
			document.getElementById("menuRC").style.display = '';
			resizeIFrame(true);
		} 
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifremprc"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifremprc").height = nHeight;
	}	
}

function editControl(status) {
	// Inactivo por solicitud del banco
	status = "N";
	if (status == "Y") {
		if (isValidObject(parent.document.forms[0].E01DEARET)) {
			if (parent.document.forms[0].E01DEARET.value != "F") {
				$("#linkMenu").attr("onclick","");
				$("#linkMenu").prop('disabled', 'disabled');
			}
		} else {
			$("#linkMenu").attr("onclick","");
			$("#linkMenu").prop('disabled', 'disabled');
		}
	}
}
	
</script>

</head>

<body>
<% 
  if (!error.getERRNUM().equals("0")) {
    error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
    out.println("	showErrors();");
    out.println("</SCRIPT>");
  }
%>
<% 
  //Si es blanco viene llamado por menu, sino viene llamdo desde la una pantalla 
  //Determines if a Header is Shown.
  String emp = (String)session.getAttribute("EMPRC");
  emp = (emp==null)?"":emp; 
%>

<%if ("".equals(emp)){ %>
<h3 align="center">Listado de Reliquidacion<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reassessment_list.jsp,EPV1110"></h3>
<hr size="4">
<%}%>
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1110">
  <input type="hidden" name="SCREEN" id="SCREEN" value="201">
  <input type="hidden" name="HEADER4" id="HEADER4" value="<%=userPO.getHeader4()%>">
  <input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value=""> 
  
  <div id="hiddenDivNew" class="hiddenDiv">
    <%int row = 0; %>
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=CENTER width="18%"> 
          <div align="right">Cuenta :</div>
        </td>
        <td align=CENTER width="34%"> 
          <div align="left"> 
            <eibsinput:help property="E01PRLACR" fn_param_one="E01PRLACR" fn_param_two="" fn_param_three="10" fn_param_five="<%=userPO.getCusNum()%>"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" />
          </div>
        </td>
      </tr>
      <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">  
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goNew('200')">
        </td>
      </tr>
    </table>
  </div>

  <%if ("".equals(emp)){ %>
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="10%" align="right"> Cliente : 
              </td>
             <td nowrap width="10%" align="left">
	  			<eibsinput:text name="userPO" property="cusNum" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
             </td>
             <td nowrap width="10%" align="right"> Propuesta : 
               </td>
             <td nowrap width="50%"align="left">
   		        <input type="text" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
             </td>
         </tr>
        </table>
      </td>
    </tr>
  </table>
  <table class="tbenter" width="100%">
    <tr>
      <td align="center" class="tdbkg" width="20%"><div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div></td> 
      <td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
      <td align="center" class="tdbkg" width="20%"><a href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
      <td align="center" class="tdbkg" width="20%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
<!--  
		<td align="center" class="tdbkg" width="33%"><a href="javascript:goAction('201')"> <b>Reliquidar</b> </a></td>
		<td align="center" class="tdbkg" width="33%"><a href="javascript:goAction('202')"> <b>No Reliquidar</b> </a></td>
		<td align="center" class="tdbkg" width="33%"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></td>
-->
	</tr>
 </table>

<%}else if ("A".equals(emp)){%>
    <input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
    <input type="hidden" name="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
	<h4>Reliquidacion de Creditos</h4>
<%}else{%>
    <input type="hidden" name="cusNum" size="13" maxlength="12" value="<%= userPO.getCusNum()%>" readonly>		
   	<input type="hidden" name="PorfNum" id="PorfNum" size="13" maxlength="12" value="<%= userPO.getPorfNum()%>" readonly>
    <a id="linkMenu" href="#" onclick="hideMenu();"><b>Reliquidaciones de Creditos</b></a>
    <br><br>
    <table id="menuRC" class="tbenter" width="100%" >
      <tr>
        <td align="center" class="tdbkg" width="33%"><div id="eibsNew" align="center" style="cursor:pointer"><a><b>Crear</b></a></div></td>
        <td align="center" class="tdbkg" width="33%"><a href="javascript:goAction('300')"> <b>Modificar</b> </a></td>
        <td align="center" class="tdbkg" width="33%" style="display: <%= (EPV1110List.isEmpty()) ? "none": "" %> "><a href="javascript:goAction('400')"> <b>Borrar</b> </a></td>
<!--  
        <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('201')"> <b>Reliquidar</b> </a></td>
        <td align="center" class="tdbkg" width="50%"><a href="javascript:goAction('202')"> <b>No Reliquidar</b> </a></td>
-->
      </tr>
    </table>
<%}%>  
 <table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
   <tr  height="5%"> 
     <td NOWRAP valign="top" width="100%"> 
	<table id="headTable" width="100%">
		<tr id="trdark">
			<th align="center" nowrap width="2%">&nbsp;</th>
			<th align="center" nowrap width="5%">Sec</th>						
			<th align="center" nowrap width="10%">Prestamo</th>
			<th align="center" nowrap width="30%">Producto</th>			
			<th align="center" nowrap width="11%">Saldo Deuda</th>	
			<th align="center" nowrap width="11%">Condonado</th>
			<th align="center" nowrap width="11%">Pagado</th>
			<th align="center" nowrap width="11%">Diferido</th>
			<th align="center" nowrap width="12%">Reliquidar</th>
		</tr>
       </table>
     </td> 
   </tr>    
   <tr  height="95%">    
	    <td nowrap="nowrap">      
	       <div id="dataDiv1" style="height:80px; overflow:auto;"> 
	       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
			<%	
				double suma = 0;
				EPV1110List.initRow();
					int k = 0;
					boolean firstTime = true;
					String chk = "";
					while (EPV1110List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						EPV111001Message datarec = (EPV111001Message) EPV1110List.getRecord();
						suma += datarec.getBigDecimalE01PRLMTO().doubleValue();
			%>
			<tr id="dataTable<%= EPV1110List.getCurrentRow() %>">
				<td nowrap align="center" width="2%" ><input type="radio" name="keys" value="<%=EPV1110List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="showMenu();highlightRow('dataTable',<%=EPV1110List.getCurrentRow()%>)"/></td>
				<td nowrap align="center" width="5%" ><a href="javascript:goAction('301',<%=EPV1110List.getCurrentRow()%>);" onclick="hideMenu();"><%=datarec.getE01PRLSEQ()%></a></td>
				<td nowrap align="right"  width="10%"><a href="javascript:goAction('301',<%=EPV1110List.getCurrentRow()%>);" onclick="hideMenu();"><%=datarec.getE01PRLACR()%></a></td>
				<td nowrap align="left"   width="30%"><a href="javascript:goAction('301',<%=EPV1110List.getCurrentRow()%>);" onclick="hideMenu();"><%=datarec.getE01DSCPRD()%></a></td>																		
				<td nowrap align="right"  width="11%"><a href="javascript:goAction('301',<%=EPV1110List.getCurrentRow()%>);" onclick="hideMenu();"><%=datarec.getE01PRLSTO()%></a></td>
				<td nowrap align="right"  width="11%"><a href="javascript:goAction('301',<%=EPV1110List.getCurrentRow()%>);" onclick="hideMenu();"><%=datarec.getE01PRLCTO()%></a></td>
				<td nowrap align="right"  width="11%"><a href="javascript:goAction('301',<%=EPV1110List.getCurrentRow()%>);" onclick="hideMenu();"><%=datarec.getE01PRLPTO()%></a></td>
				<td nowrap align="right"  width="11%"><a href="javascript:goAction('301',<%=EPV1110List.getCurrentRow()%>);" onclick="hideMenu();"><%=datarec.getE01PRLDTO()%></a></td>
				<td nowrap align="right"  width="12%"><a href="javascript:goAction('301',<%=EPV1110List.getCurrentRow()%>);" onclick="hideMenu();"><%=datarec.getE01PRLMTO()%></a></td>
			</tr>
			<% } %>
           </table>
         </div>
       </td>
     </tr>
</table>
	<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
		<tr bgcolor="#FFFFFF">
			<td align="center" nowrap width="2%" >&nbsp;</td>
			<td align="center" nowrap width="2%" >&nbsp;</td>						
			<td align="center" nowrap width="10%">&nbsp;</td>
			<td align="center" nowrap width="30%" >&nbsp;</td>
			<td align="center" nowrap width="11%">&nbsp;</td>
			<td align="center" nowrap width="11%">&nbsp;</td>
			<td align="center" nowrap width="11%">&nbsp;</td>
			<td nowrap align="right" width="11%" ><b>TOTAL : </b> </td>
			<td nowrap align="right" width="12%" ><b><%=datapro.eibs.master.Util.formatCCY(suma)%></b></td>
		</tr>								
	</table>

</form>

<% if (!EPV1110List.getNoResult()) { %> 
<SCRIPT type="text/javascript">
	showChecked("key");
</SCRIPT>
<% } %>

<%-- Server sends "S" in "ACT" to signify change in iframe section. 
	 Frame calls to upate Distribution in parent.
	 *Note only Values paid through "Desembolso are reflected.
 --%>
<% if ("S".equals(request.getAttribute("ACT"))){ %>
<SCRIPT type="text/javascript">
	updateTotal(<%=suma%>);
</SCRIPT>
<% } %>

<SCRIPT type="text/javascript">
 	getElement("hiddenDivNew").onclick=cancelBub;
 	if(isValidObject(getElement("eibsNew")))getElement("eibsNew").onclick=showHiddenDivNew;
	if (!(document.getElementById("menuRC") == null)) {
		document.getElementById("menuRC").style.display = 'none';
	}
	<%-- CSS of Iframe. Adjusts Height of frame. --%>
	if (isValidObject(parent.document.getElementById("ifremprc"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifremprc").height;
	}	
</SCRIPT>

<script type="text/javascript">

$( document ).ready(function() {
	$.ajaxSettings.cache = false;
	editControl('<%=userPO.getHeader4()%>');
});

</script>


</body>
</html>
