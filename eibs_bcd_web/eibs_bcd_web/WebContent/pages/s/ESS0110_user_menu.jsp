<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link Href="<%=request.getContextPath()%>/pages/tree.css" rel="stylesheet">

<style type="text/css">
  	span.user {
		font-family: "Verdana, Arial, Helvetica, sans-serif";
		font-size:10pt;
		border-color: #0b23b5;
		color: #06187F;
	}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/tree.js"	type="text/javascript"></script>
<script	src="<%=request.getContextPath()%>/pages/s/javascripts/json2.js" type="text/javascript"></script>

<title>Menu de usuarios</title>

</head>
<body>

<h3 align="center">Asignación del Menu del IBS a Usuarios del Sistema
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="user_menu, ESS0110"></h3>
<hr size="4">

<div id="users" style="float: left; padding: 10px; width: 40%" >
	<div id="search">
    	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0431?">
     		<table border="0" class="tableinfo" width="100%" >
	    		<tr align="center">
		   			<td align="right">Buscar por :&nbsp;&nbsp;</td>
		   			<td align="left">
		   				<input type="radio" name="searchType" value="U" onclick="changeLabel(this.value);" checked>Usuario&nbsp;&nbsp; 
		   				<input type="radio" name="searchType" value="G" onclick="changeLabel(this.value);">Grupo
		   			</td>
	   			</tr>
	   			<tr align="center">
		  			<td align="right"><span id="searchLabel">Usuario : </span>&nbsp;&nbsp;</td>
		  			<td align="left">
		  				<input type="text" id="USR" name="USER" value="" size="20" maxlength="10" />&nbsp;&nbsp; 
		  				<input type="button" name="Buscar" id="BuscarUser" value="Buscar" class="eibsbtn" onclick="searchUsers();" />
		  			</td>
       			</tr>
    		</table>
    	</form>
    	<div id="userWait" style="background-color: white;"></div>
	</div>

   	<div id="userSpace" style="background-color: white;">
    	<ul id="listaUsuarios" style="background-color: white;"></ul>
   	</div>
   
   	<div id="nav" style="border-color: white;">
    	<table border="0" width="20%" style="border-color: white; background-color: white;">
       		<tr style="border-color: white; background-color: white;">
         		<td width="50%"><div id="previous"></div></td>
         		<td width="50%"><div id="next" style="float:left;"></div></td> 
       		</tr>
      	</table>    
    </div>
</div>


<div id="menu" style="position: relative;  float: left; top: -10px; padding: 30px;" >
	<div id="updateMenu" style="left:200px;">
    	<div>
    		<a href="javascript:updateMenu()"><img src="<%=request.getContextPath()%>/images/s/update.gif" title="Actualizar menus de usuario" border="0"></a>
         	<span id="usrMenuWait" class="user"></span>
       </div>
    </div>
    
    <div id="menus"></div>
</div>


<script type="text/javascript"> 

var type = "U";
var user = "";

function changeLabel(value) {
	if (value == 'U') {
		getElement("searchLabel").innerHTML = "Por Usuario :";
	} else {
	  	getElement("searchLabel").innerHTML = "Por Grupo :";
	}  
}

function searchUsers(){
    
	var user = getElement("USR").value;
    var typ = getElementChecked("searchType").value;
    var searchText = "  Buscando ";
  	// display  wait function icon
  	if (typ == 'G') {
  		searchText += "grupos....";
  	} else {
  		searchText += "usuarios....";
  	}
  	callWaiting("userWait", "<%=request.getContextPath()%>/images/throbber.gif", searchText);
  	// Send form encoded data stating that I want to add the 
  	// specified item to the cart.
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0431";
	PostXMLRequest(url, "SWDUSR=" + user + "&SWDTYP=" + typ, fillListUser, true);
}
  
 /*
    Move to previous/next block of data
 */ 
 
