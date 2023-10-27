<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="java.util.Iterator"%>
<%@page import="com.datapro.security.UserRegistryEntry"%>
<%@page import="datapro.eibs.master.Util"%>
<html>
<head>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="userList" class="java.util.ArrayList"  scope="session" />

<script type="text/javascript">
function selectField(field){
	try {
		field.focus();
		field.select();
	} catch (e){
	}	
}

function setField(field, value){
	try {
		field.value = value;
		field.onchange();
	} catch(e) {
	}
}

function a(code, desc) {
	var form = top.opener.document.forms[0];
	
	setField(form[top.opener.fieldAux1], desc);
	setField(form[top.opener.fieldName], code);
		
	if (form[top.opener.fieldName].type != "hidden") {
		selectField(form[top.opener.fieldName]);
	} else {
		selectField(form[top.opener.fieldAux1]);
	}  		
	top.close();
}
 
function goSearch() {
	if(document.forms[0].pattern.value != ''){
		var params = "&pattern=" + document.forms[0].pattern.value.toUpperCase();
		window.location.href="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersManagement?SCREEN=11&limit=20" + params;
	} 
}
</script>

</head>

<body>
<form>
<TABLE id="tbhelp" width="95%" ALIGN="CENTER">
	<tr>
		<td nowrap width=30%>
			<div align="center"><b>Búsqueda Rápida : </b></div>
		</td>
		<td nowrap width=70%>
			<input type="text" name="pattern" size=20 maxlength=20>
			<a href="javascript:goSearch()">
			<img src="<%=request.getContextPath()%>/images/search1.gif" align="bottom" border="0"></a>
		</td>
	</tr>
</TABLE>
<p></p>
<%
	String pattern = request.getParameter("pattern");
	if(pattern == null) pattern = "";
	if (userList.isEmpty() ) {
%>
<TABLE class="tbenter" width="95%" ALIGN="CENTER">
	<TR>
		<TD>
		<div align="center"><b>
		<% if (pattern.equals("")) { %>
			No hay criterio de busqueda
		<% } else { %>
			No hay datos que correspondan con su criterio de busqueda
		<% } %>
		</b></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
  <TABLE class="tableinfo" width="95%" ALIGN=CENTER>
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="20%">Id</TH>
      <TH ALIGN=CENTER  nowrap width="80%">Nombre</TH>
    </TR>
     	<%
		Iterator iter = userList.listIterator();
        while (iter.hasNext()) {
			UserRegistryEntry entry = (UserRegistryEntry) iter.next();
		%>
        <TR>
			<td NOWRAP><a href="javascript:a('<%=entry.getUid()%>','<%=entry.getDisplayName()%>')"><%=Util.formatCell(entry.getUid().toUpperCase())%></a></td>
			<td NOWRAP><a href="javascript:a('<%=entry.getUid()%>','<%=entry.getDisplayName()%>')"><%=Util.formatCell(entry.getDisplayName().toUpperCase())%></a></td>
			</TR>   		
		<% } %>   
  </TABLE>
	<%}%>
</form>
<script type="text/javascript">
	document.forms[0].pattern.focus();	
	document.forms[0].pattern.value="<%= pattern %>";
</script>
</body>
</html>
