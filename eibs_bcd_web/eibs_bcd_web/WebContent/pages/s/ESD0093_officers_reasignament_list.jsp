<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Officer Reasignament</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "optList" class= "datapro.eibs.beans.JBObjList"  scope="session" />


<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/mapstyler.js"></script>

<%	
	if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
	Boolean isApproval = false;
	String disabled = "";
	String checkbox = "checkbox";
	String mark = "A";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
	{ 	  
		isApproval = true;
		disabled = " disabled";
		checkbox = "hidden";
		mark = "*";
	}

    int i = 0;
    optList.initRow();
    optList.getNextRow();
    ESD009311Message msgList = (ESD009311Message) optList.getRecord();
%> 

<SCRIPT >
var ok = false;
 
function goProcess(scr) {
	if (scr != 25) {
		if(document.forms[0].E11OF1.value == "") {
			alert("Favor seleccione un Asesor Actual!!!");
			document.forms[0].Refresh.disabled = false;
			return;	 
		}
		if(document.forms[0].E11OF2.value == "") {
			alert("Favor seleccione un Asesor Nuevo!!!");
			document.forms[0].Refresh.disabled = false;
			return;	 
		}
		document.forms[0].Refresh.disabled = true;
		document.forms[0].Submit.disabled = false;
		if (scr == 15) {
			document.forms[0].Submit.disabled = true;
		}
	} else {
		document.forms[0].Approval.disabled = true;
	}	
    document.forms[0].SCREEN.value = scr;
    submitForm();
}

function DisabledSub() {
	document.forms[0].Submit.disabled = true;
}

function putAll(p) {
 	if (p) {
		var formLength= document.forms[0].elements.length;
		for(n=0;n<formLength;n++) {
     		var elementName= document.forms[0].elements[n].name;
      		var nme = elementName.substring(0,9);
      			if (nme == 'E11CUAACT') {
      				getElement(elementName).checked = true;
      				getElement(elementName).value = "<%=mark%>";
      			}	
      	}		
    }
    getElement("ALL").checked = false;
 }

function delAll(p) {
 	if (p) {
		var formLength= document.forms[0].elements.length;
		for(n=0;n<formLength;n++) {
     		var elementName= document.forms[0].elements[n].name;
      		var nme = elementName.substring(0,9); 
      			if (nme == 'E11CUAACT') {
  					getElement(elementName).checked = false;
   					getElement(elementName).value = "N";
      			}	
      	}		
    }
    getElement("NONE").checked = false;
 }
 

function goInquiryCust(cun) {
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080?SCREEN=8&OPE=00&E01CUN=" + cun;
	CenterWindow(pg,600,500,2);
}

function goInquiryAcc(acc) {
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=10&ACCNUM=" + acc + "&opt=1";
	CenterWindow(pg,600,500,2);
}
 
</SCRIPT>

</head>

<body>

