<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO106103Message"%>
 
<HTML>
<HEAD> 
<TITLE>Lista de Saldos Adhesivos por Oficina y Lote</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtListBranch"	class= "datapro.eibs.beans.JBObjList"  		scope="session" />
<jsp:useBean id= "mtListLot" 	class= "datapro.eibs.beans.JBObjList"  		scope="session" />
<jsp:useBean id= "error" 		class= "datapro.eibs.beans.ELEERRMessage"  	scope="session" />
<jsp:useBean id= "userPO" 		class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
function goAction(op) {
    getElement("SCREEN").value = op;	
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

<h3 align="center">Lista de Saldos de Adhesivos por Oficina y Lote
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_brlot_bal_list.jsp,ECO1061">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1061" >
<input type=hidden name="SCREEN" id="SCREEN" value="800">  

<%if ( mtListLot.getNoResult() ) {%> 
  <TABLE class="tbenter">
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
<table class="tableinfo">
  <tr id="trdark"> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
		<tr id="trdark">
			<td nowrap width="40%">
				<div align="right">Tipo Adhesivos:</div>
			</td>
			<td nowrap width="60%">
				<input type="text" name="E03BALTIP" size="4" maxlength="4" value="<%= userPO.getHeader20() %>" readonly> 
				<input type="text" name="E03BALTIN" size="35" maxlength="35" value="<%= userPO.getHeader22() %>" readonly> 
			</td>
		</tr>
		<tr id="trdark">
			<td nowrap width="40%">
				<div align="right">Subtipo Adhesivos:</div>
			</td>
			<td nowrap width="60%">
				<input type="text" name="E03BALSUB" size="4" maxlength="4" value="<%= userPO.getHeader21() %>" readonly> 
				<input type="text" name="E03BALSUN" size="35" maxlength="35" value="<%= userPO.getHeader23() %>" readonly> 
			</td>
		</tr>
     </table>
    </td>
   </tr>
  </table>
  
  <br> 
 <TABLE class="tbenter" width="100%" >
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('400')"><b>Consulta</b></a> 
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
	    		<TH ALIGN=CENTER width="10%"></TH>
	    		<TH ALIGN=CENTER width="10%">Banco</TH>
	    		<TH ALIGN=CENTER width="10%">Oficina</TH>
	    		<TH ALIGN=CENTER width="10%">Cajero<BR>Solic.</TH>
	    		<TH ALIGN=CENTER width="10%">Serial</TH>
	    		<TH ALIGN=CENTER width="15%">Numero<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="15%">Numero<BR>Final</TH>
	    		<TH ALIGN=CENTER width="20%">Saldo</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
     	<%
        	mtListLot.initRow(); 
			boolean firstTime = true;
			String chk = "";
            while (mtListLot.getNextRow()) {
				if (firstTime) {
					firstTime = false;
					chk = "checked";
				} else {
					chk = "";
				}
           ECO106103Message msgMT = (ECO106103Message) mtListLot.getRecord();
     	%>               
          <tr id="dataTable<%= mtListLot.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="10%"><input type="radio" name="CURRCODE" value="<%= mtListLot.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtListLot.getCurrentRow() %>)" ></td>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE03BALBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE03BALBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE03BALCSN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%=Util.formatCell(msgMT.getE03BALSER())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE03BALINI())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="15%"><%=Util.formatCell(msgMT.getE03BALFIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="20%"><%=Util.formatCell(msgMT.getE03BALBAL())%></TD>
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
<p align="center"> 
  <input id="EIBSBTN" type=submit name="Submit" value="Regresar" onclick="goAction('200');">
</p>
</FORM>
</BODY>
</HTML>
