var activeTree = "";
var cont = 0;
function Tree(divElement) {
	this.nodes = new Array();
	this.index = 0;
	this.parent = divElement;
	this.container = false;
	this.mark = false;
	this.readonly = false;
	this.id = "";
	this.beanClass = "";
	activeTree = this;
	this.jsonStr = "";

	this.chkAll = document.createElement('input');
	this.chkAll.setAttribute('type', 'checkbox');
	this.chkAll.setAttribute('id', 'root');
	this.chkAll.setAttribute('value', 'root');
	this.chkAll.setAttribute('checked', '');
	//this.chkAll.setAttribute('disabled', '');
	this.allSelected = false;

	//Attach check Event
	if (this.chkAll.addEventListener) {
		this.chkAll.addEventListener('click', function(e) {
			if (!activeTree.allSelected) {
				activeTree.checkAll();
				activeTree.chkAll.checked = true;
				activeTree.allSelected = true;
			} else {
				activeTree.unCheckAll();
				activeTree.chkAll.checked = false;
				activeTree.allSelected = false;
			}
		}, false);
	} else if (this.chkAll.attachEvent) {
		this.chkAll.attachEvent('onclick', function(e) {
			if (!activeTree.allSelected) {
				activeTree.checkAll();
				activeTree.chkAll.checked = true;
				activeTree.allSelected = true;
			} else {
				activeTree.unCheckAll();
				activeTree.chkAll.checked = false;
				activeTree.allSelected = false;
			}
		});
	}

}

Tree.prototype.draw = function() {

	// create Div container
	var root = document.createElement('div');

	for ( var i = 0; i < this.nodes.length; i++) {
		var childNode = this.nodes[i];
		childNode.drawNode(root);
	}

	this.parent.innerHTML = "";

	this.parent.appendChild(this.chkAll);
	var desc = document.createElement('span');
	desc.className = 'treeSpan';
	desc.innerHTML = 'Todos';
	this.parent.appendChild(desc);
	this.parent.appendChild(root);

}

Tree.prototype.addNode = function(node) {
	this.nodes[this.index++] = node;
}

Tree.prototype.getNode = function(id) {
	var node = false;
	for ( var i = 0; i < this.nodes.length; i++) {
		var tmpNode = this.nodes[i];
		if (tmpNode.id == id) {
			node = tmpNode;
			break;
		}
		for ( var j = 0; j < tmpNode.children.length; j++) {
			var tmpChild = tmpNode.children[j];
			if (tmpChild.id == id) {
				node = tmpChild;
				break;
			}
		}
		if (node)
			break;
	}
	return node;
}

Tree.prototype.setReadonly = function(flag) {
	this.readonly = flag;
	this.chkAll.disabled = flag;
	//this.chkAll.setAttribute('disabled', flag ? 'disabled' : '');
}



Tree.prototype.checkAll = function() {
	//alert("check all");
	for ( var i = 0; i < this.nodes.length; i++) {
		var node = this.nodes[i];
		node.check(); 
	}
	this.mark = true;

}

Tree.prototype.unCheckAll = function() {
	for ( var i = 0; i < this.nodes.length; i++) {
		var node = this.nodes[i];
		node.unCheck();
	}
	this.mark = false;
}

Tree.prototype.toJSON = function() {

	this.jsonStr = '{"class":"' + this.beanClass + '","id":"' + this.id + '"';
	var childStr = "";
	var first = true;
	for ( var i = 0; i < this.nodes.length; i++) {
		var childJson = this.nodes[i].toJSON();
		if (childJson != "") {
			if (first) {
				childStr = childJson;
				first = false;
			} else {
				childStr = childStr + "," + childJson;
			}
		}
	}
	if (!first) {
		this.jsonStr = this.jsonStr + ",nodes:[" + childStr + "] }";
	} else {
		this.jsonStr = this.jsonStr + "}";
	}

	return this.jsonStr;

}

