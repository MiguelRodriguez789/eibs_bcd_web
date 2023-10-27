<%@ page import="datapro.eibs.sockets.*, datapro.eibs.beans.*" %>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<%
   // Obtiene el mensaje a desplegar
	String messageName = request.getParameter("messageName");
	datapro.eibs.sockets.MessageRecord mr = 
		(datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);
		
   //Obtiene el titulo del segmento de direccion
	String title = request.getParameter("title");
   
   boolean simple=true;
   	if( request.getParameter("simple") != null ){
		simple = 
		  	Boolean.valueOf(request.getParameter("simple").toString()).booleanValue() ;
	}
	boolean basicData=true;
	if(request.getParameter("basic") != null){
		basicData = 
		  	Boolean.valueOf(request.getParameter("basic").toString()).booleanValue() ;
	}
	// Determina si es solo lectura
	String READ_ONLY_TAG=""; 
	boolean readOnly=false;
	if (request.getParameter("readOnly") != null )
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
			READ_ONLY_TAG="readonly";
		} else {
			readOnly=false;
			READ_ONLY_TAG="";
		}
	else READ_ONLY_TAG="";
	
	//Flag de aprobación
	boolean approval = false;
	if(request.getParameter("approval") != null){
		approval = Boolean.valueOf(
			request.getParameter("approval").toString()).booleanValue();
	}
	
	//Obtiene el color de la primera fila
	int row = 0;
	if("trdark".equals(request.getParameter("firstColor"))){
		row=1;
	}

   // Obtiene el sufijo de los campos dependiendo del tipo de mensaje a desplegar.
   // Por ejemplo, si el mensaje es del tipo ESD008001, el sufijo enviado es E01, si el tipo es ESD008002 
   // el sufijo enviado ed E02
	String suffix = "01" ;
	if( request.getParameter("index") != null ){
		suffix = request.getParameter("index");
	} else if( request.getParameter("suffix") != null ){
		suffix = request.getParameter("suffix");
	}

%>

