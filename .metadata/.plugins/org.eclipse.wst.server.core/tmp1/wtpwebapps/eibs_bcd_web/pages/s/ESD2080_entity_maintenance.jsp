<%@page import="java.util.logging.Level"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="datapro.eibs.beans.DataAddress"%>
<%@page import="java.util.logging.Logger"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.constants.Entities"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Entity</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="entity" class="datapro.eibs.beans.ESD208001Message" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO2" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">
<% 	if (userPO.getPurpose().equals("INQUIRY")) {%>
	builtNewMenu("ent_i_opt");  
	initMenu(); 
	
<% 	} else if (userPO.getPurpose().equals("APPROVAL_INQ")) { %>
	builtNewMenu("ent_a_opt");  
	initMenu(); 
	
<% } else if (userPO.getPurpose().equals("MAINTENANCE")) { %>
	builtNewMenu("ent_m_opt");  
	initMenu(); 
<% }
	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ") || userPO2.getPurpose().equals("APPROVAL_INQ");
	boolean isInquiry = userPO.getPurpose().equals("INQUIRY") || userPO2.getPurpose().equals("INQUIRY");
	boolean isReadOnly = isApprovalInquiry || isInquiry;
	String country =  !("".equals(entity.getField("E01CUMADC").toString().trim())) ? entity.getField("E01CUMADC").toString() : 
						!("".equals(entity.getField("E01CUEPID").toString().trim())) ? entity.getField("E01CUEPID").toString().trim() :		
							!("".equals(entity.getField("E01CUECOB").toString().trim())) ? entity.getField("E01CUECOB").toString().trim() :	ISOCodes.getISOCountryCode(currUser.getE01INT() , ISOCodes.EIBS_CODE_TO_ISO_ALFHA_2);	
%>

$(document).ready(function(){

   $.ajaxSettings.cache = false;
   $.ajaxSettings.dataType= "html";
   showCOB();
   registerEvent();
}); 

function changeAddressBlock(block, country, dCountry, clearData){

		$( "#direcionTable tr").get(0).scrollIntoView();
		if( country === undefined || country == "null" ){ country = ""; }
		if( dCountry === undefined || dCountry == "null" ){ dCountry = ""; }
		
		
		$.ajax({
			  type: 'GET',
			  url: "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSAddress",
	          cache: false,
	          data: { messageName: "entity",
	          		  basic : false,
	        	  	  simple : true,
	        	  	  countryHelp : <%= String.valueOf(!isReadOnly)%>,
	        	  	  index : block ,
	        	  	  firstColor : "trdark" ,
	        	  	  country : country ,
	        	  	  dCountry : dCountry ,
	        	  	  clearData : clearData,
	        	  	  readOnly : <%= String.valueOf(isReadOnly)%> ,
	        	  	  showWeb : true,
	        	  	  showEmail : false
	          },
		  
	          error: function(e) { 
	  		    $( "#address01" ).html( "Error en la Comunicacion [" + String(e) + "]");
	          },
	          success : function(response){
	          	   $("#direcionTable tr").remove();
				   $( "#direcionTable" ).append(response).get(0).scrollIntoView();
			 }
		});		
}

function showCOB(){
	$("#E01CUECOB" ).change();
}


function registerEvent(){

   $("body").on('change', 'input[name="E01CUMADC"]', function(){
		changeAddressBlock('01', $( "#E01CUMADC" ).val(), $( "#E01CUMCTR" ).val(), true ); 
	});	
}

</script>

</head>
<body>

 
 
 <script type="text/javascript" >
 	var jsIsCustomer = "";
<%
int row = 0;
%>

 </SCRIPT>  
 
<%  
String title = "";

 if (isReadOnly) {
	 title = "Consulta de";
 } else {
	 title = "Mantenimiento de";
 }
 if (entity.getE01CUELGT().equals("1")) { 
	 title = title + " Empresa";
 } else {
	 title = title + " Persona";
 }
 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");  
%>


