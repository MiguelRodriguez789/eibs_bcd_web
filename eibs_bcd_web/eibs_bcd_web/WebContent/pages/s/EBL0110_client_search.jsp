<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<link rel="stylesheet" href="../../theme/Master.css" type="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<title>Busqueda de cliente Bloqueado</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" >  

function subIdent()
{
    var form = document.forms[0];
    form.E02CURPID.value= form.COUNTRY.value.toUpperCase();
    form.E02CURIDN.value = form.IDN.value;
    form.submit();
}

function enter()
{
    var NameSearch = document.forms[0].NameSearch.value;
    var FromRecord = 0;
    var Type ='N';

    if (NameSearch.length < 1){
        //NameSearch=".";
        alert("Debe entrar algún criterio de búsqueda");
        return ;
    }
    
    for(var i = 0; i < document.forms[0].Type.length; i++)
    {
        if (document.forms[0].Type[i].checked)
            Type = document.forms[0].Type[i].value;
    }
    
    if (Type == "N") {
        NameSearch = justifyRight(NameSearch,20);
    }
    var url = '<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEBL0110?SCREEN=7@NameSearch=' + NameSearch + '@Type=' + Type  ;
    parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='"+escapeURLParam(url) + "'" ;
}

 
function typeClick(value, row)
{
    var elmBtn = document.getElementById("DIVSUBMIT");
    var elmDiv = document.getElementById("DIVNAME");
    if(value=='I')
    {
        elmDiv.style.visibility='hidden';
        elmBtn.style.visibility= 'visible';
        showDiv(value, row,"DIVCOUNTRY",-5,110);
        showDiv('I', 1,"DIVCUSTCLASS",25,150);
    }
    else
    {
        elmBtn.style.visibility="hidden";
        document.getElementById('DIVCOUNTRY').style.visibility='hidden' ;
        document.getElementById('DIVCUSTCLASS').style.visibility = 'hidden';
        hideDiv();
        showDiv(value, row,"DIVNAME",-5,150);        
    }
}

function hideDiv()
{
    document.getElementById("DIVNAME").style.visibility='hidden';
    document.getElementById('IDOTHER').style.visibility='hidden';
    document.getElementById('IDPAPERS').style.visibility='hidden';
    document.getElementById('IDPACORP').style.visibility='hidden';
    
}

function showDiv(value,row,id,x,y)
{
    var elmDiv = document.getElementById(id);
    elmDiv.style.visibility='visible';
    var elmTable = document.getElementById("TBHELP");
    var top = elmTable.offsetTop + elmTable.rows[row].cells[1].offsetTop+x ;
    var left = elmTable.offsetLeft + elmTable.rows[row].cells[1].offsetLeft+y;
    elmDiv.style.top = top;
    elmDiv.style.left = left;
    var nSearch = document.forms[0].NameSearch;
    nSearch.value="";
    nSearch.focus();
}

function enterAction(country,type,id,client,name) 
{
    var form = document.forms[0];
    form.E02CURPID.value = country;
    form.E02CURTID.value = type;
    form.E02CURIDN.value = id;
    form.E02CURCUN.value = client;
    form.E02CURNA1.value = name;
    form.submit();
}


function justifyRight(c,l) {
    var fc = "";
    for (var i = 0; i < (l - c.length); i++){
        fc += "0";
    }
    return (fc + c);
}


