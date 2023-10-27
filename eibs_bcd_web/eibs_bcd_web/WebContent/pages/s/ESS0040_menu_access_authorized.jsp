<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.plugins.AuthorizationManager"%>
<HTML>
<HEAD>
<%@page import="java.util.Iterator"%>
<%@page import="datapro.eibs.plugins.AccessSecurity"%> 
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="datapro.eibs.plugins.AccessSecurity"%>

<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<TITLE>Main Menu</TITLE>

<jsp:useBean id= "mainMenu" class= "java.util.HashMap"  scope="request" />
<jsp:useBean id= "subMenu" class= "java.util.HashMap"  scope="request" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="request"/>

<!--[if lt IE 9]>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
  	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.1.4.min.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>

<script type="text/javascript">
$(document).ready(function(){

	var activeSearch = false ;
	
	jQuery.expr[":"].Contains = jQuery.expr.createPseudo(function(arg) {
	    return function( elem ) {
	        return jQuery(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
	    };
	});
	
	
	$("#menuSearch").keydown(function(event){
		if(event.which == 13){//Enter Key
	        $("#menuSearch").change();
	    }
	});
	
	
	$("#menuSearch").change( function(){

		$(this).css("background-color", "#DBDBDB");
		
		var val = $(this).val() ;
		var hColor =  "#78B845"; //"#FFFF66" ;
		
        //Hide all menu items
        $(".menuItem").hide();
        $(".menuoption").hide();
		$(".optSubMenu").hide();
		$(".suboption").hide();
		
		//Reset Color
        $(".menuItem b").css( "color", "" );
        $(".optSubMenu a").css( "color", "" );

		
		if( $.trim(val).length == 0 ){
			
			$(".menuoption").show();
			$(".menuItem").show().removeClass( "selectedItem" );
			$(".optSubMenu").show().removeClass("selectedSubMenu").closest("td").css("background-color","");
			;
			activeSearch = false ;
			
			return;
			
//		} else if( val.length <= 4 ){ //Only search for 4 caracters or more 
//			return ;			
		}
        
        //Show and color elements that matches the text searched
        $(".menuItem b:Contains("+ val +")").css( "color", hColor ).parents(".menuItem").show().parents(".menuoption").show();
        $(".optSubMenu a:Contains("+ val +")").css( "color", hColor ).parents(".optSubMenu").show().closest("td").css("background-color","#DBDBDB");
        $(".optSubMenu a:Contains("+ val +")").parents(".suboption").show().prev().show().find(".menuItem").show();

        activeSearch = true ;
        
        
    });

	
	$(".menuItem").click( function(){
		
		//console.log( "Activesearch: " + activeSearch );
		
		//$(".menuItem").removeClass( "selectedItem" );
		
		if( activeSearch ){
			if($(this).hasClass("selectedItem")){
				$(this).parents(".menuoption").next().show().find(".optSubMenu").hide() ;
				$(this).removeClass( "selectedItem" );
			}else{
				$(this).addClass( "selectedItem" );
				$(this).parents(".menuoption").next().show().find(".optSubMenu").show() ;
			}
			
		} else {
			$(".suboption").hide();
			$(".optSubMenu").hide();
			$(".menuItem").not(this).removeClass( "selectedItem" );
			
			if($(this).hasClass("selectedItem")){
				$(this).removeClass( "selectedItem" );

			}else{
				$(this).addClass( "selectedItem" );
				$(this).parents(".menuoption").next().show().find(".optSubMenu").show() ;
			}
		}
		
		// Scroll Elements into view		
		if( ! isScrolledIntoView( $(this).parents(".menuoption").next().next() ) ){
			$(this).parents(".menuoption").next().next().get(0).scrollIntoView(false);	
		}else if( ! isScrolledIntoView( $(this).parents(".menuoption").next()) ){
			$(this).parents(".menuoption").next().get(0).scrollIntoView(false);	
		}		
	});
	
	
	
	
	$(".optSubMenu").click( function(event){
		event.stopPropagation();
		
		$(".menuItem").removeClass( "selectedItem" );
		$(".optSubMenu").removeClass("selectedSubMenu");
		
		if(activeSearch){
			$(".optSubMenu").closest("td").css("background-color","");
		}
		
		$(this).addClass( "selectedSubMenu");
		$(this).parents(".suboption").prev().find(".menuItem").addClass( "selectedItem" );		
		var elem = $(this).find("a");
		if (isValidObject(elem) && elem.length > 0) {
			elem[0].click();
		}
		
	});
	
	
	
	$( "#clearSearch" ).click( function(){
		$("#menuSearch").val("");
		$("#menuSearch").change();
	});
	
	
	
	$( "#execSearch" ).click( function(){
		$("#menuSearch").change();
	});
	
	
	
	
	function isScrolledIntoView(elem)
	{
	    var $elem = $(elem);
	    var $window = $(window);

	    var docViewTop = $window.scrollTop();
	    var docViewBottom = docViewTop + $window.height();
	    var elemTop;
	    
	    if($elem.length){
	    	elemTop = $elem.offset().top;
	    }else{
	    	elemTop = 0;
	    }
	    var elemBottom = elemTop + $elem.height();

	    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
	}

    
    
});

</script>

<SCRIPT type="text/javascript"> 
	function switchOpt(id) {	
	 var oldid = document.forms[0].ACTIVEOPT.value;
		if ( oldid.trim() != "") {
			document.getElementById("suboption" + oldid).style.display = "none";
			document.getElementById("td" + oldid).className = "menuItem";
			if ( oldid != id ) {
				document.getElementById("suboption" + id).style.display = "";
				document.getElementById("suboption" + id).scrollIntoView(false);
				document.getElementById("td" + id).className = "selectedItem";
				document.forms[0].ACTIVEOPT.value = id;
			} else document.forms[0].ACTIVEOPT.value = "";
		} else {
			document.getElementById("suboption" + id).style.display = "";
			document.getElementById("suboption" + id).scrollIntoView(false);
			document.getElementById("td" + id).className = "selectedItem";
			document.forms[0].ACTIVEOPT.value = id;
		}
		
	}
	
	
  function setTableHeight() {
 	 var minValue= document.getElementById("mainTable").offsetTop + 30;
 	 var h = document.body.clientHeight - minValue ;
 	 document.getElementById("Container").style.height= h + ""; 
  }
  
 
 function go(url, tg, menuOpt, subMenuOpt) {
   parent.postMessage('button1 clicked', '*');	
   var frm = document.forms[0];
   frm.ServletName.value = url;
   frm.MenuOption.value = menuOpt;
   frm.MenuSubOption.value = subMenuOpt;
   frm.target = tg;
   frm.submit();
 }
</SCRIPT>

<STYLE>
@media print {
  @page {
	width: 8.5in;
	height: 11in;
  	margin: 0.50in 0.75in 0.75in 0.75in;	
  }
  
  body{
  	overflow: visible;
  	display: none;
  }
}

 body, #Container{	
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
  	scrollbar-arrow-color : #78B845;
  	scrollbar-base-color : #DBDBDB;
  	scrollbar-darkshadow-color :#78B845;
  	scrollbar-face-color : #78B845;
  	scrollbar-highlight-color :#DBDBDB;
  	scrollbar-shadow-color :#DBDBDB;
  	scrollbar-track-color :#EDF2F8;
    scrollbar-width: 10px;
    background:  #e8e8e8;
  	
 	}
 	
	body::-webkit-scrollbar , #Container::-webkit-scrollbar{ 
	    width: 10px;
	}
	
	body::-webkit-scrollbar-track , #Container::-webkit-scrollbar-track{
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
	    -webkit-border-radius: 10px;
	    border-radius: 10px;    
	    background:  #DBDBDB; 
	}
	
	body::-webkit-scrollbar-thumb , #Container::-webkit-scrollbar-thumb{
	    -webkit-border-radius: 10px;
	    border-radius: 10px;
	    background:  #DBDBDB; 
	    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
	}	
 	
 .menuItem {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:8.5pt;

 	background-Color:none;
 	color:#494949;
 	cursor:pointer;
 	border: none;
		padding:3px 0 3px 4px;
 	}
 .highlightItem {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:8.5pt;
 	padding:0;
 	color:#f9f9f9;
 	cursor:pointer;
 	border-top-color : none;
	padding-left:4px;
	font-style: normal;
	text-decoration: underline;
	background-Color:#78B845;
}
 .selectedItem, .menuItem:hover {
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size:8.5pt;

 	 	background-Color:#494949;
 	color:#F0FFFF;
 	cursor:pointer;
 	border: none;
	padding-left:4px;
    text-decoration: none;
	}
 .optSubMenu {
	background:transparent url('<%=request.getContextPath()%>/images/options_button.gif') no-repeat fixed center left;
	background-Color:none;
	padding-left:6px;
	font-family: Verdana,Arial, Helvetica, sans-serif;
	font-size: 7.5pt;
	font-color: #78B845;
}
 .optSubMenu a:link {
		color: #494949;
	text-decoration: none;
	padding-left:6px;
}
 .optSubMenu a:hover, .optSubMenu:hover{
	color: #78B845;
    text-decoration: underline;
	padding-left: 6px;
	background-color: transparent;
}

