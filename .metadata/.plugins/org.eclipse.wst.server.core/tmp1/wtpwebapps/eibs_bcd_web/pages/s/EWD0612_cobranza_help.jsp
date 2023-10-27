<%@page import="datapro.eibs.master.Util"%>
<%@page import="datapro.eibs.beans.*"%>

<html>
<head><title>Situacion de Cobranza Help Page</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0612help" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT>
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script>

function enterFields(code,dsc) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldCode])) {
		setField(form[top.opener.fieldCode], code);//Cobranza Code
	}
	if (isValidObject(form[top.opener.fieldDesc])) {
		setField(form[top.opener.fieldDesc], dsc);//Cobranza Desc
	}
	top.close();
 }

</script>
</head>
<body>

<%if ( ewd0612help.getNoResult() ) {%>
	<TABLE class="tbenter" width=100% height=100%>
		<TR>
			<TD> 
			<div align="center"> <font size="3"><b> No hay resultados para su criterio de busqueda  </b></font></div>
			</TD>
		</TR>
	</TABLE>
<%}else {%>	
	<table class="tableinfo" style="width:98%" ALIGN=CENTER>
		<tr id="trdark">
			<th align="center" width="10%">C&oacute;digo</th>
			<th align="left"   width="40%">Descripci&oacute;n</th>
			<th align="center" width="25%" nowrap="nowrap">Dias de Mora Inicio</th>
			<th align="center" width="25%" nowrap="nowrap">Dias de Mora Final</th>
		</tr>
<%
		ewd0612help.initRow();
		int k = 0;
		boolean firstTime = true;
		String chk = "";
		String arguments;
		StringBuilder sb = new StringBuilder();
		while (ewd0612help.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
			EWD0612DSMessage msg = (EWD0612DSMessage) ewd0612help.getRecord();
			sb.append("'").append(msg.getEWDCDE()).append("',");
			sb.append("'").append(msg.getEWDDSC()).append("'");
			arguments = sb.toString();
%>
		<tr>
			<td nowrap align="center">
				<a href="javascript:enterFields(<%= arguments%>)"><%= Util.formatCell(msg.getEWDCDE())%></a>
			</td>
			<td nowrap align="left">
				<a href="javascript:enterFields(<%= arguments%>)"><%= Util.formatCell(msg.getEWDDSC())%></a>
			</td>
			<td nowrap align="center">
				<a href="javascript:enterFields(<%= arguments%>)"><%= Util.formatCell(msg.getEWDDMI())%></a>
			</td>
			<td nowrap align="center">
				<a href="javascript:enterFields(<%= arguments%>)"><%= Util.formatCell(msg.getEWDDMF())%></a>
			</td>
		</tr>
<% 
			sb.setLength(0); // set length of buffer to 0
			sb.trimToSize(); // trim the underlying buffer
		}
%> 
	</TABLE>
<%
		}
%>
</body>
</html>					
		