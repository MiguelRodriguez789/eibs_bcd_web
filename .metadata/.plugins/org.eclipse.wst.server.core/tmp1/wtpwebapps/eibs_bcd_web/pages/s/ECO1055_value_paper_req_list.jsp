<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO105501Message"%>
<HTML>
<HEAD>
<TITLE>Lista de Pedidos Adhesivos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function goAction(opt) {
    if (opt == "D") {
      ok = confirm("Esta seguro que desea eliminar el registro seleccionado?");
	  if (ok) document.forms[0].submit();
	} else if (opt == "M") { 
        var row = getElementChecked("ROW").value;   
    	page = "<%=request.getContextPath()%>/pages/s/ECO1055_value_paper_req_maint.jsp?ROW=" + row;
  		CenterNamedWindow(page,'Information',500,330,2);
  	} else {
  	    page = "<%=request.getContextPath()%>/pages/s/ECO1055_value_paper_req_new.jsp?NEW=1";
  		CenterNamedWindow(page,'Information',500,300,2);
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

<h3 align="center">Lista de Pedidos de Adhesivos
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_req_list.jsp,ECO1055">
</h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1055" >
 <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">

<%if ( mtList.getNoResult() ) {%> 

  <TABLE class="tbenter" width="60%" >
    <TR> 
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:goAction('N')">Crear</a> 
        </div>
      </TD>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tbenter" >
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No existen registros de pedidos. Haga click en la opcion "Nuevo" para crear un pedido </b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<% } else { %>
     
 <TABLE class="tbenter" width="100%" style="width: 1040px">
    <TR> 
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('N')">Crear</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('M')">Modificar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')">Borrar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
  <TABLE  id="mainTable" class="tableinfo" style="height:400px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
	    		<TH ALIGN=CENTER width="3%">&nbsp;</TH>
	    		<TH ALIGN=CENTER width="5%">Ref.</TH>   
	    		<TH ALIGN=CENTER width="5%">Banco</TH>
	    		<TH ALIGN=CENTER width="5%">Oficina</TH>
				<TH ALIGN=CENTER width="5%">Cajero<BR>Solic.</TH>	    		
	    		<TH ALIGN=CENTER width="5%">Tipo<BR>Adhesivos</TH>
	    		<TH ALIGN=CENTER width="22%">Descripcion Tipo</TH>
	    		<TH ALIGN=CENTER width="5%">Subtipo<BR>Adhesivos</TH>
	    		<TH ALIGN=CENTER width="20%">Descripcion Subtipo</TH>
	    		<TH ALIGN=CENTER width="5%">Cantidad<BR>Solicitada</TH>
	    		<TH ALIGN=CENTER width="20%">Usuario<BR>Fecha/Hora<BR>Creacion</TH> 
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
                   ECO105501Message msgMT = (ECO105501Message) mtList.getRecord();
     %>               
          <tr id="dataTable<%= mtList.getCurrentRow() %>"> 
            <td NOWRAP  align=CENTER width="3%"><input type="radio" name="ROW" value="<%= mtList.getCurrentRow() %>" <%=chk%> class="highlight" onClick="highlightRow('dataTable', <%= mtList.getCurrentRow() %>)" ></td>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQREF()) %></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQBNK())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQBRN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQCSN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQTIP())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="22%"><%=Util.formatCell(msgMT.getE01REQTIN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQSUB())%></TD>
			<TD NOWRAP ALIGN="LEFT" width="25%"><%=Util.formatCell(msgMT.getE01REQSUN())%></TD>
			<TD NOWRAP ALIGN="CENTER" width="5%"><%=Util.formatCell(msgMT.getE01REQRQT())%></TD>
		    <TD NOWRAP ALIGN="left" width="20%"><%=Util.formatCell(msgMT.getE01REQCRU()) + "<br>" +  
		    											Util.formatCustomDate(currUser.getE01DTF(),
						            						msgMT.getBigDecimalE01REQCDM().intValue(),
						            						msgMT.getBigDecimalE01REQCDD().intValue(),
						            						msgMT.getBigDecimalE01REQCDY().intValue())+ "<br>" +
						            											 Util.formatCell(msgMT.getE01REQCRT()) %></TD>
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
