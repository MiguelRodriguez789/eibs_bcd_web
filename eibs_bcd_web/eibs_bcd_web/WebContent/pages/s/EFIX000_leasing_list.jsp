<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Lista de Activos Fijos de un Leasing</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		if(userPO.getSource().equals("A")) {
%>
			builtNewMenu(ln_lea_m_opt);
			initMenu();
<% 		} else { %>
			builtNewMenu(ln_m_opt);
			initMenu();
<% 
		} 
%>
<% } %>
   
function checkClick(box) {
	if (box.checked) {
		document.forms[0].FIXNUM.value = box.value;
	} else {
		document.forms[0].FIXNUM.value = "0";
	}
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(var n=0; n<formLength; n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "E01ACT") {
			if (document.forms[0].elements[n].checked 
					&& document.forms[0].elements[n].value != box.value) {
				document.forms[0].elements[n].checked = false;
			}
      	}
    }
}

function showFixAsset(bnk, brn, asn) {
	var pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000?SCREEN=1110&E01FIXBNK=" + bnk + "&E01FIXBRN=" + brn + "&E01FIXASN=" +asn + "&MAINT=Y";
 	CenterWindow(pg, 900, 600, 2);
}

function goAction(op) {
	var acc = "";
	if (op == 4) {
		document.forms[0].ACTION.value = "DEL";
	} else if (op == 5) {
		document.forms[0].FIXNUM.value = "0";
		document.forms[0].ACTION.value = "LIST";
	} else if (op == 6) {
		document.forms[0].FIXNUM.value = document.forms[0].E01FIXASN.value;
		document.forms[0].ACTION.value = "ADD";
	}
	document.forms[0].submit();
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


<h3 align="center">Lista de activos Fijos Asignados al Prestamo <% userPO.getAccNum(); %> <%= userPO.getIdentifier().trim() %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="leasing_list.jsp, EFIX000"></h3>
<hr size="4">



<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.amort.JSEFIX000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1300">
  <INPUT TYPE=HIDDEN NAME="FIXNUM" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="">
  
    <INPUT TYPE=HIDDEN name="actRow" id="actRow" value="0">
  <INPUT TYPE=HIDDEN name="TOTROWS" id="TOTROWS" value="0">
  <INPUT TYPE=HIDDEN name="NEXTROWS" id="NEXTROWS" value="0">
  <INPUT TYPE=HIDDEN name="CURRROWS" id="CURRROWS" value="0">
  <INPUT TYPE=HIDDEN name="FromRecord" id="FromRecord" value="0"> 
  <INPUT TYPE=HIDDEN name="docnum" id="docnum" value="0"> 
  <INPUT TYPE=HIDDEN name="E01ACT"    id="E01ACT" value="N"> 
  <INPUT TYPE=HIDDEN name="PURPOSE"   id="PURPOSE" value="<%= userPO.getPurpose().trim() %>">

  
<table  class="tbenter" width="100%">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
<TABLE class="tbenter" width="100%"> 
  <TR>
  <TD align="CENTER"  width="20%">
	Numero de Activo Fijo
	<input type="text" name="E01FIXASN" size="13" maxlength="12" >
	<a href="javascript:GetAmortID('E01FIXASN','01',' ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a>
	</TD>
    <TD align="CENTER" class="TDBKG" width="20%">
	  <a href="javascript:goAction(6)"><b>Adicionar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
	  <a href="javascript:goAction(4)"><b>Borrar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
	  <a href="javascript:goAction(5)"><b>Actualizar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="20%">
	  <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></TD>
  </TR>
</TABLE> 


<%      
  }
%> 

<%	if (!List.getNoResult() ) { %>    
   <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
    <% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){ %>
		<td NOWRAP align="center" width="10%"><B>Sel</B></td>
	<% } %>
		<td NOWRAP align="center" width="10%"><B>Operacion</B></td>
		<td NOWRAP align="center" width="10%"><B>Banco</B></td>
		<td NOWRAP align="center" width="10%"><B>Banco</B></td>
		<td NOWRAP align="center" width="10%"><B>Sucursal</B></td>
		<td NOWRAP align="center" width="10%"><B>Activo Fijo</B></td>
		<TD nowrap align="center" width="10%"><B>Marca</B></TD>
		<TD nowrap align="center" width="10%"><B>Modelo</B></TD>
		<TD nowrap align="center" width="10%"><B>Estado</B></TD>
		<TD nowrap align="center" width="10%"><B>Clase</B></TD>
		<TD nowrap align="center" width="10%"><B>Localizacion</B></TD>
	</TR>


        <%
    	  int i = 0;
          List.initRow();    
          while (List.getNextRow()) {
            EFIX00001Message msgList = (EFIX00001Message) List.getRecord();	
			
         %>   
                    
    <TR id=trclear>
    <% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){ %>
		<td NOWRAP align="center" width="10%">
			<INPUT type="checkbox" name="E01ACT" onClick="checkClick(this)" value='<%= msgList.getE01FIXASN().trim() %>' > 
		</td>
	<% } %>
		<td NOWRAP align="center" width="10%" >
			<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')">
			<%  if (msgList.getE01FIXOPE().trim().equals("10")) out.print("Vincular"); else  if (msgList.getE01FIXOPE().trim().equals("20")) out.print("Desvincular"); 
				else  out.print("Vinculado"); %> </A>
		</td>
	
		<td NOWRAP align="center" width="10%" >
		<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')"><%= msgList.getE01FIXBNK() %></A>
			
		</td>
		<td NOWRAP align="center" width="10%" >
			<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')"><%= msgList.getE01FIXBRN() %></A>
		</td>
		<td NOWRAP align="center" width="10%" >
			<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')"><%= msgList.getE01FIXASN() %></A>
		</td>
		<td NOWRAP align="center" width="10%" >
			<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')"><%= msgList.getE01FIXMAR() %></A>
		</td>
		<td NOWRAP align="center" width="10%" >
			<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')"><%= msgList.getE01FIXMOD() %></A>
		</td>
		<td NOWRAP align="center" width="10%" >
			<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')"><%= msgList.getE01FIXTYP() %></A>
		</td>
		<td NOWRAP align="center" width="10%" >
			<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')"><%= msgList.getE01FIXCLS() %></A>
		</td>
		<td NOWRAP align="center" width="10%" >
			<A HREF="javascript:showFixAsset('<%= msgList.getE01FIXBNK().trim() %>','<%= msgList.getE01FIXBRN().trim() %>','<%= msgList.getE01FIXASN().trim() %>')"><%= msgList.getE01FIXLOC() %></A>
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
		if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
			screen = 1300;
		}
		%>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
		<% 
    	if ( List.getShowPrev() ) {
  			int pos = List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.amort.JSEFIX000?SCREEN="+screen+"&FromRecord=" + pos + 
  			"\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (List.getShowNext()) {
  			int pos = List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.amort.JSEFIX000?SCREEN="+screen+"&FromRecord=" + pos + 
  			"\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
      </TD>
     </TR>
 </TABLE>
  
<BR>

<SCRIPT type="text/javascript">
	document.getElementById("TOTROWS").value = <%= i%>;
	document.getElementById("NEXTROWS").value = <%= List.getLastRec()%>;
	document.getElementById("CURRROWS").value = <%= List.getFirstRec()%>;
</SCRIPT>
<%} %>   
		</TD>
	</TR>
</TABLE>
</form>
</body>
</html>