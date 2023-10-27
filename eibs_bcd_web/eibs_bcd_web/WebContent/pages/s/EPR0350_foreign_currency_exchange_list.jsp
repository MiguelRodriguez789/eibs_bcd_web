<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
 
<%@ page import ="datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>Compraventa Moneda Extranjera</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "mtList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  		scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  function goAction(opt) {
    
    if (opt == "D") {
      ok = confirm("Esta seguro que desea eliminar el registro seleccionado?");
	  if (ok) document.forms[0].submit();
	} else if (opt == "C") { 
		var row = document.forms[0].CURRENTROW.value;   
    	page = "<%=request.getContextPath()%>/pages/s/EPR0350_foreign_currency_exchange_detail.jsp?ROW=" + row;
  		CenterNamedWindow(page,'Information',550,450,2);
	} else if (opt == "L") { 
		var row = document.forms[0].CURRENTROW.value;   
    	page = "<%=request.getContextPath()%>/pages/s/EPR0350_foreign_currency_exchange_maint.jsp?ROW=" + row + "&MNT=1";
  		CenterNamedWindow(page,'Information',550,450,2);
  	} else if (opt == "R") { 
		var row = document.forms[0].CURRENTROW.value;   
    	page = "<%=request.getContextPath()%>/pages/s/EPR0350_foreign_currency_exchange_reject.jsp?ROW=" + row;
  		CenterNamedWindow(page,'Information',550,450,2);
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

<%if (userPO.getHeader10().equals("A")) {%>
<h3 align="center">Compraventa Moneda Extranjera<BR>Aprobacion de Liquidacion de Operaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="foreign_currency_exchange_list, EPR0350"></H3>
<%} else {%>
<h3 align="center">Compraventa Moneda Extranjera<BR>Liquidacion de Operaciones<%if (userPO.getHeader10().equals("D")) {%> Diarias <%} else {%> SPOT <%}%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="foreign_currency_exchange_list, EPR0350"></H3>
<%}%>

<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEPR0350" >

<%if ( mtList.getNoResult() ) {%> 
  <TABLE class="tbenter" width="60%" align=center>
    <TR>
      <TD class=TDBKG width="50%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tbenter" width=100% height=40%>
   	<TR>
      <TD> 
        <div align="center"> 
          <p>
            <b>No existen registros para su criterio de busqueda</b>
          </p>          
        </div>
      </TD>
     </TR>
   </TABLE>
<%}	else {%>
 <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="0"> 
 <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    
 <TABLE class="tbenter" width="100%" align=center>
    <TR>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('C')">Consulta</a> 
        </div>
      </TD>
      <%if (userPO.getHeader10().equals("A")) {%>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('R')">Rechazar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('L')">Aprobar</a> 
        </div>
      </TD>
      <%} else {%>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('D')">Borrar</a> 
        </div>
      </TD>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:goAction('L')">Liquidar</a> 
        </div>
      </TD>
      <%}%>
      <TD class=TDBKG width="25%"> 
        <div align="center"><a href="javascript:checkClose()">Salir</a> </div>
      </TD>
    </TR>
 </TABLE>
  
 <TABLE  id="mainTable" class="tableinfo" >
  <TR> 
    <TD NOWRAP valign=top>
  	 <TABLE id="dataTable" width="100%">
  		<TR id="trdark"> 
  			<TH ALIGN=CENTER ></TH>
    		<TH ALIGN=CENTER >Referencia</TH>
    		<TH ALIGN=CENTER >Operacion</TH>
    		<TH ALIGN=CENTER >Banco</TH>
    		<TH ALIGN=CENTER >Oficina</TH>
    		<TH ALIGN=CENTER >Instrumento</TH>
    		<TH ALIGN=CENTER >Moneda</TH>
    		<TH ALIGN=CENTER >Cliente</TH>
    		<TH ALIGN=CENTER >Monto</TH>
    		<TH ALIGN=CENTER >Estado</TH> 
    		<TH ALIGN=CENTER >Usuario<br>Fecha/Hora <br>Creacion</TH> 
    		<%if (userPO.getHeader10().equals("S")) {%>
    			<TH ALIGN=CENTER >Fecha<br>SPOT</TH> 
    		<%}%>
  		</TR>
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
           datapro.eibs.beans.EPR035001Message msgMT = (datapro.eibs.beans.EPR035001Message) mtList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP width="2%"><input type="radio" name="ROW" value="<%= mtList.getCurrentRow()%>" <%=chk%> onClick="document.forms[0].CURRENTROW.value = this.value;"></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE01REQREF())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE01REQOPN())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE01REQBNK())%></TD>
			<TD NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgMT.getE01REQBRN()) + " - " + Util.formatCell(msgMT.getE01REQBRM())%></TD>
			<TD NOWRAP ALIGN="LEFT"><%=Util.formatCell(msgMT.getE01REQINS()) + " - " + Util.formatCell(msgMT.getE01REQINN())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE01REQCCY())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE01REQCUS())%></TD>
			<TD NOWRAP ALIGN="RIGHT"><%=Util.formatCell(msgMT.getE01REQFEA())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE01REQSTN())%></TD>
			<TD NOWRAP ALIGN="CENTER"><%=Util.formatCell(msgMT.getE01REQCRU()) + "<br>" +  Util.formatDate(msgMT.getE01REQCD1(),msgMT.getE01REQCD2(),msgMT.getE01REQCD3()) + "<br>" + Util.formatCell(msgMT.getE01REQCRT()) %></TD>
    		<%if (userPO.getHeader10().equals("S")) {%>
				<TD NOWRAP ALIGN="CENTER"><%=Util.formatDate(msgMT.getE01REQVD1(),msgMT.getE01REQVD2(),msgMT.getE01REQVD3())%></TD>
    		<%}%>
		</TR>    		
    	<%}%>    
     </TABLE>
    </TD>
   </TR>	
</TABLE>

<SCRIPT type="text/javascript">
  showChecked("ROW");       
</SCRIPT>
<%}%>
</FORM>
</BODY>
</HTML>
