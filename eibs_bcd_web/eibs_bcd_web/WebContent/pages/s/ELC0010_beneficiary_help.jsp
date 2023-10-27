<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
 
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import = "datapro.eibs.beans.ELC001001Message" %>

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

<h3 align="center">Mantenimiento de Beneficiarios
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="beneficiary_help.jsp, ELC0010">
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
  							<TH ALIGN=CENTER ></TH>
    						<TH ALIGN=CENTER >Rut del Beneficiario</TH>
    						<TH ALIGN=CENTER >Nombre del Beneficiario</TH>
    						<TH ALIGN=CENTER >Dirección</TH>
    						<TH ALIGN=CENTER >Ciudad</TH>
    						<TH ALIGN=CENTER >País del Beneficiario</TH>
    						<TH ALIGN=CENTER >Banco del Beneficiario</TH>
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
          	 				ELC001001Message msg = (ELC001001Message) msgList.getRecord();
%>               
        					<TR>
								<TD NOWRAP width="2%"><input type="radio" name="INDEX" value="<%= msgList.getCurrentRow()%>" <%= chk %> onClick="document.forms[0].ROW.value = this.value;"></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:goBeneficiaryDetail('<%= msgList.getCurrentRow() %>');"><%= Util.formatCell(msg.getE01CUBBID()) %></A></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:goBeneficiaryDetail('<%= msgList.getCurrentRow() %>');"><%= Util.formatCell(msg.getE01CUBNA1()) %></A></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:goBeneficiaryDetail('<%= msgList.getCurrentRow() %>');"><%= Util.formatCell(msg.getE01CUBNA2()+" "+msg.getE01CUBNA3())%></A></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:goBeneficiaryDetail('<%= msgList.getCurrentRow() %>');"><%= Util.formatCell(msg.getE01CUBNA4())%></A></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:goBeneficiaryDetail('<%= msgList.getCurrentRow() %>');"><%= Util.formatCell(msg.getE01CUBCTR())%></A></TD>
								<TD NOWRAP ALIGN="CENTER"><A href="javascript:goBeneficiaryDetail('<%= msgList.getCurrentRow() %>');"><%= Util.formatCell(msg.getE01CUBBBI())%></A></TD>
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
