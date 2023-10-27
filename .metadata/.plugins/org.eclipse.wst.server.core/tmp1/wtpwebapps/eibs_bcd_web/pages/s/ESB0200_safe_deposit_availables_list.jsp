<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE></TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(opt) {
    if (opt == "N") {
		document.forms[0].SCREEN.value = '100';
		document.forms[0].submit();  		
	} else if (opt == "M") { 
		document.forms[0].SCREEN.value = '200';
  		document.forms[0].submit();
	} else if (opt == "I") { 
		document.forms[0].SCREEN.value = '300';
  		document.forms[0].submit();
  	} else if (opt == "D") {
      		ok = confirm("Está seguro que desea eliminar este registro?");
		document.forms[0].SCREEN.value = '400';
	  	if (ok) document.forms[0].submit();
  	}
}

</SCRIPT>  

</HEAD>
<BODY>

<% 
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
} 
%>

<h3 align="center">Cajas de Seguridad Disponibles para Alquiler<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="safe_deposit_availables_list, ESB0200"></H3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.safedeposit.JSESB0200" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
 <INPUT TYPE=HIDDEN NAME="bank" VALUE="<%=userPO.getBank()%>">


<%if ( msgList.getNoResult() ) {%> 
  <TABLE class="tbenter" width="60%" align=center>
    <TR>
      <TD class=TDBKG width="50%"> 
        <div align="center" style="cursor:hand" onClick="goAction('N')"><a><b>Crear</b></a></div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay resultados para su criterio de búsqueda</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%}	else {%>
  <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
  
 <TABLE class="tbenter" width="100%" align=center>
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center" style="cursor:hand" onClick="goAction('N')"><a><b>Crear</b></a></div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('M')">Modificar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')">Eliminar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	  			<TH ALIGN=CENTER width="5%"></TH>
	    		<TH ALIGN=CENTER width="20%">No. Caja <BR>
					Seguridad</TH>
	    		<TH ALIGN=CENTER width="25%">Tipo</TH>
	    		<TH ALIGN=CENTER width="25%">Ubicación</TH>
	    		<TH ALIGN=CENTER width="25%">Descripción</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
     	<%
        msgList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (msgList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.ESB020001Message msgPart = (datapro.eibs.beans.ESB020001Message) msgList.getRecord();
     	%>               
		<tr id="dataTable<%= msgList.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" id="ROW" name="ROW" value="<%=msgList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= msgList.getCurrentRow() %>)"/></td>
			<TD NOWRAP ALIGN="CENTER" width="20%"><%=Util.formatCell(msgPart.getE01SBSCOD())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="25%"><%=Util.formatCell(msgPart.getD01SBTDSC())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="25%"><%=Util.formatCell(msgPart.getD01LOCNME())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="25%"><%=Util.formatCell(msgPart.getE01SBSDSC())%></TD>
		</TR>    		
    	<%}%>    
             </table>
             </div>
             </td>
             </tr>
</table>

<SCRIPT type="text/javascript">
  showChecked("ROW");       
</SCRIPT>

<%}%>
</FORM>
</BODY>
</HTML>
