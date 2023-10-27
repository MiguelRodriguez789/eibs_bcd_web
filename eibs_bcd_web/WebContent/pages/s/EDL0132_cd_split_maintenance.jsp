<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.beans.*" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>

<title>Fraccionamiento de CDs</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="mainDeal" class="datapro.eibs.beans.EDL013201Message"  scope="session" />
<jsp:useBean id= "frList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT Language="javascript">
<%
	String type = userPO.getOption().equals("12")?"12":"11";
    String labeltxt = userPO.getOption().equals("12")?"Bono":"Certificado";
    String addurl = userPO.getOption().equals("12")?"&AppCode=12":"";
%>
var ok = false;
 
function goNew() {
	document.forms[0].SCREEN.value="3";
	document.forms[0].submit();
}

function goProcess(s) {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar una fracción!!!");
		return;	 
	}
	document.forms[0].SCREEN.value= s;
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione la fracción a borrar!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="4";
	if (!confirm("Desea borrar esta Fracción?")) {
		return;
	}
	document.forms[0].submit();
} 

function goInquiry(acc) {
	var pg = "";
  	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0130I?SCREEN=600&E01DEAACC=" + acc;
	CenterWindow(pg,600,500,2);
}

function goAprobar() {
	document.forms[0].SCREEN.value="9";
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

function setKey(num) {
	getElement("E13FRCACC").value = num;
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

<h3 align="center">Fraccionamiento para el <%=labeltxt %> Número <%= userPO.getIdentifier().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="cd_split_maintenance.jsp, EDL0132"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0132">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE="HIDDEN" name="E01DEAACC" value="<%= userPO.getIdentifier().trim() %>">
  <INPUT TYPE=HIDDEN NAME="E13FRCACC" VALUE="0">

<TABLE class="tableinfo" id="dataTable">
	<TR id=trclear>
		<TD align="right" width="25%"><b>Cliente : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01DEACUN().trim()%></TD>
		<TD align="right" width="25%"><b>Nombre : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01CUSNA1().trim()%></TD>	  	
	</TR>
	<TR id=trclear>
		<TD align="right" width="25%"><b>Moneda : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01DEACCY().trim()%></TD>
		<TD align="right" width="25%"><b>Producto : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01DEAPRO().trim()%></TD>	  	
	</TR>
	<TR id=trclear>
		<TD align="right" width="25%"><b>Saldo Capital : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01DEAMEP().trim()%></TD>
		<TD align="right" width="25%"><b>Saldo Interes : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01DEAMEI().trim()%></TD>	  	
	</TR>
    <TR id=trclear>
		<TD align="right" width="25%"><b>Fecha Apertura : </b></TD>
		<TD align="left" width="25%"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
																					 mainDeal.getBigDecimalE01DEAODM().intValue(),
																					 mainDeal.getBigDecimalE01DEAODD().intValue(),
																					 mainDeal.getBigDecimalE01DEAODY().intValue())%>
		</TD>
		<TD align="right" width="25%"><b>Fecha de Vencimiento : </b></TD>
		<TD align="left" width="25%"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
																					 mainDeal.getBigDecimalE01DEAMDM().intValue(),
																					 mainDeal.getBigDecimalE01DEAMDD().intValue(),
																					 mainDeal.getBigDecimalE01DEAMDY().intValue())%>
		</TD>	  	
	</TR>
	
	<!--
	<TR id=trclear>
		<TD align="right" width="25%"><b>Tasa Nominal : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01RATE().trim()%></TD>
		<TD align="right" width="25%"><b>Tasa Efectiva : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01DEASPR().trim()%></TD>	  	
	</TR>
	-->
	
	<TR id=trclear>
		<TD align="right" width="25%"><b>Capital Fraccionado : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01OFFAM1().trim()%></TD>
		<TD align="right" width="25%"><b>Interes Fraccionado : </b></TD>
		<TD align="left" width="25%"><%= mainDeal.getE01OFFAM2().trim()%></TD>	  	
	</TR>
	<TR id=trclear>
		<TD align="right" width="25%"><b>Saldo Capital por Fraccionar : </b></TD>
		<TD align="left" width="25%">
			<%String dispC = mainDeal.getBigDecimalE01DEAMEP().subtract(mainDeal.getBigDecimalE01OFFAM1()).toString();%>
			<%=Util.formatCCY(dispC)%>
		</TD>
		<TD align="right" width="25%"><b>Saldo de Interes por Fraccionar : </b></TD>
		<TD align="left" width="25%">
			<%String dispI = mainDeal.getBigDecimalE01DEAMEI().subtract(mainDeal.getBigDecimalE01OFFAM2()).toString();%>
			<%=Util.formatCCY(dispI)%>
		</TD>	  	
	</TR>
		<TR id=trclear>
		<TD align="right" width="25%"><b>Estado del Fraccionamiento : </b></TD>
		<TD align="left" width="25%">
			<% if (mainDeal.getE01FLGTYP().equals("N")) out.print("<B><FONT color=\"white\">  </FONT></B>");%>
			<% if (mainDeal.getE01FLGTYP().equals("R")) out.print("<B><FONT color=\"red\"> Total Fraccionado No Coincide con "+labeltxt+" Origen </FONT></B>");%>
			<% if (mainDeal.getE01FLGTYP().equals("W")) out.print("<B><FONT color=\"orange\"> Fraccionamiento Pendiente de Envio a Aprobación </FONT></B>");%>
			<% if (mainDeal.getE01FLGTYP().equals("A")) out.print("<B><FONT color=\"green\"> Fraccionamiento Enviado a Aprobación </FONT></B>");%>
		</TD>
		<TD align="right" width="25%"><b>Ultima Fecha de Pago Interes : </b></TD>
		<TD align="left" width="25%">
		<%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
									mainDeal.getBigDecimalE01NEWMDM().intValue(),
									mainDeal.getBigDecimalE01NEWMDD().intValue(),
									mainDeal.getBigDecimalE01NEWMDY().intValue())%>
		</TD>	  	
	</TR>
	
