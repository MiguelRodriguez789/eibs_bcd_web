<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.util.logging.*"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.services.*"%>
<%@page import="com.datapro.constants.*"%>
<%@page import="datapro.eibs.beans.*"%>
<%@page import="datapro.eibs.master.*"%>
<%@page import="com.datapro.eibs.constants.*"%>

<html>
<head>
<title>Informacion Basica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<SCRIPT type="text/javascript">


var	COBchg = function(firstTime){
				var lugarCNOFC = $( "#E01FC16" ) ;
				var lugarDSC =  $( "#E01LN3");
				
				if(typeof firstTime !== 'boolean'){
					lugarCNOFC.val( "" );
				   	lugarDSC.val( "" );
				}
				if( $(this).val().toUpperCase() == "<%= ISOCodes.getISOCountryCode(currUser.getE01INT() , ISOCodes.EIBS_CODE_TO_ISO_ALFHA_2 ).trim()%>" ){
					lugarDSC.attr( "readonly" , "readonly" ) ;
					$('#lncnofc').show();
				} else {
					$('#lncnofc').hide();
					lugarDSC.attr( "readonly" , "readonly" ) ;
				}
   			};

function fixCSS(){
  
  	<% if( "Y".equals( client.getE01FL6())){ %> 
	   $( "#pep" ).load( "<%= request.getContextPath() %>/pages/s/ESD0080_PEP.jsp?inquiry=true" ); 
	<% } %>
  
  //Call Display Birth Section 
   COBchg.call($("#E01COB" ), true);
   
} 
 

<% 
	String titcli = (client.getE01TYP().equals("U")?"Usuario":"Cliente");
	if (!client.getE01TYP().equals("U")) { %>       
   		builtNewMenu(client_inq_personal_opt);
<% } %>   

  function showFields(val){
	var f = document.getElementById("fatcaFields");
    if(val != 'N' ){
        	f.style.display = '';
        	}	
        else{
        	f.style.display = 'none';
        	document.getElementById("E01DS4").value = "";
        }
     }
     
     function getRadioButtonSelectedValue(ctrl)
    {
      for(i=0;i<ctrl.length;i++)
        if(ctrl[i].checked){
                 showFields(ctrl[i].value);
       }
     }
       
 </SCRIPT>

</head>

