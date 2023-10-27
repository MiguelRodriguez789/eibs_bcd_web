<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "datapro.eibs.beans.ELC042001Message" %>

<HTML>
<HEAD>
<TITLE>Declaraciones de Ingreso</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "msgList" 	class= "datapro.eibs.beans.JBObjList"  		scope="session" />
<jsp:useBean id= "error" 	class= "datapro.eibs.beans.ELEERRMessage"  	scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  
function enter(code, amount){
	if (top.opener.code !== "") { top.opener.document.forms[0][top.opener.code].value = code }
	if (top.opener.amount !== "") { top.opener.document.forms[0][top.opener.amount].value = amount }
  	top.close();
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

<h3 align="center">Declaraciones de Ingreso
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="declaration_help.jsp, ELC0420">
</h3>
<hr size="4">

<FORM Method="post" Action="" >

<% if ( msgList.getNoResult() ) { %> 	
  		<TABLE class="tbenter" width=100% height=40%>
   			<TR>
      			<TD><div align="center"><p><b>No existen registros para su criterio de busqueda</b></p></div></TD>
     		</TR>
   		</TABLE>
<% 	} else { %>
 		<TABLE  id="mainTable" class="tableinfo" >
  			<TR> 
    			<TD NOWRAP valign=top>
  	 				<TABLE id="dataTable" width="100%">
  						<TR id="trclear"> 
							<TD NOWRAP ALIGN="CENTER">Cliente: <%= Util.formatCell(userPO.getCusNum()) %></TD>
							<TD NOWRAP ALIGN="CENTER"> - <%= Util.formatCell(userPO.getCusName()) %></TD>
  						</TR>
				     </TABLE>
			    </TD>
		   	</TR>	
     	</TABLE>


 		<TABLE  id="mainTable" class="tableinfo" >
  			<TR> 
    			<TD NOWRAP valign=top>
  	 				<TABLE id="dataTable" width="100%">
  						<TR id="trdark"> 
  							<TH ALIGN=CENTER >Tipo</TH>
    						<TH ALIGN=CENTER >Número DDI/DUS</TH>
    						<TH ALIGN=CENTER >Fecha</TH>
    						<TH ALIGN=CENTER >Monto</TH>
  						</TR>
<%
        				msgList.initRow(); 
						boolean firstTime = true;
						String chk = "";
        				while (msgList.getNextRow()) {
							if (firstTime) {
								firstTime = false;
								chk = "checked";
							} else {
								chk = "";
							}
          	 				ELC042001Message msg = (ELC042001Message) msgList.getRecord();
%>               
        					<TR>
        						<TD NOWRAP ALIGN="CENTER"><A href="javascript:enter('<%= msg.getE01DDINUM() %>', '<%= msg.getE01DDIMTO() %>');"><% if(msg.getE01DDITYP().equals("1")){ %> DIN
        						                                                                                                                <% }else { %> DUS 
        						                                                                                                                <% } %> </A></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:enter('<%= msg.getE01DDINUM() %>', '<%= msg.getE01DDIMTO() %>');"><%= Util.formatCell(msg.getE01DDINUM()) %></A></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:enter('<%= msg.getE01DDINUM() %>', '<%= msg.getE01DDIMTO() %>');"><%= Util.formatCustomDate(currUser.getE01DTF(), msg.getE01DDIFEM(),msg.getE01DDIFED(),msg.getE01DDIFEY())%></A></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:enter('<%= msg.getE01DDINUM() %>', '<%= msg.getE01DDIMTO() %>');"><%= Util.formatCCY(msg.getE01DDIMTO())%></A></TD>
							</TR>    		
<%						} %>    
     				</TABLE>
    			</TD>
   			</TR>	
		</TABLE>

<% } %>

</FORM>
</BODY>
</HTML>
