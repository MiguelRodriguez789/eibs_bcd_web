<html>
<head><title>Users</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0330Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function enter(code1) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldName])) {
		form[top.opener.fieldName].value = code1;
  		form[top.opener.fieldName].focus();
  	}	
 	top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( EWD0330Help.getNoResult() ) {
 %> 
<div align="center"></div>
<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b>  No hay resultados para su
		criterio de busqueda </b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th>Dealer<BR>
      ID</th>
    <th>Nombre </th>
    <th>Centro de <BR>
      Costo</th>
  </tr>
  <%
                EWD0330Help.initRow();
                while (EWD0330Help.getNextRow()) {
                    if (EWD0330Help.getFlag().equals("")) {
                    		out.println(EWD0330Help.getRecord());
                    }
                }
    %> 
</TABLE>
<%
   }  
%>
</body>
</html>