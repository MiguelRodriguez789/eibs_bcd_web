<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*" %>
<script type="text/javascript">
//<!-- Hide from old browsers
function enter(code, desc) {
	var oForm = top.opener.document.forms[0];
	if (top.opener.fieldName.trim() != "" && oForm[top.opener.fieldName]) {
		oForm[top.opener.fieldName].value = code;
	}
	if (top.opener.fieldAux1.trim() != "" && oForm[top.opener.fieldAux1]) {
		oForm[top.opener.fieldAux1].value = desc;
	}
	top.close();
 }
//-->
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "ewd0150Help" class= "datapro.eibs.beans.JBList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>

 <SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( ewd0150Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD>

      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font>
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>

  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER>
    <TR id="trdark">
      <TH ALIGN=CENTER  nowrap width="15%">Producto</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Tipo</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Moneda</TH>
      <TH ALIGN=CENTER  nowrap width="55%">Descripción</TH>
    </TR>
    <%
                String AppCode = (String)request.getAttribute("AppCode");
                ewd0150Help.initRow();
                while (ewd0150Help.getNextRow()) {
                    if (ewd0150Help.getFlag().equals("")) {
                    		out.println(ewd0150Help.getRecord());
                    }
                }
              %>
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0150Help.getShowPrev() ) {
      			int pos = ewd0150Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+ request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0150?AppCode=" + AppCode + "&FromRecord=" + pos + " \"> <img src=\"" + request.getContextPath() + "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%
        if ( ewd0150Help.getShowNext() ) {
      			int pos = ewd0150Help.getLastRec();
      			out.print("<A HREF=\"" +request.getContextPath() +"/servlet/datapro.eibs.helps.JSEWD0150?AppCode=" + AppCode + "&FromRecord=" + pos + " \" ><img src=\""+ request.getContextPath() + "/images/s/next_records.gif\" border=0></A>");

        }
%> </TD>
	 </TR>
	 </TABLE>
<%
  }
%>
</FORM>
</BODY>
</HTML>

