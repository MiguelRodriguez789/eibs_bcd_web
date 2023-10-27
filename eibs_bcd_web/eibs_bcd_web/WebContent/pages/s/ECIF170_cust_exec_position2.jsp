<html>
<head>
<title>Posici�n del Ejecutivo</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "cifPos" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id="cifTotal" class="datapro.eibs.beans.ECIF17005Message" scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

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
        		ok = true;
        		break;
      	}
      }
	  if ( ok ) {
          document.forms[0].submit();
     }
     else {
			alert("Seleccione una cuenta antes de realizar esta operaci�n");	   
     }

  }

	 builtNewMenu(ecif10_i_opt);

</SCRIPT>


</head>

<BODY>

<SCRIPT> initMenu(); </SCRIPT>

<h3 align="center">Posici�n del Ejecutivo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cust_exec_position.jsp,ECIF170"></h3>
<hr size="4">
  <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECIF170" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="4">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
<%
	if ( cifPos.getNoResult() ) {
 %>
   		<TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        <div align="center">
        		<font size="3"><b>
        				No hay resultados que correspondan a su criterio de b�squeda 
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
     <TD CLASS="TDBKG" ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(1)" >Consulta</a>
      </TD>
       <TD CLASS="TDBKG" ALIGN=CENTER width="20%">
  			<a href="javascript:goAction(3)" >Promedio</a>
      </TD>
      
    </TR>
  </TABLE>
        
<p>
<table class="tableinfo">
  <tr id="trdark"> 
      <td nowrap > 
        <table class=tbhead cellspacing="0" cellpadding="2" width="100%"   align="center">
        <tr>
             <td nowrap width="10%" align="left">  
         			<b></b>
             </td>
             <td nowrap width="10%" align="right"> Ejecutivo: </td>
             <td nowrap width="12%" align="left">
         			<%= cifTotal.getE05OFICDE()%>
             </td>
             <td nowrap width="6%" align="right">Nombre:  </td>
             <td nowrap width="14%" align="left">
         			<%= cifTotal.getE05OFINME()%>
             </td>
        </tr>
      </table>
    </td>
  </tr>
</table>


<h4>Activos (En Moneda Base)</h4>

 <TABLE class="tableinfo" ALIGN=CENTER>
  <TR><TD>
   <TABLE id="headTable1">
     <TR id ="trdark">
      <TH ALIGN=CENTER colspan="3" >CLIENTE</TH>
      <TH ALIGN=CENTER colspan="5" >CUENTA</TH>
    </TR>
    <TR id ="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER nowrap>N�MERO</TH>
      <TH ALIGN=CENTER nowrap>NOMBRE</TH>
      <TH ALIGN=CENTER nowrap>N�MERO</TH>
      <TH ALIGN=CENTER nowrap>TIPO</TH>
      <TH ALIGN=CENTER nowrap>DESCRIPCI�N</TH>
      <TH ALIGN=CENTER nowrap>STATUS</TH>
      <TH ALIGN=CENTER nowrap>MDA</TH>
    </TR>
  </TABLE> 

     <div id="dataDiv1" class="scbarcolor" style="padding:0" >
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
                if ( i > 6 ) {
      %>
                    		
  			<% } %> 
    </table>
  </div>
  </TD>  
</TR>	
</TABLE>

  
<h4>Pasivos (En Moneda Base)</h4>
  <TABLE class="tableinfo">
  <TR>
  <TD width=100%>
   <TABLE id="headTable2">
     <TR id ="trdark">
      <TH ALIGN=CENTER rowspan="2"></TH>
      <TH ALIGN=CENTER colspan="4">CUENTA</TH>      
      <TH ALIGN=CENTER rowspan="2">MDA</TH>      
      <TH ALIGN=CENTER rowspan="2">APERTURA/<br>VENCIMIENTO</TH>
      <TH ALIGN=CENTER rowspan="2">PRINCIPAL</TH>
      <TH ALIGN=CENTER rowspan="2">INTERES</TH>
      <TH ALIGN=CENTER rowspan="2">OTROS</TH>
      <TH ALIGN=CENTER rowspan="2">TOTAL</TH>
    </TR>
    <TR id ="trdark"> 
      <TH ALIGN=CENTER NOWRAP></TH>
      <TH ALIGN=CENTER NOWRAP>N�MERO</TH>
      <TH ALIGN=CENTER NOWRAP>TIPO</TH>
      <TH ALIGN=CENTER NOWRAP>DESCRIPCI�N</TH>
      <TH ALIGN=CENTER NOWRAP>STATUS</TH>
    </TR>
   </TABLE>   
    <div id="dataDiv2" class="scbarcolor" style="padding:0" >
      <table id="dataTable2" >
    <%
                cifPos.initRow();
                int j=0;
                while (cifPos.getNextRow()) {
                    if (cifPos.getFlag().equals("2")) {
                    		out.println(cifPos.getRecord());              		
   							j++;
                    }
                }
                if ( j > 6 ) {
      %>
            
  			<% } %> 
    </table>
  </div>
  </TD>  
</TR>	
</TABLE>
  

<SCRIPT type="text/javascript">
   function tableResize() {
     adjustDifTables('headTable1','dataTable1','dataDiv1',1,1);
     adjustDifTables('headTable2','dataTable2','dataDiv2',1,1);
   }
  tableResize();
  window.onresize=tableResize; 
</SCRIPT>
<%
  }
%>

  </form>
</body>
</html>
