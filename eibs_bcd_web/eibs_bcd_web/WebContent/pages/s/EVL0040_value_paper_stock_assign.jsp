<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 
<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Asignacion de Stock de Papel Valor
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT language="javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT language="javascript">
    
  function goAction() {
        	var row = document.forms[0].CURRENTROW.value;   
    	page = "<%=request.getContextPath()%>/pages/s/EVL0040_value_paper_stock_assign_detail.jsp?ROW=" + row;
  		CenterNamedWindow(page,'Information',550,450,2);	
  }
  
</SCRIPT>

</HEAD>

<BODY>

<% 
 String chk = "";
 	
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 } 
%>


<h3 align="center">Asignacion de Stock de Papel Valor a Asesores
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_stock_assign.jsp,EVL0040">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0040" >

<%
	if ( appList.getNoResult() ) {
%> 

  <TABLE class="tbenter" style="width: 1040px">
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay saldos de papel valor para asignar</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else { 
	
  %>
  
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
  <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0">   
 <TABLE class="tbenter" style="width: 1040px">
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction()">Asignar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
   <TABLE  id="mainTable" class="tableinfo" style="height:400px; width:1040px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="10"></TH>
	    		<TH ALIGN=CENTER width="50">Banco</TH>
	    		<TH ALIGN=CENTER width="50">Oficina</TH>
	    		<TH ALIGN=CENTER width="50">Tipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="300">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="50">Subtipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="300">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="50">Cantidad<BR>Disponible</TH>
	    		<TH ALIGN=CENTER width="50">Numero<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="50">Numero<BR>Final</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
     <%
                appList.initRow(); 
                chk = "checked";               
                while (appList.getNextRow()) {
                   datapro.eibs.beans.EVL004001Message msgMT = (datapro.eibs.beans.EVL004001Message) appList.getRecord();
     %>               
          <tr id="dataTable<%= appList.getCurrentRow() %>"> 
			<TD NOWRAP align="CENTER" width="10"><input type="radio" name="ROW" value="<%= appList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER" width="50"><%=Util.formatCell(msgMT.getE01BALBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="50"><%=Util.formatCell(msgMT.getE01BALBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="50"><%=Util.formatCell(msgMT.getE01BALTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="300"><%=Util.formatCell(msgMT.getE01BALTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="50"><%=Util.formatCell(msgMT.getE01BALSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="300"><%=Util.formatCell(msgMT.getE01BALSUN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="50"><%=Util.formatCell(msgMT.getE01BALBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="50"><%=Util.formatCell(msgMT.getE01BALLST())%></TD>
			<TD NOWRAP ALIGN="center" width="50"><%=Util.formatCell(msgMT.getE01BALFIN())%></TD>
		
		</TR>    		
    <%             
    	chk = "";     
       }
    %>    
             </table>
             </div>
             </td>
             </tr>
</table>

<SCRIPT language="JavaScript">
  showChecked("ROW");       
</SCRIPT>

<%   		
	} 
 %>
</FORM>

</BODY>
</HTML>
