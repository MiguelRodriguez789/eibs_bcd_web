<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Customer ID Info</title>

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
        <%  if ( !error.getERRNUM().equals("0") && error.getERDF01().equals("")) error.setERRNUM("0");  
        	if (error.getERRNUM().equals("0") ) { %>
        	$tab.tabs('option', 'active', currentTabIndex);
        <% } else { %>	
        	$tab.tabs('option', 'active', <%=client.getH01SCR()%>);
        <% } %>
    }
    $('#btn-sub').on('click', function () {
        sessionStorage.setItem("tab-index", currentTabIndex);
    });
});

function getIdTypeHelp(){
	   // Get the client type selected
	   var cusType = getElement("E01LGT").value;
	   var country = getElement("E01PID").value;
	   // Display the id screen help 
	   if (cusType.toUpperCase() == "1") {
	     Get2FilterCodes('E01TID','','34','1', country);
	   } else {
	   	 Get2FilterCodes('E01TID','','34','2', country);
	   }
	 }
</script>

</head>
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="JavaScript">

	
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
	<% 	if (client.getE01LGT().trim().equals("1")) { %>
 	 	// Juridica  
	<% } else { %>
		// Persona
		document.forms[0].E01FN2.value = getElement("PFN2").value;
		document.forms[0].E01LN1.value = getElement("PLN1").value;
	<% } %>	
	document.forms[0].submit();
}

