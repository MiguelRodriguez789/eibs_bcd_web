 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Letters Of Credit Opening Transactions</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<jsp:useBean id= "msg" class= "datapro.eibs.beans.ELC050009Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

<% 
	String title = "";
	if (msg.getE09LCMACD().equals("43")) {
		title = "Boletas de Garantías";
%>
		builtNewMenu(bg_a_opt);
<%	} else {
		title = "Apertura de Cartas de Credito";
		if (userPO.getType().equals("I") || userPO.getType().equals("O")) { 
			if (msg.getE09LCMOPT().equals("N")) {
%>
				builtNewMenu(lc_apr_cc_new);
<% 			} else { %>
				builtNewMenu(lc_apr_cc_maint);
<% 			}
   		} else { %>
			builtNewMenu(lc_apr_standby);
<% 		}
	} 
%>
   	initMenu();
	
</SCRIPT>

<% if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%>

</HEAD>
<BODY>
<H3 align="center">Transacciones de <%=title%>
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="view_lc_opn_trans.jsp, ELC0525"></H3>
<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525" >

  <INPUT type="hidden" name="SCREEN" value="5009" readonly="readonly">
  <INPUT NAME="msg" TYPE=HIDDEN VALUE="ELC050009" readonly="readonly">
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
    <TD width="20%" align="right" nowrap="nowrap"><B>Banco : </B></TD>
    <TD width="26%" nowrap="nowrap"><INPUT type="text" name="E09LCMBNK" 
							size="4" maxlength="2" value="<%=msg.getE09LCMBNK().trim()%>" readonly></TD>
    <TD width="25%" align="right" nowrap="nowrap"><B>N&uacute;mero de Carta de Cr&eacute;dito : </B></TD>
    <TD width="29%" nowrap="nowrap"><B>
        <%if (msg.getE09LCMACC().trim().equals("999999999999"))
				{%>
       <INPUT type="text" size="12" maxlength="12" value="New" readonly>
       <INPUT name="E09LCMACC" type="hidden" disabled
							value="<%=msg.getE09LCMACC().trim()%>" readonly="readonly">
        <%}
				else
				{%>
        <INPUT type="text" name="E09LCMACC" size="14" maxlength="12"
							value="<%=msg.getE09LCMACC().trim()%>" readonly>
        <%}%>
    </B></TD>
  </TR>
  <TR>
      <TD align="right" nowrap="nowrap"><B>Nuestra Referencia : </B></TD>
      <TD nowrap="nowrap"><INPUT type="text" name="E09LCMORF" size="20"
							maxlength="16" value="<%=msg.getE09LCMORF().trim()%>" readonly></TD>
      <TD align="right" nowrap="nowrap"><B>Producto : </B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E09LCMPRO" size="4"
							maxlength="4" value="<%=msg.getE09LCMPRO().trim()%>" readonly>
      </B></TD>
  </TR>
  <TR id="trdark">
      <TD align="right" nowrap="nowrap"><B>Referencia del Otro Banco : </B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E09LCMTRF"
							size="20" maxlength="16" value="<%=msg.getE09LCMTRF().trim()%>" readonly>
      </B></TD>
      <TD align="right" nowrap="nowrap"><B> Descripci&oacute;n del Producto : </B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E09DSCPRO"
							size="42" maxlength="35" value="<%=userPO.getHeader2().trim()%>" readonly>
      </B></TD>
  </TR>
 
