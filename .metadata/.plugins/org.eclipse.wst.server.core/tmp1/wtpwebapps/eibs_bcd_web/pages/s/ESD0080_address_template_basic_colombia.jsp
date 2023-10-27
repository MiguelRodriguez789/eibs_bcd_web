
<%

  datapro.eibs.sockets.MessageRecord mr;
  String READ="";
  String color1="trdark";
  String color2="trclear";
 
  // PARAMETROS 
  String suffix, suffixDsc, suffixMod ;
  String messageName;
  String title="";
  String i="";
  boolean readOnly=false ;  
  boolean basicData=false ; 
  
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
     readOnly=Boolean.valueOf( request.getParameter("readOnly").toString() ).
     					booleanValue() ;
     READ = readOnly?"readonly":"";
   }
   // Obtiene el mensaje a desplegar
   messageName = request.getParameter("messageName");
   mr= (datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);      
   
   if (request.getParameter("suffix") != null){
   		suffix = request.getParameter("suffix") ;
   }else{
   		suffix = "E01" ;
   }
   suffixDsc = "D" + suffix.substring(1) ;
   suffixMod = "F" + suffix.substring(1) ;
   // Indice para varias direcciones
   if (request.getParameter("index") != null){
   		i = request.getParameter("index") ;
   }else{
   		i = "1" ;
   }
   //Obtiene el color de la primera fila
   if(request.getParameter("firstColor")!= null){
      color1=request.getParameter("firstColor");
      if (color1.equals("trclear")) color2="trdark";
   }

  // NOMBRES DE CAMPOS
	String linea2 = suffix + (basicData?"NA2":"MA2") ;
	String linea3 = suffix + (basicData?"NA3":"MA3") ;
	String linea4 = suffix + (basicData?"NA4":"MA4") ;	
	String ciudad = suffix + "CTC";
	String ciudadDsc = suffix + "CTY";
	String departamento = suffix + "STE";
	String departamentoDsc = suffixDsc + "STE";
	String pais = suffix + "ADC";
	String paisDsc = suffixDsc + "CTR";
	String codigoCorreo = suffix + "ZPC" ;

	// Flag Modificacion para consulta de aprobacion  
	String linea2F = suffixMod + (basicData?"NA2":"MA2") ;
	String linea3F = suffixMod + (basicData?"NA3":"MA3") ;
	String linea4F = suffixMod + (basicData?"NA4":"MA4") ;
	String ciudadF = suffixMod + "CTC";
	String departamentoF = suffixMod + "STE";
	String paisF = suffixMod + "CTR";
	String codigoCorreoF = suffixMod + "ZPC" ;

%>

<SCRIPT>

 function trim (str) {
     return str.replace (/^\s+|\s+$/g, '');
 }
 
 function chgPais<%=i%>(p) {
 	if (p.toUpperCase() == 'CO') {
		IDCOL<%=i%>.style.display='block' ;
		IDOTHER<%=i%>.style.display='none' ;
		chgData<%=i%>(1);
	} else {
		getElement('IDCOL<%=i%>').style.display='none' ;
		getElement('IDOTHER<%=i%>').style.display='block' ;
		chgData<%=i%>(2);
	}
 } 

 function chgDpto<%=i%>(type) {
	if (!(getElement('<%=departamento%>').value == getElement('CSTE<%=i%>').value.substring(0,2))) {
		getElement('CCTYCOD<%=i%>').value = '';
		getElement('CCTY<%=i%>').value = '';
	}
	chgData<%=i%>(type);
 } 
  
 function chgData<%=i%>(type) {
 	switch (type){
	// Direccion de Colombia
	case 1:  {
		getElement('CCTR<%=i%>').value = 'COLOMBIA';
        getElement('CCTRCOD<%=i%>').value = 'CO';
		// Variables de la clase
  		getElement('<%=pais%>').value = getElement('CCTRCOD<%=i%>').value;  
  		getElement('<%=paisDsc%>').value = getElement('CCTR<%=i%>').value;
  		getElement('<%=departamento%>').value = getElement('CSTE<%=i%>').value.substring(0,2);
  		getElement('<%=departamentoDsc%>').value = getElement('CDSTE<%=i%>').value;
		getElement('<%=ciudad%>').value = getElement('CCTYCOD<%=i%>').value;
  		getElement('<%=ciudadDsc%>').value = getElement('CCTY<%=i%>').value;
  		getElement('<%=linea2%>').value = getElement('CNA2<%=i%>').value;
  		getElement('<%=linea3%>').value = getElement('CNA3<%=i%>').value;
  		getElement('<%=linea4%>').value = getElement('CNA4<%=i%>').value; 
  		getElement('<%=codigoCorreo%>').value = getElement('CZPC<%=i%>').value;
  		break;
		}	
	// Direccion Generica para otro pais	
	case 2:  {
		var cc = getElement('CCTRCOD<%=i%>').value;
		var cd = getElement('CCTR<%=i%>').value;
		if (!(trim(cc) == '') && !(trim(cd) == '') )
		{
			getElement('OCTRCOD<%=i%>').value = cc;
			getElement('OCTR<%=i%>').value = cd;
			getElement('CCTRCOD<%=i%>').value = '';
			getElement('CCTR<%=i%>').value = '';
		} 	
		getElement('<%=pais%>').value = getElement('OCTRCOD<%=i%>').value;
		getElement('<%=paisDsc%>').value = getElement('OCTR<%=i%>').value;
		getElement('<%=departamento%>').value = "00";
  		getElement('<%=departamentoDsc%>').value = "";
		getElement('<%=ciudadDsc%>').value = getElement('OCTY<%=i%>').value;
		getElement('<%=linea2%>').value = getElement('ONA2<%=i%>').value;
		getElement('<%=linea3%>').value = getElement('ONA3<%=i%>').value;
		getElement('<%=linea4%>').value = getElement('ONA4<%=i%>').value;
		getElement('<%=codigoCorreo%>').value = getElement('OZPC<%=i%>').value;
		break;
		}
	}		
 }	

