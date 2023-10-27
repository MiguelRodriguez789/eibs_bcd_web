<html>
<head>
<title>Resumen de Operaciones por Cliente</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifPos" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<style type="text/css">
<!--[if IE]>
@media print {
  @page {
	width: 8.5in;
	height: 11in;
  	margin: 0.50in 0.50in 0.50in 0.50in;	
  	size: landscape;
  }
  
  table {
  	width: 100% !important;
  	display: table;
  	zoom: 96%;
  }
  body{
  	overflow: visible;
  }
  
  div{
  	float: none !important;
    box-sizing: content-box !important;
  }  

  div.print {
  	page-break-inside: avoid;
  }
  
  div.print table{
  	width: 90% !important;
  }

  input, textarea {
/*  	border: 0 !important;
    border-style: none !important;
    box-shadow: none !important;
    outline: none !important; 
 */  }  
  
  div.print_after {
  	page-break-after: always;
  }
  
  div.print_before {
  	page-break-before: always;
  }
  
  
  div.print_overflow{
   	overflow : visible !important;
   	height: auto !important;
  }
  
  .hiddenDivImg, .TDBKG, .noPrint{
  	visibility: hidden !important;
  }
  
<![endif]-->
}

</style>


<SCRIPT type="text/javascript">

  function goAction(op) {

     document.forms[0].opt.value = op;
     var formLength= document.forms[0].elements.length;
     var ok = false;
     for(n=0;n<formLength;n++)
     {
      	var elementName= document.forms[0].elements[n].name;
      	if(elementName == "ACCNUM") 
      	{
        		if (document.forms[0].elements[n].checked == true) {
					acc = document.forms[0].elements[n].value; 
        		ok = true;
        		break;
        	}
      	}
      }
	  if ( ok ) {
	  	 pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010?SCREEN=10&ACCNUM=" + acc + "&opt=" + op;
	    	 CenterWindow(pg,600,400,2);
       <%--   document.forms[0].submit(); --%>
     }
     else {
			alert("Seleccione una cuenta antes de realizar esta operación");	   
     }

  }

	 builtNewMenu(ecif10_i_opt);

</SCRIPT>


</head>

<BODY>

<SCRIPT> initMenu(); </SCRIPT>

<h3 align="center">Posición del Cliente<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cif_position.jsp,ECIF010"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF010" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="10">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<%
	if ( cifPos.getNoResult() ) {
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

   <TABLE class="tbenter">
    <TR>
    	<TD ALIGN=CENTER class=TDBKG width="33%"> <a href="javascript:goAction(1)" ><b>Consulta</b></a></TD>
    	<TD ALIGN=CENTER class=TDBKG width="33%"> <a href="javascript:goAction(2)" ><b>Estado<br>de Cuenta</b></a></TD>
    	<TD ALIGN=CENTER class=TDBKG width="34%"> <a href="javascript:goAction(3)" ><b>Promedio</b></a></TD>
    </TR>
  </TABLE>
        
<p>
<table class="tableinfo">
  <tr id="trdark"> 
      <td nowrap > 
        <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
        <tr>
             <td nowrap width="10%" align="left">  
         			<b><%= userPO.getHeader2()%></b>
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
<div > 
<h4>Activos (En Moneda Base)</h4>
 <TABLE class="tableinfo" ALIGN=CENTER>
  <TR><TD>
   <TABLE id="headTable1">
     <TR id ="trdark">
      <TH ALIGN=CENTER width="5%" rowspan="2" nowrap></TH>
      <TH ALIGN=CENTER width="40%" colspan="4" nowrap>Cuenta</TH>
      <TH ALIGN=CENTER width="5%" rowspan="2" nowrap>MDA</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Apertura/<br>Vencimiento</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Principal</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Interes</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Otros</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Total</TH>
    </TR>
    <TR id ="trdark"> 
      <TH ALIGN=CENTER width="10%" nowrap>Número</TH>
      <TH ALIGN=CENTER width="5%" nowrap>Tipo</TH>
      <TH ALIGN=CENTER width="15%" nowrap>Descripción</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Status</TH>
    </TR>
  </TABLE>  
     <div id="dataDiv1" class="scbarcolor print_overflow" style="padding:0">
      <table id="dataTable1">
    <%
                cifPos.initRow();
                int i=0;
                while (cifPos.getNextRow()) {
                    if (cifPos.getFlag().equals("1")) {
                    		out.println(cifPos.getRecord());              		
   							i++;
                    }
                }
    %> 
    </table>
  </div>
  </TD>  
</TR>	
</TABLE>
</div>

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
<div> 
<h4>Pasivos (En Moneda Base)</h4>
  <TABLE class="tableinfo">
  <TR>
  <TD>
   <TABLE id="headTable2">
     <TR id ="trdark">
      <TH ALIGN=CENTER width="5%" rowspan="2" nowrap></TH>
      <TH ALIGN=CENTER width="40%" colspan="4" nowrap>Cuenta</TH>
      <TH ALIGN=CENTER width="5%" rowspan="2" nowrap>MDA</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Apertura/<br>Vencimiento</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Principal</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Interes</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Otros</TH>
      <TH ALIGN=CENTER width="10%" rowspan="2" nowrap>Total</TH>
    </TR>
    <TR id ="trdark"> 
      <TH ALIGN=CENTER width="10%" nowrap>Número</TH>
      <TH ALIGN=CENTER width="5%" nowrap>Tipo</TH>
      <TH ALIGN=CENTER width="15%" nowrap>Descripción</TH>
      <TH ALIGN=CENTER width="10%" nowrap>Status</TH>
    </TR>
   </TABLE>   
    <div id="dataDiv2" class="scbarcolor print_overflow" style="padding:0" >
      <table id="dataTable2">
    <%
                cifPos.initRow();
                int j=0;
                while (cifPos.getNextRow()) {
                    if (cifPos.getFlag().equals("2")) {
                    		out.println(cifPos.getRecord());              		
   							j++;
                    }
                }
    %> 
    </table>
  </div>
  </TD>  
</TR>	
</TABLE>
</div>
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

<div class="print"> 
<h4>Totales (En Moneda Base)</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
      <table width="100%">
        <tr id="trclear">
			<td width="14%">
			<div align="right"><b>Activos : </b></div>
			</td>
			<td width="16%"><%= userPO.getHeader3() %></td>
			<td width="14%">
			<div align="right"><b>Pasivos : </b></div>
			</td>
			<td width="16%"><%= userPO.getHeader4() %></td>
			<td width="18%">
			<div align="right"><b>Posici&oacute;n Neta : </b></div>
			</td>
			<td width="22%"><%= userPO.getHeader5() %></td>
		</tr>
      </table>
      </td>
    </tr>
  </table>
</div>
	<div align="center"> 
		<input id="PRINTBTN" class="EIBSBTN" type=button name="Submit" OnClick="doPrint()" value="Imprimir">
	</div>  

<SCRIPT type="text/javascript">
   function tableResize() {
     adjustDifTables('headTable1', 'dataTable1', 'dataDiv1',1,1);
     adjustDifTables('headTable2', 'dataTable2', 'dataDiv2',1,1);
   }
  tableResize();
  window.onresize=tableResize; 

  function doPrint(){
		document.getElementById('PRINTBTN').style.visibility = 'hidden';
	    window.focus();
	    
        if (document.queryCommandSupported("print")) {
	    	document.execCommand('print', false, null);
	    } else {
			window.print();
		}
		document.getElementById('PRINTBTN').style.visibility = 'visible';
		return;
  }
</SCRIPT>
<%
  }
%>

  </form>
</body>
</html>
