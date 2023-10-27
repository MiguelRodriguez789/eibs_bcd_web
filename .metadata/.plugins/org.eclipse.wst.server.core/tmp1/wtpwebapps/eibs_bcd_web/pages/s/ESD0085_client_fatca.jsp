<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Customer - Fatca</title>


<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 


<jsp:useBean id="client" class="datapro.eibs.beans.ESD008501Message"  scope="session" /> 
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
        	$tab.tabs('option', 'active', <%=client.getH01SCRCOD()%>);
        <% } %>
    }
    $('#btn-sub').on('click', function () {
        sessionStorage.setItem("tab-index", currentTabIndex);
    });
});


 $(function() {
$( ".datepicker" ).datepicker({ dateFormat: "dd-mm-yy", changeYear: true, showOn: "both", buttonImage: "<%=request.getContextPath()%>/images/calendar.gif"  } );
});
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
	document.forms[0].submit();
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


	
%>
<%int row = 0; %>
<H3 align="center">Mantenimiento Informacion FATCA<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_fatca.jsp, ESD0085"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0085">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="30">
  <INPUT TYPE=HIDDEN NAME="E01OPE" VALUE="30">
  <INPUT TYPE=HIDDEN NAME="VALMOT" VALUE="Y">

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
				<INPUT type="text" name="E01NM6" size="60" readonly value="<%= client.getE01NM6().trim()%>"
				<%=(client.getF01NA1().equals("Y"))?"id=\"txtchanged\"":"" %>>
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


        </table>
     
