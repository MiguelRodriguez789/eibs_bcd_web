<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="datapro.eibs.beans.IdentificationData"%>
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@page import="java.util.logging.*"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="datapro.eibs.beans.DataAddress"%>
<%@page import="datapro.eibs.master.*"%>
<%@page import="datapro.eibs.services.ParametersServices"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<html>
<head>
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<title>Cliente Moral</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<% //Java Variable
   String country = !client.getField("E02CUMADC").toString().trim().equals("") ? client.getField("E02CUMADC").toString().trim()
   								:client.getField("E02PID").toString().trim().equals("") ? client.getField("E02GEC").toString() : client.getField("E02PID").toString().trim(); 
%>

$(document).ready(function(){
	
   $.ajaxSettings.cache = false;
   $.ajaxSettings.dataType= "html";
   registerEvents();
   defaultData();
   fixCSS();
}); 


function defaultData(){
   if( $("#E02CUMADC").val() == ""){
	   $("#E02CUMADC").val(String('<%= country %>'));
   }
}   


function fixCSS(){
	$( "[name='E02IDN']" ).attr( "maxlength", '<%= new IdentificationData(client.getE02IDN(), client.getE02PID(), client.getE02LGT()).getIdentification().length() %>' );
}   




function changeAddressBlock(block, country, dCountry, clearData){

	if( country != null && country.trim() != "" ){ //&& dCountry.trim() != "" 

		$( "#address01" ).load( "<%= request.getContextPath() %>/servlet/datapro.eibs.client.JSAddress" ,
				'messageName=client&simple=false&basic=true&title=Direccion&index='+block+'&firstColor=trdark&country='+country+
				'&dCountry='+dCountry+'&clearData='+clearData+'&suffix='+block+'&showWeb=false'
		);

	
	}

}

function changeFatcaStatus(origenElement){
	if(origenElement.val() === 'US'){
		$('[name=F02L08][value=C]').prop('checked',true).trigger('click');
	}
}

function registerEvents(){
	
	$( "#E02GEC" ).change( function(){ changeAddressBlock('E02CUM', $( "#E02GEC" ).val(), $( "#E02GECD" ).val() , true ); changeFatcaStatus($(this));}); 
	
}


//  Process according with user selection
 function goAction(op) {
	
   	switch (op){
	// Validate & Write 
  	case 1:  {
    	document.forms[0].APPROVAL.value = 'N';
       	break;
        }
	// Validate and Approve
	case 2:  {
 		document.forms[0].APPROVAL.value = 'Y';
       	break;
		}
	}
	document.forms[0].submit();
 }

</SCRIPT>


