function addOnClickHandlers(parentID, icoID) {
	$(parentID).find(icoID).each(function() {
		$(this).click(swapUlList);
	});
}

/**
 * This jquery function controls behavior of elements to swap from one list to another
 * Author: Luis M Crosby 
 * Date: 06/2011
 * @return
 */
function swapUlList() {
	var listElement = $(this).parents('li:eq(0)');
	var leName = $(listElement).attr('name');
	var whatUL = "";
	var whatIco = "";
	var whatEnable = "";
	var whatCss = "";
	var actualIco = $(this).attr('class');
	if (actualIco == "ui-icon ui-icon-minus") { // to unselect
		whatIco = "ui-icon ui-icon-plus";
		listElement.removeClass();
		switch (leName) {
			case 'aField' : whatUL = "ulRegular_fieldz"; break;
			case 'aRegOrderByField' : whatUL = 'ulRegOrderBy'; break;
			case 'aAggGroupFunctionField' : whatUL = 'ulAggGroupFunction'; break;
		}
		whatEnable = "disabled";
	} else { // to select
		whatIco = "ui-icon ui-icon-minus";
		listElement.removeClass().addClass('move_cursor');
		switch (leName) {
			case 'aField' : whatUL = "ulRegFldzSel"; break;
			case 'aRegOrderByField' : whatUL = 'ulRegOrderBySel'; break;
			case 'aAggGroupFunctionField' : whatUL = 'ulAggGroupFunctionSel'; break;
		}
		whatEnable = "enabled";
	}
	$(this).removeClass(actualIco).addClass(whatIco);
	$('#'+whatUL).append(listElement);

	if (whatUL == 'ulRegular_fieldz' || whatUL == 'ulRegFldzSel' || whatUL == 'ulAggGroupFunction' || whatUL == 'ulAggGroupFunctionSel')
		refreshOrderBy();
	listElement.onclick = null;
}

function refreshOrderBy()
{
	$('#ulRegOrderBySel li').remove();
	$('#ulRegOrderBy li').remove();
	
	$('#ulRegFldzSel li').each(function() {
		var key = $(this).find('#fldKeyID').val();
		var value = $(this).find('span#fldValueID').text(); 
		var e = $(getRegOrderByItem(key, value));
		$(e).attr('id', 'aRegOrderByFieldID');
		$(e).find('#regOrderByIco').click(swapUlList);
		$('#ulRegOrderBy').append(e);		
	});
	$('#ulAggGroupFunctionSel li').each(function() {
		var key = $(this).find('#fldKeyID').val();
// var csf = $(this).find('#CSFunction').val();
// key = csf + '(' + key + ')';
// alert(key);
		var value = $(this).find('span#fldValueID').text(); 
		var e = $(getRegOrderByItem(key, value));
		$(e).attr('id', 'aRegOrderByFieldID');
		$(e).find('#regOrderByIco').click(swapUlList);
		$('#ulRegOrderBy').append(e);		
	});	
}

/**
 * LCrosbyR
 * Resets the form
 * @return
 */
function startOver() {
	var selectedElement = document.getElementById("ulRegFldzSel");
	var aFieldsDiv = document.getElementById("ulRegular_fieldz");
	while (selectedElement.hasChildNodes()) {
		var firstChild = selectedElement.firstChild;
		if (firstChild.nodeName.toLowerCase() == "li") {
			iterate(swapIcon, firstChild, "ui-icon ui-icon-plus");
			aFieldsDiv.appendChild(firstChild);
		} else {
			selectedElement.removeChild(firstChild);
		}
	}

	addOnClickHandlers();
}

function getRegOrderByItem(key, label)
{ 
	 var regOrderByItem = '<li name="aRegOrderByField"> ' +
						'<table class="fld_lst_table">' +
						'<tr>' +
						'<td class="fld_dsc_td">' +
						label + 
						'</td>' +
						'<td class="fld_fun_td">&nbsp;' +
						'<select id="OBsorting">' +
						'<option value="ASC">ASC</option>' +
						'<option value="DESC">DESC</option>' +
						'</select></td>' +
						'<td class="fld_ico_td">' +
						'<span id="regOrderByIco" class="ui-icon ui-icon-plus"></span>' + 
						'</td>' +
						'<td><input type="hidden" class="fldcls" name="rfs" value="' + key + '"></td>' + 
						'</tr>' +
						'</table>' +
						'</li>';
// alert(regOrderByItem);
	return regOrderByItem;
}

function prepareSubmit() {
	showDiv('wait');
	
	$("#selectedFieldsDivID li").each(function() {
		var hiddenField = $(this).find('.fldcls').val();
		$('div#selectedListToPost').append('<input type="hidden" name="selectedFields" value="' + hiddenField + '">');
	});
	
	$("#selectedOrderByFieldsDivID li").each(function() {
		var hiddenField = $(this).find('.fldcls').val();
		$('div#selectedListToPost').append('<input type="hidden" name="orderByFields" value="' + hiddenField + '">');
		var sortField = $(this).find('#OBsorting').val();
		$('div#selectedListToPost').append('<input type="hidden" name="orderBySorting" value="' + sortField + '">');
	});
// alert($('div#selectedListToPost').html());
	document.forms[0].submit();
}

