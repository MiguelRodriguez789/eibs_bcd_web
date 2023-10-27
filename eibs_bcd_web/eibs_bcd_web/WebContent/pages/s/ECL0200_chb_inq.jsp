<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Consulta de Chequeras</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "chbList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
function getDetail()
{
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.misc.JSECL0201?SCREEN=3&SELROW=" + document.forms[0].CURRENTROW.value;
	CenterWindow(page,800,600,2);
}

</SCRIPT>  

</head>
<body >
<h3 align="center">Operaciones del Cliente<br>Consulta de Chequeras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chb_inq.jsp, ECL0200"> 
</h3>
<hr size="4">
<% 
	if ( !error.getERRNUM().equals("0")  ) {
		//error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
 
%> 
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.misc.JSECL0201" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="CURRENTROW" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01NROCTA" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01CHEINI" VALUE="">

  <h4>Chequeras del Cliente</h4>     
	<TABLE id="mainTable" class="tableinfo" ALIGN=CENTER>
		<TR> 
			<TD NOWRAP>
				<table id="headTable" width="100%">
					<TR id="trdark"> 
						<th align="center" width="2%"></th>
						<th align="center" width="20%">Número de Cuenta</th>
						<th align="center" width="20%">Nombre del Cliente</th>
						<th align="center" width="10%">Número de<br>Chequera</th>
						<th align="center" width="10%">Cheque<br>Inicial</th>
						<th align="center" width="8%">Cheques<br>Hábiles</th>
					</tr>
					<%
						String accMask = "";
						chbList.initRow();
						boolean firstTime = true;
						String chk = "";
						while (chbList.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
                 			datapro.eibs.beans.ECL0200DSMessage msg = (datapro.eibs.beans.ECL0200DSMessage) chbList.getRecord();
							accMask = msg.getE01NROCTA().substring(0,4) + "XXXXXXXXXXXX" + msg.getE01NROCTA().substring(16,20);
					%> 
					<tr id="trclear"> 
					  <td align="center" nowrap >
					  	  <input type="radio" name="ROW" value="<%= chbList.getCurrentRow()%>" <%=chk%> onClick="document.forms[0].CURRENTROW.value = this.value;">
					  </td>
				      <td align="center" nowrap > 
				          <a href="javascript:document.forms[0].ROW[<%= chbList.getCurrentRow()%>].click();getDetail();"><%= accMask %></a>
				      </td>
				      <td align="center" nowrap >  
				          <a href="javascript:document.forms[0].ROW[<%= chbList.getCurrentRow()%>].click();getDetail();"><%= msg.getE01NOMCLI() %></a>
				      </td>
				      <td align="center" nowrap > 
				          <a href="javascript:document.forms[0].ROW[<%= chbList.getCurrentRow()%>].click();getDetail();"><%= msg.getE01SERIE() %></a>
				      </td>												
				      <td align="center" nowrap > 
				          <a href="javascript:document.forms[0].ROW[<%= chbList.getCurrentRow()%>].click();getDetail();"><%= msg.getE01CHEINI() %></a>
				      </td>												
				      <td align="center" nowrap > 
				          <a href="javascript:document.forms[0].ROW[<%= chbList.getCurrentRow()%>].click();getDetail();"><%= msg.getE01CANHAB() %></a>
				      </td>
					<% } %> 
				</TABLE>
			</TD>
		</TR>	
	</TABLE>

</form>
</body>
</html>
					  	  