<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<title>Seguridad de Reportes</title>
	
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/_lib/jquery.hotkeys.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/plugins/jstree/jquery.jstree.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/json2.js"></script>

<script type="text/javascript">

var user; 
var report;
var updateHtml;

function changeLabel(value) {
	if (value == 'U') {
		document.getElementById("searchLabel").innerHTML = "Usuario :";
	} else {
	  	document.getElementById("searchLabel").innerHTML = "Grupo :";
	}  
}

function clearReportsFilter(value) {
	document.getElementById("reportText").value = "";
	loadReports(user);
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
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess?SCREEN=2";
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
				document.getElementById("searchTypeDiv").innerHTML = "GRUPO : " + data.rslt.obj.attr("id");
				loadReports(data.rslt.obj.attr("id"), "G");
			} else {
				document.getElementById("searchTypeDiv").innerHTML = "USUARIO : " + data.rslt.obj.attr("id");
				loadReports(data.rslt.obj.attr("id"), "U");
			}
		}).bind("close_node.jstree", function (event, data) {
		}).bind("open_node.jstree", function (event, data) {
		}); 

};

function closeAll() {
     $("#reports").jstree("close_all");
}


function loadReports(userId, type) {
	user = userId;
	callWaiting("reports", '<%=request.getContextPath()%>/images/gears7.gif', "Buscando reportes....");
	$("#reports").jstree({
		"json_data" : {
			"ajax" : {
				"url" : function (n) {
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess?SCREEN=3";
				},
				"cache" : false, 
				"data" : function (n) {
					//Data to be sent to the server, could be key/value pairs
					return {
						"user" : userId,
						"module" : n.attr ? n.attr("rel") : "",
						"id" : n.attr ? n.attr("id") : "",
						"type" : type,
						"report" : report
					};
				}
			}
		},
		"search" : {
			"ajax" : {
				"url" : function (n) {
					return "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess?SCREEN=6";
				},
				"cache" : false, 
				"data" : function (str) {
					//Data to be sent to the server, could be key/value pairs
					return {
						"user" : userId,
						"report" : str
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
    		$("input[id='reportClear']").removeAttr('disabled');
		}).bind("close_node.jstree", function (event, data) {
		}).bind("check_node.jstree", function (e, data) {
             $(data.rslt.obj).find("li").each( function( idx, listItem ) {
             	var child = $(listItem); // child object
             	if (child.attr('rel') == "disabled") {
		        	e.stopImmediatePropagation();
		        	child.attr('class', 'jstree-leaf jstree-unchecked');
             		data.rslt.obj.attr('class', 'jstree-undetermined jstree-open jstree-unchecked');
             	}
             });
        }).bind('uncheck_node.jstree', function (e, data) { 
             $(data.rslt.obj).find("li").each( function( idx, listItem ) {
             	var child = $(listItem); // child object
             	if (child.attr('rel') == "disabled") {
		        	e.stopImmediatePropagation();
		        	child.attr('class', 'jstree-leaf jstree-unchecked');
           	 		data.rslt.obj.attr('class', 'jstree-undetermined jstree-closed jstree-unchecked');
             	}
             });
		}).bind("open_node.jstree", function (event, data) {
             $(data.rslt.obj).find("li").each( function( idx, listItem ) {
             	var child = $(listItem); // child object
             	if (child.attr('rel') == "disabled" && child.attr('selected') == "true") {
		        	child.attr('class', 'jstree-open jstree-checked');
             	}
             });
        }).bind("search.jstree", function (e, data) {
			report = "";
		}); 
};		

function submitChecked(){
	var all = false;
	var added_ids = [];	
	$("#reports").jstree("get_checked", null, true).each 
		(function () {
			if(this.id == "ALL"){
				all = true;
			}
			var att = this.attributes.getNamedItem("selected"); 
			if (att != null) {
				if(att.value == 'false' && this.id.length > 2){
					all = false;
       				added_ids.push(this.id);
       			}
			}

	});
	var removed_ids = [];
	$("#reports").jstree("get_unchecked", null, true).each 
		(function () {
			var att = this.attributes.getNamedItem("selected");
			if (att != null) {
				if(att.value == "true" && this.id.length > 2){
	       			removed_ids.push(this.id);
	       		}
			}
	});
	if(!all && added_ids.length ==0 && removed_ids.length == 0){
		alert('No ha realizado ninguna selección');
		return;
	}
	var type = $("#userSpace").jstree("get_selected").attr("rel") == "group" ? "G" : "U";
	var text = type == "G" ? "Actualizando reportes de grupos..." : "Actualizando reportes de usuarios...";
	var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersAccess";
	if(all){
		reportUpdate(url, { user: user, type: type, SCREEN: 5 }, text);
	} else {
		reportUpdate(url, { user: user, type: type, SCREEN: 4, added: added_ids, removed: removed_ids }, text);
	}
}

function reportUpdate(url, data, text) {
		updateHtml = document.getElementById("reportUpdateDiv").innerHTML;
		$.ajax({
			method: "POST",
			url: url, 
			data: data,
			beforeSend: function(xhr){
				callWaiting("reportUpdateDiv", '<%=request.getContextPath()%>/images/gears7.gif', text);
			},  
			success: function(result){
				alert(result);
   				document.getElementById("reportUpdateDiv").innerHTML = updateHtml;
     		}
     	});
}
  
$(function () { 
	$("#reportSearchDiv input").click(function () {
		switch(this.id) {
			case "reportSearch":
				report = document.getElementById("reportText").value;
				$("#reports").jstree("search", report);
				break;
			case "reportText": break;
			default:
				$("#reports").jstree(this.id);
				break;
		}
	});
});

</script>
	
<title>Reportes de usuarios</title>

</head>
<body>
<h3 align="center">Asignación de Reportes del IBS a los Usuarios del Sistema<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Users_reportes_tree, UsersReports"></h3>
<hr size="4">

<div id="container" style="width: 100%">

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

   	<div id="userSpace" style="background-color: white;">
    	<ul id="listaUsuarios" style="background-color: white;"></ul>
   	</div>

</div>


<div id="reportsDiv" style="width: 624px; left:400px; position: absolute; padding-top: 10px; padding-left: 30px;">
	<div id="updateDiv">
		<table border="0" width="100%" cellpadding="0" cellspacing="0">
			<tr align="center">
				<td align="left" bgcolor="white">
			    	<div id="reportUpdateDiv">
						<table border="0" width="100%" cellpadding="0" cellspacing="0">
							<tr align="center">
								<td align="left" bgcolor="white">
							    	<div id="updateDiv">
							    		<a href="javascript:submitChecked()">
							    		<img src="<%=request.getContextPath()%>/images/s/update.gif" title="Actualizar reportes del usuario" border="0"></a>
							  		</div>
								</td>
						   		<td align="right"  bgcolor="white">Reportes :&nbsp;</td>
								<td align="left" bgcolor="white">
								<div id="reportSearchDiv" style="left:500px;">
									<input type="text" id="reportText" value="" align="top"/>
									<input type="button" id="reportSearch" value="Buscar" class="eibsbtn"/>
									<input type="button" id="reportClear" value="Limpiar" class="eibsbtn" onclick="clearReportsFilter()" disabled="disabled"/>
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
    
    <div id="reports" style="background-color: white"></div>
</div>
<script type="text/javascript">

(function($){
    var $originalParam = $.param;
     $.param = function (){
     	if(arguments[0]){
     		var data = arguments[0];
			if(typeof data !== 'string'){
				$.each(data,function(i, n){
					if(typeof n === 'object' && n.length == 0){
						delete data[i];
					} else if(n instanceof Array && n.length > 0){
						data[i] = n.toString();
					}
				});
			}
		}
	  return $originalParam.apply(this,arguments);     
     };
})(jQuery);


</script>
</div>

</body>
</html>
