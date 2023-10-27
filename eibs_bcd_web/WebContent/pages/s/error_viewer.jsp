<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.sockets.MessageField"%>
<%@page import="java.util.Enumeration"%>
<html>
<head>
<title>Errores - Advertencias</title>
<meta http-equiv="X-UA-Compatible" content="IE=11" />
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">

<%@ page import="datapro.eibs.master.*" %>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jsplayer/jquery.jplayer.min.js"></script>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
	
	$(document).ready(function() { 
	 	/* Your Code */
	 	$("#jpId").jPlayer( {
    		ready: function () {
      			$(this).jPlayer("setMedia", {
        			oga: "<%=request.getContextPath()%>/pages/s/media/phrase_01.ogg", 
        			mp3: "<%=request.getContextPath()%>/pages/s/media/phrase_01.mp3"
      			}).jPlayer("play"); // Attempts to Auto-Play the media
    		},
    		supplied: "oga, mp3",
    		swfPath: "<%=request.getContextPath()%>/jquery/plugins/jsplayer/Jplayer.swf"
  		});
	});

	$().ready(function () {
		var openerOpenerExists = false;
		
		if(isValidObject(window.opener)){
			openerOpenerExists = isValidObject(window.opener.opener);
		}
		resizeErrorWindow();
		self.focus();
		$(".error-code").each(function() {
			$(this).click(function() {
		    	var parent;		    	
		    	if(openerOpenerExists){
		    		top.close();
		    		
		    	} else {
		    		parent = window.open("", window.opener.name);
					parent.focus();
		    	}
		    	
		    });
		});
	});
		
	function setFocus(focusItem, focusRow) {
		var $doc = top.opener.document;
		var form = $doc.forms[0];
	
 		if ( focusItem == "" ) {
			return;
 		}
 		if ( !(focusRow == "" || focusRow == "0") ) {
			focusRow--;
       		focusItem = focusItem + "_" + focusRow;
 		}
 		
 		//focusItem = focusItem.toUpperCase();
 
		var elem = form[focusItem];
		
		if (isValidObject(elem) && elem.style.visibility != "hidden" && !elem.disabled) {
			if (elem.type == "select" 
				|| elem.type == "select-one"
				|| elem.type == "select-multiple"
				|| elem.type == "checkbox") {
				elem.focus();
			} else if (elem.type == "radio") {
					for (var i=0;i < elem.length; i++) {
	  					if (form[focusItem][i].checked) {
	    						form[focusItem][i].focus();
	    						form[focusItem][i].select();
	    						break;
	  					}
					}
			} else if (elem.type == "text" || elem.type == "textarea") {
				elem.focus();
				elem.select();
			}
			self.blur();
		} else if (	isValidObject( $doc.getElementById(focusItem))){
			elem = $doc.getElementById(focusItem);
			if(elem.nodeName == "<iframe>" || elem.nodeName == "IFRAME"){
			    $('html, body', window.opener.document).animate({
			        scrollTop: $(elem).offset().top
			    }, 500);
			    
			}else if( elem.style.visibility != "hidden" && !elem.disabled){
				elem.focus();
			}
		} else if (isValidObject( $doc.getElementById(focusItem.toLowerCase()))){
			elem = $doc.getElementById(focusItem.toLowerCase());
			if(elem.nodeName == "<iframe>" || elem.nodeName == "IFRAME"){
			    $('html, body', window.opener.document).animate({
			        scrollTop: $(elem).offset().top
			    }, 500);
			    
			}else if( elem.style.visibility != "hidden" && !elem.disabled){
				elem.focus();
			}
		} 
}
	
</SCRIPT>

</head>

<body>

<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader ("Expires", 0);
	response.setHeader("Cache-Control", "no-cache");
  	
  	if ( JSEIBSProp.getVoiceActive() ) {
%>

		<div id="jpId"></div>

<%
	} else {
%>
<%
	}
%>

