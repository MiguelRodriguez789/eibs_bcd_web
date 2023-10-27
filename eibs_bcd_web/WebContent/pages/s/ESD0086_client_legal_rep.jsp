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

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT>
<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL_INQ");
 	boolean isApproval= userPO.getPurpose().equals("APPROVAL");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isMaintenance = userPO.getPurpose().equals("MAINTENANCE");
 	boolean isNew = userPO.getPurpose().equals("NEW");
    boolean isRead = isApprovalInquiry || isInquiry || isApproval ;
    boolean isReadA = isApprovalInquiry || isApproval ;
  	boolean isCustomer = !ESD0086Record.getField("E01RCN").getString().trim().equals("C");  
 	String legtyp = (ESD0086Record.getH01LGT().equals("1")?"JURIDICO":"PERSONA");  
    boolean isReadOnly = false;
    String disabled = "";
    String disabledM = "";
    String disabledN = "";
    String read = "";
    String readN = "";
    String readM = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";

    if (!isNew) { 
       readM = " readonly ";
	   disabledM = " disabled";
    }
    if (isRead || isReadA) { 
	   read = " readonly ";
       readN = " readonly ";
       readM = " readonly ";
	   disabled = " disabled";
	   disabledN = " disabled";
	   disabledM = " disabled";
	   isReadOnly = true;
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
	document.forms[0].E01CUN.value = "<%= ESD0086Record.getH01CUN().trim()%>";
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}

function goInquiry(type, cli) {
	var ope = '01';
	var scr = '3';
	if (type !=  'C') { 
		ope = '22';
		scr = '23';
	}	
  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=" + scr + "&OPE=" + ope + "&E01CUN=" + cli;
  	CenterWindow(pg,600,500,2);
}  

function goNew() {
  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=21&OPE=22";
	CenterWindow(pg,600,500,2);
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

<H3 align="center">Representantes Legales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_legal_rep.jsp, ESD0086"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0086" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="RECTYP" VALUE="<%=userPO.getHeader10() %>">
  <INPUT TYPE=HIDDEN NAME="H01CUN" VALUE="<%= ESD0086Record.getH01CUN().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01CUN" VALUE="<%= ESD0086Record.getH01CUN().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01RTP" VALUE="<%= userPO.getHeader10().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FL2" VALUE="A">

  
 <table class="tableinfo">
  <tr> 
    <td nowrap> 
      <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" align="right">Tipo Legal : </td>
            <td nowrap width="20%" align="left" > <%=legtyp%></td>
            <td nowrap width="10%" align="right">Estado : </td>
			<td nowrap width="60%" align="left" style="color:red;font-size:12;">
				<b><%= ESD0086Record.getD01STS().trim()%></b>		
			</td>
		</tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="10%" align="right">Código :</td>
            <td nowrap width="20%" align="left"><b><%= ESD0086Record.getH01CUN().trim()%></b></td>
            <td nowrap width="10%" align="right">Nombre Legal :</td>
			<td nowrap width="60%" align="left"><b><%= ESD0086Record.getH01NA1().trim()%></b></td>
		</tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
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
    </td>
  </tr>
 </table>
 
 <% 
 if (isNew){
%>
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="100%">
			<a href="javascript:goNew()"><b>Crear<br>Entidad</b></a>
      	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="100%">
			<a href="javascript:goInquiry('<%=ESD0086Record.getE01RCN().trim()%>','<%=ESD0086Record.getE01RNU().trim()%>')"><b>Consultar<br>Detalle</b></a>
      	</TD>
	</TR>
</TABLE> 

<%      
  }
%> 

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%" align="right">Número de Cliente / Prospecto / Entidad : </td>
            <td nowrap width="10%" align="left"> 
                <input type="text" name="E01RNU" size="10" maxlength="9" value="<%= ESD0086Record.getE01RNU().trim()%>" <%=readM%>> 
              					<% if (isNew) { %>
              					<A href="javascript:GetCustomerDescId('E01RNU','E01MA1','E01BNI','E01TID')"><%=help%></a> 
              					<% } %>
              					<%=mandatory %>
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="40%" align="left">
			</td>
            <td nowrap width="5%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
		</tr>            
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="5%" align="right">Consecutivo :</td>
            <td nowrap width="10%" align="left"> 
                <INPUT type="text" name="E01MAN" size="3" readonly value="<%= ESD0086Record.getE01MAN().trim()%>">
			</td>
            <td nowrap width="5%" align="right">Nombre :</td>
			<td nowrap width="40%" align="left">
				<input type="text" name="E01MA1" size="46" value="<%= ESD0086Record.getE01MA1().trim()%>" disabled>
			</td>
            <td nowrap width="5%" align="right">Identificación :</td>
			<td nowrap width="35%" align="left">
				<input type="text" name="E01PID" size="5" value="<%= ESD0086Record.getE01PID().trim()%>" disabled>
				<input type="text" name="E01TID" size="5" value="<%= ESD0086Record.getE01TID().trim()%>" disabled>
				<input type="text" name="E01BNI" size="25" value="<%= ESD0086Record.getE01BNI().trim()%>" disabled>
			</td>
		</tr>
       </table>
      </td>
    </tr>
  </table>
  
<div id="HOLDERINFO" style="position:relative; display:block;">
  <h4>Información de la Relación</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right">Cargo  :</td>
            <td nowrap width="35%" align="left">
            	<eibsinput:cnofc name="ESD0086Record" property="E01UC5" value="<%=ESD0086Record.getE01UC5()%>" required="false" flag="32" fn_code="E01UC5" fn_description="D01UC5" readonly="<%=isReadOnly %>" /> 
				<input TYPE="text" NAME="D01UC5" value="<%=ESD0086Record.getD01UC5()%>" readonly>  
            <td nowrap width="15%" align="right">Profesiòn/Ocupaciòn :</td>
            <td nowrap width="35%" align="left">
           		<eibsinput:cnofc name="ESD0086Record" property="E01UC9" required="false" flag="C4" fn_code="E01UC9" fn_description="D01UC9" readonly="<%=isReadOnly %>"/>
                <eibsinput:text property="D01UC9" name="ESD0086Record" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true"/>
            </td>
         </tr>        
       </table>
            
       </td>
       </tr>
    </table>

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
     		<input id="EIBSBTN" type=button name="Exit" value="Salir" onClick="goAction(<%=screen%>);" > 
     	  </div>	
  		</td>
  	</tr>	
  </table>	

  </form>
</body>

<SCRIPT>

</SCRIPT>

<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=ESD0086Record"> </script>
</html>
