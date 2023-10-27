<%@ page import="datapro.eibs.beans.ECO010001Message"%>
<%@ page import="datapro.eibs.master.Util"%>

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>Listado de Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<jsp:useBean id="ECO010001List" class="datapro.eibs.beans.JBObjList"
	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">


  function goAction(op) {
	var ok = false;
	
    for(n=0; n<document.forms[0].elements.length; n++)
     {
     	var elementName= document.forms[0].elements[n].name;
     	if(elementName == "key") 
     	{
			if (document.forms[0].elements[n].checked == true) {
      			ok = true;
      			break;
			}
     	}
     }      
	
     if ( ok ) {     	
		document.forms[0].SCREEN.value = op;
		document.forms[0].submit();
     } else {
		alert("Debe seleccionar un convenio para continuar.");	   
	 }
		
	}

  
 function showAddInfo(idxRow){
   tbAddInfo.rows[0].cells[1].style.color="#d0122c";   
   tbAddInfo.rows[0].cells[1].innerHTML=extraInfo(getElement("TXTDATA"+idxRow).value,4);
   } 
   
 function extraInfo(textfields,noField) {
	 var pos=0
	 var s= textfields;
	 for ( var i=0; i<noField ; i++ ) {
	   pos=textfields.indexOf("<br>",pos+1);
	  }
	 s=textfields.substring(0,pos);
	 return(s);
 }  

</script>

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Solicitudes de Convenios<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="covenant_approval_list.jsp,ECO0100"></h3>
<hr size="4">
<form method="POST"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0100">
<input type="hidden" name="SCREEN" value="201"> 
<input type="hidden" name="selected_customer">
<input type="hidden" name="customer_number" value="<%=(String) request.getAttribute("customer_number") %>">	

<table class="tbenter" width=100% align=center>
	<tr>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction(200)" id="linkApproval"><b>Aprobar</b></a></div>
		</td>
		<td class=TDBKG width="35%">
			<div align="center"><a href="javascript:goAction(300)" id="linkReject"><b>Rechazar</b></a></div>
		</td>
		<td class=TDBKG width="30%">
		<div align="center"><a
			href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a></div>
		</td>
	</tr>
</table>

<%
	if (ECO010001List.getNoResult()) {
%>
<TABLE class="tbenter" width=100% height=90%>
	<TR>
		<TD>
		<div align="center"><font size="3"><b> No hay
		resultados que correspondan a su criterio de búsqueda. </b></font></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
<table id="mainTable" class="tableinfo" align="center">
	<tr>
		<td nowrap valign="top">
		<table id="dataTable" width="100%">
			<tr id="trdark">
				<th align="center" nowrap></th>
				<th align="center" nowrap>N&uacute;mero</th>
				<th align="center" nowrap>Empleador</th>
				<th align="center" nowrap>Cliente Convenio</th>
			</tr>
			<%
				ECO010001List.initRow();
					int k = 0;
					boolean firstTime = true;
					String chk = "";
					while (ECO010001List.getNextRow()) {
						if (firstTime) {
							firstTime = false;
							chk = "checked";
						} else {
							chk = "";
						}
						ECO010001Message convObj = (ECO010001Message) ECO010001List
								.getRecord();
			%>
			<tr>
				<td nowrap><input type="radio" name="key"
					value="<%=k%>" onclick="showAddInfo(<%=k%>); setValue('<%=convObj.getE01EMPNUM()%>');"
					<%=chk%>></td>
				<td nowrap align="center"><a href="javascript:goAction(900);"><%= Util.formatCell(convObj.getE01EMPNUM())%></a></td>
				<td nowrap align="center"><a href="javascript:goAction(900);"><%= Util.formatCell(convObj.getE01EMPNA1())%></a></td>
				<td nowrap align="center"><a href="javascript:goAction(900);"><%= Util.formatCell(convObj.getE01CONNA1())%></a>
				<%
					String ls = "";
							ls += Util.formatCell(convObj.getE01EMPCUN()) + "<br>";
							ls += Util.formatCell(convObj.getE01CUSUSR()) + "<br>";
							ls += Util.fcolorCCY(convObj.getE01CUSRMK()) + "<br>";
				%>
				<input type="hidden" name="TXTDATA<%=k%>" value="<%=ls%>">
				</td>
			</tr>
			<%
				}
			%>
		</table>
		</td>
		<td nowrap align="right" valign="top">
			<table id="tbAddInfo" width="100%">
				<tr id="trdark">
					<th align="center" nowrap>Informaci&oacute;n B&aacute;sica</th>
				</tr>
				<tr id="trclear">
					<td>Numero de Cliente : <br>Usuario : <br>Remark : </td>
					<td align="left" valign="middle" nowrap class="tdaddinfo"></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<script type="text/javascript">
     showAddInfo(0);     
     
</script> <br>
<table class="tbenter" width="98%" align="center">
	<tr>
		<td width="50%" align="left">
		<%
			if (ECO010001List.getShowPrev()) {
					int pos = ECO010001List.getFirstRec() - 13;
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									//+ ECO010001List.getSearchText() + "&Type="
									//+ ECO010001List.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/previous_records.gif\" ></A>");
				}
		%>
		</td>
		<td width="50%" align="right">
		<%
			if (ECO010001List.getShowNext()) {
					int pos = ECO010001List.getLastRec();
					out
							.println("<A HREF=\""
									+ request.getContextPath()
									+ "/servlet/datapro.eibs.client.JSECIF010?SCREEN=3&NameSearch="
									//	+ cifList.getSearchText() + "&Type="
									//	+ cifList.getSearchType() + "&Pos=" + pos
									+ "\"><IMG border=\"0\" src=\""
									+ request.getContextPath()
									+ "/images/s/next_records.gif\" ></A>");
				}
		%>
		</td>
	</tr>
</table>
<%
	}
%>
</form>

</body>
</html>
