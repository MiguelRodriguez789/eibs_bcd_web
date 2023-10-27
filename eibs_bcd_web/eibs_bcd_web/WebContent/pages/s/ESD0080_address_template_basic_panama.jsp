<%@ page import="datapro.eibs.sockets.*, datapro.eibs.beans.*" %>

<%

  datapro.eibs.sockets.MessageRecord mr;
 
  String READ_ONLY_TAG="";
  String color1="trdark";
  String color2="trclear";
 
  // PARAMETROS
  String suffix, suffixDsc, suffixMod ;
  String addressType = "S";
  String messageName;
  String title="";
  String index = "0" ;
  boolean readOnly=false ;  
  boolean basicData=false ; 
  boolean simple=true; 
  boolean countryHelp = false ;
  boolean showWeb = false;
  boolean showEmail = false;
  boolean isDomesticAddress = false;
  
  //The boolean isDomesticAddress  Hides All the Ayudas  
  //if the Template IBS Code is not the same as the Banks
  //this request variable is set from DataAdress.class at the time it decides which template to send
  //If not domestic, JS function sets readonly prop = false; function called at end of table
    if( null != session.getAttribute("isDomesticAddress")){
		isDomesticAddress = Boolean.valueOf(session.getAttribute("isDomesticAddress").toString()).booleanValue() ;
  }
  
  
  //esta variable se usa para saber si se consultan los datos basicos y asi construir 
  //dinamicamente los nombres de los campos, ya que el template es el mismo para 
  // las direcciones de clientes personales, corporativos , beneficiarios y representantes legales
  // asi como para la consulta de aprobación.
  // Ver mas abajo donde se arman los nombres de los campos.
  if( request.getParameter("basic") != null ){
		basicData = 
		  	Boolean.valueOf(request.getParameter("basic").toString()).booleanValue() ;
  }
  if( request.getParameter("simple") != null ){
		simple = 
		  	Boolean.valueOf(request.getParameter("simple").toString()).booleanValue() ;
  }
  
   if(request.getParameter("showWeb") != null){
	   showWeb = Boolean.parseBoolean( request.getParameter("showWeb").toString() ) ;
   } else if(basicData && !simple){
   	   showWeb = true;	
   }
   
   if(request.getParameter("showEmail") != null){
	   showEmail= Boolean.parseBoolean( request.getParameter("showEmail").toString() ) ;
   } else if(basicData && !simple){
   	   showEmail = true;	
   }  
  
   
   //Obtiene el titulo del segmento de direccion
   if (request.getParameter("title") != null)
     title = request.getParameter("title");
   
   // Determina si es solo lectura
   if (request.getParameter("readOnly") != null ){
     readOnly=Boolean.valueOf( request.getParameter("readOnly").toString() ).
     					booleanValue() ;
     READ_ONLY_TAG=readOnly?"readonly":"";
   }
   
   // Obtiene el mensaje a desplegar
   messageName = request.getParameter("messageName");
   mr= (datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);      
   
   if (request.getParameter("suffix") != null){
   		suffix = request.getParameter("suffix") ;
   }else{
   		suffix = "E01CUM" ;
   }
   suffixDsc = "D" + suffix.substring(1) ;
   suffixMod = "F" + suffix.substring(1) ;

   	//Obtiene el color de la primera fila
	int row = 0;
	if(request.getParameter("firstColor") != null){
		row = request.getParameter("firstColor").equals("trclear") ? 0 : 1;
	}
	
   //Flag para activar la ayuda de paises
   if(request.getParameter("countryHelp") != null){
	   countryHelp= Boolean.parseBoolean( request.getParameter("countryHelp").toString() ) ;
   }	
   
  // NOMBRES DE CAMPOS
	String calle = suffix + "MA2";
	String residencial_Edificio = suffix + "MA3" ;
	String noCasa_Apto = suffix + "NR1";
	String distrito = suffix + "PAR" ;
	String distritoDsc = suffix + "PAD" ;
	String corregimiento = suffix + "COM" ;
	String corregimientoDsc = suffix + "COD" ;
	String paisCode = suffix+"ADC";
	String pais = suffix + "CTR" ;
	String provincia = suffix + "STE" ;
	String provinciaDsc = suffix + "STD";
	String apartadoPostal = suffix + "POB" ;
	String codigoPostal = suffix + "ZPC" ;
	String codigoPostalDsc = suffixDsc + "ZPC";
	String eMail = suffix + "IAD" ;
 	String paginaWeb = suffix + "WEB" ;

	// Flag Modificacion para consulta de aprobacion  
	String calleF = suffixMod + "MA2";
	String residencial_EdificioF = suffixMod + "MA3";
	String noCasa_AptoF = suffixMod + "NR1";
	String distritoF = suffixMod + "PAR";
	String corregimientoF = suffixMod + "COM";
	String provinciaF = suffixMod + "STE";
	String paisF = suffixMod + "CTR" ;
	String apartadoPostalF = suffixMod + "POB" ;
	String codigoPostalF = suffixMod + "ZPC" ;
	String eMailF = suffixMod + "IAD" ;
 	String paginaWebF = suffixMod + "WEB" ;
  
  	String pPaisCode = request.getParameter("country")!=null && !request.getParameter("country").trim().equals("") 
			?request.getParameter("country")
			:mr.getField(paisCode).getString() ; 
			
	String pPaisDesc = request.getParameter("dCountry")!=null && !request.getParameter("dCountry").trim().equals("")
			?request.getParameter("dCountry")
			:mr.getField(pais).getString() ;
