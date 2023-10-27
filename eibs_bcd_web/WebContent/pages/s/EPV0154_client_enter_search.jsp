<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Conexi�n</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">  
	
	function enterAction(code, desc, id) {
 		var form = document.forms[0];
 		form["E01CUN"].value = code;
 		form["E01NME"].value = desc;
 		form["E01IDN"].value = id;
 		form.submit();
	}

	function typeClick(value) {
		if (value == "C") {
			document.getElementById("DIVSUBMIT").style.visibility="visible";
		} else {
			document.getElementById("DIVSUBMIT").style.visibility="hidden"; 
	  	}	
  		document.forms[0].NameSearch.value = "";
  		document.forms[0].NameSearch.focus();
	}
	
	function enterNameSearch() {
		var value = getElementChecked("Type").value;
		if (value == "C") {
			enterInteger(event);
		}
	}

	function enter() {
		var NameSearch = document.forms[0].NameSearch.value;
		var FromRecord = 0;
		var Type ='I';

	
		for (var i = 0; i < document.forms[0].Type.length; i++)	{
			if (document.forms[0].Type[i].checked) {
				Type = document.forms[0].Type[i].value;
			}	
		}
		
		if (NameSearch.length < 1) {
			if (Type == "S"){
				NameSearch.value = " ";
			}else{
				alert("Debe entrar alg�n criterio de b�squeda");
				return false;
			}
		}
		
    
	    if (Type == "C") {
			if (!isIntegerNumber(document.forms[0].NameSearch.value)) {
				alert("Es requerido que se entre un valor Numerico!!!");
				return false;		
			}	    	    
			NameSearch = justifyRight(NameSearch, 9);
		}
		
			
    	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "'";
	}

	function showSearch() {
    	document.getElementById("btnSearch").style.visibility = "visible";
	}

	function hideSearch() {
    	document.getElementById("btnSearch").style.visibility = "hidden";
	}
	
	function isIntegerNumber(value) {
		var valor = true;
		for (n = 0; n < value.length; n++) {
			kcode = value.charCodeAt(n);
			if (!isCharCodeNumber(kcode)){
				valor = false;
				break;
			}
		}
		return valor;
	}
	
	
	function enterCustomer() {
		var ok=false;
		var NameSearch = trim(document.forms[0].NameSearch.value);
		if (NameSearch.length > 0) {
			//to verificate thats customer only numbers
			var value = getElementChecked("Type").value;	
			if (value == "C" && !isIntegerNumber(document.forms[0].NameSearch.value)) {//CUSTOMER
				alert("Es requerido que se entre un valor Numerico!!!");
				ok=false;			
			}else{
				ok=true;
			}			
			document.forms[0].E01CUN.value = NameSearch;
		} else {
			alert("Es requerido que se entre un valor");
			document.forms[0].NameSearch.focus();
			ok=false;
		}
		
		var vretorno = false;
		if (ok){			
			var value = getElementChecked("Type").value;			
			if (value != "C") {//anywhere thats diferent of Customer
				enter();
			}else{				
				vretorno = true;//only return when is C(Customer) and validation is OK.
			}						
		}
		
		return vretorno;		
		
	}
	
	function goSubmit() {
		var ok=false;
		var NameSearch = trim(document.forms[0].NameSearch.value);
		if (NameSearch.length > 0) {
			var value = getElementChecked("Type").value;	
			if (value == "C" && !isIntegerNumber(document.forms[0].NameSearch.value)) {//CUSTOMER
				alert("Es requerido que se entre un valor Numerico!!!");
				ok=false;			
			}else{
				ok=true;
			}
			document.forms[0].E01CUN.value = NameSearch;
		} else {
			alert("Es requerido que se entre un valor");
			document.forms[0].NameSearch.focus();
			ok=false;
		}
		if (ok){
			document.forms[0].submit();
		}
    	
	}
	
</script>

</HEAD>


<body > 

<% 
	String title = userPO.getHeader11();
%>
<h3 align="center"><%= title %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_enter_search, EPV0154"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%><%= userPO.getRedirect()%>" target="_parent" onsubmit="return(enterCustomer());">
	<CENTER>
  		<input type="hidden" name="E01CUN" value="<%= client.getE01CUN() %>">
  		<input type="hidden" name="E01IDN" value="<%= client.getE01IDN() %>">
  		<input type="hidden" name="E01NME" value="<%= client.getE01IDN() %>">
       
  		<table id="TBHELP" align="center">
    		<tr>
	 			<td nowrap>
	   				<table  id="TBHELP" align="center" width="250" border="0" cellspacing="0" cellpadding="0">
						<tr>
		  					<td nowrap id="THHELP">B�squeda por:</td>
						  	<td nowrap><input type="radio" name="Type" value="I" onclick="javascript:showSearch();typeClick('I');" checked="checked">Identificaci&oacute;n</td>
						</tr>
						<tr>
						  	<td nowrap ></td>
						  	<td nowrap><input type="radio" name="Type" value="C" onclick="javascript:showSearch();typeClick('C');">N&uacute;mero</td>		
						</tr>
						<tr>
						  	<td nowrap ></td>
						  	<td nowrap><input type="radio" name="Type" value="S" onclick="javascript:showSearch();typeClick('S');">Nombre Corto</td>
						</tr>
						<tr>
						  	<td nowrap ></td>
						  	<td nowrap><input type="radio" name="Type" value="W" onclick="javascript:showSearch();typeClick('W');">Por Palabra</td>
						</tr>
	   				</table>
		 		</td>
		 		<td nowrap width="168">
	        		<input type="text" name="NameSearch"  size=25 maxlength="30" onkeypress="enterNameSearch()">
	     		</td>
				<TD nowrap width="36">
	        		<div id="btnSearch">
	        			<img id="HELP" src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter()" width="25" height="20">
	        		</div> 
				</TD>
			</tr>
 			
	   		<tr valign="middle">
				<td nowrap colspan="3" align="center">
					<div id=DIVSUBMIT align="center" style="visibility: hidden">
						<input id="EIBSBTN" type="button" name="enviar" value="Enviar" onclick="goSubmit()">					
					</div>
				</td>
			</tr>
			
		</table>
 	</CENTER>
</FORM>

<SCRIPT type="text/javascript">     
<% 		
	if (currClient != null && !currClient.getE01CUSCUN().equals("0")) {
%>
  		document.forms[0].NameSearch.value = "<%= currClient.getE01CUSCUN() %>";
  		enter();	
<%	
	}
%>
	document.forms[0].NameSearch.focus();
	clickElement("Type","S");
	clickElementID("HELP");
	
defer(function(){ return typeof $.fn.pressEnter !== 'undefined'},
	function(){	
	$(document).ready(function(){
		$(document).pressEnter(function(evt){
			if (getRadioVal("Type") === "C"){
				EventTrigger(getElement('EIBSBTN'),'click');
			} else {
			  enter();
			}
		});
	});	
});		
	
</SCRIPT>
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
      	error.setERRNUM("0");
%>
     	<SCRIPT type="text/javascript">
            showErrors();
     	</SCRIPT>
<%
	}
%>
</BODY>
</HTML>
 