<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Verificar Biometria Cuentas Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/Homini/jsHomini.js"> </SCRIPT>

<SCRIPT >
var ok = false;

function goProcess() {
	isVerified();
	if ( !ok ) {
		alert("Biometría sin Verificar!");
		return;	 
	}
	document.getElementById("SCREEN").value = "5"; 
	document.forms[0].submit();
}

function goVerify() {
	VerifyRNEC();
}

function isVerified() { 
	ok = false;
	if (getElement("E01CABSTS").value == "V" || getElement("E01CABSTS").value == "X") {
		ok = true;
	}
}

// VerifyRNEC //
function VerifyRNEC() { 
	var idn = getElement("E01IDN").value;
	var tid = getElement("E01TID").value;
	if (idn ==  '' || tid == '') {
		alert('Debe Digitar Primero Tipo e Identificación !!!')
		return;
	}
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.client.JSESD1094?SCREEN=3&E01IDN=" + idn + "&E01TID=" + tid;
	CenterWindow(page,1000,500,2);
}  

// Verificar Persona //
function VerificarPersona() {
	hominiVerificarPersona(getElement("E01TID").value,getElement("E01IDN").value);
}
function VerificarPersonaSuc(res){
	var msg = "Verificar exitoso [" + res + "]";
	var row = getElement("ROW").value;
	getElement("E01CABSTS").value = "V";
	getElement("JSONRES").value = "ResVerificacionSuc: " + res + " - " + res;
	viewMessage(msg, false);
}
// Resultado error
function VerificarPersonaErr(res) {
	var msg = "Verificar con error [" + res + "]";
	var row = getElement("ROW").value;
	getElement("E01CABSTS").value = "N";
	getElement("JSONRES").value = "ResVerificacionError: " + res;
	viewMessage(msg, true);
}

function viewMessage(msg, dtl) {
	if (dtl) {
		var jSol = getElement("JSONSOL").value;
		var jRes = getElement("JSONRES").value;
		var text = jSol + "<br><br>" + jRes;
		page = "${pageContext.request.contextPath}/pages/s/MISC_message_viewer.jsp?MESSAGE=" + text;
		CenterWindow(page,600,200,2);
	} else {
		alert(msg);
	};
}
		
</SCRIPT>

<% 
	String idn = ""; String tid = "";
%>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
		 out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
		 out.println("       showErrors()");
		 out.println("</SCRIPT>");
 }
%>

<h3 align="center">Verificar Biometria Cuentas Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="biometric_account_list.jsp, EDD8002"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDD8002">
	<INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="5">
	<INPUT TYPE=HIDDEN id="E01CABCUN" NAME="E01CABCUN" VALUE="<%=userPO.getCusNum()%>">
	<INPUT TYPE=HIDDEN id="E01CABSTS" NAME="E01CABSTS" VALUE="">
	<INPUT TYPE=HIDDEN id="E01IDN" NAME="E01IDN" VALUE="">
	<INPUT TYPE=HIDDEN id="E01TID" NAME="E01TID" VALUE="">

	<INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
	<INPUT TYPE=HIDDEN NAME="JSONSOL" VALUE="">
	<INPUT TYPE=HIDDEN NAME="JSONRES" VALUE="">
	
	<TABLE class="tbenter"> 
		<TR>
			<TD align="CENTER" class="TDBKG" width="33%">
				<a href="javascript:goVerify()"><b>Verificar<br>RNEC</b></a>
			</TD>
			<TD align="CENTER" class="TDBKG" width="33%">
				<a href="javascript:goProcess()"><b>Finalizar<br>Verificación</b></a>
			</TD>
			<TD align="CENTER" class="TDBKG" width="34%">
				<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
			</TD>
		</TR>
	</TABLE> 

<% if ( msgList.getNoResult() ) { %>
	<TABLE class="tbenter" width=100% height=30%>
		<TR>
			<TD>         
			<div align="center"> <h4 style="text-align:center"> No Hay Cuentas Pendientes por Verificar Biometria.</h4> 
			</div>
			</TD></TR>
		</TABLE>
<% } else { %>    
	<TABLE class="tableinfo" id="dataTable">
		<TR id=trdark>
			<td NOWRAP align="center" width="10%"><b>Cliente</b></td>
			<td NOWRAP align="center" width="15%"><b>Identificación</b></td>
			<td NOWRAP align="center" width="25%"><b>Nombre</b></td>
			<td NOWRAP align="center" width="10%"><b>Cuenta<br>Verificar</b></td>
			<td NOWRAP align="center" width="15%"><b>Producto<br>Verificar</b></td>
			<td NOWRAP align="center" width="10%"><b>Cuenta<br>Relacionada</b></td>
			<td NOWRAP align="center" width="15%"><b>Producto<br>Relacionado</b></td>
		</TR>
		<%
			int i = 0;
				msgList.initRow();
				while (msgList.getNextRow()) {
					EDD800201Message rcd = (EDD800201Message) msgList.getRecord();
					tid = rcd.getE01TID();
					idn = rcd.getE01IDN();
		%>              
		<tr id=trclear>
			<td NOWRAP align="center" width="10%" valign="top"><%=rcd.getE01CABCUN()%></td>
			<td NOWRAP align="center" width="15%" valign="top"><%=rcd.getE01TID()%> <%=rcd.getE01IDN()%></td>
			<td NOWRAP align="center" width="25%" valign="top"><%=rcd.getE01FNA()%> <%=rcd.getE01FN2()%> <%=rcd.getE01LN1()%> <%=rcd.getE01LN2()%></td>
			<td NOWRAP align="center" width="10%" valign="top"><%=rcd.getE01CABACC()%></td>
			<td NOWRAP align="center" width="15%" valign="top"><%=rcd.getE01DS1()%></td>
			<td NOWRAP align="center" width="10%" valign="top"><% if (!rcd.getE01CABRAC().equals("0")) out.print(rcd.getE01CABRAC()); %></td>
			<td nowrap align="center" width="15%" valign="top"><%=rcd.getE01DS2()%></td>
		</tr>
		<% 
				i++; 
			} 
		%> 
	</TABLE>
	
	<TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
		 <TR>
			<TD WIDTH="50%" ALIGN=LEFT height="25">
			 <%
			if ( msgList.getShowPrev() ) {
				int pos = msgList.getFirstRec() - 101;
				out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDD8002?SCREEN=1&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
			} %>
			</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25"> 
			<%       
			if (msgList.getShowNext()) {
				int pos = msgList.getLastRec();
				out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDD8002?SCREEN=1&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
			} %>
	</TD>
 </TR>
 </TABLE>
	
<BR>
<SCRIPT type="text/javascript">
	document.getElementById("E01TID").value = "<%=tid%>";
	document.getElementById("E01IDN").value = "<%=idn%>";
	document.forms[0].TOTROWS.value = <%=i%>;
	document.forms[0].NEXTROWS.value = <%=msgList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%=msgList.getFirstRec()%>;
</SCRIPT>
<%      
	}
%> 
</form>
</body>
</html>