.selectedSubMenu {
	color: #996600;
    text-decoration: underline;
	padding-left: 6px;
	background-color: transparent;
	font-style: italic;
	font-weight: bold;
}

 .optSubMenu a:visited {
	color: #996600;
	text-decoration: none;
	padding-left:6px;
}

table {
	border-radius: 5px;
    -moz-border-radius: 5px
}
</STYLE>
</HEAD>

<BODY>
<%
  	String imagePath = request.getContextPath()+"/images/"+(currUser.getH01SCR().startsWith("2")?"qa":(currUser.getH01SCR().startsWith("1")?"dr":"de"));
%>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td colspan="2" align="left" valign="top" width="161" height="24">
	    <img src="<%=imagePath%>/options_up.gif" vspace="0" hspace="0" border="0">
    </td>
   </tr>
  </table>

  <div style="text-align: right;" >  
  	<input id="menuSearch" type="text" size="50" style="font-size: 55%; width: 50%; vertical-align: top;" >
  	<img id="execSearch" alt="clear" src="<%=request.getContextPath()%>/images/find.png" style="width: 18px;height: 14px; cursor: pointer; " >
  	<img id="clearSearch" alt="clear" src="<%=request.getContextPath()%>/images/del.png" style="width: 14px;height: 14px; cursor: pointer; " >
  	&nbsp;
  </div>

