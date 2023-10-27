<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="datapro.eibs.beans.EWD0200DSMessage"%><HTML>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<TITLE>Covenat Form Help</TITLE>

<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "helpList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "helpBean" class= "datapro.eibs.beans.EWD0200DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
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
 <h4>Consulta de Solicitudes</h4>
<form action="<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0200">
<INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
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
				
					helpBean = (EWD0200DSMessage)helpList.getRecord();
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
