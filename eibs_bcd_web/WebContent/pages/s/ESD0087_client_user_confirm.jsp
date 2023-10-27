<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>Confirmación de la creación de un Cliente Tipo Usuario</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="ESD0087Record" class="datapro.eibs.beans.ESD008701Message"  scope="session" /> 
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

 function finish(){
		document.forms[0].submit();
  }

 setTimeout("finish();", 7000);
 
</SCRIPT>
 
</head>

<body>

  <h3 align="center">Confirmación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_user_confirm, ESD0087" ></h3>
  <hr size="4">
  <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0087?SCREEN=1">
	<INPUT TYPE=HIDDEN NAME="PASCODE" VALUE="<%= userPO.getHeader20()%>">
	
   <table width="100%" height="100%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
            <td align=center>
            	El usuario <b><%= ESD0087Record.getE01NA1()%></b>, con còdigo <b><%= ESD0087Record.getE01CUN()%></b>,<br>
		       	<% if (ESD0087Record.getH01OPECOD().equals("0010")) {%>
			  		ha sido vinculado como cliente pendiente de actualización y aprobación.<br>
			  		Para continuar el proceso debe acceder al opción de mantenimiento de clientes.
				<%} else if (ESD0087Record.getH01OPECOD().equals("0004")) { %>
					se ha borrado como usuario.
				<%} else { %>
			  		se ha actualizado satisfactoriamente dentro del sistema.
			  		<% if (ESD0087Record.getE01STS().equals("4")) {%>
			  		<br>Con posible coincidencia con Lista de Control, por lo que debe ser<br>
			  		aprobado por Cumplimiento. 
				<%  }
				  } %>
            </td>
          </tr>
        </table>
      </td>
    </tr>
   </table>
</FORM>
</body>
</html>
