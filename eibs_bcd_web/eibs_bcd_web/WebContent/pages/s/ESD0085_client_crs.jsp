<!DOCTYPE HTML">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Customer - Crs</title>


<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 


<jsp:useBean id="client" class="datapro.eibs.beans.ESD008502Message"  scope="session" /> 
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
        <%  if ( !error.getERRNUM().equals("0") && error.getERDF02().equals("")) error.setERRNUM("0");  
        	if (error.getERRNUM().equals("0") ) { %>
        	$tab.tabs('option', 'active', currentTabIndex);
        <% } else { %>	
        	$tab.tabs('option', 'active', <%=client.getH02SCRCOD()%>);
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
	if (op == 24) {
		if (!confirm("Desea borrar este Mantenimiento?")) {
			return;
		}
		document.forms[0].Delete.disabled = true;
	}
	if (op == 25) {
		document.forms[0].Submit.disabled = true;
	}
	
	document.forms[0].submit();
}

 </SCRIPT>  
 

<% 
	if ( !error.getERRNUM().equals("0") && !error.getERDF02().equals("")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
    
    String legtyp = (client.getE02LGT().equals("1")?"JURIDICO":"PERSONA");
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
<H3 align="center">Mantenimiento Informacion CRS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_crs.jsp, ESD0085"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0085">
  
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="25">
  <INPUT TYPE=HIDDEN NAME="OPE" VALUE="30">
  <INPUT TYPE=HIDDEN NAME="E02OPE" VALUE="30">
  <INPUT TYPE=HIDDEN NAME="VALMOT" VALUE="Y">

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Tipo Legal : </td>
            <td nowrap width="10%" align="left" > <%=legtyp%>
            	<INPUT TYPE=HIDDEN NAME="E02LGT" VALUE="<%= client.getE02LGT()%>" >
			</td>
            <td nowrap width="5%" align="right">Estado : </td>
			<td nowrap width="40%" align="left" style="color:red;font-size:12;">
				<input type="HIDDEN" name="E02STS" VALUE="<%= client.getE02STS()%>" > 
			  	<% if (client.getE02STS().equals("1")) { out.print("INACTIVO"); }
					  	else if (client.getE02STS().equals("2")) { out.print("ACTIVO");  }
						else if (client.getE02STS().equals("3")) { out.print("BLOQUEADO"); }
						else { out.print(""); } 
				%>	
				<b><%= client.getD02CRT().trim()%></b>		
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="center" valign="top">
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Código :</td>
            <td nowrap width="10%" align="left"> 
                <INPUT type="text" name="E02CUN" size="10" readonly value="<%= client.getE02CUN().trim()%>">
			</td>
            <td nowrap width="5%" align="right">Nombre Legal :</td>
			<td nowrap width="40%" align="left">
				<INPUT type="text" name="E02NM6" size="60" readonly value="<%= client.getE02NM6().trim()%>"
				<%=(client.getF02NA1().equals("Y"))?"id=\"txtchanged\"":"" %>>
			</td>
            <td nowrap width="5%" align="right">Nombre Corto :</td>
            <td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E02SHN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="26" required="false" readonly="true" modified="F02SHN"/>
			</td>
            
		</tr>

		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Tipo ID : </td>
            <td nowrap width="10%" align="left">
            	<eibsinput:text name="client" property="E02TID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F02TID"/> 
			</td>
            <td nowrap width="5%" align="right"><%= client.getD02TID().trim()%> : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="client" property="E02IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="true" modified="F02IDN"/>
			</td>
            <td nowrap width="5%" align="right">País Identificación : </td>
			<td nowrap width="35%" align="left">
				<eibsinput:text name="client" property="E02PID" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" required="false" readonly="true" modified="F02PID"/>
				<%= client.getD02PID().trim()%>
			</td>
		</tr>


        </table>
     
<div id="tabs">  
   <ul>
      <li><a href="#tab1">CRS</a></li>
   </ul>

   <div id="tab1">  <!-- Informacion de CRS  -->
         <table  class="tableinfo" width="100%">
            <tr bordercolor="#FFFFFF"> 
               <td nowrap> 
                  <table cellspacing="0" cellpadding="2" width="100%" border="0">
                     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                        <td nowrap colspan='4' align="center"><b>Remediacion</b></td>
                     </tr>
                     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
                        <td nowrap width="25%" align="right">Es Remediacion de Inconsistencias?</td>
                        <td nowrap width="25%" align="left">
                           <input type="radio" name="E02FATRCS" value="Y"
                              <%if (!client.getE02FATRCS().equals("N")) out.print("checked"); %>> Si
                           <input type="radio" name="E02FATRCS" value="N" 
                              <%if (client.getE02FATRCS().equals("N")) out.print("checked"); %>> No
                        </td>
                        <td nowrap width="25%" align="right">Descripcion Remediacion:</td>
                        <td nowrap width="25%" align="left" colspan='3'>
                           <textarea name="E02FATRCD" cols="33" rows="4" <%=read%>><%=client.getE02FATRCD()%></textarea>
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
                     <td nowrap width="15%" align="right">Clasificación CRS :</td>
                     <td nowrap width="35%" align="left">
                           <eibsinput:cnofc name="client" property="E02FATCLC" value="<%=client.getE02FATCLC()%>" required="false" flag="IF" fn_code="E02FATCLC" fn_description="D02FATCLC" readonly="<%=isReadOnly %>" />
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                           <eibsinput:text name="client" property="D02FATCLC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
                           <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" >
                     </td>
                     <td nowrap width="25%" align="right">Fecha Clasificación:</td>
                     <td nowrap width="25%" align="left">
                         <eibsinput:date name="client" fn_year="E02FATCCY" fn_month="E02FATCCM" fn_day="E02FATCCD" readonly="true"/>
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
      		<td width="33%" align="center"><input type="checkbox" name="H02FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(25);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
  		  	<% if (!userPO.getPurpose().equals("NEW")) {%>
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar Mnto" onClick="goAction(24);" <%= disabled %>>
     		<% } %>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
			<% if ( userPO.getPurpose().equals("NEW")) {%>
			    onClick="goAction(22);" 
			<% } else { %>
				onClick="goAction(26);" 
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
