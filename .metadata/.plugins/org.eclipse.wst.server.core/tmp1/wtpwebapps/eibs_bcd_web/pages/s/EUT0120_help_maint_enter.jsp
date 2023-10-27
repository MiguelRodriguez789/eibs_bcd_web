<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.presentation.input.EibsInputFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="msgURL" class="datapro.eibs.beans.EUT012001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
</head>
<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>
<body>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.tools.JSEUT0120">
<input type="hidden" id="SCREEN" name="SCREEN" value="200">
<input type="hidden" id="E01WEBID" name="E01WEBID" value="">
	
	<h3 align="center">Mantenimiento Opciones de Ayuda<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="help_maint_enter.jsp,EUT0120"> </h3> 
    
    <hr size="4">
    <p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>


<table class="tbenter" width="100%" height="10%">
	<tr>
		<td align="center" id="eibsNew" class="tdbkg" width="20%"><b>Crear</b></td>
		<td align="center" id="eibsMaint" class="tdbkg" width="20%"><b>Modificar</b></td>
		<td align="center" id="eibsDelete" class="tdbkg" width="20%"><b>Borrar</b></td>
		<td align="center" class="tdbkg" width="20%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
		</td>
	</tr>
</table>

<div id="divNew" class="hiddenDiv">
    <table class="approvalSearch" style="width: 500px">
    	<caption>Nuevo URL</caption>
      <tr > 
        <td align=CENTER nowrap="nowrap"> 
          <div align="right" >Nuevo Codigo/Llave :</div>
        </td>
        <td align=CENTER  > 
          <div align="left">
          	<eibsinput:text name="" property="SELNEW" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" maxlength="30" size="35" style="text-transform: none;"/>
          </div>
        </td>
      </tr>
      <tr> 
        <td align=center nowrap colspan="2"> 
		<br>
          <input class="styled-button-Search" type=button name="Submit" value="Enviar" onClick="javascript:goAction('NEW')">
        </td>
      </tr>       
      <tr></tr>
</table>
</div>

<div id="divMaint" class="hiddenDiv">
<table class="approvalSearch" style="width: 500px">
    	<caption>Mant. URL</caption>
      <tr > 
        <td align=CENTER nowrap="nowrap"> 
          <div align="right" >Codigo/Llave :</div>
        </td>
        <td align=CENTER  > 
          <div align="left">
          	<eibsinput:text name="" property="SELMAINT" value="<%=msgURL.getE01WEBID()%>" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" maxlength="30" size="35" style="text-transform: none;"/>
          </div>
        </td>
      </tr>
      <tr> 
        <td align=center nowrap colspan="2"> 
		<br>
          <input class="styled-button-Search" type=button name="Submit" value="Enviar" onClick="javascript:goAction('MAINT')">
        </td>
      </tr>       
      <tr></tr>
</table>
</div>

<div id="divDelete" class="hiddenDiv">
<table class="approvalSearch" style="width: 500px">
    	<caption>Borrar URL</caption>
      <tr > 
        <td align=CENTER nowrap="nowrap"> 
          <div align="right" >Codigo/Llave :</div>
        </td>
        <td align=CENTER  > 
          <div align="left">
          	<eibsinput:text name="msgURL" property="SELDEL" value="<%=msgURL.getE01WEBID()%>" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" maxlength="30" size="35" style="text-transform: none;"/>
          </div>
        </td>
      </tr>
      <tr> 
        <td align=center nowrap colspan="2"> 
        	<br>
			<input class="styled-button-Search" id="button_delete" style="background: red" type=button name="Submit" value="DELETE" onclick="confirmDelete()">
		</td>
      </tr>       
      <tr></tr>
</table>
</div>

</form>
</body>
<script type="text/javascript">
function confirmDelete(){
	if (confirm("Desea eliminar este registro seleccionado?")) {
		goAction("DELETE");
	}
}

function goAction(action) {
	var screen = "100"; 
	var selection = "";
	switch(action){
	    case "NEW":
	    	screen = "1";
	    	selection = "SELNEW";
			break;
	    case "MAINT":
			screen = "2";
	    	selection = "SELMAINT";
			break;
	    case "DELETE":
			screen = "3";	 
	    	selection = "SELDEL";
			break;
	}
	
	getElement('SCREEN').value = screen;
	getElement('E01WEBID').value = getElement(selection).value;
	document.forms[0].submit();				
}

function closeHiddenDivs(){
	closeHiddenDivNew();
	closeHiddenDivMaint();
	closeHiddenDivDelete();
}

function closeHiddenDivNew(){
	setVisibility(getElement("divNew"), "hidden");
}

function closeHiddenDivMaint(){
	setVisibility(getElement("divMaint"), "hidden");
}	

function closeHiddenDivDelete(){
	setVisibility(getElement("divDelete"), "hidden");
}

function showHiddenDiv(evt, opt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	var divName = ""; var divElm;
 	switch(opt){
 		case 1 :
 			divName = "divNew";
 			break;	
 		case 2 :
  			divName = "divMaint";
 			break;	
 		case 3 :
 			divName = "divDelete";
 			break;	
 	}

	divElm = getElement(divName);
	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
    if(opt == 3) x -= $(divElm).width();
	cancelBub(evt);
	moveElement(divElm, y, x);
	setVisibility(divElm, "visible");
}

addEventHandler(getElement("divNew"), 'click', function(){cancelBub(event);});
addEventHandler(getElement("divMaint"), 'click', function(){cancelBub(event);});
addEventHandler(getElement("divDelete"), 'click', function(){cancelBub(event);});

addEventHandler(getElement("eibsNew"), 'click', function(){ closeHiddenDivs();showHiddenDiv(event,1);});
addEventHandler(getElement("eibsMaint"), 'click', function(){ closeHiddenDivs();showHiddenDiv(event,2);});
addEventHandler(getElement("eibsDelete"), 'click', function(){ closeHiddenDivs();showHiddenDiv(event,3);});

addEventHandler(document, 'click', closeHiddenDivs);

</script>


</html>