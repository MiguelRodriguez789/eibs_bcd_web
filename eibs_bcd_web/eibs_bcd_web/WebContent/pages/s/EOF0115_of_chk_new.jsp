<HTML>
<HEAD>
<TITLE> Cheques de Gerencia </TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "ewd0115Help" class= "datapro.eibs.beans.JBList"   scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript">
//<!-- Hide from old browsers
function enter(type , ccy) {
   document.getElementById("E01OFMBNK").value = '01';
   document.getElementById("E01OFMFTY").value = type;
   document.getElementById("E01OFMCCY").value = ccy;
   document.forms[0].submit();
}
//-->
</script>

<BODY onload="MM_preloadImages('<%=request.getContextPath()%>/images/s/approve_over.gif','<%=request.getContextPath()%>/images/s/reject_over.gif')">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEOF0115">
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="200">
  <INPUT TYPE=HIDDEN NAME="E01OFMBNK" id="E01OFMBNK" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01OFMFTY" id="E01OFMFTY" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01OFMCCY" id="E01OFMCCY" VALUE="">
  <h3 align="center">
  
  <% if (userPO.getOption().equals("3"))
  		 out.print("Ingreso Orden de Pago");
 	 else if (userPO.getOption().equals("4")) 	 
 	   		 out.print("Ingreso Cheques de Terceros");
  	 else out.print("Ingreso Cheques Oficiales");
  %>
  
  </h3>
 
  <%
	if ( ewd0115Help.getNoResult() ) {
 %> 
  <TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
   		
<% } else { %>

  <hr size="4">
<br>
<br>
  <table class="tableinfo">
    <tr id="trdark"> 
      <th colspan="4" height="24">
        <div align="left">Formatos :</div>
      </th>
    </tr>
    <tr id ="trdark"> 
      <th width="8%" height="24">Banco</th>
      <th width="8%" height="24">Moneda</th>
      <th width="6%" height="24">Formato </th>
      <th width="78%" height="24">Descripcion</th>
    </tr>

     
    
    <%
                ewd0115Help.initRow();
                while (ewd0115Help.getNextRow()) {
                    if (ewd0115Help.getFlag().equals("")) {
                    		out.println(ewd0115Help.getRecord());
                    }
                }
    %> 

  <% } %> 

</table>   
  
  
  <div align="center"> </div>
</FORM>

</BODY>
</HTML>