</TABLE>
<BR>
<% double TotalDeb = 0.00;
   double TotalCre = 0.00;
 %>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
    <TD align="center"><B>Oficina</B></TD>
    <TD align="center"><STRONG>Mda</STRONG></TD>
    <TD align="center"><B>Cuenta Contable</B></TD>
    <TD align="center"><B>Cuenta/Referencia</B></TD>
    <TD align="center"><B>Descripcion</B></TD>
    <TD align="center"><B>Debito</B></TD>
    <TD align="center"><B>Credito</B></TD>
  </TR>
 <%  if (msg.getBigDecimalE09DEB01().doubleValue() > 0.00 || msg.getBigDecimalE09CRE01().doubleValue()>0.00){
       TotalDeb +=  msg.getBigDecimalE09DEB01().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE01().doubleValue();
 
   %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN01() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY01() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN01() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC01() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD01() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB01() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE01() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %>
 <%  if (msg.getBigDecimalE09DEB02().doubleValue() > 0.00 || msg.getBigDecimalE09CRE02().doubleValue()>0.00){
       TotalDeb +=  msg.getBigDecimalE09DEB02().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE02().doubleValue();
   %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN02() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY02() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN02() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC02() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD02() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB02() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE02() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %>
 <%  if (msg.getBigDecimalE09DEB03().doubleValue() > 0.00 || msg.getBigDecimalE09CRE03().doubleValue()>0.00){ 
        TotalDeb +=  msg.getBigDecimalE09DEB03().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE03().doubleValue(); %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN03() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY03() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN03() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC03() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD03() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB03() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE03() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %>
 <%  if (msg.getBigDecimalE09DEB04().doubleValue() > 0.00 || msg.getBigDecimalE09CRE04().doubleValue()>0.00){  
        TotalDeb +=  msg.getBigDecimalE09DEB04().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE04().doubleValue();%>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN04() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY04() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN04() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC04() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD04() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB04() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE04() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %>
 <%  if (msg.getBigDecimalE09DEB05().doubleValue() > 0.00 || msg.getBigDecimalE09CRE05().doubleValue()>0.00){ 
        TotalDeb +=  msg.getBigDecimalE09DEB05().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE05().doubleValue(); %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN05() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY05() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN05() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC05() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD05() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB05() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE05() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %>
 <%  if (msg.getBigDecimalE09DEB06().doubleValue() > 0.00 || msg.getBigDecimalE09CRE06().doubleValue()>0.00){ 
        TotalDeb +=  msg.getBigDecimalE09DEB06().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE06().doubleValue(); %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN06() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY06() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN06() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC06() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD06() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB06() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE06() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> <%  if (msg.getBigDecimalE09DEB07().doubleValue() > 0.00 || msg.getBigDecimalE09CRE07().doubleValue()>0.00){ 
        TotalDeb +=  msg.getBigDecimalE09DEB07().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE07().doubleValue(); %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN07() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY07() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN07() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC07() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD07() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB07() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE07() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> <%  if (msg.getBigDecimalE09DEB08().doubleValue() > 0.00 || msg.getBigDecimalE09CRE08().doubleValue()>0.00){
        TotalDeb +=  msg.getBigDecimalE09DEB08().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE08().doubleValue();  %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN08() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY08() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN08() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC08() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD08() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB08() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE08() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> <%  if (msg.getBigDecimalE09DEB09().doubleValue() > 0.00 || msg.getBigDecimalE09CRE09().doubleValue()>0.00){  
        TotalDeb +=  msg.getBigDecimalE09DEB09().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE09().doubleValue();%>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN09() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY09() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN09() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC09() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD09() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB09() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE09() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> <%  if (msg.getBigDecimalE09DEB10().doubleValue() > 0.00 || msg.getBigDecimalE09CRE10().doubleValue()>0.00){
        TotalDeb +=  msg.getBigDecimalE09DEB10().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE10().doubleValue();  %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN10() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY10() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN10() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC10() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD10() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB10() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE10() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> <%  if (msg.getBigDecimalE09DEB11().doubleValue() > 0.00 || msg.getBigDecimalE09CRE11().doubleValue()>0.00){ 
        TotalDeb +=  msg.getBigDecimalE09DEB11().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE11().doubleValue(); %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN11() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY11() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN11() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC11() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD11() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB11() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE11() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> <%  if (msg.getBigDecimalE09DEB12().doubleValue() > 0.00 || msg.getBigDecimalE09CRE12().doubleValue()>0.00){ 
        TotalDeb +=  msg.getBigDecimalE09DEB12().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE12().doubleValue(); %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN12() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY12() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN12() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC12() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD12() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB12() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE12() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> <%  if (msg.getBigDecimalE09DEB13().doubleValue() > 0.00 || msg.getBigDecimalE09CRE13().doubleValue()>0.00){
        TotalDeb +=  msg.getBigDecimalE09DEB13().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE13().doubleValue();  %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN13() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY13() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN13() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC13() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD13() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB13() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE13() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> <%  if (msg.getBigDecimalE09DEB14().doubleValue() > 0.00 || msg.getBigDecimalE09CRE14().doubleValue()>0.00){
         TotalDeb +=  msg.getBigDecimalE09DEB14().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE14().doubleValue();  %> 
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN14() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY14() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN14() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC14() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD14() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB14() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE14() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %>
 <%  if (msg.getBigDecimalE09DEB15().doubleValue() > 0.00 || msg.getBigDecimalE09CRE15().doubleValue()>0.00){  
         TotalDeb +=  msg.getBigDecimalE09DEB15().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE15().doubleValue();  %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN15() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY15() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN15() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC15() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD15() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB15() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE15() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> 
 <%  if (msg.getBigDecimalE09DEB16().doubleValue() > 0.00 || msg.getBigDecimalE09CRE16().doubleValue()>0.00){  
         TotalDeb +=  msg.getBigDecimalE09DEB16().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE16().doubleValue();  %>
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN16() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY16() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN16() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC16() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD16() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB16() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE16() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> 
  <%  if (msg.getBigDecimalE09DEB17().doubleValue() > 0.00 || msg.getBigDecimalE09CRE17().doubleValue()>0.00){ 
          TotalDeb +=  msg.getBigDecimalE09DEB17().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE17().doubleValue();  %> 
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN17() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY17() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN17() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC17() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD17() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB17() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE17() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %>
 <%  if (msg.getBigDecimalE09DEB18().doubleValue() > 0.00 || msg.getBigDecimalE09CRE18().doubleValue()>0.00){ 
         TotalDeb +=  msg.getBigDecimalE09DEB18().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE18().doubleValue();  %> 
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN18() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY18() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN18() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC18() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD18() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB18() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE18() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> 
 <%  if (msg.getBigDecimalE09DEB19().doubleValue() > 0.00 || msg.getBigDecimalE09CRE19().doubleValue()>0.00){
         TotalDeb +=  msg.getBigDecimalE09DEB19().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE19().doubleValue();  %>  
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN19() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY19() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN19() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC19() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD19() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB19() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE19() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> 
 <%  if (msg.getBigDecimalE09DEB20().doubleValue() > 0.00 || msg.getBigDecimalE09CRE20().doubleValue()>0.00){
         TotalDeb +=  msg.getBigDecimalE09DEB20().doubleValue();
       TotalCre +=  msg.getBigDecimalE09CRE20().doubleValue();  %>  
	  <TR>
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= msg.getE09BRN20() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= msg.getE09CCY20() %>" size="5" maxlength="5" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= msg.getE09GLN20() %>" size="20" maxlength="20" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= msg.getE09ACC20() %>" size="15" maxlength="15" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= msg.getE09TRD20() %>" size="32" maxlength="32" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09DEB20() %>" size="17" maxlength="17" readonly></TD>
	    <TD align="right"><INPUT type="text" name="CRE1" value="<%= msg.getE09CRE20() %>" size="17" maxlength="17" readonly></TD>
	  </TR>
 <%} %> 
 
</TABLE>
<BR>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
     <TD align="right" width="70%"><B>Totales </B></TD>
     <TD align="center" width="15%"><B><INPUT type="text" name="TOTCRE" value="<%= Util.formatCCY(TotalDeb)  %>" size="17" maxlength="17" readonly></B></TD>
     <TD align="center" width="15%"><B><INPUT type="text" name="TOTDEB" value="<%= Util.formatCCY(TotalCre)  %>" size="17" maxlength="17" readonly></B></TD>
  </TR>
</TABLE><INPUT type="hidden" name="H01FLGWK1" value=""><P align="center"> &nbsp; &nbsp; &nbsp;  
</P>
</FORM>

</BODY>
</HTML>