<%
  String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" title=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
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
				getElement("E02FIDU").value = "";
		    }
	    }
   }
   
       	builtNewMenu(client_corp_opt);
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
 if ( !userPO.getPurpose().equals("NEW") ) {
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
 }
 %> 
 
 <h3 align="center">Informaci&oacute;n Cliente Empresa  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_corp_basic, ESD0080" ></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0080">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="12">
  <INPUT TYPE=HIDDEN NAME="APPROVAL" VALUE="N">
  <input type="hidden" name="E02LGT" size="10" maxlength="9" value="<%= client.getE02LGT()%>">
  
    <%	
    	String pageIdName = "ESD0080_ident_template_generic.jsp";
    	if(client.getH02SCR().equals("07")){
    		pageIdName = "ESD0080_ident_template_panama.jsp";
    	}
	%> 
		<jsp:include page="<%= pageIdName %>" flush="true">
			<jsp:param name="messageName" value="client" />
			<jsp:param name="readOnly"  value="false" /> 
			<jsp:param name="title" value="Identificaci&oacute;n" />
			<jsp:param name="suffix"  value="02" />
			<jsp:param name="basic" value="true" />
		</jsp:include>
		
    <%int row = 1; %> 
  <h4>Raz&oacute;n Social</h4>
 
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%"> 
              <div align="right"><b>Número de Cliente :</b></div>
            </td>
            <td nowrap> 
              <input type="hidden" name="E02CUN" size="10" maxlength="9" value="<%= client.getE02CUN().trim()%>" >
        	  <% if (client.getE02CUN().trim().equals("999999999")) out.print("NUEVO CLIENTE"); else out.print(client.getE02CUN().trim()); %> 
            </td>
            <td nowrap colspan="4" align="center" valign="top" style="color:red;font-size:12;">
                	<b><%= client.getD02CRT().trim()%></b> 
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Nombre Legal :</div>
            </td>
            <td nowrap colspan="3"> 
              <input type="text" name="E02NA1" size="70" maxlength="60" value="<%= client.getE02NA1().trim()%>">
              <%=mandatory %>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%"> 
              <p align="right">Nombre Anterior :</p>
            </td>
            <td nowrap colspan="5"> 
              <input type="text" name="E02CP1" size="31" maxlength="30" value="<%= client.getE02CP1().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%"> 
              <div align="right">Nombre Corto :</div>
            </td>
            <td nowrap colspan="5"> 
              <input type="text" name="E02SHN" size="30" maxlength="25" value="<%= client.getE02SHN().trim()%>" disabled>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="39%"> 
              <div align="right">Nombre Comercial :</div>
            </td>
            <td nowrap colspan="5"> 
              <input type="text" name="E02FN2" size="40" maxlength="30" value="<%= client.getE02FN2().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%">  
              <div align="right"></div>
            </td>
            <td nowrap colspan="5"> 
              <input type="text" name="E02LN1" size="40" maxlength="30" value="<%= client.getE02LN1().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="39%">  
              <div align="right">Pagina WEB :</div>
            </td>
            <td nowrap colspan="3"> 
               	<eibsinput:text property="E02WEB" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_WEB %>" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap width="29%"> 
                <div align="right">Pa&iacute;s de Origen :</div>
              </td>
              <td nowrap width="21%">  
                <input type="text" name="E02GEC" id="E02GEC" size="5" maxlength="4" value="<%= client.getE02GEC().trim()%>" readonly="readonly">
                <input type="hidden" name="E02GECD" id="E02GECD" value="<%= client.getE02CTR().trim()%>" readonly="readonly">
				<a href="javascript:GetCodeDescCNOFC('E02GEC', 'E02GECD','03')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"  ></a> 
                <%=mandatory %>
              	</td>
              <td nowrap width="21%"> 
                <div align="right">Tipo de Empresa :</div>
              </td>
              <td nowrap width="29%" colspan="4">
                <input type="text" name="E02EDL" id="E02EDL" size="5" maxlength="4" value="<%= client.getE02EDL().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02EDL','C7')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
                <%=mandatory %>
              </td>
          </tr>
		<% if(client.getH02SCR().equals("03")){ %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			<td nowrap align="right">No. de Registro :
			</td>
            <td nowrap colspan="5">  
            	<INPUT type="text" name="E02REN" size="30" maxlength="25" value="<%= client.getE02REN().trim()%>">
			</td>
          </tr>
		<% } %>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
			 <td nowrap width="10%" align="left" colspan="6"><B>Datos de la Superintendencia Financiera</B>
			 </td>
		   </tr>
	        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	  			<td nowrap width="29%"> 
                <div align="right">C&oacute;digo de Entidad :</div>
              </td>
              <td nowrap width="21%">  
                <input type="text" name="E02ID4" size="25" maxlength="20" value="<%= client.getE02ID4().trim()%>">
              </td>
              <td nowrap width="21%"> 
                <div align="right">Tipo de Entidad :</div>
              </td>
              <td nowrap width="29%" >  
                <input type="text" name="E02TI4" readonly size="5" maxlength="4" value="<%= client.getE02TI4().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02TI4','RI')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </td>
              <td nowrap width="29%"> 
                <div align="right">Naturaleza Jurídica :</div>
              </td>
              <td nowrap width="21%" >  
                <input type="text" name="E02PI4" readonly size="5" maxlength="4" value="<%= client.getE02PI4().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02PI4','RN')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
              </td>
	        </tr>
        </table>
        </td>
      </tr>
    </table>
    
    <h4>Fechas</h4>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="25%" align="right">Fecha de Constituci&oacute;n :</td>
              <td nowrap width="25%">  
                <eibsinput:date name="client" fn_year="E02BDY" fn_month="E02BDM" fn_day="E02BDD" required="true"/>
            </td>
            <td nowrap align="right">Fecha de Registro :</td>
              <td nowrap>  
                <eibsinput:date name="client" fn_year="E02REY" fn_month="E02REM" fn_day="E02RED" />
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="25%" align="right">
              	<% if(client.getH02SCR().equals("05")){ %> 
              		Fecha de Diligenciamiento : 
              	<% } else { %>
              		Fecha de Primer Contacto :
              	<% } %>
              </td>
              <td nowrap width="25%">  
                <eibsinput:date name="client" fn_year="E02IDY" fn_month="E02IDM" fn_day="E02IDD" required="true" />
            </td>
              <td nowrap align="right">Fecha Inicio de Operaciones :</td>
              <td nowrap>  
                <eibsinput:date name="client" fn_year="E02IEY" fn_month="E02IEM" fn_day="E02IED" />
            </td>
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap align="right"> 
                <div align="right">A&ntilde;os Establecidos :</div>
              </td>
              <td nowrap colspan="3" > 
                <input type="text" readonly <% if (client.getF02NSO().equals("Y")) out.print("class=\"txtchanged\""); %> name="E02NSO" size="3" maxlength="2" value="<%= client.getE02NSO().trim()%>">
              </td>
              
            </tr>
          </table>
        </td>
      </tr>
    </table>
    
    
    <div  id="address01"  >
    
	        <% 	String pageName = DataAddress.getTemplatePage(request, ISOCodes.getIBSCountryCode(country.trim()), client);
	        	Logger.getLogger(this.getClass().getName()).log(Level.FINE, "Using template: " + pageName);
	        %>	<jsp:include page="<%= pageName %>" flush="true">
		<jsp:param name="index" value="01" />
		<jsp:param name="suffix" value="E02CUM" />
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
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="27%"> 
              <div align="right">Tel&eacute;fono Oficina 1 :</div>
            </td>
            <td nowrap width="21%"> 
				<eibsinput:text property="E02PHN" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE %>" required="true"/>
             </td>
            <td nowrap width="29%"> 
              <div align="right">Tel&eacute;fono Oficina 2 :</div>
            </td>
            <td nowrap width="23%">
            	<eibsinput:text property="E02HPN" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE %>"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="27%" >  
              <div align="right">Tel&eacute;fono Fax :</div>
            </td>
            <td nowrap width="21%" >
            	<eibsinput:text property="E02FAX" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE %>"/>
            </td>
            <td nowrap width="29%" > 
              <div align="right">Tel&eacute;fono Celular :</div>
            </td>
            <td nowrap width="23%" >
             	<eibsinput:text property="E02PH1" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PHONE %>"/>
            </td>
          </tr>
          </table>
        </td>
      </tr>
    </table>
    
  <h4>Perfil de Negocios</h4>
    <table class="tableinfo">
		<tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <TD nowrap width="22%" align="right"> 
                Tama&ntilde;o de la Empresa :
              </TD>
              <TD nowrap width="22%">  
                <SELECT NAME="E02SEX" SIZE="1">
 					<OPTION VALUE="" <% if (!(client.getE02SEX().equals("1") || client.getE02SEX().equals("2") || client.getE02SEX().equals("3") || client.getE02SEX().equals("4") )) out.print("SELECTED");%>>
					<OPTION VALUE="1" <% if (client.getE02SEX().equals("1")) out.print("selected");%>>Microempresa
					<OPTION VALUE="2" <% if (client.getE02SEX().equals("2")) out.print("selected");%>>Pequeña
					<OPTION VALUE="3" <% if (client.getE02SEX().equals("3")) out.print("selected");%>>Mediana
					<OPTION VALUE="4" <% if (client.getE02SEX().equals("4")) out.print("selected");%>>Grande
				</SELECT>
                </TD>
              <TD nowrap width="25%"> 
                <div align="right">Fuente de Ingresos :</div>
              </TD>
              <TD nowrap width="31%">
				<input type="text" name="E02SOI" size="5" maxlength="4" value="<%= client.getE02SOI().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02SOI','30')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0"></a>
                <img src="<%=request.getContextPath()%>/images/Check.gif" alt="campo mandatorio" align="bottom" border="0">
                </TD>
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <TD nowrap width="22%"> 
                <DIV align="right">Capital Inicial :</DIV>
              </TD>
              <TD nowrap width="22%">  
                <INPUT type="text" name="E02CAI" size="16" maxlength="15" value="<%= client.getE02CAI().trim()%>" onKeypress="enterDecimal(event)">
                </TD>
              <TD nowrap width="25%"> 
                <DIV align="right">Capital Suscrito :</DIV>
              </TD>
              <TD nowrap width="31%">  
                <INPUT type="text" name="E02CAS" size="16" maxlength="15" value="<%= client.getE02CAS().trim()%>" onKeypress="enterDecimal(event)">
                </TD>
            </TR>
            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <TD nowrap width="22%"> 
                <DIV align="right">Capital Pagado :</DIV>
              </TD>
              <TD nowrap width="22%">  
                <INPUT type="text" name="E02CAP" size="16" maxlength="15" value="<%= client.getE02CAP().trim()%>" onKeypress="enterDecimal(event)">
                </TD>
              <TD nowrap width="25%"> 
                <DIV align="right">Nivel de Ventas :</DIV>
              </TD>
              <TD nowrap width="31%">  
                <INPUT type="text" name="E02INL" size="2" maxlength="1" value="<%= client.getE02INL().trim()%>">
                </TD>
            </TR>
            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap align="right"> 
                <div align="right">Número de Empleados :</div>
              </td>
              <td nowrap  > 
                <eibsinput:text property="E02FCT5" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="8" maxlength="6"  ></eibsinput:text>
              </td>
              
              <td nowrap align="right"> 
                <div align="right">Ventas o Ingresos Netos :</div>
              </td>
              <td nowrap  > 
                <input type="text" name="E02AM5" size="17" maxlength="15" value="<%= client.getE02AM5().trim()%>" onKeypress="enterDecimal(event)" >
              </td>
              
            </tr>
            
            
            <%--
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
              <TD nowrap width="22%"> 
                <DIV align="right">No. de Acciones :</DIV>
              </TD>
              <TD nowrap width="22%">  
                <INPUT type="text" name="E02NST" size="8" maxlength="7" value="<%= client.getE02NST().trim()%>">
                </TD>
              <TD nowrap width="25%"> 
                <DIV align="right">No. de Accionistas :</DIV>
              </TD>
              <TD nowrap width="31%">  
                <INPUT type="text" name="E02NSH" size="8" maxlength="7" value="<%= client.getE02NSH().trim()%>">
                </TD>
            </TR>
            --%>
		</table>
		</td>
		</tr>		
	</table>

  <h4>C&oacute;digo de Clasificaci&oacute;n</h4>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left" >
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="22%"> 
                <div align="right">Oficial Principal :</div>
              </td>
              <td nowrap width="18%">  
                <input type="text" name="E02OFC" size="5" maxlength="4" value="<%= client.getE02OFC().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02OFC','15')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                <%=mandatory %>
              </td>
              <td nowrap width="29%"> 
              <div align="right"><%= ParametersServices.getCnofTableDesc(request, "10") %> :</div>
              </td>
              <td nowrap width="31%" >  
                <input type="text" name="E02OF2" size="5" maxlength="4" value="<%= client.getE02OF2().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02OF2','10')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                <%=mandatory %>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap width="22%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "09") %> :</div>
              </td>
              <td nowrap width="18%">  
                <input type="text" name="E02INC" size="5" maxlength="4" value="<%= client.getE02INC().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02INC','09')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"  ></a>
                <%=mandatory %>
              </td>
              <td nowrap width="29%"> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "12") %> :</div>
              </td>
              <td nowrap width="31%">  
                <input type="text" name="E02BUC" size="5" maxlength="4" value="<%= client.getE02BUC().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02BUC','12')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a>
                <%=mandatory %>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1A")  %> :</div>
              </td>
              <td nowrap>  
                <input type="text" name="E02UC1" size="5" maxlength="4" value="<%= client.getE02UC1().trim()%>" >
                <a href="javascript:GetCodeCNOFC('E02UC1','1A')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"  ></a>
              </td>
              <td nowrap> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1B")  %> :</div>
              </td>
              <td nowrap>  
                <input type="text" name="E02UC2" size="5" maxlength="4" value="<%= client.getE02UC2().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02UC2','1B')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
			  </td>
            </tr>            
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1C")  %> :</div>
              </td>
              <td nowrap>  
                <input type="text" name="E02UC3" size="5" maxlength="4" value="<%= client.getE02UC3().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02UC3','1C')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </td>
              <td nowrap> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1D")  %> :</div>
              </td>
              <td nowrap>  
                <input type="text" name="E02UC4" size="5" maxlength="4" value="<%= client.getE02UC4().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02UC4','1D')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </td>
             </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1E")  %> :</div>
              </td>
              <td nowrap>  
                <input type="text" name="E02UC5" size="5" maxlength="4" value="<%= client.getE02UC5().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02UC5','1E')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              </td>
              <td nowrap> 
                <div align="right"><%= ParametersServices.getCnofTableDesc(request, "1F")  %> :</div>
              </td>
              <td nowrap>  
                <input type="text" name="E02UC6" size="5" maxlength="4" value="<%= client.getE02UC6().trim()%>">
                <a href="javascript:GetCodeCNOFC('E02UC6','1F')">
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
        <td nowrap> 
    <table cellspacing="0" cellpadding="2" width="100%" border="0">
    <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <TD nowrap width="22%" align="right"> 
                 <div align="right"> Origen:</div>
               </td>
               <td > 
                <INPUT type="radio" onclick="showFields('C')" name="F02L08" value="C" <% if (client.getF02L08().equals("C")) out.print("checked"); %>> Corporación Estadounidense
                <INPUT type="radio" onclick="showFields('N')" name="F02L08" value="N" <% if (!client.getF02L08().equals("C")) out.print("checked"); %>> Ninguno
               </td>
              </tr>
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF02L08().equals("C")) out.print("display:none"); %>"> 
         <td  nowrap>
         <div align="right">Autoriza  FATCA Reporting (N/Y)?</div>
         </td>
         <td  nowrap align="left"> 
 
             <INPUT type="radio" name="F02L09" value="Y"  <% if (client.getF02L09().equals("Y")) out.print("checked"); %>>  Si
             <INPUT type="radio" name="F02L09" value="N"  <% if (client.getF02L09().equals("N")) out.print("checked"); %> <% if (client.getF02L09().equals("")) out.print("checked"); %> > No
         </td>    
         </tr>

    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF02L08().equals("C")) out.print("display:none"); %>"> 
		<td nowrap>
			<div align="right"> TIN:</div>
		</td>
		<td nowrap> 
			<eibsinput:text property="E02FIDU" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>"  />
		</td>
	</tr>
