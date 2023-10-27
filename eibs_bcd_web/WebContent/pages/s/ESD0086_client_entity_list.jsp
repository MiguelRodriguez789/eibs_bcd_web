<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import="datapro.eibs.master.*,datapro.eibs.beans.*"%>
<title>Entidades Asociadas a Clientes</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="ESD0086List" class="datapro.eibs.beans.JBObjList"
	scope="session" />
<jsp:useBean id="userPO"
	beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>"
	type="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
<%
          ESD0086List.initRow();    
          ESD0086List.getNextRow();
          ESD008601Message client = (ESD008601Message) ESD0086List.getRecord();
          ESD0086List.removeRow(0);  
          String legtyp = (client.getH01LGT().equals("1")?"JURIDICO":"PERSONA");
          
%> 

   <% if (userPO.getPurpose().equals("APPROVAL")) {%>
		<% if (!client.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_ap_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_ap_corp_opt);
         <% } %>
   <% } else { %>

   <% if (userPO.getPurpose().equals("INQUIRY")) { %>
	    <% if (!client.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_inq_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_inq_corp_opt);
         <% } %>	 
   <%} else {%>
         <% if (!client.getH01LGT().equals("1") ) { %>
		     builtNewMenu(client_personal_opt);
         <% } else {  %>
		     builtNewMenu(client_corp_opt);
         <% } %>
   <% } %> 
   <% } %>  


var ok = false;

function goNew() {
	getElement("E01CUN").value = "<%=client.getH01CUN()%>";
	getElement("E01RTP").value = "<%=userPO.getHeader10()%>";
	document.forms[0].SCREEN.value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="3";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="4";
	if (!confirm("Desea borrar el registro seleccionado?")) {
		return;
	}
	document.forms[0].submit();
} 


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ROW") {
			if (document.forms[0].elements[n].checked == true) {
				ok = true;
        		break;
			}
      	}
    }
}

function setKey(rtp,cun,man) {
	getElement("E01RTP").value = rtp;
	getElement("E01CUN").value = cun;
	getElement("E01MAN").value = man;
}

<%  
 String title = "Entidades";
 if ( userPO.getHeader10().equals("1") ) {
 	title = "Direcciones";
  } else if ( userPO.getHeader10().equals("2") ) {
 	title = "Accionistas";	
  } else if ( userPO.getHeader10().equals("3") ) {
 	title = "Junta Directiva";
 } else if ( userPO.getHeader10().equals("4") ) {
 	title = "Beneficiarios";
 } else if ( userPO.getHeader10().equals("5") ) {
 			title = "Representante legal";
 } else if ( userPO.getHeader10().equals("6") ) {
 	title = "Referencias Bancarias";
 } else if ( userPO.getHeader10().equals("7") ) {
 	title = "Referencias Comerciales"; 
 } else if ( userPO.getHeader10().equals("9") ) {
 	title = "Activos";
 } else if ( userPO.getHeader10().equals("A") ) {
 	title = "Pasivos"; 	 		
 } else if ( userPO.getHeader10().equals("C") ) {
 	title = "Contactos / Dependientes";
 } else if ( userPO.getHeader10().equals("F") ) {
 	title = "Referencias Familiares";
 } else if ( userPO.getHeader10().equals("M") ) {
 	title = "Relaciones";
 } else if ( userPO.getHeader10().equals("P") ) {
 	title = "Referencias Personales";
 } else if ( userPO.getHeader10().equals("Q") ) {
 	title = "Exenciones de Impuestos";	
 } else if ( userPO.getHeader10().equals("W") ) {
 	title = "Pagare Unico"; 	
 } else if ( userPO.getHeader10().equals("Y") ) {
 	title = "Teléfonos";
 } else if ( userPO.getHeader10().equals("Z") ) {
 	title = "Correos Electrónicos";		
 } else if ( userPO.getHeader10().equals("U") ) {
 	title = "Usos de Domicilio";			
 } else if ( userPO.getHeader10().equals("V") ) {
 	title = "Información Adicional";				
 }
%>
	
</SCRIPT>

</head>

