<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Facturas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0130List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

var ok = false;

function goDetail() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione una Factura!");
		return;	 
	}
    document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goGl() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione una Factura!");
		return;	 
	}
    pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0136?SCREEN=1&DOCUMENTO=" + document.getElementById("E01BPBNUM").value;
    window.location.href=pg;
}

function goInquiry() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione una Factura!");
		return;	 
	}
    bilnum = document.getElementById("E01BPBNUM").value;
    var pg = "";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0130?SCREEN=7" + 
	        "&E01BPBNUM=" + bilnum;
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
		alert("Por Favor Seleccione un Factura para Aprobar!!!");
		return;	 
	}
	document.getElementById("E01ACT").value="A";
	document.getElementById("SCREEN").value="15";
	if (!confirm("Confirma Aprobar la Factura Seleccionada?")) {
		return;
	}
	document.forms[0].submit();
} 

function goReject() {
	isCheck();
	if ( !ok ) {
		alert("Por favor seleccione la factura a Rechazar!!!");
		return;	 
	}
	document.getElementById("E01ACT").value="R";
	document.getElementById("SCREEN").value="15";
	if (!confirm("Confirma Rechazar la Factura Seleccionada?")) {
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
			    document.getElementById("E01BPBNUM").value = document.forms[0].elements[n].value;
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
		 	out.println("Aprobar Facturas");
	   	} else {
	   		out.println("Facturas ");
	   	}
	
		if (userPO.getHeader1().equals("V")) { 
			out.println(" Proveedores "); 
		} 
		else if (userPO.getHeader1().equals("C")) {
		    out.println(" Clientes "); 
		}			  
		else { out.println(" - Con Documento Origen Obligación ");
		} 
	%>  
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="bills_list.jsp, EBP0130">
</h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0130">

  <INPUT TYPE=HIDDEN name="SCREEN" id="SCREEN" value="2"> 
  <INPUT TYPE=HIDDEN name="actRow" id="actRow" value="0">
  <INPUT TYPE=HIDDEN name="TOTROWS" id="TOTROWS" value="0">
  <INPUT TYPE=HIDDEN name="NEXTROWS" id="NEXTROWS" value="0">
  <INPUT TYPE=HIDDEN name="CURRROWS" id="CURRROWS" value="0">
  <INPUT TYPE=HIDDEN name="FromRecord" id="FromRecord" value="0"> 
  <INPUT TYPE=HIDDEN name="E01BPBNUM" id="E01BPBNUM" value="0"> 
  <INPUT TYPE=HIDDEN name="bilnum" id="bilnum" value="0"> 
  <INPUT TYPE=HIDDEN name="E01ACT"    id="E01ACT" value="N"> 
  <INPUT TYPE=HIDDEN name="E01REQTYP" id="E01REQTYP" value="<%= userPO.getHeader1().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQORD" id="E01REQORD" value="<%= userPO.getHeader2().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQSTS" id="E01REQSTS" value="<%= userPO.getHeader3().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQFRM" id="E01REQFRM" value="<%= userPO.getHeader4().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQPDM" id="E01REQPDM" value="<%= userPO.getHeader5().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQPDD" id="E01REQPDD" value="<%= userPO.getHeader6().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQPDY" id="E01REQPDY" value="<%= userPO.getHeader7().trim() %>">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" id="DOCUMENTO" VALUE="<%= userPO.getIdentifier().trim() %>">
  
<table  class="tbenter" width="100%">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 
<% if (!userPO.getPurpose().equals("APPROVAL")) {%>

<TABLE class="tbenter" width="100%"> 
	<TR>
		<TD align="right" width="34%"></TD>
		<TD align="right" width="33%"><B><U>Criterios de Búsqueda</U></B></TD>
	  	<TD align="CENTER" width="33%"></TD>	  	
	</TR>
	<TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Ordenadas Por :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader2().equals("N")) { 
				out.println("Número de Factura interna desde "  + userPO.getHeader4()); 
		       } else if (userPO.getHeader2().equals("C")) { 
				out.println("Proveedor/Cliente desde "  + userPO.getHeader4()); 
			   } else if (userPO.getHeader2().equals("D")) { 
				out.println("Fecha Desde " + datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), userPO.getHeader5(),userPO.getHeader6(),userPO.getHeader7()));
			   } else if (userPO.getHeader2().equals("B")) { 
				out.println("Referencia Factura desde " + userPO.getHeader4());  	
			   } else  { out.println("Orden de Compra desde " + userPO.getHeader4());
			   }%>  
		</TD>
	</TR>
    <TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Con Estado :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader3().equals("W")) { 
				out.println("Pendiente de Aprobación"); 
			   } else if (userPO.getHeader3().equals("A")) { 
				out.println("Activa (Aprobada)");
			   } else if (userPO.getHeader3().equals("R")) { 
				out.println("Rechazada"); 
			   } else if (userPO.getHeader3().equals("S")) { 
				out.println("Suspendida");  	
			   } %></TD>
	</TR>
