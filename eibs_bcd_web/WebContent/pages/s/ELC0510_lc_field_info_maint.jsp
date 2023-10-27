<HTML>
<HEAD>
<TITLE>Descripción de Mercancía(45A)</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgLC" class="datapro.eibs.beans.ELC051003Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"></script>

<SCRIPT type="text/javascript">

	builtNewMenu(lc_maint);
	initMenu();
	
	function GetClauseTypes(type) {
		var url = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEWP0010?TYPE=" + type + "&SCREEN=11";
		GetXMLResponse(url, selectCallback, false);
	}
	
	function addClause() {
		getElement("SCREEN").value = "1111";
		document.forms[0].submit();
	}
	
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

	String title = "Mantenimiento de Carta de Credito ["; 
	int lines = 0;
	int chars = 0;
	int size = 0;
	
	datapro.eibs.master.SwiftStructure swift = new datapro.eibs.master.SwiftStructure();
	
	if (swift.locateField(msgLC.getE03LCDFCD().trim())) {
		title = title + swift.getLabel("sp");
		lines = swift.getLines();
		chars = swift.getChars();
		size = chars + 30;
	}
	
	title = title + " (" + msgLC.getE03LCDFCD().trim() + ")]";
%> 
<H3 align="center"><%= title %>
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_field_info_maint.jsp, ELC0510"></H3>
<HR size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510" >
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

  <table id="tbhelp" align="center" width="556" border="0" cellspacing="0" cellpadding="0">
  	<tr> 
    	<td align="center">Adicionar Clausula :&nbsp; 
	    	<select name="ClauseCode" style="text-align: center;"></select>
	    	&nbsp;&nbsp;
	    	<INPUT id="EIBSBTN" type="button" name="Adicionar" value="Adicionar" onclick="addClause()">
      	</td>
    </tr>
  </table>
  
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap align="center"> 
      <div style="height:320px; overflow-y: scroll">
          01 &nbsp;<INPUT type="text" name="E03LCDM01" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM01().trim()%>"><BR>
          02 &nbsp;<INPUT type="text" name="E03LCDM02" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM02().trim()%>"><BR>
          03 &nbsp;<INPUT type="text" name="E03LCDM03" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM03().trim()%>"><BR>
      <% if (lines > 3) { %>
          04 &nbsp;<INPUT type="text" name="E03LCDM04" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM04().trim()%>"><BR>
      <% } 
         if (lines > 4) { %>
          05 &nbsp;<INPUT type="text" name="E03LCDM05" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM05().trim()%>"><BR>
          06 &nbsp;<INPUT type="text" name="E03LCDM06" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM06().trim()%>"><BR>
      <% } 
         if (lines > 6) { %>
          07 &nbsp;<INPUT type="text" name="E03LCDM07" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM07().trim()%>"><BR>
          08 &nbsp;<INPUT type="text" name="E03LCDM08" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM08().trim()%>"><BR>
          09 &nbsp;<INPUT type="text" name="E03LCDM09" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM09().trim()%>"><BR>
          10 &nbsp;<INPUT type="text" name="E03LCDM10" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM10().trim()%>"><BR>
          11 &nbsp;<INPUT type="text" name="E03LCDM11" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM11().trim()%>"><BR>
          12 &nbsp;<INPUT type="text" name="E03LCDM12" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM12().trim()%>"><BR>
      <% } 
         if (lines > 12) { %>
          13 &nbsp;<INPUT type="text" name="E03LCDM13" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM13().trim()%>"><BR>
          14 &nbsp;<INPUT type="text" name="E03LCDM14" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM14().trim()%>"><BR>
          15 &nbsp;<INPUT type="text" name="E03LCDM15" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM15().trim()%>"><BR>
          16 &nbsp;<INPUT type="text" name="E03LCDM16" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM16().trim()%>"><BR>
          17 &nbsp;<INPUT type="text" name="E03LCDM17" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM17().trim()%>"><BR>
          18 &nbsp;<INPUT type="text" name="E03LCDM18" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM18().trim()%>"><BR>
          19 &nbsp;<INPUT type="text" name="E03LCDM19" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM19().trim()%>"><BR>
          20 &nbsp;<INPUT type="text" name="E03LCDM20" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM20().trim()%>"><BR>
      <% } 
         if (lines > 20) { %>
          21 &nbsp;<INPUT type="text" name="E03LCDM21" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM21().trim()%>"><BR>
          22 &nbsp;<INPUT type="text" name="E03LCDM22" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM22().trim()%>"><BR>
          23 &nbsp;<INPUT type="text" name="E03LCDM23" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM23().trim()%>"><BR>
          24 &nbsp;<INPUT type="text" name="E03LCDM24" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM24().trim()%>"><BR>
          25 &nbsp;<INPUT type="text" name="E03LCDM25" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM25().trim()%>"><BR>
          26 &nbsp;<INPUT type="text" name="E03LCDM26" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM26().trim()%>"><BR>
          27 &nbsp;<INPUT type="text" name="E03LCDM27" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM27().trim()%>"><BR>
          28 &nbsp;<INPUT type="text" name="E03LCDM28" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM28().trim()%>"><BR>
          29 &nbsp;<INPUT type="text" name="E03LCDM29" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM29().trim()%>"><BR>
          30 &nbsp;<INPUT type="text" name="E03LCDM30" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM30().trim()%>"><BR>
          31 &nbsp;<INPUT type="text" name="E03LCDM31" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM31().trim()%>"><BR>
          32 &nbsp;<INPUT type="text" name="E03LCDM32" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM32().trim()%>"><BR>
          33 &nbsp;<INPUT type="text" name="E03LCDM33" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM33().trim()%>"><BR>
          34 &nbsp;<INPUT type="text" name="E03LCDM34" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM34().trim()%>"><BR>
          35 &nbsp;<INPUT type="text" name="E03LCDM35" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM35().trim()%>"><BR>
      <% } 
         if (lines > 35) { %>
          36 &nbsp;<INPUT type="text" name="E03LCDM36" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM36().trim()%>"><BR>
          37 &nbsp;<INPUT type="text" name="E03LCDM37" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM37().trim()%>"><BR>
          38 &nbsp;<INPUT type="text" name="E03LCDM38" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM38().trim()%>"><BR>
          39 &nbsp;<INPUT type="text" name="E03LCDM39" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM39().trim()%>"><BR>
          40 &nbsp;<INPUT type="text" name="E03LCDM40" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM40().trim()%>"><BR>
          41 &nbsp;<INPUT type="text" name="E03LCDM41" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM41().trim()%>"><BR>
          42 &nbsp;<INPUT type="text" name="E03LCDM42" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM42().trim()%>"><BR>
          43 &nbsp;<INPUT type="text" name="E03LCDM43" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM43().trim()%>"><BR>
          44 &nbsp;<INPUT type="text" name="E03LCDM44" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM44().trim()%>"><BR>
          45 &nbsp;<INPUT type="text" name="E03LCDM45" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM45().trim()%>"><BR>
          46 &nbsp;<INPUT type="text" name="E03LCDM46" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM46().trim()%>"><BR>
          47 &nbsp;<INPUT type="text" name="E03LCDM47" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM47().trim()%>"><BR>
          48 &nbsp;<INPUT type="text" name="E03LCDM48" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM48().trim()%>"><BR>
          49 &nbsp;<INPUT type="text" name="E03LCDM49" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM49().trim()%>"><BR>
          50 &nbsp;<INPUT type="text" name="E03LCDM50" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM50().trim()%>"><BR>
          51 &nbsp;<INPUT type="text" name="E03LCDM51" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM51().trim()%>"><BR>
          52 &nbsp;<INPUT type="text" name="E03LCDM52" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM52().trim()%>"><BR>
          53 &nbsp;<INPUT type="text" name="E03LCDM53" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM53().trim()%>"><BR>
          54 &nbsp;<INPUT type="text" name="E03LCDM54" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM54().trim()%>"><BR>
          55 &nbsp;<INPUT type="text" name="E03LCDM55" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM55().trim()%>"><BR>
          56 &nbsp;<INPUT type="text" name="E03LCDM56" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM56().trim()%>"><BR>
          57 &nbsp;<INPUT type="text" name="E03LCDM57" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM57().trim()%>"><BR>
          58 &nbsp;<INPUT type="text" name="E03LCDM58" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM58().trim()%>"><BR>
          59 &nbsp;<INPUT type="text" name="E03LCDM59" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM59().trim()%>"><BR>
          60 &nbsp;<INPUT type="text" name="E03LCDM60" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM60().trim()%>"><BR>
          61 &nbsp;<INPUT type="text" name="E03LCDM61" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM61().trim()%>"><BR>
          62 &nbsp;<INPUT type="text" name="E03LCDM62" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM62().trim()%>"><BR>
          63 &nbsp;<INPUT type="text" name="E03LCDM63" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM63().trim()%>"><BR>
          64 &nbsp;<INPUT type="text" name="E03LCDM64" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM64().trim()%>"><BR>
          65 &nbsp;<INPUT type="text" name="E03LCDM65" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM65().trim()%>"><BR>
          66 &nbsp;<INPUT type="text" name="E03LCDM66" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM66().trim()%>"><BR>
          67 &nbsp;<INPUT type="text" name="E03LCDM67" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM67().trim()%>"><BR>
          68 &nbsp;<INPUT type="text" name="E03LCDM68" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM68().trim()%>"><BR>
          69 &nbsp;<INPUT type="text" name="E03LCDM69" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM69().trim()%>"><BR>
          70 &nbsp;<INPUT type="text" name="E03LCDM70" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM70().trim()%>"><BR>
          71 &nbsp;<INPUT type="text" name="E03LCDM71" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM71().trim()%>"><BR>
          72 &nbsp;<INPUT type="text" name="E03LCDM72" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM72().trim()%>"><BR>
          73 &nbsp;<INPUT type="text" name="E03LCDM73" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM73().trim()%>"><BR>
          74 &nbsp;<INPUT type="text" name="E03LCDM74" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM74().trim()%>"><BR>
          75 &nbsp;<INPUT type="text" name="E03LCDM75" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM75().trim()%>"><BR>
          76 &nbsp;<INPUT type="text" name="E03LCDM76" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM76().trim()%>"><BR>
          77 &nbsp;<INPUT type="text" name="E03LCDM77" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM77().trim()%>"><BR>
          78 &nbsp;<INPUT type="text" name="E03LCDM78" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM78().trim()%>"><BR>
          79 &nbsp;<INPUT type="text" name="E03LCDM79" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM79().trim()%>"><BR>
          80 &nbsp;<INPUT type="text" name="E03LCDM80" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM80().trim()%>"><BR>
          81 &nbsp;<INPUT type="text" name="E03LCDM81" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM81().trim()%>"><BR>
          82 &nbsp;<INPUT type="text" name="E03LCDM82" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM82().trim()%>"><BR>
          83 &nbsp;<INPUT type="text" name="E03LCDM83" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM83().trim()%>"><BR>
          84 &nbsp;<INPUT type="text" name="E03LCDM84" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM84().trim()%>"><BR>
          85 &nbsp;<INPUT type="text" name="E03LCDM85" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM85().trim()%>"><BR>
          86 &nbsp;<INPUT type="text" name="E03LCDM86" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM86().trim()%>"><BR>
          87 &nbsp;<INPUT type="text" name="E03LCDM87" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM87().trim()%>"><BR>
          88 &nbsp;<INPUT type="text" name="E03LCDM88" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM88().trim()%>"><BR>
          89 &nbsp;<INPUT type="text" name="E03LCDM89" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM89().trim()%>"><BR>
          90 &nbsp;<INPUT type="text" name="E03LCDM90" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM90().trim()%>"><BR>
          91 &nbsp;<INPUT type="text" name="E03LCDM91" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM91().trim()%>"><BR>
          92 &nbsp;<INPUT type="text" name="E03LCDM92" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM92().trim()%>"><BR>
          93 &nbsp;<INPUT type="text" name="E03LCDM93" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM93().trim()%>"><BR>
          94 &nbsp;<INPUT type="text" name="E03LCDM94" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM94().trim()%>"><BR>
          95 &nbsp;<INPUT type="text" name="E03LCDM95" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM95().trim()%>"><BR>
          96 &nbsp;<INPUT type="text" name="E03LCDM96" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM96().trim()%>"><BR>
          97 &nbsp;<INPUT type="text" name="E03LCDM97" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM97().trim()%>"><BR>
          98 &nbsp;<INPUT type="text" name="E03LCDM98" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM98().trim()%>"><BR>
          99 &nbsp;<INPUT type="text" name="E03LCDM99" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM99().trim()%>"><BR>
         100 &nbsp;<INPUT type="text" name="E03LCDM00" size="<%=size%>" maxlength="<%= chars %>" value="<%= msgLC.getE03LCDM00().trim()%>"><BR>
	  <% } %>          
      </div></TD>
    </TR>
  </TABLE>
  
  <P align="center"><INPUT id="EIBSBTN" type=submit name="Submit" value="Enviar"></P>
  
</FORM>
<script type="text/javascript">
  GetClauseTypes('<%= msgLC.getE03LCDFCD() %>');
</script>
</BODY>
</HTML>
