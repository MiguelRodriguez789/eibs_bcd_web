<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import="datapro.eibs.master.*,datapro.eibs.beans.*"%>
<title></title>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR"
	content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">

<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/sortTables.js"> </SCRIPT>

<jsp:useBean id="ewd0005Help" class="datapro.eibs.beans.JBObjList"
	scope="session" />

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />

<script type="text/javascript">
//<!-- Hide from old browsers

function enter(code,numc,name,id,ccy,type,prod,card) {
	parent.query.enterAction(code,numc,name,id,ccy,type,prod,card);
 }

//-->
</script>
</head>

<body>

<FORM>
<%
	if ( ewd0005Help.getNoResult() ) {
%>
<TABLE class="tbenter" width=100% height=100%>
	<TR>
		<TD>

		<div align="center"><font size="3"><b> No hay datos
		que correspondan con su criterio de búsqueda</b></font></div>
		</TD>
	</TR>
</TABLE>
<%
	}
	else {
%>

<TABLE class="tableinfoList sortable" style="width: 95%" ALIGN=CENTER cellpadding="0"
	border="0">
	<TR id="trdark">
		<TH ALIGN=CENTER nowrap>Nombre Cliente</TH>
		<TH ALIGN=CENTER nowrap>Cuenta</TH>
		<TH align="CENTER" nowrap>Status</TH>
		<% if (userPO.getProdCode().equals("TC")){%>
		<TH ALIGN=CENTER nowrap>Tarjeta</TH>
		<% } %>
		<TH ALIGN=CENTER nowrap>Agencia</TH>
		<TH ALIGN=CENTER nowrap>Moneda</TH>
		<TH ALIGN=CENTER nowrap>Tipo</TH>
		<TH ALIGN=CENTER nowrap>Prod.</TH>
		<TH ALIGN=CENTER nowrap>Saldo</TH>
	</TR>
	<%
                String shrBank = (String)request.getAttribute("shrBank");
                String NameSearch = (String)request.getAttribute("NameSearch");
                String shrAppCode = (String)request.getAttribute("shrAppCode");
                String shrSelect = (String)request.getAttribute("shrSelect");
                String shrAcc ="";
                String shrClient = (String)request.getAttribute("shrClient");
                String shrType = (String)request.getAttribute("shrType");
				String arguments;
		        StringBuilder sb = new StringBuilder();                
                
                ewd0005Help.initRow();               
                while (ewd0005Help.getNextRow()) {
                    EWD0005DSMessage msgHelp = (EWD0005DSMessage) ewd0005Help.getRecord();			 
                    sb.append("'").append(msgHelp.getEWDACC()).append("',");
                    sb.append("'").append(msgHelp.getEWDCUN()).append("',");
                    sb.append("'").append(msgHelp.getEWDNME()).append("',");
                    sb.append("'").append(msgHelp.getEWDIDN()).append("',");
                    sb.append("'").append(msgHelp.getEWDCCY()).append("',");
                    sb.append("'").append(msgHelp.getEWDATY()).append("',");
                    sb.append("'").append(msgHelp.getEWDPRD()).append("',");
		            sb.append("'").append(msgHelp.getEWDNTA()).append("'");
		            arguments = sb.toString();
       %>

	<TR>
		<td NOWRAP><a
			href="javascript:enter(<%= arguments%>)">
		<%=Util.formatCell(msgHelp.getEWDNME())%></a></td>
		<td NOWRAP><a
			href="javascript:enter(<%= arguments%>)">
		<%=Util.formatCell(msgHelp.getEWDACC())%></a></td>
		<TD nowrap><A
			href="javascript:enter(<%= arguments%>)">
		<%=Util.formatCell(msgHelp.getEWDSTS())%></A></TD>
		<% if (userPO.getProdCode().equals("TC")){%>
		<td NOWRAP><a
			href="javascript:enter(<%= arguments%>)">
		<%=Util.formatCell(msgHelp.getEWDNTA())%></a></td>
		<% } %>
		<td NOWRAP align="center"><a
			href="javascript:enter(<%= arguments%>)">
		<%=Util.formatCell(msgHelp.getEWDBRN())%></a></td>
		<td NOWRAP align="center"><a
			href="javascript:enter(<%= arguments%>)">
		<%=Util.formatCell(msgHelp.getEWDCCY())%></a></td>
		<td NOWRAP align="center"><a
			href="javascript:enter(<%= arguments%>)">
		<%=Util.formatCell(msgHelp.getEWDATY())%></a></td>
		<td NOWRAP align="center"><a
			href="javascript:enter(<%= arguments%>)">
		<%=Util.formatCell(msgHelp.getEWDPRD())%></a></td>
		<td NOWRAP align="right"><a
			href="javascript:enter(<%= arguments%>)">
		<%=Util.fcolorCCY(msgHelp.getEWDAMT())%></a></td>
	</TR>
	<%  
	 	 sb.setLength(0); // set length of buffer to 0
		 sb.trimToSize(); // trim the underlying buffer
	     }
              %>
</TABLE>
<TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
	<TR>
		<TD WIDTH="50%" ALIGN=LEFT height="25">
		<%
        if ( ewd0005Help.getShowPrev() ) {
      			int pos =ewd0005Help.getFirstRec() - 21;
      			   out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.helps.JSEWD0005?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "&shrClient=" + shrClient + "&shrAcc=" + shrAcc + "&shrType=" + shrType + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%>
		</TD>
		<TD WIDTH="50%" ALIGN=RIGHT height="25">
		<%       
        if ( ewd0005Help.getShowNext() ) {
      			int pos = ewd0005Help.getLastRec();
      			out.print("<A HREF=\"" + request.getContextPath()+ "/servlet/datapro.eibs.helps.JSEWD0005?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "&shrClient=" + shrClient + "&shrAcc=" + shrAcc + "&shrType=" + shrType + "\" ><img src=\""+ request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

        }
%>
		</TD>
	</TR>
</TABLE>
<%      
  }
%>
</FORM>

</BODY>
</HTML>