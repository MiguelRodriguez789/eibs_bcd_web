<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Aprobación de Pagos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0145List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

var ok = false;

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Por Favor Seleccione un Pago!!!");
		return;	 
	}
	var formLength= document.forms[0].elements.length;
	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementValue= document.forms[0].elements[n].value;
			if (document.forms[0].elements[n].checked == true) {
				bilnum = document.forms[0].elements[n+1].value;
    			var pg = "";				
				pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0160?SCREEN=7" + "&E01BPBNUM=" + bilnum;
 				CenterWindow(pg,900,600,2);
        		break;
			}
    }
}

function goApproval() {
	isCheck();
	if ( !ok ) {
		alert("Por Favor Seleccione un Pago!");
		return;	 
	}
	if (!confirm("Desea aprobar este pago?")) {
		return;
	}
	document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goApprovalAll() {
	if (!confirm("Confirma aprobar todos los Pagos de la Lista?")) {
		return;
	}
	document.getElementById("SCREEN").value="5";
	document.forms[0].submit();
}


function goReject() {
	isCheck();
	if ( !ok ) {
		alert("Por Favor Seleccione un Pago!");
		return;	 
	}
	if (!confirm("Desea rechazar este pago?")) {
		return;
	}
	document.getElementById("SCREEN").value="4";
	document.forms[0].submit();
} 

function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
			if (document.forms[0].elements[n].checked == true) {
				ok = true;		
        		break;
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

<h3 align="center">Aprobar Pagos de Facturas de
	<% 	if (userPO.getType().equals("C")) { 
			out.println(" Clientes "); 
	 	} else { 
	 		out.println(" Proveedores ");
		} 
	%>
	<% 	if (userPO.getHeader20().equals("M")) { 
			out.println(" - Varias Facturas en un Pago "); 
	 	} else {
	 		out.println(" - Pago por Factura ");
		} 
	%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="payment_approval_list.jsp, EBP0145"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0145">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">

  <INPUT TYPE=HIDDEN NAME="E01BPBNUM" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01BPBBIL" VALUE="">
  <INPUT TYPE=HIDDEN name="E01REQPYM" value="<%= userPO.getHeader20().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQVEN" value="<%= userPO.getHeader21().trim() %>">
  <INPUT TYPE=HIDDEN NAME="VIA" VALUE="">
  <INPUT TYPE=HIDDEN name="TOTROWS" value="0">
  <INPUT TYPE=HIDDEN name="NEXTROWS" value="0">
  <INPUT TYPE=HIDDEN name="CURRROWS" value="0">
    
<table  class="tbenter" width="100%">
	<tr bordercolor="#FFFFFF"> 
		<td nowrap> 
<%	 
	if ( EBP0145List.getNoResult() ) {
%>
	<TABLE class="tbenter" width="100%"> 
		<TR>
	  		<TD align="center" class="TDBKG" width="50%" nowrap><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
	  	    <TD align="center" class="TDBKG" width="50%" nowrap><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0145?SCREEN=1"><b>Regresar</b></a></TD>
		</TR>
	</TABLE>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      		<TD>         
      			<div align="center"> <h4 style="text-align:center">No hay pagos para aprobar.</h4> 
      			</div>
      		</TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
	<TABLE class="tbenter" width="100%"> 
		<TR>
			<TD align="CENTER" class="TDBKG" width="20%"><a href="javascript:goInquiry()"><b>Consultar<br>Factura</b></a></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><a href="javascript:goApproval()"><b>Aprobar</b></a></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><a href="javascript:goApprovalAll()"><b>Aprobar <BR>
				Todos</b></a></TD>
			<TD align="CENTER" class="TDBKG" width="20%"><a href="javascript:goReject()"><b>Rechazar</b></a></TD>
	  		<TD align="CENTER" class="TDBKG" width="20%"><a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0145?SCREEN=1"><b>Regresar</b></a></TD>
		</TR>
	</TABLE> 

  <TABLE class="tableinfo" id="dataTable" width="100%">
    <TR id=trdark> 
		<td nowrap align="center" width="2%"><B>Sel</B></td>
		<td nowrap align="center" width="5%"><B>Número<BR>Interno</B></td>
		<td nowrap align="center" width="5%"><B>Secuencia</B></td>
		<td nowrap align="center" width="5%"><B>Referencia<BR>Factura</B></td>
		<td nowrap align="center" width="8%"><B>Fecha<BR>de Pago</B></td>
		<td nowrap align="center" width="8%"><B>Documento<BR>Origen</B></td>
		<td nowrap align="center" width="7%"><B>Calificación<BR>Del Servicio</B></td>
		<td nowrap align="center" width="15%"><B>Nombre Proveedor</B></td>
		<td nowrap align="center" width="15%"><B>Descripción Factura</B></td>
		<td nowrap align="center" width="8%"><B>Monto<BR>Pago</B></td>
		<td nowrap align="center" width="8%"><B>Monto<BR>Comisión</B></td>
		<td nowrap align="center" width="5%"><B>Forma de<BR>Pago</B></td>
		<td nowrap align="center" width="9%"><B>Tipo de<BR>Factura</B></td>
	</TR>
    <TR id=trdark>
		<td nowrap align="center" width="2%"></td>
		<td nowrap align="center" width="5%"></td>
		<td nowrap align="center" width="5%"></td>
		<td nowrap align="center" width="5%"></td>
		<td nowrap align="center" width="8%"></td>
		<td nowrap align="center" width="8%"></td>
		<td nowrap align="center" width="7%"></td>
		<td nowrap align="center" width="15%"></td>
		<td nowrap align="center" width="15%"></td>
		<td nowrap align="center" width="8%"></td>
		<td nowrap align="center" width="8%"></td>
		<td nowrap align="center" width="5%"></td>
		<td nowrap align="center" width="9%"></td>

	</TR>
         <%
    	  int i = 0;
          EBP0145List.initRow();    
          while (EBP0145List.getNextRow()) {
            EBP014501Message msgList = (EBP014501Message) EBP0145List.getRecord();
		%>              
    <TR id=trclear>

		<td NOWRAP align="center" width="2%"> 
            <INPUT type="checkbox" name="E01ACT_<%= EBP0145List.getCurrentRow() %>" >
		</td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01BPPNUM() %>
			<INPUT TYPE=HIDDEN NAME="E01BPPNUM_<%= EBP0145List.getCurrentRow() %>" VALUE="<%= msgList.getE01BPPNUM() %>" size="10" maxlength="9">
			<a href="javascript:goInquiry()"></a>
		</td>
        <td NOWRAP align="center" width="5%" ><%= msgList.getE01BPPSEQ() %>
			<INPUT TYPE=HIDDEN NAME="E01BPPSEQ_<%= EBP0145List.getCurrentRow() %>" VALUE="<%= msgList.getE01BPPSEQ() %>">
        
		</td>    
		<td NOWRAP align="left" width="5%" ><%= msgList.getE01BPBBIL() %>
			<INPUT TYPE=HIDDEN NAME="E01BPBBIL_<%= EBP0145List.getCurrentRow() %>" VALUE="<%= msgList.getE01BPBBIL() %>">
		</td>
		<td NOWRAP align="center" width="8%" ><FONT color="green"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(), msgList.getE01BPPPDM(), msgList.getE01BPPPDD(), msgList.getE01BPPPDY())%>	</FONT>
		</td>
		<td NOWRAP align="center" width="8%" ><%= msgList.getE01BPPORD() %></td>
		<td NOWRAP align="center" width="7%" >
			<FONT color="red">
			<% if (msgList.getE01BPPSTS().equals("2")) {out.print("Sin Calificación");}%> 	
			</FONT>	
			<% if (msgList.getE01BPPSTS().equals("3")) {out.print("Calificado");}%> 	
		</td> 
		<td NOWRAP align="left" width="15%" ><%= msgList.getE01BPPVCN() %></td>
		<td NOWRAP align="left" width="15%" ><%= msgList.getE01BPBDSC() %></td>
		
		<td NOWRAP align="right" width="8%" ><FONT color="green"><%= msgList.getE01BPPAMT() %></FONT></td>
		<td NOWRAP align="right" width="8%" ><FONT color="green"><%= msgList.getE01BPPFEE() %></FONT></td>
		
		<td NOWRAP align="center" width="5%" >
			<FONT color="green">
		     <% if(msgList.getE01BPPPVI().equals("A")) out.print("ACH");%>
		     <% if(msgList.getE01BPPPVI().equals("R")) out.print("Cta. Corriente");%>
		     <% if(msgList.getE01BPPPVI().equals("G")) out.print("Cta. Contable");%>
		     <% if(msgList.getE01BPPPVI().equals("C")) out.print("Cheque");%>
		     <% if(msgList.getE01BPPPVI().equals("S")) out.print("Swift");%>
		     <% if(msgList.getE01BPPPVI().equals("F")) out.print("Transferencia");%>
		    </FONT> 
		</td>
		<td NOWRAP align="left" width="9%" ><%= msgList.getE01BPBTYPD() %></td>

	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  
<BR>

	<SCRIPT type="text/javascript">
		document.forms[0].TOTROWS.value = <%= i%>;
		document.forms[0].NEXTROWS.value = <%= EBP0145List.getLastRec()%>;
		document.forms[0].CURRROWS.value = <%= EBP0145List.getFirstRec()%>;
	</SCRIPT>
<%      
  }
%> 
		</TD>
	</TR>
</TABLE>
</form>
</body>
</html>
