<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Client Taxes Basic Info</title>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 


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

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

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
		document.forms[0].E01GEC.value = getElement("JGEC").value;
		document.forms[0].E01BDY.value = getElement("JBDY").value;
		document.forms[0].E01BDM.value = getElement("JBDM").value;
		document.forms[0].E01BDD.value = getElement("JBDD").value;
		document.forms[0].E01FN2.value = getElement("JFN2").value;
		document.forms[0].E01LN1.value = getElement("JLN1").value;
		document.forms[0].E01CP1.value = getElement("JCP1").value;
		document.forms[0].E01RCP.value = getRadioVal("JRCP");
	<% } else { %>
		// Persona
		document.forms[0].E01MST.value = getElement("PMST").value;
		document.forms[0].E01GEC.value = getElement("PGEC").value;
		document.forms[0].E01BDY.value = getElement("PBDY").value;
		document.forms[0].E01BDM.value = getElement("PBDM").value;
		document.forms[0].E01BDD.value = getElement("PBDD").value;
		document.forms[0].E01FN2.value = getElement("PFN2").value;
		document.forms[0].E01LN1.value = getElement("PLN1").value;
	<% } %>	
	
	submitForm();
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
 function showInqOFAC(fieldValue) {
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);    
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
    String tdir = (client.getE01LGT().equals("1")?"DIRECCION PRINCIPAL":"DIRECCION DE RESIDENCIA");
    String readNew = (userPO.getPurpose().equals("NEW")?"readonly":"");
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
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

