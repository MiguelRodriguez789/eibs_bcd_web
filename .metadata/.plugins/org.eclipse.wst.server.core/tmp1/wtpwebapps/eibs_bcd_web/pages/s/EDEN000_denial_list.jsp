<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<head>
<title>Lista de Control</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EDEN000List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/mapstyler.js"></script>
<SCRIPT type="text/javascript">

var ok = false;
var nro = 0;

function goSearch(type) {
	nro = getElement("NROCON").value;
	getElement("SEARCHTYPE").value = type;
	if (type == 'C') {
		if (getElement("SEARCHCUN").value == "") {
			alert("Favor digitar un Código para posicionarse en la lista!!!");
			return;
		}
		getElement("SEARCHCDE").value = getElement("SEARCHCUN").value;
	}

	if (type == 'N') {
		if (getElement("SEARCHNME").value == "") {
			alert("Favor digitar un Nombre para posicionarse en la lista!!!");
			return;
		}
		getElement("SEARCHCDE").value = getElement("SEARCHNME").value;
	}

	if (type == 'W' || type == 'S' ) {
		if (getElement("SEARCHNME").value == "") {
			alert("Favor digitar las palabras de coincidencia para filtrar la lista!!!");
			return;
		}
		if (nro <= 0 ) {
			alert("Favor digitar el número de palabras de coincidencia para filtrar la lista!!!");
			return;
		}
		getElement("SEARCHCDE").value = getElement("SEARCHNME").value;
	}

	if (type == 'I') {
		if (getElement("SEARCHIDN").value == "") {
			alert("Favor digitar una Identificación para posicionarse en la lista!!!");
			return;
		}
		getElement("SEARCHCDE").value = getElement("SEARCHIDN").value;
	}
	
	getElement("SCREEN").value="1";
	document.forms[0].submit();
}

function goDetail() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un registro!!!");
		return;	 
	}
	CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN000?SCREEN=3&E01DCOUN=' + getElement("E01DCOUN").value + 
		         '&H01USR=<%=currUser.getH01USR().trim()%>',600,500,4);
}

function goPDF() {
  CenterWindow('<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN000?SCREEN=6&SEARCHCDE=<%=userPO.getHeader11().trim()%>' +
  				'&SEARCHTYPE=<%=userPO.getType().trim()%>&NROCON=<%=userPO.getHeader1().trim()%>',600,500,4);
}

