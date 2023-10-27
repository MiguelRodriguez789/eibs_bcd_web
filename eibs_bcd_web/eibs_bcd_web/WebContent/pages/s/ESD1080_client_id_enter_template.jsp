<%@include file="/pages/s/include/tagLibs.jsp" %>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/idTools.js"> </script>

<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" 	scope="session" />

 <table id="TBID" class="TBHELP" align="center" style="width: 300px;">
     <tr>
	 <td nowrap>
		<div id="ID_COUNTRY" style="position:relative; display:none;">
			Pa&iacute;s:
			<INPUT TYPE=HIDDEN NAME="INT" value=""> 
			<INPUT TYPE="text" NAME="COUNTRY" ID="COUNTRY" value="<%= currUser.getE01CTR() %>" size="5" maxlength="4" 
				onfocus="showIdFields(document.forms[0].COUNTRY.value, getElementChecked('CUSCLS').value);" 
				onblur="showIdFields(document.forms[0].COUNTRY.value, getElementChecked('CUSCLS').value);">
			<a href="javascript:GetCodeDescCNOFC('COUNTRY','','03')" id="countryhelp">
			<img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="bottom" border="0"></a>
		</div>
	</td>
	</tr>
	<tr> 
	 <td nowrap >
		<div id="ID_CUSTYPE" style="position:relative; display:none;">
			<table style='background: white; vertical-align: text-top;'>
			<tr>
			<td>
			<label for="pers" id="pers">
			<input type="radio" name="CUSCLS" value="PERS" onclick="showIdFields(document.forms[0].COUNTRY.value,'PERS');" checked="checked">Persona 
			</label>
			<label for="corp" id="corp" >
			<input type="radio" name="CUSCLS" value="CORP" onclick="showIdFields(document.forms[0].COUNTRY.value,'CORP');" >Juridico
			</label>
			<label for="corp-pers" id="corp-pers" style="position:relative; display:<%= currUser.getE01INT().equals("07") ? "inline" : "none" %>;">
			<input type="radio" name="CUSCLS" value="BOTH"  
				onclick="showIdFields(document.forms[0].COUNTRY.value,'BOTH');" >Empresa NT
			</label>
			</td>
			</tr>
			</table>
		</div>
	</td>
	</tr>
	
	<tr>
	<td nowrap >
	<div id="ID_DIV" style="position:relative; display:none;">
	<jsp:include page="ESD0080_client_id_template.jsp" flush="true">
		<jsp:param name="country" value="<%= currUser.getE01CTR() %>" />
		<jsp:param name="legalType" value="PERS" />
	</jsp:include>
	<% if(request.getParameter("search") == null 
		|| Boolean.valueOf(request.getParameter("search")).booleanValue()){ %>
	<span id="ID_SEARCH" style="position:relative; display:none;">
	<img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor : hand;" onClick="searchById(event)" align="bottom">
	</span>
	<% } %>	
	</div>
	</td>
	</tr>
 </table>
 
<script> 
function validateIdSearch() {
	var IDSearch = document.getElementById("IDN").value;
    
	return IDSearch;
}
addEvent(document.getElementById('COUNTRY'), 'change', function(){
		if(mapCountryCode(document.getElementById('COUNTRY').value) == '07'){
			document.getElementById('corp-pers').style.display='inline';
		} else {
			document.getElementById('corp-pers').style.display='none';
		}
	} 
);
</script>