<H3 align="center">Mantenimiento de Información de Impuestos para Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="prospect_basic.jsp, ESD1080"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01NA1" VALUE="<%= client.getE01NA1()%>">
  <INPUT TYPE=HIDDEN NAME="E01MST" VALUE="<%= client.getE01MST()%>">
  <INPUT TYPE=HIDDEN NAME="E01GEC" VALUE="<%= client.getE01GEC()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDY" VALUE="<%= client.getE01BDY()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDM" VALUE="<%= client.getE01BDM()%>">
  <INPUT TYPE=HIDDEN NAME="E01BDD" VALUE="<%= client.getE01BDD()%>">
  <INPUT TYPE=HIDDEN NAME="E01FN2" VALUE="<%= client.getE01FN2()%>">
  <INPUT TYPE=HIDDEN NAME="E01LN1" VALUE="<%= client.getE01LN1()%>">
  <INPUT TYPE=HIDDEN NAME="E01FL8" VALUE="<%= client.getE01FL8()%>">
  <INPUT TYPE=HIDDEN NAME="E01CP1" VALUE="<%= client.getE01CP1()%>">
  <INPUT TYPE=HIDDEN NAME="E01RCP" VALUE="<%= client.getE01RCP()%>">
  <INPUT TYPE=HIDDEN NAME="E01TX6" VALUE="<%= client.getE01TX6()%>">
  <INPUT TYPE=HIDDEN NAME="E01TX7" VALUE="<%= client.getE01TX7()%>">
  <INPUT TYPE=HIDDEN NAME="E01TX8" VALUE="<%= client.getE01TX8()%>">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="<%= client.getE01OPE()%>">


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
			  	<% if (client.getE01STS().equals("1")) { out.print("INACTIVO"); }
					  	else if (client.getE01STS().equals("2")) { out.print("ACTIVO");  }
						else if (client.getE01STS().equals("3")) { out.print("BLOQUEADO"); }
						else if (client.getE01STS().equals("0")) { out.print("PROSPECTO"); }
						else if (client.getE01STS().equals("4")) { out.print("FALLECIDO"); }
						else { out.print(""); } 
				%>	
				<b><%= client.getD01CRT().trim()%></b>		
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="center" valign="top">
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
            <td nowrap width="5%" align="right">Fecha de Vinculación :</td>
            <td nowrap width="10%" align="left"> 
				<eibsinput:date name="client" fn_year="E01IDY" fn_month="E01IDM" fn_day="E01IDD" required="false" readonly="true" />
			</td>
            <td nowrap width="5%" align="right">Relación con el Banco :</td> 
			<td nowrap width="40%" align="left">
				<select name="E01STF" disabled>
                	<option value=" " <% if (client.getE01STF().equals(" ")) out.print("selected"); %>> </option>
                    <option value="1" <% if (client.getE01STF().equals("1")) out.print("selected"); %>>CLIENTE REGULAR</option>
                    <option value="2" <% if (client.getE01STF().equals("2")) out.print("selected"); %>>ESPECIAL</option>                   
                    <option value="3" <% if (client.getE01STF().equals("3")) out.print("selected"); %>>EMPLEADO</option>
                    <option value="4" <% if (client.getE01STF().equals("4")) out.print("selected"); %>>FUNCIONARIO</option>
                    <option value="5" <% if (client.getE01STF().equals("5")) out.print("selected"); %>>DIRECTOR</option>
                    <option value="6" <% if (client.getE01STF().equals("6")) out.print("selected"); %>>PARIENTE</option>
                    <option value="7" <% if (client.getE01STF().equals("7")) out.print("selected"); %>>EMPRESA AFILIADA</option>
                    <option value="8" <% if (client.getE01STF().equals("8")) out.print("selected"); %>>JUNTA DIRECTIVA</option>
                    <option value="9" <% if (client.getE01STF().equals("9")) out.print("selected"); %>>CORRESPONSAL</option>
                    <option value="T" <% if (client.getE01STF().equals("T")) out.print("selected"); %>>TESORERIA</option>
                    <option value="E" <% if (client.getE01STF().equals("E")) out.print("selected"); %>>TERCERO</option>
                </select>
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
    	<li><a href="#tab7">Información Fiscal</a></li>
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
            	<eibsinput:text name="client" property="E01FNA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" readonly="true" /> 
            </td>
            <td nowrap width="15%" align="right">Segundo Nombre :</td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="PFN2" size="45" maxlength="40" value="<%= client.getE01FN2().trim()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Primer Apellido :</td>
            <td nowrap width="35%" align="left">
                <input type="text" name="PLN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" readonly>
                <%=mandatory %>
            </td>
            <td nowrap width="15%" align="right">Segundo Apellido :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01LN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" readonly="true" />
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Genero :</td>
            <td nowrap width="35%" align="left">
                <p> 
                <input type="radio" name="E01SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %> disabled>
                Femenino 
                <input type="radio" name="E01SEX" value="M" <%if (!client.getE01SEX().equals("F")) out.print("checked"); %> disabled>
                Masculino 
                </p>
            </td>
            <td nowrap width="15%" align="right">Estado Civil :</td>
            <td nowrap width="35%" align="left">
                <select name="PMST" disabled>
                	<option value=" " <% if (!(client.getE01MST().equals("1")||client.getE01MST().equals("2") || client.getE01MST().equals("3")||client.getE01MST().equals("4")||client.getE01MST().equals("5")||client.getE01MST().equals("6"))) out.print("selected"); %>> 
                    </option>
                    <option value="1" <% if (client.getE01MST().equals("1")) out.print("selected"); %>>Soltero(a)</option>
                    <option value="2" <% if (client.getE01MST().equals("2")) out.print("selected"); %>>Casado(a)</option>                   
                    <option value="3" <% if (client.getE01MST().equals("3")) out.print("selected"); %>>Divorciado(a)</option>
                    <option value="4" <% if (client.getE01MST().equals("4")) out.print("selected"); %>>Viudo(a)</option>
                    <option value="5" <% if (client.getE01MST().equals("5")) out.print("selected"); %>>Unión Libre</option>
                    <option value="6" <% if (client.getE01MST().equals("6")) out.print("selected"); %>>Otro</option>
                </select>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left">
            </td>
            <td nowrap width="15%" align="right">Nacionalidad :</td>
            <td nowrap width="35%" align="left">
                <eibsinput:cnofc name="client" property="E01CCS" value="<%=client.getE01CCS()%>" required="false" flag="03" fn_code="E01CCS" fn_description="D01CCS" readonly="true" /> 
				<input TYPE="text" NAME="D01CCS" value="<%=client.getD01CCS()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Fecha de Nacimiento :</td>
              <td nowrap width="35%" align="left">
              	<INPUT type="text" name="PBDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" readonly>
				<INPUT type="text" name="PBDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" readonly>
				<INPUT type="text" name="PBDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" readonly>
                 <label id="lAge"></label>
                <input TYPE="text" NAME="PAGE" size="3" readonly> 
              </td>
            <td nowrap width="15%" align="right">País de Residencia : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="PGEC" value="<%=client.getE01GEC()%>" required="false" flag="03" fn_code="PGEC" fn_description="PD01GEC" readonly="true" /> 
				<input TYPE="text" NAME="PD01GEC" value="<%=client.getD01GEC()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Lugar de Nacimiento :<br>País / Dpto. / Ciudad</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="E01N5P" value="<%=client.getE01N5P()%>" required="false" flag="03" fn_code="E01N5P" fn_description="D01N5P" readonly="true"/>
            	<input type="text" name="D01N5P" size="20" value="<%= client.getD01N5P().trim()%>" readonly> <br>
            	<eibsinput:cnofc name="client" property="E01N5D" value="<%=client.getE01N5D()%>" required="false" flag="27" fn_code="E01N5D" fn_description="D01N5D" readonly="true"/>
            	<input type="text" name="D01N5D" size="20" value="<%= client.getD01N5D().trim()%>" readonly><br>
            	<input type="text" name="E01N5C" size="5" maxlength="4" value="<%= client.getE01N5C().trim()%>" readonly>
            	<input type="text" name="D01N5C" size="20" value="<%= client.getD01N5C().trim()%>" readonly> 
            </td>
            <td nowrap width="15%" align="right">Lugar Expedición de Identificación : <br>País / Dpto. / Ciudad</td>
            <td nowrap width="35%" align="left">
             	<eibsinput:cnofc name="client" property="E01N3P" value="<%=client.getE01N3P()%>" required="false" flag="03" fn_code="E01N3P" fn_description="D01N3P" readonly="true"/>
            	<input type="text" name="D01N3P" size="20" value="<%= client.getD01N3P().trim()%>" readonly> <br>
            	<input type="text" name="E01N3D" size="5" maxlength="2" value="<%= client.getE01N3D().trim()%>" readonly>
            	<input type="text" name="D01N3D" size="20" value="<%= client.getD01N3D().trim()%>" readonly><br>
            	<input type="text" name="E01N3C" size="5" maxlength="4" value="<%= client.getE01N3C().trim()%>" readonly> 
            	<input type="text" name="D01N3C" size="20" value="<%= client.getD01N3C().trim()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            <td nowrap width="15%" align="right">Fecha de Expedición de Identificación : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:date name="client" fn_year="E01REY" fn_month="E01REM" fn_day="E01RED" required="true" readonly="true"/>
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
               	<input type="text" name="E01NM6" size="120" maxlength="160" value="<%= client.getE01NM6().trim()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Nombre Comercial :</td>
            <td nowrap width="35%" align="left"> 
               	<input type="text" name="JFN2" size="45" maxlength="40" value="<%= client.getE01FN2().trim()%>" readonly><br>
               	<input type="text" name="JLN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" readonly>
            </td>
            <td nowrap width="15%" align="right">Nombre Anterior : </td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="JCP1" size="46" maxlength="45" value="<%= client.getE01CP1().trim()%>" readonly>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right"></td>
              <td nowrap width="35%" align="left">
              </td>
            <td nowrap width="15%" align="right">Empresa en <%= client.getD01PID().trim()%> es : </td>
            <td nowrap width="35%" align="left">
            	<select name="JMST" disabled>
                	<option value=" " <% if (!(client.getE01MST().equals("P")||client.getE01MST().equals("A") || client.getE01MST().equals("S"))) out.print("selected"); %>> 
                    </option>
                    <option value="P" <% if (client.getE01MST().equals("P")) out.print("selected"); %>>Principal</option>
                    <option value="A" <% if (client.getE01MST().equals("A")) out.print("selected"); %>>Agencia</option>                   
                    <option value="S" <% if (client.getE01MST().equals("S")) out.print("selected"); %>>Sucursal</option>
                </select>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Naturaleza Jurídica :</td>
              <td nowrap width="35%" align="left"> 
              	<eibsinput:cnofc name="client" property="E01UC3" value="<%=client.getE01UC3()%>" required="false" flag="RN" fn_code="E01UC3" fn_description="D01UC3" readonly="true"/>
       	        <input type="text" name="D01UC3" size="20" value="<%= client.getD01UC3().trim()%>" readonly>	 	
              </td>
            <td nowrap width="15%" align="right">Intermediario del Mercado Cambiario : </td>
            <td nowrap width="35%" align="left">
            	<p> 
                <input type="radio" name="E01PEP" value="Y" <%if (client.getE01PEP().equals("Y")) out.print("checked"); %> disabled>
                Si 
                <input type="radio" name="E01PEP" value="N" <%if (!client.getE01PEP().equals("Y")) out.print("checked"); %> >
                No  
                </p>
            </td>
         </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Fecha de Constitución :</td>
              <td nowrap width="35%" align="left">
              	<INPUT type="text" name="JBDD" size="3" maxlength="2" value="<%= client.getE01BDD().trim()%>" onkeypress="enterInteger(event)" readonly onchange="age();">
				<INPUT type="text" name="JBDM" size="3" maxlength="2" value="<%= client.getE01BDM().trim()%>" onkeypress="enterInteger(event)" readonly onchange="age();">
				<INPUT type="text" name="JBDY" size="5" maxlength="4" value="<%= client.getE01BDY().trim()%>" onkeypress="enterInteger(event)" readonly onchange="age();">
                 <label id="lAge"></label>
                <input TYPE="text" NAME="JAGE" size="3" readonly> 
              </td>
            <td nowrap width="15%" align="right">País : </td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="client" property="JGEC" value="<%=client.getE01GEC()%>"  maxlength="2" required="false" flag="03" fn_code="JGEC" fn_description="JD01GEC" readonly="true"/> 
				<input TYPE="text" NAME="JD01GEC" value="<%=client.getD01GEC()%>" readonly>
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
				<input TYPE="text" NAME="D01BUC" value="<%=client.getD01BUC()%>" readonly>
            </td>
         </tr>
       </table>
            
       </td>
       </tr>
    </table>

