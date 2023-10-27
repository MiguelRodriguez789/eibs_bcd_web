<html>
<head><title>Instrumentos </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "EWD0308Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function enter(code1, code2,code3) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code1;
  	if (isValidObject(form[top.opener.fieldAux1])) {
  		form[top.opener.fieldAux1].value = code2;
  		form[top.opener.fieldAux1].focus();
  	}	
  	if (isValidObject(form[top.opener.fieldAux2])) form[top.opener.fieldAux2].value = code3;
 	top.close();
 }
//-->
</script>
</head>
<body>
<%
	if ( EWD0308Help.getNoResult() ) {
 %>
   		
<h4 align="center">Lista de Instrumentos</h4>
<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <b> No hay resultados para su busqueda</b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   
<TABLE class="tableinfo" align="center" style="width:'95%'">
  <TR id="trdark"> 
    <th >Code </th>
    <th> 
      <div align="left">Descripción </div>
    </th>
    <th>Moneda</th>
    <th> 
      <div align="center">Tipo</div>
    </th>
    <th> 
      <div align="left">Símbolo </div>
    </th>
    <th> 
      <div align="left">ISIN </div>
    </th>
    <th> 
      <div align="left">CUSIP </div>
    </th>
    <th> 
      <div align="left">Estado </div>
    </th>
    <th> 
      <div align="left">Emisor </div>
    </th>
    <th> 
      <div align="left">Fecha de <br>
        Emisión </div>
    </th>
  </tr>
  <%
                EWD0308Help.initRow();
                while (EWD0308Help.getNextRow()) {
                    if (EWD0308Help.getFlag().equals("")) {
                    		out.println(EWD0308Help.getRecord());
                    }
                }
    %> 
</TABLE>
<%
   }  
%>
</body>
</html>