<%-- Inicio del bloque de direccion --%> 
<% if(title != null && !"".equals(title)){ %>
  <h4><%=title%></h4>
<% } %>
<% if(!simple){ %>
<div id="address" style="display:block;">
  <table class="tableinfo">
      <tr > 
        <td nowrap="nowrap"> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
<% } %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">Pa&iacute;s de la Direcci&oacute;n :</div>
              </td>
              <td nowrap="nowrap" width="61%">  
			  	<input type="hidden" name="<%= "E" + suffix %>ADC" id="<%= "E" + suffix %>ADC" value="<%= DataAddress.getTemplateCountry(request, mr.getField("E" + suffix +  "ADC").getString().trim()) %>"
			  		onchange="javascript:addressCountryChanged('01', this)"/>
                <input type="text" name="<%= "E" + suffix %>CTR" id="<%= "E" + suffix %>CTR" size="45" maxlength="35" value="<%= mr.getField("E" + suffix +  "CTR").getString().trim()%>" readonly="readonly"
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "CTR").getString().equals("Y") ? "class=\"txtchanged\"" : "class=\"input_cnofc_desc\"");} %>
              	/>
              <% if( !readOnly ){ %>
              	<A href="javascript:GetCodeDescCNOFC('<%= "E" + suffix %>ADC','<%= "E" + suffix %>CTR','03')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand"/></A>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom"/> 
              <% } %>
            </td>
            </tr>
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">Direcci&oacute;n Principal :</div>
              </td>
              <td nowrap="nowrap" width="61%">  
                <input type="text" name="<%= "E" + suffix%>NA2" size="50" maxlength="45" value="<%= mr.getField("E" + suffix +  "NA2").getString().trim()%>" <%=READ_ONLY_TAG %>
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "NA2").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
 				/>
                <% if( !readOnly){ %>
                	<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom"/> 
                <% } %>
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right"></div>
              </td>
              <td nowrap="nowrap" width="61%">  
                <input type="text" name="<%= "E" + suffix %>NA3" size="50" maxlength="45" value="<%= mr.getField("E" + suffix +  "NA3").getString().trim()%>" <%=READ_ONLY_TAG %>
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "NA3").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">Barrio o Colonia :</div>
              </td>
              <td nowrap="nowrap" width="61%">  
                <input type="text" name="<%= "E" + suffix %>NA4" size="50" maxlength="45" value="<%= mr.getField("E" + suffix +  "NA4").getString().trim()%>" <%=READ_ONLY_TAG %>
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "NA4").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">Ciudad :</div>
              </td>
              <td nowrap="nowrap" width="61%">
                <input type="text" name="<%= "E" + suffix %>CTY" size="45" maxlength="35" value="<%= mr.getField("E" + suffix +  "CTY").getString().trim()%>"
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "CTY").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetGeoNames(GEOCountry, '<%= "E" + suffix %>CTY', GEOCodes, GEOText, GEOFilters)" >
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"/></a> 
    	            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" />
    	        <% } %>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">Municipio :</div>
              </td>
              <td nowrap="nowrap" width="61%">
				<input type="hidden" name="<%= "E" + suffix %>COM" value="<%= mr.getField("E" + suffix +  "COM").getString().trim()%>" readonly="readonly"/>
                <input type="text" name="<%= "D" + suffix %>COM" size="45" maxlength="35" value="<%= mr.getField("D" + suffix +  "COM").getString().trim()%>" readonly="readonly"
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "COM").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetGeoNames(GEOCountry, '<%= "D" + suffix %>COM', GEOCodes, GEOText, GEOFilters)" >
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"/></a> 
    	            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" />
    	        <% } %>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">Departamento :</div>
              </td>
              <td nowrap="nowrap" width="61%">
				<input type="hidden" name="<%= "E" + suffix %>STE" value="<%= mr.getField("E" + suffix +  "STE").getString().trim()%>" readonly="readonly"/>
                <input type="text" name="<%= "D" + suffix %>STE" size="45" maxlength="35" value="<%= mr.getField("D" + suffix +  "STE").getString().trim()%>" readonly="readonly"
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "STE").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetGeoNames(GEOCountry, '<%= "D" + suffix %>STE', GEOCodes, GEOText, GEOFilters)" >
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"/></a> 
    	            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" />
    	        <% } %>
              </td>
            </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">C&oacute;digo Postal :</div>
              </td>
              <td nowrap="nowrap" width="61%">  
                <input type="text" name="<%= "E" + suffix %>ZPC" size="16" maxlength="15" value="<%= mr.getField("E" + suffix +  "ZPC").getString().trim()%>" <%=READ_ONLY_TAG %>
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "ZPC").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">Apartado Postal :</div>
              </td>
              <td nowrap="nowrap" width="61%">  
                <input type="text" name="<%= "E" + suffix %>POB" size="11" maxlength="10" value="<%= mr.getField("E" + suffix +  "POB").getString().trim()%>" <%=READ_ONLY_TAG %>
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "POB").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
                </td>
            </tr>
            
<% if( basicData && !simple){ %>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap" width="39%"> 
                <div align="right">Correo Electr&oacute;nico :</div>
              </td>
              <td nowrap="nowrap" width="61%">  
                <input type="text" name="<%= "E" + suffix %>IAD" size="65" maxlength="60" value="<%= mr.getField("E" + suffix +  "IAD").getString().trim()%>" <%=READ_ONLY_TAG %> 
                	style="text-transform: none" 
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "IAD").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
                </td>
            </tr>
            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="39%"> 
                <div align="right">Direcci&oacute;n Pagina WEB :</div>
              </td>
              <td nowrap width="61%">  
                <input type="text" name="<%= "E" + suffix %>WEB" size="65" maxlength="60" value="<%= mr.getField("E" + suffix +  "WEB").getString().trim()%>" <%=READ_ONLY_TAG %> 
				style="text-transform: none" 
              	<%if(approval){
              		out.print(mr.getField("F" + suffix + "WEB").getString().equals("Y") ? "class=\"txtchanged\"" : "");} %>
              	/>
                </td>
            </tr>
<% } %>  
<% if(!simple){ %>
          </table>
        </td>
      </tr>
    </table>
</div>
<% } %>

<script>
var GEOCountry = getElement('<%= "E" + suffix %>ADC').value;

var GEOCodes = new Array(3);
GEOCodes[0] = '<%= "E" + suffix %>STE';
GEOCodes[1] = '<%= "E" + suffix %>COM';

var GEOText = new Array(3);
GEOText[0] = '<%= "D" + suffix %>STE';
GEOText[1] = '<%= "D" + suffix %>COM';

var GEOFilters = new Array(3);
GEOFilters[0] = getElement(GEOCodes[0]).value;
GEOFilters[1] = getElement(GEOCodes[1]).value;
</script>