function Node(id, desc, parent) {
	this.id = id;
	this.mark = false;
	this.selected = false;
	this.readonly = false;
	this.desc = desc;
	this.type = "";
	this.idIndex = id;
	this.beanClass = "";
	this.data = false;
	this.value = "";
	this.selNodes = 0;

	this.sequence = 1;
	this.expanded = false;
	this.iconSelected = "";
	this.iconUnSeletected = "";
	this.iconComplete = "";
	this.children = new Array();
	this.index = 0;
	this.jsonStr = "";

	if (parent) {
		this.parent = parent;
		this.id = parent.id + '-' + id;
	} else {
		this.parent = false;
	}

	// Node Container
	this.container = document.createElement('div');

	//child container
	this.childContainer = document.createElement('div');
	this.childContainer.setAttribute('id', this.id);

	this.title = document.createElement('div');
	this.title.setAttribute('id', this.id);
	this.expandedSign = document.createElement('div');
	this.chkTitle = document.createElement('input');
	this.chkTitle.setAttribute('type', 'checkbox');
	this.chkTitle.setAttribute('id', this.id);
	this.chkTitle.setAttribute('value', this.id);
	this.chkTitle.setAttribute('checked', '');
	//this.chkTitle.setAttribute('disabled', '');
/*
	if (this.mark ) {
	  this.chkTitle.setAttribute('checked','checked');
	} else {
		this.chkTitle.setAttribute('checked', '');
	}
*/	
	//Atach check Event
	if (this.chkTitle.addEventListener) {
		this.chkTitle.addEventListener('click', function(e) {
			doAction(e, 'mark_unmark');
			if (e && e.stopPropagation)
				e.stopPropagation();
			else
				event.cancelBubble = true;
		}, false);
	} else if (this.chkTitle.attachEvent) {
		this.chkTitle.attachEvent('onclick', function(e) {
			doAction(e, 'mark_unmark');
			if (e && e.stopPropagation)
				e.stopPropagation();
			else
				event.cancelBubble = true;
		});
	}

	this.descText = document.createElement('span');
	this.descText.className = 'treeSpan';
	this.texto = document.createTextNode(this.idIndex + "-" + this.desc);
	this.descText.appendChild(this.texto);

	// Atach expand and compress tree functions

	if (this.title.addEventListener) {
		this.title.addEventListener('click', function(e) {
			doAction(e, 'open_close');
		}, false);
	} else if (this.title.attachEvent) {
		this.title.attachEvent('onclick', function(e) {
			doAction(e, 'open_close');
		});
	}

	// end display

}

Node.prototype.setMark = function(flag) {
	if (flag) {
		this.check();
	} else {
		this.unCheck();
	}
}

Node.prototype.setReadonly = function(flag) {
	this.readonly = flag;
	this.chkTitle.disabled = flag;
	//this.chkTitle.setAttribute('disabled', flag ? 'disabled' : '');
}

Node.prototype.check = function() {

	this.mark = true;
	this.chkTitle.checked = true;
	//this.chkTitle.setAttribute('checked', 'checked');
	if (this.parent) {
		this.parent.mark = true;
		this.parent.chkTitle.checked = true;
		//this.parent.chkTitle.setAttribute('checked', 'checked');
	}
	//putIcon('checked');
	for ( var i = 0; i < this.children.length; i++) {
		node = this.children[i];
		node.check();
	}
}

Node.prototype.check2 = function() {

	this.mark = true;
	this.chkTitle.checked = true;
}

Node.prototype.unCheck = function() {
	this.mark = false;
	this.chkTitle.checked = false;
	//this.chkTitle.setAttribute('checked', '');
	//putIcon('unChecked')
	if (this.parent) {
		// check if at least one leaf is mark 
		if (!this.parent.isSelected()) {
			this.parent.chkTitle.checked = false;
			//this.parent.chkTitle.setAttribute('checked', '');
			this.parent.mark = false;
		}
	}
	for ( var i = 0; i < this.children.length; i++) {
		node = this.children[i];
		node.unCheck();
	}
}

Node.prototype.isSelected = function() {
	var selected = false;
	for ( var i = 0; i < this.children.length; i++) {
		node = this.children[i];
		if (node.mark) {
			selected = true;
			break;
		}
	}
	return selected;
}

