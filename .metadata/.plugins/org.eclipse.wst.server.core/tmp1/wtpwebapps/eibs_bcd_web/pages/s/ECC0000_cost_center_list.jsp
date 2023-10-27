<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Cost Center List</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "ccList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">


function goAction(op) {
    document.forms[0].opt.value = op;
    if (document.forms[0].opt.value == "D") {
    	document.forms[0].SCREEN.value = 5;    	
    	confirm("Desea eliminar este registro seleccionado?"); 
		document.forms[0].submit();		
    	
    }
    document.forms[0].submit();
}

function setInfo(ccn, bnk, dsc, grp, sbr) {
    document.forms[0].CCN.value = ccn;
    document.forms[0].BNK.value = bnk;
    document.forms[0].DSC.value = dsc;
    document.forms[0].GRP.value = grp;
    document.forms[0].SBR.value = sbr;
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

<h3 align="center">Mantenimiento de Centros de Costo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cost_center_list.jsp, ECC0000"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSECC0000">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="3">
  <INPUT TYPE=HIDDEN NAME="opt" VALUE="">
  <INPUT TYPE=HIDDEN NAME="BNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="CCN" VALUE="">
  <INPUT TYPE=HIDDEN NAME="DSC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="GRP" VALUE="">
  <INPUT TYPE=HIDDEN NAME="SBR" VALUE="">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
         
<%
	if ( ccList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center">No hay centros de costo para este banco. <br>Haga clic en Nuevo para agregar uno.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
   		<a href="javascript:goAction('N')">Crear</a>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
  </TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<a href="javascript:goAction('N')">Crear</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<a href="javascript:goAction('M')">Modificar</a>
      </TD>  
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<a href="javascript:goAction('D')">Borrar</a>
      </TD>     
      <TD ALIGN=CENTER class="TDBKG" width="25%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
  </TABLE>
  
  <table  id=cfTable class="tableinfo" height="70%">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="95%"> 
		<table id="headTable" width="100%">
    <TR id="trdark">
      <TH ALIGN="center"  nowrap width="10%"></TH> 
      <TH ALIGN="center"  nowrap width="10%">Centro de Costo</TH>
      <TH ALIGN="center"  nowrap width="40%">Descripción</TH>
 	   <TH ALIGN="center"  nowrap width="20%">Grupo</TH>
      <TH ALIGN="center"  nowrap width="20%">Sub-Grupo</TH>      
    </TR>
        </table>
      </td>
    </tr>    
    
	  <tr  height="95%">    
	    <td nowrap="nowrap">       
	       <div id="dataDiv1" style="height:100%; overflow:auto;">  
	       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
    
    <%
          ccList.initRow();  
          boolean firstTime = true;  
          String chk = "";  
          while (ccList.getNextRow()) {
               if (firstTime) {
	               	firstTime = false;
	               	chk = "checked";
               } else {
               		chk = "";
               }	
               ECC000001Message msgList = (ECC000001Message) ccList.getRecord();		
               
       %>             
       <tr id="dataTable<%= ccList.getCurrentRow() %>">
          <td nowrap align="center" width="10%"> 
        	<input type="radio" name="ROW1" <%=chk%> value="<%= ccList.getCurrentRow() %>" class="highlight" onClick="highlightRow('dataTable', <%= ccList.getCurrentRow() %>)" onClick="setInfo('<%= msgList.getE01CCDCCN()%>', '<%= msgList.getE01CCDBNK() %>', '<%= msgList.getE01CCDCCD() %>', '<%= msgList.getE01CCDGRP() %>', '<%= msgList.getE01CCDSBR() %>')" >
      	  </td>
          <td NOWRAP align="center" width="10%">
          	<%=msgList.getE01CCDCCN()%>
		  </td>		  
		  <td NOWRAP align="left" width="35%">
			<%=msgList.getE01CCDCCD()%>
		  </td>		  
		  <td NOWRAP align="center" width="20%">
          	<%=msgList.getE01CCDGRP()%>
		  </td>
		  <td NOWRAP align="center" width="20%">
          	<%=msgList.getE01CCDSBR()%>
		  </td>
		</TR>
		
        <%         	
         }
         %> 
             </table>
             </div>
             </td>
             </tr>
         
  </TABLE>
  <SCRIPT type="text/javascript">     
  	showChecked("ROW1");
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