function isCheck() { 
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				getElement("E01DCOUN").value = document.forms[0].elements[n].value;
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

<h3 align="center">Lista de Control - Consulta General<br>
	<% 	if (userPO.getType().equals("N")) { 
			out.println("Ordenada Alfabéticamente por Nombre");
		} else if (userPO.getType().equals("C")) { 
			out.println("Ordenada por Código (UID)");	
		} else if (userPO.getType().equals("I")) { 
			out.println("Ordenada por Identificación");	
		} else if (userPO.getType().equals("W")) { 
			out.println("Filtrada por Palabras que coinciden en el Nombre");		
		} else if (userPO.getType().equals("S")) { 
			out.println("Filtrada por Palabras que suenan como otras en el Nombre");		
		} else { out.println("Alfabética");
		} 
	%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="denial_list.jsp, EDEN000">
</h3>
<hr size="3">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="E01DCOUN" id="E01DCOUN" VALUE="">
  <INPUT TYPE="HIDDEN" name="SEARCHCDE" id="SEARCHCDE" value="<%= userPO.getHeader11() %>">
  <INPUT TYPE="HIDDEN" name="SEARCHTYPE" id="SEARCHTYPE" value="<%= userPO.getType() %>">
  
<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goDetail()"><b>Consultar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goPDF()"><b>Lista<br>en PDF</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<table  class="tableinfo" width="100%">
  
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="15%"><B>Código</B></td>
		<td NOWRAP align="center" width="60%">
			<B>Nombre</B><br>
			Mínimo Coincidencias :
			<INPUT type="text" name="NROCON" size="3" maxlength="2" value="<%= userPO.getHeader1() %>" onkeypress="enterInteger(event)">
			(Solo para busqueda por Palabras o Sonidos)
		</td>
		<TD nowrap align="center" width="20%"><B>Numero de<br>Identificación</B></TD>
		
	</TR>
    <TR id=trdark>
		<td NOWRAP align="center" width="5%"></td>
		<td NOWRAP align="left" width="15%">
			<INPUT type="text" name="SEARCHCUN" size="13" maxlength="12" value="<%= userPO.getCusNum() %>" onkeypress="enterInteger(event)">
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('C')" width="15" height="11" title="Ordenar y posicionarse en...">
		</td>
		<td NOWRAP align="left" width="60%">
			<INPUT type="text" name="SEARCHNME" size="60" maxlength="140" value="<%= userPO.getCusName() %>">
			Por Nombre <IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('N')" width="15" height="11" title="Ordenar y posicionarse en...">
			Por Palabra <IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('W')" width="15" height="11" title="Coincidan con Palabras...">
			Por Sonido <IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('S')" width="15" height="11" title="Suenan como...">
			
		</td>	 
		<TD nowrap align="left" width="20%">
			<INPUT type="text" name="SEARCHIDN" size="26" maxlength="25" value="<%= userPO.getIdentifier() %>">
			<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch('I')" width="15" height="11" title="Ordenar y posicionarse en...">
		</td>	 
	</TR>
  </table>	

<%
	if ( EDEN000List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay registros que coincidan con su busqueda.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    

<center>
  <div id="dataDiv1" class="scbarcolor"  style="overflow-Y:scroll;height:400"> 
    <table id="dataTable" cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
    <tr id="trclear">
		<td>
		<div id="content">
		<noscript><p><strong>Lo siento, esta pagina necesita JavaScript para funcionar</strong></p></noscript>
		<ul id="sitemap">
      <%
      	int records;
  			if (userPO.getType().equals("N") || userPO.getType().equals("C") )  {
				records = 200; 
    		} else {
    			records = 1000;
    		}
      	boolean firstName = true;
      	int i = 0;
      	EDEN000List.initRow();
      	
      	while (EDEN000List.getNextRow()) {
      		datapro.eibs.beans.EDEN000DSMessage msgList = (datapro.eibs.beans.EDEN000DSMessage) EDEN000List.getRecord();
      		// Level 1
      		if (msgList.getSWDTYR().trim().equals("H") || msgList.getSWDTYR().trim().equals("U")) {
      			if (!firstName) {
   					out.println("</ul>");
   					out.println("</li>");
   				}	 
      			firstName = false;
      %>
      				<li><a href="#">
      						<input type="radio" name="CODE" value="<%= msgList.getE01DCOUN() %>">
      					</a>
      						<%=msgList.getE01DCOUN()%> - 
      						<%=msgList.getE01DNAME()%> ( Identificación: 
      						<%=msgList.getE01DIDN()%>  
      						<%=msgList.getE01DTID()%> )
      						<% 	boolean font = false;
							if (msgList.getSWDCLS().startsWith("ALT",0)) {
								out.print("<B><FONT color=\"red\">");
								font = true;
				   			} 
							if (msgList.getSWDCLS().startsWith("MOD",0)) {
								out.print("<B><FONT color=\"green\">");
								font = true;
							}
							if (msgList.getSWDCLS().startsWith("BAJ",0)) {
								out.print("<B><FONT color=\"#474747\">");
								font = true;
				    		}
							if (msgList.getSWDCLS().trim().equals("")) {
								out.print("<B><FONT>");
								font = true;
				    		}
							%>
							<%= msgList.getSWDCLS()%>	 				 
							<% if (font) {out.print("</FONT></B>"); } %>
		  				
      				</li></ul>
      				<ul>	
      <%
       	    } 
       	    // Level 2
      		if (msgList.getSWDTYR().trim().equals("D") && !firstName ) {
      %>
      				<li><a href="#">
      						<input type="radio" name="CODE" value="<%= msgList.getE01DCOUN() %>">
      					</a>
      						<%=msgList.getE01DCOUN()%>
      						<%=msgList.getE01DNAME()%> ( Identificación: 
      						<%=msgList.getE01DIDN()%> 
      						<%=msgList.getE01DTID()%> )
      					
      				</li>	
       	    	<%
       	    }
       	 i++;   
      	}
      	if (!firstName) {
			out.println("</ul>");
			out.println("</li>");
			firstName = false;
      	}
      	%>
      	</ul>
		</div>
	</td>
		</tr>
	</table>

  </div>
</center>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
       	<% 
    	if ( EDEN000List.getShowPrev() ) {
  			int pos = EDEN000List.getFirstRec() - records;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN000?SCREEN=1&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "&NROCON=" + userPO.getHeader1() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      	</TD>
 	  	<TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EDEN000List.getShowNext()) {
  			int pos = EDEN000List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.ofac.JSEDEN000?SCREEN=1&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getHeader11() + "&SEARCHTYPE=" + userPO.getType() + "&NROCON=" + userPO.getHeader1() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  		</TD>
 	</TR>
 </TABLE>

  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDEN000List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDEN000List.getFirstRec()%>;
</SCRIPT>

<%      
  }
%> 
</form>
</body>

