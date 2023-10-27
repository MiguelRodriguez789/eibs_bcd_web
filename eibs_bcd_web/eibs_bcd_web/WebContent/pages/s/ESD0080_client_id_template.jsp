<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="datapro.eibs.master.Util"%>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="idData" class="datapro.eibs.beans.IdentificationData" scope="request" />

		<input type="hidden" id="IDN" name="IDN" value="<%=idData.getTokenizedId()%>"/>
			
		<span id="ID01X" style="position:relative; display:none;">
			<input type="text" name="XXIDN0" id="XXIDN0" value="<%=idData.getIdentification()%>" maxlength="15" size="17"
				onblur="document.forms[0].IDN.value=this.value" >
		</span>
		
		<span id="ID04C" style="position:relative; display:none;">
			<input type="text" name="XXIDN0" id="XXIDN0" value="<%=idData.getIdentification()%>" maxlength="12" size="17"
				onblur="document.forms[0].IDN.value=this.value" >
		</span>		
		
		<span id="ID03X" style="position:relative; display:none;">
			<input type="text" name="03XIDN0" id="03XIDN0" value="<%=idData.getIdentification(0, 1)%>" maxlength="1" size="1" readonly
					onchange="joinID(document.forms[0].IDN, 'X', 2);">
				<a href="javascript:getIdTypeHelp(getElementChecked('TYPE').value)"> 
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
				</a> 
			<input type="text" name="03XIDN1" id="03XIDN1" value="<%=idData.getIdentification(1, 14)%>" maxlength="14" size="17" onKeypress="enterInteger(event)"
					onchange="joinID(document.forms[0].IDN, 'X', 2);">
		</span>

		<span id="ID07C" style="position:relative; display:none;">
				<input type="text" name="07CIDN0" id="07CIDN0" value="<%= idData.getIdentification(0) %>" maxlength="7" size="8" onKeyPress="enterInteger(event);" 
						onblur="fillLeft(this, '0');joinIDFieldsPA('C');" > - 
				<input type="text" name="07CIDN1" id="07CIDN1" value="<%= idData.getIdentification(1) %>" maxlength="4" size="5"  
						onblur="fillLeft(this, '0');joinIDFieldsPA('C');" > - 
				<input type="text" name="07CIDN2" id="07CIDN2" value="<%= idData.getIdentification(2) %>" maxlength="8" size="9" onKeyPress="enterInteger(event);" 
						onblur="fillLeft(this, '0');joinIDFieldsPA('C');" >
				<input type="hidden" name="07CIDN3" id="07CIDN3" value="00" maxlength="2" size="3" onKeyPress="enterInteger(event);" 
						onblur="joinIDFieldsPA('C');document.forms[0].EIBSBTN.focus();" >
		</span>

		<span id="ID07P" style="position:relative; display:none;">
				<input type="text" name="07PIDN0" id="07PIDN0" value="<%= idData.getIdentification(0) %>" maxlength="2" size="3" onKeyPress="enterInteger(event);" 
						onblur="fillLeft(this, '0');joinIDFieldsPA('P');" > - 
				<input type="text" name="07PIDN1" id="07PIDN1" value="<%= idData.getIdentification(1) %>" maxlength="2" size="3" 
						onblur="this.value=this.value.replace(/ /ig,'');joinIDFieldsPA('P');" > - 
				<input type="text" name="07PIDN2" id="07PIDN2" value="<%= idData.getIdentification(2) %>" maxlength="5" size="6" onKeyPress="enterInteger(event);" 
						onblur="fillLeft(this, '0');joinIDFieldsPA('P');" > - 
				<input type="text" name="07PIDN3" id="07PIDN3" value="<%= idData.getIdentification(3) %>" maxlength="6" size="7" onKeyPress="enterInteger(event);" 
						onblur="fillLeft(this, '0');joinIDFieldsPA('P');" >
		</span>
		
		<span id="ID07B" style="position:relative; display:none;">
			<input type="text" name="07BIDN0" id="07BIDN0" value="<%= idData.getIdentification(0) %>" maxlength="2" size="3" onKeyPress="enterInteger(event);"
				onblur="fillLeft(this, '0');joinIDFields('B', 4);" > - 
			<input type="text" name="07BIDN1" id="07BIDN1" value="NT" maxlength="2" size="3" readonly> - 
			<input type="text" name="07BIDN2" id="07BIDN2" value="<%= idData.getIdentification(2) %>" maxlength="4" size="5" onKeyPress="enterInteger(event);"
				onblur="fillLeft(this, '0');joinIDFields('B', 4);" > - 
			<input type="text" name="07BIDN3" id="07BIDN3" value="<%= idData.getIdentification(3) %>" maxlength="5" size="6" onKeyPress="enterInteger(event);"
				onblur="fillLeft(this, '0');joinIDFields('B', 4);" >
		</span>
		
        <span id="ID11X" style="position:relative; display:none;">
			<input type="text" name="11XIDN0" id="11XIDN0" value="<%= idData.getIdentification(0) %>" maxlength="4" size="5" onKeyPress="enterInteger(event);"
				onblur="fillLeft(this, '0');joinIDFields('X', 3);" > - 
			<input type="text" name="11XIDN1" id="11XIDN1" value="<%= idData.getIdentification(1) %>" maxlength="4" size="5" onKeyPress="enterInteger(event);"
				onblur="fillLeft(this, '0');joinIDFields('X', 3);" > - 
			<input type="text" name="11XIDN2" id="11XIDN2" value="<%= idData.getIdentification(2)%>" maxlength="5" size="6" onKeyPress="enterInteger(event);"
				onblur="fillLeft(this, '0');joinIDFields('X', 3);" >
		</span>
		
		<img src="<%= request.getContextPath() %>/images/backspace.gif" title="Quitar formato"
			onclick="showIdFields('', '')" />


<SCRIPT type="text/javascript">

	showIdFields('<%= ISOCodes.getIBSCountryCode(Util.getReqParameter("country", request)) %>', '<%= Util.getReqParameter("legalType", request) %>');

	$(function() {
		//$("#07PIDN0").combobox();
	});
</SCRIPT>

