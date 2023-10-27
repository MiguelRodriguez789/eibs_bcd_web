<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<%@page import="datapro.eibs.beans.EDL209002Message"%>
<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>Renovación de Depósitos a Plazo</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "entity" class= "datapro.eibs.beans.EDL209001Message"  scope="session" />
<jsp:useBean id= "EDL209002List" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<% 
 boolean emptyListFr = EDL209002List.getNoResult();
 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script >
 
 function finish(){
 	document.forms[0].submit();
 }
</script>

</head>

<body>

<h3 align="center">Renovación de Depósitos a Plazo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cd_renova_confirm, EDL2090" ></h3>
<hr size="4">
<br>

 <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.timedeposits.JSEDL2090" >
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
<%--     <INPUT TYPE=HIDDEN NAME="E01DEAACC" VALUE="<%= userPO.getAccNum().trim()%>">   --%>

		<% if(entity.getE01OPTION().equals("1")){ %>
    	<div align="center"><p><b> Renovación de Capital + Intereses</b></p></div>
    	<%} %>
    	<% if(entity.getE01OPTION().equals("2")){ %>
    	<div align="center"><p><b> Renovación del Capital y Pago de Intereses</b></p></div>
    	<%} %>
    	<% if(entity.getE01OPTION().equals("3")){ %>
    	<div align="center"><p><b> Renovación del Capital + Intereses con Aumento de Capital </b></p></div>
    	<%} %>
    	<% if(entity.getE01OPTION().equals("4")){ %>
    	<div align="center"><p><b> Renovación con Disminución de Capital actual y Pago de Intereses </b></p></div>
    	<%} %>
    	<% if(entity.getE01OPTION().equals("5")){ %>
    	<div align="center"><p><b> Renovación con Aumento de Capital y Pago de Intereses  </b></p></div>
    	 <%} %>
    	 <br>
    	 
    	 <div align="center"><p>La renovación del Certificado de Deposito n&uacute;mero <b><%= datapro.eibs.master.Util.justifyRight(entity.getE01DEAACC(),12)%></b> 
          ha sido satisfactoriamente procesada y enviada a aprobación..
        </p></div>
    	 
    	 <% if(entity.getE01OPTION().equals("1")){ %>
    	<div align="center"><p><b> </b></p></div>
    	<%} %>
    	<% if(entity.getE01OPTION().equals("2")){ %>
    	<div align="center"><p><b> Pago de Intereses por : <b><%=entity.getE01INTTOT() %></b>
    	   - Concepto de Pago : <%=entity.getE01OFFCO2() %> - <%=entity.getE01OFFGL2()%> 
    	   <%if(!entity.getE01OFFAC2().equals("0")) out.print(" - "+entity.getE01OFFAC2());%></p></div>
    	<%} %>
    	<% if(entity.getE01OPTION().equals("3")){ %>
    	<div align="center"><p> Aumento de Capital por : <b><%=entity.getE01TRNPRI() %></b>
    	   - Concepto de Pago : <%=entity.getE01OFFCO1() %> - <%=entity.getE01OFFGL1()%>
    	   <%if(!entity.getE01OFFAC1().equals("0")) out.print(" - "+entity.getE01OFFAC1());%> </p></div>
    	<%} %>
    	<% if(entity.getE01OPTION().equals("4")){ %>
    	<div align="center"><p> Pago de Capital por : <b><%=entity.getE01TRNPRI() %></b>
    	   - Concepto de Pago : <%=entity.getE01OFFCO1() %> - <%=entity.getE01OFFGL1()%>
    	   <%if(!entity.getE01OFFAC1().equals("0")) out.print(" - "+entity.getE01OFFAC1());%> </p></div>
    	<div align="center"><p> Pago de Intereses por : <b><%=entity.getE01INTTOT() %></b>
    	   - Concepto de Pago : <%=entity.getE01OFFCO2() %> - <%=entity.getE01OFFGL2()%> 
    	   <%if(!entity.getE01OFFAC2().equals("0")) out.print(" - "+entity.getE01OFFAC2());%> </p></div>
    	<%} %>
    	<% if(entity.getE01OPTION().equals("5")){ %>
    	<div align="center"><p> Pago de Intereses por : <b><%=entity.getE01INTTOT() %></b>
    	   - Concepto de Pago : <%=entity.getE01OFFCO2() %> - <%=entity.getE01OFFGL2()%> 
    	   <%if(!entity.getE01OFFAC2().equals("0")) out.print(" - "+entity.getE01OFFAC2());%></p></div>
    	   <div align="center"><p> Aumento de Capital por : <b><%=entity.getE01TRNPRI() %></b>
    	   - Concepto de Pago : <%=entity.getE01OFFCO1() %> - <%=entity.getE01OFFGL1()%>
    	   <%if(!entity.getE01OFFAC1().equals("0")) out.print(" - "+entity.getE01OFFAC1());%> </p></div>
    	<%} %>
    	
    	

<table class="tableinfo">
  <tr >
  	
  	<tr > 
    	<td><p> Los nuevos Certificados son :</p></td>
  	</tr>
  	<tr>
  	<table  id="mainTable" class="tableinfo" style="height:100px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
            <th align=center nowrap width="10%"> Certificado</th>
            <th align=center nowrap width="10%"> Cliente</th>
            <th align=center nowrap width="10%"> Identificación</th>
            <th align=center nowrap width="50%"> Nombre</th>
            <th align=center nowrap width="20%"> Monto Apertura</th>
		</tr>
        </table>
      </td>
    </tr>    
  	<% if (emptyListFr) { %>
      <tr id="dataTable"> 
		<TD ALIGN="CENTER" nowrap width="35%" style="color:#d0122c" colspan="5">
			<br><br><br><br> <font size=3>No hay Renovaciones para el Certificado Origen.</font>
		</TD>          
	 </tr>
	 <% } else {%>     
    
		 <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:98px; overflow:auto;"> 
		       <table id="datos" cellspacing="0" cellpadding="1" border="0" width="100%">  
          <%
    	  int i = 0;
          EDL209002List.initRow();
				boolean firstTime = true;
				String chk = "";
          while (EDL209002List.getNextRow()) {
					if (firstTime) {
						firstTime = false;
						chk = "checked";
					} else {
						chk = "";
					}
            EDL209002Message msgList = (EDL209002Message) EDL209002List.getRecord();
            	 
			i++;
			
         %>   
			<tr id="dataTable<%= EDL209002List.getCurrentRow() %>">
				<td NOWRAP  align='left' width="10%"> <%= msgList.getE02FRCACC()%> </td>
	            <td NOWRAP  align='center' width="10%"> <%= msgList.getE02FRCCUN() %> </td>
	            <td NOWRAP  align='center' width="10%"> <%= msgList.getE02FRCIDN() %> </td>
	            <td NOWRAP  align='center' width="50%"> <%= msgList.getE02FRCNA1()%> </td>
	            <td NOWRAP  align='center' width="20%"> <%= msgList.getE02FRCAMT()%> </td>
	          </tr>
	        <% 
	           }%> 
	             </table>
	        	</div>
	    	</td>
		</tr>
	<% } %>
</table>
  
  
  </tr>
  
</table>
<br>
 <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="finish()" ></div>

</form>

</body>
</html>