<body bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) { 
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW") && !client.getE01TYP().equals("U") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
%>

<h3 align="center">Informaci&oacute;n <%=titcli%> Persona Física<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_inq_personal_basic, ESD0080"  ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  
    <%if( client.getH01SCR().equals("07")){%> 	
		<jsp:include page="ESD0080_ident_template_panama.jsp" flush="true">
			<jsp:param name="messageName" value="client" />
			<jsp:param name="readOnly" value="true" />
			<jsp:param name="title" value="Identificaci&oacute;n" />
			<jsp:param name="suffix" value="01" />
		</jsp:include>
	
	<%} else {%> 
		<jsp:include page="ESD0080_ident_template_generic.jsp" flush="true">
			<jsp:param name="messageName" value="client" />
			<jsp:param name="readOnly" value="true" />
			<jsp:param name="title" value="Identificaci&oacute;n" />
			<jsp:param name="suffix" value="01" />
		</jsp:include>
	<%} %>  
	<br/>
  
  <%int row = 0; %>
  <table border="0" cellspacing="0" cellpadding="0" width="100%" style="background-color: transparent ;">
  	<tr>
  		<td align="left" valign="top"><h4>Datos Persona Física</h4></td>  		
  		<td align="right" valign="top" style="color:red;font-size:12;"><b><%=client.getE01PENDAP()%></b></td>
  		<td width="5%"></td>
  	</tr> 
  </table>
    <div align="left">
      
    <table class="tableinfo" >
      <tr > 
          <td nowrap > 
            <div align="center"> 
              
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                <td nowrap width="32%" align="right"><b>Número de <%=titcli%> :</b></td>
                <td nowrap> 
                  <input type="text" readonly name="E01CUN" id="E01CUN" size="15" value="<%= client.getE01CUN().trim()%>" onKeypress="enterInteger">
                </td>
                <td align="center" valign="top" style="color:red;font-size:12;">
                	<b><%= client.getD01CRT().trim()%></b> 
                </td>
                <td nowrap colspan="1"> 
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="32%"> 
                  <div align="right">Primer Nombre 
                    :</div>
                </td>
                <td nowrap colspan="3"> 
                  <input type="text" readonly name="E01FNA" id="E01FNA" size="35" value="<%= client.getE01FNA().trim()%>">
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="32%" > 
                  <div align="right">Segundo Nombre 
                    :</div>
                </td>
                <td nowrap colspan="3"> 
                  <input type="text" readonly name="E01FN2" id="E01FN2" size="35"  value="<%= client.getE01FN2().trim()%>">
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                <td nowrap width="32%"> 
                  <div align="right">Primer Apellido 
                    :</div>
                </td>
                <td nowrap colspan="3"> 
                  <input type="text" readonly name="E01LN1" id="E01LN1" size="35" value="<%= client.getE01LN1().trim()%>">
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="32%"> 
                  <div align="right">Segundo Apellido 
                    :</div>
                </td>
                <td nowrap colspan="3"> 
                  <input type="text" readonly name="E01LN2" id="E01LN2" size="35"  value="<%= client.getE01LN2().trim()%>">
                </td>
              </tr>
<%--         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap width="32%"> 
                  <div align="right">Apellido de Casada 
                    :</div>
                </td>
                <td nowrap colspan="3"> 
                  <input type="text" readonly name="E01ACA" id="E01ACA" size="35"  value="<%= client.getE01ACA().trim()%>">
                </td>
              </tr> 
--%>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                <td nowrap width="32%" > 
                  <div align="right">Nombre Legal 
                    :</div>
                </td>
                <td nowrap  colspan="3"> 
                  <input type="text" readonly name="E01NA1" id="E01NA1" size="62" value="<%= client.getE01NA1().trim()%>">
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                <td nowrap width="21%" > 
                  <div align="right">Nombre Corto 
                    :</div>
                </td>
                <td nowrap width="23%"> 
                  <input type="text" readonly name="E01SHN" id="E01SHN" size="25" value="<%= client.getE01SHN().trim()%>">
                </td>
				<td colspan="2"></td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%"> 
                  <div align="right">Pagina WEB :</div>
                </td>
                <td nowrap="nowrap" colspan=3> 
                	<eibsinput:text property="E01WEB" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_WEB %>"  readonly="true"/>
                </td>
              </tr>
             
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                <td nowrap> 
                  <div align="right">Genero :</div>
                </td>
                <td nowrap> 
                    <input type="text" readonly name="E01SEX" id="E01SEX" size="13" 
				  value="<% if (client.getE01SEX().equals("F")) { out.print("Femenino"); }
							else if (client.getE01SEX().equals("M")) { out.print("Masculino"); }
							else { out.print(""); } %>" >
                </td>
				<td colspan="2"></td>
        </tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap style="vertical-align: top;" > 
                  <div align="right">Persona Expuesta Políticamente :</div>
                </td>
                <td nowrap colspan="3" > 
	            	<input type="text" readonly size="4" value="<%= "Y".equals( client.getE01FL6().trim() )?"Si":"No" %>" >
					<div id="pep" ></div>
                </td>   
  
        </tr>

        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%" > 
                  <div align="right">Actividad Empresarial :</div>
                </td>
                <td nowrap="nowrap"  width="31%" colspan="3" > 
					<input type="radio" id="pers1" name="E01CFL2" value="1"  <%=client.getE01CFL2().equals("1")?"checked=\"checked\"":"" %>  disabled="disabled" > Si
					<input type="radio" id="pers1" name="E01CFL2" value="0"  <%=client.getE01CFL2().equals("0")?"checked=\"checked\"":"" %>  disabled="disabled" > No
                </td>
        </tr>   

        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                <td nowrap> 
                  <div align="right">Estado Civil :</div>
                </td>
                <td nowrap colspan="3"> 
                  <input type="text" readonly name="E01MST" id="E01MST" size="15" 
                  value="<% if (client.getE01MST().equals("1")) { out.print("Soltero(a)"); }
							else if (client.getE01MST().equals("2")) { out.print("Casado(a)"); }
	                    	else if (client.getE01MST().equals("3")) { out.print("Divorciado(a)"); }
							else if (client.getE01MST().equals("4")) { out.print("Viudo(a)"); }
							else if (client.getE01MST().equals("5")) { out.print("Union Libre"); }
							else if (client.getE01MST().equals("6")) { out.print("Otro"); }
							else { out.print(""); } %>" >
                </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                <td nowrap> 
                  <div align="right"> Dependientes :</div>
                </td>
                <td nowrap colspan="3"> 
                  <input type="text" readonly name="E01NSO" id="E01NSO" size="4" value="<%= client.getE01NSO().trim()%>">
                </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap> 
              <div align="right">Pa&iacute;s de Residencia :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="D01GEC" id="D01GEC" size="55" value="<%= client.getD01GEC().trim()%>">
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                <td nowrap> 
                  <div align="right">País de Nacionalidad :</div>
                </td>
                <td nowrap colspan="3"> 
                  <input type="text" readonly name="D01CCS" id="D01CCS" size="55" value="<%= client.getD01CCS().trim()%>">
                </td>
              </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Nivel de Educaci&oacute;n :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="D01EDL" id="D01EDL" size="55" value="<%= client.getD01EDL().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap>
              <div align="right">Profesi&oacute;n/Ocupaci&oacute;n :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="D01UC9" id="D01UC9" size="55" value="<%= client.getD01UC9().trim()%>">
            </td>
          </tr>
      <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){%>    
			<tr id="RFC1" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= client.getE01CCS().trim().equals("MX") ? "" : "none"%>">
	            <td nowrap="nowrap" width="20%" align="right">RFC :</td>
	            <td nowrap="nowrap" width="30%" colspan="3" > 
	            	<eibsinput:text name="client" property="E01RFC01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="4" readonly="true" />
	            	<eibsinput:text name="client" property="E01RFC02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6" readonly="true"  />
	            	<eibsinput:text name="client" property="E01RFC03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2" readonly="true"  />
	            	<eibsinput:text name="client" property="E01RFC04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1" readonly="true"  />

	 	        </td>
	        </tr>
	        
			<tr id="RFC2" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= client.getE01CCS().trim().equals("MX") ? "" : "none"%>">
	            <td nowrap="nowrap" width="20%" align="right">CURP :</td>
	            <td nowrap="nowrap" width="30%" colspan="3" >
	            	<eibsinput:text name="client" property="E01CURP1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="4" readonly="true"  />
	            	<eibsinput:text name="client" property="E01CURP2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6" readonly="true"  />
	            	<eibsinput:text name="client" property="E01CURP3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1" readonly="true"  />
	            	<eibsinput:text name="client" property="E01CURP4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2" readonly="true"  />
	            	<eibsinput:text name="client" property="E01CURP5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1" readonly="true"  />
	            	<eibsinput:text name="client" property="E01CURP6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1" readonly="true"  />
	            	<eibsinput:text name="client" property="E01CURP7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1" readonly="true"  />
	            	<eibsinput:text name="client" property="E01CURP8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2" readonly="true"  />
	            	
	 	        </td>
	        </tr> 
        <% } %>  
         <tr id="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>" > 
            <td nowrap width="32%" > 
              <div align="right">Mas de una Nacionalidad? :</div>
            </td>
            <td nowrap colspan="3">
            <% boolean chk = !(client.getE01UF10().trim().equals("0") || client.getE01UF10().trim().equals(""));  %>
              <input type="checkbox" name="E01UF10" id="E01UF10" <%=chk? "checked='Checked'" : "" %> readonly="readonly"  /> 
            </td>
         </tr>          

         <tr id="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>" > 
            <td nowrap width="32%" > 
              <div align="right">Nacionalidad 1 :</div>
            </td>
            <td nowrap >
              <eibsinput:text property="E01FC19" name="client" type="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" readonly="true"  />
            </td>
            <td nowrap width="32%" > 
              <div align="right">Nacionalidad 2 :</div>
            </td>
            <td nowrap >
              <eibsinput:text property="E01FC20" name="client" type="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" readonly="true"  />
            </td>
         </tr>       
         
		<tr id="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>" > 
	            <td nowrap width="32%" > 
	              <div align="right">Identificación Federal de USA :</div>
	            </td>
	            <td nowrap colspan="3" >
	              <eibsinput:text property="E01FIDU" name="client" type="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="20" maxlength="15" readonly="true"  />
	            </td>
	    </tr>          
          
            </table>
            
          </div>
          </td>
        </tr>
      </table>
    
  </div>
   
  <h4>Fechas</h4>
    
  <table class="tableinfo">
    <tr> 
        <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              
              <td nowrap align="right">Fecha Diligenciamiento :</td>
              <td nowrap> 
                <eibsinput:date name="client" fn_year="E01IDY" fn_month="E01IDM" fn_day="E01IDD" readonly="true"/>
              </td>
              <td nowrap align="right">País de Nacimiento :</td>
              <td nowrap> 
              		<eibsinput:text property="E01COB" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" readonly="true"  />
              </td>
            </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap align="right">Fecha de Nacimiento :</td>
              <td nowrap> 
                <eibsinput:date name="client" fn_year="E01BDY" fn_month="E01BDM" fn_day="E01BDD" readonly="true" modified="Y"/> 
              </td>
              <td nowrap align="right">Lugar de Nacimiento :</td>
              <td nowrap> 
              	<input type="text" name="E01LN3"  id="E01LN3"  size="36" readonly="readonly" value="<%= client.getE01LN3().trim()%>">
              </td>
        </tr>
        
          </table>
        </td>
      </tr>
    </table>
    
    
   <div  id="address01"  class="print">
	        <% 	
			    String country =  client.getField("E01CUMADC").toString().trim();
	        	String pageName = DataAddress.getTemplatePage(request, ISOCodes.getIBSCountryCode(country.trim()), client);
	        	Logger.getLogger(this.getClass().getName()).log(Level.FINE, "Using template: " + pageName);
	        %>
	<jsp:include page="<%= pageName %>" flush="true">
		<jsp:param name="index" value="01" />
		<jsp:param name="suffix" value="E01CUM" />
		<jsp:param name="title" value="Direcci&oacute;n" />
		<jsp:param name="messageName"  value="client" />
		<jsp:param name="readOnly"  value="true" />
		<jsp:param name="basic"  value="true" />
		<jsp:param name="simple" value="false" />
		<jsp:param name="showWeb" value="false" />
	</jsp:include>
   </div>
  <div class="print">
  <h4>Tel&eacute;fonos</h4>
    
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Tel&eacute;fono Casa :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E01HPN" id="E01HPN" size="16" value="<%= client.getE01HPN().trim()%>">
             </td>
            <td nowrap width="20%"> 
              <div align="right">Tel&eacute;fono Oficina :</div>
            </td>
            <td nowrap width="30%"> 
              <input type="text" readonly name="E01PHN" id="E01PHN" size="11" value="<%= client.getE01PHN().trim()%>" >
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%" > 
              <div align="right">Tel&eacute;fono Fax :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly name="E01FAX" id="E01FAX" size="11" value="<%= client.getE01FAX().trim()%>">
            </td>
            <td nowrap width="20%" > 
              <div align="right">Tel&eacute;fono Celular :</div>
            </td>
            <td nowrap width="30%" > 
              <input type="text" readonly name="E01PH1" id="E01PH1" size="16" value="<%= client.getE01PH1().trim()%>"> 
            </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>
  </div>
  
  <h4>Datos Financieros</h4>
    
  <table class="tableinfo">
  <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Estado Laboral :</div>
			</td>
            <td nowrap width="30%" colspan="2">
			<input type="text" readonly name="E01INL" id="E01INL" size="13" 
				  value="<% if (client.getE01INL().equals("1")) { out.print("Empleado");  }	
							else if (client.getE01INL().equals("2")) { out.print("Pensionado"); }
							else { out.print(""); } %> " >
            </td>
            <td nowrap > 
              <div align="right">Frecuencia de Ingresos :</div>
            </td>
            <td nowrap colspan="3">
            <input type="text" readonly name="E01SAT" id="E01SAT" size="13" 
				  value="<% if (client.getE01SAT().equals("W")) { out.print("Semanal");  }	
							else if (client.getE01SAT().equals("B")) { out.print("Quincenal"); }
							else if (client.getE01SAT().equals("M")) { out.print("Mensual"); }
							else if (client.getE01SAT().equals("S")) { out.print("Semestral"); }
							else if (client.getE01SAT().equals("Y")) { out.print("Anual"); }
							else { out.print(""); } %> " >
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="20%"> 
              <div align="right">Ingresos Brutos :</div>
			</td>
            <td nowrap width="10%">
			  <eibsinput:text property="E01CAI" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01CAI"/>
            </td> 
            <td nowrap width="15%">
            	<%= client.getD01SOI() %>
            </td> 
            <td nowrap width="20%"> 
              <div align="right">Egresos :</div>
			</td>
            <td nowrap width="30%">
			  <eibsinput:text property="E01EOX" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01EOX"/>
            </td> 
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Otros Ingresos :</div>
			</td>
            <td nowrap>
			  <eibsinput:text property="E01CAS" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01CAS"/>
            </td> 
            <td nowrap>
              <%= client.getD01ORI() %>
            </td> 
            <td nowrap > 
              <div align="right">Otros Egresos :</div>
            </td>
            <td nowrap>
				<eibsinput:text name="client" property="E01AM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01AM4"/>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right">Patrimonio Neto :</div>
			</td>
            <td nowrap colspan="2">
			  <eibsinput:text property="E01CAP" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01CAP"/>
            </td>
			<td nowrap> 
              <div align="right">Egreso en Educación :</div>
            </td>
            <td nowrap>
                 <eibsinput:text name="client" property="E01AM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01AM3"/>
			 </td>
          </tr>
          
        <% if( client.getE01CFL2().equals("1") ){ %>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap"> 
              <div align="right">Ventas o Ingresos Netos :</div>
			</td>
            <td nowrap="nowrap" colspan="3">
			  <eibsinput:text property="E01AM5" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" modified="F01AM5"  /> 
            </td>

        </tr>
        <% } %>
          
        </table>
      </td>
    </tr>
  </table>
