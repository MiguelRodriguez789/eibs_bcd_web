<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Biometric Log</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet" type="text/css" media="screen" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/mapstyler.js"></script>

<%
    	  int i = 0;
          msgList.initRow();
          msgList.getNextRow();
          ESS026501Message msgRecord = (ESS026501Message) msgList.getRecord();
%> 


<SCRIPT>


</SCRIPT>

</head>

<body>

<%  
 String legtyp = (msgRecord.getH01LGT().equals("1")?"JURIDICO":"PERSONA"); 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Consulta de Log de Biometría en e-IBS<br>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="log_inquiry_list.jsp, ESS0265">
</h3>
<hr size="3">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSESS0265">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">
  
  <INPUT TYPE=HIDDEN name="E01REQTYP" value="<%= userPO.getHeader1().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQORD" value="<%= userPO.getHeader2().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQFRM" value="<%= userPO.getHeader3().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDFD" value="<%= userPO.getHeader4().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDFM" value="<%= userPO.getHeader5().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDFY" value="<%= userPO.getHeader6().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDTD" value="<%= userPO.getHeader7().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDTM" value="<%= userPO.getHeader8().trim() %>">
  <INPUT TYPE=HIDDEN name="E01REQDTY" value="<%= userPO.getHeader9().trim() %>">

<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
        <tr id="trdark"> 
            <td nowrap width="10%" align="right">Tipo Legal : </td>
            <td nowrap width="20%" align="left" > <%=legtyp%></td>
            <td nowrap width="10%" align="right">Estado : </td>
			<td nowrap width="60%" align="left" style="color:red;font-size:12;">
				<b><%= msgRecord.getD01STATUS().trim()%> </b>		
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Código :</td>
            <td nowrap width="20%" align="left"><b><%= msgRecord.getH01CUN().trim()%></b></td> 
            <td nowrap width="10%" align="right">Nombre Legal :</td>
			<td nowrap width="60%" align="left"><b><%= msgRecord.getH01NA1().trim()%></b></td>
		</tr>
		<tr id="trdark"> 
            <td nowrap width="10%" align="right">ID : </td>
            <td nowrap width="20%" align="left">
            	<b><%=msgRecord.getH01PID().trim()%> - <%=msgRecord.getH01TID().trim()%> - <%= msgRecord.getH01IDN().trim()%></b>  
			</td>
            <td nowrap width="10%" align="right"></td>
			<td nowrap width="60%" align="left"></td>
		</tr>
        </table>
	</td>
  </tr>
</table>   
<TABLE class="tbenter" width="100%"> 
	<TR>
		<TD align="right" width="34%"></TD>
		<TD align="right" width="33%"><B><U>Criterio de Búsqueda</U></B></TD>
	  	<TD align="CENTER" width="33%"></TD>	  	
	</TR>
	<TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Usuario : </B></TD>
		<TD align="left" width="33%">
			<%=userPO.getHeader3()%>   
		</TD>
	</TR>
    <TR>
		<TD align="CENTER" width="34%"></TD>
		<TD align="right" width="33%"><B>Fechas : </B></TD>
		<TD align="left" width="33%">
		<%  out.println("Desde :" + datapro.eibs.master.Util.formatDate(userPO.getHeader6(),userPO.getHeader5(),userPO.getHeader4()));%> 
		<%  out.println("Hasta :" + datapro.eibs.master.Util.formatDate(userPO.getHeader9(),userPO.getHeader8(),userPO.getHeader7()));%> 
		</TD>
	</TR>
</TABLE> 
  
<TABLE class="tbenter"> 
	<TR>
	  	<TD align="CENTER" class="TDBKG" width="100%">
			<a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a>
	  	</TD>
	</TR>
</TABLE> 

  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
				<th NOWRAP align="center" width="5%"><B> </B></th>
				<th NOWRAP align="center" width="15%"><B>Nombre</B></th>
				<th NOWRAP align="center" width="10%"><B>Identificacion</B></th>
				<th nowrap align="center" width="50%"><B>Resultado</B></th>
				<th nowrap align="center" width="10%"><B>Fecha</B></th>
				<th nowrap align="center" width="10%"><B>Estado</B></th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
        <%
     	  boolean firstTime = true;
		  while (msgList.getNextRow()) {
			msgRecord = (ESS026501Message) msgList.getRecord();
		%>              
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%">
				<input type="radio" id="ROW" name="ROW" value="<%= msgList.getCurrentRow() %>"  class="highlight" onClick="highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/>
			</td>
			<td NOWRAP align="center" width="15%" ><%=msgRecord.getE01CULFNA()%> <%=msgRecord.getE01CULFN2() %> <%=msgRecord.getE01CULLN1()%> <%=msgRecord.getE01CULLN2()%></td>
			<td NOWRAP align="left" width="10%" ><%=msgRecord.getE01CULPID()%> <%= msgRecord.getE01CULTID()%> <%=msgRecord.getE01CULIDN()%></td>
			<td NOWRAP align="left" width="50%" ><%=msgRecord.getE01CULRMK()%></td>
			<td NOWRAP align="center" width="10%" ><%=msgRecord.getE01CULMTM()%></td>
			<td NOWRAP align="center" width="10%" >
				<% if (msgRecord.getE01CULSTA().equals("P")) out.print("Procesado");
				    else if (msgRecord.getE01CULSTA().equals("E")) out.print("Error");
				%>
			</td>
			
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
		int screen = 2;
    	if ( msgList.getShowPrev() ) {
  			int pos = msgList.getFirstRec() - 21;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.security.JSESS0265?SCREEN="+screen + "&H01CUN=" + msgRecord.getH01CUN().trim() + "&FromRecord=" + pos  + "\" > <img src=\""+request.getContextPath()+"/images/s/Regresar.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (msgList.getShowNext()) {
  			int pos = msgList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0092?SCREEN="+screen + "&H01CUN=" + msgRecord.getH01CUN().trim() + "&FromRecord=" + pos + "\" ><img src=\""+request.getContextPath()+"/images/s/Avanzar.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT>
	getElement("TOTROWS").value = <%= i%>;
	getElement("NEXTROWS").value = <%= msgList.getLastRec()%>;
	getElement("CURRROWS").value = <%= msgList.getFirstRec()%>;
</SCRIPT>

</form>
</body>
</html>
