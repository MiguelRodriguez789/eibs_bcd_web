<html> 
<head>
<%@ page import="datapro.eibs.master.Util" %>

<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css" rel="stylesheet">

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui-1.10.4.min.js"> </SCRIPT>

<% if( request.getParameter("pFirst") != null ){ session.removeAttribute("msgHelp"); } %>

<jsp:useBean id= "userPO"  class= "datapro.eibs.beans.UserPos"     scope="session" />
<jsp:useBean id= "msgHelp" class= "datapro.eibs.beans.JBObjList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);

	
var dialog ;
	
$(document).ready(function(){

    dialog = $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: {
          "Enviar": maintCP
        }
    });
    
    $("#EWDSELCDP").change( enableFields );
    $("#EWDSELCDP").change();
    
});


function enableFields( event ){
	
	console.log( "change fn:enableFields" );
	
	var selector = $("#EWDSELEDO, #EWDSELCIU, #EWDSELMUN, #EWDSELCLO");
	
	if( $("#EWDSELCDP").val( ) == "" ){
		selector.removeAttr("readonly") ; 
		
	} else {
		selector.val( "" ).attr("readonly", "readonly") ; 
		
	}
	
}


function maintCP(){
	
	var jqXHR = $.post( "<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0960" ,$('#theForm').serialize() )
		  .done(function() {
			  dialog.dialog( "close" );
			  enterFields(
					  $("#E01MEXCDP").val(), 
					  $("#E01MEXEDO").val(), 
					  $("#E01MEXCIU").val(), 
					  $("#E01MEXMUN").val(), 
					  $("#E01MEXCLO").val() )
		  })
		  .fail(function() {
			  if( jqXHR.status == 501 ){
				  showErrors();
			  } else {
				  alert( "Error - Servicio no disponible." );
			  }
			  
		  });
	
}

function modDialog( event, code, state, city, town, colony, colonyType, newColony ){

	if( !newColony && city.trim() != "" && city.trim() != "" ){
		return ;
	}
	
	$("#E01MEXCDP").val( code );
	$("#E01MEXEDO").val( state );
	$("#E01MEXCIU").val( city );
	$("#E01MEXMUN").val( town );
	$("#E01MEXCLO").val( colony );
	$("#E01MEXTCL").val( colonyType );
	
	if( $("#E01MEXCIU").val().trim() != "" ){
		$("#E01MEXCIU").attr( "readonly", "readonly" ).css( "background-color", "LightGrey" );
	} else {
		$("#E01MEXCIU").removeAttr( "readonly" ).css( "background-color", "" );
	}
	
	if( newColony == true ){
		$("#E01MEXCLO").val( "" );
		$("#E01MEXCLO").removeAttr( "readonly" ).css( "background-color", "" );
	} else {
		$("#E01MEXCLO").attr( "readonly", "readonly" ).css( "background-color", "LightGrey" );
	}
	
	dialog.dialog( "open" );
	
	event.stopPropagation();
	if( window.event ){ window.event.cancelBubble = true; }
	return false ;
}

</SCRIPT>

<script type="text/javascript">

//<!-- Hide from old browsers

function enterFields(code, estado, ciudad, municipio, colonia ) {

  	top.opener.document.forms[0][top.opener.fieldName].value = code;
  	top.opener.document.forms[0][top.opener.fieldAux4].value = estado;
 	top.opener.document.forms[0][top.opener.fieldAux3].value = ciudad;
  	top.opener.document.forms[0][top.opener.fieldAux2].value = municipio;
  	top.opener.document.forms[0][top.opener.fieldAux1].value = colonia;

  	top.opener.document.forms[0][top.opener.fieldName].focus();

  	top.close();

}

function validateFields(){
	
	var ret = true ;
	
	if( document.forms[0].EWDSELCDP.value.trim() != "" ){
		return ret ;
	} if( document.forms[0].EWDSELCLO.value.trim() != "" ){
		
		if( document.forms[0].EWDSELMUN.value == "" ){	
			alert( "Municipio requerido" );
			ret = false;
			
		} else if( document.forms[0].EWDSELEDO.value.trim() == "" ){	
			alert( "Estado requerido" );
			ret = false;
		}
		
	} else if( document.forms[0].EWDSELMUN.value.trim() != "" || document.forms[0].EWDSELEDO.value.trim() == "" ){	
		
		if( document.forms[0].EWDSELEDO.value.trim() == "" ){	
			alert( "Estado requerido" );
			ret = false;
		}
	} 
		

	return ret ;
	
}