<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showFatcaExpiration"))) {%>  
    <tr name="fatcaRow" class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="<%if (!client.getF02L08().equals("C")) out.print("display:none"); %>"> 
		<td nowrap="nowrap" >
			<div align="right">Fecha de Vencimiento(Fatca) :</div>
		</td>
		<td nowrap="nowrap" >
			<eibsinput:date name="client" fn_day="E02CUFD2D" fn_month="E02CUFD2M" fn_year="E02CUFD2Y" />
		</td>
	</tr>	
<% } %>	
	</table>
     </td>
     </tr>
   </table>
<% } %>

  <h4>Datos Operativos</h4>
  <table class="tableinfo">
      <tr > 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              
            <td nowrap width="10%"> 
              <div align="right">Estado del Cliente 
                  :</div>
              </td>
              
            <td nowrap width="15%"> 
              <select name="E02STS" >
                  <% boolean flag = false; %>
                  <option value="1" <%if (client.getE02STS().equals("1")) { flag = true; out.print("selected"); } else { out.print("disabled=\"disabled\""); }%> >Inactivo</option>
                  <option value="2" <%if (client.getE02STS().equals("2")) { flag = true; out.print("selected"); } else { out.print("disabled=\"disabled\""); }%> >Activo</option>
                  <option value="3" <%if (client.getE02STS().equals("3")) { flag = true; out.print("selected"); } else { out.print("disabled=\"disabled\""); }%> >Lista de Control</option>
                  <option value="4" <%if (client.getE02STS().equals("4")) { flag = true; out.print("selected"); } else { out.print("disabled=\"disabled\""); }%> >Disuelta</option>
                  <option value="5" <%if (client.getE02STS().equals("5")) { flag = true; out.print("selected"); } else { out.print("disabled=\"disabled\""); }%> >Bloqueado permite Pagos</option>
                  <option value="6" <%if (client.getE02STS().equals("6")) { flag = true; out.print("selected"); } else { out.print("disabled=\"disabled\""); }%> >Bloqueado Total</option>
                  <option value=" " <%if ( flag == false ) { out.print("selected"); } else { out.print("disabled=\"disabled\""); }  %>></option>
                </select>
                <%=mandatory %>
                </td>
              
            <td nowrap width="8%" align="right">Clase de Cliente :</td>
            <td nowrap width="67%"> 
              <input type="text" name="E02CCL" size="2" maxlength="1" value="<%= client.getE02CCL().trim()%>">
              <a href="javascript:GetCodeCNOFC('E02CCL','C2')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              
            <td nowrap width="10%"> 
              <div align="right">Tipo de Cliente :</div>
              </td>
              
            <td nowrap width="15%" bordercolor="#FFFFFF"> 
              <input type="radio" name="E02TYP" value="R" <% if (!(client.getE02TYP().equals("M") || client.getE02TYP().equals("G"))) out.print("checked"); %>>
                Regular
                <input type="radio" name="E02TYP" value="M" <% if (client.getE02TYP().equals("M")) out.print("checked"); %>>
                Master
                <input type="radio" name="E02TYP" value="G" <% if (client.getE02TYP().equals("G")) out.print("checked"); %>>
              Grupo <%=mandatory %></td>
              
            <td nowrap width="8%"> 
              <div align="right">No. de Grupo :</div>
              </td>
              
            <td nowrap width="67%"> 
              <input type="text" name="E02GRP" size="10" maxlength="9" value="<%= client.getE02GRP().trim()%>">
                </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              
            <td nowrap width="10%"> 
              <div align="right">Idioma :</div>
              </td>
              
            <td nowrap width="15%" bordercolor="#FFFFFF"> 
              <input type="radio" name="E02LIF" value="E"  <%if (!client.getE02LIF().equals("E")) out.print("checked"); %>>
                Ingles
                <input type="radio" name="E02LIF" value="S"  <%if (client.getE02LIF().equals("S")) out.print("checked"); %>>
                Espa&ntilde;ol 
                <%=mandatory %>
            </td>
              
            <td nowrap width="8%" align="right">Forma de Calificaci&oacute;n :</td>
            <td nowrap width="67%"> 
              <input type="text" name="E02FL2" size="2" maxlength="1" value="<%= client.getE02FL2().trim()%>">
                <a href="javascript:GetCode('E02FL2','STATIC_client_help_qualification_type.jsp')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a>
				<%=mandatory %>
            </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              
            <td nowrap width="10%"> 
              <div align="right">Impuestos :</div>
              </td>
              
            <td nowrap width="15%" bordercolor="#FFFFFF"> 
 				<input type="radio" name="E02TAX" value="1" <%if (client.getE02TAX().equals("1")) out.print("checked"); %>> Si 
				<input type="radio" name="E02TAX" value="N" <%if (client.getE02TAX().equals("N")) out.print("checked"); %>> No
            </td>
            <td nowrap width="8%" align="right">Tabla de Provisi&oacute;n :</td>
            <td nowrap width="67%"> 
              <input type="text" name="E02PRV" size="4" maxlength="2" value="<%= client.getE02PRV().trim()%>">
              <a href="javascript:GetPrevTable('E02PRV')">
                 <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" >
                  </a> 
            </td>
		  </tr>
	        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap="nowrap" width="20%"> 
              <div align="right">Fuente :</div>
            </td>
            <td nowrap="nowrap"  width="30%"> 
               <%
              	boolean bTesoreria = (client.getE02FL8().indexOf("T") > -1);
              	boolean bFideicomiso = (client.getE02FL8().indexOf("F") > -1);
              	boolean bFEM = (client.getE02FL8().indexOf("E") > -1);
              	boolean bTerceros = (client.getE02FL8().indexOf("R") > -1);
              %>
              <INPUT type="checkbox" name="E02FL8_TES" id="E02FL8_TES" value="1" <% if (bTesoreria == true) out.print("checked"); %> >Tesoreria
              <INPUT type="checkbox" name="E02FL8_FID" id="E02FL8_FID" value="1" <% if (bFideicomiso == true) out.print("checked"); %> >Fideicomiso
              <INPUT type="checkbox" name="E02FL8_FEM" id="E02FL8_FEM" value="1" <% if (bFEM == true) out.print("checked"); %> >FEM
              <INPUT type="checkbox" name="E02FL8_TER" id="E02FL8_TER" value="1" <% if (bTerceros == true) out.print("checked"); %> >Terceros
            </td>
            <td nowrap="nowrap"  width="20%"> 
				<div align="right">Nivel de Consulta  :</div>
            </td>
            <td nowrap="nowrap" width="30%"> 
            	<eibsinput:text property="E02ILV" name="client" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="1" />
            </td>
		</tr>	  
        <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap="nowrap" width="20%"> 
				<div align="right">Nivel de Riesgo :</div>
            </td>
            <td nowrap="nowrap"  width="30%"> 
	              <input type="text" name="E02RSL" id="E02RSL" size="5" maxlength="4" value="<%= client.getE02RSL().trim()%>">
	              <a href="javascript:GetCodeCNOFC('E02RSL','31')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
	              <%=mandatory %>
            </td>
            <td nowrap="nowrap"  width="20%"> 
				<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showRiskExpiration"))) {%>
					<div align="right">Fecha de Vencimiento(Riesgo) :</div>
				<% } %>
            </td>
            <td nowrap="nowrap" width="30%"> 
				<%if(Boolean.valueOf(JSEIBSProp.getProperty("eIBS.showRiskExpiration"))) {%>
					<eibsinput:date name="client" fn_month="E02CUFD1M" fn_day="E02CUFD1D" fn_year="E02CUFD1Y" />
				<% } %>
            </td>
		</tr>
          </table>
        </td>
      </tr>
    </table>
    
  <h4>Datos Adicionales</h4>
    <table class="tableinfo">
		<tr> 
        <td nowrap> 
          <table cellspacing="0" cellpadding="2" width="100%" border="0" align="left">
              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
              <td nowrap  width="18%"> 
                <div align="right">Referido por :</div>
              </td>
              <td nowrap  width="39%" colspan="3">  
                <input type="text" name="E02RBY" size="5" maxlength="4" value="<%= client.getE02RBY().trim()%>">
                <input type="text" name="E02RBN" size="16" maxlength="15" value="<%= client.getE02RBN().trim()%>">
                <a href="javascript:GetCodeDescCNOFC('E02RBY','E02RBN','28')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
                </td>
