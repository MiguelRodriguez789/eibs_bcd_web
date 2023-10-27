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
  
function goAction(opt) {
	if (opt == "D") {
    	ok = confirm("Esta seguro que desea eliminar el registro seleccionado?");
	  	if (!ok) {
	  		return
	  	} else {
	  		getElement("ACTION").value = "900";
	  	}	
	}  	
	if (opt == "N") {
  		getElement("ACTION").value = "100";
	} 
	if (opt == "I") {
  		getElement("ACTION").value = "400";
	}  	 	
  	document.forms[0].submit();
}

function goBeneficiaryDetail(row){
    page = webapp + "/servlet/datapro.eibs.trade.JSELC0010?SCREEN=400&ROW"+row;
 	CenterWindow(page,820,600,2);
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

<h3 align="center">Consulta de Beneficiarios
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="beneficiary_list.jsp, ELC0010">
</h3>
<hr size="4">

<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0010" >
<INPUT TYPE=HIDDEN ID="ACTION" NAME="SCREEN" VALUE="200">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="0"> 

<% if ( msgList.getNoResult() ) { %> 	
		<TABLE class="tbenter" width="60%" align=center>
    		<TR> 
      			<%-- <TD class=TDBKG width="50%"><div align="center"><a href="javascript:goAction('N')">Nuevo</a></div></TD>--%>
      			<TD class=TDBKG width="100%"><div align="center"><a href="javascript:checkClose()">Salir</a> </div></TD>
    		</TR>
  		</TABLE>
  		<TABLE class="tbenter" width=100% height=40%>
   			<TR>
      			<TD><div align="center"><p><b>No existen registros para su criterio de busqueda</b></p></div></TD>
     		</TR>
   		</TABLE>
<% 	} else { %>
 		<TABLE class="tbenter" width="100%" align=center>
    		<TR> 
      			<%-- <TD class=TDBKG width="25%"><div align="center"><a href="javascript:goAction('N')">Nuevo</a></div></TD> --%>
      			<%-- <TD class=TDBKG width="25%"><div align="center"><a href="javascript:goAction('M')">Mantenimiento</a></div></TD> --%>
      			<%-- <TD class=TDBKG width="25%"><div align="center"><a href="javascript:goAction('D')">Borrar</a></div></TD> --%>
      			<TD class=TDBKG width="50%"><div align="center"><a href="javascript:goAction('I')">Consula</a></div></TD>
      			<TD class=TDBKG width="50%"><div align="center"><a href="javascript:checkClose()">Salir</a> </div></TD> 
    		</TR>
 		</TABLE>
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
    						<TH ALIGN=CENTER >Direcci�n</TH>
    						<TH ALIGN=CENTER >Ciudad</TH>
    						<TH ALIGN=CENTER >Pa�s del Beneficiario</TH>
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
