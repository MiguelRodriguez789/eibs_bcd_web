<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="datapro.eibs.beans.EWD0205DSMessage"%><HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Covenat Form Help</TITLE>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<jsp:useBean id= "helpList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "helpBean" class= "datapro.eibs.beans.EWD0205DSMessage"  scope="session" />

<SCRIPT type="text/javascript">
	setTimeout("top.close()", <%= datapro.eibs.master.JSEIBSProp.getPopUpTimeOut() %>);
</SCRIPT>

<script type="text/javascript">

//<!-- Hide from old browsers
function selectCodes(code1) {
	var form = top.opener.document.forms[0];
	if (isValidObject(form[top.opener.fieldName])) form[top.opener.fieldName].value = code1;  	   
	top.close();
 }
 
function enter(){
	if (trim(document.forms[0].codigo.value)==""){
		alert("Coloque un Codigo de convenio para efectuar la busqueda");
		return;
	}	
	document.forms[0].submit();
 } 
 
//-->
</script>
</HEAD>
<BODY>
 <h4>Consulta de Planillas</h4>
<form METHOD="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0205">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
	<table id="TBHELPN" align="center">
		<tr>
			<td align="right" nowrap>Código  Convenio : </td>
			<td align="left"  nowrap>
				<input type="text" name="codigo" size="5" maxlength="4" value="${searchCode}">
			    <a href="javascript:GetCodeDescDeal('codigo','')">
			      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" >
			    </a>
			</td>
			<td align="left" nowrap>
				<div id="btnSearch"><img src="<%=request.getContextPath()%>/images/search1.gif" style="cursor:hand;" onClick="enter()" width="25" height="20"></div>
			</td>			
		</tr>	
	</table>
<%boolean firstCall = request.getParameter("firstCall")!= null?true:false;
 if (!firstCall){
 %>

<% if (helpList.isEmpty()){%>
	<TABLE class="tbenter" width=100% height=100%>
		<tr>
			<td ALIGN='CENTER'>No Existen Registros para este criterio de Búsqueda</td>
		</tr>
	</TABLE>							

<%} else { %>
			 
  <TABLE  id="mainTable" class="tableinfo" ALIGN=CENTER>
		   <TR id="trdark">
  					<TH ALIGN=CENTER>Numero</TH> 
  					<TH ALIGN=CENTER>Nombre</TH>
      		   </TR>
			<%	                  	
	
				while (helpList.getNextRow()) {
				
					helpBean = (EWD0205DSMessage)helpList.getRecord();
					out.println("<tr>");
					out.println("<td ALIGN='center'><A HREF=\"javascript:selectCodes('" + helpBean.getEWDNUM() +"')\">"  + helpBean.getEWDNUM() + " </a></td>");
					out.println("<td ALIGN='left'><A HREF=\"javascript:selectCodes('" + helpBean.getEWDNUM() +"')\">"  + helpBean.getEWDDES() + " </a></td>");
					out.println("</tr>");					
				}
				
			}
		}
			%>
</TABLE>
</form>
</BODY>
</HTML>
