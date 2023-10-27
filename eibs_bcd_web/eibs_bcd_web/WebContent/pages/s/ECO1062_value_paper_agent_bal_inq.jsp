<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>  
<head>
<title>Consulta de Stock Adhesivos por Asesor</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO106201Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
   function checkBranch() {
   		if (document.forms[0].E01DOCBRN.value == "") document.forms[0].E01DOCBRN.value = "999";
   }
</script>
</head>
<body>

<H3 align="center">Consulta de Stock de Adhesivos por Asesor
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_agent_bal_inq,ECO1062"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1062" onsubmit="checkBranch()">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="200">

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
	      <td nowrap width="48%"> 
	        <div align="right">Banco : </div>
	      </td>
	      <td nowrap width="52%"> 
	      	<eibsinput:text property="E01DOCBNK" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
	      </td>
     	</tr>
     	<tr > 
	      <td nowrap > 
	        <div align="right">Oficina : </div>
	      </td>
	      <td nowrap> 
	      	<eibsinput:help fn_param_one="E01DOCBRN" fn_param_two="document.forms[0].E01DOCBNK.value" property="E01DOCBRN" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>"/>
	      </td>
     	</tr>
     	<tr > 
	      <td nowrap > 
	        <div align="right">Cajero Solicitante : </div>
	      </td>
	      <td nowrap> 
				<input type="text" name="E01DOCCSN" size="5" maxlength="4" value="<%= msgMT.getE01DOCCSN()%>">
	      	    <a href="javascript:GetTellerRequest('E01DOCCSN','E01DOCCSM',document.forms[0].E01DOCBNK.value,document.forms[0].E01DOCBRN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
				<input type="text" name="E01DOCCSM" size="40" maxlength="45" value="<%= msgMT.getE01DOCCSM()%>" readonly="readonly">    	      	
	      </td>
     	</tr>     	
     	<tr > 
		  <td> 
		     <div align="right">Tipo Papel : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01DOCTIP" size="5" maxlength="4" value="<%= msgMT.getE01DOCTIP()%>">
      	    <a href="javascript:GetCodeCNOFC('E01DOCTIP','YJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
      	<tr > 
		  <td> 
		     <div align="right">Subtipo Papel : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01DOCSUB" size="5" maxlength="4" value="<%= msgMT.getE01DOCSUB()%>">
      	    <a href="javascript:GetCodeAuxCNOFC('E01DOCSUB','YI',document.forms[0].E01DOCTIP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
      	<tr > 
		  <td> 
		     <div align="right">Asesor : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01DOCUSR" size="12" maxlength="10" value="<%= msgMT.getE01DOCUSR()%>">
      	    <a href="javascript:getOficial('E01DOCUSR',document.forms[0].E01DOCBRN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
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
 <% } %>
</form>
</body>
</html>
