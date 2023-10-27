<html>
<head><title>Treasury </title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBSTreasury.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "EWD0325Help" class= "datapro.eibs.beans.JBList"   scope="session"/>

</head>
<body>
<form>

  <h3 align="center">Tesorer&iacute;a - Contratos en Proceso<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="fe_tod_deals.jsp,EWD0325"> 
  </h3>
<hr size="4">
  <input type=HIDDEN name="totalRow" value="0">
  <%
	if ( EWD0325Help.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center"> <b> <font size="3"><b>No hay resultados que correspondan 
          con su criterio de b&uacute;squeda</b></font></b></div>
      </TD></TR>
   		</TABLE>
<%  
		}
	else {
%>	
   
<p>&nbsp;</p>
<TABLE  id="mainTable" class="tableinfo">
<TR > 
    <TD NOWRAP valign="top" width="100%" >
<TABLE id="headTable" width="100%" >
  <TR id="trdark" style="width: 100%;"> 
            <th width="20%">N&uacute;mero de<BR>
              Referencia</th>
            <th width="35%">Nombre<BR>
              Contraparte</th>
            <th width="10%">Tipo</th>
            <th width="10%">Moneda</th>
            <th width="10%">Monto</th>
            <th width="15%">Identificaci&oacute;n <br>Dealer<BR>
            </th>
  </tr>
  </table>
  <div id="dataDiv1" class="scbarcolor" >
    <table id="dataTable" style="width: 100%;">
  <%
                EWD0325Help.initRow();
				int k = 1;
                while (EWD0325Help.getNextRow()) {
                    if (EWD0325Help.getFlag().equals("")) {
                    		out.println(EWD0325Help.getRecord());
							k ++;
                    }
                }
    %> 
</TABLE>

</div>
</td>
</tr>
</table>
<SCRIPT type="text/javascript">
     document.forms[0].totalRow.value="<%= k %>";
     function resizeDoc() {
       divResize(false);
	   adjustEquTables(getElement('headTable'), getElement('dataTable'), getElement('dataDiv1'), 1, false);
      }

    // resizeDoc();
     
</SCRIPT>
<%
   }  
%>

</form>
</body>
</html>

