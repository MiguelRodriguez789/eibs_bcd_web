<html>
<head><title>Moneda Extranjera </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0306Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
function enter(code1, code2) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code1;
  	if (isValidObject(form[top.opener.fieldAux1])) form[top.opener.fieldAux1].value = code2;
  	top.close();
 }
</script>
</head>
<body>
<%
	if ( EWD0306Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> No hay datos que correspondan con su criterio de busqueda </b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th colspan="3">Lista de Agentes de Bolsa</th>
  </tr>
  <TR id="trdark"> 
    <th>
      <div align="left">C�digo de<BR>Agente de Bolsa</div>
    </th>
    <th>
      <div align="center">Nombre</div>
    </th>
    <th>
      <div align="left">N�mero de<br>Tel�fono</div>
    </th>
  </tr>
  <%
                EWD0306Help.initRow();
                while (EWD0306Help.getNextRow()) {
                    if (EWD0306Help.getFlag().equals("")) {
                    		out.println(EWD0306Help.getRecord());
                    }
                }
    %> 
</TABLE>
<%
   }  
%>
</body>
</html>