<div  class="print">
  <h4>C&oacute;digos de Clasificaci&oacute;n</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%"> 
              <div align="right">Oficial Principal :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" readonly name="E01OFC" id="E01OFC" size="5" value="<%= client.getE01OFC().trim()%>">
              <input type="text" readonly name="D01OFC" id="D01OFC" size="55" value="<%= client.getD01OFC().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "10") %> :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" readonly name="E01OF2" id="E01OF2" size="5" value="<%= client.getE01OF2().trim()%>">
              <input type="text" readonly name="D01OF2" id="D01OF2" size="55" value="<%= client.getD01OF2().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" readonly name="E01INC" id="E01INC" size="5" value="<%= client.getE01INC().trim()%>">
              <input type="text" readonly name="D01INC" id="D01INC" size="55" value="<%= client.getD01INC().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" readonly name="E01BUC" id="E01BUC" size="5"  value="<%= client.getE01BUC().trim()%>">
              <input type="text" readonly name="D01BUC" id="D01BUC" size="55" value="<%= client.getD01BUC().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1A") %> :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" readonly name="E01UC1" id="E01UC1" size="5" value="<%= client.getE01UC1().trim()%>">
              <input type="text" readonly name="D01UC1" id="D01UC1" size="55" value="<%= client.getD01UC1().trim()%>">
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1B") %> :</div>
            </td>
            <td nowrap width="70%"> 
              <input type="text" readonly name="E01UC2" id="E01UC2" size="5" value="<%= client.getE01UC2().trim()%>">
              <input type="text" readonly name="D01UC2" id="D01UC2" size="55" value="<%= client.getD01UC2().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap  width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1C") %> :</div>
            </td>
            <td nowrap  width="70%"> 
              <input type="text" readonly name="E01UC3" id="E01UC3" size="5" value="<%= client.getE01UC3().trim()%>">
              <input type="text" readonly name="D01UC3" id="D01UC3" size="55" value="<%= client.getD01UC3().trim()%>">
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1D") %> :</div>
            </td>
            <td nowrap  width="70%"> 
              <input type="text" readonly name="E01UC4" id="E01UC4" size="5" value="<%= client.getE01UC4().trim()%>">
              <input type="text" readonly name="D01UC4" id="D01UC4" size="55" value="<%= client.getD01UC4().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1E") %> :</div>
            </td>
            <td nowrap  width="70%"> 
              <input type="text" readonly name="E01UC5" id="E01UC5" size="5" value="<%= client.getE01UC5().trim()%>">
              <input type="text" readonly name="D01UC5" id="D01UC5" size="55" value="<%= client.getD01UC5().trim()%>">
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="30%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1F") %> :</div>
            </td>
            <td nowrap  width="70%"> 
              <input type="text" readonly name="E01UC6" id="E01UC6" size="5" value="<%= client.getE01UC6().trim()%>">
              <input type="text" readonly name="D01UC6" id="D01UC6" size="55" value="<%= client.getD01UC6().trim()%>">
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>
</div>
<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showFatca"))) {%>  
<h4>Fatca</h4>
<table class="tableinfo">
      <tr> 
        <td nowrap="nowrap"> 
