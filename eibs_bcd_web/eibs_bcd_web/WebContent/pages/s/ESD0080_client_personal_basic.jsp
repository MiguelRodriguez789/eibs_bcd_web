<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.util.logging.*"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.beans.*"%>
<%@page import="datapro.eibs.master.*"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
 
<html>
<head>
<title>Informacion Basica</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% //Java Variable
   String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" title=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";

// FOR CUSTOMER ADDRESS FORMAT CHANGE VIA AJAX THERE IS NO FIELD TO STORE THE ADDRESS COUNTRY CODE IN ESD008001 
   String country =  !client.getField("E01CUMADC").toString().trim().equals("") ? client.getField("E01CUMADC").toString().trim()
   										: client.getField("E01PID").toString().trim().equals("") ? client.getField("E01GEC").toString() : client.getField("E01PID").toString().trim(); 
%>
 

<%
 if ( !userPO.getPurpose().equals("NEW")) {
%> 

   <SCRIPT type="text/javascript">
   function showFields(val){
	var f = $("[name=fatcaRow]");
    if(isValidObject(f)){
	    if(val != 'N' ){
	        	f.css("display", "table-row");
		} else {
			f.css("display", "none");
			getElement("E01FIDU").value = "";
	    }
    }
   }
     
     function getRadioButtonSelectedValue(ctrl){
      for(i=0;i<ctrl.length;i++)
        if(ctrl[i].checked){
                 showFields(ctrl[i].value);
       }
     }
     builtNewMenu(client_personal_opt);
</SCRIPT>

<%
}
%>

</head>

<body bgcolor="#FFFFFF">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
      out.println("</SCRIPT>");
 }
 if ( !userPO.getPurpose().equals("NEW")) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
 
%>

<h3 align="center">Informaci&oacute;n Cliente Persona Física<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_personal_basic, ESD0080"  ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="APPROVAL" id="APPROVAL" VALUE="N">
  <input type="hidden" name="E01LGT" id="E01LGT" size="15" maxlength="10" value="<%= client.getE01LGT().trim()%>">

	<%	
    	String pageIdName = "ESD0080_ident_template_generic.jsp";
    	if(client.getH01SCR().equals("07")){
    		pageIdName = "ESD0080_ident_template_panama.jsp";
    	}
	%> 
		<jsp:include page="<%= pageIdName %>" flush="true">
			<jsp:param name="messageName" value="client" />
			<jsp:param name="readOnly"  value="false" /> 
			<jsp:param name="title" value="Identificaci&oacute;n" />
			<jsp:param name="suffix"  value="01" />
			<jsp:param name="basic" value="true" />
		</jsp:include>
    
    <%int row = 1; %> 
  <h4>Datos Persona Física</h4>
    <div align="left">		
    <table class="tableinfo" >
      <tr > 
          <td nowrap="nowrap" > 
            <div align="center"> 
            <table  id="datosTable" cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%"> 
                  <div align="right"><b>Número de Cliente :</b></div>
                </td>
                <td nowrap="nowrap"> 
            		<input type="hidden" name="E01CUN" size="10" maxlength="9" value="<%= client.getE01CUN().trim()%>" >
					<% if (client.getE01CUN().trim().equals("999999999")) out.print("NUEVO CLIENTE"); else out.print(client.getE01CUN().trim()); %> 
                </td>
                <td align="center" valign="top" style="color:red;font-size:12;" colspan="2">
                	<b><%= client.getD01CRT().trim()%></b> 
                </td>  
              </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%"> 
                  <div align="right">Primer Nombre :</div>
                </td>
                <td nowrap="nowrap" colspan=3> 
                	<eibsinput:text property="E01FNA" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" required="true" onkeypress="enterChars(event,letters)"/>
                </td>
              </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%" > 
                  <div align="right">Segundo Nombre :</div>
                </td>
                <td nowrap="nowrap" colspan=3> 
                	<eibsinput:text property="E01FN2" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" onkeypress="enterChars(event,letters)"/>
                </td>
              </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%"> 
                  <div align="right">Primer Apellido :</div>
                </td>
                <td nowrap="nowrap" colspan=3> 
                	<eibsinput:text property="E01LN1" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" required="true" onkeypress="enterChars(event,letters)"/>
                </td>
              </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%"> 
                  <div align="right">Segundo Apellido :</div>
                </td>
                <td nowrap="nowrap" colspan=3> 
                	<eibsinput:text property="E01LN2" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" onkeypress="enterChars(event,letters)"/>
                </td>
              </tr>