function move(user, typ, pos) {
    
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0431";
	PostXMLRequest(url, "SWDUSR="+ user + "&SWDTYP=" + typ + "&FromRecord=" + pos, fillListUser, true);
}
 
  
function fillListUser(res) {
 	// Get the root "usuarios" element from the document
   	var users = JSON.parse(res.responseText);
   	var data = users.data;
   	var typ = data.typ;
   	var next = data.next;
   	var previous = data.previous;
   	var usr = data.usr;
   	var first = data.first;
   	var last = data.last;
   	// clear wait Icon display area
   	var userWait = getElement("userWait");
   	userWait.innerHTML = "";
   
  	// Clear the HTML list used to display the user contents
   	var contents = getElement("listaUsuarios");
   	contents.innerHTML = "";
   
   	// Check for Group elements
	if (typ == 'G') {
   		try {
   			for (var I = 0 ; I < users.nodes.length ; I++) {
       			var user = users.nodes[I];
       			var ul = document.createElement('ul');
       			ul.className = 'groups';
       			var li = document.createElement('li');
       			li.setAttribute('id', user.id);
       			var ref2 =  document.createElement('a');
       			var textUser = document.createTextNode(user.desc);
       			ref2.appendChild(textUser);
       			ref2.setAttribute("href","javascript:searchMenuOptions('" + user.id + "','G')");
       			li.appendChild(ref2);
       			ul.appendChild(li);
       			contents.appendChild(ul);
   			}
		   	var userWait = getElement("userWait");
		   	userWait.innerHTML = "";
		  	var iconWait = document.createElement('img');
		   	iconWait.setAttribute("src", '<%=request.getContextPath()%>/images/cube.gif');
		   	iconWait.setAttribute("align", "bottom" );
		   	iconWait.setAttribute("border", "0");
		   	var textWait = document.createElement("b");
		   	textWait.appendChild(document.createTextNode("  Grupos"));
		    userWait.appendChild(iconWait);
		    userWait.appendChild(textWait);
	   	}  catch(e) { 
	   		alert("No se encontro grupo o perfil en la base de datos");
		}
	}
   
   	// Check for users that do not belong to any group
	if (typ == 'U') {
   		try {
   			for (var I = 0 ; I < users.nodes.length ; I++) {
       			var user = users.nodes[I];
       			var ul = document.createElement('ul');
       			ul.className = 'users';
       			var li = document.createElement('li');
       			li.setAttribute('id', user.id);
       			var ref2=  document.createElement('a');
       			var textUser = document.createTextNode(user.desc);
       			ref2.appendChild(textUser);
       			ref2.setAttribute("href","javascript:searchMenuOptions('" + user.id + "','U')");
       			li.appendChild(ref2);
       			ul.appendChild(li);
       			contents.appendChild(ul);
   			}
		   	var userWait = getElement("userWait");
		   	userWait.innerHTML = "";
		  	var iconWait = document.createElement('img');
		   	iconWait.setAttribute("src", '<%=request.getContextPath()%>/images/cube.gif');
		   	iconWait.setAttribute("align", "bottom" );
		   	iconWait.setAttribute("border", "0");
		   	var textWait = document.createElement("b");
		   	textWait.appendChild(document.createTextNode("  Usuarios"));
		    userWait.appendChild(iconWait);
		    userWait.appendChild(textWait);
	   	} catch (e) {
	   		alert("users not found");
	   	}
	}
   
   	// check for adding navigator links
   	getElement("previous").innerHTML = "";
   	getElement("next").innerHTML = "";
   	if (previous == "true") {
    	var previousLink = document.createElement("a");
      	var button = document.createElement('img');
      	button.src = "<%= request.getContextPath()%>/images/s/previous_records.gif";
      	button.border = "0";
      	previousLink.appendChild(button);
      	var ref = "javascript:move('" + usr + "','" + typ + "','" + first + "')"; 
      	previousLink.setAttribute("href", ref);
      	var navigator = getElement("previous");
      	navigator.appendChild(previousLink);
    } else {
      	var navigator = getElement("previous");
      	navigator.innerHTML = "";
    } 
     
   	if (next == "true") {
      	var nextLink=document.createElement("a");
      	var button = document.createElement('img');
      	button.src = "<%= request.getContextPath()%>/images/s/next_records.gif";
      	button.border = "0";
      	nextLink.appendChild(button);
      	var ref = "javascript:move('" + usr + "','" + typ + "','" + last + "')"; 
      	nextLink.setAttribute("href", ref);
      	var navigator = getElement("next");
      	navigator.appendChild(nextLink);
   	} else {
      	var navigator = getElement("next");
      	navigator.innerHTML = "";
    } 
}
 
