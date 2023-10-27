<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO106001Message"%>

<HTML>
<HEAD>
<TITLE>Asignacion de Stock de Adhesivos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  
function setRow(table, row) {
	highlightRow(table, row);
	document.forms[0].CURRENTROW.value = row;
}

function goAction() {
	var row = getElement("CURRENTROW").value;   
	page = "<%=request.getContextPath()%>/pages/s/ECO1060_value_paper_stock_assign_detail.jsp?ROW=" + row;
	CenterNamedWindow(page,'Information',550,400,2);	
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
<h3 align="center">Asignacion de Stock de Adhesivos a Asesores
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_stock_assign.jsp,ECO1060">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1060" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="400">
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0"> 

<% if ( appList.getNoResult() ) { %> 

  <TABLE class="tbenter" >
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay saldos de Adhesivos para asignar</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<% } else { %>
    
 <TABLE class="tbenter" >
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
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="3%"></TH>
	    		<TH ALIGN=CENTER width="3%">Banco</TH>
	    		<TH ALIGN=CENTER width="5%">Oficina</TH>
				<TH ALIGN=CENTER width="5%">Cajero<BR>Solic.</TH>	    		
	    		<TH ALIGN=CENTER width="10%">Tipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="24%">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="10%">Subtipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="20%">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="10%">Cantidad<BR>Disponible</TH>
	    		<TH ALIGN=CENTER width="5%">Numero<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="5%">Numero<BR>Final</TH>
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
					ECO106001Message msgMT = (ECO106001Message) appList.getRecord();
     %>               
          <tr id="dataTable<%= appList.getCurrentRow() %>"> 
			<td NOWRAP ALIGN=CENTER width="3%"><input type="radio" name="ROW" value="<%= appList.getCurrentRow() %>" <%=chk%> class="highlight" onClick="setRow('dataTable', <%= appList.getCurrentRow() %>)" ></td>
			<TD NOWRAP ALIGN="CENTER" width="3%"><%=Util.formatCell(msgMT.getE01BALBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01BALBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01BALCSN())%></TD>			
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01BALTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="24%"><%=Util.formatCell(msgMT.getE01BALTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01BALSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="20%"><%=Util.formatCell(msgMT.getE01BALSUN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE01BALBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01BALLST())%></TD>
			<TD NOWRAP ALIGN="center" width="5%"><%=Util.formatCell(msgMT.getE01BALFIN())%></TD>
		
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
<% }  %>
</FORM>

</BODY>
</HTML>
