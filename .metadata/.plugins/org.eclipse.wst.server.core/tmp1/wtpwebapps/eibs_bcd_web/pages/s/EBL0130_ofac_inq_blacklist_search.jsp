<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
      
<%@page import="datapro.eibs.beans.UserPos"%><HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Conexión</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="client" class="datapro.eibs.beans.EBL013001Message"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="currClient" class="datapro.eibs.beans.ESD080001Message"
	scope="session" />

<%
   //Define variables
  String countryDsc="";
  String country="";  
  String idn="";
  String idn2="";
   //Define variables identificacion Panameña
  String cProvincia="";
  String cLetra="";
  String cFolio="";
  String cAsiento="";
  String rRollo="";
  String rFolio="";
  String rAsiento="";
  String digVer="";
  int indexI=0;
  int indexF=0;
  int len=0;
 %>

<script type="text/javascript" > 
function enterAction(code, idn, timest) {
 var form = document.forms[0];
 form["OFACUN"].value = code;
 form["OFAIDN"].value = idn;
 form["OFALMT"].value = timest;
 form.submit();
}
</script>

<script type="text/javascript">
function justifyRight(c,l) {
	var fc = "";
	for (var i = 0; i < (l - c.length); i++){
	  	fc += "0";
	}
	return (fc + c);
}

function typeClick(value){
  if (value == "0002"){    
	document.getElementById('DIVNAME').style.display='none' ;
	document.getElementById('DIVCOUNTRY').style.display='block' ;
	document.getElementById('DIVCUSTCLASS').style.display='none' ;
	document.getElementById('IDVEN').style.display='none' ;
	document.getElementById('IDOTHER').style.display='none' ;
	document.getElementById('IDPAPERS').style.display='none' ;
	document.getElementById('IDPACORP').style.display='none' ;
	document.getElementById('DIVHIST').style.display='none' ;
    document.getElementById('COUNTRY').focus();
	document.getElementById('DIVSUBMIT').style.display="";   
  }
  else if (value == "0005") {
    document.getElementById('DIVHIST').style.display='block' ;
	document.getElementById('DIVNAME').style.display='none' ;
	document.getElementById('DIVCOUNTRY').style.display='none' ;
	document.getElementById('DIVCUSTCLASS').style.display='none' ;
	document.getElementById('IDVEN').style.display='none' ;
	document.getElementById('IDOTHER').style.display='none' ;
	document.getElementById('IDPAPERS').style.display='none' ;
	document.getElementById('IDPACORP').style.display='none' ;
	document.getElementById('DIVSUBMIT').style.display="";  
  }
  else{
	document.getElementById('DIVNAME').style.display='block' ;
	document.getElementById('DIVCOUNTRY').style.display='none' ;
	document.getElementById('DIVCUSTCLASS').style.display='none' ;
	document.getElementById('IDVEN').style.display='none' ;
	document.getElementById('IDOTHER').style.display='none' ;
	document.getElementById('IDPAPERS').style.display='none' ;
	document.getElementById('IDPACORP').style.display='none' ;
	document.getElementById('DIVHIST').style.display='none' ;
    document.forms[0].NameSearch.focus();
	document.getElementById('DIVSUBMIT').style.display="none"; 
  }
document.getElementById('DIVSUBMIT').style.display="block";
/*
  if (value == "0002" || value == "0003"|| value == "0005"){    
   document.getElementById('DIVSUBMIT').style.display="block";   
  }
  else{
   document.getElementById('DIVSUBMIT').style.display="none"; 
  }
*/
}

function enter(){
var NameSearch = document.forms[0].NameSearch.value;
var FromRecord = 0;
var Type ='0001';
var datesReady = false;

	for(var i = 0; i < document.forms[0].Type.length; i++)
	{
		if (document.forms[0].Type[i].checked)
			Type = document.forms[0].Type[i].value;
	}
	
	if (document.forms[0].LMD.value.length >= 1 && 
		document.forms[0].LMM.value.length >= 1 && 
		document.forms[0].LMY.value.length >= 1 &&
		document.forms[0].SMD.value.length >= 1 &&
		document.forms[0].SMM.value.length >= 1 &&
		document.forms[0].SMY.value.length >= 1) 
			datesReady = true;

	if (NameSearch.length < 1 && Type != '0005'){
		alert("Debe ingresar algún criterio de búsqueda");
		return ;
	}
	
	var dateStr = "";
	
	if (Type == '0005' && !datesReady){
		alert("Debe ingresar el rango de fechas.");
		return ;
	}
	else
	{
		dateStr = "@LMD=" + document.forms[0].LMD.value + "@LMM=" + document.forms[0].LMM.value + 
		"@LMY=" + document.forms[0].LMY.value + "@SMD=" + document.forms[0].SMD.value + 
		"@SMM=" + document.forms[0].SMM.value + "@SMY=" + document.forms[0].SMY.value; 
	}
    
    if (Type == "0001") {
		NameSearch = justifyRight(NameSearch,30);
	}

    parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEBL0130?SCREEN=2@NameSearch=" + NameSearch 
    	+ "@Type=" + Type + dateStr + "@FromRecord=" + FromRecord + "'";

}

