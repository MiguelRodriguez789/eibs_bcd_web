<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EPV113001Message" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import = "datapro.eibs.master.Util" %>


<head>
<title>Plan Fomento</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EPV113001List" class="datapro.eibs.beans.JBObjList"     scope="session" />
<jsp:useBean id= "error"         class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO"        class= "datapro.eibs.beans.UserPos"      scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

function goAction(op) {
	if ((op != '200') && (!isValidObject(getElement("currRow")))) {
		alert("Debe seleccionar un registro.");
		return;
	}
	if ((op == '202') ) {
		if (op == '202') chk = confirm("Desea eliminar el registro seleccionado?");
		if (!chk) return;
		getElement("SCREEN").value = op;
		document.forms[0].submit();	
		sessionStorage.setItem('deleted?','true');
	} else {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1130?SCREEN="+op;
		if (op != '200') {
			url += "&currRow=" + getElementChecked('currRow').value;
		}else{
			if(getElement('E01PFNCUP') == null){
			url += "&E01PFNCOD=" + getElement('E01PFNCOD').value;
			}else{
			url += "&E01PFNCUP=" + getElement('E01PFNCOD').value + "&E01PFNCSQ="+ getElement('E01PFNCSQ').value;
			}
		}
		CenterWindow(url, 900, 500, 5);		
	}
	hideMenu();
	addEventHandler(document, 'click', closeHiddenDivNew);	
}

function hideMenu() {
	if (document.getElementById("Fomento").style.display == 'none') {
		document.getElementById("Fomento").style.display = '';
		resizeIFrame(true);
	} else {
		document.getElementById("Fomento").style.display = 'none';
		resizeIFrame(false);
	}
}

function resizeIFrame(lMenu) {
	var nHeight = 0;	
	var nMenu = 60;
	if (isValidObject(parent.document.getElementById("ifrempfm"))) {
		nHeight = parseInt(document.getElementById("IFRHEIGHT").value);
	}
	if (nHeight > 0) {
		nHeight = lMenu ? nHeight + nMenu : nHeight;
		parent.document.getElementById("ifrempfm").height = nHeight;
	}	
}

function closeHiddenDivNew(){
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	 
}
	document.ondblclick= closeHiddenDivNew;

</script>

</head>

<body>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("	showErrors()");
		out.println("</SCRIPT>");
	}
%>
<% 
	String emp = (String)session.getAttribute("EMPFM");
 	emp = (emp==null)?"":emp;//
%>

<form method="POST" name="FomentoTable" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1130">
	<input type="hidden" name="SCREEN" id="SCREEN" value="201">
	<input type="hidden" name="IFRHEIGHT" id="IFRHEIGHT" value=""> 
	<input type="hidden" name="E01PFNCUN"  value="<%= userPO.getCusNum()%>" >
	<input type="hidden" id="E01PFNBNK"  value="<%= userPO.getBank()%>" >		
	<input type="hidden" id="E01PFNPRD"  value="<%= userPO.getProdCode()%>" >		
		
	<br><br>
	
     
