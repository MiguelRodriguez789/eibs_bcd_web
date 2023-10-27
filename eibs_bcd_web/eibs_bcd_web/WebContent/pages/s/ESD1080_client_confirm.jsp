<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>Confirmación de Mantenimiento de Cliente</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="client" class="datapro.eibs.beans.ESD108001Message"  scope="session" />  
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT>

 function finish(ope){
 	
 	<%if (client.getE01CRT().equals("Y") && client.getE01CUN().equals("999999999")) { %> 
		document.forms[0].SCREEN.value = 1;
	<% } else if (userPO.getSource().equals("30")) {%>
				document.forms[0].SCREEN.value = 16;
	<% } else {%>
		if (ope != "22") {
			document.forms[0].SCREEN.value = 6;
		} else {
			document.forms[0].SCREEN.value = 26;
		}
				
	<% } %>	
	document.forms[0].submit();
  }
 
</SCRIPT>
  
</head>

<body>

  <h3 align="center">Confirmación<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_confirm, ESD1080" ></h3>
  <hr size="4">
  <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD1080">
	<INPUT TYPE=HIDDEN NAME="E01CUN" VALUE="<%= client.getE01CUN()%>">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">
	<INPUT TYPE=HIDDEN NAME="OPE" VALUE="<%= client.getE01OPE()%>">
    <INPUT TYPE=HIDDEN NAME="E01OPE" VALUE="<%= client.getE01OPE()%>">
	
   <table width="100%" height="100%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
            <td align=center>
            	<%
				String ope = client.getE01OPE();
 				String titu = "DE CLIENTES";
 				if (ope.equals("02")) {
 					titu = "DE ESTADO DEL CLIENTE  ";
 				}
 				if (ope.equals("10")) {
 					titu = "DE FUSION DE CLIENTES";
 				}
 				if (ope.equals("12")) {
 				titu = "DE LEY DE VICTIMAS ";
 				}
 				if (ope.equals("15")) {
 				titu = "DE IDENTIFICACION DEL CLIENTE ";
 				}
				if (ope.equals("20")) {
 				titu = "DE PROSPECTO ";
 				}
 				if (ope.equals("22")) {
 				titu = "DE ENTIDAD ";
 				}
 				if (ope.equals("25")) {
 				titu = "DE INFORMACION FISCAL ";
 				}
 				if (ope.equals("30")) {
 				titu = "DE LOG DE BIOMETRIA";
 				}
				%> 
            	<h4>----->  ACTUALIZACION <%=titu%></h4>
            	<BR>
            	El cliente <b><%= client.getE01NA1()%></b>, con código <b><%= client.getE01CUN()%></b><br>
            	<b>Identificación :<%= client.getE01PID()%> / <%= client.getE01TID()%> / <%= client.getE01IDN()%></b>,
            	<br>
            	<% 	
            		String msg1 = "";
            		String msg2 = "";
            		String msg3 = "";
            		int opecod = Integer.parseInt(client.getH01OPECOD().trim());
            		switch (opecod) {
            		
            		case 5:   // Update Customer
            			if (!ope.equals("20") && client.getE01CRT().equals("Y")) {      // Regular Customer and New
            				msg1 = "ha sido vinculado como Cliente.";
            			}
            			if (ope.equals("20") && client.getE01CRT().equals("Y")) {       // Prospect and New    
            				msg1 = "ha sido vinculado como Prospecto.";
            			}
            			if (ope.equals("22") && client.getE01CRT().equals("Y")) {       // Prospect and New    
            				msg1 = "ha sido vinculado como Entidad.";
            			}
            			if (client.getE01CRT().equals("N")) {       // Prospect and New    
            				msg1 = "Se ha actualizado satisfactoriamente dentro del sistema.";
            			}
            			if (client.getE01APR().equals("Y") || client.getE01APR().equals("1")) {         // Approval is mandatory
            				msg2 = "Se encuentra disponible para aprobación o para continuar con mas actualizaciones.";
            			} else  if (client.getE01APR().equals("2") || client.getE01APR().equals("3") ){
            				msg2 = "Requiere aprobación de " + client.getD01APQ();
            			} else if (client.getE01APR().equals("L")) {
            				msg2 = "<B><FONT color=\"red\">Requiere aprobación de ("  + client.getD01APQ() + ") para Continuar.</FONT></B>";
            			} else {	 
            				msg2 = "No requiere Aprobación.";
            			}
            			//if (ope.equals("01")) {      // Regular Maintenance or New
            			//	msg3 = "Con Nivel de Riesgo " + client.getE01RSL() + " " + client.getE01PPA();
            			//}
            			break;
            		case 2:	
            			// Biometria
            			if (ope.equals("30")) {      
            				msg1 = "ha registrado el resultado de la Biometria.";
            			} 
                		break;
                	case 9:   // Delete  Maintenance
                		msg1 = "se le ha borrado el mantenimiento.";
                		break;
                	case 10:   // Entity to Prospect
                		msg1 = "Se ha colocado en Mantenimiento de Prospecto para completar.";
                		break;
                		
                	case 1:   // New and Control List Match
                		if (client.getE01APR().equals("L")) {
                			msg1 = "No ha sido vinculado en el sistema.";
			  		     	msg2 = "Requiere aprobación de (" + client.getD01APQ() + ") para Continuar.";
						}
                		break;
                	default:
        			}
            	%>
            	<br>
            	<%=msg1%>
            	<br>
            	<%=msg2%>
            	<br>
            	<%=msg3%>
            	<br>
            </td>
          </tr>
          <tr>
            <td width="100%">&nbsp;</td>
          </tr>
          <tr> 
            <td "width="100%">
              <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="javascript:finish('<%= client.getE01OPE()%>')" ></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
   </table>
</FORM>
</body>
</html>
