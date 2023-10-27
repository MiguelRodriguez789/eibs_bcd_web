<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Comisiones-Definición de Canales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "Channel" class= "datapro.eibs.beans.ESD020303Message"  scope="session" />
<jsp:useBean id= "ESD020303List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">


function goNew() {
	document.forms[0].SCREEN.value="302";
	document.forms[0].submit();
}

function goProcess() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}

	document.forms[0].SCREEN.value="304";
	document.forms[0].submit();
}

function goInquiry() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}
	document.forms[0].SCREEN.value="305";
	document.forms[0].submit();
}

function goDelete() {
	isCheck();
	if ( !ok ) {
		alert("Favor seleccionar un código!!!");
		return;	 
	}

	document.forms[0].SCREEN.value="306";
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
			   getElement("XHHCHN").value = values[0];
			   getElement("XHHPRV").value = values[1];
			   getElement("XHHCDE").value = values[2];
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
<h3 align="center">Comisiones-Definición de Canales

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_channel_list.jsp, ESD0203"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0203" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">
    <INPUT TYPE=HIDDEN NAME="XHHCHN" VALUE=" ">
    <INPUT TYPE=HIDDEN NAME="XHHPRV" VALUE=" ">
    <INPUT TYPE=HIDDEN NAME="XHHCDE" VALUE=" ">
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
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
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
	        <a href="javascript:goProcess()"><b>Consulta</b></a>
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
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE>


<%
      } 
%>


<%
   if ( ESD020303List.getNoResult() ) {
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
      <th align=CENTER nowrap width="5%">Canal</th>
      <th align=CENTER nowrap width="15%">Descripción del Canal</th>
      <th align=CENTER nowrap width="5%">Proveedor</th>
      <th align=CENTER nowrap width="15%">Descripción del Proveedor</th>
      <th align=CENTER nowrap width="5%">Comision</th>
      <th align=CENTER nowrap width="15%">Descripción de Comision</th>
      <th align=CENTER nowrap width="10%">Tarifa</th>
      <th align=CENTER nowrap width="10%">Creación</th>
      <th align=CENTER nowrap width="10%">Estado</th>
   </TR>
   
   <%
      int i = 0;
      ESD020303List.initRow();    
      while (ESD020303List.getNextRow()) {
      ESD020303Message msgList = (ESD020303Message) ESD020303List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="5%"><INPUT type="radio" name="CODE" value="<%= msgList.getE03DDHCHN() %>|<%= msgList.getE03DDHPRV() %>|<%= msgList.getE03DDHCDE() %>"></td>
   <td NOWRAP align="center" width="5%" ><%= msgList.getE03DDHCHN() %> </td>
   <td NOWRAP align="left" width="15%" ><%= msgList.getE03DDHDSC() %></td>
   <td NOWRAP align="center" width="5%" ><%= msgList.getE03DDHPRV() %> </td>
   <td NOWRAP align="left" width="15%" ><%= msgList.getE03DDHPRD() %></td>
   <td NOWRAP align="center" width="5%" ><%= msgList.getE03DDHCDE() %> </td>
   <td NOWRAP align="left" width="15%" ><%= msgList.getE03DDHCDD() %></td>
   <td NOWRAP align="right" width="10%" ><%= msgList.getE03DDHCOA() %></td>
   <td NOWRAP align="center" width="10%" ><%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
  																					msgList.getBigDecimalE03DDHOMM().intValue(),
  																					msgList.getBigDecimalE03DDHODD().intValue(),
  																					msgList.getBigDecimalE03DDHOYY().intValue())%>
   </td>   <td NOWRAP align="center" width="10%" ><%= msgList.getE03DDHSTD() %></td>
</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    	if ( ESD020303List.getShowPrev() ) {
  			int pos = ESD020303List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0203?SCREEN=301&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    } %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    	if (ESD020303List.getShowNext()) {
  			int pos = ESD020303List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0203?SCREEN=301&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

    } %>
  </TD>
 </TR>
 </TABLE>


<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD020303List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD020303List.getFirstRec()%>;
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