</TABLE> 



<TABLE class="tbenter"> 
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
	<TR>
		<TD align="CENTER" class="TDBKG" width="17%">
			<a href="javascript:goNew()"><b>Crear<br>Fracción</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="17%">
			<a href="javascript:goProcess(5)"><b>Modificar<br>Fracción</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="17%">
			<a href="javascript:goDelete()"><b>Borrar<br>Fracción</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="17%">
			<a href="javascript:goAprobar()"><b>Enviar a<br>Aprobación</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="17%">
			<a href="javascript:goInquiry(<%= userPO.getIdentifier().trim() %>)"><b>Consultar <%=labeltxt %><br>Origen</b></a>
		</TD>
		
	  	<TD align="CENTER" class="TDBKG" width="15%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0132?SCREEN=1"><b>Salir</b></a>
	  	</TD>
	</TR>
<%	} else { %>
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess(15)"><b>Ver <br>Fracción</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0132?SCREEN=1<%=addurl %>"><b>Salir</b></a>
      	</TD>
	</TR>
<% 	} %>
</TABLE> 
 
<%	if ( frList.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay Fracciones para este <%=labeltxt %>.</h4></div>
      </TD>
	</TR>
   	</TABLE>
<%
	}
	else {
		String warnImg= "";
		String warnFlag= "";
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="10%"><B>Número</B></td>
		<TD nowrap align="center" width="10%"><B>Código<br>Cliente</B></TD>
		<td NOWRAP align="center" width="35%"><B>Nombre</B></td>
		<td NOWRAP align="center" width="20%"><B>Monto<br>Capital</B></td>
		<td nowrap align="center" width="20%"><B>Monto<br>Intereses</B></td>
	</TR>
 
        <%
    	  int i = 0;
          frList.initRow();    
          while (frList.getNextRow()) {
            EDL013213Message msgList = (EDL013213Message) frList.getRecord();	
			if (msgList.getH13FLGWK2().trim().equals("W")) {
				warnImg= "<IMG border=\"0\" src=\"../images/warning01.gif\" ALT=\"Advertencias\" onClick=\"showWarnings('" + msgList.getE13FRCACC() + "','ROW')\">";
				warnFlag = msgList.getH13FLGWK2().trim();
			} else {
				warnImg= "";
			}
			
         %>              
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= frList.getCurrentRow()%>" onClick="setKey('<%=msgList.getE13FRCACC()%>')">
			<%=warnImg%>
		</td>
		
		<td NOWRAP align="left" width="10%" ><%= msgList.getE13FRCACC() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE13FRCCUN() %></td>
		<td NOWRAP align="left" width="35%" ><%= msgList.getE13FRCNA1() %></td>
		<td NOWRAP align="right" width="20%" ><%= msgList.getE13FRCAMT() %></td>
		<td NOWRAP align="right" width="20%" ><%= msgList.getE13FRCMEI() %></td>
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
    	if ( frList.getShowPrev() ) {
  			int pos = frList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL013?SCREEN=2&E01DEAACC=" + userPO.getIdentifier() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (frList.getShowNext()) {
  			int pos = frList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSEDL013?SCREEN=2&E01DEAACC=" + userPO.getIdentifier() + "&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= frList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= frList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
