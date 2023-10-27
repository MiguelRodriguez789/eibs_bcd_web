<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 
<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Reasignacion de Saldos Papel Valor de Oficina
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
        page = "<%=request.getContextPath()%>/pages/s/EVL0020_value_paper_bal_update_detail_reasigna.jsp?ROW=" + row;   
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


<h3 align="center">Reasignacion de Saldos Papel Valor de Oficina
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_bal_update_reasigna.jsp,EVL0020">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0020" >

<%
	if ( appList.getNoResult() ) {
%> 

  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay saldos de oficina para el usuario</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
  <%   		
	}
	else { 
	
  %>
  
   
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0">
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
     
 <TABLE class="tbenter" width="80%" align=center>
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction()">Reasignar</a> 
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
		<table id="headTable" width="98%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="5%"></TH>
	    		<TH ALIGN=CENTER width="5%">Banco</TH>
	    		<TH ALIGN=CENTER width="5%">Oficina</TH>	
	    		<TH ALIGN=CENTER width="5%">Serial</TH>
	    		<TH ALIGN=CENTER width="10%">Tipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="15%">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="5%">Subtipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="15%">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="10%">Numero<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="10%">Numero<BR>Final</TH>
	    		<TH ALIGN=CENTER width="10%">Saldo</TH>
	    		<TH ALIGN=CENTER width="5%">Lote</TH>
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
                   datapro.eibs.beans.EVL002004Message msgMT = (datapro.eibs.beans.EVL002004Message) appList.getRecord();
     %>               
          <tr id="dataTable<%= appList.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="5%"><input type="radio" name="ROW" id="ROW" value="<%= appList.getCurrentRow() %>" <%=chk%> class="highlight" onClick="document.forms[0].CURRENTROW.value = this.value;" ></td>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%= Util.formatCell(msgMT.getE04BALBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE04BALBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%= Util.formatCell(msgMT.getE04BALSER()) %></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04BALTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="15%"><%=Util.formatCell(msgMT.getE04BALTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE04BALSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="15%"><%=Util.formatCell(msgMT.getE04BALSUN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04BALINI())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04BALFIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04BALBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE04BALLOT())%></TD>
		
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
