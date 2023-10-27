<%@ page import = "datapro.eibs.master.*" %>
<!-- Sample HTML file -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 //EN">
<HTML>
<HEAD>

<TITLE>Header Checker</TITLE>
<link Href="<%=request.getContextPath()%>/fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<!--egt2019-->
<STYLE type="text/css">
/*
A:LINK {
	font-family: "Verdana, Arial, Helvetica, sans-serif";
	color : white;
	text-decoration : none;
	font-size : 8pt;
	font-style: normal;
}

A:VISITED {
	font-family: "Verdana, Arial, Helvetica, sans-serif";
	color : white;
	text-decoration : none;
	font-size : 8pt;
	font-style: normal;
}

A:HOVER {
	font-family: "Verdana, Arial, Helvetica, sans-serif";
	color : yellow;
	text-decoration : none;
	font-size : 8pt;
	font-style: normal;
}	
*/
#divtext1{
left: -3px;
}
#divtext2{
	left: 32px;
}
#divtext3{
	left: 60px;
}
#divtext4{
	left: 80px;
}
#divtext5{
	left: 125px;
}
</STYLE>
</HEAD>

<%@page import="datapro.eibs.beans.UserPos"%>
<%@page import="datapro.eibs.beans.ESS0030DSMessage"%>
  	
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"> </SCRIPT>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/plugins/jsplayer/jquery.jplayer.min.js"></script>
<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/DynWrite.js"> </SCRIPT>

<SCRIPT type="text/javascript">

	function showMsgViewer() {
		page = "<%=response.encodeURL(request.getContextPath()+"/pages/s/ESS0090_message_container.jsp")%>";
		CenterWindow(page, 800, 480, 2);
	}

	$(document).ready(function() { 
	 	/* Your Code */
	 	$("#jpId").jPlayer( {
    		ready: function () {
      			$(this).jPlayer("setMedia", {
        			oga: "<%=request.getContextPath()%>/pages/s/media/msg_alert.ogg", 
        			mp3: "<%=request.getContextPath()%>/pages/s/media/msg_alert.mp3"
      			}).jPlayer("play"); // Attempts to Auto-Play the media
    		},
    		supplied: "oga, mp3",
    		swfPath: "<%=request.getContextPath()%>/jquery/plugins/jsplayer/Jplayer.swf"
  		});
	});
	
//    back
   	function back() {
   		parent.main.history.back();
   	}
      
//    forward
   
   	function forward() {
		parent.main.history.forward();
   	}
   
//    print
   
   	function print_main() {
		parent.main.focus();parent.main.print();
   	}

//    home
   
   	function go_home() {
   		parent.main.window.location.href="<%=response.encodeURL(request.getContextPath()+"/pages/background.jsp")%>";
   	}
								
//    eIBS help
   
   	function eIBS_help() { 
		CenterWindow("<%=response.encodeURL(request.getContextPath()+"/pages/s/WebHelp/eIBSHelp.jsp")%>", 650, 550, 2);
   	} 
   

//    eIBS about

   	function eIBS_about() {
		CenterWindow("<%=response.encodeURL(request.getContextPath()+"/pages/s/MISC_eIBS_about.jsp")%>", 340, 340, 2);
   	}
    
//    Exit
   
   	function log_out() {
		 $.ajax(
	           {
	           	url:"<%=request.getContextPath()%>/servlet/datapro.eibs.menu.JSLogOff", 
	           	type:"POST",
	           	async:false,
	           	data: "SCREEN=UNLOAD",
	               
	               success: function(result,status,xhr){
	            	   if (window.top.location != window.location) {
	            		   window.top.location = window.location;
	            		 }
	            	   	window.top.location.href = result;
	            	   	return false;
		             },
	               
	               error: function(xhr,status,error){
	               }
	        });
   	}
   
   	function showText(idx) {
    	document.getElementById("divtext" + idx).style.display = "";
	 	if (document.getElementById("divtext" + idx).filters) {
	    	document.getElementById("divtext" + idx).style.filter = "blendTrans(duration=1)";
	     	if (document.getElementById("divtext" + idx).filters.blendTrans.status != 2) {
	     		document.getElementById("divtext" + idx).filters.blendTrans.Apply();
	     		document.getElementById("divtext" + idx).style.visibility = "visible";
	     		document.getElementById("divtext" + idx).filters.blendTrans.Play();
	    	}
     	} else 
     		document.getElementById("divtext" + idx).style.visibility = "visible";
   	}
   
   	function clearText(idx) {
    	document.getElementById("divtext" + idx).style.visibility = "hidden";
     	document.getElementById("divtext" + idx).style.display = "none";   
   	}
   


