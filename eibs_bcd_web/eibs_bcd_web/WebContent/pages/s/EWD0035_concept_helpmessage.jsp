<html>
<head><title>Busqueda de Conceptos </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "ewd0035Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers
function enter(code1, code2, code3, code4, ccy) {
	//n-1 code2; n-2 code3; n-3 code4
	 var form = top.opener.document.forms[0];
	 
	if (isValidObject(form[top.opener.fieldAux3])) {
		setField(form[top.opener.fieldAux3], code4);
	 	top.opener.fieldAux3 ="";	 
	}		 
	if (isValidObject(form[top.opener.fieldAux1])) {
		setField(form[top.opener.fieldAux1], code2);
		 top.opener.fieldAux1 = "";	 
	}
	if (isValidObject(form[top.opener.fieldAux2])) {
		setField(form[top.opener.fieldAux2], code3);
	 	top.opener.fieldAux2 ="";
	}	

	if (isValidObject(form[top.opener.fieldCCY])) {
		setField(form[top.opener.fieldCCY], ccy);
	}	
	if (isValidObject(form[top.opener.fieldName])) {
		setField(form[top.opener.fieldName], code1);
		 top.opener.fieldName = "";	 
	}
    
	top.close();
 }
//-->
</script>
</head>
<body>
<h3 align="center">Conceptos</h3>

<%
	if ( ewd0035Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
      <div align="center"> <font size="3"><b> No hay resultados para su criterio 
        de busqueda   </b></font></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   <table class="tableinfo" style="width:95%" ALIGN=CENTER>
   		<tr id="trdark">
			 <th>Codigo </th>
			 <th>Descripcion</th>
			 <th>Moneda</th>
			 <th>Cuenta Contable</th>
			</tr>	
			<TR>
			<td><a href="javascript:enter('','','','', '')">NINGUNO</a></td>
			<td><a href="javascript:enter('','','','', '')">NINGUNO</a></td>
			<td><a href="javascript:enter('','','','', '')">NINGUNO</a></td>
			</TR>
<%
                ewd0035Help.initRow();
                while (ewd0035Help.getNextRow()) {
                    if (ewd0035Help.getFlag().equals("")) {
                    		out.println(ewd0035Help.getRecord());
                    }
                }
    %> 

  </TABLE>
<%
   }  
%>
</body>
</html>