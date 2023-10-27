<HTML>
<HEAD>
<TITLE>Descripción de Mercancía(45A)</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgLC" class="datapro.eibs.beans.ELC050003Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	builtNewMenu(lc_apr_cc_new);
	initMenu();
	
</SCRIPT>

</HEAD>

<BODY bgcolor="#FFFFFF">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

	String title = "Nueva Carta de Credito ["; 
	int lines = 0;
	int chars = 0;
	
	datapro.eibs.master.SwiftStructure swift = new datapro.eibs.master.SwiftStructure();
	
	if (swift.locateField(msgLC.getE03LCDFCD().trim())) {
		title = title + swift.getLabel("sp");
		lines = swift.getLines();
		chars = swift.getChars();
	}
	
	title = title + " (" + msgLC.getE03LCDFCD().trim() + ")]";
%> 
<H3 align="center"><%= title %><IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_field_info.jsp, ELC0500"></H3>
<HR size="4">
<FORM METHOD="post" target="_blank" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEWP0010" >
  <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="<%= msgLC.getE03LCDFCD() %>">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">
  <INPUT TYPE=HIDDEN NAME="SERVLET" VALUE="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500">
</FORM>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2000">
  <INPUT TYPE=HIDDEN NAME="E03LCDFCD" VALUE="<%= msgLC.getE03LCDFCD() %>">

  <table class="tableinfo" cellspacing="0" cellpadding="4" width="100%" border="0">
  	<TR id="trdark">
  		<TD nowrap align="right" width="10%"><B> Producto :</B></TD>
  		<TD nowrap align="left" width="20%">
  			<INPUT type="text" name="E03LCDPRO" size="5" maxlength="4" value="<%=msgLC.getE03LCDPRO().trim()%>" readonly></TD>
  		<TD nowrap align="right" width="10%"><B>Banco :</B></TD>
  		<TD nowrap align="left" width="20%">
  			<INPUT type="text" readonly name="E03LCDBNK" size="3" maxlength="2" value="<%=msgLC.getE03LCDBNK().trim()%>"></TD>
  		<TD nowrap width="25%" align="right"><B>Carta de Crédito Número :</B></TD>
  		<TD nowrap align="left" width="15%">
  			<INPUT type="text" readonly name="E03LCDACC" size="21" maxlength="20"value="<%=msgLC.getE03LCDACC().trim()%>"></TD>
  	</TR>
  </TABLE>

  <p align="center">
  	<A href="javascript:getClausula('<%= msgLC.getE03LCDFCD() %>','11','<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0500')">
  	<b>Adicionar Clausula<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></b></a></p>
  	
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap align="center"> 
      <div style="height:320px; overflow-y: scroll">
          <INPUT type="text" name="E03LCDM01" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM01().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM02" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM02().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM03" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM03().trim()%>"><BR>
      <% if (lines > 3) { %>
          <INPUT type="text" name="E03LCDM04" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM04().trim()%>"><BR>
      <% } 
         if (lines > 4) { %>
          <INPUT type="text" name="E03LCDM05" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM05().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM06" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM06().trim()%>"><BR>
      <% } 
         if (lines > 6) { %>
          <INPUT type="text" name="E03LCDM07" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM07().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM08" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM08().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM09" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM09().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM10" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM10().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM11" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM11().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM12" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM12().trim()%>"><BR>
      <% } 
         if (lines > 12) { %>
          <INPUT type="text" name="E03LCDM13" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM13().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM14" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM14().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM15" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM15().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM16" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM16().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM17" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM17().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM18" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM18().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM19" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM19().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM20" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM20().trim()%>"><BR>
      <% } 
         if (lines > 20) { %>
          <INPUT type="text" name="E03LCDM21" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM21().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM22" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM22().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM23" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM23().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM24" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM24().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM25" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM25().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM26" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM26().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM27" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM27().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM28" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM28().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM29" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM29().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM30" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM30().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM31" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM31().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM32" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM32().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM33" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM33().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM34" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM34().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM35" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM35().trim()%>"><BR>
      <% } 
         if (lines > 35) { %>
          <INPUT type="text" name="E03LCDM36" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM36().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM37" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM37().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM38" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM38().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM39" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM39().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM40" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM40().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM41" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM41().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM42" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM42().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM43" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM43().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM44" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM44().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM45" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM45().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM46" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM46().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM47" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM47().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM48" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM48().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM49" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM49().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM50" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM50().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM51" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM51().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM52" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM52().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM53" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM53().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM54" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM54().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM55" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM55().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM56" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM56().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM57" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM57().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM58" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM58().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM59" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM59().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM60" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM60().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM61" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM61().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM62" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM62().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM63" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM63().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM64" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM64().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM65" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM65().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM66" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM66().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM67" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM67().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM68" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM68().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM69" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM69().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM70" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM70().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM71" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM71().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM72" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM72().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM73" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM73().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM74" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM74().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM75" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM75().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM76" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM76().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM77" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM77().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM78" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM78().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM79" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM79().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM80" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM80().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM81" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM81().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM82" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM82().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM83" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM83().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM84" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM84().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM85" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM85().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM86" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM86().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM87" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM87().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM88" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM88().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM89" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM89().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM90" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM90().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM91" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM91().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM92" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM92().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM93" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM93().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM94" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM94().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM95" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM95().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM96" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM96().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM97" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM97().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM98" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM98().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM99" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM99().trim()%>"><BR>
          <INPUT type="text" name="E03LCDM00" readonly size="70" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM00().trim()%>"><BR>
	  <% } %>          
      </div></TD>    
    </TR>
  </TABLE>
  
  
</FORM>
</BODY>
</HTML>
