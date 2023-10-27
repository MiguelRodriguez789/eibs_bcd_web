<html>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<head>
<title>Validacion de Mantenimiento de Cliente</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="client" class="datapro.eibs.beans.ESD010002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />  
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT>
  
</SCRIPT>
  
</head>

<body>

<% 
	if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
 %>
  <h3 align="center">Validación de Relaciones<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="client_relation_check.jsp, ESD1080" ></h3>
  <hr size="4">
  <FORM METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSESD0100">
	<INPUT TYPE=HIDDEN NAME="E02CUSCUN" VALUE="<%= client.getE02CUSCUN()%>">
	<INPUT TYPE=HIDDEN NAME="E02ACTION" VALUE="V">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="9">
	
   <table width="100%" height="100%" border="1" bordercolor="#000000">
    <tr > 
      <td> 
        <table width="100%" height="100%">
          <tr> 
            <td align=center>
            	<%
				String ope = (userPO.getSource() == null ? "01" : userPO.getSource());
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
            	El cliente con código <b><%= client.getE02CUSCUN()%></b><br>
            	<br>
            	<%= client.getE02MSGTXT()%>
            	<br>
            </td>
          </tr>
          <tr>
            <td width="100%">&nbsp;</td>
          </tr>
          <tr> 
            <td "width="100%">
              <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="javascript:window.close()" ></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
   </table>
</FORM>
</body>
</html>