<%if ("A".equals(emp)){%>
	<h4>Fomento</h4>
	
<%}else{%>
	<a href="#" onclick="hideMenu();" id="TITLE"><b>Fomento</b></a>
	<br><br>
	
<div id="hiddenDivNew" class="hiddenDiv">
    <table id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');" width="400">
      
      <tr id="trdark"> 
		<td align=CENTER width="10%"> 
          <div align="right">No. Plan de Fomento :</div>
        </td>
        <td align=CENTER width="10%"> 
          <div align="left"> 
             <input type="text" name="E01PFNCOD" size="5" maxlength="4" readonly >
				<a href="javascript: GetFomento('E01PFNCOD',document.forms[0].E01PFNBNK.value,document.forms[0].E01PFNPRD.value)"> 
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0">
			  	</a>
          </div>
        </td>
      </tr>
      <tr id="trclear"> 
        <td align=center nowrap colspan="2"> 
          <input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="javascript:goAction('200')">
        </td>
      </tr>      
    </table>
  </div>  	
	<table id="Fomento" class="tbenter" width="100%">
		<tr>
		<%if(EPV113001List.isEmpty()){%>
		<td align="center" id="NewPlan" class="tdbkg" width="25%"><a href="javascript:getParentValues()"> <b>Crear</b></a></td>
		<%}else{%>
			<td align="center" id="NewPlan" width="1%"><b></b></td>
		<%}%>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('201')"> <b>Modificar</b> </a></td>
			<td align="center" class="tdbkg" width="25%"><a href="javascript:goAction('202')"> <b>Borrar</b> </a></td> 
		</tr>
	</table>
	
<%}%> 
		
	
	<table id="mainTable" class="tableinfo" style="height:80px;" width="100%">
		<tr height="5%"> 
			<td NOWRAP valign="top" width="100%"> 
				<table id="headTable" width="100%">
					<tr id="trdark">
						<th align="CENTER" nowrap width="2%"  >           </th>
						<th align="CENTER" nowrap width="5%" >  Sec      </th>
						<th align="CENTER" nowrap width="15%" >  No.Cliente  </th>
						<th align="LEFT" nowrap width="35%" >Descripci&oacute;n</th>
						<th align="CENTER" nowrap width="12%" >  Monto </th>
						<th align="CENTER" nowrap width="12%" >  Tasa Int&eacute;res  </th>
						<th align="CENTER" nowrap width="12%" >	Valor Cuota  </th>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="95%">    
			<td nowrap="nowrap">      
				<div id="dataDiv1" style="height:080px; overflow:auto;"> 
					<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
					<%
					   EPV113001List.initRow();
					   double suma = 0;
					   int k = 0;
					   boolean firstTime = true;
					   String chk = "";
					   while (EPV113001List.getNextRow()) {
					     if (firstTime) {
					       firstTime = false;
					       chk = "checked";
					     } else {
					       chk = "";
					     }
					     EPV113001Message convObj = (EPV113001Message) EPV113001List.getRecord();
					     suma += convObj.getBigDecimalE01PFNOAM().doubleValue();
					     
					%>
						<tr id="dataTable<%= EPV113001List.getCurrentRow() %>">
							<td nowrap align="CENTER" width="2%" ><input type="radio" name="currRow" value="<%=EPV113001List.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= EPV113001List.getCurrentRow() %>)"/></td>
							<td nowrap align="CENTER" width="5%" ><a href="javascript:goAction('300');"><%=Util.formatCell(convObj.getE01PFNSEQ())%></a></td>
							<td nowrap align="CENTER" width="15%" ><a href="javascript:goAction('300');"><%=Util.formatCell(convObj.getE01PFNCUP())%></a></td>
							<td nowrap align="LEFT"   width="34%"><a href="javascript:goAction('300');"><%=convObj.getE01PFNDSC()%></a></td>
							<td nowrap align="RIGHT" width="12%" ><a href="javascript:goAction('300');"><%=convObj.getE01PFNOAM()%></a></td>
							<td nowrap align="CENTER" width="12%" ><a href="javascript:goAction('300');"><%=convObj.getE01TOTRTE()%></a></td>
							<td nowrap align="CENTER" width="12%" ><a href="javascript:goAction('300');"><%=convObj.getE01PFNVCU()%></a></td>
						</tr>
					<%}%>
					 </table>
				 </div>
			 </td>
		 </tr>
	</table>
	<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">   
		<tr bgcolor="#FFFFFF">
			<td nowrap width="2%">&nbsp;</td>
			<td nowrap width="5%">&nbsp;</td>
			<td nowrap width="15%">&nbsp;</td>
			<td nowrap align="right" width="34%"><b>TOTAL : </b> </td>
			<td nowrap align="right" width="12%"><b><%=datapro.eibs.master.Util.formatCCY(suma)%></b></td>
			<td nowrap align="right" width="12%"></td>
			<td nowrap align="right" width="12%"></td>
		</tr>								
	</table>	
	
	

</form>

<SCRIPT type="text/javascript">
	showChecked("currRow");  
	document.getElementById("Fomento").style.display = 'none';
	document.getElementById("NewPlan").onclick=showHiddenDivNew;  
	if (isValidObject(parent.document.getElementById("ifrempfm"))) {
		document.getElementById("IFRHEIGHT").value = parent.document.getElementById("ifrempfm").height;
	}	
	
	<%if(EPV113001List.isEmpty()){%>
		if(sessionStorage.getItem('deleted?') != null){
		clickElementID("TITLE");
		}
	<%}%>
	
	function getParentValues(){
		var product =  parent.document.getElementsByName("E01DEAPRO");
		var bank = parent.document.getElementsByName("E01DEABNK"); 
		
		document.getElementById("E01PFNPRD").value = product[0].value;
		document.getElementById("E01PFNBNK").value = bank[0].value;
	}
	
</SCRIPT>

</body>

