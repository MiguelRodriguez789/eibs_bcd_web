<!-- saved from url=(0022)http://internet.e-mail -->
<!DOCTYPE html public "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>

<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
   //Define variables request
  String countryDsc="";
  String country="";  
  String idn="";
  String idn2="";
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



<% 
String client = "0";
String cuenta = "Cuenta";

if (userPO.getOption().equals("CD")) { 
    cuenta = "Deposito";
} else if (userPO.getOption().equals("LN")) { 
	cuenta = "Préstamo";
} else if (userPO.getOption().equals("1")) { 
	cuenta = "Préstamo";
} 

if (currClient != null) {
 	client = currClient.getE01CUSCUN();
  
}
%>


<SCRIPT language="JavaScript">

function enterAction(code,numc,name,id,ccy,type,prod,amt) {
	var form = top.opener.document.forms[0];
		if (top.opener.fieldName != "") {
			form[top.opener.fieldName].value = code; 
			form[top.opener.fieldName].focus(); 
			form[top.opener.fieldName].select();
		}	 

  	if (top.opener.fieldDesc != ""){ form[top.opener.fieldDesc].value = name; }
  	if (top.opener.fieldAux1 != ""){ form[top.opener.fieldAux1].value = id; }
  	if (top.opener.fieldAux2 != ""){ form[top.opener.fieldAux2].value = ccy; }
  	if (top.opener.fieldAux3 != ""){ form[top.opener.fieldAux3].value = type; }
  	if (top.opener.fieldAux4 != ""){ form[top.opener.fieldAux4].value = prod; }
  	if (top.opener.fieldAux5 != ""){ form[top.opener.fieldAux5].value = amt; }
	top.close();
 }

// ***************  Function   C H A N G E D ***************  //

function typeClick(value, row){

  if (value == "I"){    
	getElement('DIVNAME').style.display='none' ;
	getElement('DIVCOUNTRY').style.display='block' ;
	getElement('DIVCUSTCLASS').style.display='none' ;
	getElement('IDVEN').style.display='none' ;
	getElement('IDOTHER').style.display='none' ;
	getElement('IDPAPERS').style.display='none' ;
	getElement('IDPACORP').style.display='none' ;
	getElement('DIVCOUNTRY').style.top =  getElement('TBHELP').offsetTop + getElement('TBHELP').rows[row].cells[2].offsetTop - 3;
	getElement('DIVCOUNTRY').style.left = getElement('TBHELP').offsetLeft + getElement('TBHELP').rows[row].cells[2].offsetLeft;			
	document.forms[0].COUNTRY.value="";
	document.forms[0].COUNTRY.focus();

  }else{
  
	getElement('DIVNAME').style.display='block' ;
	getElement('DIVCOUNTRY').style.display='none' ;
	getElement('DIVCUSTCLASS').style.display='none' ;
	getElement('IDVEN').style.display='none' ;
	getElement('IDOTHER').style.display='none' ;
	getElement('IDPAPERS').style.display='none' ;
	getElement('IDPACORP').style.display='none' ;
	getElement('DIVNAME').style.top =  getElement('TBHELP').offsetTop + getElement('TBHELP').rows[row].cells[2].offsetTop - 3;
	getElement('DIVNAME').style.left = getElement('TBHELP').offsetLeft + getElement('TBHELP').rows[row].cells[2].offsetLeft;			
	document.forms[0].NameSearch.value="";
	document.forms[0].NameSearch.focus();
  }

}

function justifyRight(c,l) {
	var fc = "";
	for (var i = 0; i < (l - c.length); i++){
	  	fc += "0";
	}
	return (fc + c);
}
 
