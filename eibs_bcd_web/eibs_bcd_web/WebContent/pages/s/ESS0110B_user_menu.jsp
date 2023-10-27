<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/json2.js"></script>

<script type="text/javascript"> 
var user; 
var menu;
var updateHtml;

function changeLabel(value) {
	if (value == 'U') {
		document.getElementById("searchLabel").innerHTML = "Usuario :";
	} else {
	  	document.getElementById("searchLabel").innerHTML = "Grupo :";
	}  
}

function searchUsers() {
	var criteria = document.getElementById("searchCriteria").value;
    var type = getElementChecked("searchType").value;
    var userId = type == 'U' ? criteria : "";
	var group = type == 'G' ? criteria : "";    
	$("#userSpace").jstree({
		"json_data" : {
			"ajax" : {
				"url" : function (n) {
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0110B?SCREEN=2";
				},
				"cache" : false, 
				"data" : function (n) {
					//Data to be sent to the server, could be key/value pairs
					return {
						"type" : type,
						"group" : group,
						"user" : userId
					};
				}
			}
		},
		"types" : {
			"valid_children" : [ "group", "user" ], 
			"types" : {
				"user" : {
					"icon" : { "image" : '<%=request.getContextPath()%>/images/user.gif' }
				}
			}
		}, 
		"plugins" : [ "themes", "json_data", "ui", "types" ]
		}).bind("select_node.jstree", function (event, data) {
			if (data.rslt.obj.attr("rel") == "group") {
				document.getElementById("searchTypeDiv").innerHTML = "GRUPO : " + data.args[0].text;;
				loadMenu(data.rslt.obj.attr("id"), "G");
			} else {
				document.getElementById("searchTypeDiv").innerHTML = "USUARIO : " + data.rslt.obj.text();
				loadMenu(data.rslt.obj.attr("id"), "U");
			}
		}).bind("close_node.jstree", function (event, data) {
		}).bind("open_node.jstree", function (event, data) {
		}); 

};

function closeAll() {
     $("#menu").jstree("close_all");
}

function clearMenuFilter(value) {
	document.getElementById("menuText").value = "";
	var type = getElementChecked("searchType").value;
	loadMenu(user, type);
}

function loadMenu(groupId, type) {
	user = groupId;
	callWaiting("menu", '<%=request.getContextPath()%>/images/gears7.gif', "Buscando Informacion....");
	$("#menu").jstree({
		"json_data" : {
			"ajax" : {
				"url" : function (n) {
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0110B?SCREEN=3";
				},
				"cache" : false, 
				"data" : function (n) {
					//Data to be sent to the server, could be key/value pairs
					return {
						"group" : groupId,
						"module" : n.attr ? n.attr("rel") : "",
						"id" : n.attr ? n.attr("id") : "",
						"type" : type,
						"menu" : menu
					};
				}
			}
		},
		"search" : {
			"ajax" : {
				"url" : function (n) {
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0110B?SCREEN=6";
				},
				"cache" : false, 
				"data" : function (str) {
					//Data to be sent to the server, could be key/value pairs
					return {
						"user" : user,
						"type" : type,
						"menu" : str
					};
				}
			}
		},
		"checkbox" : {
		    "two_state" : false // Nessesary to disable default checking childrens
		},
		"types" : {
	        "types": {
	        	"disabled" : { // Defining new type 'disabled'
	            	"check_node" : false, 
	              	"uncheck_node" : false 
	            }, 
				"default" : { // Override default functionality
					"check_node" : function (node) {
            			$(node).children('ul').children('li').children('a').children('.jstree-checkbox').click();
            			return true;
          			},
					"uncheck_node" : function (node) {
						$(node).children('ul').children('li').children('a').children('.jstree-checkbox').click();
				    	return true;
					}		        
				}
			}	
		 },		
    	"plugins" : [ "themes", "json_data", "ui", "checkbox", "search", "types" ]
    	}).bind("loaded.jstree", function (event, data) {
    		$("input[id='menuClear']").removeAttr('disabled');
		}).bind("close_node.jstree", function (event, data) {
		}).bind("check_node.jstree", function (e, data) {
             $(data.rslt.obj).find("li").each( function( idx, listItem ) {
             	var child = $(listItem); // child object
             	if (child.attr('rel') == "disabled"  && child.attr('chk') == "false") {
		        	//e.stopImmediatePropagation();
		        	child.attr('class', 'jstree-leaf jstree-unchecked');
             		data.rslt.obj.attr('class', 'jstree-undetermined jstree-open jstree-unchecked');
             	} else {
		        	child.attr('class', 'jstree-leaf jstree-checked');
           	 		data.rslt.obj.attr('class', 'jstree-undetermined jstree-open jstree-checked');
             	}
             });
        }).bind('uncheck_node.jstree', function (e, data) { 
             $(data.rslt.obj).find("li").each( function( idx, listItem ) {
             	var child = $(listItem); // child object
             	if (child.attr('rel') == "disabled"  && child.attr('chk') == "true") {
		        	e.stopImmediatePropagation();
		        	child.attr('class', 'jstree-leaf jstree-checked');
           	 		data.rslt.obj.attr('class', 'jstree-undetermined jstree-open jstree-checked');
             	} else {
		        	e.stopImmediatePropagation();
		        	child.attr('class', 'jstree-leaf jstree-unchecked');
             		data.rslt.obj.attr('class', 'jstree-undetermined jstree-open jstree-unchecked');
             	}
             });
		}).bind("open_node.jstree", function (event, data) {
             $(data.rslt.obj).find("li").each( function( idx, listItem ) {
             	var child = $(listItem); // child object
             	if (child.attr('chk') == "true") {
		        	child.attr('class', 'jstree-leaf jstree-checked');
             	} else {
		        	child.attr('class', 'jstree-leaf jstree-unchecked');
             	}
             });
        }).bind("search.jstree", function (e, data) {
			menu = "";
		}); 
};		