<%-- 		<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%"> 
                  <div align="right">Tambi&eacute;n conocida(o) como :</div>
                </td>
                <td nowrap="nowrap" colspan=4> 
					<eibsinput:text property="E01ACA" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30 %>" onkeypress="enterChars(event,letters)"/>
                </td>
              </tr>
               --%>
		<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap="nowrap" width="25%" > 
                  <div align="right">Nombre Legal :</div>
                </td>
                <td nowrap="nowrap" colspan=3> 
                	<eibsinput:text property="E01NA1" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL %>" disabled="true" />
                </td>
              </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%" > 
                  <div align="right">Nombre Corto :</div>
                </td>
                <td nowrap="nowrap" > 
                	<eibsinput:text property="E01SHN" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT %>" disabled="true" />
                </td>
                <td colspan="2"></td>
              </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%"> 
                  <div align="right">Pagina WEB :</div>
                </td>
                <td nowrap="nowrap" colspan=3> 
                	<eibsinput:text property="E01WEB" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_WEB %>" />
                </td>
              </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%" > 
                  <div align="right">Genero :</div>
                </td>
                <td nowrap="nowrap"  width="25%" > 
                  	<p> 
                    <input type="radio" name="E01SEX" id="E01SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %>>
                    Femenino 
                    <input type="radio" name="E01SEX" id="E01SEX" value="M" <%if (!client.getE01SEX().equals("F")) out.print("checked"); %>>
                    Masculino 
                    </p>
                </td>
                <td nowrap="nowrap" width="25%" > 
                  <div align="right">Actividad Empresarial :</div>
                </td>
                <td nowrap="nowrap"  width="25%" > 
                	<input type="hidden" id="pers1" name="E01CFL2" value="<%=client.getE01CFL2() %>"  >
					<input type="radio"  name="E01CFL2R" value="1"  <%=client.getE01CFL2().equals("1")?"checked=\"checked\"":"" %>  disabled="disabled"  > Si
					<input type="radio"  name="E01CFL2R" value="0"  <%=client.getE01CFL2().equals("0")?"checked=\"checked\"":"" %>  disabled="disabled"  > No
                </td>
        </tr>   
        
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                <td nowrap="nowrap" width="25%" > 
                  <div align="right">Estado Civil :</div>
                </td>
                <td nowrap="nowrap" width="25%" > 
                  <select name="E01MST" id="E01MST">
                    <option value=" " <% if (!(client.getE01MST().equals("1")||client.getE01MST().equals("2") || client.getE01MST().equals("3")||client.getE01MST().equals("4")||client.getE01MST().equals("5")||client.getE01MST().equals("6"))) out.print("selected"); %>> 
                    </option>
                    <% if (client.getH01SCR().equals("07")) { %>
                    <option value="1" <% if (client.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (client.getE01MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
					<%} else { %>
                    <option value="1" <% if (client.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (client.getE01MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (client.getE01MST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (client.getE01MST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (client.getE01MST().equals("5")) out.print("selected"); %>>Unión Libre</option>
                    <option value="6" <% if (client.getE01MST().equals("6")) out.print("selected"); %>>Otro</option>
					<% } %>
                  </select>
                  <%=mandatory %>
                </td>
                <td nowrap="nowrap" width="25%" > 
                  <div align="right"> Dependientes :</div>
                </td>
                <td nowrap="nowrap"  width="25%"> 
                	<eibsinput:text property="E01NSO" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="2" />
                </td>
              </tr>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	            <td nowrap="nowrap" width="25%"> 
	              <div align="right">Pa&iacute;s de Residencia 
	                :</div>
	            </td>
	            <td nowrap="nowrap" width="25%"> 
	              <input type="text" name="E01GEC" id="E01GEC" size="5" maxlength="4" value="<%= client.getE01GEC().trim()%>" readonly="readonly" >
	              <input type="hidden" name="E01GECD" id="E01GECD" size="5" value="<%= client.getE01CTR().trim()%>" readonly="readonly" >
				  <a href="javascript:GetCodeDescCNOFC('E01GEC','E01GECD','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
	              <%=mandatory %>
	            </td>
                <td nowrap="nowrap" width="25%" > 
                  <div align="right">País de Nacionalidad :</div>
                </td>
                <td nowrap="nowrap" width="25%" > 
                  <input type="text" name="E01CCS" id="E01CCS" size="6" maxlength="4" value="<%= client.getE01CCS().trim()%>" >
                  <a href="javascript:GetCodeCNOFC('E01CCS','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                  <%=mandatory %>
                </td>
              </tr>
              
	        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
	            <td nowrap="nowrap" width="25%" align="right">Nivel de Educaci&oacute;n :</td>
	            <td nowrap="nowrap" width="25%"> 
	              <input type="text" name="E01EDL" id="E01EDL" size="5" maxlength="4" value="<%= client.getE01EDL().trim()%>">
	                <a href="javascript:GetCodeCNOFC('E01EDL','29')">
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
	 	        </td>
	            <td nowrap="nowrap" width="25%" align="right">Profesi&oacute;n/Ocupaci&oacute;n :</td>
	            <td nowrap="nowrap" width="25%"> 
	              <input type="text" name="E01UC9" id="E01UC9" size="5" maxlength="4" value="<%= client.getE01UC9().trim()%>">
	                <a href="javascript:GetCodeCNOFC('E01UC9','49')">
	                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
	              	<%=mandatory %>
	            </td>
	        </tr>
      <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){%>    
			<tr id="RFC1" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= client.getE01CCS().trim().equals("MX") ? "" : "none"%>">
	            <td nowrap="nowrap" width="25%" align="right">RFC :</td>
	            <td nowrap="nowrap" width="25%" colspan="3" >
	            	<eibsinput:text name="client" property="E01RFC01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="4"  />
	            	<eibsinput:text name="client" property="E01RFC02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6"  />
	            	<eibsinput:text name="client" property="E01RFC03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
	            	<eibsinput:text name="client" property="E01RFC04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
					<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
	 	        </td>
			</tr>
			<tr id="RFC2" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= client.getE01CCS().trim().equals("MX") ? "" : "none"%>">
				<td nowrap="nowrap" width="25%" align="right">CURP :</td>
				<td nowrap="nowrap" width="25%" colspan="3" >
					<eibsinput:text name="client" property="E01CURP1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="4"  />
				    <eibsinput:text name="client" property="E01CURP2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6"  />
				    <eibsinput:text name="client" property="E01CURP3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
				    <eibsinput:text name="client" property="E01CURP4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
				    <eibsinput:text name="client" property="E01CURP5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
				    <eibsinput:text name="client" property="E01CURP6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
				    <eibsinput:text name="client" property="E01CURP7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
				    <eibsinput:text name="client" property="E01CURP8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
				    <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
				 </td>
			</tr>
		<% } %>	
		
	         <tr class="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>" > 
	            <td nowrap width="25%" > 
	              <div align="right">Mas de una Nacionalidad :</div>
	            </td>
	            <td nowrap colspan="3">
	            <% boolean chk = !(client.getE01UF10().trim().equals("0") || client.getE01UF10().trim().equals(""));  %>
	              <input type="checkbox" name="E01UF10" id="E01UF10" value='<%=chk?"1":"0"  %>' <%=chk? "checked='Checked'" : "" %>  onclick="setAditionalNat( this.checked );"  /> 
	            </td>
	         </tr>          


	         <tr class="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %> addnat" style="display: <%= chk ? "table-row" : "none" %>" > 
	            <td nowrap width="25%" >  
	              <div align="right"  >Nacionalidad 1 :</div>
	            </td>
	            <td nowrap >
	              <DIV  >
	              <eibsinput:text property="E01FC19" name="client" type="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" readonly="false"  />
	              <a id="E01FC19L" href="javascript:GetCodeCNOFC('E01FC19','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
	              </DIV>
	            </td>
	            <td nowrap width="25%" > 
	              <div align="right"   >Nacionalidad 2 :</div>
	            </td>
	            <td nowrap >
	              <DIV  >
	              <eibsinput:text property="E01FC20" name="client" type="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" readonly="false"  />
	              <a id="E01FC20L" href="javascript:GetCodeCNOFC('E01FC20','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
	              </DIV>
	            </td>
	         </tr>          


	         <tr class="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>" > 
                <td nowrap="nowrap" width="25%" style="vertical-align: top;" > 
                  <div align="right">Persona Expuesta Políticamente :</div>
                </td>
                <td nowrap="nowrap" width="25%"> 
                	<input type="radio" name="E01FL6" id="E01FL6N" value="N" <%if (!client.getE01FL6().equals("Y")) out.print("checked"); %>>No 
              		<input type="radio" name="E01FL6" id="E01FL6Y" value="Y" <%if (client.getE01FL6().equals("Y")) out.print("checked"); %> >
              			Si (especifique)
                	<div id="pep" ></div>
	            <td nowrap width="25%" > 
	            </td>
	            <td nowrap width="25%">
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
        <td nowrap="nowrap" > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center" style="table-layout: fixed;">
        <tr class="<%row=1;%><%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap="nowrap" align="right" width="30%" >Fecha de Nacimiento :</td>
              <td nowrap="nowrap" width="20%"> 
                <eibsinput:date name="client" fn_year="E01BDY" fn_month="E01BDM" fn_day="E01BDD" required="true"/> 
              </td>
              <td nowrap="nowrap" align="right" width="17%">País de Nacimiento :</td>
              <td nowrap="nowrap" width="33%"> 
				<eibsinput:cnofc name="client" property="E01COB" required="false" flag="03" fn_code="E01COB" maxlength="2" />
              </td>
            </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <td nowrap="nowrap" align="right">
              	<% if(client.getH01SCR().equals("05")){ %> 
              		Fecha de Diligenciamiento : 
              	<% } else { %>
              		Fecha de Primer Contacto :
              	<% } %>
              </td>
              <td nowrap="nowrap"> 
                <eibsinput:date name="client" fn_year="E01IDY" fn_month="E01IDM" fn_day="E01IDD" required="true"/>
              </td>
              <td nowrap="nowrap" align="right">Lugar de Nacimiento :</td>
              <td nowrap="nowrap">
              	<span id="lncnofc" >
				<eibsinput:cnofc name="client" property="E01FC16" required="false" flag="84" fn_code="E01FC16" fn_description= "E01LN3" />
				</span>
	            <eibsinput:text name="client" property="E01LN3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true" />
              </td> 
            </tr>            
          </table>
        </td>
      </tr>
    </table>
   
   
   <div  id="address01"  >
	        <% 	
	        	String pageName = DataAddress.getTemplatePage(request, ISOCodes.getIBSCountryCode(country.trim()), client);
	        	Logger.getLogger(this.getClass().getName()).log(Level.FINE, "Using template: " + pageName);
	        %>
	<jsp:include page="<%= pageName %>" flush="true">
		<jsp:param name="index" value="01" />
		<jsp:param name="suffix" value="E01CUM" />
		<jsp:param name="title" value="Direcci&oacute;n" />
		<jsp:param name="messageName"  value="client" />
		<jsp:param name="readOnly"  value="false" />
		<jsp:param name="basic"  value="true" />
		<jsp:param name="simple" value="false" />
		<jsp:param name="showWeb" value="false" />
	</jsp:include>
   </div>
    
  <h4>Tel&eacute;fonos</h4>
    
  <table class="tableinfo">
    <tr > 
      <td nowrap="nowrap" > 
      
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
        <tr class="<%row=1;%><%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap="nowrap" width="30%"> 
              <div align="right">Tel&eacute;fono Casa :</div>
            </td>
            <td nowrap="nowrap" width="20%"> 
            	<eibsinput:text property="E01HPN" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="true" />
             </td>
            <td nowrap="nowrap" width="30%"> 
              <div align="right">Tel&eacute;fono Oficina :</div>
            </td>
            <td nowrap="nowrap" width="20%"> 
            	<eibsinput:text property="E01PHN" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE %>" />
            </td>
          </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap" width="30%" > 
              <div align="right">Tel&eacute;fono Fax :</div>
            </td>
            <td nowrap="nowrap" width="20%" > 
            	<eibsinput:text property="E01FAX" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE %>" />
            </td>
            <td nowrap="nowrap" width="30%" > 
              <div align="right">Tel&eacute;fono Celular :</div>
            </td>
            <td nowrap="nowrap" width="20%" > 
            	<eibsinput:text property="E01PH1" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE %>" />
             </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>
  
  <h4>Datos Financieros</h4>
    
  <table class="tableinfo">
  <tr > 
      <td nowrap="nowrap" > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap" width="20%"> 
              <div align="right">Estado Laboral :</div>
			</td>
            <td nowrap="nowrap" colspan="3"> 
              <select name="E01INL" id="E01INL">
				<option value=" " <% if (!(client.getE01INL().equals("1")||client.getE01INL().equals("2"))) out.print("selected"); %>> </option>
                <option value="1" <% if (client.getE01INL().equals("1")) out.print("selected"); %>>Empleado</option>
                <option value="2" <% if (client.getE01INL().equals("2")) out.print("selected"); %>>Pensionado</option>
              </select>
            </td> 
            <td nowrap="nowrap" > 
              <div align="right">Frecuencia de Ingresos :</div>
            </td>
            <td nowrap="nowrap" colspan="3">
               <SELECT name="E01SAT" id="E01SAT">
                       <OPTION value="M" <% if (!(client.getE01SAT().equals("W") 
                       	|| client.getE01SAT().equals("M") 
                       	|| client.getE01SAT().equals("S") 
                       	|| client.getE01SAT().equals("Y")
                       	|| client.getE01SAT().equals("B"))) out.print("selected");%>>Mensual</OPTION>
                       <OPTION value="W" <% if (client.getE01SAT().equals("W")) out.print("selected"); %>>Semanal</OPTION>
					   <OPTION value="B" <% if (client.getE01SAT().equals("B")) out.print("selected"); %>>Quincenal</OPTION>
                       <OPTION value="S" <% if (client.getE01SAT().equals("S")) out.print("selected"); %>>Semestral</OPTION>
                       <OPTION value="Y" <% if (client.getE01SAT().equals("Y")) out.print("selected"); %>>Anual</OPTION>
               </SELECT>
            </td>
          </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap" width="20%"> 
              <div align="right">Ingresos Brutos :</div>
			</td>
            <td nowrap="nowrap" width="10%">
			  <eibsinput:text property="E01CAI" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true" />
            </td> 
            <td nowrap="nowrap" width="5%"> 
              <div align="right">Origen :</div>
			</td>
            <td nowrap="nowrap" width="15%">
              <eibsinput:cnofc flag="30" name="client" property="E01SOI" fn_code="E01SOI" required="true"/>
            </td> 
            <td nowrap="nowrap" width="20%"> 
              <div align="right">Egresos :</div>
			</td>
            <td nowrap="nowrap" width="30%">
			  <eibsinput:text property="E01EOX" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"/>
            </td> 
          </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap"> 
              <div align="right">Otros Ingresos :</div>
			</td>
            <td nowrap="nowrap">
			  <eibsinput:text property="E01CAS" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"/>
            </td> 
            <td nowrap="nowrap"> 
              <div align="right">Origen :</div>
			</td>
            <td nowrap="nowrap">
              <eibsinput:cnofc flag="30" name="client" property="E01ORI" fn_code="E01ORI"/>
            </td> 
            <td nowrap="nowrap" > 
              <div align="right">Otros Egresos :</div>
            </td>
            <td nowrap="nowrap">
                 <eibsinput:text name="client" property="E01AM4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" />
            </td>
          </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap"> 
              <div align="right">Patrimonio Neto :</div>
			</td>
            <td nowrap="nowrap" colspan="3">
			  <eibsinput:text property="E01CAP" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"/>
            </td>
			<td nowrap="nowrap"> 
              <div align="right">Egreso en Educación :</div>
            </td>
            <td nowrap="nowrap">
                 <eibsinput:text name="client" property="E01AM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="false" />
			 </td>
          </tr>
          
        <% if( client.getE01CFL2().equals("1") ){ %>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap"> 
              <div align="right">Ventas o Ingresos Netos :</div>
			</td>
            <td nowrap="nowrap" colspan="3">
			  <eibsinput:text property="E01AM5" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"/> 
            </td>

        </tr>
        <% } %>
          
        </table>
      </td>
    </tr>
  </table>
  
  <h4>C&oacute;digos de Clasificaci&oacute;n</h4>
    
  <table class="tableinfo">
    <tr > 
      <td nowrap="nowrap" > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0"  align="center">
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap" width="20%" align="right">Oficial Principal :</td>
            <td nowrap="nowrap" width="30%">
               <input type="text" name="E01OFC" id="E01OFC" size="5" maxlength="4" value="<%= client.getE01OFC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01OFC','15')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <%=mandatory %>
            </td>
            <td nowrap="nowrap" width="20%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "10") %> :</div>
            </td>
            <td nowrap="nowrap" width="30%"> 
              <input type="text" name="E01OF2" id="E01OF2" size="5" maxlength="4" value="<%= client.getE01OF2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01OF2','10')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <%=mandatory %>
            </td>
          </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
         	<td nowrap="nowrap" width="20%" align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</td>
            <td nowrap="nowrap" width="30%"> 
              <input type="text" name="E01INC" id="E01INC" size="5" maxlength="4" value="<%= client.getE01INC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01INC','09')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
              <%=mandatory %>
            </td>
            <td nowrap="nowrap" width="20%" align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</td>
            <td nowrap="nowrap" width="30%"> 
              <input type="text" name="E01BUC" id="E01BUC" size="5" maxlength="4" value="<%= client.getE01BUC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01BUC','12')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <%=mandatory %>
            </td>
          </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
			<td nowrap="nowrap" width="20%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1A")  %> :</div>
            </td>
            <td nowrap="nowrap" width="30%"> 
              <input type="text" name="E01UC1" id="E01UC1" size="5" maxlength="4" value="<%= client.getE01UC1().trim()%>" >
              <a href="javascript:GetCodeCNOFC('E01UC1','1A')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap="nowrap" width="20%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1B")  %> :</div>
            </td>
            <td nowrap="nowrap" width="30%"> 
              <input type="text" name="E01UC2" id="E01UC2" size="5" maxlength="4" value="<%= client.getE01UC2().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC2','1B')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
         
            <td nowrap="nowrap" width="20%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1C")  %> :</div>
            </td>
            <td nowrap="nowrap" width="30%"> 
              <input type="text" name="E01UC3" id="E01UC3" size="5" maxlength="4" value="<%= client.getE01UC3().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC3','1C')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            
            <td nowrap="nowrap"  width="20%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1D")  %> :</div>
            </td>
            <td nowrap="nowrap"  width="30%"> 
              <input type="text" name="E01UC4" id="E01UC4" size="5" maxlength="4" value="<%= client.getE01UC4().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC4','1D')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             <td nowrap="nowrap"  width="20%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1E")  %> :</div>
            </td>
            <td nowrap="nowrap"  width="30%"   > 
              <input type="text" name="E01UC5" id="E01UC5" size="5" maxlength="4" value="<%= client.getE01UC5().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC5','1E')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap="nowrap"  width="20%"  > 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1F")  %> :</div>
            </td>
            <td nowrap="nowrap"  width="30%"> 
              <input type="text" name="E01UC6" id="E01UC6" size="5" maxlength="4" value="<%= client.getE01UC6().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01UC6','1F')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
   		</tr>
          
        </table>
      </td>
    </tr>
  </table>
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
			<INPUT type="radio" name="F01L08" onclick="showFields('C')" value="C" <% if (client.getF01L08().equals("C")) out.print("checked"); %>> Ciudadano Estadounidense 
			<INPUT type="radio" name="F01L08" onclick="showFields('R')" value="R" <% if (client.getF01L08().equals("R")) out.print("checked"); %>> Residente Estadounidense 
			<INPUT type="radio" name="F01L08" onclick="showFields('N')" value="N" <% if (!client.getF01L08().equals("C") && !client.getF01L08().equals("R")) out.print("checked"); %>> Ninguno
		</td>
		<td></td>
		<td></td>
	<tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF01L08().equals("C") && !client.getF01L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
		<div align="right">Autoriza FATCA Reporting (N/Y) :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
		<p align="left">
		<INPUT type="radio" name="F01L09" id="F01L09" value="Y" <% if (client.getF01L09().equals("Y")) out.print("checked"); %>>Si 
		<INPUT type="radio" name="F01L09" id="F01L09" value="N" 	<% if (client.getF01L09().equals("N")) out.print("checked"); %>	<% if (client.getF01L09().equals("")) out.print("checked"); %>>No</p>
		</td>
	</tr>
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF01L08().equals("C") && !client.getF01L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
			<div align="right">Identificación Federal de USA :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
			<eibsinput:text property="E01FIDU" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  />
		</td>
	</tr>
<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showFatcaExpiration"))) {%>  
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF01L08().equals("C") && !client.getF01L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
			<div align="right">Fecha de Vencimiento(Fatca) :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
			<eibsinput:date name="client" fn_day="E01CUFD2D" fn_month="E01CUFD2M" fn_year="E01CUFD2Y" />
		</td>
	</tr>	
<% } %>	
</table>
</td>
</tr>
</table>
<% } %>
    
    <h4>Datos Operativos</h4>
    
  <table cellspacing="0" cellpadding="2" width="100%" border="1" bordercolor="#000000" bgcolor="#FFFFFF" >
    <tr bordercolor="#FFFFFF"> 
        <td nowrap="nowrap" >
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">

        <tr class="<%row=1;%><%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap" width="20%" align="right">Estado del Cliente :</td>
            <td nowrap="nowrap" width="30%"> 
              <select name="E01STS" id="E01STS" >
				<option value=" " <% if (!(client.getE01STS().equals("1")||client.getE01STS().equals("2")||client.getE01STS().equals("3") ||client.getE01STS().equals("4") ||client.getE01STS().equals("5") ||client.getE01STS().equals("6"))) out.print("selected"); else out.print("disabled=\"disabled\"");%>> </option>               
                <option value="1" <% if (client.getE01STS().equals("1")) out.print("selected"); else out.print("disabled=\"disabled\""); %> >Inactivo</option>
                <option value="2" <% if (client.getE01STS().equals("2")) out.print("selected"); else out.print("disabled=\"disabled\"");%>  >Activo</option>
                <option value="3" <% if (client.getE01STS().equals("3")) out.print("selected"); else out.print("disabled=\"disabled\"");%>  >Lista de Control</option>
                <option value="4" <% if (client.getE01STS().equals("4")) out.print("selected"); else out.print("disabled=\"disabled\"");%>  >Fallecido</option>
                <option value="5" <% if (client.getE01STS().equals("5")) out.print("selected"); else out.print("disabled=\"disabled\"");%>  >Bloqueo Permite Pagos</option>
                <option value="6" <% if (client.getE01STS().equals("6")) out.print("selected"); else out.print("disabled=\"disabled\"");%>  >Bloqueo Total</option>
              </select>
              <%=mandatory %>
            </td>
              
            <td nowrap="nowrap" width="20%" align="right">Clase de Cliente :</td>
            <td nowrap="nowrap" width="30%"> 
              <input type="text" name="E01CCL" id="E01CCL" size="2" maxlength="1" value="<%= client.getE01CCL().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01CCL','C1')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <%=mandatory %>
            </td>
            </tr>
            
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap" width="20%" align="right">Tipo de Cliente :</td>
            <td nowrap="nowrap" width="30%" > 
              <input type="radio" name="E01TYP" id="E01TYP" value="R" <%if (!(client.getE01TYP().equals("M") || client.getE01TYP().equals("G"))) out.print("checked"); %>>
              Regular 
              <input type="radio" name="E01TYP" id="E01TYP" value="M" <%if (client.getE01TYP().equals("M")) out.print("checked"); %>>
              Master 
              <input type="radio" name="E01TYP" id="E01TYP" value="G" <%if (client.getE01TYP().equals("G")) out.print("checked"); %>>
              Grupo 
            </td>
            <td nowrap="nowrap" width="20%"  align="right">No. de Grupo :</td>
            <td nowrap="nowrap" width="30%" > 
              <input type="text" name="E01GRP" id="E01GRP" size="10" maxlength="9" value="<%= client.getE01GRP().trim()%>">
            </td>
          </tr>

        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap" width="20%" align="right">Idioma :</td>
            <td nowrap="nowrap" width="30%"> 
              <input type="radio" name="E01LIF" id="E01LIF" value="S" <%if (!client.getE01LIF().equals("E")) out.print("checked"); %>>
              Espa&ntilde;ol 
              <input type="radio" name="E01LIF" id="E01LIF" value="E" <%if (client.getE01LIF().equals("E")) out.print("checked"); %>>
              Ingl&eacute;s 
            </td>
            <td nowrap="nowrap" width="20%" align="right">Forma Calificaci&oacute;n :</td>
            <td nowrap="nowrap" width="30%">
            	<input type="text" name="E01FL2" id="E01FL2" size="3" maxlength="1" value="<%= client.getE01FL2().trim()%>">
                <a href="javascript:GetCode('E01FL2','STATIC_client_help_qualification_type.jsp')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>  
				<%=mandatory %>
            </td>
          </tr>

        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap" width="20%" align="right">Impuestos :</td>
            <td nowrap="nowrap" width="30%"> 
 				<input type="radio" name="E01TAX" value="1" <%if (client.getE01TAX().equals("1")) out.print("checked"); %>> Si 
				<input type="radio" name="E01TAX" value="N" <%if (client.getE01TAX().equals("N")) out.print("checked"); %>> No
              </td>
              <td nowrap="nowrap" width="20%" align="right">Tabla de Provisi&oacute;n :</td>
              <td nowrap="nowrap" width="30%">
                <input type="text" name="E01PRV" id="E01PRV" size="4" maxlength="2" value="<%= client.getE01PRV().trim()%>">
                <a href="javascript:GetPrevTable('E01PRV')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"  ></a>
              </td>
            </tr>
            
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        	<td nowrap="nowrap" width="20%" align="right" height="37">
              <div align="right">Nivel de Consulta :</div>
        	</td>
            <td nowrap="nowrap" width="30%" height="37">
            	<eibsinput:text property="E01ILV" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="1" />
            </td>
            <td nowrap="nowrap" width="20%"> 
              <div align="right">Relación con el Banco :</div>
            </td>              
            <td nowrap="nowrap"  width="30%"> 
              <input type="text" name="E01STF" id="E01STF" size="3" maxlength="1" value="<%= client.getE01STF().trim()%>">
              <a href="javascript:GetCode('E01STF','STATIC_client_help_bank_rel.jsp')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
              <%=mandatory %>
            </td>
		</tr>
	<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showRiskExpiration"))) {%>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap="nowrap" width="20%"> 
				<div align="right">Nivel de Riesgo :</div>
            </td>
            <td nowrap="nowrap"  width="30%"> 
	              <input type="text" name="E01RSL" id="E01RSL" size="5" maxlength="4" value="<%= client.getE01RSL().trim()%>">
	              <a href="javascript:GetCodeCNOFC('E01RSL','31')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
	              <%=mandatory %>
            </td>
            <td nowrap="nowrap"  width="20%"> 
				<div align="right">Fecha de Vencimiento(Riesgo) :</div>
            </td>
            <td nowrap="nowrap" width="30%"> 
				<eibsinput:date name="client" fn_month="E01CUFD1M" fn_day="E01CUFD1D" fn_year="E01CUFD1Y" />
            </td>
		</tr>
	<% } %>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap="nowrap" width="20%"> 
              <div align="right">Fuente :</div>
            </td>
            <td nowrap="nowrap"  width="30%"> 
               <%
              	boolean bTesoreria = (client.getE01FL8().indexOf("T") > -1);
              	boolean bFideicomiso = (client.getE01FL8().indexOf("F") > -1);
              	boolean bFEM = (client.getE01FL8().indexOf("E") > -1);
              	boolean bTerceros = (client.getE01FL8().indexOf("R") > -1);
              %>
              <INPUT type="checkbox" name="E01FL8_TES" id="E01FL8_TES" value="1" <% if (bTesoreria == true) out.print("checked"); %> >Tesoreria
              <INPUT type="checkbox" name="E01FL8_FID" id="E01FL8_FID" value="1" <% if (bFideicomiso == true) out.print("checked"); %> >Fideicomiso
              <INPUT type="checkbox" name="E01FL8_FEM" id="E01FL8_FEM" value="1" <% if (bFEM == true) out.print("checked"); %> >FEM
              <INPUT type="checkbox" name="E01FL8_TER" id="E01FL8_TER" value="1" <% if (bTerceros == true) out.print("checked"); %> >Terceros
            </td>
            <td nowrap="nowrap"  width="20%"> 
				<%if(!Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showRiskExpiration"))) {%>
				<div align="right">Nivel de Riesgo :</div>
				<% } %>  
            </td>
            <td nowrap="nowrap" width="30%"> 
				<%if(!Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showRiskExpiration"))) {%>
	              <input type="text" name="E01RSL" id="E01RSL" size="5" maxlength="4" value="<%= client.getE01RSL().trim()%>">
	              <a href="javascript:GetCodeCNOFC('E01RSL','31')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
	              <%=mandatory %>
				<% } %>            
            </td>
		</tr>
          </table>
        </td>
      </tr>
    </table>
    
  <h4>Datos Adicionales</h4>
    
  <table class="tableinfo">
    <tr > 
        <td nowrap="nowrap"  >
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">

        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap="nowrap"   width="20%"> 
              <div align="right">Referido por :</div>
              </td>
              
            <td nowrap="nowrap"  width="30%"> 
              <input type="text" name="E01RBY" id="E01RBY" size="5" maxlength="4" value="<%= client.getE01RBY().trim()%>">
                <input type="text" name="E01RBN" id="E01RBN" size="20" maxlength="15" value="<%= client.getE01RBN().trim()%>">
                <a href="javascript:GetCodeDescCNOFC('E01RBY','E01RBN','28')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
              </td>
            <td nowrap="nowrap"   width="20%"> 
              <div align="right">Tipo de Rel. Familiar :</div>
              </td>
            <td nowrap="nowrap"   width="30%"> 
              <select name="E01FL3">
                <option value=" " <% if (!(client.getE01FL3().equals("1")||client.getE01FL3().equals("2") ||client.getE01FL3().equals("3")||client.getE01FL3().equals("4") ||client.getE01FL3().equals("5")||client.getE01FL3().equals("6")||client.getE01FL3().equals("7")))  out.print("selected"); %>></option>
   	     	    <option value="1" <% if (client.getE01FL3().equals("1")) out.print("selected"); %>>Ninguna</option>
	   	   	    <option value="2" <% if (client.getE01FL3().equals("2")) out.print("selected"); %>>Primo(a)</option>
                <option value="3" <% if (client.getE01FL3().equals("3")) out.print("selected"); %>>Padre</option>
                <option value="4" <% if (client.getE01FL3().equals("4")) out.print("selected"); %>>Madre</option>
                <option value="5" <% if (client.getE01FL3().equals("5")) out.print("selected"); %>>Hermano(a)</option>
                <option value="6" <% if (client.getE01FL3().equals("6")) out.print("selected"); %>>Esposo(a)</option>
                <option value="7" <% if (client.getE01FL3().equals("7")) out.print("selected"); %>>Abuelo(a)</option>
              </select>
            </td>
            </tr>
            <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
          	<td nowrap="nowrap" align="right" width="20%">  C&oacute;digo de Convenio : </td>
            <td nowrap="nowrap" width="30%">  
              <input type="text" name="E01CCO" id="E01CCO" size="5" maxlength="4" value="<%= client.getE01CCO().trim()%>">
                <a href="javascript:GetCodeDescDeal('E01CCO','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
 	        </td> 
          	<td nowrap="nowrap" align="right" width="20%">Modalidad de R&eacute;gimen Conyugal :</td>
            <td nowrap="nowrap" width="30%">  
               <select name="E01FL7" >
                <option value=" " <% if (!(client.getE01FL7().equals("1")||client.getE01FL7().equals("2") ||client.getE01FL7().equals("3")))  out.print("selected"); %>></option>
   	     	    <option value="1" <% if (client.getE01FL7().equals("1")) out.print("selected"); %>>Separaci&oacute;n de Bienes</option>
	   	   	    <option value="2" <% if (client.getE01FL7().equals("2")) out.print("selected"); %>>Mancomunado </option>
                <option value="3" <% if (client.getE01FL7().equals("3")) out.print("selected"); %>>Mixto</option>
              </select> 
			</td>
 	        </tr>
          </table>
         </td>
      </tr>
    </table>     
      
      
	<br>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%"> 
        		<div align="center"><input type="checkbox" name="H01WK2" id="H01WK2" value="1" >Aceptar con Avisos</div>
      		</td>
    	</tr>
  	</table>