%>

    
<%-- Inicio del bloque de direccion --%> 
<% if(title != null && !"".equals(title)){ %>
  <h4><%=title%></h4>
<% } %>
<% if(!simple){ %>
<div id="address<%= index %>" style="display:block;">
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
<% } %>
          			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            			<td nowrap ><div align="right">Pa&iacute;s :</div></td>
            			<td nowrap > 
            				<input type="text" maxlength="4" size="5" name="<%= paisCode.equals("") ? "" : paisCode %>" id="<%= paisCode.equals("") ? "" : paisCode %>" <%=READ_ONLY_TAG%>  value="<%= pPaisCode%>">
              				<% if ( !readOnly && countryHelp) {%>
								<a href="javascript:GetCodeDescCNOFC('<%= paisCode %>','<%=pais%>','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
              				<% } %>
              				<input type="text" name="<%=pais%>" id="<%=pais%>" size="55" maxlength="45" value="<%= pPaisDesc %>" readonly <%=(basicData && mr.getField(paisF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
              				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom"	border="0"> 
            			</td>
           			</tr>
          			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            			<td nowrap  ><div align="right">Calle :</div></td>
            			<td nowrap  > 
              				<input type="text" name="<%=calle%>" id="<%=calle%>" size="55" maxlength="45" value="<%=mr.getField(calle).getString()%>" <%=READ_ONLY_TAG%> 
              				<% if(basicData){ out.print((mr.getField(calleF).getString().equals("Y"))?"class=\"txtchanged\"":""); } %> >
              				<% if ( !readOnly ) { %>
	          				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0"  >
	          				<% } %>
            			</td>
           			</tr>
           			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            			<td nowrap ><div align="right">Residencial/Edificio :</div></td>
            			<td nowrap > 
              				<input type="text" name="<%=residencial_Edificio%>" id="<%=residencial_Edificio%>" size="55" maxlength="45" value="<%= mr.getField(residencial_Edificio).getString()%>" <%=READ_ONLY_TAG%> 
              				<%if(basicData){ out.print((mr.getField(residencial_EdificioF).getString().equals("Y"))?"class=\"txtchanged\"":"");} %> >
	          				<% if ( !readOnly ) { %>
	          				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0"  >
	          				<% } %>
            			</td>
          			</tr>
          			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            			<td nowrap ><div align="right">No. Casa/Apto :</div></td>
            			<td nowrap > 
              				<input type="text" name="<%=noCasa_Apto%>" id="<%=noCasa_Apto%>"  size="15" maxlength="10" value="<%= mr.getField(noCasa_Apto).getString()%>" <%=READ_ONLY_TAG%> 
              				<% if(basicData){ out.print((mr.getField(noCasa_AptoF).getString().equals("Y"))?"class=\"txtchanged\"":"");} %> >
	          				<% if ( !readOnly ) { %>
	          				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0"  >
	          				<% } %>
            			</td>
           			</tr>
           			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            			<td nowrap ><div align="right">Provincia :</div></td>
            			<td nowrap > 
              				<input type="hidden" name="<%=provincia%>" id="<%=provincia%>" size="6" maxlength="4" value="<%= mr.getField(provincia).getString()%>" <%=READ_ONLY_TAG %>  class="direccion">
              				<input type="text" name="<%=provinciaDsc%>" id="<%=provinciaDsc%>" size="55" maxlength="45" value="<%= mr.getField(provinciaDsc).getString()%>" readonly class="direccion"
              				<% if(basicData){ out.print((mr.getField(provinciaF).getString().equals("Y"))?"class=\"txtchanged\"":"");} %> >
              				<% if ( !readOnly ) { 
              					if(isDomesticAddress){
              				%>
              						<A href="javascript:GetCodeDescCNOFC('<%=provincia%>','<%=provinciaDsc%>','PV')" >
              							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
	          						</A>
	          				    <% } %>	
	          					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >
              				<% } %>
            			</td>
          			</tr>
          			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            			<td nowrap ><div align="right">Distrito :</div></td>
            			<td nowrap > 
              				<input type="hidden" name="<%=distrito%>" id="<%=distrito%>" size="6" maxlength="4" value="<%= mr.getField(distrito).getString()%>" <%=READ_ONLY_TAG %>  class="direccion">
              				<input type="text" name="<%=distritoDsc%>" id="<%=distritoDsc%>" size="55" maxlength="45" value="<%= mr.getField(distritoDsc).getString()%>" readonly class="direccion"
              				<%=(basicData && mr.getField(distritoF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
              				<% if ( !readOnly ) {
              					if(isDomesticAddress){
              				 %>
	              					<a href="javascript:Get2FilterCodes('<%=distrito%>','<%=distritoDsc%>','PI', document.getElementById('<%=provincia%>').value,' ')" >
										<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
		              				</a>
		    					<% } %>
	              				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
              				<% } %>
            			</td>
           			</tr>
           			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            			<td nowrap ><div align="right">Corregimiento :</div></td>
            			<td nowrap > 
              				<input type="hidden" name="<%=corregimiento%>" id="<%=corregimiento%>" size="6" maxlength="4" value="<%= mr.getField(corregimiento).getString()%>" <%=READ_ONLY_TAG %>  class="direccion">
              				<input type="text" name="<%=corregimientoDsc%>" id="<%=corregimientoDsc%>" size="55" maxlength="45" value="<%= mr.getField(corregimientoDsc).getString()%>" readonly class="direccion"
              				<%= (basicData && mr.getField(corregimientoF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
              				<% if ( !readOnly ) {
              					if(isDomesticAddress){
              				%>
	              					<a href="javascript:Get2FilterCodes('<%=corregimiento%>','<%=corregimientoDsc%>','PE',document.getElementById('<%=provincia%>').value,document.getElementById('<%=distrito%>').value)" >
										<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
		          					</a>
	          					<% } %>
	          					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >
              				<% } %>
            			</td>
          			</tr>
          			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            			<td nowrap ><div align="right">C&oacute;digo Postal :</div></td>
            			<td nowrap > 
              				<input type="text" name="<%=codigoPostal%>" id="<%=codigoPostal%>"  size="12" maxlength="10" value="<%= mr.getField(codigoPostal).getString()%>" readonly="readonly" class="direccion"
              					<%= (basicData && mr.getField(codigoPostalF).getString().equals("Y"))?"class=\"txtchanged\"":"" %>	 >
<%--               				<input type="text" name="<%=codigoPostalDsc%>" id="<%=codigoPostalDsc%>" size="18" maxlength="15" value='<%= (mr.getField(codigoPostal) != null && !mr.getField(codigoPostal).getString().equals("") && mr.getField(codigoPostal).getString().length() > 5 ) ? mr.getField(codigoPostal).getString().substring(4) : "" %>' readonly  
               				<%= (basicData && mr.getField(codigoPostalF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> > --%>
              				<% if ( !readOnly ) {
              					if(isDomesticAddress){
              				%>
	              					<a href="javascript:Get2FilterCodes('<%=codigoPostal%>','<%=codigoPostalDsc%>' ,'59', document.getElementById('<%=provincia%>').value,' ')">
										<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
		          					</a>
	          					<% } %>
              				<% } %>
            			</td>
           			</tr>
           			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            			<td nowrap ><div align="right">Apartado Postal :</div></td>
            			<td nowrap > 
              				<input type="text" name="<%=apartadoPostal%>" id="<%=apartadoPostal%>" size="11" maxlength="10" value="<%= mr.getField(apartadoPostal).getString()%>" <%=READ_ONLY_TAG %>  class="direccion"
              				<%=(basicData && mr.getField(apartadoPostalF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
            			</td>
          			</tr>
          			<tr class="<%= showEmail ?  (row % 2 == 1) ? "trdark" : "trclear" : "" %><% if(showEmail) row++;%>" style="display : <%= showEmail ? "table-row" : "none"%>" >
            			<td nowrap ><div align="right">Direcci&oacute;n E-Mail :</div></td>
            			<td nowrap > 
	              			<div align="left">	
              				<input type="text" name="<%=eMail%>" id="<%=eMail%>" size="62" maxlength="60" value="<%= mr.getField(eMail).getString()%>" <%=READ_ONLY_TAG %>  class="direccion"
              					style="text-transform: none" <%=(basicData && mr.getField(eMailF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
							</div>
            			</td>
          			</tr>
          			<tr class="<%= showWeb ? (row % 2 == 1) ? "trdark" : "trclear" :"" %><% if(showWeb) row++;%>" style="display :<%= showWeb ? "table-row" : "none"%>"  >
            			<td nowrap ><div align="right">P&aacute;gina Web :</div></td>
            			<td nowrap > 
	              			<div align="left">	
              				<input type="text" name="<%=paginaWeb%>" id="<%=paginaWeb%>" size="62" maxlength="60" value="<%= mr.getField(paginaWeb).getString()%>" <%=READ_ONLY_TAG %>  class="direccion"
              					style="text-transform: none" <%=(basicData && mr.getField(paginaWebF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
							</div>
            			</td>
          			</tr>
          			<%if(!isDomesticAddress && !readOnly){%>
          				<script type="text/javascript">
	     					$('input.direccion').prop('readonly',false);
          				</script>
          			<% } %>
<% if(!simple){ %>
          </table>
        </td>
      </tr>
    </table>
</div>
<% } %>
    
    
