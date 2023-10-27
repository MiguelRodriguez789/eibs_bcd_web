<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO106104Message"%>
<HTML>
<HEAD> 
<TITLE>Movimientos de Adhesivos por Oficina</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtListBranch"	class= "datapro.eibs.beans.JBObjList"  		scope="session" />
<jsp:useBean id= "mtListLot" 	class= "datapro.eibs.beans.JBObjList"  		scope="session" />
<jsp:useBean id= "mtListMov" 	class= "datapro.eibs.beans.JBObjList"  		scope="session" />
<jsp:useBean id= "error" 		class= "datapro.eibs.beans.ELEERRMessage"  	scope="session" />
<jsp:useBean id= "userPO" 		class= "datapro.eibs.beans.UserPos"  		scope="session"/>
<jsp:useBean id="currUser"      class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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

<h3 align="center">Movimientos de Adhesivos por Oficina
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_branch_mov_list.jsp,ECO1061">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1061" >
<input type=hidden name="SCREEN" value="300">  

<%if ( mtListMov.getNoResult() ) {%> 
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
 <table class="tableinfo">
   <tr id="trdark"> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
		<tr id="trdark">
			<td nowrap width="40%">
				<div align="right">Tipo Adhesivos:</div>
			</td>
			<td nowrap width="60%">
				<input type="text" name="E04MOVTIP" size="4" maxlength="4" value="<%= userPO.getHeader20() %>" readonly> 
				<input type="text" name="E04MOVTIN" size="35" maxlength="35" value="<%= userPO.getHeader22() %>" readonly> 
			</td>
		</tr>
		<tr id="trdark">
			<td nowrap width="40%">
				<div align="right">Subtipo Adhesivos:</div>
			</td>
			<td nowrap width="60%">
				<input type="text" name="E04MOVSUB" size="4" maxlength="4" value="<%= userPO.getHeader21() %>" readonly> 
				<input type="text" name="E04MOVSUN" size="35" maxlength="35" value="<%= userPO.getHeader23() %>" readonly> 
			</td>
		</tr>
     </table>
    </td>
   </tr>
  </table>

 <br>    
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="8%">Banco</TH>
	    		<TH ALIGN=CENTER width="8%">Oficina</TH>
				<TH ALIGN=CENTER width="8%">Cajero<BR>Solic.</TH>	    		
	    		<TH ALIGN=CENTER width="10%">Serial</TH>
	    		<TH ALIGN=CENTER width="10%">Fecha</TH>
	    		<TH ALIGN=CENTER width="10%">Tipo de<BR>Movimiento</TH>
	    		<TH ALIGN=CENTER width="10%">Documento<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="10%">Documento<BR>Final</TH>
	    		<TH ALIGN=CENTER width="10%">Cantidad</TH>
	    		<TH ALIGN=CENTER width="8%">Oficina<BR>Recibe</TH>
	    		<TH ALIGN=CENTER width="8%">Asesor<BR>Recibe</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
     	<%
        mtListMov.initRow(); 
        while (mtListMov.getNextRow()) {
           ECO106104Message msgMT = (ECO106104Message) mtListMov.getRecord();
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER" width="8%"><%=Util.formatCell(msgMT.getE04MOVBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="8%"><%=Util.formatCell(msgMT.getE04MOVBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="8%"><%=Util.formatCell(msgMT.getE04MOVCSN())%></TD>			
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04MOVSER())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCustomDate(currUser.getE01DTF(),
												msgMT.getBigDecimalE04MOVCDM().intValue(),
												msgMT.getBigDecimalE04MOVCDD().intValue(),
												msgMT.getBigDecimalE04MOVCDY().intValue())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04MOVOPN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04MOVINI())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04MOVFIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE04MOVQTY())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="8%"><%=Util.formatCell(msgMT.getE04MOVRBR())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="8%"><%=Util.formatCell(msgMT.getE04MOVUSR())%></TD>
		</TR>    		
    	<%}%>    
             </table>
             </div>
             </td>
             </tr>
</table>
<%}%>
<p align="center"> 
  <input id="EIBSBTN" type=submit name="Submit" value="Regresar" >
</p>
</FORM>
</BODY>
</HTML>
