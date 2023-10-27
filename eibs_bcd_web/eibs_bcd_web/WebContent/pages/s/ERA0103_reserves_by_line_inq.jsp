<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Consulta Reservas por Linea de Crédito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="msgRT" class="datapro.eibs.beans.ERA010301Message"	scope="session" />
<jsp:useBean id= "ERA0103HELP" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

</SCRIPT>  

</head>

<BODY>
<h3 align="center">Consulta Reservas por Linea de Crédito
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reserves_by_line_inq.jsp, ERAA103"> 
	 </h3>

<hr size="4">
<FORM name="form1" METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0103">
  <p> 
    <input type=HIDDEN name="SCREEN" id="SCREEN" value="800">
    <input type=HIDDEN name="totalRow" id="totalRow" value="0">
    <input type=HIDDEN name="opt" id="opt">
  </p>
  
  <p> 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
     	<%
        ERA0103HELP.initRow(); 
		boolean firstTime = true;
        while (ERA0103HELP.getNextRow()) {
           datapro.eibs.beans.ERA010301Message msg = (datapro.eibs.beans.ERA010301Message) ERA0103HELP.getRecord();
     	%>
   	<table id="headTable" width="100%">
      <tr id="trdark"> 
		   <TH ALIGN=LEFT nowrap width="20%">Linea de Crédito : <%=msg.getE01RESFCL()%></TH>
       		<th align=LEFT nowrap width="10">Número : <%=msg.getE01RESFLN()%></th>
       		<th align=LEFT nowrap width="70%">Nombre Fondo de Garantías : <%=msg.getD01RESCUN()%></th>
 		</tr>
   	</table>
	   	<% break ;}%>

          
  <table class="tbenter" width=100% align=center height="8%">
    <tr> 
      <td class=TDBKG width="25%"> 
        <div align="center"><a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
      </td>
    </tr>
  </table>
  <br>

 <table  id="mainTable" class="tableinfo" ALIGN=CENTER style="width:'100%'" >
    <tr height="5%"> 
    	<td NOWRAP valign="top" width="100%"> 
        	<table id="headTable" width="100%">
           <tr id="trdark"> 
				    <TH ALIGN=CENTER nowrap width="10%">#Reserva</TH>
            		<th align=CENTER nowrap width="10%">Cod. Cliente</th>
            		<th align=CENTER nowrap width="10%">Nombre Cliente</th>
            		<th align=CENTER nowrap width="10%">Oficina</th>
            		<th align=CENTER nowrap width="10%">Estado</th>
            		<th align=CENTER nowrap width="10%">%Cobertura</th>
            		<th align=CENTER nowrap width="10%">Monto Reserva</th>
            		<th align=CENTER nowrap width="10%">Moneda</th>
            		<th align=CENTER nowrap width="10%">#Garantía</th>
          		</tr>
        	</table>
      	</td>
    </tr>    
    <tr height="95%">    
     <td valign="top">       
	    <div id="dataDiv" class="scbarcolor">
    		<table id="dataTable" width="100%" > 
     	<%
        ERA0103HELP.initRow(); 
		firstTime = true;
		String chk = "";
		String level = "";
		int i = 0;
        while (ERA0103HELP.getNextRow()) {
           datapro.eibs.beans.ERA010301Message msg = (datapro.eibs.beans.ERA010301Message) ERA0103HELP.getRecord();
			if (msg.getH01FLGWK1().equals("D")) {
     	%>
			<tr>
			<td NOWRAP nowrap width="10%"><%=msg.getE01RESNRE()%></td>
			<td NOWRAP nowrap width="10%"><%=msg.getE01RESCUN()%></td>
			<td NOWRAP nowrap width="10%"><%=msg.getD01RESCUN()%></td>
			<td NOWRAP nowrap width="10%"><%=msg.getD01RESBRN()%></td>
			<td NOWRAP nowrap width="10%"><%=msg.getE01RESATU()%></td>
			<td NOWRAP nowrap width="10%"><%=msg.getE01RESPCO()%></td>
			<td NOWRAP nowrap width="10%"><%=msg.getE01RESMRE()%></td>
			<td NOWRAP nowrap width="10%"><%=msg.getE01RESCCY()%></td>
			<td NOWRAP nowrap width="10%"><%=msg.getE01RESNGA()%></td>
			</tr>
	   	<%i++;}}%>
              </table>
        	</div>
    	</td>
    </tr>
  </table>

</form>

</body>
<SCRIPT language="JavaScript">
   function resizeDoc() {
	if (document.all["dataTable"]!=null) {
	   adjustEquTables(headTable, dataTable, dataDiv,1,false);
	}
   }
	resizeDoc();
    window.onresize=resizeDoc;
    window.resize=resizeDoc;
</SCRIPT>

</html>
