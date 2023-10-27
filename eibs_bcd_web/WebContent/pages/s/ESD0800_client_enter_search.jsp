<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>

<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Conexión</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript">  

	function enterAction(code, desc, id) {
 		var form = document.forms[0];
 		form["E01CUSCUN"].value = code;
 		form["E01CUSIDN"].value = id;
 		form.submit();
	}

<% 	if (currClient.getH01WK1().equals("1")) { %>
    	parent.parent.client.document.forms[0].E01CUSIDN.value = "<%= currClient.getE01CUSIDN() %>";
    	parent.parent.client.document.forms[0].E01CUSNA1.value = "<%= currClient.getE01CUSNA1() %>";
    	parent.parent.client.document.forms[0].E01RELBAN.value = "<%= currClient.getE01RELBAN() %>";
 <% } %>
     
	function typeClick(value, row) {
  		if (value == "N") {    
      		document.getElementById('DIVSUBMIT').style.display = "";
  		} else {   
  			document.getElementById('DIVSUBMIT').style.display = "none"; 
  		}
  		document.getElementById('DIVNAME').style.pixelTop = document.getElementById('TBHELP').offsetTop + document.getElementById('TBHELP').rows[row].cells[2].offsetTop;
  		document.getElementById('DIVNAME').style.pixelLeft = document.getElementById('TBHELP').offsetLeft + document.getElementById('TBHELP').rows[row].cells[2].offsetLeft;   
  		document.forms[0].NameSearch.value = "";
  		document.forms[0].NameSearch.focus();
	}

	function enter() {
		var NameSearch = document.forms[0].NameSearch.value;
		var FromRecord = 0;
		var Type = getElementChecked("Type").value;
		var Client = "";
		var AppCode = "";
		var Bank = "";
		var Selection = "";
		var tmp = "";
	
		if (NameSearch.length < 1) {
	   		NameSearch = Type == "N" || Type == "A" ? "0" : ".";
		}
		if (Type == "N") {
			NameSearch = justifyRight(NameSearch, 20);
		}
    	
    	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0001?NameSearch=" + NameSearch + "@Type=" + Type + "@FromRecord=" + FromRecord + "'";
	}

	function enterRUT() {
		var NameSearch = trim(document.forms[0].NameSearch.value);
    	if (document.getElementById('DIVSUBMIT').style.display.trim() != "") {
    		return (document.forms[0].E01CUSCUN.value != "0");
    	}
	
		if (NameSearch.length > 0){
	    	if (document.forms[0].Type[0].checked) 
	    		document.forms[0].E01CUSCUN.value = NameSearch;
	    	else {
	    		document.forms[0].E01CUSIDN.value = NameSearch;
	    		document.forms[0].E01CUSCUN.value="0";
	    	}
	    	return true;
		} else {
			alert("Es requerido que se entre un valor");
			document.forms[0].NameSearch.focus();
			return false;
		}
	}

	function enterNameSearch() {
		var value = getElementChecked("Type").value;
		if (value == "N" || value == "A") {
			enterInteger(event);
		}
	}
</script>

</HEAD>


<body> 

<h3 align="center">Cliente Actual
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_enter_search, ESD0800"></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0800" target="_parent" onsubmit="return(enterRUT());">
  <CENTER>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="E01CUSCUN" value="<%= currClient.getE01CUSCUN() %>">
  <INPUT TYPE=HIDDEN NAME="E01CUSIDN" value="<%= currClient.getE01CUSIDN() %>">
  <INPUT TYPE=HIDDEN NAME="E01RELBAN" value="<%= currClient.getE01RELBAN() %>">
        <div id=DIVNAME style="position:absolute; left:700px; top:80px;">
          <input type="text" name="NameSearch"  size=25 maxlength="30" onkeypress="enterNameSearch()">
          &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter()" width="25" height="20"> 
        </div>    
  
	   <table  id="TBHELP" align="center" width="360" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td nowrap width="80" id="THHELP">Búsqueda por:</td>
		  <td nowrap width="140"><input type="radio" name="Type" value="N"  onclick="typeClick('N', 0)">N&uacute;mero</td>		
		  <td nowrap width="140"></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" value="I" onclick="typeClick('I', 1)">Identificaci&oacute;n</td>
		  <td nowrap ></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" value="D" onclick="typeClick('D', 2)">Identificaci&oacute;n Larga</td>
		  <td nowrap ></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" value="S" checked="checked" onclick="typeClick('S', 3)">Nombre Corto</td>
		  <td nowrap ></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" value="W" onclick="typeClick('W', 4)">Palabra</td>
		  <td nowrap ></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" value="L" onclick="typeClick('L', 5)">Nombre Largo</td>
		  <td nowrap ></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" value="A" onclick="typeClick('A', 6)">Cuenta</td>
		  <td nowrap ></td>
		</tr>   
        <tr > 
      	  <td nowrap colspan="3">
           <div id="DIVSUBMIT" align="center" style="display: none;">    
    		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">
           </div>
      	 </td>
    	</tr>     
 	 </table>
 	 
 </CENTER>
</FORM>
<SCRIPT type="text/javascript">;
	 typeClick('S', 3);
     function resizeDoc() {
       for(var i = 0; i < document.forms[0].Type.length; i++)
		{
		if (document.forms[0].Type[i].checked)
			document.forms[0].Type[i].click();
		}
     }
     window.onresize=resizeDoc;
     document.forms[0].NameSearch.focus(); 
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
 