Node.prototype.openCloseNode = function() {
	if (this.expanded) {
		this.childContainer.style.visibility = "hidden";
		this.childContainer.style.display = "none";
		this.title.className = 'collapsed';
		this.expanded = false;
	} else {
		this.childContainer.style.visibility = "visible";
		this.childContainer.style.display = "block";
		this.title.className = 'expanded';
		this.expanded = true;
	}
}

Node.prototype.expand = function() {
	this.childContainer.style.visibility = "visible";
	this.childContainer.style.display = "block";
	this.title.className = 'expanded';
}

Node.prototype.collapse = function() {
	this.childContainer.style.visibility = "hidden";
	this.childContainer.style.display = "none";
	this.title.className = 'collapsed';
}

Node.prototype.addNode = function(node) {
	this.children[this.index++] = node;
	node.parent = this;
}

Node.prototype.drawNode = function(parent) {
	if (this.children.length > 0) {
		if (this.expanded) {
			this.title.className = 'expanded';

		} else {
			this.title.className = 'collapsed';
		}
	} else {
		this.title.className = 'leaf';
	}

	//this.title.appendChild(this.expandedSign);
	//this.chkTitle.style.float='left';

	//Create Node
	/*
	if (this.mark) {
		if (!this.parent.mark) {
			alert("Childrens: " + this.children.length);
			this.parent.setMark(true);
		}
	}
	*/
	this.chkTitle.defaultChecked = this.mark;
	//this.chkTitle.checked = this.mark;
	this.chkTitle.readonly = this.readonly;
	parent.appendChild(this.title);

	this.title.style.position = 'relative';
	this.title.style.left = '70px';
	this.title.appendChild(this.chkTitle);
	this.chkTitle.style.position = 'relative';
	this.chkTitle.style.left = '21px';
	this.title.appendChild(this.descText);
	this.descText.style.position = 'relative';
	this.descText.style.left = '30px';

	//append child nodes
	if (this.children.length > 0) {

		parent.appendChild(this.childContainer);
		this.childContainer.style.position = 'relative';
		this.childContainer.style.left = '70px';
		for ( var i = 0; i < this.children.length; i++) {
			var childNode = this.children[i];
			childNode.drawNode(this.childContainer);
		}
	}

	if (this.expanded)
		this.expand();
	else
		this.collapse();
}

Node.prototype.toJSON = function() {
	if (this.mark) {
		this.jsonStr = '{"class":"' + this.beanClass + '","id":"' + this.id
				+ '","type":"' + this.type + '","mark":' + this.mark + ',"readonly":' + this.readonly;
		if (this.value == "")
			this.value = "*";
		this.jsonStr = this.jsonStr + ',"value":"' + this.value + '"';
		var childStr = "";
		var first = true;

		for ( var i = 0; i < this.children.length; i++) {
			var childJson = this.children[i].toJSON();
			if (childJson != "") {
				if (first) {
					childStr = childJson;
					first = false;
				} else {
					childStr = childStr + ',' + this.children[i].toJSON();
				}
			}
		}
		if (!first && childStr != "") {
			this.jsonStr = this.jsonStr + ',"nodes":[' + childStr + '] }';
		} else {
			this.jsonStr = this.jsonStr + "}";
		}
	} else
		this.jsonStr = "";

	return this.jsonStr;
}

function doAction(e, action) {
	var elem;
	if (e.target) {
		elem = e.target;
	} else {
		elem = e.srcElement;
	}

	if (action == 'open_close') {
		var nodeId = document.getElementById(elem.getAttribute('id')).id;
		var node = activeTree.getNode(nodeId);
		if (node)
			node.openCloseNode();
	}

	if (action == 'mark_unmark') {
		var nodeId = document.getElementById(elem.getAttribute('id')).id;

		var node = activeTree.getNode(nodeId);
		if (node) {

			if (node.mark) {
				node.unCheck();
			} else {
				node.check();
			}
		}
	}

}
