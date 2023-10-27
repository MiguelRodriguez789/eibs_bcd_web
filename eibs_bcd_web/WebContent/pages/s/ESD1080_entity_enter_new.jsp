<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" 	scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD108001Message"  scope="session" />

<title>Entidad Nueva</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" 	rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script >

sessionStorage.removeItem('tab-index');

 function getIdTypeHelp(){
   // Get the client type selected
   var cusType = getElementChecked("E01LGT").value;
   // Display the id screen help 
   if (cusType.toUpperCase() == "1") {
     GetCodeDescAuxCNOFC('E01TID','','34','1');
   } else {
   	GetCodeDescAuxCNOFC('E01TID','','34','2');
   }
 }
 
function showIdFields() {

	var cusType = getElementChecked("E01LGT").value; 
	
	if (cusType.toUpperCase() == "2" ){
		getElement('IDCOL').style.display='block';
		getElement('NATURAL').style.display='block';
		getElement('JURIDICO').style.display='none';
	} else {
		getElement('IDCOL').style.display='block';
		getElement('NATURAL').style.display='none';
		getElement('JURIDICO').style.display='block';
	}
	
	<% if (currUser.getH01WK3().equals("N")) { // Non Automatic Number Generation %>  
		getElement('IDCUN').style.display='block';			
	<% } else {%>
		getElement('IDCUN').style.display='none';	
	<% } %>	
	
}

</script>
<% 
	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
%>
</head>
<body bgcolor="#FFFFFF">

<h3 align="center">Crear Entidad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="entity_enter_new, ESD1080"></h3>
<hr size="4">

<form name="forma" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="22">
<INPUT TYPE=HIDDEN NAME="OPE" VALUE="22">

<table class="tableinfo">

	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap align="right" valign="middle" width="15%">País : </td>
				<td colspan="3">
				<eibsinput:cnofc name="client" property="E01PID" value="<%=client.getE01PID()%>" required="false" flag="03" fn_code="E01PID" fn_description="D01PID" /> 
				<INPUT TYPE="text" NAME="D01PID" value="<%=client.getD01PID()%>" readonly> 
				</td>
			</tr>

			<tr id="trclear">
				<td nowrap align="right" valign="middle" width="15%">Tipo de Entidad :</td>
				<td colspan="3">
				<p>
				<input type="radio" name="E01LGT" value="1" <%if (client.getE01LGT().equals("1")) out.print("checked"); %> onclick="showIdFields();" >Jurídico 
				<input type="radio" name="E01LGT" value="2" <%if (client.getE01LGT().equals("2")) out.print("checked"); %> onclick="showIdFields();" >Persona Natural
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Obligatorio" align="bottom"> 
				</p>
				</td>
			</tr>
		</table>

		<div id="IDCOL" style="position:relative; display:none;">
		<table  cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap align="right" valign="middle" width="15%">Tipo e Identificación : </td>
				<td nowrap align="left" valign="middle" colspan="3">
					<input type="text" name="E01TID" value="<%=client.getE01TID()%>" maxlength="4" size="5" readonly>
					<a href="javascript:getIdTypeHelp()"> 
						<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0">
					</a> 
					<eibsinput:text name="client" property="E01IDN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_IDENTIFICATION %>" required="false" readonly="false"/>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="NATURAL" style="position:relative; display:none;">
		<table  cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark"> 
            <td nowrap width="15%" align="right">Primer Nombre :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01FNA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="true" /> 
            </td>
            <td nowrap width="15%" align="right">Segundo Nombre :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01FN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" />
            </td>
         </tr>
         <tr id="trclear"> 
            <td nowrap width="15%" align="right">Primer Apellido :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01LN1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="true" />
            </td>
            <td nowrap width="15%" align="right">Segundo Apellido :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:text name="client" property="E01LN2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CHAR %>" size="45" maxlength="40" required="false" />
            </td>
         </tr>
			<tr id="trclear">
				<td nowrap align="right" valign="middle" width="15%">Genero : </td>
				<td nowrap align="left" valign="middle" colspan="3">
					<p> 
                    <input type="radio" name="E01SEX" value="F" <%if (client.getE01SEX().equals("F")) out.print("checked"); %>>Femenino 
                    <input type="radio" name="E01SEX" value="M" <%if (client.getE01SEX().equals("M")) out.print("checked"); %>>Masculino
                    <%=mandatory %>
                    </p>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap align="right" valign="middle" width="15%">Fecha de Nacimiento :</td>
				<td nowrap align="left" valign="middle" colspan="3">
					<eibsinput:date name="client" fn_year="E01BDY" fn_month="E01BDM" fn_day="E01BDD" required="false"/>
				</td>
			</tr>
		</table>
		</div>

<div id="JURIDICO" style="position:relative; display:none;">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Razón Social :</td>
            <td nowrap width="85%" align="left"> 
               	<input type="text" name="E01NM6" size="120" maxlength="160" value="<%= client.getE01NM6().trim()%>">
               	<%=mandatory %>
            </td>
         </tr>
       </table>
</div>

	   	<div id="IDCUN" style="position:relative; display:none;">
	   	<table  cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trclear">
				<td nowrap align="right" valign="middle" width="30%">Número de Cliente :</td>
				<td nowrap align="left" valign="middle" colspan="2">
					<input type="text" name="E01CUN" maxlength="9" size="11" value="<%=client.getE01CUN()%>" onKeypress="enterInteger(event)">
				</td>
			</tr>
		</table>	
		</div>
        
		</td>
	</tr> 

</table>

<% 	if (client.getH01FLGWK3().equals("3")) { %>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Enviar a Control de Listas</td>
    	</tr>
  	</table>    
<% } %>


<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
</form>

<SCRIPT Language="Javascript">;
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");	
%>
      	showErrors();
<% 	
	} 
%>

	showIdFields();
		
</SCRIPT>
</body>
</html>