var downStrokeField;
function autojump(fieldName,nextFieldName,fakeMaxLength)
{
var myForm=document.forms[document.forms.length - 1];
var myField=myForm.elements[fieldName];
myField.nextField=myForm.elements[nextFieldName];

if (myField.maxLength == null)
   myField.maxLength=fakeMaxLength;

myField.onkeydown=autojump_keyDown;
myField.onkeyup=autojump_keyUp;
}

function autojump_keyDown()
{
this.beforeLength=this.value.length;
downStrokeField=this;
}

function autojump_keyUp()
{
if (
   (this == downStrokeField) && 
   (this.value.length > this.beforeLength) && 
   (this.value.length >= this.maxLength)
   )
   this.nextField.focus();
downStrokeField=null;
}
</SCRIPT>
    
<%-- Inicio del bloque de direccion Colombia --%> 
<input type="hidden" name="<%=pais%>" value="<%= mr.getField(pais).getString()%>">
<input type="hidden" name="<%=paisDsc%>" value="<%= mr.getField(paisDsc).getString()%>">
<input type="hidden" name="<%=ciudad%>" value="<%= mr.getField(ciudad).getString()%>">
<input type="hidden" name="<%=ciudadDsc%>" value="<%= mr.getField(ciudadDsc).getString()%>">
<input type="hidden" name="<%=departamento%>" value="<%= mr.getField(departamento).getString()%>">
<input type="hidden" name="<%=departamentoDsc%>" value="<%=mr.getField(departamentoDsc).getString()%>">
<input type="hidden" name="<%=linea2%>" value="<%= mr.getField(linea2).getString()%>">
<input type="hidden" name="<%=linea3%>" value="<%= mr.getField(linea3).getString()%>">
<input type="hidden" name="<%=linea4%>" value="<%= mr.getField(linea4).getString()%>">
<input type="hidden" name="<%=codigoCorreo%>" value="<%= mr.getField(codigoCorreo).getString()%>">

