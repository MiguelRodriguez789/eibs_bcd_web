<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title></title>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "EWD0037Help" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script language="javascript">
//<!-- Hide from old browsers

function enter(code,numc,name,id,ccy,type,prod,amt) {
	parent.query.enterAction(code,numc,name,id,ccy,type,prod,amt);
 }

//-->
</script>
</head>

<body>

<FORM>
<%
	if ( EWD0037Help.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de búsqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	}
	else {
%>
 
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER cellpadding="0" border="0">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap>Nombre Cliente</TH>
      <TH ALIGN=CENTER  nowrap>Reserva</TH>
		<TH align="CENTER" nowrap>Status</TH>
      <TH ALIGN=CENTER  nowrap>Agencia</TH>
      <TH ALIGN=CENTER  nowrap>Moneda</TH>
      <TH ALIGN=CENTER  nowrap>Tipo</TH>
      <TH ALIGN=CENTER  nowrap>Prod.</TH>
      <TH ALIGN=CENTER  nowrap>Monto Aprobado</TH>
      <TH ALIGN=CENTER  nowrap>Garantia Asig.</TH>
    </TR>
    <%
                String shrBank = (String)request.getAttribute("shrBank");
                String NameSearch = (String)request.getAttribute("NameSearch");
                String shrAppCode = (String)request.getAttribute("shrAppCode");
                String shrSelect = (String)request.getAttribute("shrSelect");
                String shrAcc ="";
                String shrClient = (String)request.getAttribute("shrClient");
                String shrType = (String)request.getAttribute("shrType");
                EWD0037Help.initRow();               
                while (EWD0037Help.getNextRow()) {
                    EWD0037DSMessage msgHelp = (EWD0037DSMessage) EWD0037Help.getRecord();			 
                    
       %>             
                    
          <TR>
          <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.formatCell(msgHelp.getEWDNME())%></a>
		  </td>
		  <td NOWRAP >
			<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.formatCell(msgHelp.getEWDACC())%></a>
		  </td>
		<TD nowrap><A
			href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
          							  <%=Util.formatCell(msgHelp.getEWDSTS())%></A></TD>
		<% if (userPO.getProdCode().equals("TC")){%>
		  <td NOWRAP >
			<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.formatCell(msgHelp.getEWDNTA())%></a>
		  </td>
		  <% } %>
		  <td NOWRAP align="center">
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.formatCell(msgHelp.getEWDBRN())%></a>
		  </td>
		  <td NOWRAP align="center">
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.formatCell(msgHelp.getEWDCCY())%></a>
		  </td>
		  <td NOWRAP align="center">
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.formatCell(msgHelp.getEWDATY())%></a>
		  </td>
		  <td NOWRAP align="center">
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.formatCell(msgHelp.getEWDPRD())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.fcolorCCY(msgHelp.getEWDAMT())%></a>
		  </td>
		  <td NOWRAP >
          	<a href="javascript:enter('<%=msgHelp.getEWDACC()%>',
          							  '<%=msgHelp.getEWDCUN()%>',
          							  '<%=msgHelp.getEWDNME()%>',
          							  '<%=msgHelp.getEWDIDN()%>',
          							  '<%=msgHelp.getEWDCCY()%>',
          							  '<%=msgHelp.getEWDATY()%>',
          							  '<%=msgHelp.getEWDPRD()%>',
          							  '<%=msgHelp.getEWDAMT()%>',
          							  '<%=msgHelp.getEWDCMP()%>')">
										<%=Util.formatCell(msgHelp.getEWDCMP())%></a>
		  </td>
		</TR>
        <%        }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( EWD0037Help.getShowPrev() ) {
      			int pos =EWD0037Help.getFirstRec() - 21;
      			   out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.helps.JSEWD0037?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "&shrClient=" + shrClient + "&shrAcc=" + shrAcc + "&shrType=" + shrType + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( EWD0037Help.getShowNext() ) {
      			int pos = EWD0037Help.getLastRec();
      			out.print("<A HREF=\"" + request.getContextPath()+ "/servlet/datapro.eibs.helps.JSEWD0037?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&shrBank=" + shrBank + "&shrAppCode=" + shrAppCode + "&shrSelect=" + shrSelect + "&shrClient=" + shrClient + "&shrAcc=" + shrAcc + "&shrType=" + shrType + "\" ><img src=\""+ request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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