<div id="tabs">  
   <ul>
      <li><a href="#tab1">FATCA</a></li>
   </ul>

   <div id="tab1">  <!-- Informacion de FATCA  -->
	    <% if (client.getE01LGT().equals("2") ) { %>
         <table  class="tableinfo" width="100%">
            <tr bordercolor="#FFFFFF"> 
               <td nowrap> 
                  <table cellspacing="0" cellpadding="2" width="100%" border="0">
                     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                        <td nowrap colspan='4' align="center"><b>Excepcion Indicia</b></td>
                     </tr>
                     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                        <td nowrap width="25%" align="right">Ciudadanía o Residencia</td>
                        <td nowrap width="25%" align="left">
                           <input type="radio" name="E01FATEC1" value="Y"
                              <%if (!client.getE01FATEC1().equals("N")) out.print("checked"); %>> Si
                           <input type="radio" name="E01FATEC1" value="N" 
                              <%if (client.getE01FATEC1().equals("N")) out.print("checked"); %>> No
                        </td>
                        <td nowrap width="25%" align="right">Lugar de Nacimiento</td>
                        <td nowrap width="25%" align="left">
                           <input type="radio" name="E01FATEC2" value="Y"
                              <%if (!client.getE01FATEC2().equals("N")) out.print("checked"); %>> Si
                           <input type="radio" name="E01FATEC2" value="N" 
                              <%if (client.getE01FATEC2().equals("N")) out.print("checked"); %>> No
                        </td>
                     </tr>
                     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                        <td nowrap width="25%" align="right">Dirección o PO box</td>
                        <td nowrap width="25%" align="left">
                           <input type="radio" name="E01FATEC3" value="Y"
                              <%if (!client.getE01FATEC3().equals("N")) out.print("checked"); %>> Si
                           <input type="radio" name="E01FATEC3" value="N" 
                              <%if (client.getE01FATEC3().equals("N")) out.print("checked"); %>> No
                        </td>
                        <td nowrap width="25%" align="right">Teléfono</td>
                        <td nowrap width="25%" align="left">
                           <input type="radio" name="E01FATEC4" value="Y"
                              <%if (!client.getE01FATEC4().equals("N")) out.print("checked"); %>> Si
                           <input type="radio" name="E01FATEC4" value="N" 
                              <%if (client.getE01FATEC4().equals("N")) out.print("checked"); %>> No
                        </td>
                     </tr>
                     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                        <td nowrap width="25%" align="right">Instrucciones fijas</td>
                        <td nowrap width="25%" align="left">
                           <input type="radio" name="E01FATEC5" value="Y"
                              <%if (!client.getE01FATEC5().equals("N")) out.print("checked"); %>> Si
                           <input type="radio" name="E01FATEC5" value="N" 
                              <%if (client.getE01FATEC5().equals("N")) out.print("checked"); %>> No
                        </td>
                        <td nowrap width="25%" align="right">Dirección del Apoderado</td>
                        <td nowrap width="25%" align="left">
                           <input type="radio" name="E01FATEC6" value="Y"
                              <%if (!client.getE01FATEC6().equals("N")) out.print("checked"); %>> Si
                           <input type="radio" name="E01FATEC6" value="N" 
                              <%if (client.getE01FATEC6().equals("N")) out.print("checked"); %>> No
                        </td>
                     </tr>
                     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                        <td nowrap width="25%" align="right">Única dirección Hold Mail</td>
                        <td nowrap width="25%" align="left">
                           <input type="radio" name="E01FATEC7" value="Y"
                              <%if (!client.getE01FATEC7().equals("N")) out.print("checked"); %>> Si
                           <input type="radio" name="E01FATEC7" value="N" 
                              <%if (client.getE01FATEC7().equals("N")) out.print("checked"); %>> No
                        </td>
                        <td nowrap width="25%" align="right">Reason to know 1:</td>
                        <td nowrap width="25%" align="left" colspan='3'>
                           <textarea name="E01FATCO1" cols="33" rows="4" <%=read%>><%=client.getE01FATCO1()%></textarea>
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
      <% } else {  %>
   
         <table  class="tableinfo" width="100%">
            <tr bordercolor="#FFFFFF"> 
               <td nowrap> 
                  <table cellspacing="0" cellpadding="2" width="100%" border="0">
                     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                        <td nowrap width="25%" align="right">Tipo de Entidad</td>
                        <td nowrap width="25%" align="left">
                           <eibsinput:cnofc name="client" property="E01FATTEP" value="<%=client.getE01FATTEP()%>" required="false" flag="IE" fn_code="E01FATTEP" fn_description="D01FATTEP" readonly="<%=isReadOnly %>" />
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                           <eibsinput:text name="client" property="D01FATTEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                        </td>
                        <td nowrap width="25%" align="right">Clasificacion Entidad</td>
                        <td nowrap width="25%" align="left">
                           <eibsinput:cnofc name="client" property="E01FATCEP" value="<%=client.getE01FATCEP()%>" required="false" flag="IC" fn_code="E01FATCEP" fn_description="D01FATCEP" readonly="<%=isReadOnly %>" />
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                           <eibsinput:text name="client" property="D01FATCEP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                        </td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
        <% } %>  

      <table  class="tableinfo" width="100%">
         <tr bordercolor="#FFFFFF"> 
            <td nowrap> 
               <table cellspacing="0" cellpadding="2" width="100%" border="0">
                  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                     <td nowrap width="25%" align="right">Documento Firmado : </td>
                     <td nowrap width="25%" align="left"> 
                           <input type="radio" name="E01FATDOC" value="Y"
                              <%if (client.getE01FATDOC().equals("Y")) out.print("checked"); %>> Si
                           <input type="radio" name="E01FATDOC" value="N" 
                              <%if (client.getE01FATDOC().equals("N")) out.print("checked"); %>> No
                           <input type="radio" name="E01FATDOC" value="A" 
                              <%if (client.getE01FATDOC().equals("A")) out.print("checked"); %>> N/A
                     </td>
                     <td nowrap width="25%" align="right">Tipo de Documento : </td>
                     <td nowrap width="25%" align="left"> 
                           <input type="radio" name="E01FATTDO" value="1"
                              <%if (client.getE01FATTDO().equals("1")) out.print("checked"); %>> N/A
                           <input type="radio" name="E01FATTDO" value="2" 
                              <%if (client.getE01FATTDO().equals("2")) out.print("checked"); %>> Formato del IRS
                           <input type="radio" name="E01FATTDO" value="3" 
                              <%if (client.getE01FATTDO().equals("3")) out.print("checked"); %>> Formatos Internos
                     </td>
                  </tr>
                  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                     <td nowrap width="25%" align="right">Fecha Firma : </td>
                     <td nowrap width="25%" align="left">
                         <eibsinput:date name="client" fn_year="E01FATFYY" fn_month="E01FATFMM" fn_day="E01FATFDD" />
                     </td> 
                     <td nowrap width="25%" align="right"></td>
                     <td nowrap width="25%" align="left"></td> 
                  </tr>
                  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                     <td nowrap width="15%" align="right">Clasificación FATCA :</td>
                     <td nowrap width="35%" align="left">
                           <eibsinput:cnofc name="client" property="E01FATCLF" value="<%=client.getE01FATCLF()%>" required="false" flag="ID" fn_code="E01FATCLF" fn_description="D01FATCLF" readonly="<%=isReadOnly %>" />
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                           <eibsinput:text name="client" property="D01FATCLF" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                     </td>
                     <td nowrap width="25%" align="right">Fecha Clasificación:</td>
                     <td nowrap width="25%" align="left">
                         <eibsinput:date name="client" fn_year="E01FATCYY" fn_month="E01FATCMM" fn_day="E01FATCDD" readonly="true"/>
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

</SCRIPT>

</html>
