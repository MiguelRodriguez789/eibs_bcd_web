<%@ page import="datapro.eibs.sockets.*, datapro.eibs.beans.*" %>
<%!

  String color1="trdark";
  String color2="trclear";
  
  //Indice para identificar los colores de las filas
  int iColor = 0 ;
  
  public String getRowColor( ){
		return (iColor++ % 2) == 0 ? color1 : color2 ;
  }  

%>


<%
  iColor = 0 ;

  MessageRecord mr;
 
  String READ_ONLY_TAG="";
 
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
   if (request.getParameter("title") != null){
     title = request.getParameter("title");
   }
   // Determina si es solo lectura
   if (request.getParameter("readOnly") != null ){
     readOnly=Boolean.valueOf( request.getParameter("readOnly").toString() ).booleanValue() ;
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
   if(request.getParameter("firstColor")!= null){
      color1=request.getParameter("firstColor");
      if (color1.equals("trclear")) color2="trdark";
   }
   

   //Flag para activar la ayuda de paises
   if(request.getParameter("countryHelp") != null){
	   countryHelp= Boolean.parseBoolean( request.getParameter("countryHelp").toString() ) ;
   }
   
   // NOMBRES DE CAMPOS
 	String pais = suffix + "CTR" ;
 	String paisCode = suffix + "ADC" ;
 	String calle = suffix + "MA2";
 	String numeroExterior = suffix + "NR1";
 	String numeroInterior = suffix + "NR2" ;
 	String codigoPostal = suffix + "ZPC" ;
 	String colonia = suffix + "PAR" ;
 	String coloniaDsc = suffix + "PAD" ;
 	String municipio = suffix + "MUN" ;
 	String municipioDsc = suffix + "MUD";
 	String ciudad = suffix + "CTC";
 	String ciudadDsc = suffix + "CTY";
 	String estado = suffix + "STE" ;
 	String estadoDsc = suffix + "STD";
 	String eMail = suffix + "IAD" ;
 	String paginaWeb = suffix + "WEB" ;

 	
 	// Flag Modificacion para consulta de aprobacion
 	String paisF = suffixMod + "ADC" ;
 	String calleF = suffixMod + "MA2"  ;
 	String numeroExteriorF = suffixMod + "NR1" ;
 	String numeroInteriorF = suffixMod + "NR2" ;
 	String codigoPostalF = suffixMod + "ZPC" ;
 	String coloniaF = suffixMod + "PAR" ;
 	String municipioF = suffixMod + "MUN" ;
 	String municipioDscF = suffixMod + "MUD";
 	String ciudadF = suffixMod + "CTC";
 	String ciudadDscF = suffixMod + "CTY";
 	String estadoF = suffixMod + "STE" ;
 	String estadoDscF = suffixMod + "STD";
 	String eMailF = suffixMod + "IAD" ;
 	String paginaWebF = suffixMod + "WEB" ;
	
	
	String valuePaisCode = request.getParameter("country")!=null && !request.getParameter("country").trim().equals("") 
			?request.getParameter("country")
			:mr.getField(paisCode).getString() ; 
			
	String valuePaisDesc = request.getParameter("dCountry")!=null && !request.getParameter("dCountry").trim().equals("")
			?request.getParameter("dCountry")
			:mr.getField(pais).getString() ;


%>


    
<%-- Inicio del bloque de direccion --%> 
<% if(title != null && !"".equals(title)){ %>
  <h4><%=title%></h4>
<% } %>
<% if(!simple){ %>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table  cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="fixed2col">
<% } %>


          			<tr id="<%=getRowColor()%>" > 
            			<td nowrap ><div align="right">Pa&iacute;s :</div></td>
            			<td nowrap > 
	              			<div align="left">	
            				<input type="text" size="6" maxlength="4" name="<%= paisCode.equals("") ? "" : paisCode %>" id="<%= paisCode.equals("") ? "" : paisCode %>" value="<%=valuePaisCode%>" readonly="readonly" >   
              				<% if ( countryHelp ) {%>
								<a href="javascript:GetCodeDescCNOFC('<%= paisCode %>','<%=pais%>','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
              				<% } %>
               				<input type="text" name="<%=pais%>" id="<%=pais%>" size="55" maxlength="45" value="<%=valuePaisDesc%>" readonly="readonly"  >
              				<% if ( !readOnly ) {%>
								<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom"	border="0"> 
							<% } %>	
							</div>
            			</td>
           			</tr>
          			<tr id="<%=getRowColor()%>"  >
            			<td nowrap  ><div align="right">Calle :</div></td>
            			<td nowrap  > 
	              			<div align="left">	
              				<input type="text" name="<%=calle%>" id="<%=calle%>" size="55" maxlength="45" value="<%=mr.getField(calle).getString()%>" <%=READ_ONLY_TAG%> 
              				<% if(basicData){ out.print((mr.getField(calleF).getString().equals("Y"))?"class=\"txtchanged\"":""); } %> >
              				<% if ( !readOnly ) { %>
	          				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0"  >
	          				<% } %>
							</div>
            			</td>
           			</tr>
          			<tr id="<%=getRowColor()%>"  >
            			<td nowrap  ><div align="right">N&uacute;mero Exterior :</div></td>
            			<td nowrap  > 
	              			<div align="left">	
              				<input type="text" name="<%=numeroExterior%>" id="<%=numeroExterior%>" size="15" maxlength="10" value="<%=mr.getField(numeroExterior).getString()%>" <%=READ_ONLY_TAG%> 
              				<% if(basicData){ out.print((mr.getField(numeroExteriorF).getString().equals("Y"))?"class=\"txtchanged\"":""); } %> >
              				<% if ( !readOnly ) { %>
	          				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" border="0"  >
	          				<% } %>
							</div>
            			</td>
           			</tr>
          			<tr id="<%=getRowColor()%>"  >
            			<td nowrap  ><div align="right">N&uacute;mero Interior :</div></td>
            			<td nowrap  >
	              			<div align="left">	
              				<input type="text" name="<%=numeroInterior%>" id="<%=numeroInterior%>" size="15" maxlength="10" value="<%=mr.getField(numeroInterior).getString()%>" <%=READ_ONLY_TAG%> 
              				<% if(basicData){ out.print((mr.getField(numeroInteriorF).getString().equals("Y"))?"class=\"txtchanged\"":""); } %> >
							</div>
            			</td>
           			</tr>
          			<tr id="<%=getRowColor()%>"  >
            			<td nowrap ><div align="right">C&oacute;digo Postal :</div></td>
            			<td nowrap > 
	              			<div align="left">	
              				<%--  <input type="hidden" name="<%=codigoPostal%>" id="<%=codigoPostal%>"  size="15" maxlength="10" value='<%= (mr.getField(codigoPostal) != null && !mr.getField(codigoPostal).getString().equals("") && mr.getField(codigoPostal).getString().length() > 4 ) ? mr.getField(codigoPostal).getString().substring(0,4) : "" %>' <%=READ_ONLY_TAG %>  class="direccion"> --%>
              				<input type="text" name="<%=codigoPostal%>" id="<%=codigoPostal%>" size="15" maxlength="10" value='<%= mr.getField(codigoPostal).getString() %>' readonly="readonly" class="direccion"   
              				<%= (basicData && mr.getField(codigoPostalF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
              				<% if ( !readOnly ) {
								if(isDomesticAddress){
              				%>
	              					<a href="javascript:GetSEPOMEXData('<%=codigoPostal%>', '<%=coloniaDsc%>', '<%=municipioDsc%>', '<%=ciudadDsc%>', '<%=estadoDsc%>')" > 
										<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" >
		          					</a>
		          				<% } %>	
              					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom"	border="0">
              				<% } %>
							</div>
            			</td>
           			</tr>
          			<tr id="<%=getRowColor()%>"  >
            			<td nowrap  ><div align="right">Colonia :</div></td>
            			<td nowrap  > 
	              			<div align="left">	
              				<%-- <input type="hidden" name="<%=colonia%>" id="<%=colonia%>" size="15" maxlength="10" value="<%=mr.getField(colonia).getString()%>" <%=READ_ONLY_TAG%> >  --%>
              				<input type="text" name="<%=coloniaDsc%>" id="<%=coloniaDsc%>" size="55" maxlength="45" value="<%=mr.getField(coloniaDsc).getString()%>" readonly="readonly" class="direccion"  
              				<% if(basicData){ out.print((mr.getField(coloniaF).getString().equals("Y"))?"class=\"txtchanged\"":""); } %> >
 							</div>
            			</td>
           			</tr>
          			<tr id="<%=getRowColor()%>"  >
            			<td nowrap  ><div align="right">Municipio/Delegaci&oacute;n :</div></td>
            			<td nowrap  > 
	              			<div align="left">	
              				<%-- <input type="hidden" name="<%=municipio%>" id="<%=municipio%>" size="15" maxlength="10" value="<%=mr.getField(municipio).getString()%>" <%=READ_ONLY_TAG%> >  --%>
              				<input type="text" name="<%=municipioDsc%>" id="<%=municipioDsc%>" size="55" maxlength="45" value="<%=mr.getField(municipioDsc).getString()%>" readonly="readonly" class="direccion" 
              				<% if(basicData){ out.print((mr.getField(municipioF).getString().equals("Y"))?"class=\"txtchanged\"":""); } %> >
							</div>
            			</td>
           			</tr>
          			<tr id="<%=getRowColor()%>"  >
            			<td nowrap  ><div align="right">Ciudad :</div></td>
            			<td nowrap  >
	              			<div align="left">	
              				<%-- <input type="hidden" name="<%=ciudad%>" id="<%=ciudad%>" size="15" maxlength="10" value="<%=mr.getField(ciudad).getString()%>" <%=READ_ONLY_TAG%> >  --%> 
              				<input type="text" name="<%=ciudadDsc%>" id="<%=ciudadDsc%>" size="55" maxlength="45" value="<%=mr.getField(ciudadDsc).getString()%>" readonly="readonly" class="direccion"  
              				<% if(basicData){ out.print((mr.getField(municipioF).getString().equals("Y"))?"class=\"txtchanged\"":""); } %> >
							</div>
            			</td>
           			</tr>
          			<tr id="<%=getRowColor()%>"  >
            			<td nowrap  ><div align="right">Estado :</div></td>
            			<td nowrap  > 
            		 		<%-- <input type="hidden" name="<%=estado%>" id="<%=estado%>" size="15" maxlength="10" value="<%=mr.getField(estado).getString()%>" <%=READ_ONLY_TAG%> >  --%> 
              				<input type="text" name="<%=estadoDsc%>" id="<%=estadoDsc%>" size="55" maxlength="45" value="<%=mr.getField(estadoDsc).getString()%>" readonly="readonly" class="direccion" 
              				<% if(basicData){ out.print((mr.getField(municipioF).getString().equals("Y"))?"class=\"txtchanged\"":""); } %> >
            			</td>
           			</tr>
			         <tr class="<%=showEmail ?getRowColor() :""%>"  style="display : <%= showEmail ? "table-row" : "none"%>" >
			         	<td nowrap ><div align="right">Direcci&oacute;n E-Mail :</div></td>
			         	<td nowrap > 
				     		<div align="left">	
			         			<input type="text" name="<%=eMail%>" id="<%=eMail%>" size="62" maxlength="60" value="<%= mr.getField(eMail).getString()%>" <%=READ_ONLY_TAG %>  class="direccion"
			         				style="text-transform: none" <%=(basicData && mr.getField(eMailF).getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
							</div>
			            </td>
			         </tr>
			         <tr class="<%= showWeb ? getRowColor() : ""%>" style="display :<%= showWeb ? "table-row" : "none"%>"  >
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
			    	<%  } %>
<% if(!simple){ %>
          </table>
        </td>
      </tr>
    </table>
<% } %>
    
