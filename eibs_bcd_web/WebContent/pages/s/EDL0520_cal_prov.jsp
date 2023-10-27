<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<%@ page import = "datapro.eibs.master.Util" %>
<head>
<title>Cost Center Descriptions Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.EDL052001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"   scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>

<body bgcolor="#FFFFFF">

 <%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Simulaci&oacute;n  Calificaci&oacute;n y Provisi&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cal_prov.jsp, EDL0520" ></h3>
<hr size="4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0520" >
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    <INPUT TYPE=HIDDEN NAME="OPT" VALUE="<%= userPO.getPurpose()%>">
  </p>
  <% if("".equals(msg.getE01ACTION())){ %>
  <table  class="tableinfo">
    <tr>
      <td nowrap width="25%">
      </td>
	<td nowrap width="25%">
	        <table cellspacing="0" cellpadding="2" width="100%" border="0">

          <tr id="trclear">
            <td nowrap >
              <div align="right">Año :</div>
            </td>
            <td nowrap>
		 		<INPUT type="text" name="E01CYPCPY" size="5" maxlength="4" value="<%= "0".equals(msg.getE01CYPCPY().trim())?currUser.getE01RDY():msg.getE01CYPCPY() %>">
		    </td>
            <td nowrap>
           	  <div align="right">Mes :</div>
            </td>
            <td nowrap>
           		<INPUT type="text" name="E01CYPCPM" size="3" maxlength="2" value="<%= "0".equals(msg.getE01CYPCPM().trim())?currUser.getE01RDM():msg.getE01CYPCPM() %>">
            </td>
          </tr>
           
    </table>
     </td>
    
     <td nowrap width="25%">
     </td>
    </tr>
  </table>
  <br>
   <p align="center">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
    <%} %>
   <% if(!"".equals(msg.getE01ACTION()) ){
		if(msg.getE01ACTION().equals("R")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación Normal se esta Ejecutando </h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>
	    <% }			
 		 else if(msg.getE01ACTION().equals("P") || msg.getE01ACTION().equals("O")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación Por Producto o Cliente se esta ejecutando</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
 		<% }
		 else if(msg.getE01ACTION().equals("O")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación Por Producto o Cliente Termino de Forma Correcta</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
		   <p align="center">
    			<input id="EIBSBTN" type=submit name="Submit" value="Consultar"  onClick="javascript:consultar()">
		  </p>	
 		<% }
 		 else if(msg.getE01ACTION().equals("X")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación  Por Producto o Cliente se esta Ejecutando</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
 		<% } 
		  else if(msg.getE01ACTION().equals("Y")){%>
 		 	<h3 align="center" style="color:red">Proceso Simulación x Producto Cliente termino, por favor ingrese en la opcion correspondiente para ver resultados</h3>
 		 	<h3 align="center"><%=msg.getE01MSGTXT()%></h3>			
 		<% } 
  } %>

  
</form>
</body>
</html>

