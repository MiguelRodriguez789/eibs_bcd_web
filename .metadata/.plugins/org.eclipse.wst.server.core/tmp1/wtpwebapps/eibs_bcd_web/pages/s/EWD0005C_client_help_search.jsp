
<!DOCTYPE html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>

<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<% 
String client = "0";
String cuenta = "Cuenta Corriente";

if (userPO.getOption().equals("CD")) { 
    cuenta = "Deposito";
} else if (userPO.getOption().equals("LN")) { 
	cuenta = "Prestamo";
} else if (userPO.getOption().equals("RT")) { 
	cuenta = "Cuenta Corriente";	
} else if (userPO.getOption().equals("SV")) { 
	cuenta = "Cuenta de Ahorro";
} 

if (currClient != null) {
  client = currClient.getE01CUSCUN();
}
%>
<SCRIPT type="text/javascript">

function enterAction(code, numc, id, prod, card, apc, cust) {
	var form = top.opener.document.forms[0];
	
	if (card == "") {
		if (top.opener.fieldName != null && top.opener.fieldName.trim() != "") {
			form[top.opener.fieldName].value = code; 
			form[top.opener.fieldName].focus(); 
			form[top.opener.fieldName].select(); 
		}
	} else { 
		if (top.opener.fieldName != null && top.opener.fieldName.trim() != "") {
			form[top.opener.fieldName].value = card;
		}	  		
	}
  	if (top.opener.fieldAux1.trim() != "" && top.opener.fieldAux1 != null){ form[top.opener.fieldAux1].value = cust; }
  	if (top.opener.fieldDesc.trim() != "" && top.opener.fieldDesc != null){ form[top.opener.fieldDesc].value = numc; }
  	if (top.opener.AppCode.trim() != "" && top.opener.AppCode != null){ form[top.opener.fieldAux2].value = apc; }
  	if (top.opener.fieldAux2.trim() != "" && top.opener.fieldAux2 != null){ form[top.opener.fieldAux2].value = prod; }
  	if (top.opener.fieldAux3.trim() != "" && top.opener.fieldAux3 != null){ form[top.opener.fieldAux3].value = id; }
	top.close();
 }

function typeClick(value, row){

  document.getElementById('DIVNAME').style.pixelTop = document.getElementById('TBHELP').offsetTop + document.getElementById('TBHELP').rows[row].cells[2].offsetTop - 3;
  document.getElementById('DIVNAME').style.pixelLeft = document.getElementById('TBHELP').offsetLeft + document.getElementById('TBHELP').rows[row].cells[2].offsetLeft;
  document.forms[0].NameSearch.value="";
  document.forms[0].NameSearch.focus();
}

function enter(firsTime){
 	var AppCode = top.top.opener.AppCode;
 	var Bank = top.top.opener.Bank;
 	var Selection = top.top.opener.Selection;
 	var Client = "<%= client %>";
 	var NameSearch = document.forms[0].NameSearch.value;
 	var FromRecord = 0;
 	var Type = getElementChecked("Type").value;
 	var Account = "";
 	var OldAccount = ""; 
  	var Status = document.forms[0].shrSTATUS.value;
	
	if (NameSearch.length < 1) {
	  	NameSearch = ".";
	}	
	
	if (top.top.opener.Client != null && firsTime) { //help by client, to CD and Loans
		Client = top.top.opener.Client;
		NameSearch = ".";
	} else if (firsTime) {
	   type = "S";
	}
	
	if (Type == "N" && !firsTime) {
		Client = NameSearch;
		NameSearch = ".";
	} else if (Type == "A") { //Account Search
	    Account = NameSearch;
	    NameSearch = "";
	} else if (Type == "O") { //Old Account Search
	    OldAccount = NameSearch;
	    NameSearch = "";
	} 
	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0005C?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrSelect=" + Type + "@shrClient=" + Client + "@shrAcc=" + Account + "@shrOldAcc=" + OldAccount + "@shrSTATUS=" + Status + "'";	
 }
 
function enterNameSearch() {
	var value = getElementChecked("Type").value;
	if (value == "N") {
		enterInteger(event);
	}
}
</SCRIPT>

</HEAD>
<BODY>
<FORM Action="javascript:enter(document.forms[0].NameSearch.value)">
	
  <div id=DIVNAME style="position:absolute; left:25px; top:-50px;">
     <input type="text" name="NameSearch"  size=14 maxlength="20" onkeypress="enterNameSearch()">
     &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter(false)"> 
  </div>
  
  <CENTER>  
	   <table  id="TBHELP" align="center" width="360" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td nowrap width="80">Búsqueda por :</td>
		  <td nowrap width="140">
		    <input type="radio" name="Type" value="N" onclick="typeClick('N',0)" checked>N&uacute;mero Cliente
		  </td>		
		  <td nowrap width="140">
     	  </td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap>
		  	<input type="radio" name="Type" value="I" onclick="typeClick('I',1)">Identificaci&oacute;n 
		  </td>
		  <td nowrap ></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap>
		  	<input type="radio" name="Type" value="S" onclick="typeClick('S',2)">Nombre Corto
		  </td>
		  <td nowrap ></td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap>
		  	<input type="radio" name="Type" value="W" onclick="typeClick('W',3)">Por Palabra
		  </td>
		  <td nowrap ></td>
		</tr>
	    <tr>
		  <td nowrap></td>
		  <td nowrap><input type="radio" name="Type" value="A" onclick="typeClick('A',4)">Por No. <%=cuenta%></td>
		  <td nowrap>
		  </td>
		</tr>
	    <tr>
		  <td nowrap></td>
		  <td nowrap><input type="radio" name="Type" value="O" onclick="typeClick('O',5)">Por No. <%=cuenta%> Vieja</td>
		  <td nowrap>
		  </td>
		</tr>	
	    <tr>
		  <td nowrap></td>
		  <td nowrap><div align="right">Estado :</div>
		  </td>
		  <td nowrap>
              <select name="shrSTATUS">
                <option value="A" >Activa</option>
                <option value="C" >Cerrada</option>
				<option value=" " >Todas</option>
              </select>
		  </td>
		</tr>
		 	
 	</table>
 </CENTER>	
	
<SCRIPT type="text/javascript">;
     function resizeDoc() {
     	clickElement("Type", "N");
     }
     window.onresize = resizeDoc;     
     enter(true);
     
</SCRIPT>

</FORM>
</BODY>
</HTML>