function getIdTypeHelp(){
   // Get the client type selected
   var cusType = getElement("E01LGT").value;
   var country = getElement("E01PID").value;
   // Display the id screen help 
   if (cusType.toUpperCase() == "1") {
     Get2FilterCodes('E01TID','','34','1', country);
   } else {
   	 Get2FilterCodes('E01TID','','34','2', country);
   }
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
  
function showIdFields() {

	var cusType = getElement("E01LGT").value; 
	
	if (cusType.toUpperCase() == "2" ){
		getElement('NAT').style.display='block';
		getElement('JUR').style.display='none';
	} else {
		getElement('NAT').style.display='none';
		getElement('JUR').style.display='block';
	}
	
}
 </SCRIPT>  
 

<% 
	if ( !error.getERRNUM().equals("0") && !error.getERDF01().equals("")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
    
    String legtyp = (client.getE01LGT().equals("1")?"JURIDICO":"PERSONA");
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
	int row = 0;
%>

<H3 align="center">Mantenimiento Centralizado de Clientes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_id.jsp, ESD1080"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="15">
  <INPUT TYPE=HIDDEN NAME="E01OPE" VALUE="15">
  <INPUT TYPE=HIDDEN NAME="E01NA1" VALUE="<%= client.getE01NA1()%>">
  <INPUT TYPE=HIDDEN NAME="E01LGT" VALUE="<%= client.getE01LGT()%>">
  <INPUT TYPE=HIDDEN NAME="E01FN2" VALUE="<%= client.getE01FN2()%>">
  <INPUT TYPE=HIDDEN NAME="E01LN1" VALUE="<%= client.getE01LN1()%>">

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
			</td>
            <td nowrap width="5%" align="right">Nombre Legal :</td>
			<td nowrap width="40%" align="left">
				<INPUT type="text" name="LEGNME" size="60" readonly value="<%= client.getE01NM6().trim()%>"
				<%=(client.getF01NA1().equals("Y"))?"id=\"txtchanged\"":"" %>>
			</td>
            <td nowrap width="5%" align="right">Nombre Corto :</td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E01SHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="26" required="false" readonly="true" modified="F01SHN"/>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="5%" align="right"></td>
            <td nowrap width="10%" align="left"> 
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
    	<li><a href="#tab1">Identificación / Nombre</a></li>
	</ul>
</div>

<div id="tab1">  <!-- Informacion de IDN  -->
    
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="10%" align="right">Tipo ID : </td>
            	<td nowrap width="30%" align="left">
            		<input type="text" name="E01TID" value="<%=client.getE01TID()%>" maxlength="4" size="5" readonly>
            		<%=mandatory%>
					<a href="javascript:getIdTypeHelp()"> 
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					</a>
					<%= client.getD01TID().trim()%> 
				</td>
            	<td nowrap width="10%" align="right">Número : </td>
				<td nowrap width="15%" align="left">
					<eibsinput:text name="client" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="true" readonly="false"/>
				</td>
            	<td nowrap width="10%" align="right">País : </td>
				<td nowrap width="25%" align="left">
					<eibsinput:cnofc name="client" property="E01PID" value="<%=client.getE01PID()%>" required="true" flag="03" fn_code="E01PID" fn_description="D01PID" /> 
					<INPUT TYPE="text" NAME="D01PID" value="<%=client.getD01PID()%>" readonly>
				</td>
			</tr>	
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="10%" align="right">Segmento : </td>
            	<td nowrap width="30%" align="left">
              		<eibsinput:cnofc name="client" property="E01UC5" value="<%=client.getE01UC5()%>" required="true" flag="S5" fn_code="E01UC5" fn_description="D01UC5" readonly="<%=isReadOnly %>"/>
       	        	<input type="text" name="D01UC5" size="20" value="<%= client.getD01UC5().trim()%>" readonly>
				</td>
            	<td nowrap width="10%" align="right"></td>
				<td nowrap width="15%" align="left">
				</td>
            	<td nowrap width="10%" align="right"></td>
				<td nowrap width="25%" align="left">
				</td>
			</tr>	
		</table>
		
		<div id="NAT" style="position:relative; display:none;">
		<table  cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="15%" align="right">Primer Nombre :</td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:text name="client" property="E01FNA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="true" readonly="<%=isReadOnly %>" onchange="chgNme()" modified="F01FNA"/> 
            	</td>
            	<td nowrap width="15%" align="right">Segundo Nombre :</td>
            	<td nowrap width="35%" align="left">
            		<input type="text" name="PFN2" size="45" maxlength="40" value="<%= client.getE01FN2().trim()%>" <%=read%> onChange="chgNme()"
            		<%=(client.getF01FN2().equals("Y"))?"id=\"txtchanged\"":"" %>>
            	</td>
         	</tr>
         	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            	<td nowrap width="15%" align="right">Primer Apellido :</td>
            	<td nowrap width="35%" align="left">
                	<input type="text" name="PLN1" size="45" maxlength="40" value="<%= client.getE01LN1().trim()%>" <%=read%> onChange="chgNme()"
                	<%=(client.getF01LN1().equals("Y"))?"id=\"txtchanged\"":"" %>>
                	<%=mandatory %>
            	</td>
            	<td nowrap width="15%" align="right">Segundo Apellido :</td>
            	<td nowrap width="35%" align="left">
            		<eibsinput:text name="client" property="E01LN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" readonly="<%=isReadOnly %>" onchange="chgNme()" modified="F01LN2"/>
            	</td>
         	</tr>
		 	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           		<td nowrap width="15%" align="right">Genero :</td>
           		<td nowrap width="35%" align="left" <%=(client.getF01SEX().equals("Y"))?"id=\"txtchanged\"":"" %>>
            		<p> 
                	<input type="radio" name="E01SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %> >Femenino 
                	<input type="radio" name="E01SEX" value="M" <%if (client.getE01SEX().equals("M")) out.print("checked"); %> >Masculino
                	<%=mandatory%>
                	</p>
				</td>
            	<td nowrap width="15%" align="right">Fecha de Nacimiento :</td>
				<td nowrap width="35%" align="left">
					<eibsinput:date name="client" fn_year="E01BDY" fn_month="E01BDM" fn_day="E01BDD" required="true" readonly="false"/> 
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
           			<td nowrap width="15%" align="right">Registrado en Biometría : </td>
            	<td nowrap width="35%" align="left">
            	<input type="radio" name="E01TX8" value="Y" <%if (client.getE01TX8().equals("Y")) out.print("checked"); %> <%= disabled %>>
                    Si 
                <input type="radio" name="E01TX8" value="N" <%if (!client.getE01TX8().equals("Y")) out.print("checked"); %> <%= disabled %>>
                    No
                 <eibsinput:cnofc name="client" property="E01OBC" value="<%=client.getE01OBC()%>" size="3" maxlength="2" required="false" flag="BO" fn_code="E01OBC" fn_description="D01OBC" readonly="<%=isReadOnly %>" />
                <input type="text" name="D01OBC" size="20" value="<%= client.getD01OBC().trim()%>" readonly>   
            	</td>
            	<td nowrap width="15%" align="right"></td>
              	<td nowrap width="35%" align="left"> 
              	</td>
			</tr>
		</table>
		</div>
		
		<div id="JUR" style="position:relative; display:none;">
  			<table  cellspacing="0" cellpadding="2" width="100%" border="0">
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            		<td nowrap width="10%" align="right">Razón Social :</td>
            		<td nowrap width="90%" colspan="3"  align="left"> 
               			<input type="text" name="E01NM6" size="120" maxlength="160" value="<%= client.getE01NM6().trim()%>" <%=read%> onChange="chgNme()">
               			<%=mandatory %>
            		</td>
         		</tr>
       		</table>
		</div>
  	</td>
  </tr>
</table>
     	
 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>	
		<h4>Identificaciones Anteriores</h4>  
		<table  cellspacing="0" cellpadding="2" width="100%" border="0">
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%" align="right">Tipo ID : </td>
            <td nowrap width="30%" align="left">
            	<%= client.getE01TIF().trim()%> <%= client.getD01TIF().trim()%> 
			</td>
            <td nowrap width="10%" align="right">Número : </td>
			<td nowrap width="15%" align="left">
				<%= client.getE01IDF().trim()%> 
			</td>
            <td nowrap width="10%" align="right">País : </td>
			<td nowrap width="25%" align="left">
				<%= client.getE01PIF().trim()%> <%= client.getD01PIF().trim()%>
			</td>
		</tr>	
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="10%" align="right">Tipo ID : </td>
            <td nowrap width="30%" align="left">
            	<%= client.getE01TI3().trim()%> <%= client.getD01TI3().trim()%> 
			</td>
            <td nowrap width="10%" align="right">Número : </td>
			<td nowrap width="15%" align="left">
				<%= client.getE01ID3().trim()%>
			</td>
            <td nowrap width="10%" align="right">País : </td>
			<td nowrap width="25%" align="left">
				<%= client.getE01PI3().trim()%> <%= client.getD01PI3().trim()%>
			</td>
		</tr>		
  		</table>
  	</td>
  </tr>
</table>  	
<br>    

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
	showIdFields();
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=client"> </script>
</html>
