<%@ page import="datapro.eibs.sockets.*, datapro.eibs.beans.*" %>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%!
	datapro.eibs.sockets.MessageRecord mr;
 	
	String title;
	String messageName;
    boolean basicData=false ; 
    boolean simple=true; 
  	boolean readOnly=false;
	String READ_ONLY_TAG=""; 
	boolean countryHelp = false ;
	boolean showWeb = false;
  	boolean showEmail = false;
    boolean isDomesticAddress = false;
%> 

<%
	//The boolean isDomesticAddress  Hides All the Ayudas  
	//if the Template IBS Code is not the same as the Banks
	//this request variable is set from DataAdress.class at the time it decides which template to send
   //If not domestic, JS function sets readonly prop = false; function called at end of table
	if( null != session.getAttribute("isDomesticAddress")){
		isDomesticAddress = Boolean.valueOf(session.getAttribute("isDomesticAddress").toString()).booleanValue() ;
	}

   //Obtiene el titulo del segmento de direccion
	title = request.getParameter("title");

   // Obtiene el sufijo de los campos dependiendo del tipo de mensaje a desplegar.
   // Por ejemplo, si el mensaje es del tipo ESD008001, el sufijo enviado es E01, si el tipo es ESD008002 
   // el sufijo enviado ed E02
   

   // Obtiene el mensaje a desplegar
	messageName = request.getParameter("messageName");
	mr = (datapro.eibs.sockets.MessageRecord) session.getAttribute(messageName);
   
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
	   showEmail = Boolean.parseBoolean( request.getParameter("showEmail").toString() ) ;
   } else if(basicData && !simple){
   	   showEmail = true;	
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
	
	//Obtiene el color de la primera fila
	int row = 0;row++;
	if("trdark".equals(request.getParameter("firstColor"))){
		row=1;
	}
	
   //Flag para activar la ayuda de paises
   if(request.getParameter("countryHelp") != null){
	   countryHelp= Boolean.parseBoolean( request.getParameter("countryHelp").toString() ) ;
   }		
   
	String suffix = "E01CUM" ;
	if( request.getParameter("suffix") != null ){
		suffix = request.getParameter("suffix");
	}
	
    String suffixDsc = "D" + suffix.substring(1) ;
    String suffixMod = "F" + suffix.substring(1) ;
    
    
	String valuePaisCode = request.getParameter("country")!=null && !request.getParameter("country").trim().equals("") 
			?request.getParameter("country")
			:mr.getField(suffix + "ADC").getString() ; 
			
	String valuePaisDesc = request.getParameter("dCountry")!=null && !request.getParameter("dCountry").trim().equals("")
			?request.getParameter("dCountry")
			:mr.getField(suffix + "CTR").getString() ;    
%>

<%-- Inicio del bloque de direccion --%> 
<% if(title != null && !"".equals(title)){ %>
  <h4><%=title%></h4>
<% } %>
<% if(!simple){ %>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" class="fixed2col">
<% } %>
   			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
				<td nowrap ><div align="right">Pa&iacute;s :</div></td>
    			<td nowrap > 
					<div align="left">	
        				<input type="text" size="5" maxlength="4" name="<%= suffix %>ADC" id="<%= suffix %>ADC" value="<%=valuePaisCode%>" readonly="readonly" >   
        				<% if ( countryHelp ) {%>
							<a href="javascript:GetCodeDescCNOFC('<%= suffix %>ADC','<%= suffix %>CTR','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
        				<% } %>
        				<input type="text" name="<%= suffix %>CTR" id="<%= suffix %>CTR" size="50" maxlength="45" value="<%=valuePaisDesc%>" readonly="readonly"  >
        				<% if ( !readOnly ) {%>
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom"	border="0"> 
						<% } %>	
						</div>
        		</td>
        	</tr>
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right">Tipo Direccion :</div>
              </td>
              <td nowrap width="72%">  
                <input type="hidden" name="<%= suffix %>ADT" size="5" maxlength="4" value="<%= mr.getField(suffix +  "ADT").getString().trim()%>" >
                <input type="text" name="<%= suffixDsc %>ADT" size="50" maxlength="45" value="<%= mr.getField(suffixDsc +  "ADT").getString().trim()%>" readonly >
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetCodeDescCNOFC('<%= suffix %>ADT','<%= suffixDsc %>ADT','DT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
	                <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
    	        <% } %>
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right">Comuna :</div>
              </td>
              <td nowrap width="72%">  
                <input type="hidden" name="<%= suffix %>COM" size="6" maxlength="6" value="<%= mr.getField(suffix +  "COM").getString().trim()%>" >
                <input type="text" name="<%= suffix %>COD" size="50" maxlength="45" value="<%= mr.getField(suffix +  "COD").getString().trim()%>" readonly class="direccion">
                <% if ( !readOnly ) { 
					if(isDomesticAddress){
                %>
		                <a href="javascript:GetCodeDescCNOFC('<%= suffix %>COM','<%= suffix %>COD','80')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
		                <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >  
    				<% } 
    	         } %>
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right">Calle :</div>
              </td>
              <td nowrap width="72%">  
                <input type="text" name="<%= suffix %>MA2" size="50" maxlength="45" value="<%= mr.getField(suffix +  "MA2").getString().trim()%>" <%=READ_ONLY_TAG %>  class="direccion">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
			  </td>
            </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right"> </div>
              </td>
              <td nowrap width="72%">  
                <input type="text" name="<%= suffix %>MA3" size="50" maxlength="45" value="<%= mr.getField(suffix +  "MA3").getString().trim()%>" <%=READ_ONLY_TAG %>  class="direccion">
			  </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right"> N&uacute;mero :</div>
              </td>
              <td nowrap width="72%">  
                <input type="text" name="<%= suffix %>NR1" size="10" maxlength="10" value="<%= mr.getField(suffix +  "NR1").getString().trim()%>" onKeypress="enterInteger(event)" <%=READ_ONLY_TAG %>  class="direccion">
                <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
			  </td>
            </tr>

            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right"> Casa/Depto :</div>
              </td>
              <td nowrap width="72%">  
				<input type="text" name="<%= suffix %>MA4" size="50" maxlength="45" value="<%= mr.getField(suffix +  "MA4").getString().trim()%>" <%=READ_ONLY_TAG %>  class="direccion">
			  </td>
            </tr>
		<%if(isDomesticAddress){%>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right"> Referencia :</div>
              </td>
              <td nowrap width="72%">  
				<input type="text" name="<%= suffix %>REF" size="40" maxlength="35" value="<%= mr.getField(suffix +  "REF").getString().trim()%>" <%=READ_ONLY_TAG %>  class="direccion">
			  </td>
            </tr>
		<% } %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right">C&oacute;digo Postal :</div>
              </td>
              <td nowrap width="72%">  
                <input type="text" name="<%= suffix %>ZPC" size="16" maxlength="15" value="<%= mr.getField(suffix +  "ZPC").getString().trim()%>" <%=READ_ONLY_TAG %>  class="direccion">
                </td>
            </tr>
            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right">Fecha Verificaci&oacute;n(Direcci&oacute;n)  :</div>
              </td>
              <td nowrap width="72%">  	
					<eibsinput:date fn_month="${empty requestScope.suffix ? empty sessionScope.suffix  ? param[\"suffix\"] : sessionScope.suffix : requestScope.suffix}DTM" 
									fn_day="${empty requestScope.suffix ? empty sessionScope.suffix  ? param[\"suffix\"] : sessionScope.suffix : requestScope.suffix}DTD" 
									fn_year="${empty requestScope.suffix ? empty sessionScope.suffix  ? param[\"suffix\"] : sessionScope.suffix : requestScope.suffix}DTY"
									name="${empty requestScope.messageName ? empty sessionScope.messageName  ? param[\"messageName\"] : sessionScope.messageName : requestScope.messageName}"
									readonly="<%= readOnly %>" />             
              </td>
            </tr>
		<%if(isDomesticAddress){%>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" >
              <td nowrap width="28%"> 
                <div align="right">Verificado por :</div>
              </td>
              <td nowrap width="72%">  
                <input type="hidden" name="<%= suffix %>ADF" size="5" maxlength="4" value="<%= mr.getField(suffix +  "ADF").getString().trim()%>" >
                <input type="text" name="<%= suffixDsc %>ADF" size="50" maxlength="45" value="<%= mr.getField(suffixDsc +  "ADF").getString().trim()%>" readonly >
                <% if ( !readOnly ) { %>
	                <a href="javascript:GetCodeDescCNOFC('<%= suffix %>ADF','<%= suffixDsc %>ADF','43')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
	               <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" >  
    	        <% } %>
			  </td>
            </tr>
		<% } %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="28%"> 
                <div align="right">Estado Vigente :</div>
              </td>

              <td nowrap width="72%" >  
              <% if ( !readOnly ) { %>
                <input type="radio" name="<%= suffix %>STS" value="Y" <%if (!mr.getField(suffix +  "STS").getString().equals("N")) out.print("checked"); %>>Si
                <input type="radio" name="<%= suffix %>STS" value="N" <%if (mr.getField(suffix +  "STS").getString().equals("N")) out.print("checked"); %>>No
    	        <%} else {%>
                <input type="radio" disabled name="<%= suffix %>STS" value="Y" <%if (!mr.getField(suffix +  "STS").getString().equals("N")) out.print("checked"); %>>Si
                <input type="radio" disabled name="<%= suffix %>STS" value="N" <%if (mr.getField(suffix +  "STS").getString().equals("N")) out.print("checked"); %>>No
     	        <% } %>
              </td>
            </tr>
	     	<tr class="<%= showEmail ?  (row % 2 == 1) ? "trdark" : "trclear" : "" %><% if(showEmail)row++;%>" style="display : <%= showEmail ? "table-row" : "none"%>" >
	       		<td nowrap ><div align="right">Direcci&oacute;n E-Mail :</div></td>
	       		<td nowrap > 
	        		<div align="left">	
	        			<input type="text" name="<%= suffix %>IAD" id="<%= suffix %>IAD" size="62" maxlength="60" value="<%= mr.getField(suffix+"IAD").getString()%>" <%=READ_ONLY_TAG %>  class="direccion"	style="text-transform: none"
	          				<%=(basicData && mr.getField(suffixMod + "IAD").getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
			</div>
	       			</td>
	     			</tr>
	     			<tr class="<%= showWeb ?(row % 2 == 1) ? "trdark" : "trclear" : ""%><%if(showWeb)row++;%>" style="display :<%= showWeb ? "table-row" : "none"%>"  >
	       			<td nowrap ><div align="right">P&aacute;gina Web :</div></td>
	       			<td nowrap > 
	          			<div align="left">	
	         				<input type="text" name="<%= suffix %>WEB" id="<%= suffix %>WEB" size="62" maxlength="60" value="<%= mr.getField(suffix + "WEB").getString()%>" <%=READ_ONLY_TAG %>  class="direccion"
	         					style="text-transform: none" <%=(basicData && mr.getField(suffixMod + "WEB").getString().equals("Y"))?"class=\"txtchanged\"":"" %> >
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
<% } %>