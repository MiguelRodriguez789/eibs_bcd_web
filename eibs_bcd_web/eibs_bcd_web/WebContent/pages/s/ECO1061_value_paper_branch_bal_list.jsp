<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO106102Message"%>

<HTML>
<HEAD>
<TITLE>Lista de Saldos Adhesivos por Oficina</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtListBranch" class= "datapro.eibs.beans.JBObjList"  scope="session" />
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
} 
%>

<h3 align="center">Lista de Saldos de Adhesivos por Oficina
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_branch_bal_list.jsp, ECO1061">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1061" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">  
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0">    

<%if ( mtListBranch.getNoResult() ) {%> 
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
        <div align="center"><a href="javascript:goAction()"><b>Detalle Oficina</b></a> 
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
	    		<TH ALIGN=CENTER width="5%">Ofic.</TH>
	    		<TH ALIGN=CENTER width="5%">Cajero<BR>Solic.</TH>	    		
	    		<TH ALIGN=CENTER width="5%">Tipo<BR>Adhesivos</TH>
	    		<TH ALIGN=CENTER width="21%">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="5%">Subtipo<BR>Adhesivos</TH>
	    		<TH ALIGN=CENTER width="21%">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="5%">Saldo<BR>Ofic.</TH>
	    		<TH ALIGN=CENTER width="5%">Saldo<BR>Ases.</TH>
	    		<TH ALIGN=CENTER width="5%">Saldo<BR>Total</TH>
	    		<TH ALIGN=CENTER width="5%">Nivel<BR>Minimo</TH>
	    		<TH ALIGN=CENTER width="5%">Cantidad<BR>Pedida</TH>
	    		<TH ALIGN=CENTER width="5%">Cantidad<BR>Asignada</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
        <%
            mtListBranch.initRow(); 
			boolean firstTime = true;
			String chk = "";
            while (mtListBranch.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
               ECO106102Message msgMT = (ECO106102Message) mtListBranch.getRecord();
        %>               
          <tr id="dataTable<%= mtListBranch.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="3%"><input type="radio" name="CURRCODE" value="<%= mtListBranch.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtListBranch.getCurrentRow() %>)" ></td>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=msgMT.getE02LVLBNK()%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=msgMT.getE02LVLBRN()%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=msgMT.getE02LVLCSN()%></TD>			
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=msgMT.getE02LVLTIP()%></TD>
			<TD NOWRAP ALIGN="LEFT" width="21%"><%=Util.formatCell(msgMT.getE02LVLTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02LVLSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="21%"><%=Util.formatCell(msgMT.getE02LVLSUN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02LVLBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02DOCBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02TOTBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02LVLMIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02REQRQT())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE02REQAQT())%></TD>
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
