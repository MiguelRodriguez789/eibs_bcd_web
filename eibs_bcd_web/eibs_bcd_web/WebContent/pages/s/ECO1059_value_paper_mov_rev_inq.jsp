<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Reversion de Ingreso Manual Adhesivos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.ECO105901Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  		scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<% 
   if (msgMT == null) msgMT = new datapro.eibs.beans.ECO105901Message();
   msgMT.setE01MOVBNK(userPO.getBank());
   msgMT.setE01MOVBRN(userPO.getBranch());   
%>

<script type="text/javascript">
   function checkBranch() {
   		if (document.forms[0].E01MOVBRN.value == "") document.forms[0].E01MOVBRN.value = "999";
   }
</script>
</head>
<body>

<H3 align="center">Reversion de Ingreso Manual Adhesivos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="value_paper_mov_rev_inq,ECO1059"></H3>
<hr size="4">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.adhesives.JSECO1059" onsubmit="checkBranch()">
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="100">

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
	      <td nowrap width="46%"> 
	        <div align="right">Banco : </div>
	      </td>
	      <td nowrap width="54%"> 
	      	<eibsinput:text property="E01MOVBNK" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
	      </td>
     	</tr>
     	<tr > 
	      <td nowrap > 
	        <div align="right">Oficina : </div>
	      </td>
	      <td nowrap> 
	      	<eibsinput:help fn_param_one="E01MOVBRN" fn_param_two="document.forms[0].E01MOVBNK.value" property="E01MOVBRN" name="msgMT" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>"/>
	      </td>
     	</tr>
     	<tr > 
		  <td> 
		     <div align="right">Tipo Papel : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01MOVTIP" size="5" maxlength="4" value="<%= msgMT.getE01MOVTIP()%>">
      	    <a href="javascript:GetCodeCNOFC('E01MOVTIP','YJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
      	<tr > 
		  <td> 
		     <div align="right">Subtipo Papel : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01MOVSUB" size="5" maxlength="4" value="<%= msgMT.getE01MOVSUB()%>">
      	    <a href="javascript:GetCodeAuxCNOFC('E01MOVSUB','YI',document.forms[0].E01MOVTIP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      	  </td>     
      	</tr>
        <tr >
          <td nowrap>
              <div align="right">Fecha Movimiento - Desde : </div>
          </td>
          <td nowrap> 
           	  <eibsinput:date name="msgMT" fn_year="E01MOVFDY" fn_month="E01MOVFDM" fn_day="E01MOVFDD" />
              &nbsp; Hasta : &nbsp; 
           	  <eibsinput:date name="msgMT" fn_year="E01MOVTDY" fn_month="E01MOVTDM" fn_day="E01MOVTDD" />
          </td>
        </tr>
		<tr > 	      
	      <td nowrap width> 
	        <div align="right">Oficina Solicitate: </div>
	      </td>
	      <td nowrap> 
	        <input type="text" name="E01MOVBRS" size="5" maxlength="4" value="<%= msgMT.getE01MOVBRS() %>">
 			<input type="text" name="E01MOVBNS" size="30" maxlength="30" value="<%= msgMT.getE01MOVBNS() %>" readonly="readonly">	        
	        <a href="javascript:GetBranch('E01MOVBRS',document.forms[0].E01MOVBNK.value,'E01MOVBNS')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
	        <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"> 
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
