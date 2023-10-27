<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head>
<title>Consulta de Stock Adhesivos por Oficina</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO106101Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
   function checkBranch() {
   		if (document.forms[0].E01LVLBRN.value == "") document.forms[0].E01LVLBRN.value = "999";
   }
</script>
</head>
<body>

<H3 align="center">Consulta de stock de Adhesivos por Oficina
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_branch_bal_inq,ECO1061">
</H3>
<hr size="4">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1061" onsubmit="checkBranch()">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
	      <td nowrap width="48%"> 
	        <div align="right">Banco : </div>
	      </td>
	      <td nowrap width="52%"> 
	      	<eibsinput:text property="E01LVLBNK" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
	      </td>
     	</tr>
     	<tr > 
	      <td nowrap > 
	        <div align="right">Oficina : </div>
	      </td>
	      <td nowrap> 
	      	<eibsinput:help fn_param_one="E01LVLBRN" fn_param_two="document.forms[0].E01LVLBNK.value" property="E01LVLBRN" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>"/>
	      </td>
     	</tr>
     	<tr > 
	      <td nowrap > 
	        <div align="right">Cajero Solicitante : </div>
	      </td>
	      <td nowrap> 
				<input type="text" name="E01LVLCSN" size="5" maxlength="4" value="<%= msgMT.getE01LVLCSN()%>">
	      	    <a href="javascript:GetTellerRequest('E01LVLCSN','E01LVLCSM',document.forms[0].E01LVLBNK.value,document.forms[0].E01LVLBRN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				<input type="text" name="E01LVLCSM" size="40" maxlength="45" value="<%= msgMT.getE01LVLCSM()%>" readonly="readonly">      	    	      	
	      </td>
     	</tr>     	
     	<tr > 
		  <td> 
		     <div align="right">Tipo Adhesivos : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01LVLTIP" size="5" maxlength="4" value="<%= msgMT.getE01LVLTIP()%>">
      	    <a href="javascript:GetCodeCNOFC('E01LVLTIP','YJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
      	<tr > 
		  <td> 
		     <div align="right">Subtipo Adhesivos : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01LVLSUB" size="5" maxlength="4" value="<%= msgMT.getE01LVLSUB()%>">
      	    <a href="javascript:GetCodeAuxCNOFC('E01LVLSUB','YI',document.forms[0].E01LVLTIP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
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
    
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</form>
</body>
</html>
