//Ramses Amaro 04/12/03
//fhernandez 04/10/13
	function EventShooter(obj, name) {
		var evt;
		if(document.createEvent){
			var eventType = "";
			if(name == "abort" || name == "blur" || name == "change"
				|| name == "error" || name == "focus" || name == "load"
				|| name == "reset" || name == "resize" || name == "scroll"
				|| name == "select" || name == "submit" || name == "unload"){
				evt = document.createEvent('HTMLEvents');
			} else if(name == "keydown" || name == "keypress" || name == "keyup"){
				evt = document.createEvent('MouseEvents');
			} else if(name == "click" || name == "mousedown" || name == "mousemove"
				|| name == "mouseout" || name == "mouseover" || name == "mouseup"){
				evt = document.createEvent('MouseEvents');
			} else {//custom Event
				evt = document.createEvent('Event');
			}
			evt.initEvent(name, true, false );
			obj.dispatchEvent(evt);
		} else if(document.createEventObject){
			evt = document.createEventObject();
			obj.fireEvent("on"+name, evt);
		}
		return evt; 
	}
	
	function callEventOnElements(items, name) {
		for (var i = 0 ; i < items.length ; i++) {
			var item = items.item(i);
			if (isValidObject(item.childNodes)) {
				callEventOnElements(item.childNodes);
			}
			if (item.nodeName.toLowerCase() == 'input' 
				|| item.nodeName.toLowerCase() == 'select'
				|| item.nodeName.toLowerCase() == 'textarea'
				|| item.nodeName.toLowerCase() == 'checkbox'
				|| item.nodeName.toLowerCase() == 'radio') {
				EventShooter(item, name);
			}
		}
	}

	function isValidObject(objToTest) {
		if (null == objToTest) return false;
		if ("undefined" == typeof(objToTest)) return false;
		return true;
	}
	
	function initDynTable()
	{
		var pos = img.indexOf("dynTableImage.gif");
		if(pos > 0){
			img = img.substring(0, img.indexOf("dynTableImage.gif"));
		} 
	}
	
	function initCaptions(group,inputArray)
	{
	  window["groupCaptionsArray"+group] = new Array();
	  for (var i = 0;i<inputArray.length;i++)
	  {
		window["groupCaptionsArray"+group][i] = new Array();
		for (var j = 0;j<inputArray[i].length;j++)
		  window["groupCaptionsArray"+group][i][j] = inputArray[i][j];
  	  }
	}

	function initArray(group,inputArray)
	{
	  window["groupArray"+group] = new Array();
	  for (var i = 0;i<inputArray.length;i++)
	  {
		window["groupArray"+group][i] = new Array();
		window["groupArray"+group][i][0]=false;
		window["groupArray"+group][i][1]=i;
		window["groupArray"+group][i][2]=false;
		for (var j = 0;j<inputArray[i].length;j++)
			window["groupArray"+group][i][j+3] = inputArray[i][j];
		
  	  }
  	  showElements(group);
	}
	
	function getCell(group, capArr, tmpArr, arPos, i, rowinc) {
		var contents = "";
		var name = "";
		var fmtDate = window["fmtDate"+group];
		var type = capArr[i][1].toLowerCase();
		var bHidden = type.indexOf("hidden") > -1;
		var attributes = "";
		
		if (isValidObject(capArr[i][14])) {
        	for(var s=0;s < capArr[i][14].length;s=s+2){
        		attributes = capArr[i][14][s] + "=\"" +capArr[i][14][s+1]+"\"";
        	}
		}
				
    	if (capArr[i][3] != "") { //date fields
    		var date1;
    		var date2;
    		var date3;
    		if (fmtDate == "DMY"){ 
    			date1 = isValidObject(tmpArr[arPos][i+rowinc]) ? tmpArr[arPos][i+rowinc] : "";
    			date1 += "\" size=\"2\" maxlength=\"2\">";
    			date2 = isValidObject(tmpArr[arPos][i+rowinc+1]) ? tmpArr[arPos][i+rowinc+1] : "";
    			date2 += "\" size=\"2\" maxlength=\"2\">";
    			date3 = isValidObject(tmpArr[arPos][i+rowinc+2]) ? tmpArr[arPos][i+rowinc+2] : "";
    			date3 += "\" size=\"4\" maxlength=\"4\">";
    		}
	    	else if (fmtDate == "MDY"){ 
	    		date1 = isValidObject(tmpArr[arPos][i+rowinc+1]) ? tmpArr[arPos][i+rowinc+1] : "";
	    		date1 += "\" size=\"2\" maxlength=\"2\">";
	    		date2 = isValidObject(tmpArr[arPos][i+rowinc]) ? tmpArr[arPos][i+rowinc] : "";
	    		date2 += "\" size=\"2\" maxlength=\"2\">";
	    		date3 = isValidObject(tmpArr[arPos][i+rowinc+2]) ? tmpArr[arPos][i+rowinc+2] : "";
	    		date3 += "\" size=\"4\" maxlength=\"4\">";
	    	}
	    	else {
	    		date1 = isValidObject(tmpArr[arPos][i+rowinc + 2]) ? tmpArr[arPos][i+rowinc+2] : "";
	    		date1 += "\" size=\"4\" maxlength=\"4\">";
	    		date2 = isValidObject(tmpArr[arPos][i+rowinc+1]) ? tmpArr[arPos][i+rowinc+1] : "";
	    		date2 += "\" size=\"2\" maxlength=\"2\">";
	    		date3 = isValidObject(tmpArr[arPos][i+rowinc]) ? tmpArr[arPos][i+rowinc] : "";
	    		date3 += "\" size=\"2\" maxlength=\"2\">";
	    	}
    		if(bHidden){
        		contents += justifyRight(date1,2) + "/" + justifyRight(date2,2) + "/" + justifyRight(date3,2);
    		}
    		name = group + "_" + capArr[i][3] + "_" + justifyRight(arPos,2);
	    	contents += "<input type='" + type + "' id='"+ name +"' name='"+ name +"' " + attributes + " value=\""+ date1;
	    	name = group + "_" + capArr[i][4] + "_" + justifyRight(arPos,2);
	    	contents += "<input type='" + type + "' id='"+ name +"' name='"+ name +"' " + attributes + " value=\""+ date2;
	    	name = group + "_" + capArr[i][5] + "_" + justifyRight(arPos,2);
	    	contents += "<input type='" + type + "' id='"+ name +"' name='"+ name +"' " + attributes + " value=\""+ date3;
    	} else if(type == "select") { //select fields
    		name = group + "_" + capArr[i][2] + "_" + justifyRight(arPos,2);
    		contents += "<select id='"+ name +"' name='"+ name + "' ";
			contents += attributes;
    		contents += ">";
    		if (isValidObject(capArr[i][15])) {
        		for(var s=0;s < capArr[i][15].length;s=s+2){
            		contents += "<option value=\""+ capArr[i][15][s] + "\"" 
            			+ (tmpArr[arPos][i+rowinc] == capArr[i][15][s] ? " selected" : "") + ">"+capArr[i][15][s+1]+"</option>";
        		}     			
    		} else {
    			contents += "<option value=\""+ tmpArr[arPos][i+rowinc] + "\" selected></option>";
    		}
    		contents += "</select>";
	    } else {
    		if(bHidden){
        		contents += tmpArr[arPos][i+rowinc];
    		}
    		name = group + "_" + capArr[i][2] + "_" + justifyRight(arPos,2);
    		var size = parseInt(capArr[i][13])+1;
    		var sSize = "\" size=\""+size+"\" maxlength=\""+capArr[i][13]+"\"" ;
    		sSize += attributes;
	        contents += "<input type='" + type + "' id='"+ name +"' name='"+ name+"' value=\""+ tmpArr[arPos][i+rowinc] +sSize+ "\">";
		}
    	return contents;
	}
	
	function initCell(myTable, group, tmpArr, a, idxrow) {
		var tmpCapArr = window["groupCaptionsArray"+group];
		var fmtDate = window["fmtDate"+group];
		var idxCol = 1;
		var rowinc = 3;
		for(var i=0;i<tmpCapArr.length;i++)
		{
			if (parseInt(tmpCapArr[i][6]) > 0 && tmpCapArr[i][0] != null) {
				//is not a captioned input so it goes as a table column
				myTable.rows[idxrow].insertCell(-1);
				
				var val = getCell(group, tmpCapArr, tmpArr, a, i, rowinc);
				myTable.rows[idxrow].cells[idxCol].innerHTML = val;
				myTable.rows[idxrow].cells[idxCol].align = tmpCapArr[i][7];
				callEventOnElements(myTable.rows[idxrow].cells[idxCol].childNodes, 'focus');
				idxCol++;
			}
			if (tmpCapArr[i][3] != "") {//Is date
				rowinc = rowinc + 2;
			}
		}
		return idxCol;
	}

	function showElements(group)
	{
		
		var myTable = document.getElementById("tb"+group);
		var tmpArr = window["groupArray"+group];	
		var tmpCapArr = window["groupCaptionsArray"+group];
		var fmtDate = window["fmtDate"+group];
		var dataLength = tmpArr.length;
		var considerStatus = window["considerStatus"+group];
		
		for(var a=0;a<dataLength;a++)
		{
			myTable.insertRow(-1);
			var idxrow = myTable.rows.length-1; 
			myTable.rows[idxrow].insertCell(-1);
		    myTable.rows[idxrow].cells[0].align = "left";
			myTable.rows[idxrow].cells[0].name = "group"+group+"_row"+tmpArr[a][1]; //fixed
			//alert("cell 0 name:" + myTable.rows[idxrow].cells[0].name);
			myTable.rows[idxrow].cells[0].innerHTML = getFirstLine(group,a,tmpArr,false);
			idxCol = initCell(myTable, group, tmpArr, a, idxrow);
			myTable.insertRow(-1);
			idxrow = myTable.rows.length-1;
			myTable.rows[idxrow].insertCell(-1);
			myTable.rows[idxrow].insertCell(-1);
		    myTable.rows[idxrow].cells[1].align = "left";
		    myTable.rows[idxrow].cells[1].colSpan = idxCol;
		    myTable.rows[idxrow].style.display = "none";
		    //alert("row" + idxrow);
		  
		    openGroup(group,tmpArr[a][1]);
		}
		//fixRowStyles(group);
	}
	
	function refreshElement(group,id)
	{
		var myTable =  document.getElementById("tb"+group);
		var tmpArr = window["groupArray"+group];	
		var tmpCapArr = window["groupCaptionsArray"+group];
		var idxrow = getPositionInTable(myTable,group,id);
		initCell(myTable, group, tmpArr, id, idxrow);
		openGroup(group,id);		
		if (isValidObject(window[group+"Related"])) {
			EventShooter(document.getElementById('spanicon' + group+"_"+id+"_"+id), 'click');			
		}
	}
	
	function addElement(group)
	{
		myTable = document.getElementById("tb"+group);
		var tmpArr = window["groupArray"+group];
		var maxIdx = tmpArr.length;
		//for(var i=0;i<tmpArr.length;i++)
		//	if (tmpArr[i]!=null)
		//		if (tmpArr[i][1]>maxIdx)
		//			maxIdx = tmpArr[i][1];
		//maxIdx++;
		tmpArr[maxIdx] = new Array();
		tmpArr[maxIdx][0]=false;
		tmpArr[maxIdx][1]=maxIdx;
		tmpArr[maxIdx][2]=false;
		var tmpCapArr = window["groupCaptionsArray"+group];
		for (var j = 0;j<tmpCapArr.length;j++)
			tmpArr[maxIdx][j+3]="";
		myTable.insertRow(-1);
		idxrow = myTable.rows.length-1;
		myTable.rows[idxrow].insertCell(-1);
	    myTable.rows[idxrow].cells[0].align = "left";
		myTable.rows[idxrow].cells[0].name = "group"+group+"_row"+maxIdx;
		myTable.rows[idxrow].cells[0].innerHTML = getFirstLine(group,maxIdx,tmpArr,true);
		var idxCol = 1;
		for(var k=3;k < tmpArr[maxIdx].length;k++)
		{ 
		  if (parseInt(tmpCapArr[k-3][6]) > 0) { 
		  	myTable.rows[idxrow].insertCell(-1);
		  	myTable.rows[idxrow].cells[idxCol].align = tmpCapArr[k-3][7];
		    idxCol++;
		  }
		} 
		myTable.insertRow(-1);
		idxrow = myTable.rows.length-1; 
		myTable.rows[idxrow].insertCell(-1);
		myTable.rows[idxrow].insertCell(-1);
		myTable.rows[idxrow].cells[1].align = "left";
		myTable.rows[idxrow].cells[1].colSpan = myTable.rows[0].cells.length - 1;
		
		document.forms[0][group+"_SIZE"].value = tmpArr.length;    
		openGroup(group, maxIdx);
		fixRowStyles(group);
	}

	function showArray(group)
	{
		var tmpArr = window["groupArray"+group];
		var message=""
		for(var i=0; i<tmpArr.length;i++)
			if(tmpArr[i]!=null)
				message=message+tmpArr[i][0]+","+tmpArr[i][1]+","+tmpArr[i][2]+","+tmpArr[i][3]+","+tmpArr[i][4]+"@";
		//alert(message);
	}

	function deleteElements(group, deleteCallback)
	{
		myTable = document.getElementById("tb"+group);	
		var tmpArr = window["groupArray"+group];
		var tmpCapArr = window["groupCaptionsArray"+group];
		var considerStatus = window["considerStatus"+group];	
		for (var a=tmpArr.length-1;a>=0;a--) {
			if (tmpArr[a]!=null)
				if (tmpArr[a][2]==true) // if checked
				{	
				    //tmpArr[a][2]= false;
					var tbPos = getPositionInTable(myTable,group,tmpArr[a][1]);
					//myTable.rows[tbPos].style.display = "none";
					//myTable.rows[tbPos + 1].style.display = "none";
					//
					if(considerStatus == "true"){
						tmpArr[a][tmpCapArr.length + 3] = 'D';
						document.forms[0][group + "_" + tmpCapArr[a][12] + "_" + justifyRight(a,2)].value = 'D';
					}else{
						myTable.deleteRow(tbPos);
						myTable.deleteRow(tbPos);
						delete tmpArr[a];					
					}
					
				}
		//
		}
		rearrangeGroup(group);
		
		if (isValidObject(deleteCallback)) {
			deleteCallback();
		}
	}
	
	function deleteAllElements(group, deleteAllCallback)
	{
		var tmpArr = window["groupArray"+group];
		var tmpCapArr = window["groupCaptionsArray"+group];
		for (var a=tmpArr.length-1;a>=0;a--) {
			if (tmpArr[a]!=null)
				tmpArr[a][2]=true;
		}
		deleteElements(group);
		
		if (isValidObject(deleteAllCallback)) {
			deleteAllCallback();
		}
	}
	
	function cloneElements(group, cloneCallback)
	{
		myTable = document.getElementById("tb"+group);	
		var tmpArr = window["groupArray"+group];
		var tmpCapArr = window["groupCaptionsArray"+group];
		var fmtDate = window["fmtDate"+group];
		
		for (var a=tmpArr.length-1;a>=0;a--)
			if (tmpArr[a]!=null)
				if (tmpArr[a][2]==true) // if checked
				{	
					tmpArr[a][2]= false;
					document.getElementById("grp"+group+"_chk"+a).checked = false;
					var tmpRow = tmpArr[a];
					var maxIdx = tmpArr.length;
				    tmpArr[maxIdx] = new Array(); //tmpRow;
					tmpArr[maxIdx][0]=false;
					tmpArr[maxIdx][1]=maxIdx;
					tmpArr[maxIdx][2]=true;
					for (var i=3; i< tmpRow.length;i++) tmpArr[maxIdx][i] = tmpRow[i];
					myTable.insertRow(-1);
					var idxrow = myTable.rows.length-1; 
					myTable.rows[idxrow].insertCell(-1);
				    myTable.rows[idxrow].cells[0].align = "left";
					myTable.rows[idxrow].cells[0].name = "group"+group+"_row"+tmpArr[maxIdx][1]; //fixed
					//alert("cell 0 name:" + myTable.rows[idxrow].cells[0].name);
					myTable.rows[idxrow].cells[0].innerHTML = getFirstLine(group,maxIdx,tmpArr,false);					
					initCell(myTable, group, tmpArr, a, idxrow);
					myTable.insertRow(-1);
					idxrow = myTable.rows.length-1; 
					myTable.rows[idxrow].insertCell(-1);
					myTable.rows[idxrow].insertCell(-1);
				    myTable.rows[idxrow].cells[1].align = "left";
				    myTable.rows[idxrow].cells[1].colSpan = idxCol;
				    myTable.rows[idxrow].style.display = "none";
				    openGroup(group, maxIdx);					
				}
		//fixRowStyles(group);
		document.forms[0][group+"_SIZE"].value = tmpArr.length;
		
		if (isValidObject(cloneCallback)) {
			cloneCallback();
		}
	}
	
	function swapGroupStatus(name,group,id) 
	{
		bStatus = swapIcon(name,id);
		if (bStatus) {
			//openGroup(group,id);
			var myTable = document.getElementById("tb"+group);
			if(isValidObject(myTable)){
				var tbPos=getPositionInTable(myTable,group,id);
				if(!isValidObject(tbPos)){
					tbPos = 0;
				}
				myTable.rows[tbPos + 1].style.display = "";
			}
		} else
			closeGroup(group,id);
		return bStatus;
	}
	
	function swapIcon(name,pos)
	{
		var myImage = document.getElementById(name);
		if(myImage.src.indexOf("group_icon_closed.gif") !== -1)
		{
			myImage.src=img+"group_icon_opened.gif";
			myImage.status="opened";
		}
		else
		{
			myImage.src=img+"group_icon_closed.gif";
			myImage.status="closed";
		}
		return myImage.status=="opened";
	}

	function checkedStatus(group,id)
	{
		var tmpArr = window["groupArray"+group];
		var status = document.getElementById("grp"+group+"_chk"+id).checked;
		tmpArr[getPositionInArray(tmpArr,id)][2]=status;	
	}

	function saveChanges(group,pos,name,index)
	{
		var myTable =  document.getElementById("tb"+group);
		var tmpArr = window["groupArray"+group];
		var tmpCapArr = window["groupCaptionsArray"+group];
		//alert("name = " + name);
		var newValue = document.getElementById(name).value;
		//alert("newValue = " + newValue);
		tmpArr[pos][index]=newValue;
		var idxCol = parseInt(tmpCapArr[index-3][6]);
		//alert("idxCol = " + idxCol);
		if ( idxCol > 0) { //is a column
			//idxCol++;
			var tbPos=getPositionInTable(myTable,group,pos);
			myTable.rows[tbPos].cells[idxCol].innerHTML = newValue;
				
		}
	}

	function getPositionInTable(table,group,id)
	{
		var myTable = table;
		for(var i = 0;i<myTable.rows.length;i++)
			if(myTable.rows[i].cells[0].name==("group"+group+"_row"+id))
				return i;
	}

	function getPositionInArray(arr,id)
	{
		for(var i = 0;i<arr.length;i++)
			if(arr[i]!=null)
				if(arr[i][1]==id)
					return i;
	}
	
	function setSelect(elem, value) {
		for (i = 0; i< elem.options.length; i++){ 
			if (elem.options[i].value == value){
				elem.options[i].selected = true;
				break;
			}
		}
	}
	
	function swapCallBack(status, group, id) {
		if (status && isValidObject(document.getElementById(group))) {
			var url = window[group.split("_")[0]+"Related"];
			GetXMLResponse(url + "&XML=true&GROUP="+group+"&ROW="+id+"&TIME="+new Date().getTime(), tableCallback, true);
		}
	}
	
	function getIcon(prefix, group, id, closed) {
		var name = prefix+group+"_"+id;
    	var image = "<span id='span" + name+"' onclick='swapCallBack(swapGroupStatus(&quot;" +
    		name+"&quot;,&quot;"+group+"&quot;,"+id+"),&quot;"+group+"&quot;,"+id+")'>" 
		+ "<img border='0' id='" + name+"' name='" + name+"' status="
				+(closed?"'opened' src='"+img+"group_icon_opened.gif'"
						:"'closed' src='"+img+"group_icon_closed.gif'")+" width='10' height='10'> "
		+ "</span>";
    	return image;
	}
	
	function openGroup(group,id)	
	{	
		myTable = document.getElementById("tb"+group);	
		var ro = window["ro"+group];
		var url =  window["urlDetail"+group];
		var tmpArr = window["groupArray"+group];
		var tmpCapArr = window["groupCaptionsArray"+group];
		var tbPos=getPositionInTable(myTable,group,id);
		var arPos=getPositionInArray(tmpArr,id);
		var fmtDate = window["fmtDate"+group];
		
		var considerStatus = window["considerStatus"+group];	

		if(tmpArr[arPos]!=null)
		{
			var contents = "";
			var capArr = window["groupCaptionsArray"+group];
			//contents +=	getFirstLine(group,arPos,tmpArr,true);
			contents +=	"<table style=\"background-color: #FFFFFF;\" width=\"100%\" id=\"tb"+ group+"_"+id +"\">";
			var rowinc = 3 ;
			for(var i=0;i<capArr.length;i++)
			{
				var idxCol = parseInt(capArr[i][6]);				
				if(capArr[i][0] != null && capArr[i][0] != 'null' && capArr[i][0] != ''){
					//If captioned cell
					contents += "<tr>";
			    	contents += "<td width=200><div align='right'>"+capArr[i][0]+" : </div></td>";
			    	contents += "<td nowrap>";
			    	contents += getCell(group, capArr, tmpArr, arPos, i, rowinc);
					if (tmpCapArr[i][3] != "") {//Is date
						rowinc = rowinc + 2;
					}
					contents +=	"</td>";
			        contents += "</tr>";
				}		        
		        if( considerStatus == "true" && i == capArr.length - 1 ){
					contents += "<tr>";
					contents += "<td colspan=\"2\">";
		 		    contents += "<input type='hidden' name='"+ group + "_" + capArr[i][12] + "_" + justifyRight(arPos,2)+"' value=\""+ tmpArr[arPos][capArr.length + rowinc] + "\">";				    				
		 		    contents +=	"</td>";
			        contents += "</tr>";	  
				}
			}
			
			var urlRelated =  window[group+"Related"];
			var bRelated = isValidObject(urlRelated);
		    if (ro!="readonly" || bRelated) {
				contents += "<tr>";
				if(ro!="readonly"){
			        contents += "<td width=\"120\" align=\"center\">" 
			        		+ "<input type=\"button\" name=\"edit" + group + id + "\" value=\"editar...\" " 
			        		+ "onClick=\"editElement('" + url + "&amp;maint=true','" + group + "'," + arPos + ");\">" 
			        		+ "</td>";					
				}			
				if(bRelated){
			    	var image = getIcon("icon", group+"_"+id, id, false);
			    	contents += "<td align=\"right\">" + image
		        		+ "<div align=\"right\" id=\""+group+"_"+id + "\"></div>"
						+ "</td>";
			    	contents += "<td align=\"left\"><span style=\"color: #58611F;\">Informaci�n Relacionada</span>";
			    	contents += " <span>" 
		        		+ "<input type=\"button\" name=\"open" + group + id + "\" value=\"...\" " 
		        		+ "onClick=\"editElement('" + urlRelated + "&amp;maint=true','" + group + "'," + arPos + ");\"></span>"
						+ "</td>";
					contents += "<td>&nbsp;</td>";
			    	contents += "</tr>";
			    	contents += "<tr>";
			    	contents += "<td colspan=\"2\">&nbsp;</td>";
			    	contents += "<td align=\"left\">" 
			        	+ "<table id=\"idTb"+ group+"_"+id + "\" align=\"left\">"
						+ "<tr><td></td></tr>"
						+ "</table>" 
						+ "</td>";
				}
				contents += "</tr>";
			}
			contents +=	"</table>";
			myTable.rows[tbPos + 1].cells[1].innerHTML = contents;
			//myTable.rows[tbPos + 1].style.display="";
		}
	}

	function closeGroup(group,id)
	{	
		myTable = document.getElementById("tb"+group);
		try {
			var tbPos=getPositionInTable(myTable,group,id);
			var tmpArr = window["groupArray"+group];
			var arPos=getPositionInArray(tmpArr,id);
			myTable.rows[tbPos].cells[0].innerHTML = getFirstLine(group,arPos,tmpArr,false);
			myTable.rows[tbPos + 1].style.display ="none";
		} catch (e) {
			myTable.rows[1].style.display ="none";
		}
	}
	
	function getFirstLine(group,arPos,tmpArr,closed)
		{
		var ro = window["ro"+group];	
		var capArr = window["groupCaptionsArray"+group];
		var considerStatus = window["considerStatus"+group];	
		//alert("ro=" + window["ro"+group] + " group=" + group);
		var status= "";
		var image= "";
		var disable= "";
		if(considerStatus == "true"){
			status = tmpArr[arPos][capArr.length+3];
			if(status == 'D'){
				disable = "disabled";
				image = "<a>" +"<img border='0' name='icon"+group+"_"+arPos+"' src='"+img+"icons/deleted.gif' width='10' height='10'> " + "</a>";
				tmpArr[arPos][2] = false;
			}else{
				image = getIcon("icon", group, arPos, closed);
			}
			
		}else{
			image = getIcon("icon", group, arPos, closed);
		}
		var firstLine = ((ro!="readonly")?("<input type='checkbox' "+((tmpArr[arPos][2]==true)?"checked":"") +
			" name='grp"+group+"_chk"+arPos+"' id='grp"+group+"_chk"+arPos+"' value='checkbox' onClick='checkedStatus(&quot;"+group+"&quot;,"+arPos+")' "+ disable + ">"):("")) +
			"&nbsp;" +  image ;

		return firstLine;
		}
	
	function submitGroups(arr)
	{
		for(var i=0;i<arr.length;i++)
		{
			rearrangeGroup(arr[i]);
			var tmpArr = window["groupArray"+arr[i]];
			for(j=0;j<tmpArr.length;j++)
				openGroup(arr[i],j);
		}
	}
	
	function justifyRight(src,spc)
	{
		var output=src.toString();
		while (output.length<spc)
			output="0"+output;
		return output;
	}
	
	function rearrangeGroup(group)
	{
		var outArr = new Array();
		var tmpArr = window["groupArray"+group];
		var nextIndex=0;
		var myTable =  document.getElementById("tb"+group);
		if (myTable != null)	
		{
			for(var i=myTable.rows.length-1;i>0;i--) //header is first row
				myTable.deleteRow(i);
			for(j=0;j<tmpArr.length;j++)
				if(tmpArr[j]!=null)
				{
					outArr[nextIndex]=tmpArr[j];
					outArr[nextIndex][1]=nextIndex++;			
				}
		}
		window["groupArray"+group]=outArr.slice(0);
		document.forms[0][group+"_SIZE"].value = window["groupArray"+group].length;
		showElements(group);
	}

	function fixRowStyles(group)
	{
		var myTable = document.getElementById("tb"+group);
		if(myTable!=null)	
			for(var i=0;i<myTable.rows.length;i++)
				myTable.rows[i].className=((i%2==0)?"rowdark":"rowlight");
	}
	
	function editElement(url, group, row) {
	    var posi = url.indexOf("?");
	    var url1 = (posi > -1) ? url + "&" : url + "?";
	    var pg = url1 + "GROUP=" + group + "&ROW=" + row;
		CenterWindow(pg,640,480,2); 
	}
	
	function newElement(url, group, row, width, height) {
		var posi = url.indexOf("?");
	    var url1 = (posi > -1) ? url + "&" : url + "?";
	    var pg = url1 + "GROUP=" + group + "&ROW=" + row + "&SIZE=" + document.forms[0][group+"_SIZE"].value;
		CenterWindow(pg, width, height, 2); 
	}
	
	function getFieldsValue(group, idx){
  	

  	    var val="";
  	 	var namelist = opener["groupCaptionsArray" + group];
		
		//When you are adding a new Row idx is blank
		if (idx != "") {
		
	     	for (i=0;i<namelist.length;i++){
	     	
	     	    var fname = namelist[i][2];
	     	    if ( fname == "" ) {
	     	       var objD = document.forms[0][namelist[i][3]];
	       	       var objM = document.forms[0][namelist[i][4]];
	       	       var objY = document.forms[0][namelist[i][5]];
	       	      
	       	       if (isValidObject(objD)) {
		 	       	  if (idx != "") objD.value = opener.document.forms[0][group + "_" +namelist[i][3] + "_" + justifyRight(idx,2)].value; else objD.value = "";
		   	          if (objD.value == "") {
		   	          	 if (namelist[i][9] != "") {
		 	    	   		objD.value = (opener.document.forms[0][namelist[i][9]] != null)? opener.document.forms[0][namelist[i][9]].value : namelist[i][9];
		 	    		 }
		   	          }
		   	       }
	       	       if (isValidObject(objM)) {
		   	       	  if (idx != "") objM.value = opener.document.forms[0][group + "_" +namelist[i][4] + "_" + justifyRight(idx,2)].value; else objM.value = "";
		   	       	  if (objM.value == "") {
		   	          	 if (namelist[i][10] != "") {
		 	    	   		objM.value = (opener.document.forms[0][namelist[i][10]] != null)? opener.document.forms[0][namelist[i][10]].value : namelist[i][10];
		 	    		 }
		   	          }
		   	       }
	       	       if (isValidObject(objY)) {
		   	       	  if (idx != "") objY.value = opener.document.forms[0][group + "_" +namelist[i][5] + "_" + justifyRight(idx,2)].value; else objY.value = "";
		   	          if (objY.value == "") {
		   	          	 if (namelist[i][11] != "") {
		 	    	   		objY.value = (opener.document.forms[0][namelist[i][11]] != null)? opener.document.forms[0][namelist[i][11]].value : namelist[i][11];
		 	    		 }
		   	          }
		   	       }
		       	   
	     	    	
	     	    } else {
	     			
	     			if (idx != "") val = opener.document.forms[0][group + "_" +namelist[i][2] + "_" + justifyRight(idx,2)].value; else val="";
		     	    if (val == "") {
		     	    	if (namelist[i][8] != "") {
		     	    	   val = (opener.document.forms[0][namelist[i][8]] != null)? opener.document.forms[0][namelist[i][8]].value : namelist[i][8];
		     	    	}
		     	    }
		     	    var obj = document.forms[0][namelist[i][2]];
		     	    if (obj!=null) {
		     	    	if (obj.tagName == "SELECT") {
		     	    
			     	    	var ln = obj.options.length;
				         	if (ln>0) {
				         		for (j=0;j<ln;j++){
				         		  if (val==obj.options[j].value) {
				         		  	obj.selectedIndex =j;
				         		  	break;
				         		  }
				         		}
				         	} else {
				         		var option = document.createElement("option");
								option.value = val;
								option.setAttribute('selected', 'selected');
								obj.appendChild(option);
				         		EventShooter(obj, 'focus');
				         	}
			         	
				        } else if (obj.tagName == "TEXTAREA") {
					        
				            obj.value =  val ;
				            
				        }  else if (obj.type == "checkbox") {
				        
				         	obj.checked = (obj.value==val) ? true : false;
				         	
						} else if (obj.type == "text" || obj.type == "password" || obj.type == "hidden") { 
						
						 	obj.value = val;
						 	
				        } else {	        		        	            	
			         		var ln = obj.length;
			         		if (ln>1) {
			         		   if (obj[0].type=="radio") {
			         			  for (j=0;j<ln;j++){
			         		  		if (val == obj[j].value) {
			         		    		obj[j].checked =true;
			         		    		break;
			         		  		}
			         			  }
			         			}
			         		} else {
			         		    if (obj.type=="radio") {
			         			  if ( val== obj.value ) obj.checked; 
			         			}
			         	    }    	
			        	}
			        }
	         	}
	     	}
	     } 

  	}

	function updateFields(group,idx) {  
	   
	   
	   try { 		   
	       var namelist = opener["groupCaptionsArray" + group];
	       var valuelist = opener["groupArray" + group];
	       var val="";
	       var obj;
	  	   if (idx == "") { //new row
	   			opener.addElement(group);
	   			idx = valuelist.length - 1;
	  	   }
	  	   var rowinc = 3;
	       for (i=0;i<namelist.length;i++){
	       	 var fname = namelist[i][2];
	       	 if (fname == "") {
	       	     var objD = document.forms[0][namelist[i][3]];
	       	     var objM = document.forms[0][namelist[i][4]];
	       	     var objY = document.forms[0][namelist[i][5]];
	       	     if (isValidObject(objD)) {
	       	     	valuelist[idx][i + rowinc] = objD.value;
	       	     }
	       	     if (isValidObject(objM)) {
	       	        rowinc = rowinc + 1;
	       	     	valuelist[idx][i + rowinc] = objM.value;
	       	     }
	       	     if (isValidObject(objY)) {
	       	        rowinc = rowinc + 1;
	       	     	valuelist[idx][i + rowinc] = objY.value;
	       	     }
	       	     
	       	 } else {
		         obj = document.forms[0][fname];
		         if (isValidObject(obj)) {
		         
			         if (obj.tagName == "SELECT") {			         	
			         	val = obj.options[obj.selectedIndex].value;
			         	
			         } else if (obj.tagName == "TEXTAREA") {			         	
			            val = obj.value;
			            
			         } else if (obj.type == "checkbox") {
			         	
			         	val = (obj.checked) ? obj.value : "";
			         	
					 } else if (obj.type == "text" || obj.type == "password" || obj.type == "hidden") { 
					 	val = obj.value;
					 	
			         } else {
			         	//radio button
			         	var ln = obj.length;	         	         		
			         	if (ln>1) {            	            		         		         		
			         		if (obj[0].type == "radio") {
			         			for (j=0;j<ln;j++){
			         		  		if (obj[j].checked) {
			         		    		val=obj[j].value;
			         		    		break;
			         		  		}
			         			}
			         		}           	        	
			         	} else {
			         	    if (obj.type == "radio") {
			         	   		if (obj.checked) val=obj.value;
			         	   	}
			         	}
			        }
			        if (isValidObject(val)) {
			        	 valuelist[idx][i + rowinc] = val;
					}
			      }
			   }   
		      
	       }
	       
	       opener.refreshElement(group,idx);
     	
	   }
	   catch(e) {
	     alert(e);
	   }
	   close();
	  }

	function clickRelBtn(group,idx) {
		document.forms[0].submit();
		opener.refreshElement(group,idx);
	}