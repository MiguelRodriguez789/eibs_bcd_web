<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" 	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="idData" class="datapro.eibs.beans.IdentificationData" scope="request" />
<html>
  <head>
    <title>Cliente Nuevo
    </title>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
      <link href="<%=request.getContextPath()%>/pages/style.css" 	rel="stylesheet">
      <script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script> 
      <script src="<%=request.getContextPath()%>/pages/s/javascripts/idTools.js"> </script>
      <script type="text/javascript">
        $(document).ready(function(){
          $("#TIDL" ).change(function(){
            var l = $("#TIDL" ).val() ;
            l = l == ""?15:l;
            $("#XXIDN0" ).attr('maxlength', l );
            $("#XXIDN0" ).val( $("#XXIDN0" ).val().substring(0, l)  );
          }
                            );
        }
                         );
        function toggleActEmp( visible ){
        	if(isValidObject(getElement("actEmp"))){
        		
	          var holderDiv = document.getElementById("actEmp");
	          if( visible == true ){
	            holderDiv.style.display = "block";
	          }
	          else {
	            holderDiv.style.display = "none";
	          }
        	}
        }
        function modIdF( event ){
          console.log("test");
          var typeF = $( "#XX" + fieldDesc );
          var tEl =   $( "#"   + fieldDesc ) ;
          tEl.off("keypress");
          if( typeF.val() == "N" ){
            tEl.keypress( enterInteger );
          }
        }
        

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
	               },
	               
	               error: function(xhr,status,error){
	               }
		});
	}
});
<% } %>
        
      </script>
      </head>
    <body bgcolor="#FFFFFF">
      <h3 align="center">Nueva Entidad
        <img
             src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_enter_new, ESD2080">
      </h3>
      <hr size="4">
      <form name="forma" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD2080">
        <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="400">
          <% if (currUser.getE01INT().equals("05")) {   // Colombia %>
            <h4 align="center">Ingrese País, Tipo de Entidad, Tipo de Identificación e Identificación.
            </h4>
            <% } else if (currUser.getH01WK3().equals("N")){ %>
              <h4 align="center">Ingrese el Número de Entidad o de Identificaciòn.
              </h4>
              <% } else { %>
                <h4 align="center">Ingrese la Identificación de la Entidad.
                </h4>
                <% } %>
                  <p>&nbsp;
                  </p>
                  <table class="tableinfo">
                    <tr>
                      <td nowrap>
                        <table cellspacing="0" cellpadding="2" width="100%" border="0">
                          <tr id="trdark">
                            <td nowrap align="right" valign="middle" width="15%">Pa&iacute;s :
                            </td>
                            <td nowrap colspan="3">
                              <INPUT TYPE=HIDDEN NAME="INT" value=""> 
                                <INPUT TYPE="text" NAME="COUNTRY" ID="COUNTRY" size="3" maxlength="3" value="<%= idData.getCountry() %>"  
                                       onfocus="showIdFields(this.value, getElementChecked('TYPE').value);" 
                                       onblur="showIdFields(this.value, getElementChecked('TYPE').value);">  
                                  <INPUT TYPE="text" NAME="COUNTRYDSC" value="<%=idData.getCountryDescription()%>" size="40" maxlength="35" 
                                         onfocus="showIdFields(document.forms[0].COUNTRY.value, getElementChecked('TYPE').value);" readonly="readonly">
                                    <a href="javascript:GetCodeDescCNOFC('COUNTRY','COUNTRYDSC','03')" id="countryhelp">
                                      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
                                    </a>
                                    <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom">	
                                    </td>
                                  </tr>
                                <tr id="trclear">
                                  <td nowrap align="right" valign="middle"  >Tipo de Entidad :
                                  </td>
                                  <td nowrap colspan="3">
                                    <% boolean isChecked = false; %> 
                                        <label for="pers" >
                                            <input type="radio" id="pers" name="TYPE" value="PERSONAL" checked="checked" 
                                            onclick="showIdFields(document.forms[0].COUNTRY.value, this.value);toggleActEmp(true);" >
											<% if(! currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MEX"))){ %>	
                                            	Personas Naturales
											<% } else { %> 
                                           		Física
											<% } %>
                                  		</label>
                                        <% isChecked = isChecked || idData.isLegalType("CORPORATIVE"); %>
                                          <label for="corp" >
                                            <input type="radio" id="corp" name="TYPE" value="CORPORATIVE" 
                                                   <%= idData.isLegalType("CORPORATIVE") ? "checked" : "" %> 
                                            onclick="showIdFields(document.forms[0].COUNTRY.value, this.value);toggleActEmp(false);" >
                                         <% if(! currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MEX"))){ %>	
                                         	   Empresa 
                                           <% } else { %> 
                                           		Moral
                                           <% } %>	                                            
                                          </label>
                                        <% isChecked = isChecked || idData.isLegalType("OTHER"); %>
                                      <label for="other" >
                                        <input type="radio" id="other" name="TYPE" value="OTHER" 
                                               <%= idData.isLegalType("OTHER") ? "checked" : "" %> 
                                        onclick="showIdFields(document.forms[0].COUNTRY.value, this.value);toggleActEmp(false);" >Otro
                                      </label>
                                      <% isChecked = isChecked || idData.isLegalType("BOTH"); %>
                                        <label for="corppers" style="display:<%= currUser.getE01INT().equals("07") ? "inline" : "none" %>;">
                                          <input id="corppers" type="radio" name="TYPE" value="BOTH" 
                                                 <%= idData.isLegalType("BOTH") ? "checked" : "" %> 
                                          onclick="showIdFields(document.forms[0].COUNTRY.value, this.value);toggleActEmp(false);" >Moral NT
                                        </label>
                                          </td>
                                        </tr>
                                      <tr id="trdark">
                                        <td nowrap align="right" >Tipo Identificaci&oacute;n : 
                                        </td> 
                                        <td nowrap align="left" width="30%">
                                          <input type="text" name="TID" id="TID" value="<%= idData.getType() %>" maxlength="4" size="5" readonly="readonly" >
                                          <input type="hidden" name="TIDL" id="TIDL"  />
                                          <a href="javascript:GetIdTypesCNOFC('34', 'TID', 'XXIDN0' )" >
                                            <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" >
                                          </a>
                                          <%-- 
                                               <a href="javascript:GetCodeDescCNOFC('TID','','34')"> 
                                          <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ." align="top" border="0">
                                      </a>
                                      --%> 
                                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      Identificaci&oacute;n:
                                      <jsp:include page="ESD0080_client_id_template.jsp?country=${requestScope.idData.country}&legalType=${requestScope.idData.legalType}" flush="true"/>
                                      </td> 
                                    <%-- 		
                                         <td nowrap align="right" valign="middle"  >Identificaci&oacute;n: 
                                  </td>
                                  <td nowrap align="left" valign="middle"  >
                                    <jsp:include page="ESD2080_client_id_template.jsp" flush="true">
                                      <jsp:param name="country" value="<%= idData.getCountry() %>" />
                                      <jsp:param name="legalType" value="<%= idData.getLegalType() %>" />
                                    </jsp:include>
                                  </td>
                                  --%>
                                </tr>
                                </table>
                            </td>
                          </tr>
                        </table>
                        <% 	if (currUser.getH01WK3().equals("N")) { // Non Automatic Number Generation %>
                          <h4 align="right">Con Número de Cliente
                          </h4>
                          <table cellspacing="0" cellpadding="2" width="100%" border="0">
                            <tr id="trdark">
                              <td nowrap align="right" valign="middle" width="30%">Número de Cliente :
                              </td>
                              <td nowrap align="left" valign="middle" colspan="2">
                                <input type="text" name="CUN" id="CUN" value="0" maxlength="10" size="11" onKeypress="enterInteger(event)">
                              </td>
                            </tr>
                            <% } %>
                              </table>
                            <br>
                            <%
                              if (error.getERWRNG().equals("Y")) {
							%>                            
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
                              <tr bgcolor="#FFFFFF"> 
                                <td width="33%" align="center"> 
                                  <input type="checkbox" name="WK2" id="WK2" value="1" >Aceptar con Avisos
                                </td>
                              </tr>
                            </table>
                            <% } %>
                            <p align="center">
                              <input id="EIBSBTN" type=submit name="Submit" value="Enviar" onclick="window.submitted=true">
                            </p>
                            </form>
                          <SCRIPT type="text/javascript">;
                            <%
                              if (!error.getERRNUM().equals("0")) {
                                error.setERRNUM("0");
                                %>
                                  showErrors();
                                <% 	
                              }
                                  %>
                                    getElementChecked('TYPE').click();
                                addEvent(document.getElementById('COUNTRY'), 'change', function(){
                                  if(mapCountryCode(document.getElementById('COUNTRY').value) == '07'){
                                    document.getElementById('corppers').style.display='inline';
                                  }
                                  else {
                                    document.getElementById('corppers').style.display='none';
                                  }
                                }
                                        );
                          </SCRIPT>
                          </body>
                    </html>