<div id="IDCOL<%=i%>" style="position:relative; display:none;">
<% if( basicData){ %>
	<h4><%=title%></h4>
<% } %>   
   <table class="tableinfo" width="100%" >
    	<tr > 
        	<td nowrap >
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">

          			<tr id="<%=color1%>"> 
            			<td nowrap align="right">País : </td>
            			<td nowrap > 
            				<input type="text" name="CCTRCOD<%=i%>" size="5" maxlength="4" value="<%= mr.getField(pais).getString()%>" readonly
            				<%=(basicData && mr.getField(paisF).getString().equals("Y"))?"id=\"txtchanged\"":"" %>
                 			onChange="chgPais<%=i%>(this.value)" onBlur="chgPais<%=i%>(this.value)" >
            				<% if ( !readOnly ) {%>
								<a href="javascript:GetCodeDescCNOFC('CCTRCOD<%=i%>','CCTR<%=i%>','03')">
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
								</a>
								<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">	
              				<% } %>
              				<input type="text" name="CCTR<%=i%>" size="20" value="<%= mr.getField(paisDsc).getString()%>" readonly >
              				
            			</td>
            			<td nowrap align="right">Cód. de Correo : </td>
		       			<td nowrap >
            				<input type="text" name="CZPC<%=i%>"  size="16" maxlength="15" value="<%= mr.getField(codigoCorreo).getString()%>" <%=READ %>  
              				<%= (basicData && mr.getField(codigoCorreoF).getString().equals("Y"))?"id=\"txtchanged\"":"" %> 
              				onChange="chgData<%=i%>(1)" onBlur="chgData<%=i%>(1)"> 
            			</td>
           			</tr>
          			<tr id="<%=color2%>"> 
            			<td nowrap align="right">Departamento : </td>
            			<td nowrap > 
              				<input type="text" name="CSTE<%=i%>"  size="3" maxlength="2" value="<%= mr.getField(departamento).getString()%>" <%=READ %> >
              				<input type="text" name="CDSTE<%=i%>"  size="37" maxlength="35" value="<%= mr.getField(departamentoDsc).getString()%>" readonly 
              				<%=(basicData && mr.getField(departamentoF).getString().equals("Y"))?"id=\"txtchanged\"":"" %>
              				onChange="chgDpto<%=i%>(1)" onBlur="chgDpto<%=i%>(1)">
              				<% if ( !readOnly ) { %>
              					<a href="javascript:Get2FilterCodes('CSTE<%=i%>','CDSTE<%=i%>','27', '',document.forms[0]['CCTRCOD<%=i%>'].value)" >
								<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" style="cursor:hand" >
	              				</a>
	              				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">	
              				<% } %>
            			</td>
            			<td nowrap align="right">Ciudad : </td>
            			<td nowrap >
              				<input type="text" name="CCTYCOD<%=i%>" size="4" maxlength="3" value="<%= mr.getField(ciudad).getString()%>" <%=READ %> >
              				<input type="text" name="CCTY<%=i%>" size="36" maxlength="35" value="<%= mr.getField(ciudadDsc).getString()%>" readonly
              				<% if(basicData){ out.print((mr.getField(ciudadF).getString().equals("Y"))?"id=\"txtchanged\"":"");} %>
              				onChange="chgData<%=i%>(1)" onBlur="chgData<%=i%>(1)" >
              				<% if ( !readOnly ) { %>
              					<a href="javascript:Get2FilterCodes('CCTYCOD<%=i%>','CCTY<%=i%>','84', '',document.forms[0]['CSTE<%=i%>'].value)" >
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
	          					</a>
	          				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >	
              				<% } %>
            			</td>
           			</tr>
					<tr id="<%=color1%>">
            			<td nowrap align="right">Nomenclatura : </td>
            			<td nowrap> 
              				<input type="text" name="CNA2<%=i%>"  size="46" maxlength="45" value="<%=mr.getField(linea2).getString()%>" readonly  
              				<% if(basicData){ out.print((mr.getField(linea2F).getString().equals("Y"))?"id=\"txtchanged\"":""); } %>
              				onChange="chgData<%=i%>(1)" onBlur="chgData<%=i%>(1)">
              				<% if( !readOnly){ %>
              					<a href="javascript:GetNomenclatura('CNA2<%=i%>')" >
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
              					<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
	          					</a>
              				<% } %>
            			</td>
            			<td nowrap align="right"></td>
            			<td nowrap > 
            			</td>
           			</tr>
           			<tr id="<%=color2%>">
            			<td nowrap align="right">Complemento 1 : </td>
            			<td nowrap> 
              				<input type="text" name="CNA3<%=i%>"  size="46" maxlength="45" value="<%=mr.getField(linea3).getString()%>" readonly 
              				<% if(basicData){ out.print((mr.getField(linea3F).getString().equals("Y"))?"id=\"txtchanged\"":""); } %>
              				onChange="chgData<%=i%>(1)" onBlur="chgData<%=i%>(1)">
              				<% if( !readOnly){ %>
              					<a href="javascript:GetComplemento('CNA3<%=i%>')" >
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
	          					</a>
              				<% } %>
            			</td>
            			<td nowrap align="right">Complemento 2 : </td>
            			<td nowrap >
            				<input type="text" name="CNA4<%=i%>"  size="46" maxlength="45" value="<%=mr.getField(linea4).getString()%>" readonly 
              				<% if(basicData){ out.print((mr.getField(linea4F).getString().equals("Y"))?"id=\"txtchanged\"":""); } %>
              				onChange="chgData<%=i%>(1)" onBlur="chgData<%=i%>(1)">
              				<% if( !readOnly){ %>
              					<a href="javascript:GetComplemento('CNA4<%=i%>')" >
              					<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
	          					</a>
              				<% } %> 
            			</td>
            		</tr>
			</table>
		</td>
	</tr>
</table>

</div>    

