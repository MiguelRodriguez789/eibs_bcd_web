<!DOCTYPE HTML>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>


<%@page import="java.text.SimpleDateFormat"%> 
<%@page import="java.text.ParseException"%>
<html>
<head>
<title>Customer Basic Info</title>

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

	var tbs = '<%=client.getH01TABSEC()%>';
  	$("#tabs").tabs({disabled: [0,1,2,3,4,5,6,7,8]});
	var m = tbs.length;
   	for(n=0; n<m ;n++) {
     	var tb = tbs.substring(n, n+1);
      	if(tb == "Y") {
			enableTab($("#tabs"), n);
		}
    }
    
	
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

function enableTab(obj, num){
    obj.tabs("enable", num);
}

</script>

</head>
 
<body>

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
		document.forms[0].E01MST.value = getElement("JMST").value;
		document.forms[0].E01BDY.value = getElement("JBDY").value;
		document.forms[0].E01BDM.value = getElement("JBDM").value;
		document.forms[0].E01BDD.value = getElement("JBDD").value;
		document.forms[0].E01FN2.value = getElement("JFN2").value;
		document.forms[0].E01LN1.value = getElement("JLN1").value;
		document.forms[0].E01CP1.value = getElement("JCP1").value;
	<% } else { %>
		// Persona
		document.forms[0].E01MST.value = getElement("PMST").value;
		document.forms[0].E01BDY.value = getElement("PBDY").value;
		document.forms[0].E01BDM.value = getElement("PBDM").value;
		document.forms[0].E01BDD.value = getElement("PBDD").value;
		document.forms[0].E01FN2.value = getElement("PFN2").value;
		document.forms[0].E01LN1.value = getElement("PLN1").value; 
		document.forms[0].E01CP1.value = getElement("PCP1").value;
	<% } %>	
	
	document.forms[0].E01FL8.value = getValChk("ACH") + getValChk("INT") +
									 getValChk("CAJ") + getValChk("SEB") +
									 getValChk("IVR") + getValChk("TES");
    document.forms[0].E01EX01.value = getValChk("PEP1") + getValChk("PEP2") + getValChk("PEP3");
    									 
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
	if(m1 < m2 || (m1 == m2 && d1 < d2)){age--;}
 	document.forms[0].JAGE.value = age;
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

function chgRef(p) {

 	if (p == "F") {  // Familiar
		REFFAM.style.display='block';
	} else {                //  No Aplica
		REFFAM.style.display='block';
	}
 }
 
  
function updateFX(tfx) {
	var x = [ 'E01FXT1', 'E01FXT2', 'E01FXT3', 'D01FXT1', 'D01FXT2', 'D01FXT3', 'E01NM1', 'E01NM2', 'E01NM3'];
    if (tfx == 'N') {   
    	cleanFields(x);
    	readOnlyFields(x, true);
    } else {
    	readOnlyFields(x, false);
    } 
}
    
function updateFXP(pfx) {
	var x = [ 'E01FXE1', 'E01FXE2', 'E01FXE3', 'E01FXO1', 'E01FXO2', 'E01FXO3', 
    	          'E01FXU1', 'E01FXU2', 'E01FXU3', 'E01FXP1', 'E01FXP2', 'E01FXP3',
    	          'E01FXN1', 'E01FXN2', 'E01FXN3', 'E01FXC1', 'E01FXC2', 'E01FXC3',
    	          'E01FXPA1', 'E01FXPA2', 'E01FXPA3', 'D01FXO1', 'D01FXO2', 'D01FXO3'];      
    if (pfx == 'N') {
    	cleanFields(x);
    	readOnlyFields(x, true);
    } else {
    	readOnlyFields(x, false);
    }     
}

function updateFATCA() {
	<% 	if (client.getE01LGT().trim().equals("1")) { %>
 	 	// Juridica  
 	 		var x = [ 'E01GII'];
 	 		var vc = getValChk("E01ENF");
 	 		if (vc != 'Y') {
 	 			cleanFields(x);
    			readOnlyFields(x, true);
 	 		} else {
 	 			readOnlyFields(x, false);
 	 		}	
	<% } else { %>
		// Persona
			var x = [ 'E01IF2', 'E01IF3'];
			var y = [ 'E01PN2', 'E01PN3', 'D01PN2', 'D01PN3'];
			var vc = getValChk("E01ONA");
			if ( vc != "Y") {
 	 			cleanFields(y);
    			readOnlyFields(y, true);
 	 		} else {
 	 			readOnlyFields(y, false);
 	 		}
 	 		if (getValChk("E01REO") != "Y" && vc != "Y") {
 	 			cleanFields(x);
    			readOnlyFields(x, true);
 	 		} else {
 	 			readOnlyFields(x, false);
 	 		}	 
	<% } %>		
}

function msgTAX() {
	alert("Modificacion a Información de Exenciones se debe tramitar por el Módulo de Impuestos."); 
}

function goInquiryEnt(type, cli) {
	var ope = '01';
	var scr = '3';
	if (type !=  'C') { 
		ope = '22';
		scr = '23';
	}	
  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=" + scr + "&OPE=" + ope + "&E01CUN=" + cli;
  	CenterWindow(pg,600,500,2);
}

function goNewEnt(cli) {
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=21&OPE=22";
  	entWindow = window.open(pg,"entWindow", "width=600,height=500,toolbar=no,scrollbars=yes,resizable=yes");
}

function goFinancial(cli, rpn) {
	if (cli == 0 || cli == 999999999) {
		alert("Cliente No tiene aun numero asignado !!!")
		return;
	}
	var screenF = "12";
	<% 	if (userPO.getPurpose().equals("INQUIRY")) { %>
		screenF = "11";
	<%	} %>
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1095?SCREEN=" + screenF + "&E02IFIRPN=" + rpn + "&E02IFICUN=" + cli;
  	finWindow = window.open(pg,"finWindow", "width=600,height=700,toolbar=no,scrollbars=yes,resizable=yes");
}

