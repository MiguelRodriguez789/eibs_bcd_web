<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.constants.EntitiesHtml"%>
<%@page import="com.datapro.constants.Entities"%>

<%@page import="java.util.logging.*"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.beans.DataAddress"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.beans.IdentificationData"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<html>
<head>
<title>Entity</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="entity" class="datapro.eibs.beans.ESD400101Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 
 
<script type="text/javascript">
<%-- FOR CUSTOMER ADDRESS FORMAT CHANGE VIA AJAX
THERE IS NO FIELD TO STORE THE ADDRESS COUNTRY CODE IN ESD008001 --%> 
<%
	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
	boolean isReadOnly = isApprovalInquiry || isInquiry; 
	String country = entity.getField("E01CUMADC").toString().trim();
%>


$(document).ready(function(){

   setIds();
	
   $.ajaxSettings.cache = false;
   $.ajaxSettings.dataType= "html";
  
   registerEvent();

   $("body").on('change', 'input[name="E01CUMADC"]', function(){
		changeAddressBlock('01', $( "#E01CUMADC" ).val(), $( "#E01CUMCTR" ).val(), true ); 
	});
}); 

function changeAddressBlock(block, country, dCountry, clearData){
	
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
	        	  	  readOnly : <%= String.valueOf(isReadOnly)%>,
	        	  	  showWeb : false
	          },
		  
	          error: function(e) { 
	  		    $( "#address01" ).html( "Error en la Comunicacion [" + String(e) + "]");
	          },
	          success : function(response){
	          	   $("#direcionTable tr").slice(1).remove();
				   $( "#direcionTable" ).append(response);
					registerEvent;	          
			 }
		});		
}


function registerEvent(){

	setIds();
}

function setIds(){
	
    $(":input").each(function(){
        if( ! $(this).attr("id") || $(this).attr("id") == "" ){
        	$(this).attr("id", $(this).attr("name" ) );
        }
    });
}

function cerrarVentana(){
	window.open('','_parent','');
	window.close(); 
}

</script>
 
 
 <script type="text/javascript">
 
<% String menu = EntitiesHtml.getMenu(userPO);%>
   builtNewMenu(<%=menu%>);
    
if(window.name.toUpperCase() == "MAIN"){
 <% int row = 0;
%>
}
</SCRIPT>  


</head>
<body>

 
<%  
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");  
%>


<H3 align="center">Direcciones de Correo <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="mail_address.jsp, ESD4001"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD4001" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
  <input type=HIDDEN name="E01CUMMAN"  value="<%= entity.getE01CUMMAN().trim()%>">

  <% if(entity.getE01CUMRTP().equals("E")){ %>
  <input type=HIDDEN name="RECTYP"  value="<%= entity.getE01CUMRTP().trim()%>">
  <input type=HIDDEN name="CUSCUN"  value="<%= entity.getE01CUMCUN().trim()%>">
  <% } else { %> 
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr>
             <td nowrap width="10%" align="right"> Cliente: 
              </td>
             <td nowrap width="12%" align="left">
      			<%= userPO.getHeader1()%>
             </td>
             <td nowrap width="6%" align="right">ID:  
             </td>
             <td nowrap width="14%" align="left">
      			<%= userPO.getHeader2()%>
             </td>
             <td nowrap width="8%" align="right"> Nombre: 
               </td>
             <td nowrap width="50%"align="left">
      			<%= userPO.getHeader3()%>
             </td>
        </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4> Dirección Número:  <%= entity.getE01CUMMAN() %> </h4>
  
  <% } %>
    
    <table  class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" id="direcionTable" class="fixed">
       
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%"> 
              <div align="right">Nombre :</div>
            </td>
            <td nowrap width="75%" > 
            	<% String name = entity.getE01CUMMA1().trim().equals("") ? userPO.getCusName() : entity.getE01CUMMA1() ;  %>
                <eibsinput:text name="entity" property="E01CUMMA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" value="<%= name %>" required="false" readonly="<%=isReadOnly %>"/>
            </td>
          </tr> 
	        <% 	
	        	String pageName = DataAddress.getTemplatePage(request, ISOCodes.getIBSCountryCode(country.trim()), entity);
	        	Logger.getLogger(this.getClass().getName()).log(Level.FINE, "Using template: " + pageName);
	        %>
	<jsp:include page="<%= pageName %>" flush="true">
		<jsp:param name="suffix" value="E01CUM" />
		<jsp:param name="messageName"  value="entity" />
		<jsp:param name="readOnly"  value="<%=isReadOnly %>" />
		<jsp:param name="basic"  value="false" />
		<jsp:param name="simple" value="true" />
		<jsp:param name="countryHelp" value="<%= String.valueOf(!isReadOnly)%>" />
	</jsp:include>
	</table>   
   </td>
    </tr>
  </table>
  
  <br>
  
     <%if  (!isReadOnly) { %>
       <div align="center"> 
           <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
       </div>
     <% } %>  
  </form>
</body>

<% if ("CLOSE".equals(request.getAttribute("ACT"))){ %>
<script type="text/javascript">
	window.opener.location =  window.opener.location;
 	cerrarVentana();	  
</script>
<% } %>

</HTML>