</div> 

<div id="tab2">  <!-- Ubicación  -->
		<jsp:include page="ESD0080_address_template_basic_colombia.jsp" flush="true" >
			<jsp:param name="title" value="<%=tdir%>" />				
			<jsp:param name="messageName" value="client" />
			<jsp:param name="readOnly" value="true" />
			<jsp:param name="suffix" value="E01" />
			<jsp:param name="basic" value="true" />
		</jsp:include>
	
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="15%" align="right">Tipo de Teléfono :</td>
            <td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01PHT" value="<%=client.getE01PHT()%>" required="false" flag="DO" fn_code="E01PHT" fn_description="D01PHT" readonly="true"/> 
				<input TYPE="text" NAME="D01PHT" value="<%=client.getD01PHT()%>" readonly> 
            </td>	
            <td nowrap width="15%" align="right"><label id="lTel"></label></td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01PHO" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="20" maxlength="15" required="false" readonly="true"/>
            	Ext :
            	<eibsinput:text name="client" property="E01PHX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5" required="false" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
        	<td nowrap align="right">Tipo Correo Electrónico :</td>
        	<td nowrap width="35%" align="left">
              	<eibsinput:cnofc name="client" property="E01IAT" value="<%=client.getE01IAT()%>" required="false" flag="DR" fn_code="E01IAT" fn_description="D01IAT" readonly="true"/> 
				<input TYPE="text" NAME="D01IAT" value="<%=client.getD01IAT()%>" readonly>
 	       </td>
           	<td nowrap width="15%" align="right">Correo Electrónico :</td>
           	<td nowrap width="35%" align="left">
           		<input type="text" name="E01IAD" size="61" maxlength="60" value="<%= client.getE01IAD().trim()%>" readonly> 
            </td>
          </tr>
        </table>    
	</td>	
   </tr>
  </table>		
