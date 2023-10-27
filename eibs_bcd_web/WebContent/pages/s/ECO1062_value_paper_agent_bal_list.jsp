<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO106202Message"%>
<HTML>
<HEAD>
<TITLE>Lista de Stock Adhesivos por Asesor</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtListAgent" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function goAction() {
    document.forms[0].submit();	
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
     //firstTime = false;
 } 
%>

<h3 align="center">Lista de Stock de Adhesivos por Asesor
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_agent_bal_list.jsp,ECO1062">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1062" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="300">  
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" id="CURRENTROW" VALUE="0">    

<%if ( mtListAgent.getNoResult() ) {%> 
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay resultados que correspondan a su criterio de búsqueda</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%} else {%>
 <TABLE class="tbenter" width="60%" align=center>
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction()">Consulta</a></div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a></div>
      </TD>
    </TR>
 </TABLE>
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="5%">&nbsp;</TH>
	    		<TH ALIGN=CENTER width="5%">Banco</TH>
	    		<TH ALIGN=CENTER width="5%">Ofic.</TH>
	    		<TH ALIGN=CENTER width="5%">Cajero<BR>Solic.</TH>
	    		<TH ALIGN=CENTER width="5%">Tipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="17%">Descripcion<br> Tipo</TH>
	    		<TH ALIGN=CENTER width="5%">Sub.<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="18%">Descripcion<br> Subtipo</TH>
	    		<TH ALIGN=CENTER width="11%">Asesor</TH>
	    		<TH ALIGN=CENTER width="5%">Serial</TH>
	    		<TH ALIGN=CENTER width="5%">Doc.<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="5%">Doc.<BR>Final</TH>
	    		<TH ALIGN=CENTER width="5%">Stock</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
     <%
        mtListAgent.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (mtListAgent.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
          ECO106202Message msgMT = (ECO106202Message) mtListAgent.getRecord();
     %>               
		<tr id="dataTable<%= mtListAgent.getCurrentRow() %>">
			<td nowrap align="center" width="5%"><input type="radio" name="CURRCODE" value="<%=mtListAgent.getCurrentRow()%>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtListAgent.getCurrentRow() %>)"/></td>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCCSN())%></TD>			
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="17%"><%=Util.formatCell(msgMT.getE02DOCTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="18%"><%=Util.formatCell(msgMT.getE02DOCSUN())%></TD>
			<TD NOWRAP ALIGN="left" width="11%"><%=Util.formatCell(msgMT.getE02DOCUSR())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCSER())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCINI())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCFIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCBAL())%></TD>
		</TR>    		
    <%}%>    
             </table>
             </div>
             </td>
             </tr>
</table>

<SCRIPT type="text/javascript">
  showChecked("CURRCODE");       
</SCRIPT>
<%}%>
</FORM>
</BODY>
</HTML>