function updateIFF(p) {
	
 	if (p == "Y") {  // Estados Financieros Fiscales
		getElement('IFF').style.display='block';
	} else {   
		getElement('IFF').style.display='block';
	}
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
    String disabledNew = (userPO.getPurpose().equals("NEW")?" disabled":"");
    String mTitle = "Mantenimiento ";
	String read = "";
 	String disabled = "";
 	String disabledS = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >"; 
 	String tf = "false";
 	Boolean isReadOnly = false;
 	Boolean isNew = false;
 	Boolean readMntS = false;
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
	{ 	  read = " readonly ";
		  disabled = " disabled";
		  disabledNew = " disabled";
		  tf = "true";
		  isReadOnly = true;
	}

	
	if (client.getE01CRT().equals("Y")) isNew = true;
	String readMnt = (isNew?"":" readonly");
	readMntS = (isNew?false:true);
	disabledS = (isNew?"":" disabled");
	
	if (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL")) {
		readMnt = " readonly";
		mTitle = "Consulta ";
		readMntS = true;
		disabledS = " disabled";
	}	
	
	boolean maintenance = !client.getE01CUN().equals(999999999);
	
	String chkOfac = "";
	chkOfac = (client.getH01FLGWK3().equals("3") ? "<a href=\"javascript:showInqOFAC('"
								+ client.getE01CUN()
								+ "')\"><img src=\"../images/warning_16.jpg\" alt=\"Lista de Control Posible Coincidencia\" align=\"middle\" border=\"0\" ></a>"
								: "");	
	int row = 0;
%>


<H3 align="center"><%=mTitle%> de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_basic.jsp, ESD1080"></H3>
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
  <INPUT TYPE=HIDDEN NAME="E01SEX" VALUE="<%= client.getE01SEX()%>">
  <INPUT TYPE=HIDDEN NAME="E01PRV" VALUE="<%= client.getE01PRV()%>">
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
				<INPUT type="text" name="LEGNME" size="60" readonly value="<%= client.getE01NM6().trim()%>" <%=(client.getF01NM6().equals("Y"))?"id=\"txtchanged\"":"" %>>
			</td>
            <td nowrap width="5%" align="right">Nombre Corto :</td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01SHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="26" required="false" readonly="true"/>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Tipo ID : </td>
            <td nowrap width="10%" align="left">
            	<eibsinput:text name="client" property="E01TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" /> 
			</td>
            <td nowrap width="5%" align="right"><%= client.getD01TID().trim()%> : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="client" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true"/>
			</td>
            <td nowrap width="5%" align="right">País Identificación : </td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01PID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true"/>
				<%= client.getD01PID().trim()%>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Fecha Efectiva <br> Ultima Actualización :</td>
            <td nowrap width="10%" align="left">
            	<%=client.getH01TIMSYS().substring(0,4)%>/<%=client.getH01TIMSYS().substring(4,6)%>/<%=client.getH01TIMSYS().substring(6,8)%> 
            	<%=client.getH01TIMSYS().substring(8,10)%>:<%=client.getH01TIMSYS().substring(10,12)%> 
			</td>
            <td nowrap width="5%" align="right">Condición / Normativo : </td> 
			<td nowrap width="40%" align="left" style="color:green;font-size:12;">
				<%= client.getD01TSE().trim()%>	/ <%= client.getD01AX5().trim()%>
			</td>
            <td nowrap width="5%" align="right">Nota Interna : </td>
			<td nowrap width="35%" align="left">
				<%= client.getD01INL().trim()%>
			</td>
		</tr>
       </table>
     
<div id="tabs">  
	<ul>
    	<li><a href="#tab1">Información Básica</a></li>
    	<li><a href="#tab2">Ubicación</a></li>
    	<li><a href="#tab3">Información Laboral</a></li>
    	<li><a href="#tab4">Información Financiera</a></li>
    	<li><a href="#tab5">Información SARLAFT</a></li>
    	<li><a href="#tab6">Referencias</a></li>
    	<li><a href="#tab7">Uso Exclusivo del Banco</a></li>
    	<li><a href="#tab8">Datos de Entrevista</a></li>
    	<li><a href="#tab9">FATCA - CRS</a></li>
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
            	<eibsinput:text name="client" property="E01FNA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="true" readonly="true" onchange="chgNme()" /> 
            </td>
            <td nowrap width="15%" align="right">Segundo Nombre :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01FN2().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<input type="text" name="PFN2" size="45" maxlength="40" value="<%= client.getE01FN2().trim()%>" readonly onChange="chgNme()" >
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Primer Apellido :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01LN1().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <input type="text" name="PLN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" readonly onChange="chgNme()">
                <%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Segundo Apellido :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01LN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" readonly="true" onchange="chgNme()" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Genero :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01SEX().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <p> 
                <input type="radio" name="SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %> disabled >
                Femenino 
                <input type="radio" name="SEX" value="M" <%if (!client.getE01SEX().equals("F")) out.print("checked"); %> disabled >
                Masculino 
                </p>
            </td>
            <td nowrap width="15%" align="right">Estado Civil :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01MST().equals("Y"))?"id=\"txtchanged\"":"" %>>
                <select name="PMST" <%= disabled %>>
                	<option value=" " <% if (!(client.getE01MST().equals("1")||client.getE01MST().equals("2") || client.getE01MST().equals("3")||client.getE01MST().equals("4")||client.getE01MST().equals("5")||client.getE01MST().equals("6"))) out.print("selected"); %>> 
                    </option>
                    <option value="1" <% if (client.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (client.getE01MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (client.getE01MST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (client.getE01MST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (client.getE01MST().equals("5")) out.print("selected"); %>>Unión Libre</option>
                    <option value="6" <% if (client.getE01MST().equals("6")) out.print("selected"); %>>Otro</option>
                </select>
                <%=mandatory %>
            </td>
         </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
          	<% 	if (client.getE01LGT().trim().equals("2")) { %>    
            <td nowrap width="15%" align="right">Nro. de Hijos : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01TER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="2" required="false" readonly="<%=isReadOnly %>" />
            </td>
            <% } else { %>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
            <%} %>  
            <td nowrap width="15%" align="right">Jefe de Familia : </td>
            <td nowrap width="35%" align="left" <%=(client.getF01FG2().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<input type="radio" name="E01FG2" value="Y" <%if (client.getE01FG2().equals("Y")) out.print("checked"); %> <%= disabled %>>
                    Si 
                <input type="radio" name="E01FG2" value="N" <%if (!client.getE01FG2().equals("Y")) out.print("checked"); %> <%= disabled %>>
                    No 
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Nro. de Personas a Cargo :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01NSO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="2" required="false" readonly="<%=isReadOnly %>" />
            </td>
            <td nowrap width="15%" align="right">País de Residencia : </td>
            <td nowrap width="35%" align="left" <%=(client.getF01GEC().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<eibsinput:cnofc name="client" property="E01GEC" value="<%=client.getE01GEC()%>"  maxlength="2" required="true" flag="03" fn_code="E01GEC" fn_description="D01GEC" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01GEC" value="<%=client.getD01GEC()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Fecha de Nacimiento :</td>
              <td nowrap width="35%" align="left" <%=(client.getF01BDY().equals("Y") || client.getF01BDM().equals("Y") || client.getF01BDD().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<INPUT type="text" name="PBDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" onkeypress="enterInteger(event)" readonly onblur="age();">
				<INPUT type="text" name="PBDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" onkeypress="enterInteger(event)" readonly onblur="age();">
				<INPUT type="text" name="PBDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" onkeypress="enterInteger(event)" readonly onblur="age();">
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
            	<% 	if (!client.getE01LGT().trim().equals("1")) { %> 
            	<eibsinput:cnofc name="client" property="E01N5P" value="<%=client.getE01N5P()%>" size="5" maxlength="2" required="false" flag="03" fn_code="E01N5P" fn_description="D01N5P" readonly="<%=isReadOnly %>" />
            	<%=mandatory %>
            	<input type="text" name="D01N5P" size="20" value="<%= client.getD01N5P().trim()%>" readonly> <br>
            	 
            	<input type="text" name="E01N5D" size="5" maxlength="2" value="<%= client.getE01N5D().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N5D','D01N5D','27', '',document.forms[0]['E01N5P'].value)" ><%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01N5D" size="20" value="<%= client.getD01N5D().trim()%>" readonly><br>
            	<input type="text" name="E01N5C" size="5" maxlength="4" value="<%= client.getE01N5C().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N5C','D01N5C','84', '',document.forms[0]['E01N5D'].value)" ><%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01N5C" size="20" value="<%= client.getD01N5C().trim()%>" readonly>
            	<%} %> 
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
              		<%=mandatory %>
            	<input type="text" name="D01N3D" size="20" value="<%= client.getD01N3D().trim()%>" readonly><br>
            	<input type="text" name="E01N3C" size="5" maxlength="4" value="<%= client.getE01N3C().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N3C','D01N3C','84', '',document.forms[0]['E01N3D'].value)" >
              		<%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01N3C" size="20" value="<%= client.getD01N3C().trim()%>" readonly>
            </td>
         </tr>
         
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Nacionalidad  : </td>
            <td nowrap width="35%" align="left">
               	<eibsinput:cnofc name="client" property="E01CCS" value="<%=client.getE01CCS()%>"  maxlength="2"  required="true" flag="03" fn_code="E01CCS" fn_description="D01CCS" readonly="<%=isReadOnly %>" /> 
				<input TYPE="text" NAME="D01CCS" value="<%=client.getD01CCS()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Registrado en Biometría : </td>
            <td nowrap width="35%" align="left">
            	<input type="radio" name="E01TX8" value="Y" <%if (client.getE01TX8().equals("Y")) out.print("checked"); %> <%= disabledS %>>
                    Si 
                <input type="radio" name="E01TX8" value="N" <%if (!client.getE01TX8().equals("Y")) out.print("checked"); %> <%= disabledS %>>
                    No 
                <eibsinput:cnofc name="client" property="E01OBC" value="<%=client.getE01OBC()%>" size="3" maxlength="2" required="false" flag="BO" fn_code="E01OBC" fn_description="D01OBC" readonly="<%=readMntS %>" />
                <input type="text" name="D01OBC" size="20" value="<%= client.getD01OBC().trim()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Nivel Educativo : </td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01EDL" value="<%=client.getE01EDL()%>" required="true" flag="29" fn_code="E01EDL" fn_description="D01EDL" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01EDL" value="<%=client.getD01EDL()%>" readonly>
              </td>
            <td nowrap width="15%" align="right">Profesión : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01UC9" value="<%=client.getE01UC9()%>" required="true" flag="49" fn_code="E01UC9" fn_description="D01UC9" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01UC9" value="<%=client.getD01UC9()%>" readonly>
            </td>
         </tr>
         
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
         	<td nowrap width="15%" align="right">Tiene Empresa : </td>
            <td nowrap width="35%" align="left">
                <input type="radio" name="E01TX6" value="Y" <%if (client.getE01TX6().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateEMP('Y')">
               	Si 
               	<input type="radio" name="E01TX6" value="N" <%if (!client.getE01TX6().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateEMP('N')">
               	No
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
   
<div id="JURIDICO" style="position:relative; display:none;">
  
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
            <td nowrap width="15%" align="right">Nombre Comercial :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01FN2().equals("Y") || client.getF01LN1().equals("Y"))?"id=\"txtchanged\"":"" %>> 
               	<input type="text" name="JFN2" size="45" maxlength="40" value="<%= client.getE01FN2().trim()%>" <%=read%>><br>
               	<input type="text" name="JLN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" <%=read%>>
            </td>
            <td nowrap width="15%" align="right">Nombre Anterior : </td>
            <td nowrap width="35%" align="left" <%=(client.getF01CP1().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<input type="text" name="JCP1" size="46" maxlength="45" value="<%= client.getE01CP1().trim()%>" <%=read%>>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tipo de Entidad :</td>
            <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01UC2" value="<%=client.getE01UC2()%>" required="true" flag="RI" fn_code="E01UC2" fn_description="D01UC2" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01UC2" size="20" value="<%= client.getD01UC2().trim()%>" readonly>	 	
            </td>
            <td nowrap width="15%" align="right">Empresa en <%= client.getD01GEC().trim()%> es : </td>
            <td nowrap width="35%" align="left" <%=(client.getF01MST().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<select name="JMST" <%= disabled %>>
                	<option value=" " <% if (!(client.getE01MST().equals("P")||client.getE01MST().equals("A") || client.getE01MST().equals("S"))) out.print("selected"); %>> 
                    </option>
                    <option value="P" <% if (client.getE01MST().equals("P")) out.print("selected"); %>>Principal</option>
                    <option value="A" <% if (client.getE01MST().equals("A")) out.print("selected"); %>>Agencia</option>                   
                    <option value="S" <% if (client.getE01MST().equals("S")) out.print("selected"); %>>Sucursal</option>
                </select>
                <%=mandatory %>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Naturaleza Jurídica :</td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01UC3" value="<%=client.getE01UC3()%>" required="true" flag="RN" fn_code="E01UC3" fn_description="D01UC3" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01UC3" size="20" value="<%= client.getD01UC3().trim()%>" readonly>	 	
              </td>
            <td nowrap width="15%" align="right">Tipo de Negocio :</td>
            <td nowrap width="35%" align="left">
            	<% 	if (client.getE01LGT().trim().equals("1")) { %>
            	<eibsinput:cnofc name="client" property="E01UC4" value="<%=client.getE01UC4()%>" required="false" flag="C7" fn_code="E01UC4" fn_description="D01UC4" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01UC4" size="20" value="<%= client.getD01UC4().trim()%>" readonly>
       	        <% } %>  
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Fecha de Constitución :</td>
              <td nowrap width="35%" align="left" <%=(client.getF01BDY().equals("Y") || client.getF01BDM().equals("Y") || client.getF01BDD().equals("Y") )?"id=\"txtchanged\"":"" %>>
              	<INPUT type="text" name="JBDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" onkeypress="enterInteger(event)" <%=read%> onchange="age();">
				<INPUT type="text" name="JBDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" onkeypress="enterInteger(event)" <%=read%> onchange="age();">
				<INPUT type="text" name="JBDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" onkeypress="enterInteger(event)" <%=read%> onchange="age();">
				<% if ( !isReadOnly) {%>
				<A href="javascript:DatePicker(document.forms[0].JBDD,document.forms[0].JBDM,document.forms[0].JBDY)">
				<img src="<%=request.getContextPath()%>/images/calendar.gif" title="Ayuda" align="middle" border="0"></A>
			  	<%=mandatory %>
                <% } %> 
                 <label id="lAge"></label>
                <input TYPE="text" NAME="JAGE" size="3" readonly> 
              </td>
            <td nowrap width="15%" align="right">Lugar de Constitución : <br>País / Dpto. / Ciudad</td>
            <td nowrap width="35%" align="left" <%=(client.getF01N5P().equals("Y"))?"id=\"txtchanged\"":"" %>>
   				<% 	if (client.getE01LGT().trim().equals("1")) { %> 
				<eibsinput:cnofc name="client" property="E01N5P" value="<%=client.getE01N5P()%>" size="5" maxlength="2" required="false" flag="03" fn_code="E01N5P" fn_description="D01N5P" readonly="<%=isReadOnly %>" />
            	<%=mandatory %>
            	<input type="text" name="D01N5P" size="20" value="<%= client.getD01N5P().trim()%>" readonly> <br>
            	<input type="text" name="E01N5D" size="5" maxlength="2" value="<%= client.getE01N5D().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N5D','D01N5D','27', '',document.forms[0]['E01N5P'].value)" ><%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01N5D" size="20" value="<%= client.getD01N5D().trim()%>" readonly><br>
            	<input type="text" name="E01N5C" size="5" maxlength="4" value="<%= client.getE01N5C().trim()%>" <%=read%> > 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E01N5C','D01N5C','84', '',document.forms[0]['E01N5D'].value)" ><%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01N5C" size="20" value="<%= client.getD01N5C().trim()%>" readonly>
            	<% } %> 
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Forma de Constitución :</td>
              <td nowrap width="35%" align="left">
              	 <eibsinput:cnofc name="client" property="E01UC6" value="<%=client.getE01UC6()%>" required="true" flag="F3" fn_code="E01UC6" fn_description="D01UC6" readonly="<%=isReadOnly %>"/>
       	         <input type="text" name="D01UC6" size="20" value="<%= client.getD01UC6().trim()%>" readonly>
              </td>
            <td nowrap width="15%" align="right">Ultima Fecha de Renovación : </td>
            <td nowrap width="35%" align="left">
            	<% 	if (client.getE01LGT().trim().equals("1")) { %> 
              	<eibsinput:date name="client" fn_year="E01SWY" fn_month="E01SWM" fn_day="E01SWD" required="false" readonly="<%=isReadOnly %>"/>
              	<% } %>
            </td>
         </tr>
         <% if (client.getE01LGT().trim().equals("1")) { %>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
         <td nowrap width="15%" align="right">Cantidad de Empleados :</td>
            <td nowrap width="35%" align="left">
              <eibsinput:text name="client" property="E01NEM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="<%=isReadOnly %>"/>
              Remunerados :
              <eibsinput:text name="client" property="E01AM2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="<%=isReadOnly %>"/>
              No Remunerados :
              <eibsinput:text name="client" property="E01AM3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="<%=isReadOnly %>"/>
            </td>
                
            <td nowrap width="15%" align="right">Fecha de Inicio de Actividades : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:date name="client" fn_year="E01REY" fn_month="E01REM" fn_day="E01RED" required="true" readonly="<%=isReadOnly %>" />
            </td>
         </tr>
         <%} %>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <% 	if (client.getE01LGT().trim().equals("1")) { %>    
            <td nowrap width="15%" align="right">Nro. de Sucursales : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01TER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="false" readonly="<%=isReadOnly %>" />
            </td>
            <% } else { %>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
            <%} %>
            <td nowrap width="15%" align="right">Tipo de Local :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01FC4" value="<%=client.getE01FC4()%>" required="false" flag="C9" fn_code="E01FC4" fn_description="D01FC4" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01FC4" size="20" value="<%= client.getD01FC4().trim()%>" readonly>  
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
              	<eibsinput:cnofc name="client" property="E01SST" value="<%=client.getE01SST()%>" required="true" flag="S3" fn_code="E01SST" fn_description="D01SST" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01SST" value="<%=client.getD01SST()%>" readonly>
              </td>
            <td nowrap width="15%" align="right">Caja de Compensación : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01CCO" value="<%=client.getE01CCO()%>" required="true" flag="EM" fn_code="E01CCO" fn_description="D01AX6" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01AX6" value="<%=client.getD01AX6()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Operaciones <br> Medios Electrónicos :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01FL8().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<%
              	boolean bACH = (client.getE01FL8().indexOf("A") > -1);
              	boolean bINT = (client.getE01FL8().indexOf("I") > -1);
              	boolean bCAJ = (client.getE01FL8().indexOf("C") > -1);
              	boolean bSEB = (client.getE01FL8().indexOf("S") > -1);
              	boolean bIVR = (client.getE01FL8().indexOf("V") > -1); 
              	boolean bTES = (client.getE01FL8().indexOf("T") > -1);
              %>
              <INPUT type="checkbox" name="INT" value="I" <% if (bINT == true) out.print("checked"); %> <%=disabled%>>Internet
              <INPUT type="checkbox" name="ACH" value="A" <% if (bACH == true) out.print("checked"); %> <%=disabled%>>ACH
              <INPUT type="checkbox" name="CAJ" value="C" <% if (bCAJ == true) out.print("checked"); %> <%=disabled%>>Caj. Autom.
              <INPUT type="checkbox" name="SEB" value="S" <% if (bSEB == true) out.print("checked"); %> <%=disabled%>>SEBRA
              <INPUT type="checkbox" name="IVR" value="V" <% if (bIVR == true) out.print("checked"); %> <%=disabled%>>IVR
              <%-- <INPUT type="checkbox" name="TES" value="T" <% if (bTES == true) out.print("checked"); %> <%=disabled%>>Tesorería --%> 
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
          </tr>
          <% 	if (!client.getE01LGT().trim().equals("1")) { %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
         	<td nowrap width="15%" align="right">Nro. de Propiedades Finca Raiz :</td>
            <td nowrap width="35%" align="left">
              	<eibsinput:text name="client" property="E01NEM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="false" readonly="<%=isReadOnly %>"/>
            </td>
            <td nowrap width="15%" align="right">Nro. de Vehículos : </td>
            <td nowrap width="35%" align="left">
           		<eibsinput:text name="client" property="E01MPA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="2" required="false" readonly="<%=isReadOnly %>"/>
            </td>
         </tr>
         <<% } %> > 
       	  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tiene Exenciones : </td>
            <td nowrap width="35%" align="left">
            	<div onClick="msgTAX()">
              	<p> 
               <input type="radio" name="E01TAX" value="Y" <%if (client.getE01TAX().equals("Y")) out.print("checked"); %> disabled>
                SI 
                <input type="radio" name="E01TAX" value="N" <%if (!client.getE01TAX().equals("Y")) out.print("checked"); %> disabled>
                NO 
                </p>
                </div>
            </td>  
            <% 	if (client.getE01LGT().trim().equals("2")) { %>
            	<td nowrap width="15%" align="right">Cobertura en Salud : </td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:cnofc name="client" property="E01UC4" value="<%=client.getE01UC4()%>" required="true" flag="EN" fn_code="E01UC4" fn_description="D01UC4" readonly="<%=isReadOnly %>"/>
       	        	<input type="text" name="D01UC4" size="20" value="<%= client.getD01UC4().trim()%>" readonly>
       	        </td>	
       	        <% } else { %>
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left">
            	</td>
            	<% } %>
          </tr>
          <% if( currUser.getE01INT().equals("05")){%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="15%" align="right">Autoretenedor Renta :</td>
            	<td nowrap width="35%" align="left"> 
            		<input type="radio" name="E01TX1" value="Y" <%if (client.getE01TX1().equals("Y")) out.print("checked"); %> <%= disabled %>>
                    Si 
                    <input type="radio" name="E01TX1" value="N" <%if (!client.getE01TX1().equals("Y")) out.print("checked"); %> <%= disabled %>>
                    No 
              	</td>
              	<td nowrap width="15%" align="right">Tipo de Contribuyente :</td>
              	<td nowrap width="35%" align="left" >
              		<select name="E01TX3" <%= disabled %> <%=(client.getF01TX3().equals("Y"))?"id=\"txtchanged\"":"" %> >
						<option value=" " <% if (!(client.getE01TX3().equals("R")||client.getE01TX3().equals("E")||client.getE01TX3().equals("N")||client.getE01TX3().equals("O"))) out.print("selected"); %>> </option>               
               			<option value="R" <% if (client.getE01TX3().equals("R")) out.print("selected"); %>>Ordinario</option>
                		<option value="E" <% if (client.getE01TX3().equals("E")) out.print("selected"); %>>Règimen Especial</option>
                		<option value="N" <% if (client.getE01TX3().equals("N")) out.print("selected"); %>>No Contribuyente</option>
                		<option value="O" <% if (client.getE01TX3().equals("O")) out.print("selected"); %>>Otro</option>
              		</select>
              <%=mandatory %> 
              </td>
            </tr>
          	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Autoretenedor de ICA :</td>
            <td nowrap width="35%" align="left"> 
                <input type="radio" name="E01TX4" value="Y" <%if (client.getE01TX4().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01TX4" value="N" <%if (!client.getE01TX4().equals("Y")) out.print("checked"); %> <%= disabled %>>
                No
            </td>
            <td nowrap width="15%" align="right">Tiene RUT : </td>
            <td nowrap width="35%" align="left">
            	<input type="radio" name="E01TX9" value="Y" <%if (client.getE01TX9().equals("Y")) out.print("checked"); %> <%= disabled %>>
               	Si 
               	<input type="radio" name="E01TX9" value="N" <%if (!client.getE01TX9().equals("Y")) out.print("checked"); %> <%= disabled %>>
               	No
            </td>  
            </tr>
	 		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Agente de Retenciòn IVA:</td>
            <td nowrap width="35%" align="left"> 
            	<input type="radio" name="E01TX5" value="Y" <%if (client.getE01TX5().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01TX5" value="N" <%if (!client.getE01TX5().equals("Y")) out.print("checked"); %> <%= disabled %>>
                No
              </td>
              <td nowrap width="15%" align="right">Regimen Tributario :</td>
              <td nowrap width="35%" align="left">
              	<select name="E01TX2" <%= disabled %> <%=(client.getF01TX2().equals("Y"))?"id=\"txtchanged\"":"" %>>
					<option value=" " <% if (!(client.getE01TX2().equals("C")||client.getE01TX2().equals("E")||client.getE01TX2().equals("S")||client.getE01TX2().equals("O")||client.getE01TX2().equals("Y"))) out.print("selected"); %>> </option>
					<option value="E" <% if (client.getE01TX2().equals("E")) out.print("selected"); %>>Regimen Especial</option>               
                	<option value="C" <% if (client.getE01TX2().equals("C")) out.print("selected"); %>>Regimen Comun</option>
                	<option value="S" <% if (client.getE01TX2().equals("S")) out.print("selected"); %>>Regimen Simplificado</option>
                	<option value="O" <% if (client.getE01TX2().equals("O")) out.print("selected"); %>>Otros</option>
                	<option value="Y" <% if (client.getE01TX2().equals("Y")) out.print("selected"); %>>Gran Contribuyente</option>
              	</select>
              	<%=mandatory %>
              </td>
            </tr>
            <%} %>
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
                	<option value=" " <% if (!(client.getE01TUD().equals("U")|| client.getE01TUD().equals("R") || client.getE01TUD().equals("S"))) out.print("selected"); %>> 
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
            		<eibsinput:cnofc name="client" property="E01FG1" value="<%=client.getE01FG1()%>" required="true" flag="G2" fn_code="E01FG1" fn_description="D01FG1" readonly="<%=isReadOnly %>"/> 
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
                <%=mandatory %>
            	</td>
         	</tr>
         	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            	<td nowrap width="15%" align="right"></td>
            	<td nowrap width="35%" align="left"> 
            	</td>
            	<td nowrap width="15%" align="right">Tiempo en Vivienda Actual :</td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:text name="client" property="E01TVY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="4" maxlength="3" required="true" readonly="<%=isReadOnly %>"/>Años 
              		<eibsinput:text name="client" property="E01TVM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" required="true" readonly="<%=isReadOnly %>"/>Meses
            	</td>
         	</tr>
		<% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right"><label id="lTel"></label></td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01PHO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="20" maxlength="15" required="true" readonly="<%=isReadOnly %>"/>
            	Ext :
            	<eibsinput:text name="client" property="E01PHX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" required="false" readonly="<%=isReadOnly %>"/>
            	Indicativo : <%=client.getD01AX1()%> 
            </td>
            <td nowrap width="15%" align="right">Tipo de Teléfono Principal :</td>
            <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01PHT" value="<%=client.getE01PHT()%>" required="true" size="5" flag="DO" fn_code="E01PHT" fn_description="D01PHT" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01PHT" value="<%=client.getD01PHT()%>" readonly> 
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
            	<eibsinput:text name="client" property="E01PHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="20" maxlength="15" required="true" readonly="<%=isReadOnly %>"/>
            	Ext :
            	<eibsinput:text name="client" property="E01PNX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" required="false" readonly="<%=isReadOnly %>"/>
            	Indicativo : <%=client.getD01AX2()%>
            </td>
          	<td nowrap width="15%" align="right">Tipo de Teléfono Adicional : </td>
            <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01PNT" value="<%=client.getE01PNT()%>" required="true" size="5" flag="DO" fn_code="E01PNT" fn_description="D01PNT" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01PNT" value="<%=client.getD01PNT()%>" readonly> 
            </td>
          </tr>
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
           	<td nowrap width="15%" align="right">Correo Electrónico :</td>
           	<td nowrap width="35%" align="left">
           		<input type="text" name="E01IAD" size="61" maxlength="60" value="<%= client.getE01IAD().trim()%>" <%=read %>>
           		<%=mandatory %> 
            </td>
            <td nowrap align="right">Tipo Correo Electrónico :</td>
        	<td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01IAT" value="<%=client.getE01IAT()%>" required="true" size="5" flag="DR" fn_code="E01IAT" fn_description="D01IAT" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01IAT" value="<%=client.getD01IAT()%>" readonly>
 	       </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Envío de Correspondencia : </td>
            <td nowrap width="35%" align="left">
            	<select name="E01FL5" <%= disabled %>>
                	<option value=" " <% if (!(client.getE01FL5().equals("R") || client.getE01FL5().equals("C") || client.getE01FL5().equals("O"))) out.print("selected"); %>> 
                    </option> 
                    <option value="R" <% if (client.getE01FL5().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
                    <option value="C" <% if (client.getE01FL5().equals("C")) out.print("selected"); %>>Correo Electrónico</option>
                    <option value="O" <% if (client.getE01FL5().equals("O")) out.print("selected"); %>>Oficina del Banco</option>
                </select>
                <%=mandatory %>
            </td>  
            <td nowrap width="15%" align="right">Canal de Contacto Preferido :</td>
              <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01SCH" value="<%=client.getE01SCH()%>" required="false" flag="62" fn_code="E01SCH" fn_description="D01SCH" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01SCH" size="20" value="<%= client.getD01SCH().trim()%>" readonly>
            </td>
          </tr>
        </table>    
	</td>	
   </tr>
  </table>		
</div>		

<div id="tab3">  <!-- Informacion Laboral  -->
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>
<% 
 if (!isReadOnly){
%>
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="100%">
			<a href="javascript:goNewEnt('<%= client.getE01CUN().trim()%>')"><b>Crear<br>Entidad</b></a>
      	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="100%">
			<a href="javascript:goInquiryEnt('N','<%= client.getE01RUC().trim()%>')"><b>Consultar<br>Entidad</b></a>
      	</TD>
	</TR>
</TABLE> 
<%} %> 
		<h4>Empresa donde Labora</h4>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Número de Cliente / Prospecto / Entidad : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01RUC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="10" maxlength="9" required="false" readonly="<%=isReadOnly %>"/> 
                	<% if ( !isReadOnly) {%>
              			<A href="javascript:GetCustomerDescId('E01RUC','PCP1','','')"><%=help%></a> 
              		<% } %>
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>   
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Nombre de la Empresa : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01CP1().equals("Y"))?"id=\"txtchanged\"":"" %>> 
                <input type="text" name="PCP1" size="46" maxlength="45" value="<%= client.getE01CP1().trim()%>" readonly>
              </td>
              <td nowrap width="15%" align="right">Cargo en la Empresa :</td>
              <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01FC5" value="<%=client.getE01FC5()%>" required="false" flag="32" fn_code="E01FC5" fn_description="D01FC5" readonly="<%=isReadOnly %>" /> 
				<input TYPE="text" NAME="D01FC5" value="<%=client.getD01FC5()%>" readonly>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Tipo de Contrato :</td>
            	<td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01EPT" value="<%=client.getE01EPT()%>" required="false" flag="N3" fn_code="E01EPT" fn_description="D01EPT" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01EPT" size="20" value="<%= client.getD01EPT().trim()%>" readonly>
              </td>
              <td nowrap width="15%" align="right">Fecha de Vinculación :</td>
              <td nowrap width="35%" align="left">
              	<% 	if (!client.getE01LGT().trim().equals("1")) { %> 
              	<eibsinput:date name="client" fn_year="E01SWY" fn_month="E01SWM" fn_day="E01SWD" required="false" readonly="<%=isReadOnly %>"/>
              	<% } %>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Total descuentos por Nomina : </td>
              <td nowrap width="35%" align="left"> 
              	<input type="text" name="E01AM1" size="22" maxlength="21" value="<%= client.getE01AM1().trim()%>" onKeypress="enterDecimal(event, 2)" <%=read%>>	
              </td>
              <td nowrap width="15%" align="right">Antiguedad (Años/Meses) :  </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E01TIY" size="4" value="<%= client.getE01TIY().trim()%>" readonly> /
              	<input type="text" name="E01TIM" size="3" value="<%= client.getE01TIM().trim()%>" readonly> 
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
		  <% } else { %>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Nro. Personas en Grupo Familiar : </td>
            <td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01CT1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="2" required="true" readonly="true"/>              
            </td>
            <td nowrap width="15%" align="right">Nro. Personas en Grupo Familiar con Capacidad de Pago : </td>
            <td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01CT2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="2" required="true" readonly="true"/>              
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

<div id="tab6"> <!-- Referencias  -->

 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Tipo de Referencia :</td>
              <td nowrap width="35%" align="left">
                <select name="E1RRTP" onchange="chgRef(this.value)" <%= disabled %>>
                	<option value=" " <% if (!(client.getE1RRTP().equals("P")||client.getE1RRTP().equals("F") || client.getE1RRTP().equals("7"))) out.print("selected"); %>> 
                    </option>
                    <% 	if (client.getE01LGT().trim().equals("1")) { %>
                    <option value="7" <% if (client.getE1RRTP().equals("7")) out.print("selected"); %>>Comercial</option>
                    <% } else { %>
                    <option value="P" <% if (client.getE1RRTP().equals("P")) out.print("selected"); %>>Personal</option>
                    <option value="F" <% if (client.getE1RRTP().equals("F")) out.print("selected"); %>>Familiar</option>                   
                    <% } %>
                </select>
                <%=mandatory %>
              </td>
              <td nowrap width="15%" align="right">Cliente / Entidad : </td>
              <td nowrap width="35%" align="left"> 
              	<input type="text" name="E1RRCN" size="10" maxlength="9" value="<%= client.getE1RRCN().trim()%>" <%=read%> onkeypress="enterInteger(event)">
   					<% if (!isReadOnly) { %>
       					<a href="javascript:GetCustomerDetails('E1RRCN','E1RMA1','','','','','','','','','','','','','','','','')"><%=help%></a> 
              		<% } %>	 
              </td>
            </tr>
            <% 	if (client.getE01LGT().trim().equals("1")) { %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Empresa :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E1RMA1" size="65" maxlength="60" value="<%= client.getE1RMA1().trim()%>" <%=read%>>
                <%=mandatory %> 
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Nombre del Contacto :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E1RNM3" size="60" maxlength="80" value="<%= client.getE1RNM3().trim()%>" <%=read%>>
              	<%=mandatory %>
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              	
              </td>
            </tr>
            <% } else { %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Nombres :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E1RNM3" size="45" maxlength="40" value="<%= client.getE1RNM3().trim()%>" <%=read%>>
                <%=mandatory %> 
              </td>
              <td nowrap width="15%" align="right">Primer Apellido :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E1RNM4" size="45" maxlength="40" value="<%= client.getE1RNM4().trim()%>" <%=read%>>
              <%=mandatory %> 
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Segundo Apellido :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E1RNM5" size="45" maxlength="40" value="<%= client.getE1RNM5().trim()%>" <%=read%>>
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
            <% } %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Teléfono Contacto : </td>
              <td nowrap width="35%" align="left">
              	Tipo :
              	<eibsinput:cnofc name="client" property="E1RPHT" value="<%=client.getE1RPHT()%>" required="true" size="5" flag="DO" fn_code="E1RPHT" fn_description="D1RPHT" readonly="<%=isReadOnly %>"/>
				<input TYPE="text" NAME="D1RPHT" value="<%=client.getD1RPHT()%>" readonly>
				Nro. :    
              	<eibsinput:text name="client" property="E1RHPN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="20" maxlength="15" required="true" readonly="<%=isReadOnly %>"/>
              	Ext : 
              	<eibsinput:text name="client" property="E1REXT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" required="false" readonly="<%=isReadOnly %>"/>
              	Indicativo : <%=client.getD01AX4()%> 
              </td>
              <td nowrap width="15%" align="right"> </td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="15%" align="right">País / Dpto. :</td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:cnofc name="client" property="E1RCTR" value="<%=client.getE1RCTR()%>" size="5" maxlength="2" required="false" flag="03" fn_code="E1RCTR" fn_description="D1RCTR" readonly="<%=isReadOnly %>" />
            		<%=mandatory %>
            		<input type="text" name="E1RSTE" size="5" maxlength="2" value="<%= client.getE1RSTE().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:Get2FilterCodes('E1RSTE','D1RSTE','27', '','<%= currUser.getE01CTR().trim()%>')" ><%=help%></a>
              		<% } %>
            		<input type="text" name="D1RSTE" size="20" value="<%= client.getD1RSTE().trim()%>" readonly>
 	            </td>	
 	           	<td nowrap width="15%" align="right">Ciudad :</td>
            	<td nowrap width="35%" align="left">	 
					<input type="text" name="E1RCTC" maxlength="3" size="4" value="<%= client.getE1RCTC().trim()%>" <%=read%>>
					<% if(!isReadOnly){ %>
					<a href="javascript:Get2FilterCodes('E1RCTC','D1RCTC','84', '',document.forms[0]['E1RSTE'].value)" ><%=help%></a>
 	           		<%=mandatory %> 
 	           		<% } %>
 	           		<input type="text" name="D1RCTC" size="20" value="<%= client.getD1RCTC().trim()%>" readonly>  
            	</td>
            </tr>
        </table>
        <div id="REFFAM" style="position:relative; display:none;">
            <table width="100%">
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Vinculo / Parentesco :</td>
              <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E1RRTL" value="<%=client.getE1RRTL()%>" required="false" flag="9W" fn_code="E1RRTL" fn_description="D1RRTL" readonly="<%=isReadOnly %>"/>
            		<input type="text" name="D1RRTL" size="20" value="<%= client.getD1RRTL().trim()%>" readonly>
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
            </table>
        </div>
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
              <td nowrap width="15%" align="right">Actualización Normativa : </td>
              <td nowrap width="35%" align="left">
              		<input type="text" name="D01AX3" size="45" value="<%= client.getD01AX3().trim()%>" readonly>
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right"> Agencia de Vinculación :</td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:help name="client" property="E01BRA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true" fn_param_one="E01BRA" fn_param_two="" 
              	 fn_param_three="D01BRA" readonly="<%=readMntS %>"/> 
              	<input type="text" name="D01BRA" size="20" value="<%= client.getD01BRA().trim()%>" readonly>
              </td>
              <td nowrap width="15%" align="right">Asesor/Ejecutivo Comercial :</td>
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
              <td nowrap width="15%" align="right">Exceptuado de Reporte a Centrales de Riesgo : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01FL6().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<input type="radio" name="E01FL6" value="Y" <%if (client.getE01FL6().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01FL6" value="N" <%if (!client.getE01FL6().equals("Y")) out.print("checked"); %> <%= disabled %>>
                No		
              </td>
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Por qué medio se enteró de nosotros : </td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01RBY" value="<%=client.getE01RBY()%>" required="true" flag="28" fn_code="E01RBY" fn_description="D01RBY" readonly="<%=isReadOnly %>"/>
       	        <input type="text" name="D01RBY" size="20" value="<%= client.getD01RBY().trim()%>" readonly>	
              </td>
              <td nowrap width="15%" align="right">Tipo de Vinculación : </td>
              <td nowrap width="35%" align="left" >
                <select name="E01STF" <%=disabled%>>
                	<option value=" " <% if (client.getE01STF().equals(" ")) out.print("selected"); %>> </option>
                    <option value="1" <% if (client.getE01STF().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (client.getE01STF().equals("2")) out.print("selected"); %>>CONTRAPARTE</option>
                    <option value="3" <% if (client.getE01STF().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="7" <% if (client.getE01STF().equals("7")) out.print("selected"); %>>CODEUDOR</option>
                    <option value="9" <% if (client.getE01STF().equals("9")) out.print("selected"); %>>CB</option>
                    <option value="I" <% if (client.getE01STF().equals("I")) out.print("selected"); %>>INTERVINIENTE</option>
                    <option value="T" <% if (client.getE01STF().equals("T")) out.print("selected"); %>>MERCADO SECUNDARIO</option>
                    <option value="E" <% if (client.getE01STF().equals("E")) out.print("selected"); %>>USUARIO</option>
                    <option value="P" <% if (client.getE01STF().equals("P")) out.print("selected"); %>>PROVEEDOR</option>
                    <option value="C" <% if (client.getE01STF().equals("C")) out.print("selected"); %>>CONVENIO</option>
                    <option value="B" <% if (client.getE01STF().equals("B")) out.print("selected"); %>>BANCARIZACION</option>
                    <option value="L" <% if (client.getE01STF().equals("L")) out.print("selected"); %>>LIDER</option>
                    <option value="S" <% if (client.getE01STF().equals("S")) out.print("selected"); %>>CONCESIONARIO</option>
                </select>
              	<%=mandatory %> 
              </td> 
            </tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Referido Por : </td>
              <td nowrap width="35%" align="left"> 
              	<input type="text" name="E01REP" size="10" maxlength="9" value="<%= client.getE01REP().trim()%>" <%=read%> onkeypress="enterInteger(event)"		>
   					<% if (!isReadOnly) { %>
       					<A href="javascript:GetCustomerDescId('E01REP','D01REP','','')"><%=help%></a> 
              		<% } %>	 
       	        <input type="text" name="D01REP" size="20" value="<%= client.getD01REP().trim()%>" readonly>	
              </td>
              <td nowrap width="15%" align="right">Marcación Comercial : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E01NM2" size="45" value="<%= client.getE01NM2().trim()%>" <%=read%>>
              </td>
            </tr>            
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Tipo de Cliente :</td>
              <td nowrap width="35%" align="left" <%=(client.getF01TYP().equals("Y"))?"id=\"txtchanged\"":"" %>> 
              	<input type="radio" name="E01TYP" value="R" <%if (!(client.getE01TYP().equals("M") || client.getE01TYP().equals("G"))) out.print("checked"); %> <%= disabled %>>
                Regular 
                <input type="radio" name="E01TYP" value="M" <%if (client.getE01TYP().equals("M")) out.print("checked"); %> <%-- = ("NEW".equals(userPO.getPurpose()))?"disabled='disabled'" : disabled --%>  disabled="disabled"  >
                Master 
                <input type="radio" name="E01TYP" value="G" <%if (client.getE01TYP().equals("G")) out.print("checked"); %> <%-- = ("NEW".equals(userPO.getPurpose()))?"disabled='disabled'" : disabled --%>  disabled="disabled"  >
                Grupo 	
              </td>
              <td nowrap width="15%" align="right">Cliente Master (Solo si es tipo Grupo) :</td>
              <td nowrap width="35%" align="left">
              	<eibsinput:help name="client" property="E01GRP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" fn_param_one="E01GRP" fn_param_two="D01GRP" 
              	 help="<%=HelpTypes.CUSTOMER_NUMBER %>" required="false"  readonly="true"  />
              	<input type="text" name="D01GRP" size="20" value="<%= client.getD01GRP().trim()%>" readonly> 
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Idioma :</td>
              <td nowrap width="35%" align="left" <%=(client.getF01LIF().equals("Y"))?"id=\"txtchanged\"":"" %>> 
              	<input type="radio" name="E01LIF" value="S" <%if (client.getE01LIF().equals("S")) out.print("checked"); %> <%= disabled %> checked="checked" >
                Español 
                <input type="radio" name="E01LIF" value="E" <%if (client.getE01LIF().equals("E")) out.print("checked"); %> disabled="disabled" >
                Inglés 	
              </td>
              <td nowrap width="15%" align="right">Nivel de Consulta : </td>
              <td nowrap width="35%" align="left">
              	 <eibsinput:cnofc name="client" property="E01ILV" value="<%=client.getE01ILV()%>" required="true" flag="NA" fn_code="E01ILV" fn_description="D01ILV" readonly="<%=isReadOnly %>"/>
       	         <input type="text" name="D01ILV" size="20" value="<%= client.getD01ILV().trim()%>" readonly>	
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Nicho :</td>
              <td nowrap width="35%" align="left"> 
                <eibsinput:cnofc name="client" property="E01CCL" value="<%=client.getE01CCL()%>" required="false" flag="CK" fn_code="E01CCL" fn_description="D01CCL" readonly="true"/>
       	        <input type="text" name="D01CCL" size="20" value="<%= client.getD01CCL().trim()%>" readonly>
              </td>
              <td nowrap width="15%" align="right">Origen de la Información :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E01DS4" size="20" value="<%= client.getE01DS4().trim()%>" readonly>
              </td>
            </tr>
            <% 	if (client.getE01LGT().trim().equals("1")) { %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Intermediario del Mercado Cambiario : </td>
              <td nowrap width="35%" align="left" <%=(client.getF01L06().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<p> 
                <input type="radio" name="E01L06" value="Y" <%if (client.getE01L06().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01L06" value="N" <%if (!client.getE01L06().equals("Y")) out.print("checked"); %> <%= disabled %>>
                No <%=mandatory %> 
                </p>
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              	<INPUT TYPE=HIDDEN NAME="E01TX7" VALUE="<%= client.getE01TX7()%>">
              </td>
            </tr>
            <%} else { %>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Tiene Familiares en el Banco : </td>
            <td nowrap width="35%" align="left">
            	<input type="radio" name="E01TX7" value="Y" <%if (client.getE01TX7().equals("Y")) out.print("checked"); %> <%= disabled %>>
               	Si 
               	<input type="radio" name="E01TX7" value="N" <%if (!client.getE01TX7().equals("Y")) out.print("checked"); %> <%= disabled %>>
               	No
            </td> 
            <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
            <% } %> 
        </table>
      </td>
    </tr>
  </table>  
</div>	

<div id="tab8"> <!-- Datos de Entrevista  -->

 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Fecha de Diligenciamiento de Formulario : </td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:date name="client" fn_year="E01A1Y" fn_month="E01A1M" fn_day="E01A1D" required="false" readonly="<%=isReadOnly %>"/>
              </td>
              <td nowrap width="15%" align="right">Solicitud para : </td> 
              <td nowrap width="35%" align="left"> 
              	<select name="E01FL3" <%=disabled%>>
                	<option value=" " <% if (!(client.getE01FL3().equals("V")||client.getE01FL3().equals("E") || client.getE01FL3().equals("N"))) out.print("selected"); %>> 
                    No Aplica</option>
                    <option value="V" <% if (client.getE01FL3().equals("V")) out.print("selected"); %>>Compra Vivienda</option>
                    <option value="E" <% if (client.getE01FL3().equals("E")) out.print("selected"); %>>Compra Vehiculo</option>                   
                    <option value="N" <% if (client.getE01FL3().equals("N")) out.print("selected"); %>>Otro</option>
                </select>
                <%=mandatory %>  
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Lugar de Diligenciamiento de Formulario : <br>País / Dpto. / Ciudad</td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01PI4" value="<%=client.getE01PI4()%>"  maxlength="2" required="true" flag="03" fn_code="E01PI4" fn_description="D01PI4" readonly="<%=isReadOnly %>"/>
              	<input type="text" name="D01PI4" size="20" value="<%= client.getD01PI4().trim()%>" readonly><br>
              	<input type="text" name="E01TI4" size="5" maxlength="4" value="<%= client.getE01TI4().trim()%>" <%=read%>> 
            		<% if(!isReadOnly){ %>
            		<a href="javascript:Get2FilterCodes('E01TI4','D01TI4','27', '',document.forms[0]['E01PI4'].value)" ><%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01TI4" size="20" value="<%= client.getD01TI4().trim()%>" readonly> 
            	<input type="text" name="E01UC1" size="5" maxlength="4" value="<%= client.getE01UC1().trim()%>" <%=read%>> 
            		<% if(!isReadOnly){ %>
            		<a href="javascript:Get2FilterCodes('E01UC1','D01UC1','84', '',document.forms[0]['E01TI4'].value)" ><%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01UC1" size="20" value="<%= client.getD01UC1().trim()%>" readonly>
              </td>
              <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Informe de Conocimiento del Cliente :</td>
              <td nowrap width="35%" align="left">
              	<textarea name="E01ICC" cols="50" rows="6" <%=disabled%>><%=client.getE01ICC()%></textarea>
              </td>
              <td nowrap width="15%" align="right">Resultado :</td> 
              <td nowrap width="35%" align="left">
              	<select name="E01REN" <%=disabled%>>
                	<option value=" " <% if (client.getE01REN().equals(" ")) out.print("selected"); %>> </option>
                    <option value="APROBADO" <% if (client.getE01REN().equals("APROBADO")) out.print("selected"); %>>APROBADO</option>
                    <option value="NO APROBADO" <% if (client.getE01REN().equals("NO APROBADO")) out.print("selected"); %>>NO APROBADO</option>
                </select>
              </td> 
            </tr>
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Identificación del Entrevistador :</td>
              <td nowrap width="35%" align="left">
              	<eibsinput:text name="client" property="E01ID4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="true" readonly="<%=isReadOnly %>"/>
              </td>
              <td nowrap width="15%" align="right">Nombre del Entrevistador :</td>
              <td nowrap width="35%" align="left">
              	<eibsinput:text name="client" property="E01CNM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" required="true" readonly="<%=isReadOnly %>"/>	  
              </td>
            </tr>
             <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
              <td nowrap width="15%" align="right">Identificación de quien verifica :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E01RBN" maxlength="15" size="17" value="<%= client.getE01RBN().trim()%>" <%=read%>>
              </td>
              <td nowrap width="15%" align="right">Nombre de quien verifica :</td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E01WEB" maxlength="60" size="65" value="<%= client.getE01WEB().trim()%>" <%=read%>>	  
              </td>
            </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

<div id="tab9">  <!-- Información FATCA - CRS  -->
<div id="NATURALF" style="position:relative; display:none;">
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tiene una Dirección en el Extranjero :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01DIO().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<p> 
                <input type="radio" name="E01DIO" value="Y" <%if (client.getE01DIO().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01DIO" value="N" <%if (client.getE01DIO().equals("N")) out.print("checked"); %> <%= disabled %>>
                No <%=mandatory %> 
                </p> 
            </td>
            <td nowrap width="15%" align="right"><label id="lNacO"></label> :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01ONA().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<p> 
                <input type="radio" name="E01ONA" value="Y" <%if (client.getE01ONA().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateFATCA()">
                Si 
                <input type="radio" name="E01ONA" value="N" <%if (client.getE01ONA().equals("N")) out.print("checked"); %> <%= disabled %> onClick="updateFATCA()">
                No <%=mandatory %> 
                </p> 
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right"><label id="lNac"></label> 1 : </td>
            <td nowrap width="35%" align="left">
         	<input type="text" name="FCCS" size="5" maxlength="4" value="<%=(client.getE01LGT() == "1" ? client.getE01N5P().trim() : client.getE01CCS().trim())%>" readonly >
				<input TYPE="text" NAME="FDCCS" value="<%=client.getD01CCS()%>" readonly>
            </td> 
            <td nowrap width="15%" align="right">Identificación Fiscal 1 : </td>
            <td nowrap width="35%" align="left">
               	<eibsinput:text name="client" property="E01IF1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" size="30" maxlength="25" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right"> 2 : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01PN2" value="<%=client.getE01PN2()%>"  maxlength="2"  required="false" flag="03" fn_code="E01PN2" fn_description="D01PN2" readonly="<%=isReadOnly %>" /> 
				<input TYPE="text" NAME="D01PN2" value="<%=client.getD01PN2()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Identificación Fiscal 2 : </td>
            <td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01IF2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" size="30" maxlength="25" required="false" readonly="<%=isReadOnly %>" />
            </td>
         </tr> 
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right"> 3 : </td>
            <td nowrap width="35%" align="left">
				<eibsinput:cnofc name="client" property="E01PN3" value="<%=client.getE01PN3()%>"  maxlength="2"  required="false" flag="03" fn_code="E01PN3" fn_description="D01PN3" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01PN3" value="<%=client.getD01PN3()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Identificación Fiscal 3 : </td>
            <td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01IF3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" size="30" maxlength="25" required="false" readonly="<%=isReadOnly %>" />
            </td>
         </tr> 
       </table>
            
       </td>
       </tr>
    </table>

</div>   
   
<div id="JURIDICOF" style="position:relative; display:none;">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Es Entidad Financiera :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01ENF().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<p> 
                <input type="radio" name="E01ENF" value="Y" <%if (client.getE01ENF().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateFATCA()">
                Si 
                <input type="radio" name="E01ENF" value="N" <%if (client.getE01ENF().equals("N")) out.print("checked"); %> <%= disabled %> onClick="updateFATCA()">
                No <%=mandatory %> 
                </p> 
            </td>
            <td nowrap width="15%" align="right">GIIN Si Entidad Financiera :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01GII" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" size="30" maxlength="25" required="false" readonly="<%=isReadOnly %>" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Cotiza en Bolsa :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01BOL().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<p> 
                <input type="radio" name="E01BOL" value="Y" <%if (client.getE01BOL().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01BOL" value="N" <%if (client.getE01BOL().equals("N")) out.print("checked"); %> <%= disabled %>>
                No <%=mandatory %> 
                </p> 
            </td>
            <td nowrap width="15%" align="right">Más del 50% de Ingresos provienen de Fuentes Financieras :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01INF().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<p> 
                <input type="radio" name="E01INF" value="Y" <%if (client.getE01INF().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01INF" value="N" <%if (client.getE01INF().equals("N")) out.print("checked"); %> <%= disabled %>>
                No <%=mandatory %> 
                </p> 
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Check Substancial Owner de Accionistas :</td>
              <td nowrap width="35%" align="left" <%=(client.getF01CSO().equals("Y"))?"id=\"txtchanged\"":"" %>>
              	<p> 
                <input type="radio" name="E01CSO" value="Y" <%if (client.getE01CSO().equals("Y")) out.print("checked"); %> <%= disabled %>>
                Si 
                <input type="radio" name="E01CSO" value="N" <%if (client.getE01CSO().equals("N")) out.print("checked"); %> <%= disabled %>>
                No <%=mandatory %> 
                </p>
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
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Es Residente Fiscal en otro País :</td>
            <td nowrap width="35%" align="left" <%=(client.getF01REO().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	<p> 
                <input type="radio" name="E01REO" value="Y" <%if (client.getE01REO().equals("Y")) out.print("checked"); %> <%= disabled %> onClick="updateFATCA()">
                Si 
                <input type="radio" name="E01REO" value="N" <%if (client.getE01REO().equals("N")) out.print("checked"); %> <%= disabled %> onClick="updateFATCA()">
                No <%=mandatory %> 
                </p> 
            </td>
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left" ></td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Pais de Residencia Fiscal 1 : </td> 
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01PC1" value="<%=client.getE01PC1()%>"  maxlength="2"  required="false" flag="03" fn_code="E01PC1" fn_description="D01PC1" readonly="<%=isReadOnly %>" /> 
				<input TYPE="text" NAME="D01PC1" value="<%=client.getD01PC1()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">TIN 1  : </td>
            <td nowrap width="35%" align="left">
               	<eibsinput:text name="client" property="E01CD1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" size="30" maxlength="25" required="false" readonly="<%=isReadOnly %>" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Pais de Residencia Fiscal 2: </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01PC2" value="<%=client.getE01PC2()%>"  maxlength="2"  required="false" flag="03" fn_code="E01PC2" fn_description="D01PC2" readonly="<%=isReadOnly %>" /> 
				<input TYPE="text" NAME="D01PC2" value="<%=client.getD01PC2()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">TIN 2  : </td>
            <td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01CD2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" size="30" maxlength="25" required="false" readonly="<%=isReadOnly %>" />
            </td>
         </tr> 
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Pais de Residencia Fiscal 3: </td>
            <td nowrap width="35%" align="left">
				<eibsinput:cnofc name="client" property="E01PC3" value="<%=client.getE01PC3()%>"  maxlength="2"  required="false" flag="03" fn_code="E01PC3" fn_description="D01PC3" readonly="<%=isReadOnly %>"/> 
				<input TYPE="text" NAME="D01PC3" value="<%=client.getD01PC3()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">TIN 3 : </td>
            <td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01CD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" size="30" maxlength="25" required="false" readonly="<%=isReadOnly %>" />
            </td>
         </tr> 
       </table>
            
       </td>
       </tr>
    </table>

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Clasificación FATCA : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E01CLF" size="5"  value="<%= client.getE01CLF().trim()%>" readonly >
              	<input type="text" name="D01CLF" size="20" value="<%= client.getD01CLF().trim()%>" readonly > 
              </td>
            <td nowrap width="15%" align="right">Fecha de Clasificación FATCA : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:date name="client" fn_year="E01CYY" fn_month="E01CMM" fn_day="E01CDD" required="false" readonly="true"/>
            </td>
         </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Clasificación CRS : </td>
              <td nowrap width="35%" align="left">
              	<input type="text" name="E01CLC" size="5"  value="<%= client.getE01CLC().trim()%>" readonly >
              	<input type="text" name="D01CLC" size="20" value="<%= client.getD01CLC().trim()%>" readonly > 
              </td>
            <td nowrap width="15%" align="right">Fecha de Clasificación CRS : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:date name="client" fn_year="E01CCY" fn_month="E01CCM" fn_day="E01CCD" required="false" readonly="true"/>
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
  		<td width="33%" align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
  		</td>
  		<td width="33%" align="center"> 
  		  	<% if (maintenance) {%>
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar Mnto" onClick="goAction(4);" <%= disabled %>>
     		<% } %>
  		</td>
  		<td width="34%" align="center"> 
     		<input id="EIBSBTN" type=button name="Exit" value="Salir" 
			<% if ( userPO.getPurpose().equals("NEW")) {%>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
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
 		getElement("lNac").innerHTML = "País :";
 		getElement("lNacO").innerHTML = "Tiene otra Nacionalidad :";
 		JURIDICO.style.display='block';
 		JURIDICOF.style.display='block';
		NATURAL.style.display='none';
		NATURALF.style.display='none';
<% } else { %>
		getElement("lAge").innerHTML = "Edad :";
 		getElement("lTel").innerHTML = "Teléfono Principal :";
 		getElement("lNac").innerHTML = "Nacionalidad :";
 		getElement("lNacO").innerHTML = "Tiene Operaciones en otro País :";
 		NATURAL.style.display='block';
 		NATURALF.style.display='block';
		JURIDICO.style.display='none';
		JURIDICOF.style.display='none'; 
<% }  %>
	age();  
    chgRef('<%=client.getE1RRTP()%>');
    chgNme();
    
<% if ( !isReadOnly) {%> 
	updateIFF('<%=client.getE01FL2()%>');
    updateFX('<%=client.getE01FX()%>');
    updateFXP('<%=client.getE01FXP()%>');
    updateFATCA();
<% } %>

<% 	if (userPO.getPurpose().equals("MAINTENANCE") || userPO.getPurpose().equals("NEW")) { %>   
    document.forms[0].Submit.focus(); 
<% } %>    
	
</SCRIPT>

<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=client"> </script>
<script>
	window.scrollTo(0, 0);
</script>
</html>
