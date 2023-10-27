<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Parametros Extractos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="rtExtra" class="datapro.eibs.beans.ESD006004Message" scope="session" />
<jsp:useBean id= "ESD006003List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script src="<%=request.getContextPath()%>/jquery/deleteLocalAuthorization.jsp"> </script>


<SCRIPT type="text/javascript">



function goNew() {

	document.forms[0].SCREEN.value="602";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="604";
	document.forms[0].submit();
}

function goInqury() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="605";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="606";
	//document.forms[0].submit();
	enableDeleteAuthorization( ) ;
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
     		   var values = document.forms[0].elements[n].value.split('|');
			   getElement("E03STMBNK").value = values[0];
			   getElement("E03STMTYP").value = values[1];
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
<h3 align="center">Parámetros Extractos 

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_param_bank_statements_2.jsp, ESD0060"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0031" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="602">
    <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="E03STMBNK" value="E03STMBNK">
    <INPUT TYPE=HIDDEN NAME="E03STMTYP" value="E03STMTYP">
    <input type=hidden name="E04STMBNK" value="<%=rtExtra.getE04STMBNK().trim()%>">
    <input type="HIDDEN" name="H03FLGMAS"  >
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
   if ( ESD006003List.getNoResult() ) {
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
	  <td NOWRAP align="center" width="15%"><B>Codigo</B></td>
	  <td NOWRAP align="center" width="75%"><B>Descripcion</B></td>
  </TR>
   
   <%
      int i = 0;
      ESD006003List.initRow();  
	  boolean firstTime = true;
  	  String chk = "";
        
      while (ESD006003List.getNextRow()) {
		if (firstTime) {
			firstTime = false;
			chk = "checked";
		} else {
			chk = "";
		}      
      ESD006003Message msgList = (ESD006003Message) ESD006003List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="10%"><INPUT type="radio" name="CODE" <%=chk%> value="<%= msgList.getE03STMBNK() %>|<%= msgList.getE03STMTYP() %>"></td>
   <td NOWRAP align="left" width="15%" ><%= msgList.getE03STMTYP() %> </td>
   <td NOWRAP align="left" width="75%" ><%= msgList.getE03STMDSC() %></td>
</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    	if ( ESD006003List.getShowPrev() ) {
  			int pos = ESD006003List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0031?SCREEN=601&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    } %>     
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    	if (ESD006003List.getShowNext()) {
  			int pos = ESD006003List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0031?SCREEN=601&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>

  </TD>
 </TR>
 </TABLE>


<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value =  <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD006003List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD006003List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
