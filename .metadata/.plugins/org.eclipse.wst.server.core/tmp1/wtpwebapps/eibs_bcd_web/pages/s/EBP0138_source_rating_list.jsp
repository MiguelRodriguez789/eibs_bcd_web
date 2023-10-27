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
<jsp:useBean id= "EBP0138List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

var ok = false;

function goInquiry() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione un Documento Origen Obligación!");
		return;	 
	}
    var pg = "";
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0120?SCREEN=7" + 
	        "&E01BDCNUM=" + document.getElementById("E01BDCNUM").value;
	CenterWindow(pg,900,600,2);
}

function goRating() {
	isCheck();
	if (!ok) {
		alert("Por Favor Seleccione un Documento Origen Obligación!");
		return;	 
	}
    docnum = document.getElementById("E01BDCNUM").value;
    document.getElementById("E01ACT").value="N";
	document.getElementById("SCREEN").value="5";

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
	Calificar Sevicio
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="source_rating_list.jsp, EBP0138">
</h3>

<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0138">

  <INPUT TYPE=HIDDEN name="SCREEN" value="2"> 
  <INPUT TYPE=HIDDEN name="actRow" value="0">
  <INPUT TYPE=HIDDEN name="TOTROWS" value="0">
  <INPUT TYPE=HIDDEN name="NEXTROWS" value="0">
  <INPUT TYPE=HIDDEN name="CURRROWS" value="0">
  <INPUT TYPE=HIDDEN name="FromRecord" value="0"> 
  <INPUT TYPE=HIDDEN name="E01BDCNUM" value="0"> 
  <INPUT TYPE=HIDDEN name="docnum" value="0"> 
  <INPUT TYPE=HIDDEN name="E01ACT"    value="N"> 
  <INPUT TYPE=HIDDEN name="E01REQTYP" value="<%= userPO.getHeader1().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQFDM" value="<%= userPO.getHeader2().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQFDD" value="<%= userPO.getHeader3().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQFDY" value="<%= userPO.getHeader4().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQTDM" value="<%= userPO.getHeader5().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQTDD" value="<%= userPO.getHeader6().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQTDY" value="<%= userPO.getHeader7().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQKIN" value="<%= userPO.getHeader8().trim() %>">
  <INPUT TYPE=HIDDEN name="PURPOSE"   value="<%= userPO.getPurpose().trim() %>">
  <INPUT TYPE=HIDDEN NAME="DOCUMENTO" VALUE="<%= userPO.getIdentifier().trim() %>">
  
<table  class="tbenter" width="100%">
		<tr bordercolor="#FFFFFF"> 
			<td nowrap> 

<%	if (EBP0138List.getNoResult() ) { %>
<TABLE class="tbenter" width="100%">
  	<TR>
		<TD align="CENTER" class="TDBKG" width="100%">
	  	<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0138?SCREEN=1"><b>Regresar a la<BR>Búsqueda</b></a></TD>
  	</TR>
	<tr valign="middle">
		<TD align="center" height="100" nowrap valign="middle" width="100%"> 
			<H4 style="text-align:center">No hay resultados para su criterio de búsqueda.</H4>
		</TD>
	</tr>
</TABLE>

<%
	} else {
%>
   
<TABLE class="tbenter" width="100%"> 
  <TR>
	<TD align="CENTER" class="TDBKG" width="33%">
	  <a href="javascript:goInquiry()"><b>Consultar<BR>Documento Origen
				</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="33%">
	  <a href="javascript:goRating()"><b>Calificar</b></a></TD>
	<TD align="CENTER" class="TDBKG" width="34%">
	  <a href="<%=request.getContextPath()%>/servlet/datapro.eibs.bap.JSEBP0138?SCREEN=1"><b>Regresar a la<BR>Búsqueda</b></a></TD>
  </TR>
</TABLE> 
<% } %>
<%	if (!EBP0138List.getNoResult() ) { %>    
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
		<TD nowrap align="center" width="35%"><B>Nombre Proveedor</B></TD>
	</TR>
 
        <%
    	  int i = 0;
          EBP0138List.initRow();    
          while (EBP0138List.getNextRow()) {
            EBP013801Message msgList = (EBP013801Message) EBP0138List.getRecord();	 
         %>   

    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= msgList.getE01BDCNUM()%>">
		</td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDCNUM() %></td>
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01BDCREF() %></td>
		<td NOWRAP align="center" width="10%" ><%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), msgList.getE01BDCDDM(),msgList.getE01BDCDDD(),msgList.getE01BDCDDY())%></td>
		<td NOWRAP align="center" width="10%" ><%= datapro.eibs.master.Util.formatCustomDate( currUser.getE01DTF(), msgList.getE01BDCPDM(),msgList.getE01BDCPDD(),msgList.getE01BDCPDY())%></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDCKIND() %></td>
		<td NOWRAP align="center" width="10%" ><%= msgList.getE01BDCCOD() %></td>
		<td NOWRAP align="left" width="35%" ><%= msgList.getE01BDCVEND() %></td>
		

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
    	if ( EBP0138List.getShowPrev() ) {
  			int pos = EBP0138List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0138?SCREEN="+screen+"&FromRecord=" + pos + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPDM=" + userPO.getHeader5() +
  			"&E01REQPDD=" + userPO.getHeader6() +
  			"&E01REQPDY=" + userPO.getHeader7() +
  			"&E01REQKIN=" + userPO.getHeader8() +  			
  			"\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EBP0138List.getShowNext()) {
  			int pos = EBP0138List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.bap.JSEBP0138?SCREEN="+screen+"&FromRecord=" + pos + 
  			"&E01REQTYP=" + userPO.getHeader1() + 
  			"&E01REQORD=" + userPO.getHeader2() +
  			"&E01REQSTS=" + userPO.getHeader3() +
  			"&E01REQFRM=" + userPO.getHeader4() +
  			"&E01REQPDM=" + userPO.getHeader5() +
  			"&E01REQPDD=" + userPO.getHeader6() +
  			"&E01REQPDY=" + userPO.getHeader7() +
  			"&E01REQKIN=" + userPO.getHeader8() +  			  			
  			"\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
      </TD>
     </TR>
 </TABLE>
  
<BR>

<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EBP0138List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EBP0138List.getFirstRec()%>;
</SCRIPT>
<%} %>   
		</TD>
	</TR>
</TABLE>
</form>
</body>
</html>
