<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.beans.ESWF40001Message"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Swift Q and A Formats Approval/Transmission</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "ESWF40001List" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
<!--
var reason = '';
function goAction(op) {
	switch (op) {
		case 200 : // New
			document.forms[0].SCREEN.value ='7';
			document.forms[0].submit();
			break;
		case 300 : // Maintenance
 			document.forms[0].SCREEN.value = '71';
	 		document.forms[0].submit();
	 		break;
		case 9 : // Inquiry
			showInqApproval();
	 		break;
		case 4 : // Approval
 			document.forms[0].SCREEN.value = '501';		
 			document.forms[0].ACTION.value = 'A';
	 		document.forms[0].submit();
	 		break;
		case 5 : // Delete
			var delok= false;
			delok = confirm("Desea borrar el mensaje swift seleccionado? "); 
	 		if ( delok) {
	 			document.forms[0].SCREEN.value = '502';
	 			document.forms[0].ACTION.value = 'D';
	 			document.forms[0].submit();
	 		}
	 		break;
		case 6 : // Reject
 			document.forms[0].SCREEN.value = '503';
 			document.forms[0].ACTION.value = 'R';
 			document.forms[0].reason.value = reason;
 			document.forms[0].submit();
	 		break;	 		
      	default :
 			document.forms[0].submit();
	}
	      
 }
 
 function setValue(acc,seq) {
	document.forms[0].LCOACC.value = acc;
    document.forms[0].LCOSEQ.value = seq;
 }

function showInqApproval()
{
	account = document.forms[0].LCOACC.value;
	seq = document.forms[0].LCOSEQ.value; 
	page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSESWF400?SCREEN=9&LCOACC=" + account +"&LCOSEQ=" + seq;
	CenterWindow(page,620,600,2);
}
//-->
</script>
</head>
<% 
	String typ = "", titTypeSing = "Carta de Cr&eacute;dito", titTypePlu = "Cartas de Cr&eacute;dito";
	if (request.getAttribute("typ")!=null)
		typ = (String) request.getAttribute("typ");  
	if (typ.equals("COLL"))
	{
		titTypeSing = "Cobranza";
		titTypePlu = "Cobranzas";
	}
%>

<body  >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<h3 align="center">Aprobar Formatos de Preguntas y Respuestas de <%= titTypePlu %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_qa_format_approval_list.jsp,ESWF4000"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESWF400" >
  <p> 
   <INPUT TYPE=HIDDEN NAME="SCREEN">
   <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="R">
   <input type=HIDDEN name="LCOACC" value="<%=(String) request.getAttribute("LCOACC") %>">
   <input type=HIDDEN name="typ" value="<%=typ %>">
   <INPUT TYPE=HIDDEN NAME="LCOSEQ">
	<input type=HIDDEN name="reason" value="">
  </p>

  <table class="tbenter" width="100%" height="59">
    <tr>
      <td align="CENTER" class="TDBKG" width="25%"> <a href="javascript:goAction(9)" id="linkInquiry"><b>Consultar</b></a> 
      </td>    
      <td align="CENTER" class="TDBKG" width="20%"> <a href="javascript:goAction(4)" id="linkApproval"><b>Aprobar</b></a> 
      </td>
      <td align="CENTER" class="TDBKG" width="20%"> <a href="javascript:enterReason(6)" id="linkReject"><b>Rechazar</b></a> 
      </td>
      <td align="CENTER" class="TDBKG" width="20%"> <a href="javascript:goAction(5)" id="linkDelete"><b>Borrar</b></a> 
      </td>      
      <td align="CENTER" class="TDBKG" width="20%"> <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a> 
      </td>
    </tr>
  </table>
  <br>

  <%
	  if (ESWF40001List.getNoResult() ) {
  %> 
  <h4></h4>
	  <TABLE class="tbenter" width=100%  height=75%>
   		<TR>
        <TD> 
        <div align="center"> <b>No hay resultados que correspondan con su criterio 
          de b&uacute;squeda</b> </div>
      </TD></TR>
   		</TABLE>
  <%   		
	}
	else {
  %> 
  <table class="tableinfo" width="361">
    <tr id="trdark"> 
      <th align="center">&nbsp;</th>
      <th align="center">No. <%=titTypeSing %></th>
      <th align="center">Formato</th>
      <th align="center">Usuario</th>
      <th align="center">Fecha</th>
      <th align="center">BIC Receptor <br>
                Swift </th>
    </tr>
<%
				ESWF40001List.initRow();
					int k = 0;
					boolean firstTime = true;
					String chk = "";
					while (ESWF40001List.getNextRow()) {
						ESWF40001Message ESWF40001Obj = (ESWF40001Message) ESWF40001List.getRecord();
						
						if (firstTime) {
							firstTime = false;
							chk = "checked";
							out.println("<script type=\"text/javascript\">setValue('"
								+ ESWF40001Obj.getE01LCOACC()
								+ "', '"
								+ ESWF40001Obj.getE01LCOSEQ()
								+"');</script>");
						} else {
							chk = "";
						}
%>
							<tr>
							<td nowrap>
								<input type="radio" name="REFNUM" value="<%=ESWF40001Obj.getE01LCOREF()%>" <%=chk%> 
								onclick="setValue('<%=ESWF40001Obj.getE01LCOACC()%>', '<%=ESWF40001Obj.getE01LCOSEQ()%>')"></td>
							<td nowrap align="center"><%=Util.formatCell(ESWF40001Obj.getE01LCOACC())%></td>
							<td nowrap align="center"><%=Util.formatCell(ESWF40001Obj.getE01LCOFMT())%></td>
							<td nowrap align="center"><%=Util.formatCell(ESWF40001Obj.getE01LCOUSR())%></td>
							<td nowrap align="center"><%=Util.formatCustomDate(currUser.getE01DTF(), ESWF40001Obj.getE01LCOMDM(),ESWF40001Obj.getE01LCOMDD(),ESWF40001Obj.getE01LCOMDY())%>
								</td>	
							<td nowrap align="center"><%=Util.formatCell(ESWF40001Obj.getE01LCOSRI())%></td>
							</tr>
<% } %>							
  </table>
  <BR>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( ESWF40001List.getShowPrev() ) {
      			int pos = ESWF40001List.getFirstRec() - 26;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSESWF400?SCREEN=6&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( ESWF40001List.getShowNext() ) {
      			int pos = ESWF40001List.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSESWF400?SCREEN=6&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
  %> 
  </TD>
  </TR>
  </TABLE>
   <%
  }
 %>  
	

  </form>
</body>
</html>
