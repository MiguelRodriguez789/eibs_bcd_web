<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Surce Documents</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0120List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

var ok = false;

function goUpdate() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione un Documento Origen Obligación!");
		return;	 
	}
    document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goDetail() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione un Documento Origen Obligación!");
		return;	 
	}
    pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0124?SCREEN=1&DOCUMENTO=" + document.getElementById("E01BDCNUM").value;
    window.location.href=pg;
}

function goGL() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione un Documento Origen Obligación!");
		return;	 
	}
    pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0126?SCREEN=1&DOCUMENTO=" + document.getElementById("E01BDCNUM").value;
    window.location.href=pg;
}

function goPymentP() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione un Documento Origen Obligación!");
		return;	 
	}
    pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0128?SCREEN=1&DOCUMENTO=" + document.getElementById("E01BDCNUM").value;
    window.location.href=pg;
}

function goInquiry() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione un Documento Origen Obligación!");
		return;	 
	}
    docnum = document.getElementById("E01BDCNUM").value;
    var pg = "";
    
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0120?SCREEN=7" + 
	        "&E01BDCNUM=" + docnum;

	CenterWindow(pg,900,600,2);
}

function goNew() {
    document.getElementById("E01ACT").value="N";
	document.getElementById("SCREEN").value="5";
	document.forms[0].submit();
}

function goApproval() {
	isCheck();
	if ( !ok ) {
		alert("Por favor seleccione el Documento Origen Obligación a aprobar!!!");
		return;	 
	}
	document.getElementById("E01ACT").value="A";
	document.getElementById("SCREEN").value="15";
	if (!confirm("Confirme Aprobar el Documento Origen Obligación Seleccionado:")) {
		return;
	}
	document.forms[0].submit();
} 

function goReject() {
	isCheck();
	if ( !ok ) {
		alert("Seleccione el Documento Origen Obligación para rechazar");
		return;	 
	}
	document.getElementById("E01ACT").value="R";
	document.getElementById("SCREEN").value="15";
	if (!confirm("Confirme Rechazar el Documento Origen Obligación Seleccionado")) {
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
			    document.getElementById("E01BDCNUM").value = document.forms[0].elements[n].value;
				ok = true;
				break;
			}
      	}
    }
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


<h3 align="center">
	<% 	
	 	if (userPO.getPurpose().equals("APPROVAL")) {
		 	out.println("Aprobar Documentos Origen Obligación");
	   	} else {
	   		out.println("Documentos Origen Obligación ");
	   	}
	
		if (userPO.getHeader1().equals("C")) { 
			out.println("Cliente "); 
	 	} else { 
	 		out.println("Proveedores ");
		} 
	%>
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="source_document_list.jsp, EBP0120">
</h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0120">

  <INPUT TYPE=HIDDEN name="SCREEN" id="SCREEN" value="2"> 
  <INPUT TYPE=HIDDEN name="actRow" id="actRow" value="0">
  <INPUT TYPE=HIDDEN name="TOTROWS" id="TOTROWS" value="0">
  <INPUT TYPE=HIDDEN name="NEXTROWS" id="NEXTROWS" value="0">
  <INPUT TYPE=HIDDEN name="CURRROWS" id="CURRROWS" value="0">
  <INPUT TYPE=HIDDEN name="FromRecord" id="FromRecord" value="0"> 
  <INPUT TYPE=HIDDEN name="E01BDCNUM" id="E01BDCNUM" value="0"> 
  <INPUT TYPE=HIDDEN name="docnum" id="docnum" value="0"> 
  <INPUT TYPE=HIDDEN name="E01ACT"    id="E01ACT" value="N"> 
  <INPUT TYPE=HIDDEN name="E01REQTYP" id="E01REQTYP" value="<%= userPO.getHeader1().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQORD" id="E01REQORD" value="<%= userPO.getHeader2().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQSTS" id="E01REQSTS" value="<%= userPO.getHeader3().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQFRM" id="E01REQFRM" value="<%= userPO.getHeader4().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQPD1" id="E01REQPD1" value="<%= userPO.getHeader5().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQPD2" id="E01REQPD2" value="<%= userPO.getHeader6().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQPD3" id="E01REQPD3" value="<%= userPO.getHeader7().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQKIN" id="E01REQKIN" value="<%= userPO.getHeader8().trim() %>">
  <INPUT TYPE=HIDDEN name="PURPOSE"   id="PURPOSE" value="<%= userPO.getPurpose().trim() %>">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" id="DOCUMENTO" VALUE="<%= userPO.getIdentifier().trim() %>">
  
