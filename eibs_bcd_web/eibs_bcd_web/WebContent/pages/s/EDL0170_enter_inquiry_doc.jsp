<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html> 
<head>
<title>Consulta de Lotes Papel Valor</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgMT" class= "datapro.eibs.beans.EDL017001Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">
   function checkBranch() {
   		if (document.forms[0].E01PFDBRN.value == "") document.forms[0].E01PFDBRN.value = "9999";
   }
</script>
</head>
<body>

<H3 align="center">Consulta de Lotes Papel Valor<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="enter_inquiry_doc,EDL0170"></H3>
<hr size="4">
<p>&nbsp;</p>

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0170" onsubmit="checkBranch()">
  <p> 
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="400">
    <INPUT TYPE=HIDDEN NAME="ACCION" VALUE="C">
  </p>
  <table class="tableinfo">
   <tr> 
   <td>
    <table cellspacing=0 cellpadding=2 width="100%" border="0">    
     	<tr id=trdark> 
	      <td nowrap width="40%"> 
	        <div align="right">Banco : </div>
	      </td>
	      <td nowrap> 
	        <input type="text" name="E01PFDBNK" size="3" maxlength="2" onKeypress="enterInteger(event)" value="<%=(msgMT.getE01PFDBNK().equals(""))?currUser.getE01UBK():msgMT.getE01PFDBNK()%>">
	      </td>
     	</tr>
     	<tr id=trclear> 
	      <td nowrap width="40%"> 
	        <div align="right">Oficina : </div>
	      </td>
	      <td nowrap> 
	        <input type="text" name="E01PFDBRN" size="5" maxlength="4" value="<%=(msgMT.getE01PFDBRN().equals("0"))?currUser.getE01UBR():msgMT.getE01PFDBRN() %>">
	        <a href="javascript:GetBranch('E01PFDBRN',document.forms[0].E01PFDBNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
	      </td>
     	</tr>
     	<tr id=trdark> 
		  <td> 
		     <div align="right">Estatus : </div>        
		  </td>
      	  <td nowrap> 
			<SELECT name="E01PFDSTS">
				<OPTION value="E"
					<%if (msgMT.getE01PFDSTS().equals("E")) { out.print("selected"); }%>>Enviado</OPTION>
				<OPTION value="R"
					<%if (msgMT.getE01PFDSTS().equals("R")) { out.print("selected"); }%>>Recibido</OPTION>
				<OPTION value="L"
					<%if (msgMT.getE01PFDSTS().equals("L")) { out.print("selected"); }%>>Eliminado</OPTION>
				<OPTION value="D"
					<%if (msgMT.getE01PFDSTS().equals("D")) { out.print("selected"); }%>>Disponible</OPTION>
			</SELECT>
      	  </td>     
      	</tr>
      	<tr id=trclear> 
		  <td> 
		     <div align="right">Rango Inicial : </div>        
		  </td>
      	  <td nowrap> 
      	    <input type="text" name="E01PFDINI" size="12" maxlength="12" value="<%= msgMT.getE01PFDINI()%>" onkeypress="enterInteger(event)">
      	  </td>     
      	</tr>
<!-- 
        <tr id=trdark>
          <td nowrap>
              <div align="right">Fecha Asignacion - Desde : </div>
          </td>
          <td nowrap> 
				<eibsinput:date name="msgMT" fn_year="E01PFDCSY" fn_month="E01PFDCSM" fn_day="E01PFDCSD" />
              &nbsp; Hasta : &nbsp; 
				<eibsinput:date name="msgMT" fn_year="E01PFDASY" fn_month="E01PFDASM" fn_day="E01PFDASD" />
          </td>
        </tr>
 -->
     </table>
    </td>
   </tr>
  </table>
  
  <p align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </p>
  
	<script type="text/javascript">
	  document.forms[0].E01PFDBNK.focus();
	  document.forms[0].E01PFDBNK.select();
	</script>
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
