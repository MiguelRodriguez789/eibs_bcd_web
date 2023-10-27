<html>
<head>
<title>Resumen de Operaciones por Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifProd" class= "datapro.eibs.beans.JBList" scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	builtNewMenu(ecif10_i_opt);

</SCRIPT>


</head>

<body>

<SCRIPT> initMenu(); </SCRIPT>

<h3 align="center">Consulta Gerencial<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cif_products.jsp,ECIF010"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECIF010" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="8">
<%
	if ( cifProd.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de búsqueda 
        		</b></font>
        	</div>
      </TD></TR>
   		</TABLE>
<%   		
	}
	else {
%>
  
<table class="tableinfo">
  <tr bgcolor="#FFFFFF" bordercolor="#FFFFFF"> 
      <td nowrap > 
        <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
        <tr>
             <td nowrap width="10%" align="left">  
         			<b><% if (  userPO.getHeader2().trim().equalsIgnoreCase("Lista de Control") ) { %>
   										<img src="<%=request.getContextPath()%>/images/s/blacklist.gif" align="left" >
                         <% } %></b>
             </td>
             <td nowrap width="10%" align="right"> Cliente: </td>
             <td nowrap width="12%" align="left">
         			<%= userPO.getCusNum()%>
             </td>
             <td nowrap width="6%" align="right">Nombre:  </td>
             <td nowrap width="14%" align="left">
         			<%= userPO.getHeader1()%>
             </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
  
  
  <h4>Activos (En Moneda Base)</h4>
  <TABLE class="tableinfo" ALIGN=CENTER>
  <TR><TD>
   <TABLE id="headTable1" >
    <TR id="trdark"> 
      <TH ALIGN=CENTER width="35%" nowrap>Descripción</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Producto</TH>
      <TH ALIGN=CENTER width="5%" nowrap>Banco</TH>
      <TH ALIGN=CENTER width="5%" nowrap>MDA</TH>
      <TH ALIGN=CENTER width="5%" nowrap>N/T</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Principal</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Interes</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Otros</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Total</TH>
    </TR>	
  </TABLE>
  
  <div id="dataDiv1" class="scbarcolor" style="padding:0" >
      <table id="dataTable1" >
    <%
                cifProd.initRow();
                int i=0;
                while (cifProd.getNextRow()) {
                    if (cifProd.getFlag().equals("1")) {
                    		out.println(cifProd.getRecord());              		
   							i++;
                    }
                }
                out.println(userPO.getHeader6());
    %> 
    </table>
  </div>
  </TD>  
</TR>	
</TABLE>

<%
	if ( i > 6 ) {
%>
		<SCRIPT type="text/javascript">
			document.getElementById("dataDiv1").style.height = "120"; 
			document.getElementById("dataDiv1").style.overflowY = "scroll";
		</SCRIPT>	 
<%
	} 
%>



  <h4>Pasivos (En Moneda Base)</h4>
  <TABLE class="tableinfo" ALIGN=CENTER>
  <TR><TD>
  
  <TABLE id="headTable2" >
    <TR id="trdark"> 
      <TH ALIGN=CENTER width="35%" nowrap>Descripción</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Producto</TH>
      <TH ALIGN=CENTER width="5%" nowrap>Banco</TH>
      <TH ALIGN=CENTER width="5%" nowrap>MDA</TH>
      <TH ALIGN=CENTER width="5%" nowrap>N/T</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Principal</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Interes</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Otros</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Total</TH>
    </TR>
    </TABLE>
    
      <div id="dataDiv2" class="scbarcolor" style="padding:0" >
      <table id="dataTable2" >
    <%
                cifProd.initRow();
                int j=0;
                while (cifProd.getNextRow()) {
                    if (cifProd.getFlag().equals("2")) {
                    		out.println(cifProd.getRecord());
                    		j++;
                    }
                }
                out.println(userPO.getHeader7());
    %> 
    </table>
     </div>
    </TD>
    </TR>	
  </TABLE>
  
<%
	if ( j > 6 ) {
%>
		<SCRIPT type="text/javascript">
			document.getElementById("dataDiv2").style.height = "120"; 
			document.getElementById("dataDiv2").style.overflowY = "scroll";
		</SCRIPT>	 
<%
	} 
%>
  
  <SCRIPT type="text/javascript">
   function tableresize() {
     adjustEquTables(getElement('headTable1'), getElement('dataTable1'), getElement('dataDiv1'),0,false);
     adjustEquTables(getElement('headTable2'), getElement('dataTable2'), getElement('dataDiv2'),0,false);
     }
  tableresize();
  window.onresize=tableresize;   
  </SCRIPT>
  
  <h4>Totales (En Moneda Base)</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap>
        
      <table cellspacing=0 cellpadding=2 width="100%" border="0">
        <tr id="trclear"> 
          <td width="16%"> 
            <div align="right"><b>Activos : </b></div>
          </td>
          <td width="16%"><%= userPO.getHeader3() %></td>
          <td width="16%"> 
            <div align="right"><b>Pasivos : </b></div>
          </td>
          <td width="16%"><%= userPO.getHeader4() %></td>
          <td width="20%"> 
            <div align="right"><b>Posici&oacute;n Neta : </b></div>
          </td>
          <td width="16%"><%= userPO.getHeader5() %></td>
        </tr>
      </table>
      </td>
    </tr>
  </table>

<%
  }
%>

  </form>
</body>
</html>
