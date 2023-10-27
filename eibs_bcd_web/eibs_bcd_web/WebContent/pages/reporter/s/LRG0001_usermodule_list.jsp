<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.Iterator, com.datapro.eibs.reporter.model.ModuleDTO" %>
<jsp:useBean id= "msg" class= "com.datapro.eibs.reporter.forms.LRG000101"  scope="request" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Usermodule List</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link type="text/css" href="<%=request.getContextPath()%>/pages/reporter/css/smoothness/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<link type="text/css" href="<%=request.getContextPath()%>/pages/reporter/css/common.css" rel="stylesheet" />
<link type="text/css" href="<%=request.getContextPath()%>/pages/reporter/css/ui.multiselect.css" rel="stylesheet" />
<link type="text/css" href="<%=request.getContextPath()%>/pages/reporter/css/lrg_reporter_eibs.css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/plugins/tmpl/jquery.tmpl.1.1.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/ui.multiselect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/reporter/javascripts/lrg.reporter_eibs.js"></script>

<script type="text/javascript">
$(function(){
  $(".multiselect").multiselect({sortable: true, searchable: false});
});
	$form = $('#filters');
    $(document).ready(function() {
    	addOnClickHandlers('#availFieldsDivID', '#regFieldIco');
    	addOnClickHandlers('#selectedFieldsDivID', '#regFieldIco');
    });

function goAction(val)
{

	if (val == 2)
	{
		document.forms[0].SCREEN.value = '10';
		document.forms[0].submit();
	}
	else if (val == 1)
		prepareSubmit();
		

}
</script>

</head>

<body>
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
    error.setERRNUM("0");
	out.println("<script type=\"text/javascript\">");
    out.println("showErrors();");
    out.println("</script>");
 }
 %>
<h3 class="h3title">Acceso al Generador de Reportes<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="usermodule_list, LRG0001">
</h3>
<hr class="raya">
<br>
<table class="header_table">
    <tr> 
      <td nowrap align="center"> 
        Usuario:&nbsp;&nbsp;&nbsp;<b><%= msg.getUserID()%></b>
      </td>
    </tr>       
  </table>
  <br>
  <table width="100%" cellpadding="0" cellspacing="0"><tr><td align="center" height="30" bgcolor="FFFFFF"><span class="message"><%=(msg.getMessage()!=null)?msg.getMessage():""%></span></td></tr></table>
  <br>
  <form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.reporter.controller.JSLRG0001">
  <input type="hidden" name="SCREEN" value="30">
  <input type="hidden" name="USERID" value="<%= msg.getUserID() %>">
  <div style="margin:0 auto 0 auto; width: 640px;">
 							<table class="headerListTable">
							<tr>
								<th>Disponibles&nbsp;&nbsp;
								<a href="#" onclick="swapAll('ulRegular_fieldz', 'regFieldIco');return false;" class="tiny_font">
										Pasar todos
									</a></th>
								<th>Seleccionados&nbsp;&nbsp;
								<a href="#" onclick="swapAll('ulRegFldzSel', 'regFieldIco');return false;" class="tiny_font">
										Retirar todos
									</a>
								</th>
							</tr>
						</table>
  </div>

  <div id="divSelectableModuleList">
								<table class="tabSelectableList">
								<tr>
									<td width="340" valign="top">
									
									<div id="availFieldsDivID">
									<ul id="ulRegular_fieldz" class="boxy">
<%
	int ix = 0;
	if (msg.getMissingModuleList()!=null)
	{
		for (Iterator it = msg.getMissingModuleList().iterator(); it.hasNext();)
		{
			ModuleDTO moduleDTO = (ModuleDTO) it.next();
%>									
			<li name="aField">
			<table class="fld_lst_table">
				<tr>
					<td class="fld_dsc_td"><span id="fldValueID"><%=moduleDTO.getMODDSC() %></span></td>
					<td class="fld_fun_td">&nbsp;</td>
					<td class="fld_ico_td"><span id="regFieldIco" class="ui-icon ui-icon-plus"></span></td>
					<td><input type="hidden" id="fldKeyID" class="fldcls" name="rfs_h" value="<%=moduleDTO.getID_MOD() %>"></td>
				</tr>
			</table>
			</li>
<%			
		}		
	}
%>
								</ul>
								</div>
								
								<div id="selectedListToPost"></div>
								</td>
								<td width="340" valign="top">
								<div id="selectedFieldsDivID">
								<ul id="ulRegFldzSel" class="boxy">
<%
	if (msg.getModuleList()!=null)
	{
		for (Iterator it = msg.getModuleList().iterator(); it.hasNext();)
		{
			ModuleDTO moduleDTO = (ModuleDTO) it.next();
%>									
									<li name="aField">
									<table class="fld_lst_table">
										<tr>
											<td class="fld_dsc_td"><span id="fldValueID"><%=moduleDTO.getMODDSC()%></span></td>
											<td class="fld_fun_td">&nbsp;</td>
											<td class="fld_ico_td"><span id="regFieldIco" class="ui-icon ui-icon-minus"></span></td>
											<td><input type="hidden" id="fldKeyID" class="fldcls" name="rfs_h" value="<%=moduleDTO.getID_MOD()%>"></td>
										</tr>
									</table>
									</li>
<%			
		}
	}
%>
								</ul>
								</div>
								</td>
							</tr>
						</table>
						</div>
 

		<br>
		<p align="center">  
   		<input id="EIBSBTN" type="button" value="Enviar" onClick="javascript:goAction(1);">
   		&nbsp;&nbsp;&nbsp;
   		<input id="EIBSBTN" type="button" value="Retornar" onClick="javascript:goAction(2);">
   		</p>
  </form>
<jsp:include page="LRG0001_include_common.jsp" flush="true"/> 
</body>
</html>