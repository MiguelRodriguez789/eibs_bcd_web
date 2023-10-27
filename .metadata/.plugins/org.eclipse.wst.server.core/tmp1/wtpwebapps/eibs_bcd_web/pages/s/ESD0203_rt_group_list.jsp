<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Comisiones-Definición de Grupos Cargo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "Group" class= "datapro.eibs.beans.ESD020302Message"  scope="session" />
<jsp:useBean id= "ESD020302List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">


function goNew() {
	document.forms[0].SCREEN.value="202";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}

	document.forms[0].SCREEN.value="204";
	document.forms[0].submit();
}

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="205";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}

	document.forms[0].SCREEN.value="206";
	document.forms[0].submit();
}

function goReturn() {
	document.forms[0].SCREEN.value="207";
	document.forms[0].submit();
}


function setKey(cde,cun) {
	getElement("E02DDGCDE").value = cde;
	getElement("E02DDGCUN").value = cun;
}


function isCheck() {

	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
				getElement("E02DDGCDE").value = document.forms[0].elements[n].value;
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
   out.println("<SCRIPT> initMenu(); </SCRIPT>");

%> 
<h3 align="center">Comisiones-Definición de Grupos Cargo

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_group_list.jsp, ESD0203"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0203" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    <INPUT TYPE=HIDDEN NAME="E02DDGCDE" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E02DDGCUN" VALUE="">
    <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
   </p>
  

<%
   if(userPO.getPurpose().equals("INQUIRY")) {
%>
<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goInquiry()"><b>Consultar</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="50%">
			<a href="javascript:goReturn()"><b>Regresar</b></a>
	  	</TD>
	</TR>
</TABLE>
<%
   }else{
%>   
<TABLE class="tbenter"> 
   <TR>
      <% if( "1".equals( currUser.getH01WK1() ) ){ %>
	      <td class=TDBKG width="25%"> 
	        <a href="javascript:goInquiry()"><b>Consultar</b></a>
	      </td>     
      <% } else { %>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goNew()"><b>Crear</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goProcess()"><b>Modificar</b></a>
      	</TD>
		<TD align="CENTER" class="TDBKG" width="25%">		
			<a href="javascript:goDelete()"><b>Eliminar</b></a>
      	</TD>
      <% } %>      	
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="javascript:goReturn()"><b>Regresar</b></a>
	  	</TD>
	</TR>
</TABLE>


<%
      } 
%>


<%
   if ( ESD020302List.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=30%">
   <TR>
      <TD>         
         <div align="center"> <h4 style="text-align:center"> No hay Registros Activos</h4></div>
      </TD>
   </TR>
</TABLE>

<%
   }
   else
   {
%>   

<table  class="tableinfo" width="100%">
   <TR id=trdark> 
      <th align=CENTER nowrap width="5%">Sel</th>
      <th align=CENTER nowrap width="5%">Código de Grupo Cargo</th>
      <th align=CENTER nowrap width="20%">Descripción Grupo Cargo</th>
      <th align=CENTER nowrap width="5%">Cliente</th>
      <th align=CENTER nowrap width="20%">Nombre</th>
      <th align=CENTER nowrap width="15%">Nro.Cuenta</th>
      <th align=CENTER nowrap width="15%">Creacion</th>
      <th align=CENTER nowrap width="15%">Estado</th>
   </TR>
   
   <%
      int i = 0;
      ESD020302List.initRow();    
      while (ESD020302List.getNextRow()) {
      ESD020302Message msgList = (ESD020302Message) ESD020302List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="5%"><INPUT type="radio" name="CODE"  onClick="setKey('<%=msgList.getE02DDGCDE()%>','<%=msgList.getE02DDGCUN()%>')"value="<%= msgList.getE02DDGCDE() %>"></td>
   <td NOWRAP align="left" width="5%" ><%= msgList.getE02DDGCDE() %> </td>
   <td NOWRAP align="left" width="20%" ><%= msgList.getE02DDGDSC() %></td>
   <td NOWRAP align="left" width="5%" ><%= msgList.getE02DDGCUN() %> </td>
   <td NOWRAP align="left" width="20%" ><%= msgList.getE02CUSNA1() %></td>
   <td NOWRAP align="left" width="15%" ><%= msgList.getE02DDGACC() %></td>
   <td NOWRAP align="left" width="15%" ><%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
  																					msgList.getBigDecimalE02DDGOMM().intValue(),
  																					msgList.getBigDecimalE02DDGODD().intValue(),
  																					msgList.getBigDecimalE02DDGOYY().intValue())%>
   </td>   <td NOWRAP align="left" width="15%" ><%= msgList.getE02DDGSTD() %></td>
</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    	if ( ESD020302List.getShowPrev() ) {
  			int pos = ESD020302List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0203?SCREEN=201&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    } %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    	if (ESD020302List.getShowNext()) {
  			int pos = ESD020302List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0203?SCREEN=201&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

    } %>
  </TD>
 </TR>
 </TABLE>

<BR>


<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD020302List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD020302List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
