<html>

<head>
<title>e-IBS Integrated Banking System</title>

<SCRIPT type="text/javascript">

	function setCenterSize(w1,h1) {
			top.resizeTo(w1,h1);
			var w=screen.width;
			var h=screen.height;
			var posTop=(h-h1)/2;
			var posLeft=(w-w1)/2;
			top.moveTo(posLeft,posTop);
	}

	function setLayout() {
		var w=screen.width;
		var h=screen.height;
		window.moveTo(0,0);
		window.resizeTo(w,h);
		//setCenterSize(800,600);
	}


	function scrollMsg()//  display scrolling text
	{
		window.status = " eIBS --> Datapro, Inc. ...Miami, FL USA (305) 374-0606  ";
		//msg=msg.substring(1, msg.length) + msg.substring(0,1)
		setTimeout("scrollMsg()", 10000)
	}

	setLayout();
	scrollMsg();
	
</SCRIPT> 

<!--[if lt IE 9]>
	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
  	<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-2.1.4.min.js"></script>
<!--<![endif]-->

<script type="text/javascript">
$(window).on('beforeunload', function () { 
	 $.ajax(
           {
           	url:"<%=request.getContextPath()%>/servlet/datapro.eibs.menu.JSLogOff", 
           	type:"POST",
           	async:false,
           	data: "SCREEN=UNLOAD",
               
               success: function(result,status,xhr){
          			// console.log("Session Invalidated : True");
               },
               
               error: function(xhr,status,error){
      			 	//console.log("Session Invalidated : False");
               }
                   
        });
		// console.log("Window Unloaded");
});

var origCols = null;

function receiveMessage(event) {
	if (origCols != null)
   		showFrame();
  	else
   		hideFrame();
}

addEventListener("message", receiveMessage, false);

function hideFrame() {
    var frameset = document.getElementById("mainMenu");
    origCols = frameset.cols;
    frameset.cols = "0,*";
}

function showFrame() {
    document.getElementById("mainMenu").cols = origCols;
    origCols = null;
}

</script>

</head>

<frameset rows="66,*" frameborder="0" border="0" framespacing="0"> 
  <frame name="top" scrolling="NO" noresize target="menu" src="<%=response.encodeURL(request.getContextPath()+"/servlet/datapro.eibs.products.JSESS0090")%>"> 
  <frameset id="mainMenu" cols="180,*" frameborder="0" border="0" framespacing="0"> 
    <frame name="menu" target="menu" src="<%=response.encodeURL(request.getContextPath()+"/servlet/datapro.eibs.menu.JSESS0040Bean")%>" scrolling="NO" noresize>
    <frameset rows="20,*" frameborder="0" border="0" framespacing="0"> 
    	<frame name="client" id="client" src="<%=response.encodeURL(request.getContextPath()+"/pages/s/ESD0800_client_info.jsp")%>" scrolling="NO" noresize>
    	<frame name="main" id="main" src="<%=request.getContextPath()%>/pages/background.jsp" scrolling="auto">
    </frameset>
  </frameset>
</frameset>

<noframes>

<body bgcolor="#FFFFFF">
</body>

</noframes>

</html>
