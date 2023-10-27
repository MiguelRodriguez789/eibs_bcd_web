<%@ page import = "datapro.eibs.master.Util" %>

<%

  datapro.eibs.sockets.MessageRecord mr;
  String READ = "";
  String color1 = "trdark";
  String color2 = "trclear";
 
  // PARAMETROS 
  String suffixE, suffix, suffixDsc, suffixMod;
  String messageName;
  String title = "";
  String i = "";
  boolean readOnly = false;  
  boolean basicData = false; 
  
  // Esta variable se usa para saber si se consultan los datos basicos y asi construir 
  // dinamicamente los nombres de los campos, ya que el template es el mismo para 
  // las direcciones de clientes personales, corporativos , beneficiarios y representantes legales
  // asi como para la consulta de aprobación.
  // Ver mas abajo donde se arman los nombres de los campos.
  if( request.getParameter("basic") != null ){
		basicData = Boolean.valueOf(request.getParameter("basic").toString()).booleanValue() ;
  }
   
   //Obtiene el titulo del segmento de direccion
   if (request.getParameter("title") != null)
     title = request.getParameter("title");
   
   // Determina si es solo lectura
   if (request.getParameter("readOnly") != null ){
     readOnly = Boolean.valueOf( request.getParameter("readOnly").toString() ).
     					booleanValue() ;
     READ = readOnly ? "readonly" : "";
   }
   // Obtiene el mensaje a desplegar
   messageName = request.getParameter("messageName");
   mr= (datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);      
   
   if (request.getParameter("suffixE") != null){
   		suffixE = request.getParameter("suffixE") ;
   }else{
   		suffixE = "E01TBL" ;
   }
   
   if (request.getParameter("suffix") != null){
   		suffix = request.getParameter("suffix") ;
   }else{
   		suffix = "E01EXT" ;
   }
   suffixDsc = "D" + suffix.substring(1) ;
   suffixMod = "F" + suffix.substring(1) ;
   // Indice para varias direcciones
   if (request.getParameter("index") != null){
   		i = request.getParameter("index") ;
   } else {
   		i = "1" ;
   }
   //Obtiene el color de la primera fila
   if(request.getParameter("firstColor")!= null){
      color1=request.getParameter("firstColor");
      if (color1.equals("trclear")) color2="trdark";
   }
  // ETIQUETAS DE CAMPOS
  // NOMBRES DE CAMPOS
	String eFLD1 = suffixE + "LB1";
	String eFLD2 = suffixE + "LB2";
	String eFLD3 = suffixE + "LB3";
	String eFLD4 = suffixE + "LB4";
	String eFLD5 = suffixE + "LB5";
	String eFLD6 = suffixE + "LB6";
	String eFLD7 = suffixE + "LB7";
	String eFLD8 = suffixE + "LB8";
	String FLD1 = suffix + "LB1";
	String FLD2 = suffix + "LB2";
	String FLD3 = suffix + "LB3";
	String FLD4 = suffix + "LB4";
	String FLD5 = suffix + "LB5";
	String tb5 = suffix + "TB5";
	String FLD5Dsc = suffixDsc + "LB5";
	String FLD6 = suffix + "LB6";
	String tb6 = suffix + "TB6";
	String FLD6Dsc = suffixDsc + "LB6";
	String FLD7 = suffix + "F1D";
	String FLD8 = suffix + "F1M";
	String FLD9 = suffix + "F1Y";
	String FLD10 = suffix + "F2D";
	String FLD11 = suffix + "F2M";
	String FLD12 = suffix + "F2Y";
	String ck1 = suffixE + "CK1";
	String ck2 = suffixE + "CK2";
	String ck3 = suffixE + "CK3";
	String ck4 = suffixE + "CK4";
	String ck5 = suffixE + "CK5";
	String ck6 = suffixE + "CK6";
	String ck7 = suffixE + "CK7";
	String ck8 = suffixE + "CK8";

	// Flag Modificacion para consulta de aprobacion  
	String FLD1F = suffixMod + "LB1";
	String FLD2F = suffixMod + "LB2";
	String FLD3F = suffixMod + "LB3";
	String FLD4F = suffixMod + "LB4";
	String FLD5F = suffixMod + "LB5";
	String FLD6F = suffixMod + "LB6";
	String FLD7F = suffixMod + "LB7";
	String FLD8F = suffixMod + "LB8";
	String FLD9F = suffixMod + "LB9";
	String FLD10F = suffixMod + "L10";
	String FLD11F = suffixMod + "L11";
	String FLD12F = suffixMod + "L12";

