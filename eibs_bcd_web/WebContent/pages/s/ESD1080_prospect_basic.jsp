<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Prospect Basic Info</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 


<jsp:useBean id="client" class="datapro.eibs.beans.ESD108001Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


 <script>
$(function() {
$( "#tabs" ).tabs();
}); 

$(document).ready(function () {
    var currentTabIndex = "0";

    $tab = $("#tabs").tabs({
         activate : function (e, ui) {
            currentTabIndex = ui.newTab.index().toString();
            sessionStorage.setItem('tab-index', currentTabIndex);
         }
    });

    if (sessionStorage.getItem('tab-index') != null) {
        currentTabIndex = sessionStorage.getItem('tab-index');
        console.log(currentTabIndex);
        <% if (error.getERRNUM().equals("0")  ) { %>
        	$tab.tabs('option', 'active', currentTabIndex);
        <% } else { %>	
        	$tab.tabs('option', 'active', <%=client.getH01SCR()%>);
        <% } %>
    }
    $('#btn-sub').on('click', function () {
        sessionStorage.setItem("tab-index", currentTabIndex);
     });
    
});

</script>

</head>
 
<body>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script>

<% 	if (userPO.getPurpose().equals("MAINTENANCE")) {
		if (client.getE01LGT().trim().equals("1")) { %>
			builtNewMenu(client_corp_opt);	
<% 		} else { %>
			builtNewMenu(client_personal_opt);
<% 		} 
	} else if (userPO.getPurpose().equals("APPROVAL")) {
		 if (client.getE01LGT().trim().equals("1")) {%>
			builtNewMenu(client_ap_corp_opt);	
<% 		} else { %>
			builtNewMenu(client_ap_personal_opt);
<% 		} 
	} else {
		 if (client.getE01LGT().trim().equals("1")) {%>
			builtNewMenu(client_inq_corp_opt);	
<% 		} else { %>
			builtNewMenu(client_inq_personal_opt);
<% 		} 
	} 	%>
		
var finWindow = null;
var entWindow = null;
		
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este Mantenimiento?")) {
			return;
		}
		document.forms[0].Delete.disabled = true;
	}
	if (op == 5) {
		document.forms[0].Submit.disabled = true;
	}

	// Unify variables use to Persona & Juridica
	<% 	if (client.getE01LGT().trim().equals("1")) { %>
 	 	// Juridica  
		document.forms[0].E01BDY.value = getElement("JBDY").value;
		document.forms[0].E01BDM.value = getElement("JBDM").value;
		document.forms[0].E01BDD.value = getElement("JBDD").value;
	<% } else { %>
		// Persona
		document.forms[0].E01BDY.value = getElement("PBDY").value;
		document.forms[0].E01BDM.value = getElement("PBDM").value;
		document.forms[0].E01BDD.value = getElement("PBDD").value;
		document.forms[0].E01FN2.value = getElement("PFN2").value;
		document.forms[0].E01LN1.value = getElement("PLN1").value;
	<% } %>	
	 
	document.forms[0].E01EX01.value = getValChk("PEP1") + getValChk("PEP2") + getValChk("PEP3");
	 
	// document.forms[0].submit();
	if(finWindow) {
		finWindow.close();
	}
	if(entWindow) {
		entWindow.close();
	}								 
	submitForm();
}


function getValChk(v) {
	var formLength= document.forms[0].elements.length;
   	var vc = "N";
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == v) {
			if (document.forms[0].elements[n].checked == true) {
				vc = document.forms[0].elements[n].value;
        		break;
			}
      	}
    }
    return vc;
}


 function showInqOFAC(fieldValue) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
 }
 
 function age() {
 	var td = <%=currUser.getE01RDY()%> * 10000 + <%=currUser.getE01RDM()%> * 100 + <%=currUser.getE01RDD()%>;
 	<% 	if (client.getE01LGT().trim().equals("1")) { %>
 	  	var db = getElement("JBDY").value * 10000 + getElement("JBDM").value * 100 + getElement("JBDD").value * 1;
 	<% } else { %>
 		var db = getElement("PBDY").value * 10000 + getElement("PBDM").value * 100 + getElement("PBDD").value * 1;
 	<% } %>  
 	var today = td.toString();
 	var dob = db.toString();
 	var y1 = Number(today.substr(0,4));
	var m1 = Number(today.substr(4,2))-1;
	var d1 = Number(today.substr(6,2));
	var y2 = Number(dob.substr(0,4));
	var m2 = Number(dob.substr(4,2))-1;
	var d2 = Number(dob.substr(6,2));
	var age = y1 - y2;
	if(y1 < y2 || (m1 == m2 && d1 < d2 )){age--;}
 	document.forms[0].PAGE.value = age;
 }

function chgNme() {
	<% 	if (client.getE01LGT().trim().equals("1")) { %>
 	 	// Juridica  
		document.forms[0].LEGNME.value = getElement("E01NM6").value; 
		var sh = getElement("E01NM6").value;
		document.forms[0].E01SHN.value = sh.substr(0, 25);
	<% } else { %>
		// Persona
		document.forms[0].LEGNME.value = getElement("E01FNA").value + ' ' +
										 getElement("PFN2").value + ' ' +
										 getElement("PLN1").value + ' ' +
										 getElement("E01LN2").value; 
		document.forms[0].E01SHN.value = getElement("PLN1").value + ', ' +
										 getElement("E01FNA").value;											 
	<% } %>		
 }	

function cnvN(s) {
	s = s.replace(/,/g,'');
	return parseFloat(s);
}
</SCRIPT>  
 

<% 
	if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
    if ( !userPO.getPurpose().equals("NEW") ) {
    	out.println("<SCRIPT> initMenu(); </SCRIPT>");
 	}
    
    String legtyp = (client.getE01LGT().equals("1")?"JURIDICO":"PERSONA");
    String tdir = (client.getE01LGT().equals("1")?"DIRECCION PRINCIPAL":"DIRECCION PRINCIPAL");
    String readNew = (userPO.getPurpose().equals("NEW")?"readonly":"");
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
 	String tf = "false";
 	Boolean isReadOnly = false;
 	Boolean isNew = false;
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  tf = "true";
		  isReadOnly = true;
		}
		
	if (client.getE01CRT().equals("Y")) isNew = true;
	
	String chkOfac = "";
	chkOfac = (client.getH01FLGWK3().equals("3") ? "<a href=\"javascript:showInqOFAC('"
								+ client.getE01CUN()
								+ "')\"><img src=\"../images/warning_16.jpg\" alt=\"Lista de Control Posible Coincidencia\" align=\"middle\" border=\"0\" ></a>"
								: "");	
	int row = 0;
								
