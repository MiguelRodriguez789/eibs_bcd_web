<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Procesar Por Demanda</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function setInfo(idx){  
  for ( var i=1; i<document.getElementById("dataTable").rows.length; i++ ) {
       document.getElementById("dataTable").rows[i].className="trnormal";
    }
   document.getElementById("dataTable").rows[idx].className="trhighlight";
   document.getElementById("actRow").value = idx;       
}

function goProcess() {
	document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSERPTSTD?SCREEN=26&ROW=" + getElementChecked("ROW").value;	
	document.forms[0].submit();
			 
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

<h3 align="center">Generar Reportes o Ejecutar Procesos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="report_demand.jsp, EDD0924"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSERPTSTD">

  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="26">
  <INPUT TYPE=HIDDEN NAME="actRow" id="actRow" VALUE="0">
        
<% 	if ( dvList.getNoResult() ) { %>

 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No existen Procesos a ejecutar.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
   	
<% } else { %>
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="javascript:goProcess()">Procesar</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
  </TABLE>

  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER  nowrap width="5%"></TH> 
		      <TH ALIGN=CENTER  nowrap width="40%">Nombre</TH>
		      <TH ALIGN=CENTER  nowrap width="55%">Descripción</TH>
 			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap" valign="top">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
   <%          
          dvList.initRow();               
 				boolean firstTime = true;
				String chk = "";
		        while (dvList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
               EREPORTSTDMessage msgList = (EREPORTSTDMessage) dvList.getRecord();			 
                    
       %>             
                    
		<tr id="dataTable<%= dvList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="ROW" value="<%=dvList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= dvList.getCurrentRow() %>)"/></td>
          <td NOWRAP align="center" width="40%">
          	<%=Util.formatCell(msgList.getE01REPNME())%>
		  </td>		  
		  <td NOWRAP align="left" width="55%">
			<%=Util.formatCell(msgList.getE01REPDSC())%>
		  </td>		  
		</TR>
        <% } %> 
             </table>
             </div>
             </td>
             </tr>
</table>

  <SCRIPT type="text/javascript">     
	 showChecked("ROW");          
  </SCRIPT> 

<BR>

<% } %> 
</form>
</body>
</html>