<table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
       <td nowrap="nowrap" width="20%"> 
		<div align="right">Nacionalidad Estadounidense :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
			<INPUT type="radio" name="F01L08" disabled="disabled" value="C" <% if (client.getF01L08().equals("C")) out.print("checked"); %>> Ciudadano Estadounidense 
			<INPUT type="radio" name="F01L08" disabled="disabled" value="R" <% if (client.getF01L08().equals("R")) out.print("checked"); %>> Residente Estadounidense 
			<INPUT type="radio" name="F01L08" disabled="disabled" value="N" <% if (!client.getF01L08().equals("C") && !client.getF01L08().equals("R")) out.print("checked"); %>> Ninguno
		</td>
		<td></td>
		<td></td>
	<tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF01L08().equals("C") && !client.getF01L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
		<div align="right">Autoriza FATCA Reporting (N/Y) :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
		<p align="left">
		<INPUT type="radio" name="F01L09" id="F01L09" disabled="disabled" value="Y" <% if (client.getF01L09().equals("Y")) out.print("checked"); %>>Si 
		<INPUT type="radio" name="F01L09" id="F01L09" disabled="disabled" value="N" 	<% if (client.getF01L09().equals("N")) out.print("checked"); %>	<% if (client.getF01L09().equals("")) out.print("checked"); %>>No</p>
		</td>
	</tr>
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF01L08().equals("C") && !client.getF01L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
			<div align="right">Identificación Federal de USA :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
			<eibsinput:text property="E01FIDU" readonly="true" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  />
		</td>
	</tr>
