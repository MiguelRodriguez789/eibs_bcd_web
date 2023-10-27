<html>
<head>
<title>Customer Limits</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "limPos" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
  
  	function goAction(op) {
  		
  		if (op == 2 || op == 3) {
  			if (document.forms[0].date1.value.length == 0) {
            	alert("Un cliente válido debe ser seleccionado");
            	return; 
  			}
  		}
  		
  		document.forms[0].opt.value = op
		document.forms[0].submit();
  	}

	
	function getValor(Customer, Date1, Date2, Date3) {
    	document.forms[0].cust.value = Customer;
		document.forms[0].date1.value = Date1;
		document.forms[0].date2.value = Date2;
    	document.forms[0].date3.value = Date3;
  	}

</SCRIPT>  

</head>

<BODY onLoad="MM_preloadImages('<%=request.getContextPath()%>/images/s/new_over.gif','<%=request.getContextPath()%>/images/s/maintenance_over.gif','<%=request.getContextPath()%>/images/s/exit_over.gif','<%=request.getContextPath()%>/images/s/delete_over.gif')">
<h3 align="center">Mantenimiento de Límites de Clientes</h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSEWD0322S">
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%> 
    
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="opt" value="">
  <input type=HIDDEN name="cust" value="<%= userPO.getCusNum()%>" >
  <input type=HIDDEN name="date1" value="">
  <input type=HIDDEN name="date2" value="">
  <input type=HIDDEN name="date3" value="">
  
<%
	if ( limPos.getNoResult() ) {
%> 
  	<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      		<TD> 
      			<div align="center"> 
          			<p><font size="3"><b> No hay resultados que correspondan con su criterio de b&uacute;squeda </b></font></p>
          			<table class="tbenter" width="100%">
            			<tr> 
              				<td CLASS="TDBKG" align=CENTER> <a href="javascript:goAction(1)" >Nueva</a></td>
              				<td CLASS="TDBKG" align=CENTER> <a href="<%=request.getContextPath()%>/pages/background.jsp" >Salir</a></td>
            			</tr>
          			</table>
          			<p>&nbsp; </p>
        		</div>
      		</TD>
      	</TR>
   </TABLE>
<%   		
	} else {
%> 

	<h4>L&iacute;mites Establecidos</h4>
	<table class="tbenter" width="100%">
 		<tr> 
   			<td CLASS="TDBKG" align=CENTER> <a href="javascript:goAction(1)" >Nueva</a></td>
   			<td CLASS="TDBKG" align=CENTER> <a href="javascript:goAction(2)" >Modificar</a></td>
   			<td CLASS="TDBKG" align=CENTER> <a href="javascript:goAction(3)" >Borrar</a></td>
   			<td CLASS="TDBKG" align=CENTER> <a href="<%=request.getContextPath()%>/pages/background.jsp" >Salir</a></td>
 		</tr>
	</table>
	<br>
  	<table class="tableinfo" align="center">
  		<tr class="trdark"> 
  			<th align=CENTER width="5%" nowrap >&nbsp;</th>
  			<th align=CENTER width="25%" nowrap ><div align="center">Cliente</div></th>
        	<th align=CENTER width="15%" nowrap ><div align="center">Fecha<br>Valor</div></th>
        	<th align=CENTER width="10%" nowrap ><div align="center">Moneda</div></th>
        	<th align=CENTER width="15%" nowrap ><div align="center">Monto<BR>Aprobado</div></th>
        	<th align=CENTER width="15%" nowrap ><div align="center">Monto<BR>Usado</div></th>
        	<th align=CENTER width="15%" nowrap ><div align="center">Monto<BR>Disponible</div></th>
  		</tr>
<%
        limPos.initRow();
        while (limPos.getNextRow()) {
        	out.println(limPos.getRecord());
		}
%>  	
	</table>

	<script type="text/javascript">
		radioClick("CUSTOMER", 0);
	</script>

<%
	}   
%> 
 
</form>

</body>
</html>