</div>		


<div id="tab7"> <!-- Inf. Fiscal  -->

 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="15%" align="right">Tiene Exenciones : </td>
            <td nowrap width="35%" align="left">
            	<div onClick="msgTAX()">
              	<p> 
               <input type="radio" name="E01TAX" value="Y" <%if (client.getE01TAX().equals("Y")) out.print("checked"); %> <%= disabled %>>
                SI 
                <input type="radio" name="E01TAX" value="N" <%if (!client.getE01TAX().equals("Y")) out.print("checked"); %> <%= disabled %>>
                NO 
                </p>
                </div>
            </td>  
           	<td nowrap width="15%" align="right"></td>
           	<td nowrap width="35%" align="left">
           	</td>
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

<% 	if (client.getE01LGT().trim().equals("1")) { %>
		getElement("lAge").innerHTML = "Años Constituida :";
 		getElement("lTel").innerHTML = "Teléfono Principal :";
 		JURIDICO.style.display='block';
		NATURAL.style.display='none' ;
<% } else { %>
		getElement("lAge").innerHTML = "Edad :";
 		getElement("lTel").innerHTML = "Teléfono de Residencia :";
 		NATURAL.style.display='block' ;
		JURIDICO.style.display='none' ; 
<% }  %>
	age();  
    
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