<body>

	<%
		if (!error.getERRNUM().equals("0")) {
			out.println("<SCRIPT Language=\"Javascript\">");
			error.setERRNUM("0");
			out.println("       showErrors()");
			out.println("</SCRIPT>");
		}
		out.println("<SCRIPT> initMenu(); </SCRIPT>");
	%>

	<h3 align="center"><%=title%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
			name="EIBS_GIF" title="client_entity_list.jsp, ESD0086">
	</h3>
	<hr size="4">


	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0086">

		<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6"> 
		<INPUT TYPE=HIDDEN NAME="actRow" VALUE="0"> 
		<INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0"> 
		<INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
		<INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0"> 
		<INPUT TYPE=HIDDEN NAME="E01CUN" VALUE=""> 
		<INPUT TYPE=HIDDEN NAME="E01RTP" VALUE=""> 
		<INPUT TYPE=HIDDEN NAME="E01MAN" VALUE="">


		<table class="tableinfo" width="100%">
			<tr bordercolor="#FFFFFF">
				<td nowrap>
					<table cellspacing="0" cellpadding="2" width="100%" class="tbhead"
						bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
						<tr id="trdark">
							<td nowrap width="10%" align="right">Tipo Legal :</td>
							<td nowrap width="20%" align="left"><%=legtyp%></td>
							<td nowrap width="10%" align="right">Estado :</td>
							<td nowrap width="60%" align="left"
								style="color: red; font-size: 12;"><b><%=client.getD01STS().trim()%>
									<%=client.getD01UC6().trim()%></b></td>
						</tr>
						<tr id="trclear">
							<td nowrap width="10%" align="right">Código :</td>
							<td nowrap width="20%" align="left"><b><%=client.getH01CUN().trim()%></b></td>
							<td nowrap width="10%" align="right">Nombre Legal :</td>
							<td nowrap width="60%" align="left"><b><%=client.getH01NA1().trim()%></b></td>
						</tr>
						<tr id="trdark">
							<td nowrap width="10%" align="right">ID :</td>
							<td nowrap width="20%" align="left"><b><%=client.getH01PID().trim()%>
									- <%=client.getH01TID().trim()%> - <%=client.getH01IDN().trim()%></b>
							</td>
							<td nowrap width="10%" align="right"></td>
							<td nowrap width="60%" align="left"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%
			if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")) {
		%>

		<TABLE class="tbenter">
			<TR>
				<% if (!(userPO.getHeader10().equals("U") || userPO.getHeader10().equals("V"))) { %>
				<TD align="CENTER" class="TDBKG" width="33%">
					 <a href="javascript:goNew()"><b>Crear</b></a> 
				</TD>
				<%	} %>
				
				<% if (!ESD0086List.getNoResult()) { %>
				<TD align="CENTER" class="TDBKG" width="33%"><a
					href="javascript:goProcess()"><b>Modificar</b></a></TD>
				<% } %>
				<TD align="CENTER" class="TDBKG" width="34%"><a
					href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
				</TD>
			</TR>
		</TABLE>

		<%
			} else {
		%>

		<TABLE class="tbenter">
			<TR>
				<TD align="CENTER" class="TDBKG" width="50%"><a
					href="javascript:goProcess()"><b>Consultar</b></a></TD>
				<TD align="CENTER" class="TDBKG" width="50%"><a
					href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
				</TD>
			</TR>
		</TABLE>


		<%
			}
			if (ESD0086List.getNoResult()) {
		%>
		<TABLE class="tbenter" width=100% height=30%">
			<TR>
				<TD>
					<div align="center">
						<h4 style="text-align: center">No hay Registros.</h4>
					</div>
				</TD>
			</TR>
		</TABLE>
		<%
			} else {
		%>

		<table class="tableinfo" width="100%">

			<TR id=trdark>
				<td NOWRAP align="center" width="5%"><B>Sel</B></td>
				<td NOWRAP align="center" width="10%"><B>Secuencia</B></td>
				<td NOWRAP align="center" width="40%"><B>Descripción</B></td>
				<td NOWRAP align="center" width="20%"><B>Tipo /<br>En
						Calidad de
				</B></td>
				<TD nowrap align="center" width="20%"><B>Estado</B></TD>
				<td NOWRAP align="center" width="5%"><B>Borrar</B></td>

			</TR>

			<%
				int i = 0;
					ESD0086List.initRow();
					while (ESD0086List.getNextRow()) {
						ESD008601Message msgList = (ESD008601Message) ESD0086List
								.getRecord();
			%>
			<TR id=trclear>

				<td NOWRAP align="center" width="5%">
					<INPUT TYPE="radio" name="ROW" value="<%=ESD0086List.getCurrentRow()%>" onClick="setKey('<%=msgList.getE01RTP()%>','<%=msgList.getE01CUN()%>','<%=msgList.getE01MAN()%>')">
				</td>
				<td NOWRAP align="center" width="10%"><%=msgList.getE01MAN()%></td>
				<td NOWRAP align="left" width="40%">
					<%
						if (!msgList.getE01RTP().equals("1"))
									out.print((!msgList.getE01DSC().equals("") ? msgList.getE01DSC(): msgList.getE01MA1()));
								else
									out.print(msgList.getE01MA2() + " "
											+ msgList.getE01MA3() + " "
											+ msgList.getE01MA4() + " "
											+ msgList.getE01CTY());
					%>
				</td>
				<%
					String col1 = msgList.getD01ADF();
					String col2 = (msgList.getE01FL2().equals("A") ? "ACTIVO": "INACTIVO");
					col2 = col2 + (msgList.getE01FL1().equals("Y") ? " - PRINCIPAL" : "");
					if (msgList.getE01RTP().equals("V")) {
						col1 = (msgList.getE01FL2().equals("Y") ? "Obligatorio" : "Opcional");
						col2 = (msgList.getE01FL1().equals("A") ? "ACTIVO": "INACTIVO");
					}
					if (msgList.getE01RTP().equals("W")) {
						col1 = msgList.getD01UC2();
						col2 = msgList.getD01UC1();
					}
					if (msgList.getE01RTP().equals("2")
							|| msgList.getE01RTP().equals("3")
							|| msgList.getE01RTP().equals("4")
							|| msgList.getE01RTP().equals("5")
							|| msgList.getE01RTP().equals("7")
							|| msgList.getE01RTP().equals("P")
							|| msgList.getE01RTP().equals("F")
							|| msgList.getE01RTP().equals("C")) {
						col1 = col1.trim() + "-" + (msgList.getE01RTP().equals("F") ? msgList.getD01UC6() : msgList.getD01UC7());
						col2 = "ACTIVO";
					}
					if (msgList.getE01RTP().equals("9")) {
						col1 = (msgList.getE01UC9().equals("OTRO") ? "OTRO" : (msgList.getE01UC9().equals("INMU") ? "INMUEBLE" : "VEHICULO"));
						col2 = (msgList.getE01FL2().equals("A") ? "ACTIVO": "INACTIVO");
					}
				%>
				<td NOWRAP align="center" width="20%"><%=col1%></td>
				<td NOWRAP align="center" width="20%"><%=col2%></td>
				<td NOWRAP align="center" width="5%"
					style="color: red; font-size: 12;">
					<%
						if (msgList.getE01RTX().equals("*")) out.print("SI");
					%>
				</td>
			</TR>
			<%
				i++;
					}
			%>
		</TABLE>

		<TABLE class="tbenter" WIDTH="88%" ALIGN=CENTER>
			<TR>
				<TD WIDTH="50%" ALIGN=LEFT height="25">
					<%
						int screen = 1;
							if (userPO.getPurpose().equals("INQUIRY")) {
								screen = 8;
							}
							if (userPO.getPurpose().equals("APPROVAL")) {
								screen = 6;
							}
							if (ESD0086List.getShowPrev()) {
								int pos = ESD0086List.getFirstRec() - 21;
								out.print("<A HREF=\"" + request.getContextPath()
										+ "/servlet/datapro.eibs.client.JSESD0086?SCREEN="
										+ screen + "&RECTYP=" + userPO.getHeader10()
										+ "&FromRecord=" + pos + "\" > <img src=\""
										+ request.getContextPath()
										+ "/images/s/Regresar.gif\" border=0></A>");
							}
					%>
				</TD>
				<TD WIDTH="50%" ALIGN=RIGHT height="25">
					<%
						if (ESD0086List.getShowNext()) {
								int pos = ESD0086List.getLastRec();
								out.print("<A HREF=\"" + request.getContextPath()
										+ "/servlet/datapro.eibs.client.JSESD0086?SCREEN="
										+ screen + "&RECTYP=" + userPO.getHeader10()
										+ "&FromRecord=" + pos + "\" ><img src=\""
										+ request.getContextPath()
										+ "/images/s/Avanzar.gif\" border=0></A>");
							}
					%>
				</TD>
			</TR>
		</TABLE>

		<BR>
		<SCRIPT Language="javascript">
			document.forms[0].TOTROWS.value =
		<%=i%>
			;
			document.forms[0].NEXTROWS.value =
		<%=ESD0086List.getLastRec()%>
			;
			document.forms[0].CURRROWS.value =
		<%=ESD0086List.getFirstRec()%>
			;
		</SCRIPT>
		<%
			}
		%>
	</form>
</body>
</html>
