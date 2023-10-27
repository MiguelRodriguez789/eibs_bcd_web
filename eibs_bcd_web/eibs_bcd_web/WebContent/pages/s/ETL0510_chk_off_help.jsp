<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<HTML>
<HEAD>
<TITLE>
Cheques de Gerencia
</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
</HEAD>

<jsp:useBean id= "dvList" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<BODY>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<script type="text/javascript">
//<!-- Hide from old browsers

function enter(code, account, bank, branch) {
	var formLength = top.opener.document.forms[0].elements.length;
	for (n=0; n<formLength; n++) {
		var elementName = top.opener.document.forms[0].elements[n].name;
		if (elementName == top.opener.fieldName) {
	  		top.opener.document.forms[0].elements[n].value = code;
	  		break;
		}
		if (elementName == top.opener.fieldAccount) {
	  		top.opener.document.forms[0].elements[n].value = account;
	  		break;
		}
	}

	top.close();
}

//-->
</script>


<h3 align="center">Cheques de Gerencia</h3>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%> 

<FORM>
<%
	if ( dvList.getNoResult() ) {
%>
 		<TABLE class="tbenter" width=100% height=100%>
 		<TR>
      <TD> 
        
      <div align="center"> <font size="3"><b> No hay datos que correspondan con su criterio de busqueda</b></font> 
      </div>
      </TD></TR>
   		</TABLE>
<%
	} else {
%>

  <h3 align="center">
    <% boolean chkof = false; 
    if (userPO.getOption().equals("3"))
  		 out.print("Lista Orden de Pago");
 	 else if (userPO.getOption().equals("4")) 	 
 	   		 out.print("Lista Cheques de Terceros");
  	 else{ out.print("Lista Cheques Oficiales");
  	 	chkof = true;
  	 }
  %>
  <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="chk_off_help.jsp,ETL0510"> 
  </h3>
  
  <hr size="4">
  <p>&nbsp;</p>
  <TABLE class="tableinfo">
    <TR id="trdark"> 
      <TH ALIGN=CENTER  nowrap width="10%">Referencia</TH>
      <%if(chkof){ %>
      	<TH ALIGN=CENTER  nowrap width="10%">Cheque</TH>
      <%} %>
      <TH ALIGN=CENTER  nowrap width="5%">Moneda</TH>
      <TH ALIGN=CENTER  nowrap width="5%">Sucursal</TH>
      <TH ALIGN=CENTER  nowrap width="40%">Beneficiario</TH>
      <TH ALIGN=CENTER  nowrap width="20%">Monto</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Estado</TH>
      <TH ALIGN=CENTER  nowrap width="10%">Emitido</TH>
    </TR>
    <%
        dvList.initRow(); 
		boolean firstTime = true;
		String chk = "";
        while (dvList.getNextRow()) {
			if (firstTime) {
				firstTime = false;
				chk = "checked";
			} else {
				chk = "";
			}
           datapro.eibs.beans.ETL051001Message msg = (datapro.eibs.beans.ETL051001Message) dvList.getRecord();
	%> 
        <TR>
        	<%if(chkof){ %>
			<td NOWRAP align="center"><a href="javascript:enter('<%=msg.getE01OFMNCH()%>','<%=msg.getE01OFMACC()%>','<%=msg.getE01OFMBNK()%>','<%=msg.getE01OFMBRN()%>')"><%=Util.formatCell(msg.getE01OFMACC())%></a></td>
			<%} %>
			<td NOWRAP align="center"><a href="javascript:enter('<%=msg.getE01OFMNCH()%>','<%=msg.getE01OFMACC()%>','<%=msg.getE01OFMBNK()%>','<%=msg.getE01OFMBRN()%>')"><%=Util.formatCell(msg.getE01OFMNCH())%></a></td>
			<td NOWRAP align="center"><a href="javascript:enter('<%=msg.getE01OFMNCH()%>','<%=msg.getE01OFMACC()%>','<%=msg.getE01OFMBNK()%>','<%=msg.getE01OFMBRN()%>')"><%=Util.formatCell(msg.getE01OFMCCY())%></a></td>
			<td NOWRAP align="center"><a href="javascript:enter('<%=msg.getE01OFMNCH()%>','<%=msg.getE01OFMACC()%>','<%=msg.getE01OFMBNK()%>','<%=msg.getE01OFMBRN()%>')"><%=Util.formatCell(msg.getE01OFMBRN())%></a></td>
			<td NOWRAP align="left"><a href="javascript:enter('<%=msg.getE01OFMNCH()%>','<%=msg.getE01OFMACC()%>','<%=msg.getE01OFMBNK()%>','<%=msg.getE01OFMBRN()%>')"><%=Util.formatCell(msg.getE01OFMBNF())%></a></td>
			<td NOWRAP align="right"><a href="javascript:enter('<%=msg.getE01OFMNCH()%>','<%=msg.getE01OFMACC()%>','<%=msg.getE01OFMBNK()%>','<%=msg.getE01OFMBRN()%>')"><%=Util.formatCell(msg.getE01OFMMCH())%></a></td>
			<td NOWRAP align="center"><a href="javascript:enter('<%=msg.getE01OFMNCH()%>','<%=msg.getE01OFMACC()%>','<%=msg.getE01OFMBNK()%>','<%=msg.getE01OFMBRN()%>')"><%=Util.formatCell(msg.getE01OFMSTS())%></a></td>
			<td NOWRAP align="center"><a href="javascript:enter('<%=msg.getE01OFMNCH()%>','<%=msg.getE01OFMACC()%>','<%=msg.getE01OFMBNK()%>','<%=msg.getE01OFMBRN()%>')"><%=Util.formatCustomDate(currUser.getE01DTF(),msg.getE01OFMIDM(),msg.getE01OFMIDD(),msg.getE01OFMIDY())%></a></td>
		</TR> 
	<%	} %> 
  </TABLE>
  <BR>
  
  <TABLE class="tbenter" WIDTH="98%" ALIGN=CENTER>
  <TR>
	<TD WIDTH="50%" ALIGN=LEFT height="25">
 	<%
        if ( dvList.getShowPrev() ) {
			int pos = dvList.getFirstRec() - 21;
	%>
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510?SCREEN=1000&Pos=<%=pos%>&E01SELDTY=<%=request.getAttribute("E01SELDTY")%>&E01SELSCH=<%=request.getAttribute("E01SELSCH")%>" >
			<img src="<%=request.getContextPath()%>/images/s/previous_records.gif" border=0></A>		
	<%  } 	%>
	</TD>
	<TD WIDTH="50%" ALIGN=LEFT height="25">
	<%  
        if ( dvList.getShowNext() ) {
			int pos = dvList.getLastRec();
	%>
		<A HREF="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSETL0510?SCREEN=1000&Pos=<%=pos%>&E01SELDTY=<%=request.getAttribute("E01SELDTY")%>&E01SELSCH=<%=request.getAttribute("E01SELSCH")%>" >
			<img src="<%=request.getContextPath()%>/images/s/next_records.gif" border=0></A>
	<%  } %> 
	</TD>
 	</TR>
 	</TABLE>
        
<%      
  }
%> 
</FORM>

</BODY>
</HTML>