function searchMenuOptions(usr, typ) {

   	// display  wait function icon
   	var userTxt = getElement("usrMenuWait");
   	userTxt.innerHTML = "";
   	type = typ == "G" ? "Grupo" : "Usuario";
   	var messageText = typ == "G" ? "  Buscando menu del grupo...." : "  Buscando menu del usuario....";
   	user = usr;
   	var bold = document.createElement("b");
   	bold.appendChild(document.createTextNode(type + ": " + user));
   	userTxt.appendChild(bold);
   	  
  	callWaiting("menus", "<%=request.getContextPath()%>/images/throbber.gif", messageText);
  	// Send form encoded data stating that I want to add the 
  	// specified item to the cart.
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0110A";
	PostXMLRequest(url, "usr=" + usr + "&typ=" + typ + "&SCREEN=1", listMenuOptions, true);
}
  
function listMenuOptions(res){
    
	var divElem = getElement("menus");
    var userMenus = null;
     
    try {
       userMenus = JSON.parse(res.responseText);
    } catch(e) {
    	try {
        	userMenus = eval('('+res.responseText+')');
       	} catch(e2) {
         	alert('json parsing exception: ' + e2.message);
       	}  
   	} 
     
	var tree = new Tree(divElem);
    tree.beanClass = "datapro.eibs.beans.Tree";
     
	try {
    	// check for menus
       	tree.id = userMenus.id;
       	for (var i=0; i < userMenus.nodes.length ; i++) {
         
       		var menu = userMenus.nodes[i];
         	var menuNode = new Node(menu.id, menu.desc);
         	menuNode.beanClass = "datapro.eibs.beans.Node";
         	menuNode.setMark(menu.selected);
         	menuNode.setReadonly(menu.readonly);
         	menuNode.type = "menu"; 
         	try {
           		for (j=0; j< menu.nodes.length; j++) {
             		var submenu = menu.nodes[j];
             		var node = new Node(submenu.id, submenu.desc, menuNode);
             		node.setMark(submenu.selected);
             		node.setReadonly(submenu.readonly);
             		if (!tree.readonly) tree.setReadonly(submenu.readonly);
             		node.beanClass = "datapro.eibs.beans.Node";
             		node.type = "submenu";
             		node.value = submenu.id;
             		menuNode.addNode(node);
          	 	}
         	} catch (e2) {
         		alert(e2.getMessage()+ " "+menu.id+" "+submenu.id+" "+submenu.desc);
         	}
         	tree.addNode(menuNode);
       	}
	} catch (e) { 
		alert(e.message + ' ...');
	}
     
    tree.draw();
}
  
  
function updateMenu() {
    //get Data
    var data=activeTree.toJSON();
    var typ = getElementChecked("searchType").value;
   	var messageText = typ == "G" ? "Actualizando menu de grupos...." : "Actualizando menu de usuarios....";
   	// display  wait function icon
  	callWaiting("usrMenuWait", "<%=request.getContextPath()%>/images/gears7.gif", messageText);
  	// Send form encoded data stating that I want to add the 
  	// specified item to the cart.
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0110A";
	PostXMLRequest(url, "data=" + data + "&typ=" + typ + "&SCREEN=2", updateMenuStatus, true);
}
  
function updateMenuStatus(res) {
	var menuWait = getElement("usrMenuWait");
    menuWait.innerHTML = "";
    alert(res.responseText);
   	var bold = document.createElement("b");
   	bold.appendChild(document.createTextNode(type + ": " + user));
   	menuWait.appendChild(bold);
}
  
    
 
</script>

</body>
</html>