</TABLE> 
<%} %>

<%	if (EBP0130List.getNoResult() ) { %>
<TABLE class="tbenter" width="100%">
		<%if  (userPO.getPurpose().equals("APPROVAL")) { %>
	<TR>
		<TD align="center" class="TDBKG" width="100%" nowrap><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
	</TR>
		<%} else {%>
	<TR>	
    	<TD align="center" class="TDBKG" width="50%" nowrap><a href="javascript:goNew()"><b>Crear</b></a></TD>
		<TD align="center" class="TDBKG" width="50%" nowrap><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0130?SCREEN=1"><b>Regresar</b></a></TD>
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
<INPUT TYPE=HIDDEN name="SCREEN" id="SCREEN" value="20">
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
    <TD align="CENTER" class="TDBKG" width="20%">
	  <a href="javascript:goNew()"><b>Crear</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
	  <a href="javascript:goInquiry()"><b>Consultar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
	  <a href="javascript:goDetail()"><b>Actualizar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
	  <a href="javascript:goGl()"><b>Contabilidad</b></a></TD>  
	<TD align="CENTER" class="TDBKG" width="20%">
	  <a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0130?SCREEN=1"><b>Regresar</b></a></TD>
  </TR>
</TABLE> 
<% } %>
<%	if (!EBP0130List.getNoResult() ) { %>    
  <TABLE class="tableinfo" id="dataTable" width="100%">
    <TR id=trdark> 
		<TD nowrap align="center" width="5%"><B>Sel</B></TD>
		<TD nowrap align="center" width="5%"><B>Número<BR>Interno</B></TD>
		<TD nowrap align="center" width="10%"><B>Referencia<BR>Factura</B></TD>
		<TD nowrap align="center" width="5%"><B>Fecha<BR>Factura</B></TD>
		<TD nowrap align="center" width="5%"><B>Fecha Venc.<BR>pago</B></TD>
		<TD nowrap align="center" width="5%"><B>Documento<BR>Origen</B></TD>
		<TD nowrap align="center" width="5%"><B>Código<BR>Número</B></TD>
		<TD nowrap align="center" width="20%"><B>Nombre</B></TD>
		<TD nowrap align="center" width="5%"><B>Monto</B></TD>
		<TD nowrap align="center" width="5%"><B>Forma de<BR>Pago</B></TD>
		<TD nowrap align="center" width="5%"><B>Estado</B></TD>
		<TD nowrap align="center" width="5%"><B>Tipo</B></TD>
	</TR>
 
        <%
    	  int i = 0;
          EBP0130List.initRow();    
          while (EBP0130List.getNextRow()) {
            EBP013001Message msgList = (EBP013001Message) EBP0130List.getRecord();	 
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01BPBNUM()%>">
			
		</td>
		
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPBNUM() %></td>
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01BPBBIL() %></td>
		<td NOWRAP align="center" width="5%" ><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), msgList.getE01BPBIVM(),msgList.getE01BPBIVD(),msgList.getE01BPBIVY())%></td>
		<td NOWRAP align="center" width="5%" ><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), msgList.getE01BPBPDM(),msgList.getE01BPBPDD(),msgList.getE01BPBPDY())%></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPBORD() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPBCOD() %></td>
		<td NOWRAP align="left" width="20%" ><%= msgList.getE01BPBVCN() %></td>
		<td NOWRAP align="right" width="10%" ><%= msgList.getE01BPBBAM() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPBPVD() %></td>
		<td NOWRAP align="left" width="5%" ><%= msgList.getE01BPBSTD() %></td>
		<td NOWRAP align="left" width="5%" ><%= msgList.getE01BPBTYPD() %></td>

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
    	if ( EBP0130List.getShowPrev() ) {
  			int pos = EBP0130List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0130?SCREEN="+screen+"&FromRecord=" + pos + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPDM=" + userPO.getHeader5() +
  			"&E01REQPDD=" + userPO.getHeader6() +
  			"&E01REQPDY=" + userPO.getHeader7() +
  			"\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0130List.getShowNext()) {
  			int pos = EBP0130List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0130?SCREEN="+screen+"&FromRecord=" + pos + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPDM=" + userPO.getHeader5() +
  			"&E01REQPDD=" + userPO.getHeader6() +
  			"&E01REQPDY=" + userPO.getHeader7() +
  			"\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
      </TD>
     </TR>
 </TABLE>
  
<BR>

<SCRIPT type="text/javascript">
	document.getElementById("TOTROWS").value = <%= i%>;
	document.getElementById("NEXTROWS").value = <%= EBP0130List.getLastRec()%>;
	document.getElementById("CURRROWS").value = <%= EBP0130List.getFirstRec()%>;
</SCRIPT>
<%} %>   
		</TD>
	</TR>
</TABLE>
</form>
</body>
</html>
