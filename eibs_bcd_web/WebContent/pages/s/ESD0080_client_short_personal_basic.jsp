<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="java.util.logging.*"%>
<%@page import="datapro.eibs.beans.*"%>
<%@page import="datapro.eibs.master.*"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="datapro.eibs.services.ParametersServices"%>

<html>
<head>
<title>Informacion Basica</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
 
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008020Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
<%
	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
	boolean isReadOnly = isApprovalInquiry || isInquiry;
	boolean isNew = client.getE20CUN().trim().equals("999999999");
	if(isReadOnly){
%>
	 builtNewMenu("customer_short_i_opt");
	 initMenu();	
<% } else if(!isNew){%>
	 builtNewMenu("customer_short_m_opt");
	 initMenu();	
<% } %>
	function setLayout(flag) {
		if (flag) {
			setCenterSize(800,800);
		}
	}

//  Process according with user selection
 function goAction(op) {
	 <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){ %>
		if(getElement("E20CCS").value == "MX" && !valRFC_CURP()){  
		<%} else {%>
			if(false){  
		<% } %>
		return false ;
	} else {
	   	switch (op){
		// Validate & Write 
	  	case 1:  {
	    	getElement("APPROVAL").value = 'N';
	       	break;
	        }
		// Validate and Approve
		case 2:  {
	 		getElement("APPROVAL").value = 'Y';
	       	break;
			}
		}
		document.forms[0].submit();
	}
 }

function protectFields(updtyp) {
		getElement("E20SHN").disabled=true;  
		getElement("E20NA1").disabled=true;  
} 

<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){ %>

function valRFC_CURP() {
	if (getElement("E20RFC01").value.length == 0
		&& getElement("E20RFC03").value.length == 0
		&& getElement("E20RFC04").value.length == 0) {
		
		if (getElement("E20CURP1").value.length == 0
			&& getElement("E20CURP7").value.length == 0
			&& getElement("E20CURP8").value.length == 0) {
				alert("Error: Debe llenar unos de ambos RFC o CRP.");
			return false;	
		} else {
			return true;
		}	
	} else {
		return true;
	}
}

function updatePlace(obj) {
	if (obj.value == "MX") {
		document.getElementById("RFCRow1").style.display = "table-row";
		document.getElementById("RFCRow2").style.display = "table-row";
	} else {
		document.getElementById("RFCRow1").style.display = "none";
		document.getElementById("RFCRow2").style.display = "none";
	}
}
<% } %>

function updatePlace(obj) {
	return
}
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" onload="setLayout(<%=!client.getH20WK1().equals("S")%>)">

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Informaci&oacute;n Cliente Persona Física<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_short_personal_basic, ESD0080"  ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
  <INPUT TYPE=HIDDEN NAME="APPROVAL" id="APPROVAL" VALUE="N">
  <input type="hidden" name="H20WK1" value="<%= client.getH20WK1().trim()%>">
  <input type="hidden" name="E20LGT" value="<%= client.getE20LGT().trim()%>">
  
  <h4>Datos Persona</h4>
    <div align="left">
