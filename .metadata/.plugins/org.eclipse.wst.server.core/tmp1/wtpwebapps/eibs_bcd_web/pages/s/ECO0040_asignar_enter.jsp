<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Asignar Convenios</title>
<META name="GENERATOR" content="IBM WebSphere Studio">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "msgCon" class= "datapro.eibs.beans.ECO004001Message"  scope="session"/>

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
<h3 align="center">Asignacion de Convenios
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="asignar_enter.jsp, ECO0040"></h3>
<hr size="4">
    <p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>
  	<p>&nbsp;</p>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0040" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
      <td valign="middle" align="center" height=33 width="50%"> 
        <div align="right">Numero Cliente : </div>
      </td>
      <td valign="middle" align="center" height=33 width="50%"> 
        <div align="left"> 
        	<eibsinput:help fn_param_one="E01CCNCUN" property="E01CCNCUN" name="msgCon" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" />
        </div>
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
