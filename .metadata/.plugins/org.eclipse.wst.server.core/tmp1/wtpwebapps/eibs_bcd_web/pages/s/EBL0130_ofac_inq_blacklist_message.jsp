<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<title></title>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "ebl013001List" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript">
//<!-- Hide from old browsers

//function enter(code,numc,name,id,ccy,type,prod,card) {
//	parent.query.enterAction(code,numc,name,id,ccy,type,prod,card);
//}
function enter(code, idn, timest) {
	parent.query.enterAction(code, idn, timest);
}
//-->
</script>
</head>

<body>

<FORM>
<%
	if ( ebl013001List.getNoResult() ) {
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
 <br>
  <TABLE class="tableinfo" style="width:95%" ALIGN=CENTER cellpadding="0" border="0">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap>Nombre Cliente</TH>
      <TH ALIGN=CENTER  nowrap>Pa&iacute;s</TH>
		<TH align="CENTER" nowrap>Tipo</TH>
      <TH ALIGN=CENTER  nowrap>Identidad</TH>
      <TH ALIGN=CENTER  nowrap>Cliente</TH>
      <TH ALIGN=CENTER  nowrap>Tipo de Lista</TH>
      <TH ALIGN=CENTER  nowrap>Fecha de la consulta</TH>
    </TR>
    <%
                String NameSearch = (String)request.getAttribute("NameSearch");
                String Type = (String) request.getAttribute("Type");
                ebl013001List.initRow();
                int idx = 0;               
                while (ebl013001List.getNextRow()) {
                    EBL013001Message msgHelp = (EBL013001Message) ebl013001List.getRecord();			 
                    
       %>             
          <tr id="<%= (idx++ % 2 == 0) ? "trclear" : "trdark" %>">
          <td nowrap>&nbsp;
          	<a href="javascript:enter('<%=msgHelp.getE01OFACUN()%>',
          							  '<%=msgHelp.getE01OFAIDN()%>',
          							  '<%=msgHelp.getE01OFALMT()%>')">
										<%=Util.formatCell(msgHelp.getE01OFANA1())%></a>
		  </td>
		  <td nowrap align="center">
          	<a href="javascript:enter('<%=msgHelp.getE01OFACUN()%>',
          							  '<%=msgHelp.getE01OFAIDN()%>',
          							  '<%=msgHelp.getE01OFALMT()%>')">
										<%=Util.formatCell(msgHelp.getE01OFAPID())%></a>
		  </td>
		  <td nowrap align="center">          	
			<a href="javascript:enter('<%=msgHelp.getE01OFACUN()%>',
          							  '<%=msgHelp.getE01OFAIDN()%>',
          							  '<%=msgHelp.getE01OFALMT()%>')">
										<%=Util.formatCell(msgHelp.getE01OFATID())%></a>
		  </td>
		  <td nowrap align="center">          	
			<a href="javascript:enter('<%=msgHelp.getE01OFACUN()%>',
          							  '<%=msgHelp.getE01OFAIDN()%>',
          							  '<%=msgHelp.getE01OFALMT()%>')">
										<%=Util.formatCell(msgHelp.getE01OFAIDN())%></a>
		  </td>
		  <td nowrap align="center">          	
			<a href="javascript:enter('<%=msgHelp.getE01OFACUN()%>',
          							  '<%=msgHelp.getE01OFAIDN()%>',
          							  '<%=msgHelp.getE01OFALMT()%>')">
										<%=Util.formatCell(msgHelp.getE01OFACUN())%></a>
		  </td>
		  <td nowrap align="center">          	
			<a href="javascript:enter('<%=msgHelp.getE01OFACUN()%>',
          							  '<%=msgHelp.getE01OFAIDN()%>',
          							  '<%=msgHelp.getE01OFALMT()%>')">
										<%=Util.formatCell(msgHelp.getE01OFATLT().equals("1")? "OFAC" : "Banco")%></a>
		  </td>
		  <td nowrap align="center">          	
			<a href="javascript:enter('<%=msgHelp.getE01OFACUN()%>',
          							  '<%=msgHelp.getE01OFAIDN()%>',
          							  '<%=msgHelp.getE01OFALMT()%>')">
										<%= msgHelp.getE01OFALMD()%>/<%= msgHelp.getE01OFALMM()%>/<%= msgHelp.getE01OFALMY()%></a>
		  </td>
		</tr>
        <%        }
              %> 
  </TABLE>
  <TABLE  class="tbenter" WIDTH="98%" ALIGN=CENTER>
    <TR>
      <TD WIDTH="50%" ALIGN=LEFT height="25"> <%
        if ( ebl013001List.getShowPrev() ) {
      			int pos = ebl013001List.getFirstRec() - 50;
      			   out.print("<A HREF=\"" + request.getContextPath() + "/servlet/datapro.eibs.tools.JSEBL0130?NameSearch=" + NameSearch + "&FromRecord=" + pos + "&Type=" + Type + "\" > <img src=\""+request.getContextPath()+"/images/s/previous_records.gif\" border=0></A>");
        }
%> </TD>
 	  <TD WIDTH="50%" ALIGN=RIGHT height="25"> <%       
        if ( ebl013001List.getShowNext() ) {
      			int pos = ebl013001List.getLastRec();
      			out.print("<A HREF=\"" + request.getContextPath()+ "/servlet/datapro.eibs.tools.JSEBL0130?NameSearch=" + NameSearch + "&FromRecord=" + pos +  "&Type=" + Type + "\" ><img src=\""+ request.getContextPath()+"/images/s/next_records.gif\" border=0></A>");

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