<H3 align="center"><%= title %> <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="entity_maintenance.jsp, ESD2080"></H3>
<hr size="4">
<% if(ISOCodes.getIBSCountryCode(entity.getE01CUEPID()).equals(ISOCodes.getIBSCountryCode("MEX"))){ %>
	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2080" onsubmit="return validateForm()">
<% } else { %>
	<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2080">
<% } %>
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
 <h4>Datos B&aacute;sicos </h4> 
	  <table  class="tableinfo" style="table-layout: fixed;">
	    <tr bordercolor="#FFFFFF"> 
	      <td nowrap> 
	        <table style="padding: 5px; border-collapse: collapse; border-spacing: 0; border: 0px; width: 100%;" >

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right" style="font-weight: bold;">N&uacute;mero de entitdad : </div>
           </td>
            <td nowrap width="30%"> 
				<eibsinput:text name="entity" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" property="E01CUENUM" readonly="true"/>
           </td>
			<td nowrap width="20%">
              <div align="right">Pais :</div>
			 </td>
			<td nowrap width="30%">
	            <eibsinput:text name="entity" property="E01CUEPID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
			</td> 
        </tr>

         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Identificaci&oacute;n :</div>
           </td>
            <td nowrap width="30%"> 
			  <eibsinput:text name="entity" property="E01CUEIDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  readonly="true"/>                
		   </td>
			<td nowrap width="20%">
              <div align="right">Tipo :</div>
			 </td>
			<td nowrap width="30%">
	            <eibsinput:text name="entity" property="E01CUETID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" readonly="true"/>
			</td> 
          </tr> 

     <%if(entity.getE01CUELGT().equals("2")){%>   
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
       		<td nowrap width="20%"> 
                  <div align="right">Primer Nombre :</div>
                </td>
            <td nowrap width="30%"> 
                	<eibsinput:text property="E01CUEFNA" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true" onkeypress="enterChars(event,letters)"  modified="F01CUEFNA" readonly="<%=isReadOnly %>"/>
                </td>
       		<td nowrap width="20%"> </td>
			<td nowrap width="30%"></td> 
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
       		<td nowrap width="20%"> 
                  <div align="right">Segundo Nombre :</div>
                </td>
            <td nowrap width="30%"> 
                	<eibsinput:text property="E01CUEFN2" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" onkeypress="enterChars(event,letters)" modified="F01CUEFN2" readonly="<%=isReadOnly %>"/>
       		<td nowrap width="20%"> </td>
			<td nowrap width="30%"></td> 
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
       		<td nowrap width="20%"> 
                  <div align="right">Primer Apellido :</div>
                </td>
            <td nowrap width="30%"> 
                	<eibsinput:text property="E01CUELN1" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true" onkeypress="enterChars(event,letters)" modified="F01CUELN1" readonly="<%=isReadOnly %>"/>
                </td>
       		<td nowrap width="20%"> </td>
			<td nowrap width="30%"></td> 
		</tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
                  <div align="right">Segundo Apellido :</div>
            </td>
            <td nowrap width="30%"> 
                	<eibsinput:text property="E01CUELN2" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" onkeypress="enterChars(event,letters)" modified="F01CUELN2" readonly="<%=isReadOnly %>"/>
            </td>
       		<td nowrap width="20%"> </td>
			<td nowrap width="30%"></td> 
		</tr>       
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
       		<td nowrap width="20%"> 
            	<div align="right">Nacionalidad :</div>
            </td>
       		<td nowrap width="30%"> 
				<eibsinput:cnofc name="entity" property="E01CUECCS" required="false" flag="03" fn_code="E01CUECCS" fn_description= "D01CUECCS"  readonly="<%=isReadOnly %>"/>
	            <eibsinput:text name="entity" property="D01CUECCS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01CUECCS"/>
          	</td>
            <td nowrap width="20%"> 
                    <div align="right">Fecha Nacimiento :</div>
           </td>
           <td nowrap width="30%"> 
	               <eibsinput:date name="entity" fn_year="E01CUEBDY" fn_month="E01CUEBDM" fn_day="E01CUEBDD" required="true" modified="F01CUEBDY, F01CUEBDM, F01CUEBDD"  readonly="<%=isReadOnly  %>"/>
           </td>
           </tr> 
		<% if(ISOCodes.getIBSCountryCode(entity.getE01CUEPID()).equals(ISOCodes.getIBSCountryCode("MEX"))){ %>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
       		<td nowrap width="20%"> 
            	<div align="right">País de Nacimiento :</div>
            </td>
       		<td nowrap width="30%"> 
				<eibsinput:cnofc name="entity" property="E01CUECOB" required="false" flag="03" fn_code="E01CUECOB" fn_description= "D01CUECOB"  readonly="<%=isReadOnly %>"/>
	            <eibsinput:text name="entity" property="D01CUECOB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01CUECOB"/>
          	</td>
            <td nowrap width="20%"> </td>
	        <td nowrap width="30%"> </td> 
	       </tr> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%"> 
                    <div align="right">Lugar de Nacimiento :</div>
           </td>
           <td nowrap width="30%"> 
              	<span id="lncnofc" >
				<eibsinput:cnofc name="entity" property="E01CUEUC1" required="false" flag="EM" fn_code="E01CUEUC1" fn_description= "D01UC1"  readonly="<%=isReadOnly %>"/>
	            <eibsinput:text name="entity" property="D01UC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01CUEUC1"/>
              	</span>
              	<span id="lndsc" >
              	<eibsinput:text property="E01CUECT1" name="entity" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" readonly="true"  />
				</span>
           </td>
            <td nowrap width="20%"> </td>
	        <td nowrap width="30%"> </td> 
           </tr>    
        <% } %>   
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
       		<td nowrap width="20%"> 
                    <div align="right">Estado Civil :</div>
            </td>
       		<td nowrap width="30%"> 
                  <select name="E01CUEMST" <%=isReadOnly?"disabled":""%>>
                    <option value=" " <% if (!(entity.getE01CUEMST().equals("1")||entity.getE01CUEMST().equals("2") || entity.getE01CUEMST().equals("3")||entity.getE01CUEMST().equals("4")||entity.getE01CUEMST().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (currUser.getE01INT().equals("07")) { %>
                    <option value="1" <% if (entity.getE01CUEMST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (entity.getE01CUEMST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (currUser.getE01INT().equals("18")) { %>
                    <option value="1" <% if (entity.getE01CUEMST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (entity.getE01CUEMST().equals("2")) out.print("selected"); %>>Casado(a) - Separacion de Bienes</option>                   
                    <option value="3" <% if (entity.getE01CUEMST().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (entity.getE01CUEMST().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (entity.getE01CUEMST().equals("5")) out.print("selected"); %>>Viudo</option>
                    <option value="6" <% if (entity.getE01CUEMST().equals("6")) out.print("selected"); %>>Seperado</option>
                    <option value="7" <% if (entity.getE01CUEMST().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
                    <option value="1" <% if (entity.getE01CUEMST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (entity.getE01CUEMST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (entity.getE01CUEMST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (entity.getE01CUEMST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (entity.getE01CUEMST().equals("5")) out.print("selected"); %>>Otro</option>
                    <option value="6" <% if (entity.getE01CUEMST().equals("6")) out.print("selected"); %>>Unión Libre</option>
					<% } %>
                  </select>
                </td>
 				<td nowrap width="20%">
                     <div align="right">Sexo :</div>
                </td>
 				<td nowrap width="30%">
 			       <p> 
                    <input type="radio" name="E01CUEGEN" <%=isReadOnly ?"disabled":""%> value="F" <%if (entity.getE01CUEGEN().equals("F")) out.print("checked"); %>>
                    Femenino 
                    <input type="radio" name="E01CUEGEN" <%=isReadOnly ?"disabled":""%> value="M" <%if (entity.getE01CUEGEN().equals("M")) out.print("checked"); %>>
                    Masculino 
                    </p> 
               </td>
            </tr>    
	<%} else  {%>	     
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
       		<td nowrap width="20%"> 
              <div align="right">Nombre :</div>
           </td>
           <td nowrap width="30%">
			 <eibsinput:text name="entity" property="E01CUENME" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" required="true" modified="F01CUENME"  readonly="<%=isReadOnly %>"/>                
		   </td>
        	   <td nowrap width="20%"> </td>
		       <td nowrap width="30%"></td> 
           </tr> 	
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
       		<td nowrap width="20%"> 
            	<div align="right">Pais Empresa :</div>
            </td>
       		<td nowrap width="30%"> 
				<eibsinput:cnofc name="entity" property="E01CUECCS" required="false" flag="03" fn_code="E01CUECCS" fn_description= "D01CUECCS" readonly="<%=isReadOnly %>"/>
	            <eibsinput:text name="entity" property="D01CUECCS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" modified="F01CUECCS" />
          	</td>
            <td nowrap width="20%"> 
                    <div align="right">Fecha Fundacion :</div>
           </td>
           <td nowrap width="30%"> 
	               <eibsinput:date name="entity" fn_year="E01CUEBDY" fn_month="E01CUEBDM" fn_day="E01CUEBDD" required="true" modified="F01CUEBDY, F01CUEBDM, F01CUEBDD" readonly="<%=isReadOnly  %>"/>
           </td>
           </tr>    
	<% } 
		if(ISOCodes.getIBSCountryCode(entity.getE01CUEPID()).equals(ISOCodes.getIBSCountryCode("MEX")) && currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MEX"))){ 
	%>
	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	            <td nowrap="nowrap" width="20%" align="right">RFC :</td>
	            <td nowrap="nowrap" width="30%" colspan="3" > 
	            	<eibsinput:text name="entity" property="E01RFC01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="4"  />
	            	<eibsinput:text name="entity" property="E01RFC02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6"  />
	            	<eibsinput:text name="entity" property="E01RFC03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
	            	<eibsinput:text name="entity" property="E01RFC04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />

	 	        </td>
	        </tr>
		<%if(entity.getE01CUELGT().equals("2")){%>   
	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	            <td nowrap="nowrap" width="20%" align="right">CURP :</td>
	            <td nowrap="nowrap" width="30%" colspan="3" >
	            	<eibsinput:text name="entity" property="E01CURP1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="4"  />
	            	<eibsinput:text name="entity" property="E01CURP2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6"  />
	            	<eibsinput:text name="entity" property="E01CURP3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
	            	<eibsinput:text name="entity" property="E01CURP4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
	            	<eibsinput:text name="entity" property="E01CURP5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
	            	<eibsinput:text name="entity" property="E01CURP6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
	            	<eibsinput:text name="entity" property="E01CURP7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
	            	<eibsinput:text name="entity" property="E01CURP8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
	 	        </td>
	        </tr>		
	      <% } %>  
	<% } %>	
	
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
    	   <td nowrap width="20%">
                   <div align="right">Email :</div>
		   </td>
		   <td nowrap width="30%">
				  <eibsinput:text name="entity" property="E01CUEIAD" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_EMAIL %>" required="false" modified="F01CUEIAD" readonly="<%=isReadOnly%>"/>                
		   </td> 
       		<td nowrap width="20%"> 
                   <div align="right">Telefono :</div>
               </td>
       		<td nowrap width="30%"> 
				  <eibsinput:text name="entity" property="E01CUEPHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="false" modified="F01CUEPHN" readonly="<%=isReadOnly%>"/>                
               </td>
		  </tr>   
		</table>
		</td>
		</tr>
		</table>	  
  <br>
		
<h4>Direcci&oacute;n </h4>		
		
  <table   class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table id="direcionTable" cellspacing="0" cellpadding="2" width="100%" border="0">
	        <% 	String pageName = DataAddress.getTemplatePage(request, ISOCodes.getIBSCountryCode(country.trim()).trim(), entity);
	        	Logger.getLogger(this.getClass().getName()).log(Level.FINE, "Using template: " + pageName);
	        %>
			<jsp:include page="<%= pageName %>" flush="true">
				<jsp:param name="messageName"  value="entity" />
	        	<jsp:param name="readOnly" value="<%=isReadOnly%>" />
				<jsp:param name="suffix" value="E01CUM" />
				<jsp:param name="countryHelp" value="true" />
				<jsp:param name="showWeb" value="true" />
			</jsp:include>
          </table>
      </td>
    </tr>
  </table>
  
     <%if  (!isReadOnly) { %>
       <div align="center"> 
		<% if(error.getERWRNG().equals("Y")){%>
		   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(entity.getH01FLGWK2().equals("A")){ out.print("checked");} %> >Aceptar con Aviso</h4>
		<br>
		<% } %> 
           <input id="EIBSBTN" type=Submit name="Submit" value="Enviar" >
       </div>
     <% } else {%>
     	<script type="text/javascript">
			$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
			$("select").add("button").add("submit").add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
			$("img[title='null']").add("img[src*='1b.gif']").add("img[src*='Check.gif']").add("img[src*='calendar.gif']").hide(); 	
			$("input.context-menu-help").removeAttr("onmousedown").removeClass();
		</script>
     <% } %>  
     
<script type="text/javascript">
<%--If User Cancels Entity Process
	Calls Server to Return UserPO
 --%>
<% if(!"MAIN".equalsIgnoreCase((String) session.getAttribute("source"))){ %>
window.submitted = false;
$("form").submit(function() {
     window.submitted = true;
});


$(window).on('beforeunload', function () { 
	 if(!window.submitted){
		 $.ajax(
	           {
	           	url:"<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2080", 
	           	type:"POST",
	           	async:false,
	           	data: "SCREEN=1",
	               success: function(result,status,xhr){
	          			// console.log("Session Invalidated : True");
	               },
	               
	               error: function(xhr,status,error){
	      			 	//console.log("Session Invalidated : False");
	               }
		});
	}
});
<% } %>
<% if(ISOCodes.getIBSCountryCode(entity.getE01CUEPID()).equals(ISOCodes.getIBSCountryCode("MEX")) && currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MEX"))){ %>
	function validateForm(){
		$("#EIBSBTN").prop( "disabled", true );;
		
		if(!valRFC_CURP() ){
			return false ;
		} else {
			return true ;
		}
	}
	
	function valRFC_CURP(  ){
		scriptLog( "Validating..." );
		if( $("#E01RFC01").val() != "" &&  ( $("#E01RFC03").val() == "" || $("#E01RFC04").val() == "" ) ){
			alert("Campo RFC incompleto");
			$("#E01RFC01").focus();
			$("#EIBSBTN").removeAttr('disabled');
			return false;
		}
		
		if( $("#E01CURP1").val() != "" &&  ( $("#E01CURP7").val() == "" || $("#E01CURP8").val() == "" ) ){
			alert("Campo CURP incompleto");
			$("#E01CURP1").focus();
			$("#EIBSBTN").removeAttr('disabled');
			return false;
		}
		return true;
	}
	
	$("#E01CUECOB" ).change(function(){
	   var lugarCNOFC = $( "#E01CUEUC1" ) ;
	   var lugarDSC = $( "#E01CUECT1") ;
	   lugarCNOFC.val( "" );
	   lugarDSC.val( "" );
	   
	   if( $(this).val().toUpperCase() == "MX" ){
		   lugarDSC.attr( "readonly" , "readonly" ) ;
		   $('#lncnofc').show();
		   $('#lndsc').hide();
	   } else {
		   $('#lncnofc').hide();
			$('#lndsc').show();
		   lugarDSC.removeAttr( "readonly" ) ;
	   }
	});
<% } %>
</script>     

</form>     
</body>
</HTML>