function enterRUT(){
var NameSearch = document.forms[0].NameSearch.value;
//		alert(document.forms[0].NameSearch.value);
	if (document.getElementById('DIVSUBMIT').style.display !="block") return false;
	if (NameSearch.length > 0){
	    if (document.forms[0].Type[0].checked) document.forms[0].E01CUN.value=NameSearch;
	    else {
	    	document.forms[0].E01IDN.value=NameSearch;
	    	document.forms[0].E01CUN.value="0";
	    }
	    return true;
	}else{
		alert("Es requerido que se entre un valor");
		document.forms[0].NameSearch.focus();
		return false;
	}
}

function enterInteger1 (idType) {
 if (idType.value != 'P')
   enterInteger(event);
 }

function joinID(idField, idType, idNum){

	document.forms[0].NameSearch.value=document.forms[0].VIDN0.value  +
								document.forms[0].VIDN1.value ;

//	  var strID = "";
//	    while ((idNum.value.length < 9) && (idType.value!='P'))
//	      idNum.value='0'+idNum.value;
//	  strID = trim(idType.value) + trim(idNum.value);
//    idField.value=strID.toUpperCase();
//	  document.forms[0].NameSearch.value=strID.toUpperCase();      
}

function fill0Left(idField){
	  //alert("**idFieldNAME: "+idField.name + " **Longitud: " + idField.value.length + " **MaxLongitud: " + idField.maxLength);
	    while (idField.value.length < idField.maxLength )
	      idField.value='0'+idField.value;	  	 
}
function joinPersonalIDFieldsPA(){
	document.forms[0].NameSearch.value=document.forms[0].PIDN0.value + "-" +
								document.forms[0].PIDN1.value + "-" +
								document.forms[0].PIDN2.value + "-" +
								document.forms[0].PIDN3.value ;
}

function joinCorpIDFieldsPA(){
	var dv = "" ;
	dv = document.forms[0].elements["CIDN3"].value;

	if( dv == "" || dv == "undefined" || dv == null ){
		dv = "  " ;
	} else if (dv.length < 2) {
		dv = " " + dv ;
	}

	document.forms[0].NameSearch.value=document.forms[0].CIDN0.value + "-" +
								document.forms[0].CIDN1.value + "-" +
								document.forms[0].CIDN2.value + " ";
}

// return the value of the radio button that is checked
// return an empty string if none are checked, or
// there are no radio buttons
function getCheckedValue(radioObj) {
	if(!radioObj)
		return "";
	var radioLength = radioObj.length;
	if(radioLength == undefined)
		if(radioObj.checked)
			return radioObj.value;
		else
			return "";
	for(var i = 0; i < radioLength; i++) {
		if(radioObj[i].checked) {
			return radioObj[i].value;
		}
	}
	return "";
}

function stripZerosAtLeft( valObj ){
	if( valObj.value.trim() != "" && !isNaN(valObj.value) ){
		valObj.value = parseInt(valObj.value , 10) ;
	}
}


function getIdTypeHelp(){
   // Get the client type selected
   var clientTypeSelected="CORP";
   if (document.getElementById('DIVCUSTCLASS').style.display == 'none') clientTypeSelected="BOTH";
   
   for (counter = 0; counter < document.forms[0].CUSCLS.length; counter++)
   {
      if (document.forms[0].CUSCLS[counter].checked)
        clientTypeSelected = document.forms[0].CUSCLS[counter].value; 
   }
   
   // Display the id screen help 
   if (clientTypeSelected == "CORP") 
     GetCode('VIDN0','STATIC_client_help_id_type.jsp?clientType=CORPORATIVE');
   else if (clientTypeSelected == "BOTH")
     GetCode('VIDN0','STATIC_client_help_id_type.jsp?clientType=BOTH');   	
   else
     GetCode('VIDN0','STATIC_client_help_id_type.jsp?clientType=PERSONAL');
 }
 
function showFields(countryCode){
	
	if( countryCode.toUpperCase() == "VE" ){
		document.getElementById('DIVNAME').style.display='none' ;
		document.getElementById('IDVEN').style.display='block' ;
		document.getElementById('DIVCUSTCLASS').style.display='none' ;
	} else if( countryCode.toUpperCase() == "PA"){
		document.getElementById('DIVNAME').style.display='none' ;
		document.getElementById('IDVEN').style.display='none' ;
		document.getElementById('DIVCUSTCLASS').style.display='block' ;
	} else if( countryCode.toUpperCase().trim() != "" ){
		document.getElementById('DIVNAME').style.display='block' ;
		document.getElementById('IDVEN').style.display='none' ;
		document.getElementById('DIVCUSTCLASS').style.display='none' ;
	}
}

