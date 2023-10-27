<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Conexión</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<script type="text/javascript" > 
	function enterAction(code,desc,id) {
 		var form = document.forms[0];
 		form["E01CUN"].value = code;
 		form["E01IDN"].value = id;
 		form.submit();
	}

	function typeClick(value) {
		if (value == "I" || value == "D") {    
			document.getElementById('DIVNAME').style.display='none' ;
			displayIdDivs(true);
		} else {
			displayIdDivs(false);
			document.getElementById('DIVNAME').style.display='block' ;
		}
		if (value == "I" || value == "D"){
			if(isValidObject(document.forms[0].COUNTRY)){
			    document.forms[0].COUNTRY.focus();
			}
		} else{
			document.forms[0].NameSearch.focus();
		}
		if (value == "I" || value == "N"|| value == "D"){
			document.getElementById('DIVSUBMIT').style.display="block";   
		} else {
			document.getElementById('DIVSUBMIT').style.display="none"; 
		}
		if (value == "N"){
			document.getElementById('btnSearch').style.display="none";
		} else {
			document.getElementById('btnSearch').style.display="inline";
		}
	}
	
	function validateSearch(type){
		if (type == "I"){
			return validateIdSearch();
	    } else {
	    	var NameSearch = document.getElementById("NameSearch").value;
	    	if (NameSearch.length < 1) {
				alert("Debe entrar algún criterio de búsqueda");
				return;
			}
	    	return NameSearch;
	    }	
	}
	
	function searchByName(){
		var Type = getElementChecked("Type").value;
		var NameSearch = validateSearch(Type);
		if(!isValidObject(NameSearch)){
			return;
		}
		var FromRecord = 0;
		var url = "/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord;
    	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>"+escapeURLParam(url)+ "'";
	}
	function searchById(){
		var Type = getElementChecked("Type").value;
		var NameSearch = validateSearch(Type);
		if(!isValidObject(NameSearch)){
			return;
		}
		var FromRecord = 0;
		var url = "/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord;
    	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>"+escapeURLParam(url)+ "'";
	}

	function enterRUT() {
		var Type = getElementChecked("Type").value;
		var NameSearch = validateSearch(Type);
		if(isValidObject(NameSearch)){
			if(Type == "I"){
				document.getElementById("E01CUN").value = "0";
				document.getElementById("E01IDN").value = NameSearch;
			} else {
				document.getElementById("E01IDN").value = "";
				document.getElementById("E01CUN").value = NameSearch;
			}
		    if (document.getElementById('DIVSUBMIT').style.display.trim() != "") return true;
		}
		return false;
	}
	
	function enterNameSearch(event) {
		var value = getElementChecked("Type").value;
		if (value == "N") {
			enterInteger(event);
		}
	}
</script>

</HEAD>


<body >

<h3 align="center">Consulta de Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_inq_both_enter_search, ESD0080"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" target="_parent" onsubmit="return (enterRUT());">
  <CENTER>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type="hidden" name="E01CUN" id="E01CUN" value="<%= client.getE01CUN() %>" size=15 maxlength=9 >
  <input type="hidden" name="E01IDN" id="E01IDN" value="<%= client.getE01IDN() %>" size=15 maxlength=9 >
       
  <table id="TBHELP" align="center">
    <tr>
	 <td nowrap>
	   <table  id="TBHELP" align="center" width="250" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td nowrap id="THHELP">B&uacute;squeda por:</td>
		  <td nowrap><input type="radio" name="Type" id="Type_N" value="N" onclick="typeClick('N')" checked="checked">N&uacute;mero</td>		
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" id="Type_I" value="I" onclick="typeClick('I')">Identificaci&oacute;n</td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" id="Type_S" value="S" onclick="typeClick('S')">Nombre Corto</td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" id="Type_W" value="W" onclick="typeClick('W')">Por Palabra</td>
		</tr>
	   </table>
	 </td>
	 <td nowrap>
		<div id="DIVNAME" style="position:relative; display:none;">
        	<input type="text" id="NameSearch" name="NameSearch" size=25 maxlength="30" onkeypress="enterNameSearch()">
			&nbsp;&nbsp;<img id="btnSearch" src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="searchByName()" width="25" height="20"> 
       </div>
       
		<jsp:include page="ESD0080_client_id_enter_template.jsp"/>
     </td>

	</tr>
	
   <tr valign="middle">
		<td nowrap colspan="3" align="center">
		<p>
		<div id=DIVSUBMIT align="center">
			<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
		</div>
		</td>
	</tr>
      
 </table>
 </CENTER>
</FORM>
<SCRIPT type="text/javascript">;     
	document.getElementById('Type_N').click();
    <% 		
 		if (currClient != null && !currClient.getE01CUSCUN().equals("0")) {
  	%>
  			document.forms[0].NameSearch.value = "<%= currClient.getE01CUSCUN() %>";
  			enterRUT();	
 	<%	}
		%>
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
 