<table id="tbhelp" width=100% align=center>
	<tr>
    	<td align=center colspan=3 >
      		<table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter">
        		<tr>
          			<td width="75">
          				<div align="right">
          					<font color="red"><img src="<%=request.getContextPath()%>/images/warning.gif"></font>
          				</div>
          			</td>
          			<td>
            			<div align="center">
            				<font color="#FF3333" face="Verdana, Arial, Helvetica, Sans-serif" size="3"><b>Errores - Advertencias</b></font>
            			</div>
          			</td>
          			<td width="75">
          				<div align="left">
          					<font color="red"><img src="<%=request.getContextPath()%>/images/warning.gif"></font>
          				</div>	
          			</td>
        		</tr>
				<tr>
					<td width="75" align="right" valign="top">
						<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="middle" name="EIBS_GIF" title="error_viewer">
					</td>
					<td colspan="2" align="left" valign="bottom">
						<hr size="4" align="right">
					</td>
				</tr>
      		</table>
   		</td>
	</tr>

<%
	int size = error.getBigDecimalERRNUM().intValue();
	if ("".equals(error.getERNU01())) {
		for (int i = 1; i <= size; i++) {
			String sufix = i < 10 ? "0" + i : "" + i;
%>	
			<tr>
			  <td colspan=3><%= error.getField("ERDS" + sufix).toString() %></td>
			</tr>
<%	
		}
	} else { 
		String field = "";
		String row = "";
%>
	<tr>
    	<td align=center colspan=3 >
      		<table width="100%" border="0" cellspacing="2" cellpadding="2" class="tbenter">
<%		
		for (int i = 1; i <= 10; i++) {
			String sufix = i < 10 ? "0" + i : "" + i;
			if (!error.getField("ERNU" + sufix).toString().trim().equals("")) {
%>
			<tr>
	  			<td nowrap="nowrap" align="right" width="75">
<% 
				if (error.getField("ERWF" + sufix).toString().trim().equals("Y")) { 
%>
					<IMG src="<%=request.getContextPath()%>/images/warning01.gif" title="Warning!!!">
<% 
				} else { 
%>
					<IMG src="<%=request.getContextPath()%>/images/error01.gif" title="Error!!!">
<% 
				}
%>
	  			</td>
<%				
				field = error.getField("ERDF" + sufix) == null ? "" : error.getField("ERDF" + sufix).toString().toUpperCase().trim();
				row = error.getField("ERDR" + sufix).toString().trim();	 
%>
	  			<td align="center">
	  				<a class="error-code" href="javascript:setFocus('<%= field %>', <%= row %>)">
	  					<b><%= error.getField("ERNU" + sufix).toString().trim()%></b></a>
	  			</td>
	  			<td nowrap="nowrap" align="left">
	  				<a class="error-code" href="javascript:setFocus('<%= field %>', <%= row %>)">
	  					<%= error.getField("ERDS" + sufix).toString().trim() %></a>
	  			</td>
  			</tr>	
<%			
			} else {
				field = "";
				row = "";
				break;
			}
		}			
	} 
%>
      		</table>
   		</td>
	</tr>

</table>

<br>

  <p align="center"> 
    <input id="EIBSBTN" type="button" name="close" value="Cerrar" onclick="cerrarVentana()" >
  </p>

<SCRIPT type="text/javascript" >
	if(window.name === "main"){
		$('#EIBSBTN').first().hide();
	}

	function cerrarVentana(){
		if(window.name != "main"){
			top.close();
		}
	}

	function resizeErrorWindow(){
		if(($(window).width() > 600 || $(document).width() > 600) && window.name != "main" ) {
			var w = screen.width;
			var h = screen.height;
			var posTop = (h-300)/2;
			var posLeft = (w-600)/2;			
			window.resizeTo(600, 350);	 
			window.moveTo(posLeft,posTop);
		}		
	}
</SCRIPT>
</body>
</html>