function enter(firsTime){
 var AppCode = top.top.opener.AppCode;
 var Bank = top.top.opener.Bank;
 var Selection = top.top.opener.Selection;
 var Client = "<%= client %>";
 var NameSearch = document.forms[0].NameSearch.value;
 var FromRecord = 0;
 var Type ="S";
 var Account = "";
	if (NameSearch.length < 1){
	  NameSearch=".";
	}	
	for(var i = 0; i < document.forms[0].Type.length; i++)
	{
		if (document.forms[0].Type[i].checked)
			Type = document.forms[0].Type[i].value;
	}
	
	if (top.top.opener.Client != null && firsTime) { //help by client, to CD and Loans
		Client= top.top.opener.Client;
		NameSearch=".";
	} else if (firsTime) {
	   type ="S";
	}
	
	if (Type == "N" && !firsTime) {
		Client = NameSearch;
		NameSearch=".";
	}
	if (Type == "A" || Type == "O" ) { //Account Search
	    Account = NameSearch;
	    NameSearch="";
	} 
	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0037?NameSearch=" + NameSearch + "@FromRecord=" + FromRecord + "@shrBank=" + Bank + "@shrAppCode=" +  AppCode + "@shrSelect=" + Type + "@shrClient=" + Client + "@shrAcc=" + Account + "'";	
 }

// ***************  Functions   A D D E D ***************  //
 
function enterInteger1 (idType) {
 if (idType.value != 'P')
   enterInteger();
 }

function fill0Left(idField){

	  //alert("**idFieldNAME: "+idField.name + " **Longitud: " + idField.value.length + " **MaxLongitud: " + idField.maxLength);
	    while (idField.value.length < idField.maxLength )
	      idField.value='0'+idField.value;	  	 
}

function joinID(idField, idType, idNum){

	document.forms[0].NameSearch.value=document.forms[0].VIDN0.value  +
								document.forms[0].VIDN1.value ;

//	  var strID = "";
//	    while ((idNum.value.length < 9) && (idType.value!='P'))
//	      idNum.value='0'+idNum.value;
//	  strID = trim(idType.value) + trim(idNum.value);
//	  idField.value=strID.toUpperCase();
//	  document.forms[0].NameSearch.value=idField.value;
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
								document.forms[0].CIDN2.value; // + " " +
							//	dv ;

}


function stripZerosAtLeft( valObj ){

	if( valObj.value != "" && !isNaN(valObj.value) ){
		valObj.value = parseInt(valObj.value , 10) ;
	}

}


function getIdTypeHelp(){
   // Get the client type selected
   var clientTypeSelected="CORP";
   for (counter = 0; counter < document.forms[0].CUSCLS.length; counter++)
   {
      if (document.forms[0].CUSCLS[counter].checked)
        clientTypeSelected = document.forms[0].TYPE[counter].value; 
   }
   // Display the id screen help 
   if (clientTypeSelected == "CORP") 
     GetCode('VIDN0','STATIC_client_help_id_type.jsp?clientType=CORPORATIVE');
   else
     GetCode('VIDN0','STATIC_client_help_id_type.jsp?clientType=PERSONAL');
 }
 
function showFields(countryCode){
	
	if( countryCode.toUpperCase() == "VE" ){
		getElement('DIVNAME').style.display='none' ;
		getElement('IDVEN').style.display='block' ;
		getElement('DIVCUSTCLASS').style.display='none' ;
		getElement('IDVEN').style.top =  getElement('DIVCOUNTRY').offsetTop;
		getElement('IDVEN').style.left = getElement('DIVCOUNTRY').offsetLeft + 100 ;		

	} else if( countryCode.toUpperCase() == "PA"){
		getElement('DIVNAME').style.display='none' ;
		getElement('IDVEN').style.display='none' ;
		getElement('DIVCUSTCLASS').style.display='block' ;
		getElement('DIVCUSTCLASS').style.top =  getElement('DIVCOUNTRY').offsetTop;
		getElement('DIVCUSTCLASS').style.left = getElement('DIVCOUNTRY').offsetLeft + 100 ;	

	} else if( countryCode.toUpperCase() != "" ){
		getElement('DIVNAME').style.display='block' ;
		getElement('IDVEN').style.display='none' ;
		getElement('DIVCUSTCLASS').style.display='none' ;
		getElement('DIVNAME').style.top =  getElement('DIVCOUNTRY').offsetTop;
		getElement('DIVNAME').style.left = getElement('DIVCOUNTRY').offsetLeft + 100 ;		

	}

}

