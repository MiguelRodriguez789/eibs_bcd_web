<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 
<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Lista de Saldos Papel Valor por Oficina</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtListBranch" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<SCRIPT language="javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT language="javascript">
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

<h3 align="center">Lista de Saldos de Papel Valor por Oficina
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_branch_bal_list.jsp, EVL0050">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.valuepaper.JSEVL0050" >

<%if ( mtListBranch.getNoResult() ) {%> 
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay resultados que correspondan a su criterio de b�squeda</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%} else {%>
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="300">  
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0">    
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
 
   <TABLE  id="mainTable" class="tableinfo" style="height:150px; width:1040px;">
   <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER nowrap width="40"></TH>
		      	<TH ALIGN=CENTER nowrap width="40">Banco</TH>
	    		<TH ALIGN=CENTER nowrap width="50">Ofic.</TH>
	    		<TH ALIGN=CENTER nowrap width="50">Tipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER nowrap width="500">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER nowrap width="40">Subtipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER nowrap width="500">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER nowrap width="40">Saldo<BR>Ofic.</TH>
	    		<TH ALIGN=CENTER nowrap width="40">Saldo<BR>Ases.</TH>
	    		<TH ALIGN=CENTER nowrap width="40">Saldo<BR>Total</TH>
	    		<TH ALIGN=CENTER nowrap width="40">Nivel<BR>Minimo</TH>
	    		<TH ALIGN=CENTER nowrap width="40">Cantidad<BR>Pedida</TH>
	    		<TH ALIGN=CENTER nowrap width="40">Cantidad<BR>Asignada</TH>
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
               datapro.eibs.beans.EVL005002Message msgMT = (datapro.eibs.beans.EVL005002Message) mtListBranch.getRecord();
        %>               
          <tr id="dataTable<%= mtListBranch.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER nowrap width="10"><input type="radio" name="CURRCODE" id="CURRCODE" value="<%= mtListBranch.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtListBranch.getCurrentRow() %>)" ></td>
			<TD NOWRAP ALIGN="CENTER" nowrap width="30"><%=Util.formatCell(msgMT.getE02LVLBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="30"><%=Util.formatCell(msgMT.getE02LVLBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="30"><%=Util.formatCell(msgMT.getE02LVLTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" nowrap width="250"><%=Util.formatCell(msgMT.getE02LVLTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="30"><%=Util.formatCell(msgMT.getE02LVLSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" nowrap width="250"><%=Util.formatCell(msgMT.getE02LVLSUN())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="20"><%=Util.formatCell(msgMT.getE02LVLBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="20"><%=Util.formatCell(msgMT.getE02DOCBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="30"><%=Util.formatCell(msgMT.getE02TOTBAL())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="30"><%=Util.formatCell(msgMT.getE02LVLMIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="30"><%=Util.formatCell(msgMT.getE02REQRQT())%></TD>
			<TD NOWRAP ALIGN="CENTER" nowrap width="30"><%=Util.formatCell(msgMT.getE02REQAQT())%></TD>
		</TR>
		<%}%>   		
             </table>
             </div>
             </td>
             </tr>
</table>

<SCRIPT language="JavaScript">
	showChecked("CURRCODE");
</SCRIPT>
<%}%>
</FORM>
</BODY>
</HTML>
