<html>
<head>
<title>Logs Inquiry</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "logs" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
    builtNewMenu(swf_a_opt);
 </SCRIPT>
  

</head>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
 out.println("<SCRIPT> initMenu();  </SCRIPT>");
%> 
<h3 align="center">Consulta Logs de Transacciones Financieras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="logs_inquiry.jsp, EPR0200"></h3>
<hr size="4">
  <form>
    <INPUT TYPE=HIDDEN NAME="SCREEN" value="10">
	 <INPUT TYPE=HIDDEN NAME="opt" VALUE="1">
  <%
	if ( logs.getNoResult() ) {
 %> 
  <TABLE class="tbenter" width=100% height=100%>
   		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay resultados para su b&uacute;squeda 
        </b></font> </div>
      </TD></TR>
   		</TABLE>
  <%   		
	}
	else {
%> <br>
  
    <table class="tableinfo" id="headTable1">
      <tr id="trdark">
      <th align=CENTER height="41">N&uacute;mero de<BR>Cuenta</th>
      <th align=CENTER height="41">Formato</th>
      <th align=CENTER height="41">Moneda</th>
      <th align=CENTER height="41">Monto</th>      
      <th align=CENTER height="41">Nuestra<BR>
		Referencia</th>
      <th align=CENTER height="41">Referencia<BR>Relacionada </th>
      <th align=CENTER height="41">Usuario</th>
      <th align=CENTER height="41">Id Swift del<BR>
		Receptor. </th>
      <th align=CENTER height="41">Estado</th>
      <th align=CENTER height="41">Modo<BR>de Acceso</th>
      <th align=CENTER height="41">Tipo de<BR>Proceso</th>
      <th align=CENTER height="41">Fecha de<BR>Proceso
		</th>
      <th align=CENTER height="41">Hora</th>
      </tr>
      <%
      logs.initRow();
      while (logs.getNextRow()) {
					    
      %> 
      <tr id="trclear">
        <td NOWRAP align=CENTER>          
        <div align="center"><%= logs.getRecord(12)%></div>
        </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(0)%></td>
        <td NOWRAP >
        	<div align="right"><%= logs.getRecord(11)%> </div>
	    </td>
      <td NOWRAP >
        <div align="right"><%= logs.getRecord(1)%> </div>
      </td>
      <td NOWRAP align=CENTER><div align="center">
        <%= logs.getRecord(6)%></div></td>
        <td NOWRAP align=CENTER> 
          <div align="right"><%= logs.getRecord(3)%></div>
        </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(4)%></td>
        <td NOWRAP align=CENTER> 
          <div align="right"> <%= logs.getRecord(5)%></div>
        </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(2)%></td>
        <td NOWRAP align=CENTER> 
          <div align="right"><%= logs.getRecord(7)%></div>
        </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(8)%> </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(9)%> </td>
        <td NOWRAP align=CENTER><%= logs.getRecord(10)%> </td>
      </tr>
      <%
     }
   %> 
    </table>

  
  <%
     }   
  %> 
 
</form>
</body>
</html>