function submitChecked(){
	var all = false;
	var added_ids = [];	
	$("#menu").jstree("get_checked", null, true).each 
		(function () {
			if(this.id == "ALL"){
				all = true;
			}
			var att = this.attributes.getNamedItem("chk"); 
			if (att != null) {
				if(att.value == 'false' && this.id.length > 2){
					all = false;
       				added_ids.push(this.id);
       			}
			}

	});
	var removed_ids = [];
	$("#menu").jstree("get_unchecked", null, true).each 
		(function () {
			var att = this.attributes.getNamedItem("chk");
			if (att != null) {
				if(att.value == "true" && this.id.length > 2){
	       			removed_ids.push(this.id);
	       		}
			}
	});
	if (!all && added_ids.length == 0 && removed_ids.length == 0) {
		alert('No ha realizado ninguna selección');
		return;
	}
	var type = $("#userSpace").jstree("get_selected").attr("rel") == "group" ? "G" : "U";
	var text = type == "G" ? "Actualizando menues de grupos..." : "Actualizando menues de usuarios...";
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0110B";
	updateHtml = document.getElementById("menuUpdateDiv").innerHTML;
    callWaiting("menuUpdateDiv", '<%=request.getContextPath()%>/images/gears7.gif', text);
	if (all) {
		PostXMLRequest(url, "user="+user+"&type="+type+"&SCREEN=5", submitStatus, true);
	} else {
		PostXMLRequest(url, "user="+user+"&type="+type+"&added="+added_ids+"&removed="+removed_ids+"&SCREEN=4", submitStatus, true);
	}
}

function submitStatus(res){
    document.getElementById("menuUpdateDiv").innerHTML = updateHtml;
	alert(res.responseText);
}

$(function () { 
	$("#menuSearchDiv input").click(function () {
		switch(this.id) {
			case "menuSearch":
				menu = document.getElementById("menuText").value;
				$("#menu").jstree("search", menu);
				break;
			case "menuText": break;
			default:
				$("#menu").jstree(this.id);
				break;
		}
	});
});

</script>

<title>Menu de usuarios</title>

</head>
<body>

<h3 align="center">Asignación del Menu del IBS a Usuarios del Sistema
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="user_menu, ESS0110B"></h3>
<hr size="4">

<div id="users" style="width: 400px; padding-top: 10px; float: left;">
	<div id="search">
    	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess">
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
		  				<input type="text" id="searchCriteria" name="searchCriteria" value="" size="20" maxlength="10" />&nbsp;&nbsp; 
		  				<input type="button" name="Buscar" id="BuscarUser" value="Buscar" class="eibsbtn" onclick="searchUsers();" />
		  			</td>
       			</tr>
    		</table>
    	</form>
	</div>

   	<div id="userSpace" style="background-color: white; overflow:auto; height: 420px;" >
    	<ul id="listaUsuarios" style="background-color: white;"></ul>
   	</div>

</div>


<div id="menuDiv" style="width: 624px; left:400px; position: absolute; padding-top: 10px; padding-left: 30px;">
	<div id="menuDiv">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr align="center">
				<td align="left" bgcolor="white">
			    	<div id="menuUpdateDiv">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr align="center">	
							   <Div id="UpdateDiv">
								 <TD ALIGN=LEFT class=TDBKG> <a href="javascript:submitChecked()" ><b>Actualizar menues<br> del usuario</b></a></TD>
							   </div>
						   		<td align="right"  bgcolor="white">Menues :&nbsp;</td>
								<td align="left" bgcolor="white">
								<div id="menuSearchDiv" style="left:500px;">
									<input type="text" id="menuText" value="" align="top"/>
									<input type="button" id="menuSearch" value="Buscar" class="eibsbtn"/>
									<input type="button" id="menuClear" value="Limpiar" class="eibsbtn" onclick="clearMenuFilter()" disabled="disabled"/>
								</div>
								</td>
							</tr>
						</table>	
					</div>
				</td>
	   		</tr>
			<tr align="center">
				<td align="left" bgcolor="white">
			    	<div id="searchTypeDiv">
			  		</div>
				</td>
	   		</tr>
		</table>
    </div>
    
    <div id="menu" style="background-color: white; position: absolute; top: 100px; overflow:auto; height: 480px; width: 100%"></div>
</div>

</body>
</html>
