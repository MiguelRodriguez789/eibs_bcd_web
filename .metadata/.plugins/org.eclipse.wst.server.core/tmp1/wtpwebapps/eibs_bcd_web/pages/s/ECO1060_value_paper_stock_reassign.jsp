<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO106002Message"%>

<HTML>
<HEAD>
<TITLE> Reasignacion de Stock de Adhesivos entre Asesores </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
    
  function goAction() {
        	var row = getElement("CURRENTROW").value;   
    	page = "<%=request.getContextPath()%>/pages/s/ECO1060_value_paper_stock_reassign_detail.jsp?ROW=" + row;
  		CenterNamedWindow(page,'Information',550,450,2);	
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


<h3 align="center">Reasignacion de Stock de Adhesivos entre Asesores
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_stock_reassign.jsp,ECO1060">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1060" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="500">
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 

<% if ( appList.getNoResult() ) { %> 

  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay stock de Adhesivos para asignar</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<% } else { %>
     
 <TABLE class="tbenter" width="100%" align=center>
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
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="3%"></TH>
	    		<TH ALIGN=CENTER width="5%">Banco</TH>
	    		<TH ALIGN=CENTER width="5">Oficina</TH>
	    		<TH ALIGN=CENTER width="5">Cajero<BR>Solic.</TH>
	    		<TH ALIGN=CENTER width="8%">Tipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="16%">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="8%">Subtipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="17%">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="13%">Asesor</TH>
	    		<TH ALIGN=CENTER width="10%">Cantidad<BR>Disponible</TH>
	    		<TH ALIGN=CENTER width="5%">Num.<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="5%">Num.<BR>Final</TH>
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
				boolean firstTime = true;
				String chk = "";
				while (appList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                   ECO106002Message msgMT = (ECO106002Message) appList.getRecord();
     %>               
		<tr id="dataTable<%= appList.getCurrentRow() %>">
			<td nowrap align="center" width="3%"><input type="radio" name="ROW" value="<%=appList.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= appList.getCurrentRow() %>)"/></td>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCCSN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="8%"><%=Util.formatCell(msgMT.getE02DOCTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="16%"><%=Util.formatCell(msgMT.getE02DOCTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="8%"><%=Util.formatCell(msgMT.getE02DOCSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="17%"><%=Util.formatCell(msgMT.getE02DOCSUN())%></TD>
			<TD NOWRAP ALIGN="left" width="13%"><%=Util.formatCell(msgMT.getE02DOCUSR())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE02DOCBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCLST())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCFIN())%></TD>
		
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

<% } %>
</FORM>

</BODY>
</HTML>