<table width="100%" style="background: none;">		
  	<tr>
		<% if (client.getE01SFR().equals("Y")) {%>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="this.disabled=true;javascript:goAction(1);">
     	  </div>	
  		</td>
		<%} else { %>
		<td width="100%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="this.disabled=true;javascript:goAction(1);">
     	  </div>	
  		</td>
		<% } %>

		<% if (client.getE01SFR().equals("Y")) {%>
		<td width="50%">
  		  		<div align="center">
				<input id="EIBSBTN" type="button" name="Submit2" value="Crear" onClick="this.disabled=true;javascript:goAction(2);">
     	  	 	</div>	
  		</td>
		<%} %>
  	</tr>	
</table>	

</form>

<SCRIPT type="text/javascript">


function defaultData(){
  <%-- Data Should be Added in Backend; --%>
   if( $("#E01CUMADC").val() == ""){
	   $("#E01CUMADC").val(String('<%= country %>'));
   }
   
   $( "#E01LN3" ).val( "<%=client.getE01LN3() %>" );
   $( "#E01FC16" ).val( "<%=client.getE01FC16() %>" );
}   


function fixCSS(){
   <%-- Modify IDN MaxLength based on definition in IdentificationData object --%>
   $( "[name='E01IDN']" ).attr( "maxlength", '<%= new IdentificationData(client.getE01IDN(), client.getE01PID(), client.getE01LGT()).getIdentification().length() %>' );
	
  <%-- Remove PEP Fields OnLoad and Load --%>
   $("#E01FL6N" ).click(function(){
	   $( "#pep" ).children().remove();
   });	
   
   <% if( "Y".equals( client.getE01FL6())){ %> loadPepFileds(); <% } %>
  
  //Call E01COB change event
   COBchg.call($("#E01COB" ), true);
   
   <%-- Mexico Only; Show RFC FIELDS --%>
   <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){%>    
		updatePlace(getElement("E01CCS"));
   <% } %>
}  