function getNext( pos ){
	
	document.forms[0].FromRecord.value = pos ;
	document.forms[0].submit();
}


//-->

</script>


<title>SEPOMEX</title>

</head>
<body>

<div id="dialog-form" title="Modificar Código Postal" style="font-size: 70%;" >
 
  <form id="theForm" > 
  
  	<table style="padding:0; border:0; margin-top:25px;" >
	  <tr>
	    <td><label for="E01MEXCDP">Código</label> : </td>
	    <td><input type="text" name="E01MEXCDP" id="E01MEXCDP" size="15" maxlength="10" class="text ui-widget-content ui-corner-all" readonly="readonly" style="background-color: LightGrey;"  ></td>
	  </tr>
	  <tr>
	    <td><label for="E01MEXEDO">Estado</label> : </td>
	    <td><input type="text" name="E01MEXEDO" id="E01MEXEDO" size="35" maxlength="30" class="text ui-widget-content ui-corner-all" readonly="readonly" style="background-color: LightGrey;"  ></td>
	  </tr>
	  <tr>
	    <td><label for="E01MEXCIU">Ciudad</label> : </td>
	    <td><input type="text" name="E01MEXCIU" id="E01MEXCIU" size="35" maxlength="30" class="text ui-widget-content ui-corner-all"></td>
	  </tr>
	  <tr>
	    <td><label for="E01MEXMUN">Municipio</label> : </td>
	    <td><input type="text" name="E01MEXMUN" id="E01MEXMUN" size="35" maxlength="30" class="text ui-widget-content ui-corner-all" readonly="readonly" style="background-color: LightGrey;"  ></td>
	  </tr>
	  <tr>
	    <td><label for="E01MEXCLO">Colonia</label> : </td>
	    <td>
	    	<input type="text" name="E01MEXCLO" id="E01MEXCLO" size="35" maxlength="30" class="text ui-widget-content ui-corner-all">
	    	<input type="hidden" name="E01MEXTCL" id="E01MEXTCL" size="35" maxlength="30" class="text ui-widget-content ui-corner-all">
	    </td>
	  </tr>
	</table>
    
  </form>
</div>


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0602" onsubmit="return validateFields();" >

<input type="hidden" name="FromRecord"  />

<H3 align="center">Códigos Postales - SEPOMEX</H3>

<TABLE class="tbenter" style="width: 70%;"  >
	<TR>
      <TD width="20%" align="right" > C&oacute;digo:      </TD>
      <TD> <input type="text" maxlength="30" size="32" id="EWDSELCDP" name="EWDSELCDP" value='<%= Util.getReqParameter("EWDSELCDP", request) %>'  /> </TD>
      <TD width="20%" align="right" > Estado:      </TD>
      <TD> <input type="text" maxlength="30" size="32" id="EWDSELEDO" name="EWDSELEDO" value='<%= Util.getReqParameter("EWDSELEDO", request) %>'  /> </TD>

    </TR>
    <TR>
      <TD width="20%" align="right" >Ciudad:      </TD>
      <TD> <input type="text" maxlength="30" size="32" id="EWDSELCIU" name="EWDSELCIU" value='<%= Util.getReqParameter("EWDSELCIU", request) %>' /> </TD>
      <TD width="20%" align="right" >Municipio:   </TD>
      <TD> <input type="text" maxlength="30" size="32" id="EWDSELMUN" name="EWDSELMUN" value='<%= Util.getReqParameter("EWDSELMUN", request) %>' /> </TD>
    </TR>
    <TR>

    </TR>
    <TR>
      <TD width="20%" align="right" >Colonia:</TD>
      <TD> <input type="text" maxlength="30" size="32" id="EWDSELCLO" name="EWDSELCLO" value='<%= Util.getReqParameter("EWDSELCLO", request) %>' /> </TD>
      <TD align="right" style="width: 50%; padding-left: 20px; " colspan="2" >
      	<input id="smbtn" type="submit" value="enviar" class="EIBSBTN" style="height: EIBS.browser.isIE() ? 80% : 90%; padding: 0px; margin: 0px; "   /> 
      </TD>
    </TR>