%>

<H3 align="center">Mantenimiento de Prospectos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="prospect_basic.jsp, ESD1080"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01NA1" VALUE="<%= client.getE01NA1()%>">
  <INPUT TYPE=HIDDEN NAME="E01MST" VALUE="<%= client.getE01MST()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDY" VALUE="<%= client.getE01BDY()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDM" VALUE="<%= client.getE01BDM()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDD" VALUE="<%= client.getE01BDD()%>">
  <INPUT TYPE=HIDDEN NAME="E01FN2" VALUE="<%= client.getE01FN2()%>">
  <INPUT TYPE=HIDDEN NAME="E01LN1" VALUE="<%= client.getE01LN1()%>">
  <INPUT TYPE=HIDDEN NAME="E01FL8" VALUE="<%= client.getE01FL8()%>">
  <INPUT TYPE=HIDDEN NAME="E01CP1" VALUE="<%= client.getE01CP1()%>">
  <INPUT TYPE=HIDDEN NAME="E01RCP" VALUE="<%= client.getE01RCP()%>">
  <INPUT TYPE=HIDDEN NAME="E01SEX" VALUE="<%= client.getE01SEX()%>">
   <INPUT TYPE=HIDDEN NAME="JBDY" VALUE="<%= client.getE01BDY()%>">
  <INPUT TYPE=HIDDEN NAME="JBDM" VALUE="<%= client.getE01BDM()%>">
  <INPUT TYPE=HIDDEN NAME="JBDD" VALUE="<%= client.getE01BDD()%>">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="<%= client.getE01OPE()%>">
  <INPUT TYPE=HIDDEN NAME="E01EX01" VALUE="<%= client.getE01EX01()%>">
  

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Tipo Legal : </td>
            <td nowrap width="10%" align="left" > <%=legtyp%>
            	<INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= client.getE01LGT()%>" >
			</td>
            <td nowrap width="5%" align="right">Estado : </td>
			<td nowrap width="40%" align="left" style="color:red;font-size:12;">
				<input type="HIDDEN" name="E01STS" VALUE="<%= client.getE01STS()%>" > 
			  	<% if (client.getE01STS().equals("1")) { out.print("CLIENTE - INACTIVO"); }
					  	else if (client.getE01STS().equals("2")) { out.print("CLIENTE - ACTIVO");  }
						else if (client.getE01STS().equals("3")) { out.print("CLIENTE - BLOQUEADO"); }
						else if (client.getE01STS().equals("4")) { out.print("CLIENTE - FALLECIDO"); }
						else if (client.getE01STS().equals("0")) { out.print("PROSPECTO"); }
						else { out.print(""); } 
				%>	
				<b>
					<%= client.getD01CRT().trim()%>
				</b>		
			</td>
            <td nowrap width="5%" align="right">Causal :</td>
			<td nowrap width="35%" align="center">
				<% if (!client.getE01OPE().equals("02")) { out.print(client.getD01FC1().trim() + " / " + client.getD01FC2().trim()); }%>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Código :</td>
            <td nowrap width="10%" align="left"> 
                <INPUT type="text" name="E01CUN" size="10" readonly value="<%= client.getE01CUN().trim()%>">
                <%=chkOfac%>
			</td>
            <td nowrap width="5%" align="right">Nombre Legal :</td>
			<td nowrap width="40%" align="left">
				<INPUT type="text" name="LEGNME" size="60" readonly value="<%= client.getE01NM6().trim()%>"
				<%=(client.getF01NM6().equals("Y"))?"id=\"txtchanged\"":"" %>>
			</td>
            <td nowrap width="5%" align="right">Nombre Corto :</td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01SHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="26" required="false" readonly="true" modified="F01SHN"/>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Tipo ID : </td>
            <td nowrap width="10%" align="left">
            	<eibsinput:text name="client" property="E01TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F01TID"/> 
			</td>
            <td nowrap width="5%" align="right"><%= client.getD01TID().trim()%> : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="client" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true" modified="F01IDN"/>
			</td>
            <td nowrap width="5%" align="right">País Identificación : </td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01PID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F01PID"/>
				<%= client.getD01PID().trim()%>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Fecha Efectiva <br> Ultima Actualización :</td>
            <td nowrap width="10%" align="left">
            	<%=client.getH01TIMSYS().substring(0,4)%>/<%=client.getH01TIMSYS().substring(4,6)%>/<%=client.getH01TIMSYS().substring(6,8)%> 
            	<%=client.getH01TIMSYS().substring(8,10)%>:<%=client.getH01TIMSYS().substring(10,12)%> 
			</td>
            <td nowrap width="5%" align="right"></td> 
			<td nowrap width="40%" align="left">
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>
        </table>
     
<div id="tabs">  
	<ul>
    	<li><a href="#tab1">Información Básica</a></li>
    	<li><a href="#tab2">Ubicación</a></li>
    	<li><a href="#tab4">Información Financiera</a></li>
    	<li><a href="#tab5">Información SARLAFT</a></li>
    	<li><a href="#tab7">Uso Exclusivo del Banco</a></li>
	</ul>