<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showFatcaExpiration"))) {%>  
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF01L08().equals("C") && !client.getF01L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
			<div align="right">Fecha de Vencimiento(Fatca) :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
			<eibsinput:date name="client" fn_day="E01CUFD2D" fn_month="E01CUFD2M" fn_year="E01CUFD2Y" readonly="true"/>
		</td>
	</tr>	
<% } %>	
</table>
</td>
</tr>
</table>
<% } %>
   

   <div  class="print">
   <h4>Datos Operativos</h4>
    
	<table cellspacing="0" cellpadding="2" width="100%" border="1" bordercolor="#000000" bgcolor="#FFFFFF" >
    <tr bordercolor="#FFFFFF"> 
        <td nowrap >
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">

        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
        	<td nowrap width="20%" align="right">Estado del Cliente :</td>
            <td nowrap width="30%"> 
            	<input type="text" readonly name="E01STS" id="E01STS" size="25" 
			  value="<% if (client.getE01STS().equals("1")) { out.print("Inactivo"); }
					  	else if (client.getE01STS().equals("2")) { out.print("Activo");  }
						else if (client.getE01STS().equals("3")) { out.print("Lista de Control"); }
						else if (client.getE01STS().equals("4")) { out.print("Fallecido"); }
						else if (client.getE01STS().equals("5")) { out.print("Bloqueo Permite Pagos"); }
						else if (client.getE01STS().equals("6")) { out.print("Bloqueo Total"); }
						else { out.print(""); } %> " >
            </td>
            <td nowrap width="15%" align="right">Clase de Cliente :</td>
            <td nowrap width="35%"> 
              	<input type="text" readonly name="D01CCL" id="D01CCL" size="45" value="<%= client.getD01CCL().trim()%>">
            </td>
        </tr>
        
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%" align="right">Tipo de Cliente :</td>
            <td nowrap width="30%" > 
              <input type="text" readonly name="E01TYP" id="E01TYP" size="10" 
			  value="<% if (client.getE01TYP().equals("R")) { out.print("Regular"); }
						else if (client.getE01TYP().equals("M")) { out.print("Master"); }	
						else if (client.getE01TYP().equals("G")) { out.print("Grupo"); }
						else { out.print("Grupo"); } %>" >
			</td>
            <td nowrap width="15%" align="right">No. de Grupo :</td>
            <td nowrap width="35%" > 
              <input type="text" readonly name="E01GRP" id="E01GRP" size="10" value="<%= client.getE01GRP().trim()%>">
            </td>
        </tr>

        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap width="20%" align="right">Idioma :</td>
           	<td nowrap width="30%"> 
           		<input type="text" readonly name="E01LIF" id="E01LIF" size="10" 
			  		value="<% if (client.getE01LIF().equals("S")) { out.print("Espa&ntilde;ol"); }
						else if (client.getE01LIF().equals("E")) { out.print("Ingl&eacute;s"); }
						else { out.print(""); } %>" >
			</td>
           	<td nowrap width="15%" align="right">Forma Calificaci&oacute;n</td>
           	<td width="35%"> 
           		<input type="text" readonly name="E01FL2" id="E01FL2" size="3" value="<%= client.getE01FL2().trim()%>">
           	</td>
        </tr>

        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="20%" align="right">Impuestos :</td>
            <td nowrap width="30%"> 
				<input type="radio" name="E01TAX" value="1" <%if (client.getE01TAX().equals("1")) out.print("checked"); %> disabled="disabled"> Si 
				<input type="radio" name="E01TAX" value="N" <%if (client.getE01TAX().equals("N")) out.print("checked"); %> disabled="disabled"> No
            </td>
            <td nowrap width="15%" align="right">Tabla de Provisi&oacute;n :</td>
            <td nowrap width="35%">
                <input type="text" name="E01PRV" id="E01PRV" size="4" readonly value="<%= client.getE01PRV().trim()%>">
            </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Nivel de Riesgo :</div>
            </td>
            <td nowrap> 
             <%--  <input type="text" readonly name="E01RSL" id="E01RSL" size="5" value="<%= client.getE01RSL().trim()%>"> --%>
              <input type="text" readonly name="D01RSL" id="D01RSL" size="26" value="<%= client.getD01RSL().trim()%>">
            </td>
             <td nowrap width="15%"> 
              <div align="right">Nivel de Consulta :</div>
              </td>
              
            <td nowrap width="35%"> 
              <input type="text" readonly name="E01ILV" id="E01ILV" size="4" value="<%= client.getE01ILV().trim()%>">
              </td>
		</tr>
	<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showRiskExpiration"))) {%>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right">Fecha de Vencimiento (Riesgo) :</div>
            </td>
            <td nowrap> 
            	<eibsinput:date name="client" fn_month="E01CUFD1M" fn_day="E01CUFD1D" fn_year="E01CUFD1Y" readonly="true" />
            </td>
             <td nowrap width="15%"> </td>
            <td nowrap width="35%"></td>
		</tr>
	<% } %>	
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              
            <td nowrap width="20%"> 
              <div align="right">Fuente :</div>
              </td>
              
            <td nowrap  width="30%"> 
               <%
              	boolean bTesoreria = (client.getE01FL8().indexOf("T") > -1);
              	boolean bFideicomiso = (client.getE01FL8().indexOf("F") > -1);
              	boolean bFEM = (client.getE01FL8().indexOf("E") > -1);
              	boolean bTerceros = (client.getE01FL8().indexOf("R") > -1);
              %>
              <INPUT type="hidden" disabled name="E01FL8_TES" id="E01FL8_TES" value="1" <% if (bTesoreria == true) out.print("checked"); %> >
              <INPUT type="hidden" disabled name="E01FL8_FID" id="E01FL8_FID" value="1" <% if (bFideicomiso == true) out.print("checked"); %> >
              <INPUT type="hidden" disabled name="E01FL8_FEM" id="E01FL8_FEM" value="1" <% if (bFEM == true) out.print("checked"); %> >
              <INPUT type="hidden" disabled name="E01FL8_TER" id="E01FL8_TER" value="1" <% if (bTerceros == true) out.print("checked"); %> >
              
              <%if(bTesoreria){ %>
              	<input type="text" readonly name="FL8DSC" id="FL8DSC" value="Tesoreria">
              <% } else if (bFideicomiso){ %>
              	<input type="text" readonly name="FL8DSC" id="FL8DSC" value="Fideicomiso">
              <% } else if (bFEM){ %>
              	<input type="text" readonly name="FL8DSC" id="FL8DSC" value="FEM">
              <% } else if (bTerceros){ %>
              	<input type="text" readonly name="FL8DSC" id="FL8DSC" value="Terceros">
			  <% } else {%>
				<input type="text" readonly name="FL8DSC" id="FL8DSC" value="">
			  <% } %>              
             </td>
             
            <td nowrap> 
              <div align="right">Rel. con el Banco :</div>
              </td>
            <td nowrap> 
              <input type="text" readonly name="E01STF" id="E01STF" size="20" 
              			  value="<% if (client.getE01STF().trim().equals("1")) { out.print("Cliente Regular"); }
						else if (client.getE01STF().trim().equals("2")) { out.print("Especial"); }	
						else if (client.getE01STF().trim().equals("3")) { out.print("Empleado"); }
						else if (client.getE01STF().trim().equals("4")) { out.print("Funcionario"); }
						else if (client.getE01STF().trim().equals("5")) { out.print("Director"); }
						else if (client.getE01STF().trim().equals("6")) { out.print("Pariente"); }
						else if (client.getE01STF().trim().equals("7")) { out.print("Empresa Afiliada"); }
						else if (client.getE01STF().trim().equals("8")) { out.print("Junta Directiva"); }
						else if (client.getE01STF().trim().equals("9")) { out.print("Banco Corresponsal"); }
						else { out.print("Ninguna"); } %>" >
            </td>
              
            </tr>   

          </table>
        </td>
      </tr>

    </table>
 </div>
   <div  class="print">
    <h4>Datos Adicionales</h4>
    
  <table class="tableinfo" >
    <tr > 
        <td nowrap >
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="20%"> 
                <div align="right">Referido por :</div>
              </td>
              <td nowrap  width="30%">  
                <input type="text" readonly name="E01RBY" size="5" maxlength="4" value="<%= client.getE01RBY().trim()%>">
                <input type="text" readonly name="E01RBN" size="45" maxlength="45" value="<%= client.getE01RBN().trim()%>">
              </td>
              <td nowrap  width="20%"> 
                <div align="right">Tipo de Rel. Familiar :</div>
              </td>
              <td nowrap width="30%">  
                <input type="text" name="E02FL3" readonly size="20" 
              		value="<% if (client.getE01FL3().equals("1")) { out.print("Ninguno"); }
						else if (client.getE01FL3().equals("2")) { out.print("Primo(a)"); }
						else if (client.getE01FL3().equals("3")) { out.print("Padre"); }
						else if (client.getE01FL3().equals("4")) { out.print("Madre"); }
               			else if (client.getE01FL3().equals("5")) { out.print("Hermano(a)"); }
						else if (client.getE01FL3().equals("6")) { out.print("Esposo(a)"); }
               			else if (client.getE01FL3().equals("7")) { out.print("Abuelo(a)"); }
						else { out.print(""); } %>" >
              </td>
            </tr>  
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap> 
              <div align="right">Convenio :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" readonly name="E01CCO" id="E01CCO" size="5" maxlength="4" value="<%= client.getE01CCO().trim()%>">
              <input type="text" readonly name="D01CCO" id="D01CCO" size="35" value="<%= client.getD01CCO().trim()%>">
            </td>
          </tr>

          </table>
        </td>
      </tr>
    </table>
    </div>
	<div align="center"> 
		<input id="PRINTBTN" class="EIBSBTN" type=button name="Submit" OnClick="doPrint()" value="Imprimir">
	</div>
</form>

<script type="text/javascript">
$(document).ready(function(){
	//readOnlyPage();
    fixCSS();
}); 
</script> 

<script type="text/javascript">
function doPrint(){
	document.getElementById('PRINTBTN').style.visibility = 'hidden';
    window.focus();
	if (document.queryCommandSupported("print")) {
		document.execCommand('print', false, null);
    } else {
		window.print();
	}
	document.getElementById('PRINTBTN').style.visibility = 'visible';
	return;
}
</script>


</body>
</html>

