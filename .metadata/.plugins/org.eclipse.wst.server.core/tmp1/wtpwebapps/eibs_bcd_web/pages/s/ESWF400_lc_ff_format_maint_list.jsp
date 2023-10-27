<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.beans.ESWF40001Message"%>
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Formato Libre Swift</title>
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
function goAction(op) {

	switch (op) {
		case 200 : // New
			document.forms[0].SCREEN.value ='907';
			document.forms[0].submit();
			break;
		case 300 : // Maintenance
 			document.forms[0].SCREEN.value = '971';
	 		document.forms[0].submit();
	 		break;
		case 3 : // Inquiry
 			document.forms[0].SCREEN.value = '903';
	 		document.forms[0].submit();
	 		break;
		case 4 : // Approval
 			document.forms[0].ACTION.value = 'A';
	 		document.forms[0].submit();
	 		break;
		case 5 : // Delete
			var delok= false;
			delok = confirm("Desea borrar el mensaje swift seleccionado? "); 
	 		if ( delok) {
	 			document.forms[0].ACTION.value = 'D';
	 			document.forms[0].submit();
	 		}
	 		break;
      	default :
 			document.forms[0].submit();
	}
	      
 }
 
 function setValue(acc,seq) {
	document.forms[0].LCOACC.value = acc;
    document.forms[0].LCOSEQ.value = seq;
 }

function viewMessage(idxRow) {
	var text = getElement("TXTMESSAGE"+idxRow).value;

	page = webapp + "/pages/s/MISC_message_viewer.jsp?MESSAGE=" + text;
	CenterWindow(page,300,200,2);
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
<h3 align="center">Formato Libre Swift <%= titTypePlu %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_ff_format_main_list.jsp,ESWF4000"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSESWF400" >
  <p> 
   <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="908">
   <!-- INPUT TYPE=HIDDEN NAME="ACTION" VALUE="R"-->
   <input type=HIDDEN name="LCOACC" value="<%=(String) request.getAttribute("LCOACC") %>">
   <INPUT TYPE=HIDDEN NAME="LCOSEQ">
   <input type=HIDDEN name="typ" value="<%=request.getAttribute("typ")!=null?(String) request.getAttribute("typ"):"" %>">
   <!-- INPUT TYPE=HIDDEN NAME="SWIFTFREE" VALUE="Y"-->
   
  </p>

  <table class="tbenter" width="100%" height="59">
    <tr>
      <td align=CENTER class=TDBKG> <a href="javascript:goAction(200)" id="linkApproval"><b>Nuevo</b></a> 
      </td>
      <td align=CENTER class=TDBKG> <a href="javascript:goAction(300)" id="linkApproval"><b>Mantenimiento</b></a> 
      </td>      
      <%-- td align=CENTER class=TDBKG> <a href="javascript:goAction(4)" id="linkApproval"><b>Aprobar</b></a> 
      </td 
      <td align=CENTER class=TDBKG> <a href="javascript:goAction(5)"><b>Borrar</b></a> 
      </td>--%>
      <td align=CENTER class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a> 
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
  <TABLE class="tableinfo" width="361">
    <TR id="trdark"> 
      <TH ALIGN=CENTER >&nbsp;</TH>
      <TH ALIGN=CENTER >Formato</TH>
      <TH ALIGN=CENTER >Usuario</TH>
      <TH ALIGN=CENTER >Referencia</TH>
      <TH ALIGN=CENTER >Fecha</TH>
      <TH ALIGN=CENTER >BIC Receptor <br>
                Swift </TH>
    </TR>
<%
				ESWF40001List.initRow();
					int indexRow = 0;
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
							<TR>
							<TD NOWRAP>
								<INPUT TYPE="HIDDEN" NAME="TXTMESSAGE<%=indexRow%>" VALUE="<%= ESWF40001Obj.getE01MSGTXT()%>">
								<input type="radio" name="REFNUM" value="<%=ESWF40001Obj.getE01LCOREF()%>" <%=chk%> 
								onclick="setValue('<%=ESWF40001Obj.getE01LCOACC()%>', '<%=ESWF40001Obj.getE01LCOSEQ()%>')"></TD>
							<TD NOWRAP ALIGN=CENTER>
								<%=Util.formatCell(ESWF40001Obj.getE01LCOFMT())%>
								<% if (!ESWF40001Obj.getE01MSGTXT().trim().equals("")) { %>
								&nbsp;
									<img border="0" src="<%=request.getContextPath()%>/images/ico1.gif" title="TRX con observaci&oacute;n" onclick="viewMessage('<%=indexRow%>')">
								<% } %>								
							</TD>
							<TD NOWRAP ALIGN=CENTER><%=Util.formatCell(ESWF40001Obj.getE01LCOUSR())%></TD>
							<TD NOWRAP ALIGN=CENTER><%=Util.formatCell(ESWF40001Obj.getE01LCOREF())%></TD>
							<TD NOWRAP ALIGN=CENTER><%=Util.formatCustomDate(currUser.getE01DTF(), ESWF40001Obj.getE01LCOMDM(),ESWF40001Obj.getE01LCOMDD(),ESWF40001Obj.getE01LCOMDY())%>
								</TD>	
							<TD NOWRAP ALIGN=CENTER><%=Util.formatCell(ESWF40001Obj.getE01LCOSRI())%></TD>
							</TR>
							<% 
							indexRow++;
							} 
							%>							
  </table>
  <BR>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( ESWF40001List.getShowPrev() ) {
      			int pos = ESWF40001List.getFirstRec() - 26;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSESWF400?SCREEN=906&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( ESWF40001List.getShowNext() ) {
      			int pos = ESWF40001List.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.products.JSESWF400?SCREEN=906&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
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
