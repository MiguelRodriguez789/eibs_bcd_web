<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "java.io.*,java.net.*,datapro.eibs.sockets.*,datapro.eibs.beans.*,datapro.eibs.master.*" %>
<script type="text/javascript">
function enter(code, description, flag1) {
	var oForm = top.opener.document.forms[0];
	if (top.opener.fieldName.trim() != "" && oForm[top.opener.fieldName]) {
		oForm[top.opener.fieldName].value = code;
	}
	try {
		if (top.opener.fieldDesc.trim() != "" && oForm[top.opener.fieldDesc]) {
			oForm[top.opener.fieldDesc].value = description;
		}
	} catch(e) {
	}
	try {
		if (top.opener.fieldAux1.trim() != "" && oForm[top.opener.fieldAux1]) {
			oForm[top.opener.fieldAux1].value = flag1;
		}
	} catch(e) {
	}
	if(top.opener.fieldName.trim() != "" && oForm[top.opener.fieldName]){
		if (typeof oForm[top.opener.fieldName].onchange === "function" ){
			oForm[top.opener.fieldName].onchange();	
		}	
	}
	
	setTimeout(function(){ top.close(); },500); //In order for Request to be Sent.
 }
</script>
<TITLE></TITLE>
</head>
<jsp:useBean id= "ewd0158Help" class= "datapro.eibs.beans.JBList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<body>

 <SCRIPT SRC="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<FORM>
<%
	if ( ewd0158Help.getNoResult() ) {
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
      <TH ALIGN=CENTER  nowrap width="15%">Cod&iacute;go</TH>
      <TH ALIGN=CENTER  nowrap width="15%">Tipo</TH>
      <TH ALIGN=LEFT  nowrap width="70%">Descripci&oacute;n</TH>
    </TR>
    <%
                String srchCovenio = (String)request.getAttribute("srchCovenio");
                ewd0158Help.initRow();
                while (ewd0158Help.getNextRow()) {
                    if (ewd0158Help.getFlag().equals("")) {
                    		out.println(ewd0158Help.getRecord());
                    }
                }
              %>
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ewd0158Help.getShowPrev() ) {
      			int pos =ewd0158Help.getFirstRec() - 21;
      			   out.print("<A HREF=\""+ request.getContextPath()+"/servlet/datapro.eibs.helps.JSEWD0158?srchCovenio=" + srchCovenio + " \"> <img src=\"" + request.getContextPath() + "/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%
        if ( ewd0158Help.getShowNext() ) {
      			int pos = ewd0158Help.getLastRec();
      			out.print("<A HREF=\"" +request.getContextPath() +"/servlet/datapro.eibs.helps.JSEWD0158?srchCovenio=" + srchCovenio + " \" ><img src=\""+ request.getContextPath() + "/images/s/next_records.gif\" border=0></A>");

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

