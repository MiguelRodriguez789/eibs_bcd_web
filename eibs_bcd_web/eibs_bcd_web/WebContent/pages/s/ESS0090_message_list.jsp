<HTML>
<HEAD>
<TITLE>
Lista de Clientes
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<%@page import="datapro.eibs.beans.JBObjList"%>
<%@page import="datapro.eibs.master.Util"%>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" /> 

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
  function setMsg(row, app, msg) {
		document.forms[0].appCode.value = app;
		document.forms[0].msgCode.value = msg;
		parent.msgText.window.location.href="<%=request.getContextPath()%>/pages/s/ESS0090_message_text.jsp?row=" + row;

  }
</script>

<BODY >

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESS0090" target="main">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<INPUT TYPE=HIDDEN NAME="appCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="msgCode" VALUE="">
<INPUT TYPE=HIDDEN NAME="reason" VALUE="">

<%
	JBObjList msgList = (JBObjList)request.getSession(false).getAttribute("msgList");
	if ( msgList.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de búsqueda 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
<%   		
	} else {
%>

  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER rowspan="2"></TH>
      <TH ALIGN=CENTER colspan="3">Referido a</TH>
      <TH ALIGN=CENTER colspan="3">Originado</TH>
    </TR>
    <TR id="trdark"> 
      <TH ALIGN=CENTER>C&oacute;digo</TH>
      <TH ALIGN=CENTER>Cliente</TH>
      <TH ALIGN=CENTER>Cuenta</TH>
      <TH ALIGN=CENTER>Por</TH>
      <TH ALIGN=CENTER>Fecha</TH>
      <TH ALIGN=CENTER>Hora</TH>
    </TR>
    <%
			msgList.initRow(); 
			while (msgList.getNextRow()) {
				datapro.eibs.beans.ESS009002Message msgPart = (datapro.eibs.beans.ESS009002Message) msgList.getRecord();
    %> 
	<TR>
		<TD nowrap="nowrap">
			<INPUT type="radio" name="ROW" value="<%=msgList.getCurrentRow()%>" <%=msgList.getCurrentRow() == 0 ? " checked" : ""%>
			onClick="setMsg('<%=msgList.getCurrentRow()%>','<%= msgPart.getE02MSGACD() %>','<%= msgPart.getE02MSGCOD().trim() %>')">
		</TD>
		<TD nowrap="nowrap"><%=Util.formatCell(msgPart.getE02MSGACD())%></TD>
		<TD nowrap="nowrap"><%=Util.formatCell(msgPart.getE02MSGCUN())%></TD>
		<TD nowrap="nowrap"><%=Util.formatCell(msgPart.getE02MSGACC())%></TD>
		<TD nowrap="nowrap"><%=Util.formatCell(msgPart.getE02MSUSSM())%></TD>
		<TD nowrap="nowrap"><%=Util.formatCustomDate(currUser.getE01DTF(),
	  			msgPart.getBigDecimalE02MSGIDM().intValue(),
	  			msgPart.getBigDecimalE02MSGIDD().intValue(),
	  			msgPart.getBigDecimalE02MSGIDY().intValue()) %></TD>
		<TD nowrap="nowrap"><%=Util.formatTime(msgPart.getE02MSGITM())%></TD>
	</TR>
	<%
		}
	%>    
  </TABLE>
  <script type="text/javascript">
  	showChecked("ROW");
  </script>

<%
  }
%>

</FORM>

</BODY>
</HTML>
