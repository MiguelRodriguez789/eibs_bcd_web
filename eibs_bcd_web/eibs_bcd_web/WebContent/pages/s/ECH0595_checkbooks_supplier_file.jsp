<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Camara Entrante</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="msgCK" class="datapro.eibs.beans.ECH059501Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>

<body>

<%
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

 <h3 align="center">Generacion de Archivo de Chequeras al Proveedor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="checkbooks_supplier_file.jsp, ECH0595"></h3>
<hr size="4">
 <FORM METHOD="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSECH0595">	
    <p><INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">
    </p>
  <table id="tbenter" align="center" style="width:85%" border="1">
    <tr> 
      <td> 
        <table id="tbenter" width="100%" border="0" cellspacing="1" cellpadding="0">
			<tr>
     			<td align="center"> 
             		El archivo se creara con el nombre de FESACHK.TXT<BR>
				Presiones Enviar para ejecutar el proceso.
				</td>        
    		</tr>
	  </table>
      </td>
    </tr>
  </table>
  
<% if (msgCK.getE01EXISTE().equals("Y")) { %> 
	<h4 style="text-align:center"><input type="checkbox" name="E01REPLACE" value="Y"><FONT
	color="#ff0000">Archivo ya Existe, Marque para reemplazar</FONT></h4>
<% } %>
  
  <p align="center"> 
	<input id="EIBSBTN" type="submit" name="Submit" value="Enviar" > 
  </p> 
	  
 </FORM>
</BODY>
</HTML>
