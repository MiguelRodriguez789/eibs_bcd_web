<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>City Categories</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT>
var ok = false;

function goSearch(opt) {
	switch (opt) {
		case 1:
			if (getElement("SEARCHCTR").value == "") {
				alert("Favor seleccionar País para posicionarse en la lista!!!");
			return;	 
			}
			break;
		case 2:
			if (getElement("SEARCHSTE").value == "") {
				alert("Favor seleccionar Estado para posicionarse en la lista!!!");
			return;
			}
			goSearch(1);	 
			break;
		case 3:
			if (getElement("SEARCHCTY").value == "") {
				alert("Favor seleccionar Ciudad para posicionarse en la lista!!!");
			return;
			}
			goSearch(2);	 
			break;
		case 4:
			if (getElement("SEARCHCTG").value == "") {
				alert("Favor seleccionar Categoría para posicionarse en la lista!!!");
			return;	
			}
			goSearch(3);
			break;
		default :
	}	
	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){%>
			getElement("SCREEN").value="1";
	<% } else { %>
			getElement("SCREEN").value="6";
	<% }%>
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="2";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un registro!!");
		return;	 
	}
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}


function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccione el registro a borrar!!!");
		return;	 
	}
	getElement("SCREEN").value="4";
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

function setKey(ctr, ste, cty, ctg, sct) {
	getElement("E01CDRCTR").value = ctr;
	getElement("E01CDRSTE").value = ste;
	getElement("E01CDRCTY").value = cty;
	getElement("E01CDRCTG").value = ctg;
	getElement("E01CDRSCT").value = sct;
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
 
 String search = "<img src=\"" + request.getContextPath() + "/images/ico5.gif\" alt=\"Ordenar y Posicionarse en...\" align=\"bottom\" border=\"0\" >";
 String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" style=\"cursor:hand\" >";
 
%>

<h3 align="center">Categorías y SubCategorías de Ciudades<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="city_categories_list.jsp, ESD0032"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0032">

  <INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="6">
  <INPUT TYPE=HIDDEN id="actRow" NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN id="TOTROWS" NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="NEXTROWS" NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="CURRROWS" NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN id="E01CDRCTR" NAME="E01CDRCTR" VALUE="">
  <INPUT TYPE=HIDDEN id="E01CDRSTE" NAME="E01CDRSTE" VALUE="">
  <INPUT TYPE=HIDDEN id="E01CDRCTY" NAME="E01CDRCTY" VALUE="">
  <INPUT TYPE=HIDDEN id="E01CDRCTG" NAME="E01CDRCTG" VALUE="">
  <INPUT TYPE=HIDDEN id="E01CDRSCT" NAME="E01CDRSCT" VALUE="">
  <INPUT TYPE=HIDDEN id="DSCCTR" NAME="DSCCTR" VALUE="">
  <INPUT TYPE=HIDDEN id="DSCSTE" NAME="DSCSTE" VALUE="">
  <INPUT TYPE=HIDDEN id="DSCCTY" NAME="DSCCTY" VALUE="">
  <INPUT TYPE=HIDDEN id="DSCCTG" NAME="DSCCTG" VALUE="">
   
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){ %>

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
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 


<%
  }	 
	if ( msgList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      		<TD align="center"><h4 style="text-align:center"> No hay Registros.</h4></TD>
      	</TR>
   	</TABLE>
<%
	} 	else {
%>    
    
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B>Sel</B></th>
				<th NOWRAP align="center" width="15%"><B>País</B>
					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCTR" id="SEARCHCTR"  size="5" maxlength="4" value="<%=userPO.getHeader1()%>">
			   			<A href="javascript:goSearch(1)" ><%=search%></a>
			   			<a href="javascript:GetCodeDescCNOFC('SEARCHCTR','DSCCTR','03')"><%=help%></a>
		   			</td>
		   			</tr> 
					</table>
				</th>
				<th nowrap align="center" width="20%"><B>Estado</B>
				<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHSTE" id="SEARCHSTE"  size="4" maxlength="2" value="<%=userPO.getHeader2()%>">
			   			<A href="javascript:goSearch(2)" ><%=search%></a>
			   			<a href="javascript:Get2FilterCodes('SEARCHSTE','DSCSTE','27', '',document.forms[0]['SEARCHCTR'].value)" ><%=help%></a>
		   			</td>
		   			</tr> 
					</table>
				</th>	
 				<th NOWRAP align="center" width="20%"><B>Ciudad</B>
 					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCTY" id="SEARCHCTY"  size="4" maxlength="3" value="<%=userPO.getHeader3()%>">
			   			<A href="javascript:goSearch(3)" ><%=search%></a>
			   			<a href="javascript:Get2FilterCodes('SEARCHCTY','DSCCTY','84', '',document.forms[0]['SEARCHSTE'].value)" ><%=help%></a>
		   			</td>
		   			</tr> 
					</table>
 				</th>
 				<th nowrap align="center" width="20%"><B>Categoría</B>
 					<table border="0" align="center">
					<tr id="trdark" align="center">
					<td nowrap align="center">
			   			<input type="text" name="SEARCHCTG" id="SEARCHCTG"  size="4" maxlength="3" value="<%=userPO.getHeader4()%>">
			   			<A href="javascript:goSearch(4)" ><%=search%></a>
			   		</td>
		   			</tr> 
					</table>
				</th>
 				<th nowrap align="center" width="20%"><B>SubCategoría</B></th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
        <%
    	  int i = 0; 
          msgList.initRow();
     	  boolean firstTime = true;
		  String chk = "";
          while (msgList.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}          	
            ESD003201Message msgRcd = (ESD003201Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"> 
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow() %>"  class="highlight" 
				onClick="setKey('<%=msgRcd.getE01CDRCTR()%>','<%=msgRcd.getE01CDRSTE()%>','<%=msgRcd.getE01CDRCTY()%>','<%=msgRcd.getE01CDRCTG()%>','<%=msgRcd.getE01CDRSCT()%>')	; highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="left" width="15%" ><%= msgRcd.getE01CDRCTR()%> - <%= msgRcd.getD01CDRCTR()%></td>
			<td NOWRAP align="left" width="20%" ><%= msgRcd.getE01CDRSTE()%> - <%= msgRcd.getD01CDRSTE()%></td>
			<td NOWRAP align="left" width="20%" ><%= msgRcd.getE01CDRCTY()%> - <%= msgRcd.getD01CDRCTY()%></td>
			<td NOWRAP align="left" width="20%" ><%= msgRcd.getE01CDRCTG()%> - <%= msgRcd.getE01CDRCTGD()%></td>	
           	<td NOWRAP align="left" width="20%" ><%= msgRcd.getE01CDRSCT()%> - <%= msgRcd.getE01CDRSCTD()%></td>
		</tr>
      
       <% i++; } %>
        
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
		String parm = "?SCREEN=" + screen + "&SEARCHCTR=" + userPO.getHeader1() + "&SEARCHSTE=" + userPO.getHeader2() + "&SEARCHCTY=" + userPO.getHeader3() + "&SEARCHCTG=" + userPO.getHeader4();
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0032" + parm + "&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0032" + parm + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
 
  
<SCRIPT type="text/javascript">
	showChecked("CODE");
	getElement("TOTROWS").value = <%=i%>;
	getElement("NEXTROWS").value = <%=msgList.getLastRec()%>;
	getElement("CURRROWS").value = <%=msgList.getFirstRec()%>;
</SCRIPT>
<% } %>

</form>
</body>
</html>