<div id="tab1">  <!-- Información Básica  -->
<div id="NATURAL" style="position:relative; display:none;">
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Primer Nombre :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01FNA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="true" readonly="true" onchange="chgNme()" modified="F01FNA"/> 
            </td>
            <td nowrap width="15%" align="right">Segundo Nombre :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="PFN2" size="45" maxlength="40" value="<%= client.getE01FN2().trim()%>" readonly onChange="chgNme()"
            	<%=(client.getF01FN2().equals("Y"))?"id=\"txtchanged\"":"" %>>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Primer Apellido :</td>
            <td nowrap width="35%" align="left">
                <input type="text" name="PLN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" readonly onChange="chgNme()"
                <%=(client.getF01LN1().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Segundo Apellido :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01LN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" readonly="true" onchange="chgNme()" modified="F01LN2"/>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Genero :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01SEX().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <p> 
                <input type="radio" name="SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %> disabled <%=(client.getF01SEX().equals("Y"))?"id=\"txtchanged\"":"" %>>
                Femenino 
                <input type="radio" name="SEX" value="M" <%if (!client.getE01SEX().equals("F")) out.print("checked"); %> disabled <%=(client.getF01SEX().equals("Y"))?"id=\"txtchanged\"":"" %>>
                Masculino 
                </p>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">País de Residencia : </td>
            <td nowrap width="35%" align="left" <%=(client.getF01GEC().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<eibsinput:cnofc name="client" property="E01GEC" value="<%=client.getE01GEC()%>"  maxlength="2" required="true" flag="03" fn_code="E01GEC" fn_description="D01GEC" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01GEC" value="<%=client.getD01GEC()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Nacionalidad :</td>
            <td nowrap width="35%" align="left">
                <eibsinput:cnofc name="client" property="E01CCS" value="<%=client.getE01CCS()%>" required="true" flag="03" fn_code="E01CCS" fn_description="D01CCS" readonly="<%=isReadOnly %>" styleId="F01CCS"/> 
				<input TYPE="text" NAME="D01CCS" value="<%=client.getD01CCS()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Fecha de Nacimiento :</td>
              <td nowrap width="35%" align="left">
              	<INPUT type="text" name="PBDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" onkeypress="enterInteger(event)" <%= readNew %> onblur="age();"
              	 <%=(client.getF01BDD().equals("Y"))?"id=\"txtchanged\"":"" %>>
				<INPUT type="text" name="PBDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" onkeypress="enterInteger(event)" <%= readNew %> onblur="age();"
				 <%=(client.getF01BDM().equals("Y"))?"id=\"txtchanged\"":"" %>>
				<INPUT type="text" name="PBDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" onkeypress="enterInteger(event)" <%= readNew %> onblur="age();"
				 <%=(client.getF01BDY().equals("Y"))?"id=\"txtchanged\"":"" %>>
				<%if (userPO.getPurpose().equals("MAINTENANCE")) { %>
				<A href="javascript:DatePicker(document.forms[0].PBDD,document.forms[0].PBDM,document.forms[0].PBDY)">
				<IMG src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
              	<% } %> 
              	<%=mandatory %>
                 <label id="lAge"></label>
                <input TYPE="text" NAME="PAGE" size="3" readonly> 
              </td>
              <% 	if (!client.getE01LGT().trim().equals("1")) { %>    
              <td nowrap width="15%" align="right">Fecha de Expedición de Identificación : </td>
              <td nowrap width="35%" align="left">
            	<eibsinput:date name="client" fn_year="E01REY" fn_month="E01REM" fn_day="E01RED" required="true" readonly="<%=isReadOnly %>"/>
              </td>
              <% } else { %>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
              <%} %>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Lugar de Nacimiento :<br>País / Dpto. / Ciudad</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01N5P" value="<%=client.getE01N5P()%>" size="5" maxlength="2" required="false" flag="03" fn_code="E01N5P" fn_description="D01N5P" readonly="<%=isReadOnly %>" />
            	<input type="text" name="D01N5P" size="20" value="<%= client.getD01N5P().trim()%>" readonly> <br>
            	<input type="text" name="E01N5D" size="5" maxlength="2" value="<%= client.getE01N5D().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N5D','D01N5D','27', '',document.forms[0]['E01N5P'].value)" ><%=help%></a>
              		<% } %>
              	<input type="text" name="D01N5D" size="20" value="<%= client.getD01N5D().trim()%>" readonly><br>
            	<input type="text" name="E01N5C" size="5" maxlength="4" value="<%= client.getE01N5C().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N5C','D01N5C','84', '',document.forms[0]['E01N5D'].value)" ><%=help%></a>
              		<% } %>
              	<input type="text" name="D01N5C" size="20" value="<%= client.getD01N5C().trim()%>" readonly> 
            </td>
            <td nowrap width="15%" align="right">Lugar Expedición de Identificación : <br>País / Dpto. / Ciudad</td>
            <td nowrap width="35%" align="left">
             	<eibsinput:cnofc name="client" property="E01N3P" value="<%=client.getE01N3P()%>" size="5" maxlength="2" required="false" flag="03" fn_code="E01N3P" fn_description="D01N3P" readonly="<%=isReadOnly %>" />
            	<%=mandatory %>
            	<input type="text" name="D01N3P" size="20" value="<%= client.getD01N3P().trim()%>" readonly> <br>
            	<input type="text" name="E01N3D" size="5" maxlength="2" value="<%= client.getE01N3D().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N3D','D01N3D','27', '',document.forms[0]['E01N3P'].value)" >
              		<%=help%></a>
              		<% } %>
              	<input type="text" name="D01N3D" size="20" value="<%= client.getD01N3D().trim()%>" readonly><br>
            	<input type="text" name="E01N3C" size="5" maxlength="4" value="<%= client.getE01N3C().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N3C','D01N3C','84', '',document.forms[0]['E01N3D'].value)" >
              		<%=help%></a>
              		<% } %>
              	<input type="text" name="D01N3C" size="20" value="<%= client.getD01N3C().trim()%>" readonly>
            </td>
         </tr>
       </table>
       </td>
       </tr>
    </table>

</div>   
   
<div id="JURIDICO" style="position:relative; display:none;">
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Razón Social :</td>
            <td nowrap width="85%" colspan="3"  align="left"> 
               	<input type="text" name="E01NM6" size="120" maxlength="160" value="<%= client.getE01NM6().trim()%>" readonly onChange="chgNme()">
               	<%=mandatory %>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Naturaleza Jurídica :</td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01UC3" value="<%=client.getE01UC3()%>" required="true" flag="RN" fn_code="E01UC3" fn_description="D01UC3" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01UC3" size="20" value="<%= client.getD01UC3().trim()%>" readonly>	 	
              </td>
            <td nowrap width="15%" align="right">Tipo de Entidad :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01UC2" value="<%=client.getE01UC2()%>" required="true" flag="RI" fn_code="E01UC2" fn_description="D01UC2" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01UC2" size="20" value="<%= client.getD01UC2().trim()%>" readonly>  
            </td>
         </tr>
       </table>
            
       </td>
       </tr>
    </table>
</div>

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Sector Económico : </td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01INC" value="<%=client.getE01INC()%>" required="false" flag="09" fn_code="E01INC" fn_description="D01INC" readonly="true"/> 
				<input TYPE="text" NAME="D01INC" value="<%=client.getD01INC()%>" readonly>
              </td>
            <td nowrap width="15%" align="right">Actividad Económica (CIIU) : </td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01BUC" size="5" maxlength="4" value="<%= client.getE01BUC().trim()%>" readonly>
            	<%-- 
            	<% if ( !isReadOnly ) {%>
              	<a href="javascript:Get2FilterCodes('E01BUC','D01BUC','12', '',document.forms[0]['E01INC'].value)" >
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                <%=mandatory %>  
                <% } %>
                --%>
				<input TYPE="text" NAME="D01BUC" value="<%=client.getD01BUC()%>" readonly>
            </td>
         </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Sub Actividad Económica : </td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01SST" value="<%=client.getE01SST()%>" required="false" flag="S3" fn_code="E01SST" fn_description="D01SST" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01SST" value="<%=client.getD01SST()%>" readonly>
              </td>
            <% 	if (!client.getE01LGT().trim().equals("1")) { %>  
            <td nowrap width="15%" align="right">Ocupación :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01ALB" value="<%=client.getE01ALB()%>" required="true" flag="C4" fn_code="E01ALB" fn_description="D01ALB" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01ALB" value="<%=client.getD01ALB()%>" readonly>
            </td>
            <% } else { %>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
            <% } %>
            </td>
         </tr>
       </table>
            
       </td>
       </tr>
    </table>

