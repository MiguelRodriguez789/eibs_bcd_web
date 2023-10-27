<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Biometric</title>
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
		alert("Falta Verificar Biometría de algún Titular Registrado en Biometría!!!");
		return;	 
	}
	document.getElementById("SCREEN").value="5"; 
	document.forms[0].submit();
}

function goVerify() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un Titular!!!");
		return;	 
	}
	VerificarPersona();
}

function isCheck() { 
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROWC") {
			if (document.forms[0].elements[n].checked == true) {
				var row = document.forms[0].elements[n].value;
				getElement("E01BIOCUN").value = getElement("E01BIOCUN_" + row).value;
				getElement("E01BIOPID").value = getElement("E01BIOPID_" + row).value;
				getElement("E01BIOTID").value = getElement("E01BIOTID_" + row).value;
				getElement("E01BIOIDN").value = getElement("E01BIOIDN_" + row).value;
				getElement("ROW").value = row;
				ok = true;
        		break;
			}
      	}
    }
}

function isVerified() { 
	var formLength= document.forms[0].elements.length;
   	ok = true;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROWC") {
				var row = document.forms[0].elements[n].value;
				if (getElement("E01BIOREG_" + row).value == "Y" && getElement("E01BIOVER_" + row).value != "Y") {
				  ok = false;
				  alert(getElement("E01BIONA1_" + row).value + " Sin Verificar !!!")
				  break;
				}
      	}
    }
}

// Verificar Persona //
function VerificarPersona() {
	hominiVerificarPersona(getElement("E01BIOTID").value,getElement("E01BIOIDN").value);
}
function VerificarPersonaSuc(res){
	var msg = "Verificar exitoso [" + res + "]";
	var row = getElement("ROW").value;
	getElement("E01BIOVER_" + row).value = "Y";
	getElement("E01BIOVER_" + row).checked = true;
	getElement("JSONRES").value = "ResVerificacionSuc: " + res + " - " + res;
	viewMessage(msg, false);
}
// Resultado error
function VerificarPersonaErr(res) {
	var msg = "Verificar con error [" + res + "]";
	var row = getElement("ROW").value;
	getElement("E01BIOVER_" + row).value = "N";
	getElement("E01BIOVER_" + row).checked = false;
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

<h3 align="center">Verificacion de Biometría para Titulares de Cuenta <%=userPO.getAccNum() %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="biometric_account_holders_list.jsp, EDD8000">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSEDD8000">
	<INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="5">
	<INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
	<INPUT TYPE=HIDDEN NAME="E01BIOCUN" VALUE="O">
	<INPUT TYPE=HIDDEN NAME="E01BIOPID" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01BIOTID" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01BIOIDN" VALUE="">
	<INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
	<INPUT TYPE=HIDDEN NAME="JSONSOL" VALUE="">
	<INPUT TYPE=HIDDEN NAME="JSONRES" VALUE="">
  
	<TABLE class="tbenter"> 
		<TR>
			<TD align="CENTER" class="TDBKG" width="33%">
				<a href="javascript:goVerify()"><b>Verificar</b></a>
			</TD>
			<TD align="CENTER" class="TDBKG" width="33%">
				<a href="javascript:goProcess()"><b>Finalizar<br>Verificación</b></a>
			</TD>
			<TD align="CENTER" class="TDBKG" width="34%">
				<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
			</TD>
		</TR>
	</TABLE> 

<% 
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No Hay Titulares con Biometria.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    
    <TR id=trdark>
		<td NOWRAP align="center" width="10%"><b>Sel</b></td>
		<td NOWRAP align="center" width="10%"><b>Cliente</b></td>
		<td NOWRAP align="center" width="30%"><b>Identificación</b></td>
		<td NOWRAP align="center" width="30%"><b>Nombre Titular</b></td>
		<td NOWRAP align="center" width="10%"><b>Biometria</b></td>
		<td NOWRAP align="center" width="10%"><b>Verificado</b></td>
	</TR>

        <%
    	  int i = 0;
          msgList.initRow();    
          while (msgList.getNextRow()) {
               EDD800001Message rcd = (EDD800001Message) msgList.getRecord();		 	 
         %>              
          <TR id=trclear>

		<td NOWRAP align="center" width="10%" valign="top">
			<input type="radio" name="ROWC" value="<%= msgList.getCurrentRow() %>"
			<% if (!rcd.getE01BIOREG().equals("Y")) out.print(" disabled"); %>
			>
		</td>

		<td NOWRAP align="center" width="10%" valign="top">
			<INPUT type="text" name="E01BIOCUN_<%= msgList.getCurrentRow() %>" size="4" maxlength="3"
				value='<%= rcd.getE01BIOCUN()%>' readonly>
		</td>
		
		<td NOWRAP align="center" width="30%" valign="top">
			<INPUT type="text" name="E01BIOPID_<%= msgList.getCurrentRow() %>" 
				value="<%= rcd.getE01BIOPID() %>" size="5" maxlength="4" readonly>
			<INPUT type="text" name="E01BIOTID_<%= msgList.getCurrentRow() %>" 
				value="<%= rcd.getE01BIOTID() %>" size="5" maxlength="4" readonly>
			<INPUT type="text" name="E01BIOIDN_<%= msgList.getCurrentRow() %>" 
				value="<%= rcd.getE01BIOIDN() %>" size="30" maxlength="25" readonly>
		</td>
		
		<td NOWRAP align="center" width="30%" valign="top">
			<INPUT type="text" name="E01BIONA1_<%= msgList.getCurrentRow() %>" 
				value="<%= rcd.getE01BIONA1() %>" size="30" maxlength="45" readonly>
		</td>

		<td NOWRAP align="center" width="10%" valign="top">
			<INPUT type="CHECKBOX" name="E01BIOREG_<%= msgList.getCurrentRow() %>"  
			 	value="<%=rcd.getE01BIOREG()%>" <% if (rcd.getE01BIOREG().equals("Y")) out.print(" checked"); %> disabled>
		</td>
		<TD nowrap align="center" width="10%" valign="top">
			<INPUT type="CHECKBOX" name="E01BIOVER_<%= msgList.getCurrentRow() %>"  
				value="<%=rcd.getE01BIOVER()%>" <% if (rcd.getE01BIOVER().equals("Y")) out.print(" checked"); %> disabled>
		</TD>
	</TR>
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
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDD8000?SCREEN=1&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSEDD8000?SCREEN=1&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= msgList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= msgList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
