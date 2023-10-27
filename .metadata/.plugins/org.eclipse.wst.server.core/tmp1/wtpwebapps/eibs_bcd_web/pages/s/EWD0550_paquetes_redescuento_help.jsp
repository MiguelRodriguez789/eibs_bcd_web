<%@page import="datapro.eibs.master.Util"%>
<%@page import="datapro.eibs.beans.EWD0550DSMessage"%>
<html>
<head><title>Paquetes de Redescuento</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0550help" class= "datapro.eibs.beans.JBObjList"   scope="session"/>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT>
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script>

function enterFields(cde,nme) {
  var form = top.opener.document.forms[0];
  if (isValidObject(form[top.opener.fieldCode])) form[top.opener.fieldCode].value = cde; 	//Code
  if (isValidObject(form[top.opener.fieldDesc])) form[top.opener.fieldDesc].value = nme;	//Nmae
  if (typeof form[top.opener.fieldCode].onchange === "function" )form[top.opener.fieldCode].onchange();
  top.close();
}

</script>
</head>
<body>

<% if ( ewd0550help.getNoResult() ) {%>
  <TABLE class="tbenter" width=100% height=100%>
    <TR>
      <TD> 
        <div align="center"> <font size="3"><b> No hay resultados para su criterio de busqueda  </b></font></div>
      </TD>
    </TR>
  </TABLE>
<% } else { %>	
  <table class="tableinfo" style="width:98%" ALIGN=CENTER>
    <tr id="trdark">
      <th align="center" width="20%">C&oacute;digo</th>
      <th align="center" width="40%">Nombre</th>
      <th align="center" width="40%">Entidad</th>
    </tr>
<%
     String arguments;
     StringBuilder sb = new StringBuilder();
     ewd0550help.initRow();
     while (ewd0550help.getNextRow()) {
       EWD0550DSMessage msg = (EWD0550DSMessage)ewd0550help.getRecord(); 
       sb.append("'").append(msg.getEWDCOD()).append("',");
       sb.append("'").append(msg.getEWDNME()).append("'");
       arguments = sb.toString();
%> 
    <tr>
      <td nowrap align="center">
        <a href="javascript:enterFields(<%= arguments%>)">
          <%= Util.formatCell(msg.getEWDCOD())%>
        </a>
      </td>
      <td nowrap align="center">
        <a href="javascript:enterFields(<%= arguments%>)">
          <%= Util.formatCell(msg.getEWDNME())%>
        </a>
      </td>
      <td nowrap align="center">
        <a href="javascript:enterFields(<%= arguments%>)">
          <%= Util.formatCell(msg.getEWDNM1())%>
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
		