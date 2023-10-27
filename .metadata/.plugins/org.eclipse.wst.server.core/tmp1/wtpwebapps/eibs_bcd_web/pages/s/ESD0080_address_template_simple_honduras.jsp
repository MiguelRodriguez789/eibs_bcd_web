<%@ page import="datapro.eibs.sockets.*, datapro.eibs.beans.*" %>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<%
	datapro.eibs.sockets.MessageRecord mr;
 
	String suffix = ""; // Este template se usa para los que no son datos básicos
	boolean readOnly=false;
	String READ_ONLY_TAG=""; 
   //Obtiene el titulo del segmento de direccion
	String title = request.getParameter("title");

   // Obtiene el sufijo de los campos dependiendo del tipo de mensaje a desplegar.
   // Por ejemplo, si el mensaje es del tipo ESD008001, el sufijo enviado es E01, 
   // si el tipo es ESD008002 el sufijo enviado ed E02
   

   // Obtiene el mensaje a desplegar
	String messageName = request.getParameter("messageName");
	mr = (datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);
	
	boolean simple = true;
	if( request.getParameter("simple") != null ){
		simple = 
		  	Boolean.valueOf(request.getParameter("simple").toString()).booleanValue() ;
	}
   
	// Determina si es solo lectura
	if (request.getParameter("readOnly") != null )
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
			READ_ONLY_TAG="readonly";
		} else {
			readOnly=false;
			READ_ONLY_TAG="";
		}
	else READ_ONLY_TAG="";


	String index = "" ;
	if( request.getParameter("index") != null ){
		index = request.getParameter("index")  ;
		if(index.length() == 1)
			suffix = "4";
	} else if( request.getParameter("suffix") != null ){
		suffix = request.getParameter("suffix")  ;
	} else {
		index = "0";
	}
	
	//Obtiene el color de la primera fila
	int row = 0;
	if(request.getParameter("firstColor") != null){
		row = request.getParameter("firstColor").equals("trclear") ? 0 : 1;
	}	