<H3 align="center">
	<% if (isApproval) {%>Aprobación - <%}%>
	Reasignación de Asesores
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="officers_reasignament_list.jsp_ESD0093">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0093">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">
  <INPUT type=HIDDEN name="totalRow" value="1">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0"> 
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
<% if (!isApproval) {%>
  <table id="headTable" style="width: 100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <tr id="trdark">
        	<td nowrap width="15%" align="right">Cliente : </td>
         	<td nowrap width="35%" align="left"> 
            	<input type="text" name="E11CUN" size="12" maxlength="9" value="<%=msgList.getE11CUN()%>" >
            	<input type="text" name="D11NA1" size="50" maxlength="45" value="<%=msgList.getD11NA1()%>" readonly>
            	<a href="javascript:GetCustomerDescId('E11CUN','D11NA1',''); DisabledSub()">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" >
            	</a>
        	</td>
        	<td nowrap width="15%" align="right">(0 Todos los Clientes)</td>
         	<td nowrap width="35%" align="left">			
        </tr>
        <tr id="trdark">
        	<td nowrap width="15%" align="right">Asesor Actual : </td>
         	<td nowrap width="35%" align="left"> 
            	<eibsinput:cnofc name="msgList" property="E11OF1" value="<%=msgList.getE11OF1()%>" required="true" flag="15" fn_code="E11OF1" fn_description="D11OOF" />
       	        <input type="text" name="D11OOF" size="35" value="<%=msgList.getD11OOF()%>" readonly>
       	        <br> 
       	        Zona : 
       	        <input type="text" name="E11CUAZO1" size="5" value="<%=msgList.getE11CUAZO1()%>" readonly>
       	        Fuerza Comercial : 
       	        <input type="text" name="E11CUAFC1" size="5" value="<%=msgList.getE11CUAFC1()%>" readonly>
        	</td>
        	<td nowrap width="15%" align="right">Nuevo Asesor : </td>
         	<td nowrap width="35%" align="left">
         		<eibsinput:cnofc name="msgList" property="E11OF2" value="<%=msgList.getE11OF2()%>" required="true" flag="15" fn_code="E11OF2" fn_description="D11NOF" />
       	        <input type="text" name="D11NOF" size="35" value="<%=msgList.getD11NOF()%>" readonly>
       	        <br>
       	        Zona : 
       	        <input type="text" name="E11CUAZO2" size="5" value="<%=msgList.getE11CUAZO2()%>" readonly> 
       	        Fuerza Comercial : 
       	        <input type="text" name="E11CUAFC2" size="5" value="<%=msgList.getE11CUAFC2()%>" readonly>
       	    </td>			
        </tr>
        <tr id="trdark">
        	<td nowrap width="15%" align="right">Oficina Actual : </td>
         	<td nowrap width="35%" align="left"> 
 	         	<input type="text" name="E11BR1" size="5" maxlength="4" onKeypress="enterInteger(event)" value="<%=msgList.getE11BR1()%>">
 	         	<a href="javascript:GetBranch('E11BR1','<%=currUser.getE01CBK()%>','D11OBR')">
 	         	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0"  ></a>
 	         	<input type="text" name="D11OBR" size="35" value="<%=msgList.getD11OBR()%>" readonly>
        	</td>
        	<td nowrap width="15%" align="right">Nueva Oficina : </td>
         	<td nowrap width="35%" align="left">
         		<input type="text" name="E11BR2" size="5" maxlength="4" onKeypress="enterInteger(event)" value="<%=msgList.getE11BR2()%>">
 	         	<a href="javascript:GetBranch('E11BR2','<%=currUser.getE01CBK()%>','D11NBR')">
 	         	<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0"  ></a>
       	        <input type="text" name="D11NBR" size="35" value="<%=msgList.getD11NBR()%>" readonly>
       	    </td>			
        </tr>
  
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
        <td width="50%" align="center"> 
	        	<input id="EIBSBTN" type="button" name="Refresh" value="Refrescar" onClick="this.disabled=true;this.value='Enviando, Favor Esperar...';goProcess(12)">
  		</td>
  		<td width="50%" align="center"> 
	        	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="this.disabled=true;this.value='Enviando, Favor Esperar...';goProcess(15)">
  		</td>
      </tr>
    </table>
  <%} else {%>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
      <tr bgcolor="#FFFFFF"> 
  		<td width="100%" align="center"> 
	        	<input id="EIBSBTN" type="button" name="Approval" value="Aprobar" onClick="this.disabled=true;this.value='Enviando, Favor Esperar...';goProcess(25)">
  		</td>
      </tr>
    </table>
  <%} %>   

