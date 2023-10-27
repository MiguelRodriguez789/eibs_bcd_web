<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO105901Message"%>

<HTML>
<HEAD>
<TITLE>Lista de Reversion de Ingreso Manual Adhesivos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
  
  function goAction(opt) {
    
    if (opt == "R") {
      ok = confirm("Esta seguro que desea reversar el movimiento seleccionado?");
	  if (ok) document.forms[0].submit();
	} 
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


<h3 align="center">Lista de Reversion de Ingreso Manual Adhesivos
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_mov_rev_list.jsp,ECO1059">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1059" >
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

<% if ( mtList.getNoResult() ) { %> 
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
  <% } else { %>    
  
 <TABLE class="tbenter" width="100%" align=center>
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('R')">Reversar</a> 
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
	    		<TH ALIGN=CENTER width="5%">Tipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="21%">Descripcion<br> Tipo</TH>
	    		<TH ALIGN=CENTER width="5%">Subtipo<BR>Papel<BR>Valor</TH>
	    		<TH ALIGN=CENTER width="21%">Descripcion<br> Subtipo</TH>
	    		<TH ALIGN=CENTER width="5%">Serial</TH>
	    		<TH ALIGN=CENTER width="5%">Doc.<BR>Inicial</TH>
	    		<TH ALIGN=CENTER width="5%">Doc.<BR>Final</TH>
	    		<TH ALIGN=CENTER width="5%">Cantidad</TH>
	    		<TH ALIGN=CENTER width="10%">Fecha<BR>Creacion</TH> 
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
				boolean firstTime = true;
				String chk = "";
				while (mtList.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
                   ECO105901Message msgMT = (ECO105901Message) mtList.getRecord();
     %>               
          <tr id="dataTable<%= mtList.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="3%"><input type="radio" name="ROW" value="<%= mtList.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtList.getCurrentRow() %>)" ></td>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01MOVBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01MOVBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01MOVCSN())%></TD>			
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01MOVTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="21%"><%=Util.formatCell(msgMT.getE01MOVTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01MOVSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="21%"><%=Util.formatCell(msgMT.getE01MOVSUN())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="5%"><%=Util.formatCell(msgMT.getE01MOVSER())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="5%"><%=Util.formatCell(msgMT.getE01MOVINI())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="5%"><%=Util.formatCell(msgMT.getE01MOVFIN())%></TD>
			<TD NOWRAP ALIGN="RIGHT" width="5%"><%=Util.formatCell(msgMT.getE01MOVQTY())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="10%"><%= Util.formatCustomDate(currUser.getE01DTF(),
						            						msgMT.getBigDecimalE01MOVCDM().intValue(),
						            						msgMT.getBigDecimalE01MOVCDD().intValue(),
						            						msgMT.getBigDecimalE01MOVCDY().intValue())%></TD>
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