<form METHOD=POST ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.menu.JSESS0040Redirector" TARGET="body">
  <INPUT TYPE=HIDDEN NAME="MenuOption" VALUE="">
  <INPUT TYPE=HIDDEN NAME="MenuSubOption" VALUE="">
  <INPUT TYPE=HIDDEN NAME="ServletName" VALUE="">
  <input type=hidden name="ACTIVEOPT" value="">

  <table width="100%" id=mainTable cellspacing="0" cellpadding="0">
	<tr>	    
      <td width="1%" align="right" valign="bottom"><img src="<%=imagePath%>/ltcorner.gif" border="0"></td>
      <td style="background-image :url('<%=imagePath%>/bkmiddle.gif'); background-repeat:repeat-x"> </td>
      <td width="1%" align="left" valign="bottom"><img src="<%=imagePath%>/rtcorner.gif" border="0"></td>
    </tr>
    <tr>	    
        <td style="background-image :url('<%=imagePath%>/lmiddle.gif'); background-repeat:repeat-y"></td>
		<td style="background-image :url('<%=imagePath%>/bkmiddle.gif') ;background-repeat:repeat;">
		<div id=Container style="overflow-y:auto">
			<div id="Menu" style="width: 100%"  >
<%
			 String path = request.getParameter("WEBPATH") == null ? "" : request.getParameter("WEBPATH");
			 Iterator itMenu = AccessSecurity.sortMenu(((Map)request.getAttribute("mainMenu")).values(), "ESSDSC").listIterator();
			 while (itMenu.hasNext()) {
			 	com.datapro.eibs.security.vo.WEBMMViewByUser optMainMenu = (com.datapro.eibs.security.vo.WEBMMViewByUser) itMenu.next();
%>
			 	<div id="mainoption<%= optMainMenu.getESSSID() %>" class="menuoption" style="width: 100%" >
					<table cellspacing="2" width="100%">
						<tr>   
							<td align="LEFT" class="menuItem" id="td<%= optMainMenu.getESSSID() %>"    >
<%--
 							 onmouseover="if (this.className!='selectedItem') this.className='highlightItem';" 
							 onmouseout="if (this.className!='selectedItem') this.className='menuItem';" 
							 onclick="switchOpt('<%= optMainMenu.getESSSID() %>');"    >   
--%>                												
						 	  <b><%= optMainMenu.getESSDSC() %></b>
							</td>
						</tr>
					</table>
                </div>
	                <div id="suboption<%= optMainMenu.getESSSID() %>" style="display:none; width: 100%" class="suboption" >
				 		<table width="100%" cellspacing="0">
<%
				List subList = (List)((Map)request.getAttribute("subMenu")).get(optMainMenu.getESSSID());
				if(subList != null){
				 	Iterator itSubMenu = subList.listIterator();
				 	while (itSubMenu.hasNext()) {
				 		com.datapro.eibs.security.vo.WEBMMViewByUser optSubMenu = (com.datapro.eibs.security.vo.WEBMMViewByUser) itSubMenu.next();
				 		if (optSubMenu.getESSSID().equals(optMainMenu.getESSSID())) {
%>
			 			<tr >
				 			<td class="optSubMenu" style="width: 100%" >  
								<% if(AuthorizationManager.isActive(request.getSession(false).getServletContext())){%>
				 					<a onClick="javascript:go('<%= optSubMenu.getESSTAD() %>', '<%= optSubMenu.getESSTPO() %>', '<%= optSubMenu.getESSSID() %>', '<%= optSubMenu.getESSIDE() %>')" href ="javascript:">
				 						<%= optSubMenu.getESSDSC() %></a>
								<% } else { %>
			 						<a href="javascript:go('<%= optSubMenu.getESSTAD() %>', '<%= optSubMenu.getESSTPO() %>', '<%= optSubMenu.getESSSID() %>', '<%= optSubMenu.getESSIDE() %>')">
			 							<%= optSubMenu.getESSDSC() %></a>								
								<% } %>			 						
							</td>
						</tr>
			 <%			}
			 		} 
			 	}
			 %>
					</table>
                </div>
<%
			 }
%>
			</div>
		</div>
		</td>
		<td style="background-image :url('<%=imagePath%>/rmiddle.gif'); background-repeat:repeat-y"></td>
	</tr>
	<tr>
      <td width="1%" align="right" valign="bottom"><img src="<%=imagePath%>/lbcorner.gif" border="0"></td>
      <td style="background-image :url('<%=imagePath%>/bkmiddle.gif'); background-repeat:repeat-x"></td>
      <td width="1%" align="left" valign="bottom"><img src="<%=imagePath%>/rbcorner.gif" border="0"></td>
    </tr>
  </table>
</form>
<SCRIPT type="text/javascript">  
  setTableHeight();  
  window.onresize=setTableHeight;  
  
</SCRIPT>
</BODY>
</HTML>
