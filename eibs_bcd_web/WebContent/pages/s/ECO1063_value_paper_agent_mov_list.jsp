<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO106303Message"%>

<HTML>
<HEAD>
<TITLE>Movimientos de Adhesivos por Asesor</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function goAction() {
    document.forms[0].submit();	
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

<h3 align="center">Movimientos de Adhesivos por Asesor
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_agent_mov_list.jsp,ECO1063">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1063" >

<%if ( mtList.getNoResult() ) {%> 
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No hay movimientos de Adhesivos para su seleccion</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%} else {%>
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0">
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
     
 <TABLE class="tbenter" width="60%" align=center>
    <TR> 
      <TD class=TDBKG width="100%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="5%">Banco</TH>
	    		<TH ALIGN=CENTER width="5%">Ofic.</TH>
	    		<TH ALIGN=CENTER width="5%">Cajero<BR>Solic.</TH>
	    		<TH ALIGN=CENTER width="5%">Tipo<BR>Adhesivos</TH>
	    		<TH ALIGN=CENTER width="13%">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="5%">Subtipo<BR>Adhesivos</TH>
	    		<TH ALIGN=CENTER width="13%">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="5%">Serial</TH>
	    		<TH ALIGN=CENTER width=9%">Fecha</TH>
	    		<TH ALIGN=CENTER width="5%">Tipo de<BR>Movimiento</TH>
	    		<TH ALIGN=CENTER width="5%">Doc.<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="5%">Doc.<BR>Final</TH>
	    		<TH ALIGN=CENTER width="5%">Cantidad</TH>
	    		<TH ALIGN=CENTER width="5%">Oficina<BR>Recibe</TH>
	    		<TH ALIGN=CENTER width="5%">Asesor<BR>Recibe</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
     <%
        mtList.initRow(); 
        while (mtList.getNextRow()) {
           ECO106303Message msgMT = (ECO106303Message) mtList.getRecord();
     %>               
        <TR>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVCSN())%></TD>			
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="13%"><%=Util.formatCell(msgMT.getE03MOVTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="13%"><%=Util.formatCell(msgMT.getE03MOVSUN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVSER())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="9%"><%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),
																					msgMT.getBigDecimalE03MOVCDM().intValue(),
																					msgMT.getBigDecimalE03MOVCDD().intValue(),
																					msgMT.getBigDecimalE03MOVCDY().intValue())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVOPN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVINI())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVFIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVQTY())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVRBR())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE03MOVUSR())%></TD>
		</TR>    		
    <%}%>    
             </table>
             </div>
             </td>
             </tr>
</table>
<%}%>
</FORM>
</BODY>
</HTML>
