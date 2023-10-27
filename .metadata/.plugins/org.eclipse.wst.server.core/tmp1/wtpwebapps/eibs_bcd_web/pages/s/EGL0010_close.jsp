<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<html>
<head>
<title>Close Top Opener</title>
</head>
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
%>
     	<SCRIPT Language="Javascript">
     	function CenterNamedWindow(u,nm,w1,h1,tp){
     	  var imgPath = "<%=request.getContextPath()%>/images/";
     
		  var w = screen.width;
		  var h = screen.height;
		  var posTop = (h-h1)/2;
		  var posLeft = (w-w1)/2;
		  var position = 'left='+posLeft+',top='+posTop+',height='+h1+',width='+w1;
		  var n = nm;
		  var X = null;
		  var Y = null;
		  var cU  = imgPath + 'close_up.gif';
		  var cO  = imgPath + 'close_ovr.gif';
		  var cL  = imgPath + 'clock.gif';
		  var mU  = imgPath + 'min_up.gif';
		  var mO  = imgPath + 'min_ovr.gif';
		  var xU  = imgPath + 'max_up.gif';
		  var xO  = imgPath + 'max_ovr.gif';
		  var rU  = imgPath + 'res_up.gif';
		  var rO  = imgPath + 'res_ovr.gif';
		  var tH  = '<font face=verdana size=1>eIBS - Datapro, Inc.</font>';
		  var tW  = 'eIBS - Datapro, Inc.';
		  var wB  = '#000000';
		  var wBs = '#FFFFFF';
		  var wBG = '#ABBAD3';
		  var wBGs= '#ABBAD3';
		  var wNS = 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0';
		  var fSO = 'scrolling=auto noresize';
		  var brd = 10;
		  var ful = true;
		  var min = false;
		  var res = true;
		  var tsz = 20;
		
		  var listin = null;
		
		  switch (tp){
		    case 1:
				listin = window.open(u,nm,position);
				wNS ='';
				break;
		    case 2:
				listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
				wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=yes';
		    	break;
		    case 3:
				listin = window.open(u,nm,'scrollbars=yes,'+position);
				wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=yes';
				break;
		    case 4:
				listin = window.open(u,nm,'toolbar=yes,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,'+position);
				wNS ='toolbar=yes,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=yes';
		    	break;
		    case 5:
				listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no,'+position);
				wNS ='toolbar=yes,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0';
		    	break;
		    case 6:
				listin = window.open(u,nm,'scrollbars=yes,'+position);
				wNS ='toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=yes,resizable=yes';
				break;
		    case 7:
				listin = window.open(u,nm,'toolbar=no,location=no,directories=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no,'+position);
		    	break;
			}
		
			return listin;
		}
     	
     	
			function showErrors(){
				var page = "<%=request.getContextPath()%>/pages/e/error_viewer.jsp";
				CenterNamedWindow(page, 'error', 520, 300, 2);
			}

			showErrors();
     	</SCRIPT>
<%
 	}
%>

<script type="text/javascript">
  
 function loadScript() {
	top.opener.window.location.href = "<%=request.getContextPath()%>/pages/s/EGL0010_transaction_batch_list.jsp";
	setTimeout(function(){
		self.close();
	}, 1000);
  }
</script>
<body onload="loadScript()">
</body>
</html>