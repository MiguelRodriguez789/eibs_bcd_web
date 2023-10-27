<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="com.datapro.security.RealmEntry"%>
<%@page import="java.util.Iterator"%><html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title>Control Parámetros para Contraseña eIBS</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "realms" class= "java.util.ArrayList"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">


function goAction(op) {
    document.forms[0].purpose.value = op;
    document.forms[0].submit();
}

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

<h3 align="center">Control Parámetros para Contraseña eIBS<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Users_realms_list.jsp"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersManagement">

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="101">
  <INPUT TYPE=HIDDEN NAME="purpose" VALUE="">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
         
<%
	if ( realms.isEmpty() ) {
%>
	<TABLE class="tbenter" width=100% height=30%">
	<TR>
		<TD>         
		<div align="center"> <h4 style="text-align:center"> No hay Resultados para su criterio de Búsqueda. <br>Click Nuevo para Añadir uno</h4> 
		</div>
		</TD>
	</TR>
   	</TABLE>
   	<TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="50%">
		<a href="javascript:goAction('NEW')">Nuevo</a>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="50%">
		<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
	</TABLE>
<%
	}
	else {
%>
  
  <TABLE class="tbenter">
    <TR>
      <TD ALIGN=CENTER class="TDBKG" width="33%">
  		<a href="javascript:goAction('NEW')">Nuevo</a>
      </TD>
      <TD ALIGN=CENTER class="TDBKG" width="33%">
  		<a href="javascript:goAction('MAINTENANCE')">Mantenimiento</a>
      </TD>      
      <TD ALIGN=CENTER class="TDBKG" width="34%">
  		<a href="<%=request.getContextPath()%>/pages/background.jsp">Salir</a>
      </TD>
    </TR>
  </TABLE>
  <TABLE class="tableinfo" id="dataTable">
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="1%"></TH> 
      <TH ALIGN=CENTER  nowrap >Ambiente</TH>
      <TH ALIGN=CENTER  nowrap >Descripción</TH>
    </TR>
    
    <%
		int k = 0;
		boolean firstTime = true;
		String chk = "";
		Iterator iter = realms.listIterator();
        while (iter.hasNext()) {
			RealmEntry entry = (RealmEntry) iter.next();	
			if (firstTime) {
	    		chk = "checked";
				firstTime = false;
			} else {
            	chk = "";
			}	 
       %>             
        <TR>
          <td align="center" nowrap > 
        	<input type="radio" name="realm" <%= chk %> value="<%= entry.getRealm() %>"/>
      	  </td>
          <td NOWRAP align=center>
          	<%=Util.formatCell(entry.getRealm())%>
		  </td>		  
		  <td NOWRAP >
			<%=Util.formatCell(entry.getDescription())%>
		  </td>
		</TR>
		
        <% 
        	k++;
         }
		%> 
  </TABLE>
  <SCRIPT type="text/javascript">     
	document.forms[0].totalRow.value="<%= k %>";
  </SCRIPT> 
<%      
  }
%> 
</form>
</body>
</html>
