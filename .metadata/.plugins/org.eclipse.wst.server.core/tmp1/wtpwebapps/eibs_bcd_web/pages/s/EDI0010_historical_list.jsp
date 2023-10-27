<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.EDI001001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Table Historial</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="list" class="datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">

<% if ( userPO.getPurpose().equals("INQUIRY") ) {
	   if ( userPO.getOption().equals("RT") ) {
%>
		builtNewMenu(rt_i_opt);
<%  } else if ( userPO.getOption().equals("SV") ) { %>
	builtNewMenu(sv_i_opt);
<% } else if (userPO.getOption().equals("CD")){ %>
	builtNewMenu(cd_i_opt);
<% } else if (userPO.getOption().equals("LN")){
	   if ( userPO.getHeader23().equals("G") ||  userPO.getHeader23().equals("V")){
	%>
		builtNewMenu(ln_i_1_opt);
	<%  } else  { %>
		builtNewMenu(ln_i_2_opt);
	<% }
 } else if (userPO.getOption().equals("PV")){
%>
	 builtNewMenu(pv_m_opt);
<%  } else if ( userPO.getOption().equals("CLIENT_P") ) { %>
		builtNewMenu(client_inq_personal_opt);
<%  } else if ( userPO.getOption().equals("CLIENT_C") ) { %>
		builtNewMenu(client_inq_corp_opt);
<%  } else if ( userPO.getOption().equals("LC") ) { %>
		builtNewMenu(lc_i_opt);
<%  } else if ( userPO.getOption().equals("DV") ) {    %>
		builtNewMenu(coll_i_opt);
<%  } else if ( userPO.getOption().equals("CO")) { %>
		builtNewMenu(colla_i_opt);
<%  } 
}%>

initMenu();

</SCRIPT>  

</head>

<body>
<% 

 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Historial de Documentacion
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="historical_list.jsp, EDI0010"></h3>
<hr size="4">
<form>

<%
	if (list.getNoResult()) {
%>
<table class="tbenter" width=100% height=80%>
	<tr>
		<td>
		<div align="center">
			<font size="3">
				<b> No hay resultados que correspondan a su criterio de búsqueda. </b>
			</font>
		</div>
		</td>
	</tr>
</table>
<%
	} else {
	
%>
<br> 
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER width="15%">
		Tabla : 
      </TD>
      <TD ALIGN=LEFT width="5%">
		<%= userPO.getHeader18() %>
      </TD>
      <TD ALIGN=CENTER width="20%">
		Descripción : 
      </TD>
      <TD ALIGN=LEFT width="60%">
		<%= userPO.getHeader19() %>
      </TD>
    </TR>
  </TABLE>
  <TABLE  id="mainTable" class="tableinfo " style="height:500px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="100%">
			<tr id="trdark">
		      <TH ALIGN=CENTER>Secuencia</TH>
		      <TH ALIGN=CENTER>Descripción</TH>
		      <TH ALIGN=CENTER>Frecuencia</TH>
		      <TH ALIGN=CENTER>Status</TH>
		      <TH ALIGN=CENTER>Comentarios</TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%" style="vertical-align: top">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:400px; overflow:auto; vertical-align: top" > 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
		<%
			list.initRow();
				int k = 0;
				boolean firstTime = true;
				String chk = "";
				while (list.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
					EDI001001Message msg = (EDI001001Message) list.getRecord();
		%>
		<tr id="dataTable<%= list.getCurrentRow() %>">
		      <TD NOWRAP ALIGN=CENTER><%= msg.getE01DCISEQ() %></TD>
		      <TD NOWRAP ALIGN=CENTER><%= msg.getE01DCIDES() %></TD>
		      <TD NOWRAP ALIGN=CENTER> 
		        <% if (msg.getE01DCIFRE().equals("M")) out.print("MENSUAL");
		           else if (msg.getE01DCIFRE().equals("B")) out.print("BIMENSUAL"); 
		           else if (msg.getE01DCIFRE().equals("Q")) out.print("CUATRIMESTRAL");
		           else if (msg.getE01DCIFRE().equals("S")) out.print("SEMESTRAL"); 
		           else if (msg.getE01DCIFRE().equals("X")) out.print("SIN VENCIMIENTO");
		           else if (msg.getE01DCIFRE().equals("1")) out.print("CADA UN AÑO");
		           else if (msg.getE01DCIFRE().equals("2")) out.print("CADA DOS AÑOS");
		           else if (msg.getE01DCIFRE().equals("3")) out.print("CADA TRES AÑOS");        
		           else if (msg.getE01DCIFRE().equals("4")) out.print("CADA CUATRO AÑOS");
		           else if (msg.getE01DCIFRE().equals("5")) out.print("CADA CINCO AÑOS");
				   else out.print(""); %>
		      </TD>
		      <TD NOWRAP ALIGN=CENTER>
		        <% if (msg.getE01DCISTA().equals("CO")) out.print("ESCANEADO");
		           else if (msg.getE01DCISTA().equals("NP")) out.print("NO PRESENTADO");
		           else if (msg.getE01DCISTA().equals("")) out.print("INCOMPLETO");
		           else if (msg.getE01DCISTA().equals("PD")) out.print("VENCIDO");
				   else out.print(""); %>	
		      </TD>
		      <TD NOWRAP ALIGN=CENTER>
		      	<A HREF="javascript:GetInfo('<%= msg.getE01DCICOM() %>')">
		      		<img src="<%=request.getContextPath()%>/images/s/info.gif" title="Mas Información" align="middle" border="0"></A>
		      </TD>
		</tr>
		<%      	
		
			}
		%>
             </table>
             </div>
             </td>
             </tr>
</table>

<script type="text/javascript">
function GetInfo(text) {
	if (text.length == 0) text = "SIN COMENTARIOS";
	var pg = "${pageContext.request.contextPath}/pages/s/EDI0010_message_text.jsp?text=" + text;
	CenterNamedWindow(pg, 'Information', 500, 430, 3);           
}

adjustEquTables(getElement('headTable'),getElement('dataTable'), getElement('dataDiv1'),1);
</script>

<% } %>
</form>
</body>
</html>

