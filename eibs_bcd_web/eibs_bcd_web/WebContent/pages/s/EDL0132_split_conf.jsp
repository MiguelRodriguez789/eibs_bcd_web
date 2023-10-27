<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css"> 
<TITLE>Fraccionamiento de CDs</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT LANGUAGE="JavaScript" SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT LANGUAGE="javascript">

 function finish(){
   document.forms[0].submit();
 }
 
</SCRIPT>

</HEAD>

<body>

<%
String screen = "1";
String titletxt = "Fraccionamiento de Certificado de Deposito ";
if (userPO.getType().equals("FU")) {
	screen = "11";
	titletxt = "Consolidación de Certificados a Deposito ";
}
%>

 <h3 align="center"><%=titletxt %> Número <%= userPO.getIdentifier().trim() %>
 <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="split_conf, EDL0132"></h3>
<hr size="4">
 <form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0132?SCREEN=<%=screen%>">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1">
    
	<table  class="tbenter" width="100%" height="50%" border="0" cellspacing=0 cellpadding=2>
		<tr>
     		<td align="center">
 			</td>
		</tr>
		<tr>
			<td align="center">
				<br>
				La información de <%=titletxt %> fue enviada para su Aprobación.<br><br>
				<br>
 			</td>      
	   	</tr>
         <tr>
            <td width="100%">&nbsp;</td>
          </tr>
          <tr> 
            <td "width="100%">
              <div align="center"><input id="EIBSBTN" type=button name="close" value="Cerrar" onclick="finish()" ></div>
            </td>
          </tr>

  	</table>
	<table width="100%">		
  		<tr>
  			<td width="100%"> 
  			</td>
  		</tr>	
  </table>

 </FORM>
</BODY>
</HTML>
 