</SCRIPT>

<BODY onLoad="ShowNow();" bgcolor="#000066" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >

<%
  	session = (javax.servlet.http.HttpSession) request.getSession(false);
  	ESS0030DSMessage currUser = (ESS0030DSMessage)session.getAttribute("currUser");
  	UserPos userPO = (UserPos)session.getAttribute("userPO");
  	String imagePath = request.getContextPath()+"/images/"+(currUser.getH01SCR().startsWith("2")?"qa":(currUser.getH01SCR().startsWith("1")?"dr":"de"));

  	if ( JSEIBSProp.getVoiceActive() && userPO != null && userPO.getThereIsMsg() ) {
%>
		<div id="jpId"></div>
<%
	}
%>


		<div class="bc-header">
     <FORM METHOD="post" ACTION="<%=response.encodeURL(request.getContextPath()+"/servlet/datapro.eibs.products.JSESS0090")%>">
       <INPUT TYPE="hidden" NAME="SCREEN" VALUE="3">
		<table border="0" cellspacing="0" cellpadding="0" width="100%" height="66" class="bc-header">
  			<tr>
  				<td align="left" valign="top" width="32" style="cursor:pointer; text-align: center; background: url('<%=imagePath%>/topbar_3.jpg'); color : white" >
					<i class="fa fa-bars fa-2x fa-align-center" aria-hidden="true" onClick="parent.postMessage('button1 clicked', '*')" title="Menu Principal" style="vertical-align: middle;"></i>
					<%= currUser.getE01DTF().trim()%> 
  				</td>
    			<td width="250px" height="40" align="left" valign="middle" style="" rowspan="2">
               	 <img src="<%=imagePath%>/bancompartir-logo-header-min.png" height="25px" alt="Bancompartir Contigo" style="margin-left:15px;" />
                </td> 
                <td valign="middle" >
					<div id="dMsg" align="left" style="font-size:8pt;" class="text-white">
						<%          			if (userPO != null && !userPO.getThereIsMsg() ) {          			
						%>
						 <IMG border="0" src="<%=request.getContextPath()%>/images/de/topbar-bc-mail.png" align=middle>
						 &nbsp;
						 <a href="javascript:document.forms[0].submit()" class="link-no-bck text-white  bold">
							<span class="small">NO HAY mensajes</span>
						</a>
						<%
						} 
						else {
						%> 
							<a href="javascript:showMsgViewer()"  class="link-no-bck ">
								<img border="0" src="<%=request.getContextPath()%>/images/de/topbar-bc-mail-new.png" align=middle>
							</a>
						  &nbsp;
							<A href="javascript:document.forms[0].submit()" class="link-no-bck text-white small bold">
								<span class="small">NUEVO mensaje</span>
							</A>
						<%
						}
						%>
            	   </div>
                </td>
            	<td nowrap="nowrap" colspan="6"  height="40" align="left" valign="top" style="">
                    <!--Ajuste e-group Technologies 20190213 -->
                    <table border="0" align="right" cellspacing="0" cellpadding="0" class="bc-header topbar">
						<tr>
							<td colspan="5" height="12" align="center" style="position: relative;">

									<div id="divtext1" class="tooltip" style="display:none; visibility:hidden; color: white; font-size:8pt "><b>Imprimir</b></div>
									<div id="divtext2" class="tooltip" style="display:none; visibility:hidden; color: white; font-size:8pt"><b>Inicio</b></div>
									<div id="divtext3" class="tooltip" style="display:none; visibility:hidden; color: white; font-size:8pt"><b>Ayuda</b></div>
									<div  id="divtext4" class="tooltip" style="display:none; visibility:hidden; color: white; font-size:8pt"><b>Acerca de</b></div>
									<div  id="divtext5" class="tooltip" style="display:none; visibility:hidden; color: white; font-size:8pt"><b>Salir</b></div>

							</td>
						</tr>
                    	<tr>
                        	<td nowrap width="30"  style ="cursor:pointer;" align="right" valign="top" background="" onmouseover = "showText(1)" onmouseout = "clearText(1)" onClick="print_main()">
								<img src="<%=imagePath%>/topbar-bc-imprimir.png">
							</td>
                            <td nowrap width="30"  style ="cursor:pointer;" align="right" valign="top" background="" onmouseover = "showText(2)" onmouseout = "clearText(2)" onClick="go_home()">
								<img src="<%=imagePath%>/topbar-bc-home.png">
							</td>
                            <td nowrap width="30"  style ="cursor:pointer;" align="right" valign="top" background="" onmouseover = "showText(3)" onmouseout = "clearText(3)" onClick="eIBS_help()">
								<img src="<%=imagePath%>/topbar-bc-ayuda.png">
							</td>
                            <td nowrap width="30"  style ="cursor:pointer;" align="right" valign="top" background="" onmouseover = "showText(4)" onmouseout = "clearText(4)" onClick="eIBS_about()">
								<img src="<%=imagePath%>/topbar-bc-acerca-de.png">
							</td>
                            <td nowrap width="30" style ="cursor:pointer;" align="right" valign="top" background="" onmouseover = "showText(5)" onmouseout = "clearText(5)" onClick="log_out()">
								<img src="<%=imagePath%>/topbar-bc-salir.png">
							</td>
                        </tr>
                    </table>
            	</td> 
            	<td width="45" height="66" rowspan=2 >&nbsp;</td>
            </tr>
            <tr>
				<td  nowrap  height="25" align=left valign="middle" style="">
								
				</td>
                <td>
                	<font face="Verdana, Arial, Helvetica, sans-serif" size="1pt" color="<%= imagePath.endsWith("de") ? "white" : "yellow" %>">
    				<b>	<div ID=RunClock></div></b> 
    				</font>	
                </td>
				<td width="" colspan="6" height="25" align="right" valign="middle" nowrap background="">&nbsp;
					<font face="Verdana, Arial, Helvetica, sans-serif" size="1pt" color="<%= imagePath.endsWith("de") ? "white" : "yellow" %>">
						<b>
							<%=currUser.getE01NME()%><br> 
							Bienvenido(a) <%=currUser.getH01USR()%> : <%=currUser.getE01USNME()%>
						</b> 
    				</font>	
    		    </td> 			
    		</tr>
		</table>
     </FORM>
    </div>
	
	
	
	</BODY>
    <script>
  function ShowNow() {
  with (new Date()) { 
 	var Q=getTime();
 	Timer = setTimeout("ShowNow()", 1000-Q%1000);

	var h 	=  getHours();
	var m 	=  getMinutes();
	var s 	=  getSeconds();
	var sufix = '';
	
	if (h == 0) {
	  h = 12;
	  sufix = 'AM';
	} else if (h == 12) {
	  h = 12;
	  sufix = 'M';
	} else if (h > 12) {
	  h -= 12;
	  sufix = 'PM';
	} else {
	  sufix = 'AM';
	}

  	var St = ' <%=Util.formatCustomDate(currUser.getE01DTF(), currUser.getBigDecimalE01RDM().intValue(), currUser.getBigDecimalE01RDD().intValue(), currUser.getBigDecimalE01RDY().intValue())%> ';
	St += h < 10 ? "0" + h  : h;
	St += ':';
	St += m < 10 ? "0" + m  : m;
	St += ':';
	St += s < 10 ? "0" + s  : s;
	St += '&nbsp;';
	St += sufix;
	DynWrite('RunClock', St);
  }
 }   
    </script>
    
</HTML>