</TABLE>

<%
	if ( msgHelp.getNoResult() ) {
%>

<TABLE class="tbenter" width="100%" style="padding: 50px"  >
	<TR>
      <TD> 
      	<div align="center">
      		<% if( request.getParameter("SCREEN") == null ){ %>
		 	<b>No hay resultados para su criterio de búsqueda </b>
		 	<% } %>
		</div>
      </TD>
    </TR>
</TABLE>

<%  
	} else {
%>	

<TABLE id="tdata" class="tableinfoList" align="center" style="width:'95%';padding: 0px;margin: 0px; " >
	<TR id="trdark"> 
    	<th>Código</th>
    	<th>Estado</th>
    	<th>Ciudad</th>
    	<th>Municipio</th>
    	<th>Colonia</th>
  	</tr>
	<tbody>
<%
		msgHelp.initRow();
		int lastidx = -1 ;
        while (msgHelp.getNextRow()) {
			datapro.eibs.beans.EWD0602DSMessage msg = (datapro.eibs.beans.EWD0602DSMessage) msgHelp.getRecord();
			lastidx = Integer.parseInt( msg.getEWDREC() );
%>    
    <TR onclick="enterFields( '<%= msg.getEWDMEXCDP()%>', '<%= msg.getEWDMEXEDO()%>', '<%= msg.getEWDMEXCIU()%>', '<%= msg.getEWDMEXMUN()%>', '<%= msg.getEWDMEXCLO()%>' );" >
		<td nowrap align="center"> <%= msg.getEWDMEXCDP()%> </td>
		<td nowrap align="center"> <%= msg.getEWDMEXEDO()%> </td>
		<td nowrap align="center"> <%= msg.getEWDMEXCIU()%> </td>
		<td nowrap align="center"> <%= msg.getEWDMEXMUN()%> </td>
		<td align="left"> <%= msg.getEWDMEXCLO()%>
			<div style="text-align: right;float: right;width: 100px;" >
				<img alt="Modificar" src="<%=request.getContextPath()%>/images/edit.png" style="width: 13px;height: 12px;" title="Modificar"
				     onclick="modDialog( event, '<%= msg.getEWDMEXCDP()%>', '<%= msg.getEWDMEXEDO()%>', '<%= msg.getEWDMEXCIU()%>', '<%= msg.getEWDMEXMUN()%>', '<%= msg.getEWDMEXCLO()%>', '<%= msg.getEWDMEXTCL()%>' );"  />	
				     
				<img alt="Nuevo" src="<%=request.getContextPath()%>/images/add.png" style="width: 13px;height: 12px;" title="Nuevo"
				     onclick="modDialog( event, '<%= msg.getEWDMEXCDP()%>', '<%= msg.getEWDMEXEDO()%>', '<%= msg.getEWDMEXCIU()%>', '<%= msg.getEWDMEXMUN()%>', '<%= msg.getEWDMEXCLO()%>', '<%= msg.getEWDMEXTCL()%>', true );"  />	

			</div>
		</td>
	</TR>   
	<% } %>	
	</tbody>	
</TABLE>


<TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR> 
      <TD WIDTH="50%" ALIGN=LEFT height="25"> 
       <% if ( lastidx > msgHelp.size() + 2 ) { %>
			<a href="javascript:getNext( -1 )" > <img src="<%=request.getContextPath()%>/images/s/previous_records.gif" style="padding: 0;border: o;"  /> </a>
       <% } %> 
	  </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
       <% if ( msgHelp.getShowNext() ) { %>
			<a href="javascript:getNext( +1 )" > <img src="<%=request.getContextPath()%>/images/s/next_records.gif" style="padding: 0;border: o;"  /> </a>
       <% } %> 
	  </TD>
    </TR>
</TABLE>


<%
   }  
%>

</form>






</body>
</html>
