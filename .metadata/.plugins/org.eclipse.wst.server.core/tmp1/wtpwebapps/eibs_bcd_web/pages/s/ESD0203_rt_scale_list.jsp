<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*" %>

<html>
<head>
<title>Comisiones-Definición de Escalas/Tramos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "Scale" class= "datapro.eibs.beans.ESD020301Message"  scope="session" />
<jsp:useBean id= "ESD020301List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">


function goNew() {
	document.forms[0].SCREEN.value="102";
	document.forms[0].submit();
}

function goProcess() {
	document.forms[0].SCREEN.value="104";
	document.forms[0].submit();
}

function goInquiry() {
	document.forms[0].SCREEN.value="105";
	document.forms[0].submit();
}

function goDelete() {
	document.forms[0].SCREEN.value="106";
	document.forms[0].submit();
}


function isCheck(code, branch) {

	getElement("E01DDTCDE").value = code;
	getElement("E01DDTBRN").value = branch;
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
<h3 align="center">Comisiones-Definición de Escalas/Tramos

<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_scale_list.jsp, ESD0203"></h3>
<hr size="4">
 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0203" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">
    <INPUT TYPE=HIDDEN NAME="E01DDTCDE" VALUE="">
    <INPUT TYPE=HIDDEN NAME="E01DDTBRN" VALUE="">
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
		<TD align="CENTER" class="TDBKG" width="25%">		
			<a href="javascript:goProcess()"><b>Consultar</b></a>
      	</TD>  
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
	  	<TD align="CENTER" class="TDBKG" width="25%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
      <% } %>

	</TR>
</TABLE>


<%
      } 
%>


<%
   if ( ESD020301List.getNoResult() ) {
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
      <th align=CENTER nowrap width="15%">Código de Escala</th>
      <th align=CENTER nowrap width="15%">Sucursal</th>
      <th align=CENTER nowrap width="50%">Descripción De Escala</th>
      <th align=CENTER nowrap width="15%">Creacion</th>
      <th align=CENTER nowrap width="15%">Estado</th>
   </TR>
   
   <%
      int i = 0;
      ESD020301List.initRow();    
      while (ESD020301List.getNextRow()) {
      ESD020301Message msgList = (ESD020301Message) ESD020301List.getRecord(); 
   %>  
   <TR>          
   <td NOWRAP align="center" width="5%"><INPUT type="radio" name="CODE" value="<%= ESD020301List.getCurrentRow() %>" onclick="isCheck('<%= msgList.getE01DDTCDE() %>', '<%= msgList.getE01DDTBRN() %>')" ></td>
   <td NOWRAP align="center" width="15%" ><%= msgList.getE01DDTCDE() %> </td>
   <td NOWRAP align="center" width="5%" ><%= msgList.getE01DDTBRN() %> </td>
   <td NOWRAP align="left" width="50%" ><%= msgList.getE01DDTDSC() %></td>
   <td NOWRAP align="center" width="15%" ><%=datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
  																					msgList.getBigDecimalE01DDTOMM().intValue(),
  																					msgList.getBigDecimalE01DDTODD().intValue(),
  																					msgList.getBigDecimalE01DDTOYY().intValue())%>
   </td>   <td NOWRAP align="center" width="15%" ><%= msgList.getE01DDTSTD() %></td>
</TR>																					
   <% 
      i++; 
      } 
   %>
      
</table>

  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
    	if ( ESD020301List.getShowPrev() ) {
  			int pos = ESD020301List.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0203?SCREEN=101&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    } %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
    	if (ESD020301List.getShowNext()) {
  			int pos = ESD020301List.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.params.JSESD0203?SCREEN=101&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

    } %>
  </TD>
 </TR>
 </TABLE>

<BR>

<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= ESD020301List.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= ESD020301List.getFirstRec()%>;
	
	radioClick("CODE", 0);
</SCRIPT>


<%      
   }
%> 
 




</form>
</body>
</html>
