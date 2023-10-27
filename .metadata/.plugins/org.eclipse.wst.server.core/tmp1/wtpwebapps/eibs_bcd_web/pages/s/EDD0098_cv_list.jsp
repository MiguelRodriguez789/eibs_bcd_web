<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Cuentas de Ahorro</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EDD009801List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goNew() {

	document.forms[0].SCREEN.value="6";
	document.forms[0].submit();
}

function goUpdate() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="7";
	document.forms[0].submit();
}

function goInqury() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="8";
	document.forms[0].submit();
}

function goApproval() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="9";
	document.forms[0].submit();
}




function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="10";
	document.forms[0].submit();
}


function isCheck() {
	var formLength= document.forms[0].elements.length;
   	ok = false;
	for(n=0;n<formLength;n++) {
     	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "CODE") {
			if (document.forms[0].elements[n].checked == true) {
     		   var values = document.forms[0].elements[n].value.split('|');
			   getElement("E01ACMACC").value = values[0];
			   getElement("E01ACMCON").value = values[1];
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
<h3 align="center">Cargos por Aprobar que Afectan el Acumlado de Ctas de Ahorro para Cobro del GMF<br> 

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cv_list.jsp, EDD0098"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSEDD0098" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
    <INPUT TYPE=HIDDEN NAME="E01ACMACC" value="E01ACMACC">
    <INPUT TYPE=HIDDEN NAME="E01ACMCON" value="E01ACMCON">
     <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
    <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

  </p>
  


<TABLE class="tbenter"> 
   <TR>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goApproval()"><b>Aprobar</b></a>
		</TD>
		<TD align="CENTER" class="TDBKG" width="33%">
			<a href="javascript:goDelete()"><b>Borrar<br>Mantenimiento</b></a>
		</TD>
	  	<TD align="CENTER" class="TDBKG" width="34%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>



<%
   if ( EDD009801List.getNoResult() ) {
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
      <td NOWRAP align="center" width="10%"><B>Opción</B></td>
      <td NOWRAP align="center" width="15%"><B>Tabla</B></td>
	  <td NOWRAP align="center" width="12%"><B>Consecutivo</B></td>
	  <td NOWRAP align="center" width="21%"><B>Valor</B></td>
	  <td NOWRAP align="center" width="4%"><B>D/C</B></td>
	  <td NOWRAP align="center" width="60%"><B>Descripcion</B></td>
	  
  </TR>
   
   <%
      int i = 0;
      EDD009801List.initRow();    
      while (EDD009801List.getNextRow()) {
      EDD009801Message msgList = (EDD009801Message) EDD009801List.getRecord(); 
   %>  
   <TR>
   <td NOWRAP align="center" width="10%"><INPUT type="radio" name="CODE" value="<%= msgList.getE01ACMACC() %>|<%= msgList.getE01ACMCON() %>"></td>          
   <td NOWRAP align="left" width="15%" ><%= msgList.getE01ACMACC() %> </td>
   <td NOWRAP align="left" width="12%" ><%= msgList.getE01ACMCON() %> </td>
   <td NOWRAP align="left" width="21%" ><%= msgList.getE01ACMAMA() %></td>
   <td NOWRAP align="left" width="4%" ><%= msgList.getE01ACMDCC() %></td>
   <td NOWRAP align="left" width="60%" ><%= msgList.getE01ACMTDS() %></td>
   
</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    	if ( EDD009801List.getShowPrev() ) {
  			int pos = EDD009801List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.taxes.JSEDD0098?SCREEN=5&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    } %>     
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    	if (EDD009801List.getShowNext()) {
  			int pos = EDD009801List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.taxes.JSEDD0098?SCREEN=5&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>

  </TD>
 </TR>
 </TABLE>


<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= EDD009801List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= EDD009801List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