</div> 

<div id="tab2">  <!-- Ubicación  -->
 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tipo de Dirección Principal :</td>
            <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01UC7" value="<%=client.getE01UC7()%>" required="true" flag="DT" fn_code="E01UC7" fn_description="D01UC7" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01UC7" value="<%=client.getD01UC7()%>" readonly> 
            </td>	
            <td nowrap width="15%" align="right"></td> 
            <td nowrap width="35%" align="left">
            </td>
        </tr>
		</table>
	</td>
  </tr>
 </table>
		<jsp:include page="ESD0080_address_template_basic_colombia.jsp" flush="true" >
			<jsp:param name="title" value="<%=tdir%>" />				
			<jsp:param name="messageName" value="client" />
			<jsp:param name="readOnly" value="<%=tf%>" />
			<jsp:param name="suffix" value="E01" />
			<jsp:param name="basic" value="true" />
		</jsp:include>
	
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Uso de Dirección Principal :</td>
            <td nowrap width="35%" align="left">
              	<select name="E01TUD" <%= disabled %>>
                	<option value=" " <% if (!(client.getE01TUD().equals("U")|| client.getE01TUD().equals("R"))) out.print("selected"); %>> 
                     </option>
                    <option value="U" <% if (client.getE01TUD().equals("U")) out.print("selected"); %>>Urbano</option>
                    <option value="R" <% if (client.getE01TUD().equals("R")) out.print("selected"); %>>Rural</option>
                    <option value="S" <% if (client.getE01TUD().equals("S")) out.print("selected"); %>>Semiestacionario</option>                   
                </select>
                <%=mandatory %>
            </td>	
            <td nowrap width="15%" align="right">Como llegar : </td> 
            <td nowrap width="35%" align="left">
            	<textarea name="E01CLD" cols="45" rows="5" <%=read%>><%=client.getE01CLD()%></textarea>
            </td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Categoría Dirección :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01MUN" size="5" maxlength="3" value="<%= client.getE01MUN().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:GetCityCategory(document.forms[0]['E01ADC'].value,
            											document.forms[0]['E01STE'].value,
            											document.forms[0]['E01CTC'].value,
            											'0',document.forms[0]['E01TUD'].value,
            											'E01ADC','E01STE','E01CTC', 'E01MUN','D01MUN','','')" >
              		<%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01MUN" size="20" value="<%= client.getD01MUN().trim()%>" readonly>    
            </td>	
            <td nowrap width="15%" align="right">SubCategoría Dirección</td> 
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01PAR" size="5" maxlength="4" value="<%= client.getE01PAR().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:GetCityCategory(document.forms[0]['E01ADC'].value,
            											document.forms[0]['E01STE'].value,
            											document.forms[0]['E01CTC'].value,
            											document.forms[0]['E01MUN'].value,
            											document.forms[0]['E01TUD'].value,
            											'E01ADC','E01STE','E01CTC', 'E01MUN','D01MUN','E01PAR','D01PAR')" >
              		<%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01PAR" size="20" value="<%= client.getD01PAR().trim()%>" readonly>
            </td>
        </tr>
        <% 	if (!client.getE01LGT().trim().equals("1")) { %> 
          	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            	<td nowrap width="15%" align="right">Tipo de Vivienda :</td>
            	<td nowrap width="35%" align="left"> 
            		<eibsinput:cnofc name="client" property="E01FG1" value="<%=client.getE01FG1()%>" required="false" flag="TI" fn_code="E01FG1" fn_description="D01FG1" readonly="<%=isReadOnly %>"/> 
					<input TYPE="text" NAME="D01FG1" value="<%=client.getD01FG1()%>" readonly>
            	</td>
            	<td nowrap width="15%" align="right">Estrato :</td>
            	<td nowrap width="35%" align="left" >
            		<select name="E01INL" <%= disabled %>>
                	<option value=" " <% if (!(client.getE01INL().equals("1")|| client.getE01INL().equals("2") || client.getE01INL().equals("3") || 
                						client.getE01INL().equals("4") || client.getE01INL().equals("5") || client.getE01INL().equals("6"))) out.print("selected"); %>> 
                     </option>
                    <option value="1" <% if (client.getE01INL().equals("1")) out.print("selected"); %>>1</option>
                    <option value="2" <% if (client.getE01INL().equals("2")) out.print("selected"); %>>2</option>                   
                    <option value="3" <% if (client.getE01INL().equals("3")) out.print("selected"); %>>3</option>
                    <option value="4" <% if (client.getE01INL().equals("4")) out.print("selected"); %>>4</option>
                    <option value="5" <% if (client.getE01INL().equals("5")) out.print("selected"); %>>5</option>                   
                    <option value="6" <% if (client.getE01INL().equals("6")) out.print("selected"); %>>6</option>
                </select>
            	</td>
         	</tr>
		<% } %>       
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tipo de Teléfono :</td>
            <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01PHT" value="<%=client.getE01PHT()%>" required="false" flag="DO" fn_code="E01PHT" fn_description="D01PHT" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01PHT" value="<%=client.getD01PHT()%>" readonly> 
            </td>	
            <td nowrap width="15%" align="right"><label id="lTel"></label></td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01PHO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="20" maxlength="15" required="true" readonly="<%=isReadOnly %>"/>
            	Ext :
            	<eibsinput:text name="client" property="E01PHX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" required="false" readonly="<%=isReadOnly %>"/>
            	Indicativo : <%=client.getD01AX1()%> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>	
            <td nowrap width="15%" align="right">País / Dpto. / Ciudad :</td>
           	<td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01CCC" value="<%=client.getE01CCC()%>" size="5" maxlength="2" required="true" flag="03" fn_code="E01CCC" fn_description="D01CCC" readonly="<%=isReadOnly %>"/>
            	<input type="text" name="D01CCC" size="20" value="<%= client.getD01CCC().trim()%>" readonly><br>
            	<input type="text" name="E01SOI" size="5" maxlength="2" value="<%= client.getE01SOI().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01SOI','D01SOI','27', '',document.forms[0]['E01CCC'].value)" >
              		<%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01SOI" size="20" value="<%= client.getD01SOI().trim()%>" readonly><br>
            	<input type="text" name="E01COB" size="5" maxlength="4" value="<%= client.getE01COB().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%> 
            		<a href="javascript:Get2FilterCodes('E01COB','D01COB','84', '',document.forms[0]['E01SOI'].value)" ><%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01COB" size="20" value="<%= client.getD01COB().trim()%>" readonly> 
            </td>	
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Teléfono Adicional  : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01PHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="20" maxlength="15" required="false" readonly="<%=isReadOnly %>"/>
            	Ext :
            	<eibsinput:text name="client" property="E01PNX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" required="false" readonly="<%=isReadOnly %>"/>
            	Indicativo : <%=client.getD01AX2()%>
            </td>
          	<td nowrap width="15%" align="right">Tipo de Teléfono Adicional : </td>
            <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01PNT" value="<%=client.getE01PNT()%>" required="false" size="5" flag="DO" fn_code="E01PNT" fn_description="D01PNT" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01PNT" value="<%=client.getD01PNT()%>" readonly> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
        	<td nowrap align="right">Tipo Correo Electrónico :</td>
        	<td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01IAT" value="<%=client.getE01IAT()%>" required="false" flag="DR" fn_code="E01IAT" fn_description="D01IAT" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01IAT" value="<%=client.getD01IAT()%>" readonly>
 	       </td>
           	<td nowrap width="15%" align="right">Correo Electrónico :</td>
           	<td nowrap width="35%" align="left">
           		<input type="text" name="E01IAD" size="61" maxlength="60" value="<%= client.getE01IAD().trim()%>" <%=read %>> 
            </td>
          </tr>
        </table>    
	</td>	
   </tr>
  </table>		
