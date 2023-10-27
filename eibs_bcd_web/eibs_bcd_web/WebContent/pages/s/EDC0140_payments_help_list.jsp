<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*,java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Lista de Cuentas a Aprobar
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "appList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
 	function ReturnData(code1, code2) {
 		var form = top.opener.document.forms[0];
  		if (isValidObject(form[top.opener.fieldAux1])) {
  			form[top.opener.fieldAux1].value = code1;
  		}
  		if (isValidObject(form[top.opener.fieldAux2])) {
  			form[top.opener.fieldAux2].value = code2;
  		}
  		top.close();     	
 	}
</SCRIPT>
</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<FORM name="letterOfCreditForm" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEDC0140">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="9">
	<INPUT TYPE=HIDDEN NAME="E02ACTION" value="">	
	<input type=HIDDEN name="E01DCMACC" value="">
	<input type=HIDDEN name="E01PMTNUM" value="">
		
	<H3 align="center">
	Aprobación de Pago/Liquidación
		<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="EDC0140_payments_help_list.jsp">
	</H3>
	<HR size="4">
 
 <%  if (appList.isEmpty()) { %>
  		<p>&nbsp;</p>
  		<TABLE class="tbenter" width="100%" >
    		<TR>
      			<TD><div align="center"><p><b>No hay resultados para su b&uacute;squeda</b></p></div></TD>
			</TR>
    	</TABLE>
<%  } else { %> 
 	<TABLE  id="mainTable" class="tableinfo" width="100%">
		<tr height="5%">
			<td NOWRAP valign="top" width="100%">
				<TABLE id="headTable" width="100%">
		        	<tr id="trdark">
						<TH ALIGN=CENTER nowrap width="10%">Cobranza</TH>
						<TH ALIGN=CENTER nowrap width="5%">Nro.</TH>
						<TH ALIGN=CENTER nowrap width="40%">Cliente</TH>						
						<TH ALIGN=CENTER nowrap width="15%">Monto</TH>
						<TH ALIGN=CENTER nowrap width="10%">Tipo</TH>		
						<TH ALIGN=CENTER nowrap width="10%">Fecha</TH>
						<TH ALIGN=CENTER nowrap width="10%">Usuario</TH>									
		        	</tr>
		        </TABLE>
		    </td>
		</tr>
		<tr height="95%">
			<td NOWRAP valign="top" width="100%">
				<div id="dataDiv1" style="overflow:auto;">
					<table id=dataTable width="100%">
<%
						appList.initRow();
						while (appList.getNextRow()) {
							EDC014001Message msgPart = (EDC014001Message) appList.getRecord();
%>    
							<tr id="dataTable<%= appList.getCurrentRow() %>"> 
								<TD NOWRAP ALIGN="CENTER" width="10%"><A href="javascript:ReturnData('<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>')"><%=Util.formatCell(msgPart.getE01DCMACC())%></A></TD>
								<TD NOWRAP ALIGN="CENTER" width="5%"><A href="javascript:ReturnData('<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>')"><%=Util.formatCell(msgPart.getE01PMTNUM())%></A></TD>
								<TD NOWRAP ALIGN="LEFT" width="40%"><A href="javascript:ReturnData('<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>')"><%=Util.formatCell(msgPart.getE01CUSNA1())%></A></TD>
								<TD NOWRAP ALIGN="CENTER" width="15%"><A href="javascript:ReturnData('<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>')"><%=Util.formatCell(msgPart.getE01MNTPAG())%></A></TD>									
								<TD NOWRAP ALIGN="CENTER" width="10%"><A href="javascript:ReturnData('<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>')"><%=Util.formatCell(msgPart.getE01DSCOPE())%></A></TD>									
								<TD NOWRAP ALIGN="CENTER" width="10%"><A href="javascript:ReturnData('<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>')"><%=Util.formatCell(msgPart.getE01DATEDD() + "/" + msgPart.getE01DATEMM() + "/" + msgPart.getE01DATEYY())%></A></TD>									
								<TD NOWRAP ALIGN="CENTER" width="10%"><A href="javascript:ReturnData('<%= msgPart.getE01DCMACC() %>','<%= msgPart.getE01PMTNUM() %>')"><%=Util.formatCell(msgPart.getH01USERID())%></A></TD>									
							</tr>           
<%						
						}	 
%>						
					</table>
				</div>
			</td>
		</tr>			
	</TABLE>	      	 
 <% } %>
 
</FORM>

</BODY>
</HTML>