function showIdFields(countryCode,cusType){
	
	if( countryCode.toUpperCase() == "VE" ){
		getElement('IDVEN').style.display='block' ;
		getElement('IDOTHER').style.display='none' ;
		getElement('IDPAPERS').style.display='none' ;
		getElement('IDPACORP').style.display='none' ;
		getElement('DIVCOUNTRY').style.top  = getElement('DIVCOUNTRY').offsetTop;
		getElement('IDVEN').style.left = getElement('DIVCOUNTRY').offsetLeft + 200 ;

	} else if( countryCode.toUpperCase() == "PA" && cusType.toUpperCase() == "CORP" ){
		getElement('IDVEN').style.display='none' ;
		getElement('IDOTHER').style.display='none' ;
		getElement('IDPAPERS').style.display='none' ;
		getElement('IDPACORP').style.display='block' ;
		getElement('IDPACORP').style.top =  getElement('DIVCUSTCLASS').offsetTop;
		getElement('IDPACORP').style.left = getElement('DIVCUSTCLASS').offsetLeft + 200 ;

	} else if( countryCode.toUpperCase() == "PA" && cusType.toUpperCase() == "PERS" ){
		getElement('IDVEN').style.display='none' ;
		getElement('IDOTHER').style.display='none' ;
		getElement('IDPAPERS').style.display='block' ;
		getElement('IDPACORP').style.display='none' ;
		getElement('IDPAPERS').style.top =  getElement('DIVCUSTCLASS').offsetTop;
		getElement('IDPAPERS').style.left = getElement('DIVCUSTCLASS').offsetLeft + 200 ;	

	} else if( countryCode.toUpperCase() != "" ){
		getElement('IDVEN').style.display='none' ;
		getElement('IDOTHER').style.display='block' ;
		getElement('IDPAPERS').style.display='none' ;
		getElement('IDPACORP').style.display='none' ;
		getElement('IDOTHER').style.top =  getElement('DIVCUSTCLASS').offsetTop;
		getElement('IDOTHER').style.left = getElement('DIVCUSTCLASS').offsetLeft + 200 ;		

	}

}
</SCRIPT>

