<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Customer Portfolio - Holders</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "prList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function goProcess() {
	getElement("SCREEN").value="2";
	document.forms[0].submit();
}

function goNew() {
	getElement("SCREEN").value="3";
	document.forms[0].submit();
}

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>
  	builtNewMenu(cus_m_port_opt);
<%
 } else { 
 		if (userPO.getPurpose().equals("APPROVAL")) {
%> 
	builtNewMenu(cus_a_port_opt);
<%
 	} else { 
%>
	builtNewMenu(cus_i_port_opt);
<%      
	}
  }
%> 
  
  
  initMenu();

</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Cliente - Portafolio Titulares - <%= userPO.getPurpose()%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="cus_port_additional_cust.jsp, ESD0089"></h3>
<hr size="4">

<TABLE class="tbenter" width="88%" align="CENTER">
	<TR align="left">
		<TD align="right" height="25" width="14%"><B>Portafolio :</B></TD>
		<TD align="left" height="25" width="34%"> <%= userPO.getCusNum()%> / <%= userPO.getHeader3()%>
		</TD>
	</TR>
</TABLE>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0089">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
  <INPUT TYPE=HIDDEN NAME="actRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TOTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NEXTROWS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="CURRROWS" VALUE="0">

<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
%>

<TABLE class="tbenter">
    <TR>
		<TD align="CENTER" class="TDBKG" width="33%"><A
			href="javascript:goNew()">Nuevo</A>
      </TD>
		<TD align="CENTER" class="TDBKG" width="33%"><A
			href="javascript:goProcess()">Procesar</A>
      </TD>
		<TD align="CENTER" class="TDBKG" width="34%"><A
			href="<%=request.getContextPath()%>/pages/background.jsp">Salir</A></TD>
	</TR>
</TABLE>

<%      
  }
%> 


<% 
	if ( prList.getNoResult() ) {
%>
 	<TABLE class="tbenter" width=100% height=30%">
 		<TR>
      <TD>         
      <div align="center"> <h4 style="text-align:center"> No hay elementos disponibles.</h4> 
      </div>
      </TD></TR>
   	</TABLE>
<%
	}
	else {
%>    
    
  <TABLE class="tableinfo" id="dataTable">
    
        <TR id=trdark>
		<td NOWRAP align="center" width="5%"><b>Eliminar</b></td>
		<td NOWRAP align="center" width="16%"><b>Cliente<br>Número</b></td>
		<td NOWRAP align="left" width="35%"><b>Cliente<br>Nombre</b></td>
		<td NOWRAP align="center" width="9%"><b>Código<br>Relación</b></td>
		<TD nowrap align="center" width="15%"><B>Descripción<BR>Relación</B></TD>
		<td nowrap align="center" width="20%"><b> Tipo</b></td>
	</TR>
 
        <%
    	  int i = 0;
          prList.initRow();    
          while (prList.getNextRow()) {
               ESD008901Message msgList = (ESD008901Message) prList.getRecord();			 
         %>             
          <TR id=trclear>

		<td NOWRAP align="center" width="5%">
			<INPUT type="checkbox"
				name="E01ACT_<%= prList.getCurrentRow() %>" <% if (msgList.getE01CUPTYP().trim().equals("M") ||
 				   userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"))           	
              	  out.print(" disabled"); %> <%if (msgList.getE01ACT().equals("D")) out.print(" checked"); %>>
		</td>

		<td NOWRAP align="center" width="16%">
			<INPUT type="text" <% if ((msgList.getF01CUPCUR().equals("Y") && userPO.getPurpose().equals("APPROVAL")) || 
									   msgList.getE01ACT().equals("D")) out.print("class=\"txtchanged\""); %>
				name="E01CUPCUR_<%= prList.getCurrentRow() %>" value="<%= msgList.getE01CUPCUR() %>" size="10" maxlength="9"
			onkeypress="enterDecimal()"
			<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
					 out.print(" readonly"); %>>
		<% if ((userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) { %>
		<A
			href="javascript:GetCustomerDescIdNP('E01CUPCUR_<%= prList.getCurrentRow() %>','E01CUSNA1_<%= prList.getCurrentRow() %>','')"><IMG
			src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
			align="middle" border="0"> </A> <% } %></td>

		<td NOWRAP align="left" width="35%">
			<INPUT type="text" name="E01CUSNA1_<%= prList.getCurrentRow() %>"
				value="<%= msgList.getE01CUSNA1() %>" size="45" maxlength="45" readonly>
		
		<td NOWRAP align="center" width="9%">
			<INPUT class="context-menu-help" type="text" 
				<% if (msgList.getF01CUPBSX().equals("Y") && userPO.getPurpose().equals("APPROVAL")) out.print("class=\"txtchanged\""); %> 
				name="E01CUPBSX_<%= prList.getCurrentRow() %>" size="2" maxlength="1"
				<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")) { %>
				onmousedown="init(accholdersHelp, this.name, '', '', '', '', '')"
				<% } %>
				value='<%= msgList.getE01CUPBSX()%>' 
				<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")))
						 out.print(" readonly"); %>
			>
		<IMG src="<%=request.getContextPath()%>/images/Check.gif"
			alt="mandatory field" align="bottom"></td>
		<TD nowrap align="left" width="15%">
			<INPUT type="text" name="E01CUPNAM_<%= prList.getCurrentRow() %>"
			value="<%= msgList.getE01CUPNAM() %>" size="20" maxlength="45" readonly>
		</TD>

		<TD nowrap align="center" width="20%"><INPUT type="text"
			name="E01CUPTYP_<%= prList.getCurrentRow() %>"
			value='<% if (msgList.getE01CUPTYP().trim().equals("M"))  out.print("Miembro Principal"); 
					   else out.print("Miembro Adicional"); %>'
			readonly size="12" maxlength="12"></TD>
	</TR>
       <% 
       	 i++; 
        } 
       %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="88%" ALIGN=CENTER>
   	 <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25">
       <%
    	if ( prList.getShowPrev() ) {
  			int pos = prList.getFirstRec() - 51;
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0089?SCREEN=1&FromRecord=" + pos + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
    	} %>
      </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> 
 	  	<%       
    	if (prList.getShowNext()) {
  			int pos = prList.getLastRec();
  			out.print("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.client.JSESD0089?SCREEN=1&FromRecord=" + pos +  "\" ><img src=\""+request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");
	    } %>
  </TD>
 </TR>
 </TABLE>
  
<BR>
<SCRIPT type="text/javascript">
	document.forms[0].TOTROWS.value = <%= i%>;
	document.forms[0].NEXTROWS.value = <%= prList.getLastRec()%>;
	document.forms[0].CURRROWS.value = <%= prList.getFirstRec()%>;
</SCRIPT>
<%      
  }
%> 
</form>
</body>
</html>