<% int row = 0 ;%>
      
    <table class="tableinfo" >
      <tr > 
          <td nowrap > 
            <div align="center"> 
              
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%"> 
                  <div align="right">Numero Cliente :</div>
                </td>
                <td nowrap colspan="4"> 
                  <input type="hidden" name="E20CUN" size="15" maxlength="10" value="<%= client.getE20CUN().trim()%>">
                  <%= client.getE20CUN().trim()%> </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%"> 
                  <div align="right">Primer Nombre :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" name="E20FNA" size="35" maxlength="30" value="<%= client.getE20FNA().trim()%>">
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%" > 
                  <div align="right">Segundo Nombre :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" name="E20FN2" size="35" maxlength="30" value="<%= client.getE20FN2().trim()%>">
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%"> 
                  <div align="right">Primer Apellido :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" name="E20LN1" size="35" maxlength="30" value="<%= client.getE20LN1().trim()%>">
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%"> 
                  <div align="right">Segundo Apellido :</div>
                </td>
                <td nowrap colspan=3> 
                  <input type="text" name="E20LN2" size="35" maxlength="30" value="<%= client.getE20LN2().trim()%>">
	              <%if(!currUser.getE01INT().equals("11")){%>
	                <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0" > 
	              <% }%> 
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%"> 
                  <div align="right">Nombre de Casada :</div>
                </td>
                <td nowrap colspan=4> 
                  <input type="text" name="E20ACA" size="35" maxlength="30" value="<%= client.getE20ACA().trim()%>">
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%" > 
                  <div align="right">Nombre Legal :</div>
                </td>
                <td nowrap colspan=4 > 
                  <input type="text" name="E20NA1" id="E20NA1" size="65" maxlength="60" value="<%= client.getE20NA1().trim()%>">
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%" > 
                  <div align="right">Nombre Corto :</div>
                </td>
                <td nowrap colspan=4 > 
                  <input type="text" name="E20SHN" id="E20SHN" size="28" maxlength="25" value="<%= client.getE20SHN().trim()%>">
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"> 
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%" > 
                  <div align="right"> Pais de Residencia :</div>
                </td>
                <td nowrap width="30%" > 
                  <input type="text" name="E20GEC" id="E20GEC" size="6" maxlength="4" value="<%= client.getE20GEC().trim()%>" onblur="updatePlace(this)">
                  <a href="javascript:GetCodeCNOFC('E20GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                </td>
                <td nowrap width="20%" > 
                  <div align="right">Genero :</div>
                </td>
                <td nowrap  width="30%"> 
                  <p> 
                    <input type="radio" name="E20SEX" value="F" <%if (client.getE20SEX().equals("F")) out.print("checked"); %>>
                    Femenino 
                    <input type="radio" name="E20SEX" value="M" <%if (client.getE20SEX().equals("M")) out.print("checked"); %>>
                    Masculino <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"> </p> 
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%" > 
                  <div align="right">Nacionalidad :</div>
                </td>
                <td nowrap width="30%" > 
                  <input type="text" name="E20CCS" id="E20CCS" size="6" maxlength="4" value="<%= client.getE20CCS().trim()%>" onblur="updatePlace(this)">
                  <a href="javascript:GetCodeCNOFC('E20CCS','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >                   
                </td>
                <td nowrap width="20%" > 
                  <div align="right">Estado Civil :</div>
                </td>
                <td nowrap  width="30%"> 
                  <select name="E20MST">
                    <option value=" " <% if (!(client.getE20MST().equals("1")||client.getE20MST().equals("2") || client.getE20MST().equals("3")||client.getE20MST().equals("4")||client.getE20MST().equals("5"))) out.print("selected"); %>> 
                    </option>
                    <% if (client.getH20SCR().equals("07")) { %>
                    <option value="1" <% if (client.getE20MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (client.getE20MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <%} else if (client.getH20SCR().equals("18")) { %>
                    <option value="1" <% if (client.getE20MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (client.getE20MST().equals("2")) out.print("selected"); %>>Casado(a) - Separacion de Bienes</option>                   
                    <option value="3" <% if (client.getE20MST().equals("3")) out.print("selected"); %>>Casado(a) - Sociedad Conyugal</option>
                    <option value="4" <% if (client.getE20MST().equals("4")) out.print("selected"); %>>Casado(a) - Participacion</option>
                    <option value="5" <% if (client.getE20MST().equals("5")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="6" <% if (client.getE20MST().equals("6")) out.print("selected"); %>>Separado(a)</option>
                    <option value="7" <% if (client.getE20MST().equals("7")) out.print("selected"); %>>Otro</option>
					<%} else { %>
		            <option value="1" <% if (client.getE20MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (client.getE20MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (client.getE20MST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (client.getE20MST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (client.getE20MST().equals("5")) out.print("selected"); %>>Unión Libre</option>
                    <option value="6" <% if (client.getE20MST().equals("6")) out.print("selected"); %>>Otro</option>
					<% } %>
                  </select>
                  <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"> 
                </td>
              </tr>
             <%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))) {%> 
         	 <tr id="RFCRow1"  class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
		            <td nowrap="nowrap" width="20%" align="right">RFC :</td>
		            <td nowrap="nowrap" width="30%" > 
		            	<eibsinput:text name="client" property="E20RFC01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="4"  />
		            	<eibsinput:text name="client" property="E20RFC02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6"  />
		            	<eibsinput:text name="client" property="E20RFC03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
		            	<eibsinput:text name="client" property="E20RFC04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
						<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
		 	        </td>
	              <td nowrap="nowrap" align="right" width="20%">Lugar de Nacimiento :</td>
	              <td nowrap="nowrap"  width="30%">
	              	<eibsinput:text property="E20FC16" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="8" required="true" readonly="true" />
	              	<a id="E20LN3LK" href="javascript:GetCodeDescCNOFC('E20FC16','E20LN3','EM')">
	              	<img id="E20LN3IMG" src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
	              </td> 
       			</tr>
         	 <tr id="RFCRow2"  class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap="nowrap" width="20%" align="right">CURP :</td>
				    <td nowrap="nowrap" width="30%" colspan="3" >
				    	<eibsinput:text name="client" property="E20CURP1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="6" maxlength="4"  />
				    	<eibsinput:text name="client" property="E20CURP2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6"  />
				    	<eibsinput:text name="client" property="E20CURP3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
				    	<eibsinput:text name="client" property="E20CURP4" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
				    	<eibsinput:text name="client" property="E20CURP5" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
				    	<eibsinput:text name="client" property="E20CURP6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
				    	<eibsinput:text name="client" property="E20CURP7" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="2" maxlength="1"  />
				    	<eibsinput:text name="client" property="E20CURP8" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="4" maxlength="2"  />
				    	<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
				 	</td>
				</tr>
			<% } %>
	         <tr class="<%= (row++ % 2 == 1) ? "trdark" : "trclear" %>" > 
                <td nowrap="nowrap" width="20%"  > 
                  <div align="right">Persona Expuesta Políticamente :</div>
                </td>
                <td nowrap width="30%" > 
                	<input type="radio" name="E20FL6" id="E20FL6N" value="N" <%if (!client.getE20FL6().equals("Y")) out.print("checked"); %>>No 
              		<input type="radio" name="E20FL6" id="E20FL6Y" value="Y" <%if (client.getE20FL6().equals("Y")) out.print("checked"); %> >
              			Si (especifique)
	            <td nowrap width="20%" > 
	            </td>
	            <td nowrap width="30%">
	            </td>
	         </tr>          
            </table>
          </div>
          </td>
        </tr>
      </table>
   </div>
   
   <%-- Loads P.E.p Fields Table  --%>
	<div id="pep" ></div>
   
   
   <div  id="address01"  >
	<% 	
	//Java Variable
   		String country =  !client.getField("E20CUMADC").toString().trim().equals("") ? client.getField("E20CUMADC").toString().trim() : client.getField("E20PID").toString().trim(); 
    	String pageName = DataAddress.getTemplatePage(request, ISOCodes.getIBSCountryCode(country.trim()), client);
	    Logger.getLogger(this.getClass().getName()).log(Level.FINE, "Using template: " + pageName);
	%>
	<jsp:include page="<%= pageName %>" flush="true">
		<jsp:param name="index" value="01" />
		<jsp:param name="suffix" value="E20CUM" />
		<jsp:param name="title" value="Direcci&oacute;n" />
		<jsp:param name="messageName"  value="client" />
		<jsp:param name="readOnly"  value="false" />
		<jsp:param name="basic"  value="true" />
		<jsp:param name="simple" value="false" />
	</jsp:include>
   </div>
  
    
  <h4>Informacion Adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
       	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="25%"> 
              <div align="right"> Numero Identificación :</div>
              </td>
              <td nowrap width="25%"> 
                 <input type="text" name="E20IDN" size="26" maxlength="25" value="<%= client.getE20IDN().trim()%>" readonly>
              </td>
              <td nowrap width="25%"> 
              <div align="right">Tipo Identificación :</div>
              </td>
              <td nowrap width="25%"> 
                  <input type="text" name="E20TID" size="6" maxlength="4" value="<%= client.getE20TID().trim()%>" readonly>
              </td>
            </tr>

       	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="25%"> 
              <div align="right">Fecha de Nacimiento :</div>
              </td>
              <td nowrap width="25%"> 
             	  <eibsinput:date name="client" fn_month="E20BDM" fn_day="E20BDD" fn_year="E20BDY" required="true"/>
              </td>
              <td nowrap width="25%"> 
              <div align="right"> Cargo o Actividad :</div>
              </td>
              <td nowrap width="25%"> 
               <eibsinput:cnofc name="client" flag="32" property="E20FC3"  required="true"/>
              </td>
            </tr>

       	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Sueldo L&iacute;quido :</div>
            </td>
            <td nowrap width="25%"> 
                <eibsinput:text name="client" property="E20AMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tipo de Contrato :</div>
            </td>
            <td nowrap width="25%"> 
             <SELECT name="E20NEM">
                   <OPTION value=" " <% if (!(client.getE20NEM().equals("1") || client.getE20NEM().equals("2")||
                   							  client.getE20NEM().equals("3") || client.getE20NEM().equals("4")||
                   							  client.getE20NEM().equals("5") || client.getE20NEM().equals("6")||
                   							  client.getE20NEM().equals("7") || client.getE20NEM().equals("8")||
                   							  client.getE20NEM().equals("9"))) out.print("selected");%>></OPTION>
                   <OPTION value="1" <% if (client.getE20NEM().equals("1")) out.print("selected"); %>="">Contratado</OPTION>
                   <OPTION value="2" <% if (client.getE20NEM().equals("2")) out.print("selected"); %>="">Indefinido</OPTION>
                   <OPTION value="3" <% if (client.getE20NEM().equals("3")) out.print("selected"); %>="">Suplencia</OPTION>
                   <OPTION value="4" <% if (client.getE20NEM().equals("4")) out.print("selected"); %>="">Honorarios</OPTION>
                   <OPTION value="5" <% if (client.getE20NEM().equals("5")) out.print("selected"); %>="">Independiente</OPTION>
                   <OPTION value="6" <% if (client.getE20NEM().equals("6")) out.print("selected"); %>="">Pensionado</OPTION>
                   <OPTION value="7" <% if (client.getE20NEM().equals("7")) out.print("selected"); %>="">De Planta</OPTION>
                   <OPTION value="8" <% if (client.getE20NEM().equals("8")) out.print("selected"); %>="">Plazo Fijo</OPTION>
                   <OPTION value="9" <% if (client.getE20NEM().equals("9")) out.print("selected"); %>="">Sin Contrato</OPTION>
             </SELECT>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" >              
             </td>
          </tr>
       	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Tel&eacute;fono Casa :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E20HPN" size="16" maxlength="15" value="<%= client.getE20HPN().trim()%>">
             </td>
            <td nowrap width="25%"> 
              <div align="right">Tel&eacute;fono Oficina :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E20PHN" size="16" maxlength="15" value="<%= client.getE20PHN().trim()%>">
            </td>
          </tr>
       	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tel&eacute;fono Fax :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E20FAX" size="16" maxlength="15" value="<%= client.getE20FAX().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tel&eacute;fono Celular :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E20PH1" size="16" maxlength="15" value="<%= client.getE20PH1().trim()%>">
            </td>
          </tr>
       	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Ingresos Brutos :</div>
			</td>
            <td nowrap width="25%" > 
			  <eibsinput:text property="E20CAI" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true" />
            </td> 
            <td nowrap width="25%" > 
              <div align="right">Egresos :</div>
			</td>
            <td nowrap width="25%" > 
			  <eibsinput:text property="E20EOX" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"/>
            </td> 
          </tr>
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
             <td nowrap="nowrap"  width="20%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1E")  %> :</div>
            </td>
            <td nowrap="nowrap"  width="30%"   > 
              <input type="text" name="E20UC5" id="E20UC5" size="5" maxlength="4" value="<%= client.getE20UC5().trim()%>">
              <a href="javascript:GetCodeCNOFC('E20UC5','1E')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap="nowrap"  width="20%"  > 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1F")  %> :</div>
            </td>
            <td nowrap="nowrap"  width="30%"> 
              <input type="text" name="E20UC6" id="E20UC6" size="5" maxlength="4" value="<%= client.getE20UC6().trim()%>">
              <a href="javascript:GetCodeCNOFC('E20UC6','1F')">
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
			<INPUT type="radio" name="F20L08" onclick="showFatcaFields('C')" value="C" <% if (client.getF20L08().equals("C")) out.print("checked"); %>> Ciudadano Estadounidense 
			<INPUT type="radio" name="F20L08" onclick="showFatcaFields('R')" value="R" <% if (client.getF20L08().equals("R")) out.print("checked"); %>> Residente Estadounidense 
			<INPUT type="radio" name="F20L08" onclick="showFatcaFields('N')" value="N" <% if (!client.getF20L08().equals("C") && !client.getF20L08().equals("R")) out.print("checked"); %>> Ninguno
		</td>
		<td></td>
		<td></td>
	<tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF20L08().equals("C") && !client.getF20L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
		<div align="right">Autoriza FATCA Reporting (N/Y) :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
		<p align="left">
		<INPUT type="radio" name="F20L09" id="F20L09" value="Y" <% if (client.getF20L09().equals("Y")) out.print("checked"); %>>Si 
		<INPUT type="radio" name="F20L09" id="F20L09" value="N" 	<% if (client.getF20L09().equals("N")) out.print("checked"); %>	<% if (client.getF20L09().equals("")) out.print("checked"); %>>No</p>
		</td>
	</tr>
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF20L08().equals("C") && !client.getF20L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
			<div align="right">Identificación Federal de USA :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
			<eibsinput:text property="E20FIDU" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  />
		</td>
	</tr>
<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showFatcaExpiration"))) {%>  
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF20L08().equals("C") && !client.getF20L08().equals("R")) out.print("display:none"); %>"> 
		<td width="20%" nowrap="nowrap" >
			<div align="right">Fecha de Vencimiento(Fatca) :</div>
		</td>
		<td width="80%" nowrap="nowrap" >
			<eibsinput:date name="client" fn_day="E20CUFD2D" fn_month="E20CUFD2M" fn_year="E20CUFD2Y" />
		</td>
	</tr>	
<% } %>	
</table>
</td>
</tr>
</table>
<% } %>  
<br>
<%if  (!isReadOnly) { %>
	<table width="100%" style="background: none;">
    	<tr > 
      		<td width="33%"> 
        		<div align="center"><input type="checkbox" name="H20WK2" value="1" >Aceptar con Avisos</div>
      		</td>
    	</tr>
  	</table>
	<table width="100%" style="background: none;">		
	  	<tr>
			<td width="100%">
	  		  <div align="center"> 
	  		  
	     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="javascript:goAction(1);">
	     	  </div>	
	  		</td>
	  	</tr>	
	</table>	
<% } else {%>
     	<script type="text/javascript">
			$("input[type='text']").attr("readonly", "readonly").prop("onchange",null).prop("change",null);  
			$("select" ).add("input[type='radio']").add("input[type='checkbox']").attr("disabled", "disabled").prop("onchange",null).prop("change",null);  
			$("img[title='null']").add("img[src='${pageContext.request.contextPath}/images/Check.gif']").add("img[src='${pageContext.request.contextPath}/images/1b.gif']").hide(); 	
		</script>
<% } %>  
<SCRIPT type="text/javascript">

 function registerEvents(){
   <%-- Loads Address Template --%>
   $( "#E20GEC" ).change( function(){ changeAddressBlock('E20CUM', $( "#E20GEC" ).val(), $( "#E20GECD" ).val() , true ); });

   <% if(client.getE20CCS().trim().equals("")){%>
	getElement("E20CCS").value = String("<%= ISOCodes.getISOCountryCode(currUser.getE01INT(), ISOCodes.EIBS_CODE_TO_ISO_ALFHA_2) %>");
	<% } %>
	
   <%-- Removes PEP Table --%>
	$("#E20FL6N" ).click(function(){
	   $( "#pep" ).children().remove();
   });	

   <%-- Add PEP PEP Table --%>
   $("#E20FL6Y" ).click( loadPepFileds );
   
	$('#E20CCS').change(function(){
		if($(this).val() == 'US'){
			$('[name=F20L08][value=C]').prop('checked',true).trigger('click');
		}
	});
 }
	 
