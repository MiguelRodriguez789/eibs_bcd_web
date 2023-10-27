<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1"> 

<META name="GENERATOR" content="IBM WebSphere Studio">
<TITLE>Generar Archivo Garantías Prenda Vehículos NO Clasificadas</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "gaMant" class= "datapro.eibs.beans.ERA005000Message"  scope="session"/>
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
%>

<body bgcolor="#FFFFFF">

 <% if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %>

<h3 align="center">Generar Archivo con las Garantías de Prenda Vehículos NO Clasificadas<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ERA0085_ga_wnc_enter.jsp"></h3>
<hr>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0085" >
	<CENTER>
    	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
    	<INPUT TYPE=HIDDEN NAME="PURPOSE" VALUE="MAINTENANCE">
    	<table cellspacing="0" cellpadding="2" class="tbenter" border=0   width=70% align="center" height="80%">
      		<tr valign="middle"> 
        		<td nowrap colspan="2" align="justify" height="120">&nbsp;</td>
      		</tr>
      		<tr valign="middle"> 
        		<td nowrap width=100% align="center" height="17" >Generar Archivo Garantías Prenda Vehículos NO Clasificadas :
          		</td>
      		</tr>
      		<tr> 
        		<td nowrap colspan="2" valign="middle" height="120"> 
          			<p align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></p>
        		</td>
      		</tr>
      		<tr> 
        		<td nowrap colspan="2" valign="middle">&nbsp;</td>
      		</tr>
    	</table>
		<script type="text/javascript">
		</script>
  	</CENTER>
</FORM>

</BODY>
</HTML>
 