function prepareSubmitAgg() {
	showDiv('wait');
	
	$("#selectedGroupByFieldsDivID li").each(function() {
		var hiddenField = $(this).find('.fldcls').val();
		$('div#selectedListToPost').append('<input type="hidden" name="aggGroupByFieldsSelected" value="' + hiddenField + '">');
	});
	
	$("#selectedGroupFunctionFieldsDivID li").each(function() {
		var hiddenField = $(this).find('.fldcls').val();
		$('div#selectedListToPost').append('<input type="hidden" name="aggColumnsToSumSelected" value="' + hiddenField + '">');
		var sortField = $(this).find('#CSFunction').val();
		$('div#selectedListToPost').append('<input type="hidden" name="aggFunctionToApplySelected" value="' + sortField + '">');
	});	
	
	$("#selectedOrderByFieldsDivID li").each(function() {
		var hiddenField = $(this).find('.fldcls').val();
		$('div#selectedListToPost').append('<input type="hidden" name="orderByFields" value="' + hiddenField + '">');
		var sortField = $(this).find('#OBsorting').val();
		$('div#selectedListToPost').append('<input type="hidden" name="orderBySorting" value="' + sortField + '">');
	});
	
// alert($('div#selectedListToPost').html());
	document.forms[0].submit();
}

function loadWhereFilterBehavior()
{

    $('span[id^="addFilterIco_"]').click(function() {
    	      $('#filterTable tbody>tr:last').clone(true).insertAfter('#filterTable tbody>tr:last');
    	      $('#filterTable tbody>tr:last #val_filter_id').val('');
    	     
    	      return false;
    	    });
    	    
    $("span[id^='delFilterIco_']").click(function() {
      $(this).parent().parent().remove();
   	  return false;
     });    

}

$.fn.copyOptions = function(to, which)
{
var w = which || "selected";
if($(to).size() == 0) return this;
this.each(
	function()
	{
		if(this.nodeName.toLowerCase() != "select") return this;
		// get options
		var o = this.options;
		// get number of options
		var oL = o.length;
		for(var i = 0; i<oL; i++)
		{
			if(w == "all" || (w == "selected" && o[i].selected))
			{
				$(to).addOption(o[i].value, o[i].text);
			}
		}
	}
);
return this;
};    



function doDragDropList()
{
/////////////////////////////////
	// Used by sel list drag/drop
 	$("#drag>li").draggable({
        revert: 'invalid',
        helper: 'clone'
    });
    
 	$('#ulRegFldzSel').droppable({
        accept: ":not(.ui-sortable-helper)",
        drop: function( event, ui ) {
            $( this ).find( ".placeholder" ).remove();
            $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
        }
    }).sortable({
        items: "li:not(.placeholder)",
        sort: function() {
            $( this ).removeClass( "ui-state-default" );
        }
    });
 	$('#ulRegOrderBySel').droppable({
        accept: ":not(.ui-sortable-helper)",
        drop: function( event, ui ) {
            $( this ).find( ".placeholder" ).remove();
            $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
        }
    }).sortable({
        items: "li:not(.placeholder)",
        sort: function() {
            $( this ).removeClass( "ui-state-default" );
        }
    });
 	$('#ulAggGroupFunctionSel').droppable({
        accept: ":not(.ui-sortable-helper)",
        drop: function( event, ui ) {
            $( this ).find( ".placeholder" ).remove();
            $( "<li></li>" ).text( ui.draggable.text() ).appendTo( this );
        }
    }).sortable({
        items: "li:not(.placeholder)",
        sort: function() {
            $( this ).removeClass( "ui-state-default" );
        }
    }); 	 	
    // End used by sel list drag/drop
    // ///////////////////////////////
}

function showDiv(id) {
	if (id == 'reg')
	{
		document.getElementById('reg').style.visibility = 'visible';
		document.getElementById('agg').style.visibility = 'hidden';
	}
	else
	{
		document.getElementById('agg').style.visibility = 'visible';
		document.getElementById('reg').style.visibility = 'hidden';	
	}
}

// task:function,node:HTML Node
function iterate(task, node, icon) {
	var found = false;
	for (x = 0; x < node.childNodes.length; x++) {
		var childNode = node.childNodes[x];
		if (task(childNode, icon)) {
			found = true;
			break;
		}

		if (!found && childNode.childNodes.length > 0)
			found = iterate(task, childNode, icon);
		else
			break;
	}
	return found;
}

function swapHiddenEnable(node, value) {
	try {
		if (node.getAttribute("type").toLowerCase() == "hidden") {
			if (value == "enabled")
				node.removeAttribute("disabled");
			else
				node.setAttribute("disabled", "disabled");
			return true;
		} else
			return false;
	} catch (err) {
		return false;
	}
	return false;
}

function swapIcon(node, icon) {
	if (node.nodeName.toLowerCase() == "span") {
		node.setAttribute("class", icon);
		return true;
	} else
		return false;
}


function hideDiv(someID)
{
    document.getElementById(someID).style.visibility = 'hidden'; 
}

function showDiv(someID)
{
    document.getElementById(someID).style.visibility = 'visible';
}
