<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Entidades Asociadas a Clientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

</head>

<jsp:useBean id="ESD0086Record" class="datapro.eibs.beans.ESD008601Message"  scope="session" /> 
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isApprovalInquiry || isInquiry;
 	boolean isCustomer = !ESD0086Record.getField("E01RNU").getString().trim().equals("0");
 	String legtyp = (ESD0086Record.getH01LGT().equals("1")?"JURIDICO":"PERSONA");  
	String read = "";
 	String disabled = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >"; 
 	String tf = "false";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		  tf = "true";
		}	
    if (isApprovalInquiry) {%>
		<% if (!ESD0086Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_ap_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_ap_corp_opt);
         <% } %>
   <% } else { %>

   <% if (isInquiry) { %>
	    <% if (!ESD0086Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_inq_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_inq_corp_opt);
         <% } %>	 
   <%} else {%>
         <% if (!ESD0086Record.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_corp_opt);
         <% } %>
   <% } %> 
   <% } %>  

 
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (getElement("E01FL1").checked == true) {
			alert("NO puede borrar una Direccion marcada como Principal");
			return;
		}
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].E01FL1.disabled = false;
	document.forms[0].submit();
}



</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
   int row = 0; 
%>

<H3 align="center">Direcciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_direcciones.jsp, ESD0086"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0086" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01IDF" VALUE="">
  <INPUT TYPE=HIDDEN NAME="F01IDF" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TIF" VALUE="">
  <INPUT TYPE=HIDDEN NAME="F01TIF" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01PIF" VALUE="">
  <INPUT TYPE=HIDDEN NAME="F01PIF" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01ID3" VALUE="">
  <INPUT TYPE=HIDDEN NAME="F01ID3" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01TI3" VALUE="">
  <INPUT TYPE=HIDDEN NAME="F01TI3" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01PI4" VALUE="">
  <INPUT TYPE=HIDDEN NAME="F01PI4" VALUE="">
  <INPUT TYPE=HIDDEN NAME="RECTYP" VALUE="<%=userPO.getHeader10() %>">

 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr id="trdclear"> 
            <td nowrap width="10%" align="right">Tipo Legal : </td>
            <td nowrap width="20%" align="left" > <%=legtyp%></td>
            <td nowrap width="10%" align="right">Estado : </td>
			<td nowrap width="60%" align="left" style="color:red;font-size:12;">
				<b><%= ESD0086Record.getD01STS().trim()%> <%= ESD0086Record.getD01UC6().trim()%></b>		
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Código :</td>
            <td nowrap width="20%" align="left"><b><%= ESD0086Record.getH01CUN().trim()%></b></td>
            <td nowrap width="10%" align="right">Nombre Legal :</td>
			<td nowrap width="60%" align="left"><b><%= ESD0086Record.getH01NA1().trim()%></b></td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">ID : </td>
            <td nowrap width="20%" align="left">
            	<b><%=ESD0086Record.getH01PID().trim()%> - <%=ESD0086Record.getH01TID().trim()%> - <%= ESD0086Record.getH01IDN().trim()%></b> 
			</td>
            <td nowrap width="10%" align="right"></td>
			<td nowrap width="60%" align="left"></td>
		</tr>
        </table>
	</td>
  </tr>
