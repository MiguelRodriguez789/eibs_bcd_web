<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Proveedores</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EBP0110List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;

function goSearch() {
	if (document.getElementById("SEARCHCDE").value == "0" || document.getElementById("SEARCHCDE").value == "") {
		alert("Por favor, elija un código o el código parcial para iniciar la lista!!!");
		return;	 
	}
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			document.getElementById("SCREEN").value="1";
	<% } else { %>
			document.getElementById("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	document.getElementById("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	document.getElementById("SCREEN").value="3";
	document.forms[0].submit();
}

function goDelete() {
	document.getElementById("SCREEN").value="4";
	if (!confirm("Esta seguro que desea borrar este registro?")) {
		return;
	}
	document.forms[0].submit();
} 

function stopRKey(evt) {
  var evt = (evt) ? evt : ((event) ? event : null);
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;}
}

document.onkeypress = stopRKey; 

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

<h3 align="center">Proveedores<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="vendors_list.jsp, EBP0110"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0110">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" id="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" id="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" id="CURRROWS" VALUE="0">
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goDelete()"><b>Borrar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

<%      
  } else {
%> 

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goProcess()"><b>Consulta</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( EBP0110List.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No hay Proveedores.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
 <TABLE  id="mainTable" class="tableinfo" height="70%">
 	<TR height="5%"> 
   		<TD NOWRAP valign="top" width="80%"> 
    		<TABLE id="headTable" width="100%">
    			<TR id="trdark">  
					<th NOWRAP align="center" ><B>Sel</B></th>
					<th NOWRAP align="center"><B>Código</B>
	                	<table border="0">
    					<tr id="trdark">
    					<td nowrap>
			    			<INPUT type="text" name="SEARCHCDE" id="SEARCHCDE" size="11" maxlength="10" value="<%= userPO.getProdCode() %>">
							<IMG src="<%=request.getContextPath()%>/images/ico5.gif" onclick="goSearch()" width="15" height="11" title="Order and position in...">
			    		</td>
						</tr>
    					</table>
   					</th>
					<th NOWRAP align="center" ><B>Nombre</B></th>
					<th nowrap align="center" ><B>Dirección</B></th>
					<th NOWRAP align="center" ><B>Número Tel.</B></th>
					<th NOWRAP align="center" ><B>País</B></th>
					<th NOWRAP align="center" ><B>Estado</B></th>
					<th nowrap align="center" ><B>Código Postal</B></th>
					<th nowrap align="center" ><B>Tipo</B></th>
					<th NOWRAP align="center" ><B>Forma de Pago<BR>
					por Omisión</B></th>
   			</TR>
       		</TABLE>
  		</TD>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:550px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         

         <%
    	  int i = 0;
          EBP0110List.initRow();    
		  boolean firstTime = true;
		  String chk = "";
          while (EBP0110List.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
            EBP011001Message msgList = (EBP011001Message) EBP0110List.getRecord();
		%>              
	<tr id="dataTable<%= msgList.getE01BPVCUN() %>">
		<td nowrap align="center" >
			<input type="radio" id="E01BPVCUN" name="E01BPVCUN" value="<%=msgList.getE01BPVCUN()%>" <%=chk%> class="highlight" 
			onClick="highlightRow('dataTable', <%= msgList.getE01BPVCUN() %>, this)"/>
		</td>
		<td NOWRAP align="center" ><%= msgList.getE01BPVCUN() %></td>
		<td NOWRAP align="left" ><%= msgList.getE01BPVNM1() %></td>
		<td NOWRAP align="left" ><%= msgList.getE01BPVNM3() %></td>
		<td NOWRAP align="center"  ><%= msgList.getE01BPVPH1() %></td>
		<td NOWRAP align="center" ><%= msgList.getE01BPVCNT() %></td>
		<td NOWRAP align="center"   ><%= msgList.getE01BPVSTE() %></td>
		<td NOWRAP align="center" ><%= msgList.getE01BPVZIP() %></td>
		<td NOWRAP align="center" ><%= msgList.getE01BPVTYP().equals("I")?"Internet":"Regular" %></td>
		<td NOWRAP align="center" ><%= msgList.getE01BPVPVD() %></td>
	</TR>
       <% 
       	 i++; 
        } 
       %> 
             </table>
             </div>
             </td>
             </tr>
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
		int screen = 6;
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1;
		} 
    	if ( EBP0110List.getShowPrev() ) {
  			int pos = EBP0110List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0110?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0110List.getShowNext()) {
  			int pos = EBP0110List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0110?SCREEN="+screen+"&FromRecord=" + pos + "&SEARCHCDE=" + userPO.getProdCode() + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	showChecked("CODE");
	document.getElementById("TOTROWS").value = <%= i%>;
	document.getElementById("NEXTROWS").value = <%= EBP0110List.getLastRec()%>;
	document.getElementById("CURRROWS").value = <%= EBP0110List.getFirstRec()%>;
	
    function tableresize() {
    	adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1,false);
      }
     tableresize();	
	window.onresize=tableresize;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
