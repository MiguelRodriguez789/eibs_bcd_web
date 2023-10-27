<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="datapro.eibs.beans.DataAddress"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
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
	 builtNewMenu("customer_short_corp_i_opt");
	 initMenu();	
<% } else if(!isNew){%>
	 builtNewMenu("customer_short_corp_m_opt");
	 initMenu();	
<% } %>
	function setLayout(flag) {
		if (flag) {
			setCenterSize(800,800);
		}
	}

//  Process according with user selection
 function goAction(op) {
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

function protectFields(updtyp) {
		if(updtyp != 'NEW'){
			getElement("E20SHN").disabled=true;  
			getElement("E20NA1").disabled=true;
			getElement("E20IDN").disabled=true;
		}  
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

<h3 align="center">Informaci&oacute;n Cliente Moral<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_short_personal_basic, ESD0080"  ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="8">
  <INPUT TYPE=HIDDEN NAME="APPROVAL" id="APPROVAL" VALUE="N">
  <input type="hidden" name="H20WK1" value="<%= client.getH20WK1().trim()%>">
  <input type="hidden" name="E20LGT" value="<%= client.getE20LGT().trim()%>">
  
  <h4>Identificaci&oacute;n</h4>
<% int row = 0 ;%>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="11%"> 
              <div align="right">Tipo :</div>
            </td>
            <td nowrap width="20%"> 
            	<eibsinput:text property="E20TID" name="client"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" required="true"/>
            </td>
            <td nowrap width="15%"> 
              <div align="right">Identificacion :</div>
            </td>
            <td nowrap width="18%"> 
            	<eibsinput:text property="E20IDN" name="client"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION%>" required="true"/>
            </td>
            <td nowrap width="11%"> 
              <div align="right">Pa&iacute;s :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E20PID" name="client"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" required="true"/>
             </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>  
  
  
  <h4>Datos Persona</h4>
    <div align="left">
     <% row = 0; %> 
    <table class="tableinfo" >
      <tr > 
          <td nowrap > 
            <div align="center"> 
            <table cellspacing="0" cellpadding="2" width="100%" border="0">
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="25%"> 
                  <div align="right">Numero Cliente :</div>
                </td>
                <td nowrap colspan="4"> 
                  <input type="hidden" name="E20CUN" size="15" maxlength="10" value="<%= client.getE20CUN().trim()%>">
                  <%= client.getE20CUN().trim()%> </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="25%"> 
                  <div align="right">Nombre Legal :</div>
                </td>
                <td nowrap colspan=3> 
	            <eibsinput:text property="E20NA1" name="client"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_FULL%>" required="true"/>
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="25%" > 
                  <div align="right">Nombre Corto :</div>
                </td>
                <td nowrap colspan=3> 
	            <eibsinput:text property="E20SHN" name="client"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME_SHORT%>" readonly="true"/>
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="25%"> 
                  <div align="right">Nombre Commercial :</div>
                </td>
                <td nowrap colspan=3> 
	            <eibsinput:text property="E20FN2" name="client"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30%>" />
	            <br>
	            <eibsinput:text property="E20LN1" name="client"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CHAR_30%>" />
                </td>
              </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                <td nowrap width="20%" > 
                  <div align="right"> Pais de Residencia :</div>
                </td>
                <td nowrap width="30%" > 
                  <input type="text" name="E20GEC" id="E20GEC" size="6" maxlength="4" value="<%= client.getE20GEC().trim()%>" >
                  <a href="javascript:GetCodeCNOFC('E20GEC','03')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                </td>
                <td nowrap width="20%" > 
                </td>
                <td nowrap  width="30%"> 
                </td>
              </tr>
              
            </table>
          </div>
          </td>
        </tr>
      </table>
   </div>
   
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

   <% row = 0; %> 
  <h4>Informacion Adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
       	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="25%" > 
              <div align="right">Fecha de Constitución :</div>
              </td>
              <td nowrap width="25%" > 
             	  <eibsinput:date name="client" fn_month="E20BDM" fn_day="E20BDD" fn_year="E20BDY" required="true"/>
              </td>
              <td nowrap width="25%" >
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "TM") %> :</div>
              </td>
              <td nowrap width="25%" > 
                <SELECT NAME="E02SEX" SIZE="1" disabled="disabled">
 					<OPTION VALUE="" <% if (!(client.getE20SEX().equals("1") || client.getE20SEX().equals("2") || client.getE20SEX().equals("3") || client.getE20SEX().equals("4") )) out.print("SELECTED");%>>
					<OPTION VALUE="1" <% if (client.getE20SEX().equals("1")) out.print("selected");%>>Microempresa
					<OPTION VALUE="2" <% if (client.getE20SEX().equals("2")) out.print("selected");%>>Pequeña
					<OPTION VALUE="3" <% if (client.getE20SEX().equals("3")) out.print("selected");%>>Mediana
					<OPTION VALUE="4" <% if (client.getE20SEX().equals("4")) out.print("selected");%>>Grande
				</SELECT>
              </td>
            </tr>
         	 <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Tel&eacute;fono Oficina 1  :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E20HPN" size="16" maxlength="15" value="<%= client.getE20HPN().trim()%>">
             </td>
            <td nowrap width="25%"> 
              <div align="right">Tel&eacute;fono Oficina 2 :</div>
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
              <div align="right">Capital Inicial :</div>
			</td>
            <td nowrap width="25%" > 
			  <eibsinput:text property="E20CAI" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td> 
            <td nowrap width="25%" > 
                <div align="right">Ventas o Ingresos Netos :</div>
			</td>
            <td nowrap width="25%" > 
			  <eibsinput:text property="E20FAM5" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td> 
          </tr>
          
        </table>
        </td>
    </tr>
  </table>
<br>
<%if  (!isReadOnly) { %>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%"> 
        		<div align="center"><input type="checkbox" name="H20WK2" value="1" >Aceptar con Avisos</div>
      		</td>
    	</tr>
  	</table>
	<table width="100%">		
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
	 

$(document).ready(function(){
	$.ajaxSettings.cache = false;
	$.ajaxSettings.dataType= "html";

	registerEvents();
	protectFields('<%=userPO.getPurpose().trim()%>');	

 	<%if(currUser.getE01INT().equals(ISOCodes.getIBSCountryCode("MX"))){ %>
		updatePlace(getElement("E20CCS"));
	<% } %>
}); 	 
</SCRIPT>	
	
	
</form>
</body>
</html>