%>
<SCRIPT type="text/javascript">
 function trim (str) {
     return str.replace (/^\s+|\s+$/g, '');
 }
 
  
 function chgData() {
		// Variables de la clase
	try {
  		getElement('<%=FLD1%>').value = getElement('FLD1').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD2%>').value = getElement('FLD2').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD3%>').value = getElement('FLD3').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD4%>').value = getElement('FLD4').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD5%>').value = getElement('FLD5').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD6%>').value = getElement('FLD6').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD7%>').value = getElement('FLD7').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD8%>').value = getElement('FLD8').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD9%>').value = getElement('FLD9').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD10%>').value = getElement('FLD10').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD11%>').value = getElement('FLD11').value;  
	 } catch (e) {}
	try {
  		getElement('<%=FLD12%>').value = getElement('FLD12').value;  
	 } catch (e) {}
 }	
 
</SCRIPT>
    
<input type="hidden" name="<%=FLD1%>" value="<%=Util.getStringField(mr, FLD1)%>">
<input type="hidden" name="<%=FLD2%>" value="<%=Util.getStringField(mr, FLD2)%>">
<input type="hidden" name="<%=FLD3%>" value="<%=Util.getStringField(mr, FLD3)%>">
<input type="hidden" name="<%=FLD4%>" value="<%=Util.getStringField(mr, FLD4)%>">
<input type="hidden" name="<%=FLD5%>" value="<%=Util.getStringField(mr, FLD5)%>">
<input type="hidden" name="<%=FLD5Dsc%>" value="<%=Util.getStringField(mr, FLD5Dsc)%>">
<input type="hidden" name="<%=FLD6%>" value="<%=Util.getStringField(mr, FLD6)%>">
<input type="hidden" name="<%=FLD6Dsc%>" value="<%=Util.getStringField(mr, FLD6Dsc)%>">
<input type="hidden" name="<%=FLD7%>" value="<%=Util.getStringField(mr, FLD7)%>">
<input type="hidden" name="<%=FLD8%>" value="<%=Util.getStringField(mr, FLD8)%>">
<input type="hidden" name="<%=FLD9%>" value="<%=Util.getStringField(mr, FLD9)%>">
<input type="hidden" name="<%=FLD10%>" value="<%=Util.getStringField(mr, FLD10)%>">
<input type="hidden" name="<%=FLD11%>" value="<%=Util.getStringField(mr, FLD11)%>">
<input type="hidden" name="<%=FLD12%>" value="<%=Util.getStringField(mr, FLD12)%>">