<%-- Inicio del bloque de direccion diferente de Colombia --%> 
<div id="IDOTHER<%=i%>" style="position:relative; display:none;">
<% if( basicData){ %>
	<h4><%=title%></h4>
<% } %>
   
   <table class="tableinfo" width="100%" >
    	<tr > 
        	<td nowrap >
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">

			<tr id="<%=color1%>"> 
              <td nowrap align="right">País : </td>
              <td nowrap>  
                <input type="text" name="OCTRCOD<%=i%>" size="5" maxlength="4" value="<%= mr.getField(pais).getString()%>" readonly
                	<%=(basicData && mr.getField(paisF).getString().equals("Y"))?"id=\"txtchanged\"":"" %>
                 onChange="chgPais<%=i%>(this.value)" onBlur="chgPais<%=i%>(this.value)" >
                <% if( !readOnly ){ %>
              	<a href="javascript:GetCodeDescCNOFC('OCTRCOD<%=i%>','OCTR<%=i%>','03')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom"> 
              	<% } %>
                <input type="text" name="OCTR<%=i%>" size="21" value="<%= mr.getField(paisDsc).getString()%>" readonly >
              
              </td>
            </tr>
            <tr id="<%=color2%>"> 
              <td nowrap align="right">Ciudad : </td>
              <td nowrap>  
              	<input type="text" name="OCTY<%=i%>" size="36" maxlength="35" value="<%= mr.getField(ciudadDsc).getString()%>" <%=READ %>
              				<% if(basicData){ out.print((mr.getField(ciudadF).getString().equals("Y"))?"id=\"txtchanged\"":"");} %>
              				onChange="chgData<%=i%>(2)" onBlur="chgData<%=i%>(2)">
                <% if( !readOnly ){ %>
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" >
                <% } %>
              </td>
            </tr>
            <tr id="<%=color1%>"> 
              <td nowrap align="right">Dirección Principal : </td>
              <td nowrap>  
   				<input type="text" name="ONA2<%=i%>"  size="46" maxlength="45" value="<%=mr.getField(linea2).getString()%>" <%=READ%> 
       				<% if(basicData){ out.print((mr.getField(linea2F).getString().equals("Y"))?"id=\"txtchanged\"":""); } %>
       				onChange="chgData<%=i%>(2)" onBlur="chgData<%=i%>(2)">
                <% if( !readOnly){ %>
                	<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" > 
                <% } %>
			  </td>
            </tr>
            <tr id="<%=color2%>"> 
              <td nowrap align="right"></td>
              <td nowrap>  
   				<input type="text" name="ONA3<%=i%>"  size="46" maxlength="45" value="<%=mr.getField(linea3).getString()%>" <%=READ%> 
       				<% if(basicData){ out.print((mr.getField(linea3F).getString().equals("Y"))?"id=\"txtchanged\"":""); } %> 
       				onChange="chgData<%=i%>(2)" onBlur="chgData<%=i%>(2)">
			  </td>
            </tr>
            <tr id="<%=color1%>"> 
              <td nowrap align="right"></td>
              <td nowrap>  
   				<input type="text" name="ONA4<%=i%>"  size="46" maxlength="45" value="<%=mr.getField(linea4).getString()%>" <%=READ%> 
       				<% if(basicData){ out.print((mr.getField(linea4F).getString().equals("Y"))?"id=\"txtchanged\"":""); } %>
       				onChange="chgData<%=i%>(2)" onBlur="chgData<%=i%>(2)">
			  </td>
            </tr>
   			<tr id="<%=color2%>">
       			<td nowrap align="right">Código de Correo : </td>
       			<td nowrap > 
       				<input type="text" name="OZPC<%=i%>"  size="16" maxlength="15" value="<%= mr.getField(codigoCorreo).getString()%>" <%=READ %> 
           				<%= (basicData && mr.getField(codigoCorreoF).getString().equals("Y"))?"id=\"txtchanged\"":"" %> 
           				onChange="chgData<%=i%>(2)" onBlur="chgData<%=i%>(2)">
       			</td>
   			</tr>
		</table>
	</td>
  </tr>
</table>

</div>

<SCRIPT Language="Javascript">

<% 	if (mr.getField(pais).getString().trim().equals("CO")) {  %>
		IDCOL<%=i%>.style.display='block' ;
		IDOTHER<%=i%>.style.display='none';
		chgData<%=i%>(1);
<% } else { %>
		IDCOL<%=i%>.style.display='none' ;
		IDOTHER<%=i%>.style.display='block';
		chgData<%=i%>(2);
<% } %>	   
autojump('CCTYCOD<%=i%>', 'CNA2<%=i%>', 3);
  //
  </SCRIPT>