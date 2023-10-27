<html> 
<head>
<title>Reporte de Operaciones Procesadas</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "reportList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
function clickIE() {
	if (document.all) {
		return false;
	}
} 
function clickNS(e) {
	if (document.layers||(document.getElementById&&!document.all)) { 
		if (e.which==2||e.which==3) {
			return false;
		}
	}
}

if (document.layers) {
	document.captureEvents(Event.MOUSEDOWN);
	document.onmousedown=clickNS;
} 
else {
	document.onmouseup=clickNS;
	document.oncontextmenu=clickIE;
} 
document.oncontextmenu=new Function("return false");

</script>
</head>

 <% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<body >
<h3 align="center">Reporte de Operaciones Procesadas
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="operations_report_list.jsp, ECL0210">
</h3>
<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0210" >
  <input type=HIDDEN name="SCREEN" value="">
  <input type=HIDDEN name="opt" value="1">
  <input type=HIDDEN name="totalRow" value="0">
  <input type=HIDDEN name="CURRENTROW" value="">
  
  <%
	if ( reportList.getNoResult() ) {
 %>
  <p>&nbsp;</p><TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su b&uacute;squeda</b></p>
	  </div>
	  </TD>
	</TR>
    </TABLE>
	
  <%  
		}
	else {
%> 
  <br>
  
  <TABLE id=cfTable class="tableinfo">
 <TR > 
    <TD NOWRAP valign="top" width="100%">
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="12%"><div align="center">Fecha<br>Operación</div></th>
            <th align=CENTER nowrap width="20%"><div align="center">Tipo<br>Operación</div></th>
            <th align=CENTER nowrap width="12%"><div align="center">Identificación<br>del Cliente</div></th>
            <th align=CENTER nowrap width="12%"><div align="center">Cuenta/Tarjeta<br>Origen</div></th>
            <th align=CENTER nowrap width="12%"><div align="center">Cuenta/Tarjeta<br>Destino</div></th>
            <th align=CENTER nowrap width="12%"><div align="center">Número<br>del Cheque</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Monto</div></th>
            <th align=CENTER nowrap width="10%"><div align="center">Usuario</div></th>
          </tr>
     	<%
        reportList.initRow(); 
        while (reportList.getNextRow()) {
           datapro.eibs.beans.ECL0210DSMessage msgPart = (datapro.eibs.beans.ECL0210DSMessage) reportList.getRecord();
     	%>               
        <TR>
			<TD NOWRAP ALIGN="CENTER">
				<%=msgPart.getE01FECOPE().substring(6,8)%>/<%=msgPart.getE01FECOPE().substring(4,6)%>/<%=msgPart.getE01FECOPE().substring(0,4)%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<% if (msgPart.getE01TRANSA().equals("1") || msgPart.getE01TRANSA().equals("01")) { out.println("Conformación de Cheques"); }%>
				<% if (msgPart.getE01TRANSA().equals("2") || msgPart.getE01TRANSA().equals("02")) { out.println("Transacciones de Cuentas Conformadas"); }%>
				<% if (msgPart.getE01TRANSA().equals("3") || msgPart.getE01TRANSA().equals("03")) { out.println("Disponibilidad de Saldos (Ctas. Jurídicas)"); }%>
				<% if (msgPart.getE01TRANSA().equals("4") || msgPart.getE01TRANSA().equals("04")) { out.println("Consulta de Saldos"); }%>
				<% if (msgPart.getE01TRANSA().equals("5") || msgPart.getE01TRANSA().equals("05")) { out.println("Consulta de Saldos de Tarjeta de Crédito"); }%>
				<% if (msgPart.getE01TRANSA().equals("6") || msgPart.getE01TRANSA().equals("06")) { out.println("Transferencias entre Cuentas"); }%>
				<% if (msgPart.getE01TRANSA().equals("7") || msgPart.getE01TRANSA().equals("07")) { out.println("Pago de Tarjeta de Crédito"); }%>
				<% if (msgPart.getE01TRANSA().equals("8") || msgPart.getE01TRANSA().equals("08")) { out.println("Avance de Efectivo de Tarjeta de Crédito"); }%>
				<% if (msgPart.getE01TRANSA().equals("9") || msgPart.getE01TRANSA().equals("09")) { out.println("Reemisión de Estado de Cuenta"); }%>
				<% if (msgPart.getE01TRANSA().equals("10")) { out.println("Suspensión de Tarjeta de Débito"); }%>
				<% if (msgPart.getE01TRANSA().equals("11")) { out.println("Activación de Tarjeta de Débito"); }%>
				<% if (msgPart.getE01TRANSA().equals("12")) { out.println("Consulta de Chequeras"); }%>
				<% if (msgPart.getE01TRANSA().equals("13")) { out.println("Detalle de Chequeras"); }%>
				<% if (msgPart.getE01TRANSA().equals("14")) { out.println("Suspensión de Cheques y Chequeras"); }%>
				<% if (msgPart.getE01TRANSA().equals("15")) { out.println("Desbloqueo de Tarjeta de Débito"); }%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CLIENT())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01NROCTA())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01CTADES())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01NRCHIN())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCCY(msgPart.getE01MONTO())%>
			</TD>
			<TD NOWRAP ALIGN="CENTER">
				<%=Util.formatCell(msgPart.getE01USUARI())%>
			</TD>
		</TR>    		
    	<%}%>    
        </table>
    </table>
     
  <%}%>

</form>

</body>
</html>
