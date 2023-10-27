<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Swift Free Formats Approve/Transmit</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="fex" class="datapro.eibs.beans.ESWF01001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "SwiftFFList" class= "datapro.eibs.beans.JBList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
<!--
function goAction(op) {

	switch (op) {
		case 1 : // New
			document.forms[0].SCREEN.value ='1';
			document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF000";
			document.forms[0].submit();
			break;
		case 2 : // Maintenance
 			document.forms[0].SCREEN.value = '7';
	 		document.forms[0].submit();
	 		break;
		case 3 : // Inquiry
 			document.forms[0].SCREEN.value = '3';
	 		document.forms[0].submit();
	 		break;
		case 4 : // Approval
 			document.forms[0].ACTION.value = 'A';
	 		document.forms[0].submit();
	 		break;
		case 5 : // Delete
			var delok= false;
			delok = confirm("Are you sure you want to delete the Swift Free Format selected?"); 
	 		if ( delok) {
	 			document.forms[0].ACTION.value = 'D';
	 			document.forms[0].submit();
	 		}
	 		break;
       case 8 : // Logs
 			document.forms[0].SCREEN.value = '18';
	 		document.forms[0].submit();
	 		break;
		default :
 			document.forms[0].submit();
	}
	      
 }
 
 function setValue(usr,ref) {
	document.forms[0].USERID.value = usr;
    document.forms[0].REFNUM.value = ref;
 }

//-->
</script>
</head>
<body  >
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }

%>
<h3 align="center">Swift - Aprobar/Transmitir Formatos Libres<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="swift_free_format_approval_list.jsp,ESWF010A"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.forex.JSESWF010" >
  <p> 
   <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">
   <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="R">
   <INPUT TYPE=HIDDEN NAME="USERID" VALUE="">
   <INPUT TYPE=HIDDEN NAME="REFNUM" VALUE="">
   <INPUT TYPE=HIDDEN NAME="SWIFTFREE" VALUE="Y">
  </p>
  <%
	  if (SwiftFFList.getNoResult() ) {
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
  <table class="tbenter" width="26%" height="59">
    <tr> 
      <td align=CENTER class=TDBKG> <a href="javascript:goAction(4)" id="linkApproval"><b>Aprobar</b></a> 
      </td>
      <td align=CENTER class=TDBKG> <a href="javascript:goAction(5)"><b>Borrar</b></a> 
      </td>
      <td align=CENTER class=TDBKG> <a href="javascript:goAction(8)"><b>Logs</b></a> 
      </td>
      <td align=CENTER class=TDBKG> <a href="<%=request.getContextPath()%>/pages/background.jsp"><b>Salir</b></a> 
      </td>
    </tr>
  </table>
  <br>
  
  <TABLE  id="mainTable" class="tableinfo">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
		      <TH ALIGN=CENTER width="5%">&nbsp;</TH>
		      <TH ALIGN=CENTER width="15%">Formato</TH>
		      <TH ALIGN=CENTER width="20%">Usuario</TH>
		      <TH ALIGN=CENTER width="20%">Referencia</TH>
		      <TH ALIGN=CENTER width="20%">Fecha</TH>
		      <TH ALIGN=CENTER width="20%">Emisor <br>Identificaci&oacute;n <br>Swift </TH>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap" valign="top">      
		       <div id="dataDiv1" style="height:400px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
    <%
                SwiftFFList.initRow();
                while (SwiftFFList.getNextRow()) {
                    if (SwiftFFList.getFlag().equals("")) {
                    		out.println(SwiftFFList.getRecord());   
                    }
                }
        %> 
             </table>
             </div>
             </td>
             </tr>
</table>
     
  <BR>
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
  <TD WIDTH="50%" ALIGN=LEFT>
  <%
        if ( SwiftFFList.getShowPrev() ) {
      			int pos = SwiftFFList.getFirstRec() - 26;
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.forex.JSESWF0000?SCREEN=100&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/previous_records.gif\" ></A>");
        }
   %>  
  </TD>
  <TD WIDTH="50%" ALIGN=RIGHT>     
 <% 
        if ( SwiftFFList.getShowNext() ) {
      			int pos = SwiftFFList.getLastRec();
      			out.println("<A HREF=\""+request.getContextPath()+"/servlet/datapro.eibs.forex.JSESWF0000?SCREEN=100&Pos=" + pos +"\"><IMG border=\"0\" src=\""+request.getContextPath()+"/images/s/next_records.gif\" ></A>");
        }
  %> 
  </TD>
  </TR>
  </TABLE>
  
<SCRIPT type="text/javascript">
   radioClick("index1", 0);
</SCRIPT>
   <%  }  %>  
	

  </form>
</body>
</html>
