<%@page import="datapro.eibs.master.Util"%>
<%@page import="datapro.eibs.beans.*"%>
<html>
<head><title>Contrapartes Help Page</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="EWD0548help" class="datapro.eibs.beans.JBObjList" scope="session"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT>
  setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script>

function enterFields(cod, dsc) {
  var form = top.opener.document.forms[0];
  if (isValidObject(form[top.opener.fieldCode])) {
    setField(form[top.opener.fieldCode], cod);
  }
  if (isValidObject(form[top.opener.fieldDesc])) {
    setField(form[top.opener.fieldDesc], dsc);
  }
  top.close();
 }

</script>
</head>
<body>

<%if ( EWD0548help.getNoResult() ) {%>
  <TABLE class="tbenter" width=100% height=100%>
    <TR>
      <TD> 
        <div align="center"> <font size="3"><b> No hay resultados para su criterio de busqueda  </b></font></div>
      </TD>
    </TR>
  </TABLE>
<% }else { %>  
  <table class="tableinfo" style="width:98%" ALIGN=CENTER>
    <tr id="trdark">
      <th align="center" width="5%">Proyecto</th>
      <th align="left" width="45%">Descripci&oacute;n</th>
      <th align="center" width="20%" nowrap="nowrap">Monto Aprobado</th>
      <th align="center" width="20%" nowrap="nowrap">Monto Disponible</th>
    </tr>
    <% 
       EWD0548help.initRow();
       int k = 0;
       boolean firstTime = true;
       String chk = "";
       String arguments;
       StringBuilder sb = new StringBuilder();
       while (EWD0548help.getNextRow()) {
         if (firstTime) {
           firstTime = false;
           chk = "checked";
         } else {
           chk = "";
         }
         EWD0548DSMessage msg = (EWD0548DSMessage) EWD0548help.getRecord();
         sb.append("'").append(msg.getEWDNUM()).append("',");
         sb.append("'").append(msg.getEWDDSC()).append("'");
         arguments = sb.toString();
    %>
    <tr>
      <td nowrap align="center">
      <a href="javascript:enterFields(<%= arguments%>)">
        <%= Util.formatCell(msg.getEWDNUM())%>
      </a>
    </td>
      <td nowrap align="left">
      <a href="javascript:enterFields(<%= arguments%>)">
        <%= Util.formatCell(msg.getEWDDSC())%>
      </a>
    </td>
    <td nowrap align="center">
      <a href="javascript:enterFields(<%= arguments%>)">
        <%= Util.formatCell(msg.getEWDAPV())%>
      </a>
    </td>
      <td nowrap align="center">
      <a href="javascript:enterFields(<%= arguments%>)">
        <%= Util.formatCell(msg.getEWDMDI())%>
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
    