<table  class="tbenter" width="100%">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
<% if (!userPO.getPurpose().equals("APPROVAL")) {%>

<TABLE class="tbenter" width="100%"> 
	<TR>
		<TD align="right" width="34%"></TD>
		<TD align="right" width="33%"><B><U>Criterio de Búsqueda</U></B></TD>
	  	<TD align="CENTER" width="33%"></TD>	  	
	</TR>
	<TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Orden Por :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader2().equals("N")) { 
				out.println("Número Interno de Documento desde "  + userPO.getHeader4()); 
		       } else if (userPO.getHeader2().equals("V")) { 
				out.println("Proveedor desde "  + userPO.getHeader4()); 
			   } else if (userPO.getHeader2().equals("D")) { 
				out.println("Fecha Desde " + datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), userPO.getHeader5(),userPO.getHeader6(),userPO.getHeader7()));
			   } else if (userPO.getHeader2().equals("B")) { 
				out.println("Documento Referencia desde " + userPO.getHeader4());  	
			   } else  { out.println("Documento desde " + userPO.getHeader4());
			   }%>  
		</TD>
	</TR>
    <TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Con Estado :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader3().equals("W")) { 
				out.println("Pendiente Aprobación"); 
			   } else if (userPO.getHeader3().equals("A")) { 
				out.println("Activo (Aprobado)");
			   } else if (userPO.getHeader3().equals("R")) { 
				out.println("Rechazado"); 
			   } else if (userPO.getHeader3().equals("S")) { 
				out.println("Suspendida");  	
			   } %></TD>
	</TR>
</TABLE> 
<%} %>

