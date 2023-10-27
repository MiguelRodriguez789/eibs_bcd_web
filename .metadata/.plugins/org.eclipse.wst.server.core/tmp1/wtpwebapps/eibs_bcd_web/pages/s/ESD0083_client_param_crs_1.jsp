<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Parametros Clientes - CRS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "client" class= "datapro.eibs.beans.ESD008302Message"  scope="session" />  
<jsp:useBean id= "ESD008302List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT Language="Javascript">



function goNew() {

	document.forms[0].SCREEN.value="201";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="203";
	document.forms[0].submit();
}

function goInqury() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="204";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="205";
	document.forms[0].submit();
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
                getElement("E02CFACTY").value = document.forms[0].elements[n].value;
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
<h3 align="center">Parámetros Clientes - CRS 

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_param_crs_1.jsp, ESD0083"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0085" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="201">
    <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="E02CFACTY" id="E02CFACTY" VALUE="">
  </p>
  

  
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
   if ( ESD008302List.getNoResult() ) {
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
      <td NOWRAP align="center" width="10%"><B>Opcion</B></td>
	  <td NOWRAP align="center" width="15%"><B>Pais</B></td>
	  <td NOWRAP align="center" width="75%"><B>Descripcion</B></td>
  </TR>
   
   <%
      int i = 0;
      ESD008302List.initRow();    
      while (ESD008302List.getNextRow()) {
      ESD008302Message msgList = (ESD008302Message) ESD008302List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="10%"><INPUT type="radio" name="CODE" value="<%= msgList.getE02CFACTY() %>"></td>
   <td NOWRAP align="left" width="15%" ><%= msgList.getE02CFACTY() %> </td>
   <td NOWRAP align="left" width="75%" ><%= msgList.getD02CFACTY() %></td>
</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    	if ( ESD008302List.getShowPrev() ) {
  			int pos = ESD008302List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0085?SCREEN=200&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    } %>     
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    	if (ESD008302List.getShowNext()) {
  			int pos = ESD008302List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0085?SCREEN=200&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>

  </TD>
 </TR>
 </TABLE>


<SCRIPT Language="javascript">
	document.forms[0].TOTROWS.value =  <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD008302List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD008302List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
