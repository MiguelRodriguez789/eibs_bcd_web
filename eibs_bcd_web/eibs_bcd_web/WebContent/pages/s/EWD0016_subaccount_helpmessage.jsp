<html>
<head><title>Busqueda de SubCuentas </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0016Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function enter(code) {
var formLength= top.opener.document.forms[0].elements.length;
for(n=0;n<formLength;n++){
var elementName= top.opener.document.forms[0].elements[n].name;
	if(elementName == top.opener.fieldName){
  		top.opener.document.forms[0].elements[n].value = code;
  		break;
	}
 }
top.close();
 }
//-->
</script>
</head>
<body>
<h3 align="center">SubCuentas</h3>

<%
	if ( ewd0016Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio 
        de busqueda  </b></font></div>
      </TD></TR>
   		</TABLE>
<%   		
		}
	else {
%>	
   <table class="tableinfo" style="width:95%" ALIGN=CENTER>
			  <tr id="trdark"> 
			    <th>SubCuenta</th>
			    <th>Nombre</th>
			    <th>Fecha de Cierre</th> 
			</tr>
<%
                ewd0016Help.initRow();
                while (ewd0016Help.getNextRow()) {
                    if (ewd0016Help.getFlag().equals("")) {
                    		out.println(ewd0016Help.getRecord());
                    }
                }
    %> 

  </TABLE>

<%
   }
%>
</body>
</html>						