function changeAddressBlock(block, country, dCountry, clearData){
	<%-- AJAX CALL to LOAD CORRECT ADDRESS TEMPLATE  --%>
	if( country != null && country != "" ){ //&& dCountry != "" 
		$( "#address01" ).load( "<%= request.getContextPath() %>/servlet/datapro.eibs.client.JSAddress" ,
				'messageName=client&simple=false&basic=true&title=Direccion&index='+block+'&firstColor=trdark&country='+country+
				'&dCountry='+dCountry+'&clearData='+clearData+'&suffix='+block+'&showWeb=false'
		);
	}
}

function loadPepFileds(){
   <%-- AJAX CALL to LOAD PEP FIELDS  --%>
	$( "#pep" ).load( "<%= request.getContextPath() %>/pages/s/ESD0080_PEP.jsp" ,"suffix=E20");
}	

function showFatcaFields(val){
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
 

$(document).ready(function(){
	$.ajaxSettings.cache = false;
	$.ajaxSettings.dataType= "html";

	registerEvents();
	protectFields('<%=userPO.getPurpose().trim()%>');	

 	<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){ %>
		updatePlace(getElement("E20CCS"));
	<% } %>
	
	<% if( "Y".equals( client.getE20FL6())){ %> loadPepFileds(); <% } %>
}); 	 
</SCRIPT>
</form>
</body>
</html>

