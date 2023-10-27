<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<META name="GENERATOR" content="IBM WebSphere Studio">
<head>
<title> Condiciones</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msg" class= "datapro.eibs.beans.EDL051501Message"  scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

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
<h3 align="center">Condiciones
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="condiciones_enter.jsp, EDL0515"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0515" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

    <p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  
<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="right" width="50%" nowrap>Banco :&nbsp;</td>
		<td  width="50%">
 			<eibsinput:text property="E01CDLBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
 		</td>
	</tr>
	<tr align="center" >
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center">
			<input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
		</div>
		</td>
	</tr>
</table>
              
</form>
</body>
</html>
