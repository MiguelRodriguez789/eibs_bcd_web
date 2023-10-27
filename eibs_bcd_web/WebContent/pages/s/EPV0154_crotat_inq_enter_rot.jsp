<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import = "datapro.eibs.master.Util" %>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "lnInquiry" class= "datapro.eibs.beans.EPV015401Message"  scope="session" />
<title>Cupo Rotativo</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<SCRIPT type="text/javascript">

function goAction() {
		
		if (getElement("H01FLGWK1").value == ('2')) {
			getElement("SCREEN").value = "810";	
			document.forms[0].submit();	
			
		} else {	
			getElement("SCREEN").value = "800";
			document.forms[0].submit();	
		}			
    }



function excType() {
	getElement("SEARCH").value = 'L2';
	
	if (getElement("H01FLGWK1").value == ('2')) {
		getElement("SEARCH").value = 'L3';
	} else {
		getElement("H01FLGWK1").value = '1';
		getElement("SEARCH").value = 'L2';
	}
}

</SCRIPT>

</head>
<body>
<% String client = currClient != null ? currClient.getE01CUSCUN() : ""; %>
<%
	if (!error.getERRNUM().equals("0")) {
		out.println("<script type=\"text/javascript\">");
		error.setERRNUM("0");
		out.println("showErrors()");
		out.println("</script>");
	}
	userPO.setHeader1("INQMENU");
%>


<h3 align="center">Consulta Cupo Rotativo<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="crotat_inq_enter_rot.jsp,EPV0154"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154">
	<input type="hidden" name="SCREEN" value="800">
	<INPUT TYPE=HIDDEN NAME="SEARCH" VALUE="L2">
    <input type=HIDDEN name="opt" id="opt" value="0">
<br>

<table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0" bordercolor="#000000">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table class="tbenter" cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
          <tr >
			<td align="right" width="50%" nowrap>Seleccione :&nbsp;</td>
			<td width="50%" valign="top">
			<SELECT name="H01FLGWK1" onchange="excType();">
				<OPTION value="1" <%if (lnInquiry.getH01FLGWK1().equals("1")) { out.print("selected"); }%>>N&uacute;mero de Cupo </OPTION>
				<OPTION value="2" <%if (lnInquiry.getH01FLGWK1().equals("2")) { out.print("selected"); }%>>N&uacute;mero de Utilizaci&oacute;n </OPTION>
			</SELECT>
			</td>
			</tr> 
          
          <tr> 
            <td nowrap width="50%"> 
              <div align="right">Ingrese el N&uacute;mero :</div>
            </td>
           
            <td nowrap width="50%"> 
              <input type="text" name="E01DEAACC" size="13" maxlength="12" onKeypress="enterInteger(event)" <%if(!error.getERWRNG().equals("Y") ){ %>  onchange="submitForm();" <% } %>> 
              <a href="javascript:GetAccount('E01DEAACC','',document.forms[0].SEARCH.value,'<%= client %>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
          
          </tr>
         
        </table>
        
			<div align="center"> 
			   	 <input id="EIBSBTN" type="button" name="Submit" value="Enviar" OnClick="goAction()">
			 </div>
</form>
</body>
<script type="text/javascript">
function submitForm(){
	goAction(); 
	
}
</script>

</html>
 