</table>  

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5" align="right">Consecutivo :</td>
            <td nowrap width="30%" align="left"> 
                <INPUT type="text" name="E01MAN" size="3" readonly value="<%= ESD0086Record.getE01MAN().trim()%>">
			</td>
			<td nowrap width="5%" align="right">Principal : </td>
			<td nowrap width="30%" align="left">
              <INPUT type="checkbox" name="E01FL1" value="Y" <% if (ESD0086Record.getE01FL1().equals("Y")) out.print("checked"); %> <%=disabled%>
               	<% if (isApprovalInquiry || isInquiry) { 
               		if (ESD0086Record.getF01FL1().equals("Y")) out.print("id=\"txtchanged\""); 
               		}
              	%>
              	> 
			</td>
			<td nowrap width="5%" align="right">Estado : </td>
			<td nowrap width="25%" align="left">
				<select name="E01FL2" <%=disabled%>
            	<% if (isApprovalInquiry || isInquiry) { 
               		if (ESD0086Record.getF01FL2().equals("Y")) out.print("id=\"txtchanged\""); 
               	 } 
              	%>
              	>
                <option value="A" <% if (ESD0086Record.getE01FL2().equals("A")) out.print("selected"); %>>ACTIVO</option>
                <option value="C" <% if (ESD0086Record.getE01FL2().equals("C")) out.print("selected"); %>>INACTIVO</option>
                <option value=" " <% if ( (!ESD0086Record.getE01FL2().equals("A") && !ESD0086Record.getE01FL2().equals("C"))) out.print("selected"); %>></option>
              </select>
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Tipo :</td>
			<td nowrap width="30%" align="left">
				<eibsinput:cnofc name="ESD0086Record" property="E01ADF" value="<%=ESD0086Record.getE01ADF()%>" required="true" flag="DT" fn_code="E01ADF" fn_description="D01ADF" readonly="<%=isReadOnly %>" /> 
				<input TYPE="text" NAME="D01ADF" value="<%=ESD0086Record.getD01ADF()%>" readonly> 
			</td>
            <td nowrap width="5%" align="right">Agencia Relacionada : </td>
			<td nowrap width="30%" align="left">
				<eibsinput:help name="ESD0086Record" property="E01INC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="false" fn_param_one="E01INC" fn_param_two="" 
              	 fn_param_three="D01INC" readonly="<%=isReadOnly %>"/>
              	 <input type="text" name="D01INC" size="25" value="<%= ESD0086Record.getD01INC().trim()%>" readonly>
			</td>
			<td nowrap width="5%" align="right"> </td>
			<td nowrap width="25%" align="left">
				 
			</td>
		</tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Uso de Dirección : </td>
            <td nowrap width="30%" align="left">
              	<select name="E01BSX" <%= disabled %>>
                	<option value=" " <% if (!(ESD0086Record.getE01BSX().equals("U") || ESD0086Record.getE01BSX().equals("R") || ESD0086Record.getE01BSX().equals("U"))) out.print("selected"); %>> 
                     </option>
                    <option value="U" <% if (ESD0086Record.getE01BSX().equals("U")) out.print("selected"); %>>Urbano</option>
                    <option value="R" <% if (ESD0086Record.getE01BSX().equals("R")) out.print("selected"); %>>Rural</option>
                    <option value="S" <% if (ESD0086Record.getE01BSX().equals("S")) out.print("selected"); %>>Semiestacionario</option>                   
                </select>
                <%=mandatory %>
            </td>	
            <td nowrap width="5%" align="right">Como llegar : </td> 
            <td nowrap width="30%" align="left">
            	<textarea name="E01RMK" cols="45" rows="5" <%=read%>><%=ESD0086Record.getE01RMK()%></textarea>
            </td>
			<td nowrap width="5%" align="right"> </td>
			<td nowrap width="25%" align="left">
			</td>
        </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="5%" align="right">Categoría Dirección :</td>
            <td nowrap width="30%" align="left">
            	<input type="text" name="E01COM" size="5" maxlength="3" value="<%= ESD0086Record.getE01COM().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:GetCityCategory(document.forms[0]['E01ADC'].value,
            											document.forms[0]['E01STE'].value,
            											document.forms[0]['E01CTC'].value,
            											'0',document.forms[0]['E01BSX'].value,
            											'E01ADC','E01STE','E01CTC', 'E01COM','D01COM','','')" >
              		<%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01COM" size="25" value="<%= ESD0086Record.getD01COM().trim()%>" readonly>    
            </td>	
            <td nowrap width="5%" align="right">SubCategoría Dirección</td> 
            <td nowrap width="30%" align="left">
            	<input type="text" name="E01PAR" size="5" maxlength="4" value="<%= ESD0086Record.getE01PAR().trim()%>" <%=read%>> 
            		<% if ( !isReadOnly) {%>
            		<a href="javascript:GetCityCategory(document.forms[0]['E01ADC'].value,
            											document.forms[0]['E01STE'].value,
            											document.forms[0]['E01CTC'].value,
            											document.forms[0]['E01COM'].value,
            											document.forms[0]['E01BSX'].value,
            											'E01ADC','E01STE','E01CTC', 'E01COM','D01COM','E01PAR','D01PAR')" > 
              		<%=help%></a>
              		<% } %>
              		<%=mandatory %>
            	<input type="text" name="D01PAR" size="25" value="<%= ESD0086Record.getD01PAR().trim()%>" readonly>
            </td>
			<td nowrap width="5%" align="right"> </td>
			<td nowrap width="25%" align="left">
			</td>
       </table>
      </td>
    </tr>
  </table>

   
<div id="BASICINFO" style="position:relative; display:block;">

	<jsp:include page="ESD0080_address_template_basic_colombia.jsp" flush="true" >				
		<jsp:param name="title" value="Direcciòn" /> 
		<jsp:param name="messageName" value="ESD0086Record" />
		<jsp:param name="readOnly" value="<%=tf%>" />
		<jsp:param name="suffix" value="E01" />
		<jsp:param name="basic" value="false" />
	</jsp:include>		
</div>

 <br> 

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
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
  		  	<% 
     		int screen = 1;
			if (userPO.getPurpose().equals("INQUIRY")) {
				screen = 8;
			}
			if (userPO.getPurpose().equals("APPROVAL")){
				screen = 6;
			} 
			%> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" onClick="goAction(<%=screen%>);" > 
     	  </div>	
  		</td>

  	</tr>	
  </table>	

  </form>
</body>

<SCRIPT Language="Javascript">
	
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=ESD0086Record"> </script>
</html>