<div id="IDCOL<%=i%>" style="position:relative; display:'';">
<% if( basicData){ %>
	<h4><%=title%></h4>
<% } %>   
   <table class="tableinfo" width="100%" >
    	<tr > 
        	<td nowrap >
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
           			<%if ((!Util.getStringField(mr, eFLD1).equals("")) 
           				|| (!Util.getStringField(mr, eFLD2).equals(""))) { %>
          			<tr id="<%=color1%>"> 
            			<td nowrap align="right"><%=Util.toStringField(mr, eFLD1)%> </td>
            			<td nowrap > 
            			<%if (!Util.getStringField(mr, eFLD1).equals("")) {%>
            				<input type="text" name="FLD1" size="55" maxlength="55" value="<%=Util.getStringField(mr, FLD1)%>" 
            				<%=Util.getStringField(mr, FLD1F).equals("Y") ? "class=\"txtchanged\"" : ""%> 
            				onChange="chgData()" onBlur="chgData()" >
	            			<%if (Util.getStringField(mr, ck1).equals("1")) {%>
	            			   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
							<%} %>              				
						<%} %>              				
            			</td>
            			<td nowrap align="right"><%=Util.toStringField(mr, eFLD2)%></td>
            			<td nowrap > 
            			<%if (!Util.getStringField(mr, eFLD2).equals("")) {%>
            				<input type="text" name="FLD2" size="55" maxlength="55" value="<%=Util.getStringField(mr, FLD2)%>" 
            				<%=Util.getStringField(mr, FLD2F).equals("Y") ? "class=\"txtchanged\"" : ""%> 
            				onChange="chgData()" onBlur="chgData()" >
            			<%if (Util.getStringField(mr, ck2).equals("1")) {%>
            			   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
						<%} %>              				
						<%} %>              				
            			</td>
					<%} %>              				
           			</tr>
          			<tr id="<%=color2%>"> 
           			<%if ((!Util.getStringField(mr, eFLD3).equals("")) 
           				|| (!Util.getStringField(mr, eFLD4).equals(""))) {%>
            			<td nowrap align="right"><%=Util.toStringField(mr, eFLD3)%></td>
            			<td nowrap > 
            			<%if (!Util.getStringField(mr, eFLD3).equals("")) {%>
            				<input type="text" name="FLD3" size="17" maxlength="17" value="<%=Util.getStringField(mr, FLD3)%>" 
            				<%=Util.getStringField(mr, FLD3F).equals("Y") ? "class=\"txtchanged\"" : ""%> 
            				onChange="chgData()" onBlur="chgData()" >
            			<%if (Util.getStringField(mr, ck3).equals("1")) {%>
            			   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
						<%} %>              				
						<%} %>              				
            			</td>
            			<td nowrap align="right"><%=Util.toStringField(mr, eFLD4)%></td>
            			<td nowrap > 
            			<%if (!Util.getStringField(mr, eFLD4).equals("")) {%>
            				<input type="text" name="FLD4" size="17" maxlength="17" value="<%=Util.getStringField(mr, FLD4)%>" 
            				<%=Util.getStringField(mr, FLD4F).equals("Y") ? "class=\"txtchanged\"" : ""%> 
            				onChange="chgData()" onBlur="chgData()" >
            			<%if (Util.getStringField(mr, ck4).equals("1")) {%>
            			   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
						<%} %>              				
						<%} %>              				
            			</td>
					<%} %>              				
           			</tr>
          			<tr id="<%=color1%>"> 
           			<%if ((!Util.getStringField(mr, eFLD5).equals("")) 
           				|| (!Util.getStringField(mr, eFLD6).equals(""))) {%>
            			<td nowrap align="right"><%=Util.toStringField(mr, eFLD5)%></td>
            			<td nowrap > 
            			<%if (!Util.getStringField(mr, eFLD5).equals("")) {%>
            				<input type="text" name="FLD5" size="3" maxlength="2" value="<%=Util.getStringField(mr, FLD5)%>" 
            				<%=Util.getStringField(mr, FLD5F).equals("Y") ? "class=\"txtchanged\"" : ""%> 
            				onChange="chgData()" onBlur="chgData()" >
            			  <% if (readOnly == false) {%> 
			              <a href="javascript:GetCodeDescCNOFC('FLD5','FLD5Dsc','<%= mr.getField(tb5).getString()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
						  <%} %>
            				<input type="text" name="FLD5Dsc" size="38" maxlength="35" value="<%= mr.getField(FLD5Dsc).getString()%>" readonly>
            			<%if (Util.getStringField(mr, ck5).equals("1")) {%>
            			   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
						<%} %>              				
						<%} %>              				
            			</td>
            			<td nowrap align="right"><%=Util.toStringField(mr, eFLD6)%></td>
            			<td nowrap > 
            			<%if (!Util.getStringField(mr, eFLD6).equals("")) {%>
            				<input type="text" name="FLD6" size="3" maxlength="2" value="<%=Util.getStringField(mr, FLD6)%>" 
            				<%=Util.getStringField(mr, FLD6F).equals("Y") ? "class=\"txtchanged\"" : "" %> 
            				onChange="chgData()" onBlur="chgData()" >
            			  <% if (readOnly == false) {%> 
			              <a href="javascript:GetCodeDescCNOFC('FLD6','FLD6Dsc','<%=Util.getStringField(mr, tb6)%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
						  <%} %>
            				<input type="text" name="FLD6Dsc" size="38" maxlength="35" value="<%=Util.getStringField(mr, FLD6Dsc)%>" readonly>
            			<%if (Util.getStringField(mr, ck6).equals("1")) {%>
            			   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
						<%} %>              				
						<%} %>              				
            			</td>
					<%} %>              				
           			</tr>
          			<tr id="<%=color2%>"> 
           			<%if ((!Util.getStringField(mr, eFLD7).equals("")) 
           				|| (!Util.getStringField(mr, eFLD8).equals(""))) {%>
            			<td nowrap align="right"><%=Util.toStringField(mr, eFLD7)%></td>
            			<td nowrap > 
            			<%if (!Util.getStringField(mr, eFLD7).equals("")) {%>
            				<input type="text" name="FLD7" size="3" maxlength="2" value="<%=Util.getStringField(mr, FLD7)%>" 
            				<%=Util.getStringField(mr, FLD7F).equals("Y") ? "class=\"txtchanged\"" : "" %> 
            				onChange="chgData()" onBlur="chgData()" >
            				<input type="text" name="FLD8" size="3" maxlength="2" value="<%=Util.getStringField(mr, FLD8)%>" 
            				<%=( mr.getField(FLD8F).getString().equals("Y"))?"class=\"txtchanged\"":"" %> 
            				onChange="chgData()" onBlur="chgData()" >
            				<input type="text" name="FLD9" size="5" maxlength="4" value="<%=Util.getStringField(mr, FLD9)%>" 
            				<%=( mr.getField(FLD9F).getString().equals("Y"))?"class=\"txtchanged\"":"" %> 
            				onChange="chgData()" onBlur="chgData()" >
	            			<% if (readOnly == false) {%> 
       				        <a href="javascript:DOBPicker(document.forms[0].FLD8,document.forms[0].FLD7,document.forms[0].FLD9)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
							<%} %>              				
		          			<%if (Util.getStringField(mr, ck7).equals("1")) {%>
            			   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
						<%} %>              				
						<%} %>              				
            			</td>
            			<td nowrap align="right"><%=Util.toStringField(mr, eFLD8)%></td>
            			<td nowrap > 
            			<%if (!Util.getStringField(mr, eFLD8).equals("")) {%>
            				<input type="text" name="FLD10" size="3" maxlength="2" value="<%=Util.getStringField(mr, FLD10)%>" 
            				<%=Util.getStringField(mr, FLD10F).equals("Y") ? "class=\"txtchanged\"" : "" %> 
            				onChange="chgData()" onBlur="chgData()" >
            				<input type="text" name="FLD11" size="3" maxlength="2" value="<%=Util.getStringField(mr, FLD11)%>" 
            				<%=Util.getStringField(mr, FLD11F).equals("Y") ? "class=\"txtchanged\"" : "" %> 
            				onChange="chgData()" onBlur="chgData()" >
            				<input type="text" name="FLD12" size="5" maxlength="4" value="<%=Util.getStringField(mr, FLD12)%>" 
            				<%=Util.getStringField(mr, FLD12F).equals("Y") ? "class=\"txtchanged\"" : "" %> 
            				onChange="chgData()" onBlur="chgData()" >
	            			<% if (readOnly == false) {%> 
       				        <a href="javascript:DOBPicker(document.forms[0].FLD11,document.forms[0].FLD10,document.forms[0].FLD12)"><img src="<%=request.getContextPath()%>/images/calendar.gif" alt="help" align="absmiddle" border="0"></a>
							<%} %>              				
            			<%if (Util.getStringField(mr, ck8).equals("1")) {%>
            			   <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  > 
						<%} %>              				
						<%} %>              				
            			</td>
					<%} %>              				
           			</tr>
			</table>
		</td>
	</tr>
</table>

</div>    

