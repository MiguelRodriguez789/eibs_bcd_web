<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<% 
	String status = " ";
	String client = "0";
	String cuenta = "Cuenta";

	if (userPO.getOption() != null && userPO.getOption().equals("CD")) { 
    	cuenta = "Deposito";
	} else if (userPO.getOption() != null && userPO.getOption().equals("LN")) { 
		cuenta = "Prestamo";
	} 
	
	if (currClient != null) {
  		client = currClient.getE01CUSCUN();
	}
%>

<SCRIPT type="text/javascript">

//ADD LISTENER TO PAGE
addEventHandler(document, 'DOMContentLoaded', function() {
	//Enter Key on Input
    addEventHandler(getElement('NameSearch'), 'keydown', function(event) {
		if(event.which == 13){//Enter Key
			clickElementID('SEARCH_IMG');
		}
    });
    
});	







    if (isValidObject(top.top.opener.AppCode)) {
		if (top.top.opener.AppCode == "RT" || top.top.opener.AppCode == "RM") {
			<% cuenta = "Cuenta"; %>
		}
	}	
	
	function enterAction(code,numc,name,id,ccy,type,prod,card) {
	
		var form = top.opener.document.forms[0];
		if (card.trim() == "") {
			form[top.opener.fieldName].value = code; 
			form[top.opener.fieldName].focus(); 
			form[top.opener.fieldName].select(); 
		} else { 
			form[top.opener.fieldName].value = card;  		
		}
		
        if (isValidObject(top.opener.document.getElementById(top.opener.fieldAux1))) form[top.opener.fieldAux1].value = id;
        if (isValidObject(top.opener.document.getElementById(top.opener.fieldAux2))) form[top.opener.fieldAux2].value = ccy;
        if (isValidObject(top.opener.document.getElementById(top.opener.fieldAux3))) form[top.opener.fieldAux3].value = type;
        if (isValidObject(top.opener.document.getElementById(top.opener.fieldAux4))) form[top.opener.fieldAux4].value = prod;
        if (isValidObject(top.opener.document.getElementById(top.opener.fieldDesc))) form[top.opener.fieldDesc].value = name;

		triggerOnchangeOpener(top.opener.fieldName);
	  	
		top.close();
 	}

	function typeClick(value, row) {
		var divId = getElement('DIVID');
		var divName = getElement('DIVNAME');
		var tableHelp = getElement('TBHELP');
		var top = tableHelp.offsetTop + tableHelp.rows[row].cells[2].offsetTop;
		var left = tableHelp.offsetLeft + tableHelp.rows[row].cells[2].offsetLeft;
		divName.style.top = top - 3;
		divName.style.left = left + 10;
	  	if (value == "I"){
			divName.style.display='none';
			divName.style.zIndex="-1"; 
  			divId.style.top = top - 26;
  			divId.style.left = left + 10;
			displayIdDivs(true, document.forms[0].COUNTRY.value);
			divId.style.zIndex="1";
		} else {
			displayIdDivs(false);
			divId.style.zIndex="-1";
			divName.style.display='block';
			divName.style.zIndex="1";
			document.forms[0].NameSearch.value = "";
			document.forms[0].NameSearch.focus();
		}
	}

	function enterNameSearch(event) {
		var value = getElementChecked("Type").value;
		if (value == "N" || value == "A") {
			enterInteger(event);
		}
	}

	function enter(NameSearch){
	 	var AppCode = top.top.opener.AppCode;
	 	var Bank = top.top.opener.Bank;
	 	var filterType = top.top.opener.Selection;
	 	var Client = "<%= client %>";
	 	var FromRecord = 0;
	 	var Type = getElementChecked("Type").value;
	 	var status = document.forms[0].status.checked ? document.forms[0].status.value : '';
	 	var Account = "";
	
		if (Type == "N") {
			Client = NameSearch;
			NameSearch = ".";
		} else if (Type == "A") { //Account Search
		    Account = NameSearch;
		}
		if (NameSearch.length < 1) {
		  	NameSearch = ".";
		}
		 
		parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0005?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrSelect=" + Type + "@shrType=" + filterType + "@shrClient=" + Client + "@shrAcc=" + Account + "@shrStatus=" + status + "'";	
 	}
 	
 	function searchStart(){
		if (top.top.opener.Customer != null && top.top.opener.Customer > 0) { //help by client, to CD and Loans
			Client = top.top.opener.Customer;
			NameSearch = ".";
		} else {
		  	Client = top.top.opener.Selection;
		}
		document.forms[0].NameSearch.value = Client;
		enter(Client);
 	}
 	
	function searchByName() {
		var NameSearch = document.forms[0].NameSearch.value;
		enter(NameSearch);
	}
	
	function searchById() {
		var IDSearch = validateIdSearch();
		if(!isValidObject(IDSearch)){
			return;
		}
		enter(IDSearch);
	}
	
	function search() {
	 	var Type = getElementChecked("Type").value;
	 	if(Type == 'I'){
	 		searchById();
	 	} else {
	 		searchByName();
	 	}
	}
</SCRIPT>

</HEAD>
<BODY>
<FORM Action="javascript:search()">
	
  <div id="DIVNAME" style="position:absolute; left:25px; top:-50px;">
     <input type="text" name="NameSearch"  size=25 maxlength="30" onkeypress="enterNameSearch(event)">
     &nbsp;&nbsp;<img id="SEARCH_IMG" src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="searchByName(false)"> 
  </div>
  <div id="DIVID" style="position:absolute; left:25px; top:-50px;">
	<jsp:include page="ESD0080_client_id_enter_template.jsp"/>
  </div>
  
  <CENTER>  
	   <table  id="TBHELP" align="center" width="360" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td nowrap width="10%">B&uacute;squeda de Cuentas por :</td>
		  <td nowrap width="30%">
		    <input type="radio" name="Type" value="N" onclick="typeClick('N',0)" checked>N&uacute;mero Cliente
		  </td>		
		  <td nowrap width="60%">
     	  </td>
		</tr>
		<tr>
		  <td nowrap align="left" width="30%">
       		<input type="checkbox" id="status" name="status" value="Y" <%if (status.equals("Y")){out.print(" checked");} %>/>Ver Cerradas 
		  </td>
		  <td nowrap>
		  	<input type="radio" name="Type" id="Type_I" value="I" onclick="typeClick('I',1)">Identificaci&oacute;n 
		  </td>
		  <td nowrap></td>
		</tr>
		<tr>
		  <td nowrap></td>
		  <td nowrap>
		  	<input type="radio" name="Type" id="Type_S" value="S" onclick="typeClick('S',2)">Nombre Corto
		  </td>
		  <td nowrap></td>
		</tr>
		<tr>
		  <td nowrap></td>
		  <td nowrap>
		  	<input type="radio" name="Type" id="Type_W" value="W" onclick="typeClick('W',3)">Por Palabra
		  </td>
		  <td nowrap></td>
		</tr>
	    <tr>
		  <td nowrap></td>
		  <td nowrap>
		  	<input type="radio" name="Type" id="Type_A" value="A" onclick="typeClick('A',4)">Por No. <%=cuenta%>
		  </td>
		  <td nowrap></td>
		</tr>
	 	
 	</table>
 </CENTER>	
	
<SCRIPT Language="Javascript">;
   	clickElement("Type", "N");
   	searchStart();
</SCRIPT>

</FORM>
</BODY>
</HTML>
 