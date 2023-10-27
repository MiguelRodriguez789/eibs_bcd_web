<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html> 
<head> 
<title>Consulta de Movimientos Adhesivos por Asesor</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO106302Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />


<script type="text/javascript">
   function checkBranch() {
   		if (document.forms[0].E02MOVBRN.value == "") document.forms[0].E02MOVBRN.value = "999";
   }
</script>
</head>
<body>

<H3 align="center">Consulta de Movimientos de Adhesivos por Asesor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_agent_mov_inq,ECO1063"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1063" onsubmit="checkBranch()">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
	      <td nowrap width="46%"> 
	        <div align="right">Banco : </div>
	      </td>
	      <td nowrap width="54%"> 
	      	<eibsinput:text property="E02MOVBNK" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
	      </td>
     	</tr>
     	<tr > 
	      <td nowrap > 
	        <div align="right">Oficina : </div>
	      </td>
	      <td nowrap> 
	      	<eibsinput:help fn_param_one="E02MOVBRN" fn_param_two="document.forms[0].E02MOVBNK.value" property="E02MOVBRN" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>"/>
	      </td>
     	</tr>
     	<tr > 
		  <td> 
		     <div align="right">Tipo Adhesivos : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E02MOVTIP" size="5" maxlength="4" value="<%= msgMT.getE02MOVTIP()%>">
      	    <a href="javascript:GetCodeCNOFC('E02MOVTIP','YJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
      	<tr > 
		  <td> 
		     <div align="right">Subtipo Adhesivos : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E02MOVSUB" size="5" maxlength="4" value="<%= msgMT.getE02MOVSUB()%>">
      	    <a href="javascript:GetCodeAuxCNOFC('E02MOVSUB','YI',document.forms[0].E02MOVTIP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
        <tr >
          <td nowrap>
              <div align="right">Fecha Movimiento - Desde : </div>
          </td>
          <td nowrap> 
           	  <eibsinput:date name="msgMT" fn_year="E02MOVFDY" fn_month="E02MOVFDM" fn_day="E02MOVFDD" />
              &nbsp; Hasta : &nbsp; 
           	  <eibsinput:date name="msgMT" fn_year="E02MOVTDY" fn_month="E02MOVTDM" fn_day="E02MOVTDD" />
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