function showIdFields(countryCode,cusType){
	
	if( countryCode.toUpperCase() == "VE" ){
		document.getElementById('IDVEN').style.display='block' ;
		document.getElementById('IDOTHER').style.display='none' ;
		document.getElementById('IDPAPERS').style.display='none' ;
		document.getElementById('IDPACORP').style.display='none' ;
	} else if( countryCode.toUpperCase() == "PA" && cusType.toUpperCase() == "CORP" ){
		document.getElementById('IDVEN').style.display='none' ;
		document.getElementById('IDOTHER').style.display='none' ;
		document.getElementById('IDPAPERS').style.display='none' ;
		document.getElementById('IDPACORP').style.display='block' ;
	} else if( countryCode.toUpperCase() == "PA" && cusType.toUpperCase() == "PERS" ){
		document.getElementById('IDVEN').style.display='none' ;
		document.getElementById('IDOTHER').style.display='none' ;
		document.getElementById('IDPAPERS').style.display='block' ;
		document.getElementById('IDPACORP').style.display='none' ;
	} else if( countryCode.toUpperCase().trim() != "" ){
		document.getElementById('IDVEN').style.display='none' ;
		document.getElementById('IDOTHER').style.display='block' ;
		document.getElementById('IDPAPERS').style.display='none' ;
		document.getElementById('IDPACORP').style.display='none' ;
	}

}

</script>

</HEAD>


<body>

<h3 align="center">Consulta Hist&oacute;rico OFAC<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="ofac_inq_blackllist_search, EBL0130"></h3>
<hr size="4">
<FORM METHOD="post"
	ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEBL0130" target="_parent"> <!-- onsubmit="return(enterRUT());"> -->
<CENTER>
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
	<input type="hidden" name="HOPECOD" value="0001"> 
	<input type="hidden" name="OFAIDN">
	<input type="hidden" name="OFACUN"> 
	<input type="hidden" name="OFALMT">

