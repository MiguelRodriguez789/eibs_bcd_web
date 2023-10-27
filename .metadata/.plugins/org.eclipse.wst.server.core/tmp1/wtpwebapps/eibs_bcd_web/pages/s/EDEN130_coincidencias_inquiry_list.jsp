<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>ACH Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "EDEN130List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
var ok = false;
 
function goDetail() {
	isCheck();
	if (!ok) {
		alert("Favor seleccionar una registro!!!");
		return;	 
	}
	ofanum = getElement("E01OFANRO").value;
	showInqOFAC(ofanum);
}

function goPage(p) {
	getElement("FromRecord").value = p;
	document.forms[0].SCREEN.value="2";
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
	getElement("E01OFANRO").value = num;
}

function showInqOFAC(fieldValue) {
		var formLength = document.forms[0].elements.length;
   		for (n=0; n<formLength; n++) {
      		var elementName = document.forms[0].elements[n].name;
      		var elementValue = document.forms[0].elements[n].value;
      		if (elementName == "ACCNUM" && elementValue == fieldValue) {
        		document.forms[0].elements[n].click();
        		break;
      		}
      	}
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
		CenterWindow(page, 600, 500, 2);    
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

<h3 align="center">Consulta de Coincidencias Listas de Control. 
    <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="coincidencias_inquiry_list.jsp, EDEN130">
</h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN130">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="FromRecord" VALUE="0"> 
  <INPUT TYPE=HIDDEN NAME="E01OFANRO" VALUE="0"> 
  <INPUT TYPE="HIDDEN" name="E01REQORD" value="<%= userPO.getHeader1().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQSTS" value="<%= userPO.getHeader2().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQFRM" value="<%= userPO.getHeader3().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQPDM" value="<%= userPO.getHeader4().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQPDD" value="<%= userPO.getHeader5().trim() %>">
  <INPUT TYPE="HIDDEN" name="E01REQPDY" value="<%= userPO.getHeader6().trim() %>">

<TABLE class="tbenter" width="100%"> 
	<TR>
		<TD align="right" width="34%"></TD>
		<TD align="right" width="33%"><B><U>Criterio de Búsqueda</U></B></TD>
	  	<TD align="CENTER" width="33%"></TD>	  	
	</TR>
	<TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Ordenado por :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader1().equals("C")) { 
				out.println("Desde Cliente "  + userPO.getHeader3()); 
			   } else if (userPO.getHeader1().equals("N")) { 
				out.println("Desde Numero Interno"  + userPO.getHeader3()); 
			   } else if (userPO.getHeader1().equals("D")) { 
				out.println("Desde Fecha " + datapro.eibs.master.Util.formatDate(userPO.getHeader4(),userPO.getHeader5(),userPO.getHeader6()));
			   } else if (userPO.getHeader1().equals("A")) { 
				out.println("Desde Cuenta " + userPO.getHeader3()); 
			   } else if (userPO.getHeader1().equals("M")) { 
				out.println("Desde Nombre " + userPO.getHeader3());
			   } else if (userPO.getHeader1().equals("I")) { 
				out.println("Desde Identificación " + userPO.getHeader3());
			   } else if (userPO.getHeader1().equals("O")) { 
				out.println("Desde Origen " + userPO.getHeader3()); 	   	
			   } else  { out.println("Desde " + userPO.getHeader3());
			   }%> 
			  
		</TD>
	</TR>
    <TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Con Estado :</B></TD>
		<TD align="left" width="33%"><% if (userPO.getHeader2().equals("P")) { 
				out.println("Pendiente de Aprobación"); 
			   } else if (userPO.getHeader2().equals("A")) { 
				out.println("Aprobado"); 
			   } %></TD>
	</TR>
	
</TABLE> 

<%	if ( EDEN130List.getNoResult() ) { %>
 	<TABLE class="tbenter" width=100% height=30%">
 	<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay resultado para su criterio de Búsqueda.</h4></div>
      </TD>
	</TR>
	<TR>
	  	<TD align="CENTER" class="TDBKG" width="100%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN130?SCREEN=1"><b>Volver a la<BR>Búsqueda</b></a>
      	</TD>
	</TR>
	
   	</TABLE>
<%
	} else {
%>    

<TABLE class="tbenter"> 
	<TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goDetail()"><b>Ver<br>Detalle</b></a>
      	</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="<%=request.getContextPath()%>/servlet/datapro.eibs.ofac.JSEDEN130?SCREEN=1"><b>Volver a la<BR>Búsqueda</b></a>
      	</TD>
	</TR>
</TABLE> 
    
  <TABLE class="tableinfo" id="dataTable">
    <TR id=trdark> 
		<td NOWRAP align="center" width="5%"><B>Sel</B></td>
		<td NOWRAP align="center" width="5%"><B>Numero<BR>Interno</B></td>
		<TD nowrap align="center" width="10%"><B>Fecha de<BR>Proceso</B></TD>
		<td NOWRAP align="center" width="10%"><B>Identificación</B></td>
		<TD nowrap align="center" width="10%"><B>Cuenta</B></TD>
		<TD nowrap align="center" width="10%"><B>Numero<BR>Cliente</B></TD>
		<TD nowrap align="center" width="5%"><B>Estado</B></TD>
		<TD nowrap align="center" width="5%"><B>Origen</B></TD>
		<TD nowrap align="center" width="40%"><B>Comentario</B></TD>
	</TR>
 
        <%
          String ofacImg = "";
    	  int i = 0;
          EDEN130List.initRow();    
          while (EDEN130List.getNextRow()) {
            EDEN13001Message msgList = (EDEN13001Message) EDEN130List.getRecord();	
         %>   
                    
    <TR id=trclear>
		<td NOWRAP align="center" width="5%">
           	<INPUT TYPE="radio" name="ROW"  value="<%= EDEN130List.getCurrentRow()%>" onClick="setKey('<%=msgList.getE01OFANRO()%>')">
			<%=ofacImg%>
		</td>
		
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01OFANRO() %></td>
		<td NOWRAP align="center" width="10%" > <%= Util.formatCustomDate(currUser.getE01DTF(),
															msgList.getBigDecimalE01OFACDM().intValue(),
															msgList.getBigDecimalE01OFACDD().intValue(),
															msgList.getBigDecimalE01OFACDY().intValue()) %></td>

		<td NOWRAP align="center" width="10%" > <%= msgList.getE01OFAPID() %> <%= msgList.getE01OFATID() %> <%= msgList.getE01OFAIDN() %></td>
		<td NOWRAP align="left" width="10%" ><%= msgList.getE01OFAACC() %></td>
		<td NOWRAP align="right" width="10%" ><%= msgList.getE01OFACUN() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01OFASTS() %></td>
		<td NOWRAP align="center" width="5%" ><%= msgList.getE01OFAPGM() %></td>
		<td NOWRAP align="left" width="40%" ><%= msgList.getE01OFANOT() %></td>
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
    	if ( EDEN130List.getShowPrev() ) {
  			int pos = EDEN130List.getFirstRec() - 21;
  			out.print("<img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0 onclick=\"goPage(" + pos + ")\">");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (EDEN130List.getShowNext()) {
  			int pos = EDEN130List.getLastRec();
  			out.print("<img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0 onclick=\"goPage(" + pos + ")\">");
	    } %>
      </TD>
     </TR>
 </TABLE>
  
<BR>

<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDEN130List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDEN130List.getFirstRec()%>;
</SCRIPT>
<% } %>    
</form>
</body>
</html>