function registerEvents(){
   <%-- Loads PEP FIELDS --%>
   $("#E01FL6Y" ).click( loadPepFileds );
	
   <%-- Loads Address Template --%>
   $( "#E01GEC" ).change( function(){ changeAddressBlock('E01CUM', $( "#E01GEC" ).val(), $( "#E01GECD" ).val() , true ); });
	
   <%-- Changes Place of Birth between CNOFC and Write-in --%>
	COBchg = function(firstTime){
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
					lugarDSC.removeAttr( "readonly" ) ;
				}
   			};
   			
	
   //Hide or show lookup for Pais de Nacimiento (E01COB) -- ONLY FOR MX
   $("#E01COB" ).change(COBchg);
   
	//For additiona nationalities check field   
	  $("#E01UF10").change( function(){
		  if( !this.checked ) $("#E01FC19, #E01FC20").val("");
	});   
	
	
	$('#E01FC19, #E01FC20, #E01CCS').change(function(){
		if($(this).val() == 'US'){
			$('[name=F01L08][value=C]').prop('checked',true).trigger('click');
		}
	});
	
	<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){%>    
	$('#E01CCS').blur(function(){
		updatePlace($(this).get());
	});
	<% } %>
} 

function valRFC_CURP(  ){
	<%-- Mexico Validates CURP --%>
	
	scriptLog( "Validating valRFC_CURP..." );
	if( $("#E01RFC01").val() != "" &&  ( $("admin	ad#E01RFC03").val() == "" || $("#E01RFC04").val() == "" ) ){
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



function changeAddressBlock(block, country, dCountry, clearData){
   <%-- AJAX CALL to LOAD CORRECT ADDRESS TEMPLATE  --%>
	if( country != null && country != "" ){ //&& dCountry != "" 
		$( "#address01" ).load( "<%= request.getContextPath() %>/servlet/datapro.eibs.client.JSAddress" ,
				'messageName=client&simple=false&basic=true&title=Direccion&index='+block+'&firstColor=trdark&country='+country+
				'&dCountry='+dCountry+'&clearData='+clearData +'&showWeb=false' 
//				 , registerEvent
		);

	}
}


function loadPepFileds(){
   <%-- AJAX CALL to LOAD PEP FIELDS  --%>
	$( "#pep" ).load( "<%= request.getContextPath() %>/pages/s/ESD0080_PEP.jsp" );
}




function modIdF( event ){
	var typeF = $( "#XX" + fieldDesc );
	var tEl =   $( "#"   + fieldDesc ) ;
	
	tEl.off("keypress");
    if( typeF.val() == "N" ){ 
  	
    	tEl.keypress( enterInteger );
    }
	
}


//  Process according with user selection
 function goAction(op) {
	if(getElement("E01CCS").value.toUpperCase() == "MX"){
		if( !valRFC_CURP() ){
			return false ;
		}
	}
	
   	switch (op){
	// Validate & Write 
  	case 1:  {
    	document.getElementById("APPROVAL").value = 'N';
       	break;
        }
	// Validate and Approve
	case 2:  {
 		document.getElementById("APPROVAL").value = 'Y';
       	break;
		}
	}
	document.forms[0].submit();
 }


function setAditionalNat( val ){
   <%-- Display Additional Nationalites if user requires  --%>
	if( !val ){
		$( "#E01FC19, #E01FC19L, #E01FC20, #E01FC20L " ).attr('readonly', true);
		$( "#E01FC19L, #E01FC20L " ).disabled = true;
		$( "tr.addnat" ).hide();
	} else {

		$( "#E01FC19, #E01FC19L, #E01FC20, #E01FC20L " ).removeAttr('readonly');
		$( "#E01FC19L, #E01FC20L " ).disabled = false;
		$( "tr.addnat " ).show();
	}
	setRowColors('datosTable');
}

function setRowColors(table){
    $('#'+table+ ' tr:visible:odd').removeClass('trdark').addClass('trclear').css('background-color', getStyleCSS(".trclear","background-color"));
	$('#'+table+ ' tr:visible:even').removeClass('trclear').addClass('trdark').css('background-color',getStyleCSS(".trdark","background-color")); 
}

<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){%>    
	function updatePlace(obj) {
		if (obj.value.toUpperCase() == "MX") {
			document.getElementById("RFC1").style.display = "table-row";
			document.getElementById("RFC2").style.display = "table-row";
		} else {
			document.getElementById("RFC1").style.display = "none";
			document.getElementById("RFC2").style.display = "none";
		}
	}
<% } %>

$(document).ready(function(){
   $.ajaxSettings.cache = false;
   $.ajaxSettings.dataType= "html";

   registerEvents();
   defaultData();
   fixCSS();
   setAditionalNat( $( "#E01UF10" ).attr('checked') );
}); 


</SCRIPT>
</body>
</html>