</div>		

<div id="tab4">  <!-- Información Financiera  -->
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF" >  
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right"><%= client.getD01UC8().trim()%>
            	<a href="javascript:goFinancial('<%= client.getE01CUN().trim()%>','<%= client.getE01UC8().trim()%>')">
            	<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Detalle IFD" align="middle" border="0"></a>
            	</a>
            </td>
            <td nowrap width="35%" align="left">
            </td>
            <td nowrap width="15%"  align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right"><%= client.getD01F01().trim()%>
            	<a href="javascript:goFinancial('<%= client.getE01CUN().trim()%>','<%= client.getE01F01().trim()%>')">
            	<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Detalle IFG" align="middle" border="0"></a>
            	</a>
            </td>	
            <td nowrap width="35%" align="left">
            </td>
            <td nowrap width="15%"  align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">El Cliente cuenta con estados financieros Fiscales<br>(Declaración de Renta o Estados Fiinancieros firmados por Contador)?</td>
            <td nowrap width="35%" align="left">
            	<input type="radio" name="E01FL2" value="Y" <%if (client.getE01FL2().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateIFF('Y')">
                    Si 
                    <input type="radio" name="E01FL2" value="N" <%if (!client.getE01FL2().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateIFF('N')">
                    No
            </td>
            <td nowrap width="15%"  align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>
          </table>
          <div id="IFF" style="position:relative; display:block;">
          	<table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
 				<td nowrap width="15%" align="left">
            	</td>
            	<td nowrap width="35%"  align="right"><%= client.getD01F02().trim()%>
            		<a href="javascript:goFinancial('<%= client.getE01CUN().trim()%>','<%= client.getE01F02().trim()%>')">
            		<img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Detalle IFF" align="middle" border="0"></a>
            		</a>
            	</td>
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
            	</td>
            </tr>
          </table>  
          </div>
          <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <% 	if (client.getE01LGT().trim().equals("1")) { %>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Año Fiscal (Al corte del mes) :</td>
            <td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01IAY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="true" readonly="<%=isReadOnly %>"/>              
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>
          <% } %>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Detalle de Otros Ingresos : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01DS1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false" readonly="<%=isReadOnly %>" />
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Declaración de Origen de Fondos :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01DS2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="true" readonly="<%=isReadOnly %>" />  
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01DS3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" required="false" readonly="<%=isReadOnly %>" />
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>     
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Fecha de Ultima Actualización Inf. Financiera : </td>
            <td nowrap width="35%" align="left">
            	<%= Util.formatCustomDate(currUser.getE01DTF(),	client.getBigDecimalE01MAM().intValue(),
					     				  client.getBigDecimalE01MAD().intValue(), client.getBigDecimalE01MAY().intValue())%>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
          </tr>                
        </table>
        </td>
    </tr>
  </table>
</div>  

<div id="tab5">  <!-- SARLAFT  -->
    
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" align="center">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Realiza transacciones en M/E : </td>
            <td nowrap width="35%" align="left" <%=(client.getF01FX().equals("Y"))?"id=\"txtchanged\"":"" %>> 
				<p> 
                <input type="radio" name="E01FX" value="Y" <%if (client.getE01FX().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateFX('Y')">
                Si 
                <input type="radio" name="E01FX" value="N" <%if (!client.getE01FX().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateFX('N')">
                No 
                <%=mandatory %> 
                </p>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left"> 
            	
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tipo de Operación 1 : </td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:cnofc name="client" property="E01FXT1" value="<%=client.getE01FXT1()%>" required="false" flag="C3" fn_code="E01FXT1" fn_description="D01FXT1" readonly="<%=isReadOnly %>"/>
       	      <input type="text" name="D01FXT1" size="20" value="<%= client.getD01FXT1().trim()%>" readonly> 
            </td>
            <td nowrap width="15%" align="right">País :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01EM1" size="40" maxlength="60" value="<%= client.getE01EM1().trim()%>" readonly>
            	<% if (!isReadOnly) {%> 
            		<A href="javascript:GetCodeDescCNOFC('','E01EM1','03')"><%=help%></A> 
            	<% } %> 
            	 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tipo de Operación 2 : </td>
            <td nowrap width="35%" align="left"> 
              <eibsinput:cnofc name="client" property="E01FXT2" value="<%=client.getE01FXT2()%>" required="false" flag="C3" fn_code="E01FXT2" fn_description="D01FXT2" readonly="<%=isReadOnly %>"/>
       	      <input type="text" name="D01FXT2" size="20" value="<%= client.getD01FXT2().trim()%>" readonly> 
            </td>
            <td nowrap width="15%" align="right">País :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01EM2" size="40" maxlength="60" value="<%= client.getE01EM2().trim()%>" readonly>
            	<% if (!isReadOnly) {%> 
            		<A href="javascript:GetCodeDescCNOFC('','E01EM2','03')"><%=help%></A> 
            	<% } %> 
            	 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tipo de Operación 3 : </td>
            <td nowrap width="35%" align="left"> 
            	<eibsinput:cnofc name="client" property="E01FXT3" value="<%=client.getE01FXT3()%>" required="false" flag="C3" fn_code="E01FXT3" fn_description="D01FXT3" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01FXT3" size="20" value="<%= client.getD01FXT3().trim()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">País :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01EM3" size="40" maxlength="60" value="<%= client.getE01EM3().trim()%>" readonly>
            	<% if (!isReadOnly) {%> 
            		<A href="javascript:GetCodeDescCNOFC('','E01EM3','03')"><%=help%></A> 
            	<% } %> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Posee Productos Bancarios en M/E : </td>
            <td nowrap width="35%" align="left" <%=(client.getF01FXP().equals("Y"))?"id=\"txtchanged\"":"" %>> 
				<p> 
                <input type="radio" name="E01FXP" value="Y" <%if (client.getE01FXP().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateFXP('Y')">
                Si 
                <input type="radio" name="E01FXP" value="N" <%if (!client.getE01FXP().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateFXP('N')">
                No 
                </p>
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left"> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Entidad 1 : </td>
            <td nowrap width="35%" align="left"> 
              <input type="text" name="E01FXE1" size="21" maxlength="20" value="<%= client.getE01FXE1().trim()%>" <%=read%>>
              País : 
              <eibsinput:cnofc name="client" property="E01FXO1" value="<%=client.getE01FXO1()%>"  maxlength="2" required="false" flag="03" fn_code="E01FXO1" fn_description="D01FXO1" readonly="<%=isReadOnly %>"/>
       	      <input type="text" name="D01FXO1" size="20" value="<%= client.getD01FXO1().trim()%>" readonly>
              <br>
              Ciudad :
              <input type="text" name="E01FXU1" size="21" maxlength="20" value="<%= client.getE01FXU1().trim()%>" <%=read%>>
            </td>
            <td nowrap width="15%" align="right">Producto : </td>
            <td nowrap width="35%" align="left">
			  Dsc :            
              <input type="text" name="E01FXP1" size="15" maxlength="20" value="<%= client.getE01FXP1().trim()%>" <%=read%>>
              No. :
              <input type="text" name="E01FXN1" size="15" maxlength="20" value="<%= client.getE01FXN1().trim()%>" <%=read%>>
              <br>
              Mnd :
              <eibsinput:help name="client" property="E01FXC1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01FXC1" required="false" readonly="<%=isReadOnly %>" />
              Saldo :  
              <input type="text" name="E01FXPA1" size="22" maxlength="21" value="<%= client.getE01FXPA1().trim()%>" onKeypress="enterDecimal(event, 2)" <%=read%>>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Entidad 2 : </td>
            <td nowrap width="35%" align="left"> 
              <input type="text" name="E01FXE2" size="21" maxlength="20" value="<%= client.getE01FXE2().trim()%>" <%=read%>>
              País : 
              <eibsinput:cnofc name="client" property="E01FXO2" value="<%=client.getE01FXO2()%>"  maxlength="2" required="false" flag="03" fn_code="E01FXO2" fn_description="D01FXO2" readonly="<%=isReadOnly %>"/>
       	      <input type="text" name="D01FXO2" size="20" value="<%= client.getD01FXO2().trim()%>" readonly>
              <br>
              Ciudad :
              <input type="text" name="E01FXU2" size="21" maxlength="20" value="<%= client.getE01FXU2().trim()%>" <%=read%>>
            </td>
            <td nowrap width="15%" align="right">Producto : </td>
            <td nowrap width="35%" align="left">
			  Dsc :            
              <input type="text" name="E01FXP2" size="15" maxlength="20" value="<%= client.getE01FXP2().trim()%>" <%=read%>>
              No. :
              <input type="text" name="E01FXN2" size="15" maxlength="20" value="<%= client.getE01FXN2().trim()%>" <%=read%>>
              <br>
              Mnd :
              <eibsinput:help name="client" property="E01FXC2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01FXC2" required="false" readonly="<%=isReadOnly %>" />
              Saldo :  
              <input type="text" name="E01FXPA2" size="22" maxlength="21" value="<%= client.getE01FXPA2().trim()%>" onKeypress="enterDecimal(event, 2)" <%=read%>>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Entidad 3 : </td>
            <td nowrap width="35%" align="left"> 
              <input type="text" name="E01FXE3" size="21" maxlength="20" value="<%= client.getE01FXE3().trim()%>" <%=read%>>
              País : 
              <eibsinput:cnofc name="client" property="E01FXO3" value="<%=client.getE01FXO3()%>"  maxlength="2" required="false" flag="03" fn_code="E01FXO3" fn_description="D01FXO3" readonly="<%=isReadOnly %>"/>
       	      <input type="text" name="D01FXO3" size="20" value="<%= client.getD01FXO3().trim()%>" readonly>
              <br>
              Ciudad :
              <input type="text" name="E01FXU3" size="21" maxlength="20" value="<%= client.getE01FXU3().trim()%>" <%=read%>>
            </td>
            <td nowrap width="15%" align="right">Producto : </td>
            <td nowrap width="35%" align="left">
			  Dsc :            
              <input type="text" name="E01FXP3" size="15" maxlength="20" value="<%= client.getE01FXP3().trim()%>" <%=read%>>
              No. :
              <input type="text" name="E01FXN3" size="15" maxlength="20" value="<%= client.getE01FXN3().trim()%>" <%=read%>>
              <br>
              Mnd :
              <eibsinput:help name="client" property="E01FXC3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" fn_param_one="E01FXC3" required="false" readonly="<%=isReadOnly %>" />
              Saldo :  
              <input type="text" name="E01FXPA3" size="22" maxlength="21" value="<%= client.getE01FXPA3().trim()%>" onKeypress="enterDecimal(event, 2)" <%=read%>>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Administra Dinero del Sector Público :</td>
              <td nowrap width="35%" align="left" <%=(client.getF01MRP().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <input type="radio" name="E01MRP" value="Y" <%if (client.getE01MRP().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01MRP" value="N" <%if (!client.getE01MRP().equals("Y")) out.print("checked"); %> <%= disabled %>>
                No 
              </td>
              <td nowrap width="15%" align="right">Es una Organización o<br>Agencia Internacional : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01RLV().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<input type="radio" id= "PEP3" name="PEP3" value="Y" <%if (client.getE01EX01().substring(2, 3).equals("Y")) out.print("checked"); %> <%= disabled%>>
                Si
				<input type="radio" id= "PEP3" name="PEP3" value="N" <%if (!client.getE01EX01().substring(2, 3).equals("Y")) out.print("checked"); %> <%= disabled%>>
                No
              </td>
          </tr>
                    
          
          <% if (client.getE01LGT().trim().equals("1")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Cliente Exento de Papeleta : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01RCP().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<input type="radio" id= "E01RCP" name="E01RCP" value="Y" <%if (client.getE01RCP().equals("Y")) out.print("checked"); %> <%= disabled%>>
                Si
				<input type="radio" id= "E01RCP" name="E01RCP" value="N" <%if (!client.getE01RCP().equals("Y")) out.print("checked"); %> <%= disabled%>>
                No
              </td>
              <td nowrap width="15%" align="right">PEP Nacional : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01PEP().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <input type="radio" name="E01PEP" value="Y" <%if (client.getE01PEP().equals("Y")) out.print("checked"); %> disabled>
                Si 
                <input type="radio" name="E01PEP" value="N" <%if (!client.getE01PEP().equals("Y")) out.print("checked"); %> disabled>
                No  
              </td>
            </tr>
           
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">PEP Extranjero : </td>
              <td nowrap width="35%" align="left" > 
              	<input type="radio" name="C01PT3" value="Y" <%if (client.getC01PT3().equals("Y")) out.print("checked"); %> disabled>
                Si 
                <input type="radio" name="C01PT3" value="N" <%if (!client.getC01PT3().equals("Y")) out.print("checked"); %> disabled>
                No 	
              </td>
              <td nowrap width="15%" align="right"> </td>
              <td nowrap width="35%" align="left" >
              </td>
            </tr>
                        
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">PRSV : </td>
              <td nowrap width="35%" align="left"> 
              <input type="text" name="E01FM1" size="6" maxlength="5" value="<%= client.getE01FM1().trim()%>" disabled>
              </td>
              <td nowrap width="15%" align="right">Fecha Calificacion : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="FECHA1" size="12" maxlength="10" value="<%= userPO.getHeader15().trim()%>" disabled>	
              </td>   	
            </tr>
            
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">PRSD : </td>
              <td nowrap width="35%" align="left"> 
              <input type="text" name="E01FM4" size="6" maxlength="5" value="<%= client.getE01FM4().trim()%>" disabled>
              </td>
              <td nowrap width="15%" align="right">Fecha Actualizacion Calif. : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="FECHA2" size="12" maxlength="10" value="<%= userPO.getHeader16().trim()%>" disabled>	
              </td>   	
            </tr>
            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right"> </td>
              <td nowrap width="35%" align="left"> 
              
              </td>
              <td nowrap width="15%" align="right">Fecha Prox. Calificacion : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="FECHA3" size="12" maxlength="10" value="<%= userPO.getHeader17().trim()%>" disabled>	
              </td>   	
            </tr>
            
            <input type="hidden" id= "PEP2" name="PEP2" value="N">
            <input type="hidden" id= "PEP3" name="PEP3" value="N">  
            <% } else { %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">PEP Nacional :</td>
              <td nowrap width="35%" align="left" <%=(client.getF01PEP().equals("Y"))?"id=\"txtchanged\"":"" %>> 
              	<input type="radio" name="E01PEP" value="Y" <%if (client.getE01PEP().equals("Y")) out.print("checked"); %> >
                Si 
                <input type="radio" name="E01PEP" value="N" <%if (!client.getE01PEP().equals("Y")) out.print("checked"); %> >
                No 	
              </td>
              <td nowrap width="15%" align="right">PEP Extranjero : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01FL4().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	 <input type="radio" id= "C01PT1" name="C01PT3" value="Y" <%if (client.getC01PT3().equals("Y")) out.print("checked"); %> >
                Si 
                <input type="radio" id= "C01PT1" name="C01PT3" value="N" <%if (!client.getC01PT3().equals("Y")) out.print("checked"); %> >
                No	
              </td>
            </tr>
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">PRSV : </td>
              <td nowrap width="35%" align="left"> 
              <input type="text" name="E01FM1" size="6" maxlength="5" value="<%= client.getE01FM1().trim()%>" disabled>
              </td>
              <td nowrap width="15%" align="right">Fecha Calificacion : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="FECHA1" size="12" maxlength="10" value="<%= userPO.getHeader15().trim()%>" disabled>	
              </td>   	
            </tr>
            
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">PRSD : </td>
              <td nowrap width="35%" align="left"> 
              <input type="text" name="E01FM4" size="6" maxlength="5" value="<%= client.getE01FM4().trim()%>" disabled>
              </td>
              <td nowrap width="15%" align="right">Fecha Actualizacion Calif. : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="FECHA2" size="12" maxlength="10" value="<%= userPO.getHeader16().trim()%>" disabled>	
              </td>   	
            </tr>
            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right"> </td>
              <td nowrap width="35%" align="left"> 
              
              </td>
              <td nowrap width="15%" align="right">Fecha Prox. Calificacion : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="FECHA3" size="12" maxlength="10" value="<%= userPO.getHeader17().trim()%>" disabled>	
              </td>   	
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right"> </td>
              <td nowrap width="35%" align="left"  > 
              		
              </td>
              <td nowrap width="15%" align="right">Tiene reconocimiento Público : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01FL4().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	 <input type="radio" id= "E01FL4" name="E01FL4" value="Y" <%if (client.getE01FL4().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" id= "E01FL4" name="E01FL4" value="N" <%if (!client.getE01FL4().equals("Y")) out.print("checked"); %> <%= disabled %>>
                No	
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Desempeña Cargos Públicos : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01RCP().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<input type="radio" id= "E01RCP" name="E01RCP" value="Y" <%if (client.getE01RCP().equals("Y")) out.print("checked"); %> <%= disabled%>>
                Si
				<input type="radio" id= "E01RCP" name="E01RCP" value="N" <%if (!client.getE01RCP().equals("Y")) out.print("checked"); %> <%= disabled%>>
                No
              </td>
              <td nowrap width="15%" align="right">Residente : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01FL1().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <input type="radio" id= "E01FL1" name="E01FL1" value="1" <%if (client.getE01FL1().equals("1")) out.print("checked"); %> disabled>
                Si
				<input type="radio" id= "E01FL1" name="E01FL1" value="2" <%if (!client.getE01FL1().equals("1")) out.print("checked"); %> disabled>
                No
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Cónyuge o Familiares hasta segundo grado de Consanguinidad,<br>segundo de afinidad y primero civil cumplen con alguna<br>de las de las  condiciones para ser considerado PEP : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01RLV().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<input type="radio" id= "PEP1" name="PEP1" value="Y" <%if (client.getE01EX01().substring(0, 1).equals("Y")) out.print("checked"); %> <%= disabled%>>
                Si
				<input type="radio" id= "PEP1" name="PEP1" value="N" <%if (!client.getE01EX01().substring(0, 1).equals("Y")) out.print("checked"); %> <%= disabled%>>
                No
              </td>
              <td nowrap width="15%" align="right">Representante Legal de Organizaciones<br>o Agencias Internacionales : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01RLV().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <input type="radio" id= "PEP2" name="PEP2" value="Y" <%if (client.getE01EX01().substring(1, 2).equals("Y")) out.print("checked"); %> <%= disabled%>>
                Si
				<input type="radio" id= "PEP2" name="PEP2" value="N" <%if (!client.getE01EX01().substring(1, 2).equals("Y")) out.print("checked"); %> <%= disabled%>>
                No
              </td>
            </tr>            
            <% } %>
          	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Clase de Recurso e Identificación del Bien Entregado :</td>
              <td nowrap width="35%" align="left">
              	<textarea name="E01CSA" cols="50" rows="4" <%=read%>><%=client.getE01CSA()%></textarea> 
              </td>
              <td nowrap width="15%" align="right">Segmento SARLAFT : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="D01AX7" size="45" maxlength="40" value="<%= client.getD01AX7().trim()%>" readonly>	
              </td>
          </tr>
        </table>
        </td>
    </tr>
  </table>

      </td>
    </tr>
  </table>
</div>

<div id="tab7"> <!-- Uso Exclusivo del banco  -->

 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Fecha de Vinculación :</td>
              <td nowrap width="35%" align="left">
                <eibsinput:date name="client" fn_year="E01IDY" fn_month="E01IDM" fn_day="E01IDD" required="false" readonly="true" />
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left"> 
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Oficina de Vinculación :</td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:help name="client" property="E01BRA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true" fn_param_one="E01BRA" fn_param_two="" 
              	 fn_param_three="D01BRA" readonly="<%=isReadOnly %>"/> 
              	<input type="text" name="D01BRA" size="20" value="<%= client.getD01BRA().trim()%>" readonly>
              </td>
              <td nowrap width="15%" align="right">Gerente Comercial :</td>
              <td nowrap width="35%" align="left">
                <eibsinput:cnofc name="client" property="E01OFC" value="<%=client.getE01OFC()%>" required="true" flag="15" fn_code="E01OFC" fn_description="D01OFC" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01OFC" size="20" value="<%= client.getD01OFC().trim()%>" readonly>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Agencia Actual :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="D01AX8" size="45" value="<%= client.getD01AX8().trim()%>" readonly>	 
              </td>
              <td nowrap width="15%" align="right">Promotor :</td>
              <td nowrap width="35%" align="left">
                <eibsinput:cnofc name="client" property="E01OF2" value="<%=client.getE01OF2()%>" required="false" flag="10" fn_code="E01OF2" fn_description="D01OF2" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01OF2" size="20" value="<%= client.getD01OF2().trim()%>" readonly>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Segmento :</td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01UC5" value="<%=client.getE01UC5()%>" required="true" flag="S5" fn_code="E01UC5" fn_description="D01UC5" readonly="true"/>
       	        <input type="text" name="D01UC5" size="20" value="<%= client.getD01UC5().trim()%>" readonly>
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left"> 
              </td>
              <td nowrap width="15%" align="right">Tipo de Vinculación : </td>
              <td nowrap width="35%" align="left">
               <select name="E01STF" <%=disabled%>>
                	<option value=" " <% if (client.getE01STF().equals(" ")) out.print("selected"); %>> </option>
                    <option value="1" <% if (client.getE01STF().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (client.getE01STF().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (client.getE01STF().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (client.getE01STF().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (client.getE01STF().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (client.getE01STF().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (client.getE01STF().equals("T")) out.print("selected"); %>>MERCADO SEGUNDARIO</option>
                    <option value="E" <% if (client.getE01STF().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (client.getE01STF().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (client.getE01STF().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (client.getE01STF().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (client.getE01STF().equals("L")) out.print("selected"); %>>LIDER</option>
                </select>
              	<%=mandatory %>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left"> 
              </td>
              <td nowrap width="15%" align="right">Nivel de Consulta : </td>
              <td nowrap width="35%" align="left">
              	 <eibsinput:cnofc name="client" property="E01ILV" value="<%=client.getE01ILV()%>" required="true" flag="NA" fn_code="E01ILV" fn_description="D01ILV" readonly="<%=isReadOnly %>"/>
       	         <input type="text" name="D01ILV" size="20" value="<%= client.getD01ILV().trim()%>" readonly>	
              </td>
            </tr>
        </table>
      </td>
    </tr>
  </table>  
</div>	



</div>  <!-- Fin de Tabs  -->

<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
  		  	<% if (!userPO.getPurpose().equals("NEW")) {%>
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar Mnto" onClick="goAction(4);" <%= disabled %>>
     		<% } %>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
			<% if ( userPO.getPurpose().equals("NEW")) {%>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>
	</table>
<% } %>
	</td>
  	</tr>	
  </table>	
  
  </form>
</body> 

<SCRIPT Language="Javascript">

<% 	
	if (client.getE01LGT().trim().equals("1")) { %>
		getElement("lAge").innerHTML = "Años Constituida :";
 		getElement("lTel").innerHTML = "Teléfono Principal :";
 		JURIDICO.style.display='block';
 		JURIDICOF.style.display='block';
		NATURAL.style.display='none';
		NATURALF.style.display='none';
<% } else { %>
		getElement("lAge").innerHTML = "Edad :";
 		getElement("lTel").innerHTML = "Teléfono Principal :";
 		NATURAL.style.display='block';
 		NATURALF.style.display='block';
		JURIDICO.style.display='none';
		JURIDICOF.style.display='none'; 
<% }  %>

	age();
    chgNme(); 
    
<% if ( !isReadOnly) {%>
<% } %>
    
<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>   
    document.forms[0].Submit.focus(); 
<% } %> 
		   
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=client"> </script>
</html>
