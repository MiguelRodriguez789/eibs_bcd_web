<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="datapro.eibs.master.Util"%>
<%@page import="datapro.eibs.beans.*"%>
<html>
<head><title>Busqueda de Comisiones</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0047Help" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
function enterFields(code,name) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code;
	if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = name;
	
	triggerOnchangeOpener(top.opener.fieldName);

	top.close(); 
}
</script>

</head>

<body>
<h3 align="center">Comisiones</h3>

<%
	if ( ewd0047Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"><b> No hay resultados para su criterio de busqueda </b></div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
    <TABLE class="tableinfoList" align="center" style="width:'95%'">
    <TR id="trdark"> 
			     <th width="15%">Comision</th>
				 <th width="35%">Descripción</th>
				 <th width="25%">Valor</th>
				 <th width="25%">Factor</th>
			  </TR>

    <%
				String arguments;
		        StringBuilder sb = new StringBuilder();
    
                ewd0047Help.initRow();
                while (ewd0047Help.getNextRow()) {
        	        EWD0047DSMessage msg = (EWD0047DSMessage)ewd0047Help.getRecord(); 
		            sb.append("'").append(msg.getEWDCDE()).append("',");
		            sb.append("'").append(msg.getEWDDSC()).append("'");
		            arguments = sb.toString();
    %> 
    <tr>
    	<td nowrap align="center">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDCDE())%>
			</a>
		</td>
    	<td nowrap align="left">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDDSC())%>
			</a>
		</td>
    	<td nowrap align="right">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDCOA())%>
			</a>
		</td>	
    	<td nowrap align="center">
			<a href="javascript:enterFields(<%= arguments%>)">
				<%= Util.formatCell(msg.getEWDMTH().equals("F") ? "FIJO"   :
									  (msg.getEWDMTH().equals("F") ? "PORCENTAJE" :  
									  (msg.getEWDMTH().equals("1") ? "TASA/PERIODO" : 
									  (msg.getEWDMTH().equals("E") ? "ESCALA TRAMOS" : "" ))))%>
			</a>
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