</HEAD>
<BODY>
<FORM Action="javascript:enter(document.forms[0].NameSearch.value)">

 	
  <div id=DIVNAME width="140" style="position:absolute; left:25px; top:-50px;">
     <input type="text" name="NameSearch"  size=35 maxlength="30">
     &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter(false)"> 
  </div>
		<div id="DIVCOUNTRY" style="position:absolute; display:none;left:25px; top:-50px;">
			Pais:
			<INPUT TYPE=HIDDEN NAME="INT" value=""> 
			<INPUT TYPE="text" NAME="COUNTRY" value="<%=country%>" size="3" maxlength="2"  onblur="showFields(document.forms[0].COUNTRY.value);">
			<a href="javascript:GetCodeCNOFC('COUNTRY','03')"> 
			<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a> 
		</div>


		<div id="DIVCUSTCLASS" style="position:absolute; display:none;left:25px; top:-50px;">
			<INPUT TYPE=HIDDEN NAME="IDN" value=""> 
			<INPUT TYPE=HIDDEN NAME="IDN2" value=""> 
			<label for="corp" >
			<input type="radio" id="corp" name="CUSCLS" value="CORP" onclick="showIdFields(document.forms[0].COUNTRY.value,'CORP');" >Corp 
			</label>
			<label for="pers" >
			<input type="radio" id="pers" name="CUSCLS" value="PERS" onclick="showIdFields(document.forms[0].COUNTRY.value,'PERS');" >Pers
			</label>
			<label for="other" >
			<input type="radio" id="other" name="CUSCLS" value="OTHER" onclick="showIdFields(document.forms[0].COUNTRY.value,'OTHE');" >Otro
			</label>
		</div>


		<div id="IDVEN" style="position:relative; display:none;left:25px; top:-50px;">
			<input type="text" name="VIDN0" value="<%=idn2%>" maxlength="1" size="1" onblur="joinID(document.forms[0].IDN, document.forms[0].VIDN0, document.forms[0].VIDN1);">
			<a href="javascript:getIdTypeHelp()"> 
			<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."align="bottom" border="0"></a> 
			<input type="text" name="VIDN1" value="<%=idn%>" maxlength="14" size="17"
				onKeypress="enterInteger1(document.forms[0].VIDN0);"
				onblur="joinID(document.forms[0].IDN, document.forms[0].VIDN0, document.forms[0].VIDN1);">
     &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter(false)"> 				
		</div>


		<div id="IDOTHER" style="position:relative; display:none;left:25px; top:-50px;">
			<input type="text" name="OIDNO" value="<%=idn%>" maxlength="15" size="17"
			onblur="document.forms[0].NameSearch.value=this.value" >
     &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter(false)"> 			
		</div>


		<div id="IDPACORP" style="position:relative; display:none;left:25px; top:-50px;">
			<input type="text" name="CIDN0" value="<%=rRollo%>" maxlength="7" size="8" onKeyPress="enterInteger();"
			onblur="fill0Left(this);joinCorpIDFieldsPA();" > - 
			<input type="text" name="CIDN1" value="<%=rFolio%>" maxlength="4" size="5" onKeyPress="enterInteger();"
			onblur="fill0Left(this);joinCorpIDFieldsPA();" > - 
			<input type="text" name="CIDN2" value="<%=rAsiento%>" maxlength="8" size="9" onKeyPress="enterInteger();"
			onblur="fill0Left(this);joinCorpIDFieldsPA();" >
			<input type="hidden" name="CIDN3" value="00" maxlength="2" size="3" onKeyPress="enterInteger();"
			onblur="joinCorpIDFieldsPA();document.forms[0].EIBSBTN.focus();" >
     &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter(false)"> 			
		</div>


		<div id="IDPAPERS" style="position:relative; display:none;left:25px; top:-50px;">
			<input type="text" name="PIDN0" value="<%=cProvincia %>" maxlength="2" size="3" onKeyPress="enterInteger();"
			onblur="fill0Left(this);joinPersonalIDFieldsPA();" > - 
			<input type="text" name="PIDN1" value="<%=cLetra  %>" maxlength="2" size="3"
			onblur="this.value=this.value.replace(/ /ig,'');joinPersonalIDFieldsPA();" > - 
			<input type="text" name="PIDN2" value="<%=cFolio  %>" maxlength="5" size="6" onKeyPress="enterInteger();"
			onblur="fill0Left(this);joinPersonalIDFieldsPA();" > - 
			<input type="text" name="PIDN3" value="<%=cAsiento  %>" maxlength="6" size="7" onKeyPress="enterInteger();"
			onblur="fill0Left(this);joinPersonalIDFieldsPA();" >
     &nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter(false)"> 			
		</div>


  
  <center>  
	<div id="PARAMETERS" style="display:block;">
	   <table  id="TBHELP" align="left" width="360" border="0" cellspacing="0" cellpadding="0">
		<tr>
		  <td nowrap width="80">Búsqueda por:</td>
		  <td nowrap width="140">
		    <input type="radio" name="Type" value="N" onclick="typeClick('N',0)" checked>N&uacute;mero Cliente
		  </td>		
		  <td nowrap width="140">
     	  </td>
		</tr>
		<tr>
		  <td nowrap ></td>
		  <td nowrap>
		  	<input type="radio" name="Type" value="I" onclick="typeClick('I',1)">Identificaci&oacute;n Cliente
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
		  <td nowrap ></td>
		  <td nowrap><input type="radio" name="Type" value="L" onclick="typeClick('L',4)">Nombre Largo</td>
		  <td nowrap ></td>
		</tr> 
	 	
 	</table>
 </CENTER>	



	
  <SCRIPT Language="Javascript">;
	 typeClick('N',0);
     function resizeDoc() {
       for(var i = 0; i < document.forms[0].Type.length; i++)
		{
		if (document.forms[0].Type[i].checked)
			document.forms[0].Type[i].click();
		}
     }
     
     window.onresize=resizeDoc;     
     enter(true);
     
</SCRIPT>

</FORM>
</BODY>
</HTML>