<%--
			<td nowrap width="20%">
              <div align="right">Tipo de Rel. Familiar :</div>
			</td>              
            <td nowrap  width="30%"> 
              <select name="E02FL3">
                <option value=" " <% if (!(client.getE02FL3().equals("1")||client.getE02FL3().equals("2") ||client.getE02FL3().equals("3")||client.getE02FL3().equals("4") ||client.getE02FL3().equals("5")||client.getE02FL3().equals("6")||client.getE02FL3().equals("7")))  out.print("selected"); %>></option>
   	     	    <option value="1" <% if (client.getE02FL3().equals("1")) out.print("selected"); %>>Ninguna</option>
	   	   	    <option value="2" <% if (client.getE02FL3().equals("2")) out.print("selected"); %>>Primo(a)</option>
                <option value="3" <% if (client.getE02FL3().equals("3")) out.print("selected"); %>>Padre</option>
                <option value="4" <% if (client.getE02FL3().equals("4")) out.print("selected"); %>>Madre</option>
                <option value="5" <% if (client.getE02FL3().equals("5")) out.print("selected"); %>>Hermano(a)</option>
                <option value="6" <% if (client.getE02FL3().equals("6")) out.print("selected"); %>>Esposo(a)</option>
                <option value="7" <% if (client.getE02FL3().equals("7")) out.print("selected"); %>>Abuelo(a)</option>
              </select>
            </td>
--%>
             </tr>   
		</table>
		</td>
		</tr>		
	</table>	
    
	<br> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: transparent;">
    	<tr > 
      		<td width="33%"> 
        		<div align="center"><input type="checkbox" name="H02WK2" value="1" >Aceptar con Avisos</div>
      		</td>
    	</tr>
  	</table>

<table width="100%" style="background-color: transparent;">		
  	<tr>
		<% if (client.getE02SFR().equals("Y")) {%>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="this.disabled=true;this.value='Enviando...';javascript:goAction(1);">
   		  </div>
   		 </td> 	
		<%} else { %>
		<td width="100%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="this.disabled=true;this.value='Enviando...';javascript:goAction(1);">
     	  </div>	
  		</td>
		<% } %>

		<% if (client.getE02SFR().equals("Y")) {%>
		<td width="50%">
  		  		<div align="center">
				<input id="EIBSBTN" type="button" name="Submit2" value="Crear" onClick="this.disabled=true;this.value='Enviando...';javascript:goAction(2);">
     	  	 	</div>	
  		</td>
		<%} %>
  	</tr>	
</table>	

</form>
</body>
</html>