%>
<%-- Inicio del bloque de direccion --%> 
<% if(title != null && !"".equals(title)){ %>
  <h4><%=title%></h4>
<% } %>
<% if(!simple){ %>
<div id="address<%= index %>" style="display:block;">
  <table class="tableinfo">
      <tr > 
        <td nowrap="true"> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
<% } %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap="true" width="32%"> 
                <div align="right">Pa&iacute;s de la Direcci&oacute;n :</div>
              </td>
              <td nowrap="true" width="66%">  
			  	<input type="hidden" name="<%= "E" + index + suffix %>ADC" id="<%= "E" + index + suffix %>ADC"
			  		value="<%= mr.containsKey("E" + index + suffix + "ADC") ? DataAddress.getTemplateCountry(request, mr.getField("E" + index + suffix + "ADC").getString().trim()) : ""%>"
			  		onchange="javascript:addressCountryChanged(<%= index %>, this)"/>
                <input type="text" name="<%= "E" + index + suffix %>CTR" size="45" maxlength="35" value="<%= mr.getField("E" + index + suffix + "CTR").getString().trim()%>" readonly="readonly" />
              <% if( !readOnly ){ %>
              	<A href="javascript:GetCodeDescCNOFC('<%="E" + index + suffix + "ADC"%>','<%="E" + index + suffix + "CTR"%>','03')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0" style="cursor:hand"/></A>
              	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom"/> 
              <% } %>
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap="true" width="32%"> 
                <div align="right">Direcci&oacute;n Principal :</div>
              </td>
              <td nowrap="true" width="66%">  
                <input type="text" name="<%= "E" + index + suffix %>MA2" size="45" maxlength="35" value="<%= mr.getField("E" + index + suffix + "MA2").getString().trim()%>" <%=READ_ONLY_TAG %> />
                <% if( !readOnly){ %>
                	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" align="bottom" /> </td>
                <% } %>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap="true"> 
                <div align="right"></div>
              </td>
              <td nowrap="true">  
                <input type="text" name="<%= "E" + index + suffix %>MA3" size="45" maxlength="35" value="<%= mr.getField("E" + index + suffix + "MA3").getString().trim()%>" <%=READ_ONLY_TAG %> />
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap="true"> 
                <div align="right">Barrio o Colonia :</div>
              </td>
              <td nowrap="true">  
                <input type="text" name="<%= "E" + index + suffix %>MA4" size="45" maxlength="35" value="<%= mr.getField("E" + index + suffix + "MA4").getString().trim()%>" <%=READ_ONLY_TAG %>/>
                </td>
            </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap="true"> 
                <div align="right">Ciudad :</div>
              </td>
              <td nowrap="true">  
                <input type="text" name="<%= "E" + index + suffix %>CTY" size="45" maxlength="35" value="<%= mr.getField("E" + index + suffix + "CTY").getString().trim()%>" <%=READ_ONLY_TAG %> />
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetGeoNames(GEOCountry<%= index  %>, '<%= "E" + index + suffix %>CTY', GEOCodes<%= index  %>, GEOText<%= index  %>, GEOFilters<%= index  %>)" >
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"/></a> 
    	            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" />
    	        <% } %>
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap="nowrap"> 
                <div align="right">Municipio :</div>
              </td>
              <td nowrap="nowrap">
				<input type="hidden" name="<%= "E" + index + suffix %>COM" value="<%= mr.getField("E" + index + suffix + "COM").getString().trim()%>"/>
                <input type="text" name="<%= "D" + index + suffix %>COM" size="45" maxlength="35" value="<%= mr.getField("D" + index + suffix + "COM").getString().trim()%>" readonly="readonly"
              	/>
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetGeoNames(GEOCountry<%= index  %>, '<%= "D" + index + suffix %>COM', GEOCodes<%= index  %>, GEOText<%= index  %>, GEOFilters<%= index  %>)" >
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"/></a> 
    	            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" />
    	        <% } %>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap="true"> 
                <div align="right">Departamento :</div>
              </td>
              <td nowrap="true">  
				<input type="hidden" name="<%= "E" + index + suffix %>STE" value="<%= mr.getField("E" + index + suffix + "STE").getString().trim()%>"/>
                <input type="text" name="<%= "D" + index + suffix %>STE" size="45" maxlength="35" value="<%= mr.getField("D" + index + suffix + "STE").getString().trim()%>" readonly="readonly"/>
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetGeoNames(GEOCountry<%= index  %>, '<%= "D" + index + suffix %>STE', GEOCodes<%= index  %>, GEOText<%= index  %>, GEOFilters<%= index  %>)" >
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"/></a> 
    	            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo mandatorio" align="bottom" />
    	        <% } %>
            </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap="true"> 
                <div align="right">C&oacute;digo Postal :</div>
              </td>
              <td nowrap="true">  
                <input type="text" name="<%= "E" + index + suffix %>ZPC" size="20" maxlength="15" value="<%= mr.getField("E" + index + suffix + "ZPC").getString().trim()%>" <%=READ_ONLY_TAG %> />
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap="true"> 
                <div align="right">Apartado Postal :</div>
              </td>
              <td nowrap="true">  
                <input type="text" name="<%= "E" + index + suffix %>POB" size="15" maxlength="10" value="<%= mr.getField("E" + index + suffix + "POB").getString().trim()%>" <%=READ_ONLY_TAG %> />
                </td>
            </tr>
<% if(!simple){ %>
          </table>
        </td>
      </tr>
    </table>
</div>
<% } %>

<script>
var GEOCountry<%= index %> = getElement('<%= "E" + index + suffix %>ADC').value;

var GEOCodes<%= index %> = new Array(3);
GEOCodes<%= index %>[0] = '<%= "E" + index + suffix %>STE';
GEOCodes<%= index %>[1] = '<%= "E" + index + suffix %>COM';

var GEOText<%= index %> = new Array(3);
GEOText<%= index %>[0] = '<%= "D" + index + suffix %>STE';
GEOText<%= index %>[1] = '<%= "D" + index + suffix %>COM';

var GEOFilters<%= index %> = new Array(3);
GEOFilters<%= index %>[0] = getElement(GEOCodes<%= index %>[0]).value;
GEOFilters<%= index %>[1] = getElement(GEOCodes<%= index %>[1]).value;
</script>