<%	if (EBP0120List.getNoResult() ) { %>
<TABLE class="tbenter" width="100%">
		<%if  (userPO.getPurpose().equals("APPROVAL")) { %>
	<TR>
		<TD align="center" class="TDBKG" width="100%" nowrap><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
	</TR>
		<%} else {%>
	<TR>	
    	<TD align="center" class="TDBKG" width="50%" nowrap><a href="javascript:goNew()"><b>Crear</b></a></TD>
		<TD align="center" class="TDBKG" width="50%" nowrap><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0120?SCREEN=1"><b>Regresar a<BR>Búsqueda</b></a></TD>
		<%} %>	
	</TR>	
</table>
<TABLE class="tbenter" width="100%">
	<tr valign="middle">
		<TD align="center" height="100" nowrap valign="middle" width="100%"> 
			<H4 style="text-align:center">No hay resultados para su criterio de búsqueda.</H4>
		</TD>
	</tr>
</TABLE>
<%
	} else  if  (userPO.getPurpose().equals("APPROVAL")) {
%>
<INPUT TYPE=HIDDEN name="SCREEN" value="20">
<TABLE class="tbenter" width="100%"> 
  <TR>
    <TD align="CENTER" class="TDBKG" width="25%">
	  <a href="javascript:goInquiry()"><b>Consultar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="25%">
	  <a href="javascript:goApproval()"><b>Aprobar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="25%">
	  <a href="javascript:goReject()"><b>Rechazar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="25%">
	  <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
  </TR>
</TABLE> 
<%
	} else {
%>
   
<TABLE class="tbenter" width="100%"> 
  <TR>
    <TD align="CENTER" class="TDBKG" width="15%">
	  <a href="javascript:goNew()"><b>Crear</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="15%">
	  <a href="javascript:goInquiry()"><b>Consultar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="15%">
	  <a href="javascript:goUpdate()"><b>Actualizar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="15%">
	  <a href="javascript:goDetail()"><b>Lineas <BR>
				Detalle</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="15%">
	  <a href="javascript:goGL()"><b>Contabilidad</b></a></TD>  
	<TD align="CENTER" class="TDBKG" width="15%">
	  <a href="javascript:goPymentP()"><b>Plan Pagos</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="10%">
	  <a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0120?SCREEN=1"><b>Regresar a<BR>Búsqueda</b></a></TD>
  </TR>
</TABLE> 
<% } %>
<%	if (!EBP0120List.getNoResult() ) { %>    
  <TABLE class="tableinfo" id="dataTable" width="100%">
    <TR id=trdark> 
		<TD nowrap align="center" width="5%"><B>Sel</B></TD>
		<TD nowrap align="center" width="10%"><B>Número<BR>Interno</B></TD>
		<TD nowrap align="center" width="10%"><B>Referencia<BR>Documento</B></TD>
		<TD nowrap align="center" width="10%"><B>Fecha<BR>Documento</B></TD>
		<TD nowrap align="center" width="10%"><B>Fecha <BR>
				Vencimiento</B></TD>
		<TD nowrap align="center" width="10%"><B>Tipo<BR>Documento</B></TD>
		<TD nowrap align="center" width="10%"><B>Código<BR>Proveedor</B></TD>
		<TD nowrap align="center" width="25%"><B>Nombre Proveedor</B></TD>
		<TD nowrap align="center" width="10%"><B>Estatus</B></TD>
		<TD nowrap align="center" width="10%"><B>Errores en</B></TD>
	</TR>
 
        <%
    	  int i = 0;
          EBP0120List.initRow();    
          while (EBP0120List.getNextRow()) {
            EBP012001Message msgList = (EBP012001Message) EBP0120List.getRecord();	 
         %>   

    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01BDCNUM()%>">
		</td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BDCNUM() %></td>
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01BDCREF() %></td>
		<td NOWRAP align="center" width="10%" ><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), msgList.getE01BDCDD1(),msgList.getE01BDCDD2(),msgList.getE01BDCDD3())%></td>
		<td NOWRAP align="center" width="10%" ><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), msgList.getE01BDCPD1(),msgList.getE01BDCPD2(),msgList.getE01BDCPD3())%></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDCKIND() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDCCOD() %></td>
		<td NOWRAP align="left" width="25%" ><%= msgList.getE01BDCVEND() %></td>
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01BDCSTSD() %></td>
		<td NOWRAP align="center" width="5%" >
				<FONT color="red">
			<% if (msgList.getE01BDCSTS().equals("1")) {out.print("Lineas, Contabilidad, Pagos");}%> 		
		    <% if (msgList.getE01BDCSTS().equals("2")) {out.print("Lineas, Pagos");}%> 
		    <% if (msgList.getE01BDCSTS().equals("3")) {out.print("Lineas");}%>
		    <% if (msgList.getE01BDCSTS().equals("4")) {out.print("Lineas, Contabilidad");}%>
		    <% if (msgList.getE01BDCSTS().equals("5")) {out.print("Contabilidad");}%>
		    <% if (msgList.getE01BDCSTS().equals("6")) {out.print("Contabilidad, Pagos");}%>
		    <% if (msgList.getE01BDCSTS().equals("7")) {out.print("Pagos");}%>
				</FONT>
		    <% if (msgList.getE01BDCSTS().equals("8")) {out.print("Sin Errores");}%>
		</td>
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE> 

  <TABLE  class="tbenter" WIDTH="100%" ALIGN=CENTER>
   	 <TR>
       <%
       	int screen = 2;
		if (userPO.getPurpose().equals("APPROVAL")){
			screen = 20;
		}
		%>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
		<% 
    	if ( EBP0120List.getShowPrev() ) {
  			int pos = EBP0120List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0120?SCREEN="+screen+"&FromRecord=" + pos + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPD1=" + userPO.getHeader5() +
  			"&E01REQPD2=" + userPO.getHeader6() +
  			"&E01REQPD3=" + userPO.getHeader7() +
  			"&E01REQKIN=" + userPO.getHeader8() +  			
  			"\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0120List.getShowNext()) {
  			int pos = EBP0120List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0120?SCREEN="+screen+"&FromRecord=" + pos + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPD1=" + userPO.getHeader5() +
  			"&E01REQPD2=" + userPO.getHeader6() +
  			"&E01REQPD3=" + userPO.getHeader7() +
  			"&E01REQKIN=" + userPO.getHeader8() +  			  			
  			"\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
      </TD>
     </TR>
 </TABLE>
  
<BR>

<SCRIPT type="text/javascript">
	document.getElementById("TOTROWS").value = <%= i%>;
	document.getElementById("NEXTROWS").value = <%= EBP0120List.getLastRec()%>;
	document.getElementById("CURRROWS").value = <%= EBP0120List.getFirstRec()%>;
</SCRIPT>
<%} %>   
		</TD>
	</TR>
</TABLE>
</form>
</body>
</html>