<%	if ( optList.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No existen Clientes que cumplan con los datos ingresados</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	} else {
%>    
  <center>
  <div id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll"> 
  <table id="dataTable" style="font-size:8pt; width: 100%">
    <tr>
    <td>
   	<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
      <tr id="trdark">
      <td colspan="8">
      <div id="container">
		<h4>Cliente(s) y sus Cuentas :  
			<input type="checkbox" name="ALL" value="1" onClick="putAll(this.checked);">
			Seleccionar todos 
			<input type="checkbox" name="NONE" value="1" onClick="delAll(this.checked);">
			Desmarcar todos 
		</h4>
		<div id="content" style="overflow-Y:scroll;height: 400px" >
		<noscript><p><strong>Lo siento, esta pagina necesita JavaScript para funcionar</strong></p></noscript>
		<ul id="sitemap">
      <%
      	boolean firstTimeL1 = true;
      	optList.initRow();
      	
      	while (optList.getNextRow()) {
      		msgList = (ESD009311Message) optList.getRecord();
      		// Level 1
      		if (msgList.getE11TYR().equals("H")) { 
      			if (!firstTimeL1) {
      				out.println("</ul>");
      				out.println("</li>"); 
      			}
      			firstTimeL1 = false;
      			%>
      				<input type="hidden" name="E11CUACUN_<%= optList.getCurrentRow() %>" value="<%=msgList.getE11CUACUN()%>">
					<input type="hidden" name="E11CUAACC_<%= optList.getCurrentRow() %>" value="<%=msgList.getE11CUAACC()%>">
					<input type="hidden" name="E11TYR_<%= optList.getCurrentRow() %>" value="<%=msgList.getE11TYR()%>">
					<input type="hidden" name="E11CUACUS_<%= optList.getCurrentRow() %>" value="<%=msgList.getE11CUACUS()%>">
					
      				<li><a href="#">
      						<input type="checkbox" id="type_<%= optList.getCurrentRow() %>" name="E11CUAACT_<%= optList.getCurrentRow() %>" value="<%=mark%>" <% if (msgList.getE11CUAACT().equals(mark)) { out.print("checked"); } %>>
      						<A HREF="javascript:goInquiryCust('<%=msgList.getE11CUACUN()%>')">
      						<%=msgList.getE11CUACUN()%> - <%=msgList.getD11NA1()%> (<%=msgList.getD11STS()%>)
      						</a>
      						<% if (isApproval) {%>
      						
      						De <%=msgList.getE11CUAOF1()%>-<%=msgList.getD11OOF()%> a <%=msgList.getE11CUAOF2()%>-<%=msgList.getD11NOF()%>
      						
      						 / De <%=msgList.getE11CUABR1()%>-<%=msgList.getD11OBR()%> a <%=msgList.getE11CUABR2()%>-<%=msgList.getD11NBR()%>
      						<% } %>
      					</a>
      				<ul>	
       	    	<%
       	    	} 
       	    	// Level 2
      			if (msgList.getE11TYR().equals("D")) { 
      			%>
      				<input type="hidden" name="E11CUACUN_<%= optList.getCurrentRow() %>" value="<%=msgList.getE11CUACUN()%>">
					<input type="hidden" name="E11CUAACC_<%= optList.getCurrentRow() %>" value="<%=msgList.getE11CUAACC()%>">
					<input type="hidden" name="E11TYR_<%= optList.getCurrentRow() %>" value="<%=msgList.getE11TYR()%>">
					<input type="hidden" name="E11CUACUS_<%= optList.getCurrentRow() %>" value="<%=msgList.getE11CUACUS()%>">
      				<li><a href="#">
      						<input type="checkbox" id="type_<%= optList.getCurrentRow() %>" name="E11CUAACT_<%= optList.getCurrentRow() %>" value="<%=mark%>" <% if (msgList.getE11CUAACT().equals(mark)) { out.print("checked"); } %> >
      						<A HREF="javascript:goInquiryAcc('<%=msgList.getE11CUAACC()%>')">
      						<%=msgList.getE11CUAACC()%> - <%=msgList.getD11NA1()%> (<%=msgList.getD11STS()%> Ofc: <%=msgList.getE11CUABR1()%>)
      						</a>
      					</a>
      				</li>
       	    	<%
       	     	}
	       	 i++;   
      	}
      	if (!firstTimeL1) {
			out.println("</ul>");
			out.println("</li>");
      	}
      	%>
      	</ul>
		</div>
	</div>
	</td>
	</tr>
    </table>
    </td>
    </tr>

</table>
</center>

<SCRIPT type="text/javascript">

	document.forms[0].TOTROWS.value = <%=i%>;
	document.forms[0].NEXTROWS.value = <%= optList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= optList.getFirstRec()%>;

</SCRIPT>	
<%	
	} 
%>

<SCRIPT>

document.forms[0].totalRow.value="11";
function resizeDoc() {
      adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'),1,false);
}
resizeDoc();
window.onresize = resizeDoc;

     
</SCRIPT>

</form>
</body>

</html>