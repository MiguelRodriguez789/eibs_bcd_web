<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="entity" class="datapro.eibs.beans.ESD208001Message" scope="session" />
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/events.js"> </script>
<title>Close Top Opener</title>
</head>
<script type="text/javascript">
function isValidObject(objToTest) {
	if (null == objToTest) return false;
	if ("undefined" == typeof(objToTest)) return false;
	return true;
}

function triggerEventOnTop(field, evtName){
	if(typeof field === 'string' ){
		field = getElement(field);
	}	
	
	if(isValidObject(field) && typeof evtName === 'string' && evtName.trim() != ''){
		if(isValidObject(top.opener.EventShooter) && typeof top.opener.EventShooter === 'function'){
			try {
				top.opener.EventShooter.apply(undefined, [field, evtName]);
			} catch (e) {
				if(isValidObject(top.opener.jQuery)){
					top.opener.jQuery("'#"+ field.id +"'").trigger(evtName);
				}					
			}
		} else {
			if(isValidObject(top.opener.jQuery)){
				top.opener.jQuery("'#"+ field.id +"'").trigger(evtName);
			} else {
				EventTrigger(field, evtName);
			}
		} 
	}
}
  
 function loadScript() {
	var refnum = top.opener.document.forms[0].REFNUM;
	var button = top.opener.document.getElementById('newButton');
	if(isValidObject(refnum)){ 
		refnum.value =  String('<%=entity.getE01CUENUM()%>');
		if(isValidObject(button)){
			triggerEventOnTop(button,'click');
		}
	}
	top.close();
  }
</script>
<body onload="loadScript()">
</body>
</html>