function enterRUT(){
var NameSearch = trim(document.forms[0].NameSearch.value);
    if (document.getElementById('DIVSUBMIT').style.display !="") return true;
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

function getIdTypeHelp(){
   // Get the client type selected
   var clientTypeSelected="CORP";
   if (document.getElementById('DIVCUSTCLASS').style.visibility == 'hidden')
        clientTypeSelected="BOTH";
   
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

function showIdFields(countryCode,cusType){
	if( countryCode.toUpperCase() == "PANA"  && cusType == "1" ){
		hideDiv();
        showDiv('I', 1,"IDPACORP",50,150);
        document.forms[0].E02CURTID.value = 'CORP';
    } else if( countryCode.toUpperCase() == "PANA"  && cusType == "2" ){
		hideDiv();
        showDiv('I', 1,"IDPAPERS",50,150);
        document.forms[0].E02CURTID.value = 'PERS';
    } else if( countryCode.toUpperCase().trim() != "" ){
        hideDiv();
        showDiv('I', 1,"IDOTHER",50,150);
    }

}

function joinPersonalIDFieldsPA(){
    if(document.forms[0].PIDN1.value == ""||document.forms[0].PIDN1.value=='undefined'||document.forms[0].PIDN1.value==null)
        document.forms[0].PIDN1.value="  ";
    if(document.forms[0].PIDN3.value==""||document.forms[0].PIDN3.value=='undefined' ||document.forms[0].PIDN3.value==null)
        document.forms[0].PIDN3.value="00";
    document.forms[0].IDN.value=document.forms[0].PIDN0.value + 
                                document.forms[0].PIDN1.value +
                                document.forms[0].PIDN2.value +
                                document.forms[0].PIDN3.value ;
}

function joinCorpIDFieldsPA(){
    var dv = "" ;
    dv= document.forms[0].CIDDV.value;
   // if (dv == "" || dv =="undefined" || dv == null)
     // dv = document.forms[0].elements["HIDN3"].value;

    if( dv == "" || dv == "undefined" || dv == null ){
        dv = "00" ;
    } else if (dv.length < 2) {
        dv = " " + dv ;
    }

    document.forms[0].IDN.value=document.forms[0].CIDN0.value + 
                                document.forms[0].CIDN1.value +
                                document.forms[0].CIDN2.value + 
                                dv ;
}

function fill0Left(idField)
{
    while (idField.value.length < idField.maxLength )
        idField.value='0'+idField.value;       
}

</script>
</head>
<body>
<h3 align="center">Busqueda de cliente Bloqueado<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_search,EBL0110"></h3>
<hr size="4">
 
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEBL0110" target="_parent" onsubmit="return(enterRUT());">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
<input type="hidden" name="E02CURPID" >
<input type="hidden" name="E02CURTID" >
<input type="hidden" name="E02CURIDN" >
<input type="hidden" name="E02CURCUN" >
<input type="hidden" name="E02CURNA1" >

  <CENTER>
  <div id="DIVNAME" style="position:absolute; left:15px; top:-53px;">
    <input type="text" name="NameSearch"  size=14 maxlength="20">&nbsp;&nbsp;
    <img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="enter()"> 
  </div>
     
  <table  id="TBHELP" align="center" width="250" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td nowrap id="THHELP">Búsqueda por:</td>
          <td nowrap >
          <input type="radio" name="Type" value="N" onclick="typeClick('N',0)">N&uacute;mero</td>     
        </tr>
        <tr>
          <td nowrap></td>
          <td nowrap >
          <input type="radio" name="Type" value="I" onclick="typeClick('I',1)">Identificaci&oacute;n</td>
          
        </tr>
        <tr>
            <td nowrap></td>
          <td nowrap >
          <input type="radio" name="Type" value="S" onclick="typeClick('S',2)">Nombre Corto</td>
        </tr>
        <tr>
            <td nowrap></td>
          <td nowrap >
          <input type="radio" name="Type" value="W" onclick="typeClick('W',3)">Por Palabra</td>
        </tr>
       <tr valign="middle">
            <td nowrap colspan="3" align="center">
	           <div id="DIVSUBMIT" align="center">
	               <input id="EIBSBTN" type="button"  value="Enviar" onclick="subIdent()">
	           </div>
            </td>
        </tr>
 </table>
          
             <div id="DIVCOUNTRY" style="position:absolute; visibility:hidden;">
                Pais:
                <INPUT TYPE="text" NAME="COUNTRY" value="" size="3" maxlength="2"  >
                <a href="javascript:GetCodeDescCNOFC('COUNTRY','','03')"> 
                <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
            </div>
          
            <div id="DIVCUSTCLASS" style="position:absolute; visibility:hidden;">
                <INPUT TYPE=HIDDEN NAME="IDN" > 
                <label for="corp" >
                <input type="radio" id="corp" name="E02CURLGT" value="1" onclick="showIdFields(document.forms[0].COUNTRY.value,'1')" >Corporativo 
                </label>
                <label for="pers" >
                <input type="radio" id="pers" name="E02CURLGT" value="2" onclick="showIdFields(document.forms[0].COUNTRY.value,'2')" >Físico 
                </label>
                <label for="other" >
                <input type="radio" id="other" name="E02CURLGT" value="0" onclick="showIdFields(document.forms[0].COUNTRY.value,'0')" >Otro
                </label>
            </div>
          
            <div id="IDOTHER" style="position:absolute; visibility:hidden;">
                <table cellspacing="0" cellpadding="2" width="100%" border="0">
                    <tr id="trclear">
	                 <td nowrap align="right" width="30%">Identificación : </td> 
	                
	                  <td nowrap align="left" width="10%">
	                      <input type="text" name="OIDNO" value="" maxlength="25" size="28"
	                      onblur="document.forms[0].IDN.value=this.value" >
	                  </td>
	                  
	                <td nowrap align="right" width="20%">Tipo : </td> 
	                <td nowrap align="left" width="40%">
	                    <input type="text" name="OTIDO" value="" maxlength="4" size="5" onblur="document.forms[0].E02CURTID.value=this.value.toUpperCase()" >
	                    <a href="javascript:GetCodeDescCNOFC('OTIDO','','34')"> 
	                        <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">
	                    </a> 
		                </td>
		            </tr>
		          </table>
	        </div>
          
            <div id="IDPACORP" style="position:absolute; visibility:hidden;">
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr id="trclear">
                    <td nowrap align="right" valign="middle" width="30%">Identificación:</td>
                    <td nowrap align="left" valign="middle" colspan="2">
                        <table>
                            <tr>
                                <td>Rollo</td><td></td><td>Folio</td><td></td><td>Asiento</td><td></td><td>Dígito Ver.</td>
                            </tr>   
                            <tr>
                                <td>
                                    <input type="text" name="CIDN0" value="" maxlength="7" size="8" onKeyPress="enterInteger(event);"
                                    onblur="fill0Left(this);joinCorpIDFieldsPA();" > 
                                </td> 
                                <td><span>-</span></td>
                                <td>
                                    <input type="text" name="CIDN1" value="" maxlength="4" size="5" onKeyPress="enterInteger(event);"
                                    onblur="fill0Left(this);joinCorpIDFieldsPA();" > 
                                </td>
                                <td><span>-</span></td>
                                <td>   
                                    <input type="text" name="CIDN2" value="" maxlength="8" size="9" onKeyPress="enterInteger(event);"
                                    onblur="fill0Left(this);joinCorpIDFieldsPA();" >
                                </td>
                                <td><span>-</span></td>
                                <td>    
                                    <input type="text" name="CIDDV" value="" maxlength="2" size="3" onKeyPress="enterInteger(event);"
                                    onblur="fill0Left(this);joinCorpIDFieldsPA();" >
                                    <input type="hidden" name="CIDN3" value="00" maxlength="2" size="3" onKeyPress="enterInteger(event);"
                                    onblur="joinCorpIDFieldsPA();document.forms[0].EIBSBTN.focus();" >
                                </td>   
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
          
            <div id="IDPAPERS" style="position:absolute; visibility:hidden;">
	        <table cellspacing="0" cellpadding="2" width="100%" border="0">
	            <tr id="trclear">
	                <td nowrap align="right" valign="middle" width="30%">Identificación:
	                </td>
	                <td nowrap align="left" valign="middle" colspan="2">
	                <table>
	                <tr>
	                  <td>Prov.</td><td></td><td>Letra</td><td></td><td>Folio</td><td></td><td>Asiento</td><td></td><td>Dígito Ver.</td>
	                </tr>
	                <tr>
	                   <td>
	                      <input type="text" name="PIDN0" value="" maxlength="2" size="3" onKeyPress="enterInteger(event);"
	                       onblur="fill0Left(this);joinPersonalIDFieldsPA();" > 
	                    </td>
	                    <td><span>-</span></td>
	                    <td>    
	                       <input type="text" name="PIDN1" value="" maxlength="2" size="3"
	                       onblur="this.value=this.value.replace(/ /ig,'');joinPersonalIDFieldsPA();" >
	                    </td>
	                    <td><span>-</span></td>
	                    <td>    
	                       <input type="text" name="PIDN2" value="" maxlength="5" size="6" onKeyPress="enterInteger(event);"
	                        onblur="fill0Left(this);joinPersonalIDFieldsPA();" > 
	                    </td>
	                    <td><span>-</span></td>
	                    <td>     
	                        <input type="text" name="PIDN3" value="" maxlength="6" size="7" onKeyPress="enterInteger(event);"
	                        onblur="fill0Left(this);joinPersonalIDFieldsPA();" >
	                    </td>       
	                    <td><span>-</span></td>
	                    <td>    
	                      <input type="text" name="PIDN4" value="" maxlength="2" size="3" onKeyPress="enterInteger(event);"
	                        onblur="fill0Left(this);joinPersonalIDFieldsPA();" >
	                    </td>   
	                </tr>
	                </table>
	                
	                </td>
	            </tr>
	        </table>
        </div>
    </CENTER>
<SCRIPT type="text/javascript">  
  
  typeClick('S',0);
  function resizeDoc() {
       for(var i = 0; i < document.forms[0].Type.length; i++)
        {
        if (document.forms[0].Type[i].checked)
            document.forms[0].Type[i].click();
        }
     }
     
     window.onresize=resizeDoc;
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
</FORM>
</BODY>
</HTML>