<table id="TBHELP" align="center">
	<tr>
		<td nowrap>
		<table id="TBHELP" align="center" width="250" border="0"
			cellspacing="0" cellpadding="0">
			<tr>
				<td nowrap id="THHELP">Búsqueda por:</td>
				<td nowrap><input type="radio" name="Type" value="0001"
					onclick="typeClick('0001')">N&uacute;mero Cliente</td>
			</tr>
			<tr>
				<td nowrap></td>
				<td nowrap><input type="radio" name="Type" value="0002"
					onclick="typeClick('0002')">Identificaci&oacute;n</td>
			</tr>
			<tr>
				<td nowrap></td>
				<td nowrap><input type="radio" name="Type" value="0003"
					onclick="typeClick('0003')">Nombre Corto</td>
			</tr>
			<tr>
				<td nowrap></td>
				<td nowrap><input type="radio" name="Type" value="0004"
					onclick="typeClick('0004')">Por No. Cuenta</td>
			</tr>
			<tr>
				<td nowrap></td>
				<td nowrap><input type="radio" name="Type" value="0005"
					onclick="typeClick('0005')">Por Per&iacute;odo</td>
			</tr>			
		</table>
		</td>

		<td nowrap>
		<div id="DIVNAME" style="position: relative; display: none;"><input
			type="text" name="NameSearch" id="NameSearch" size=25 maxlength="30">
		&nbsp;&nbsp;<%-- <img
			src="<=request.getContextPath()>/images/search1.gif"
			style="cursor: hand;" onClick="enter()" width="25" height="20">--%>
		</div>
		</td>


		<td nowrap>
		<div id="DIVCOUNTRY" style="position: relative; display: none;">
		Pais: <INPUT TYPE=HIDDEN NAME="INT" value=""> <INPUT
			TYPE="text" NAME="COUNTRY" ID="COUNTRY" value="<%=country%>" size="3"
			maxlength="2" onblur="showFields(document.forms[0].COUNTRY.value);">
		<a href="javascript:GetCodeDescCNOFC('COUNTRY','','03')"> <img
			src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
			align="bottom" border="0"></a></div>
		</td>


		<td nowrap>
		<div id="DIVCUSTCLASS" style="position: relative; display: none;">
		<INPUT TYPE=HIDDEN NAME="IDN" value=""> <INPUT TYPE=HIDDEN
			NAME="IDN2" value=""> <label for="corp"> <input
			type="radio" id="corp" name="CUSCLS" value="CORP"
			onclick="showIdFields(document.forms[0].COUNTRY.value,'CORP');">Corporativo
		</label> <label for="pers"> <input type="radio" id="pers"
			name="CUSCLS" value="PERS"
			onclick="showIdFields(document.forms[0].COUNTRY.value,'PERS');">Física
		</label> <label for="other"> <input type="radio" id="other"
			name="CUSCLS" value="OTHER"
			onclick="showIdFields(document.forms[0].COUNTRY.value,'OTHE');">Otro
		</label></div>
		</td>


		<td nowrap>
		<div id="IDVEN" style="position: relative; display: none;"><input
			type="text" name="VIDN0" value="<%=idn2%>" maxlength="1" size="1"
			onblur="joinID(document.forms[0].IDN, document.forms[0].VIDN0, document.forms[0].VIDN1);">
		<a href="javascript:getIdTypeHelp()"> <img
			src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
			align="bottom" border="0"> </a> <input type="text" name="VIDN1"
			value="<%=idn%>" maxlength="14" size="17"
			onKeypress="enterInteger1(document.forms[0].VIDN0)"
			onblur="joinID(document.forms[0].IDN, document.forms[0].VIDN0, document.forms[0].VIDN1);">
		</div>
		</td>

		<td nowrap>
		<div id="DIVHIST" style="position: relative; display: none;">
		<table cellpadding="0" cellspacing="0">
            <tr id="trdark"> 
            	<td nowrap colspan=2><b>Seleccionar Fechas</b></td>
            </tr>
            <tr id="trdark">
            	<td nowrap><b>Desde :&nbsp;</b></td>
	            <td nowrap>
	                <eibsinput:date fn_month="LMM" fn_day="LMD" fn_year="LMY"/>
	            </td>
            </tr>
			<tr id="trdark">
            	<td nowrap><b>Hasta :&nbsp;</b></td>
	            <td nowrap align="left"> 
	                <eibsinput:date fn_month="SMM" fn_day="SMD" fn_year="SMY"/>
	            </td>
          </tr>
		</table>
		</div>
		</td>

		<td nowrap>
		<div id="IDOTHER" style="position: relative; display: none;"><input
			type="text" name="OIDNO" value="<%=idn%>" maxlength="15" size="17"
			onblur="document.forms[0].NameSearch.value=this.value"></div>
		</td>

		<td nowrap>
		<div id="IDPACORP" style="position: relative; display: none;"><input
			type="text" name="CIDN0" value="<%=rRollo%>" maxlength="7" size="8"
			onKeyPress="enterInteger(event);"
			onblur="fill0Left(this);joinCorpIDFieldsPA();"> - <input
			type="text" name="CIDN1" value="<%=rFolio%>" maxlength="4" size="5"
			onKeyPress="enterInteger(event);"
			onblur="fill0Left(this);joinCorpIDFieldsPA();"> - <input
			type="text" name="CIDN2" value="<%=rAsiento%>" maxlength="8" size="9"
			onKeyPress="enterInteger(event);"
			onblur="fill0Left(this);joinCorpIDFieldsPA();"> <input
			type="hidden" name="CIDN3" value="00" maxlength="2" size="3"
			onKeyPress="enterInteger(event);"
			onblur="joinCorpIDFieldsPA();document.forms[0].EIBSBTN.focus();">
		</div>
		</td>


		<td nowrap>
		<div id="IDPAPERS" style="position: relative; display: none;"><input
			type="text" name="PIDN0" value="<%=cProvincia %>" maxlength="2"
			size="3" onKeyPress="enterInteger(event);"
			onblur="fill0Left(this);joinPersonalIDFieldsPA();"> - <input
			type="text" name="PIDN1" value="<%=cLetra  %>" maxlength="2" size="3"
			onblur="this.value=this.value.replace(/ /ig,'');joinPersonalIDFieldsPA();">
		- <input type="text" name="PIDN2" value="<%=cFolio  %>" maxlength="5"
			size="6" onKeyPress="enterInteger(event);"
			onblur="fill0Left(this);joinPersonalIDFieldsPA();"> - <input
			type="text" name="PIDN3" value="<%=cAsiento  %>" maxlength="6"
			size="7" onKeyPress="enterInteger(event);"
			onblur="fill0Left(this);joinPersonalIDFieldsPA();"></div>
		</td>

	</tr>

	<tr valign="middle">
		<td nowrap colspan="9" align="center">
		<div id=DIVSUBMIT align="center"><input id="EIBSBTN" type="button"
			name="Submit" value="Enviar" onclick="enter()"></div>
		</td>
	</tr>

</table>
</CENTER>
</FORM>
<SCRIPT type="text/javascript">;     
     <% 		
 		if (currClient != null && !currClient.getE01CUSCUN().equals("0")) {
  	 %>
  		document.forms[0].NameSearch.value = "<%= currClient.getE01CUSCUN() %>";
  		enter();	
 	<%	}
		%>
//		document.forms[0].NameSearch.focus();
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
