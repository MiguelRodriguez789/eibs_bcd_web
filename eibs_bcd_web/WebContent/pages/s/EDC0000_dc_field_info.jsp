<HTML>
<HEAD>
<TITLE>Descripción de Mercancía(45A)</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.EDC000005Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

<%	String ctrlReadonly = "";
	if (userPO.getPurpose().trim().equals("APPROVAL") || userPO.getPurpose().trim().equals("INQUIRY")) { ctrlReadonly = "readonly";}%>

  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   		initMenu();
   <%} else {%>
<%	
	if (userPO.getPurpose().trim().equals("APPROVAL") || userPO.getPurpose().trim().equals("INQUIRY")) {%>
		builtNewMenu(dc_d_inquiry);
		initMenu();
<%	} else	{%>
		builtNewMenu(dc_d_maint);
		initMenu();
<%	} %>
  <%}%>
  
  function history(type,code) {
	pg = "<%=request.getContextPath()%>/servlet/datapro.eibs.general.JSEWD0701?SCREEN=1&TYPE=" + type + "&CODE=" + code;
	CenterWindow(pg,600,500,2);
}

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

	String title = "Nueva Cobranza ["; 
	int lines = 0;
	int chars = 0;
	
	datapro.eibs.master.SwiftStructure swift = new datapro.eibs.master.SwiftStructure();
	
	if (swift.locateField(msg.getE05LCDFCD().trim())) {
		title = title + swift.getLabel("sp");
		lines = swift.getLines();
		chars = swift.getChars();
	}
	
	title = title + " (" + msg.getE05LCDFCD().trim() + ")]";
%> 
<H3 align="center"><%= title %><IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dc_field_info.jsp, EDC0000"></H3>
<HR size="4">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="51">
  <INPUT TYPE=HIDDEN NAME="E05LCDFCD" VALUE="<%= msg.getE05LCDFCD() %>">

  <table class="tableinfo" cellspacing="0" cellpadding="4" width="100%" border="0">
  	<TR id="trdark">
  		<TD nowrap align="right" width="10%"><B> Producto :</B></TD>
  		<TD nowrap align="left" width="20%">
  			<INPUT type="text" name="E05LCDPRO" size="5" maxlength="4" value="<%=msg.getE05LCDPRO().trim()%>" readonly></TD>
  		<TD nowrap align="right" width="10%"><B>Banco :</B></TD>
  		<TD nowrap align="left" width="20%">
  			<INPUT type="text" readonly name="E05LCDBNK" size="3" maxlength="2" value="<%=msg.getE05LCDBNK().trim()%>"></TD>
  		<TD nowrap width="25%" align="right"><B>Cobranza Número :</B></TD>
  		<TD nowrap align="left" width="15%">
  			<INPUT type="text" readonly name="E05LCDACC" size="21" maxlength="20"value="<%=msg.getE05LCDACC().trim()%>"></TD>
  	</TR>
  	<% if(msg.getE05LCDFCD().equals("999")) { %>
    <tr>	
	<td> 
      </td>
	<td> 
      </td>
	<td> 
        <div align="center">  
          <input id="EIBSBTN_LARGE" type=button name="Button" value="Ver Historia de Bit&aacute;cora / Notas" onClick="javascript:history('V','<%= msg.getE05LCDACC().trim()%>')">
        </div>
      </td>
	<td> 
      </td>
  </tr>
  <% } %>
  </TABLE>

  <p align="center">
    <% if(!msg.getE05LCDFCD().equals("999")  && !"readonly".equals(ctrlReadonly)) { %>
	Adicionar Clausula :&nbsp; 
	    	<select id="ClauseCode" name="E05CLSTXN" style="text-align: center;"></select>
	    	&nbsp;&nbsp;
	    	<INPUT id="EIBSBTN" type="button" name="Adicionar" value="Adicionar" onclick="addClause()">
   	<% }  %>
  </p>
  	
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap align="center"> 
      <div style="height:320px; overflow-y: scroll">
          <INPUT type="text" name="E05LCDM01" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM01().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM02" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM02().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM03" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM03().trim()%>" <%=ctrlReadonly%> ><BR>
      <% if (lines > 3) { %>
          <INPUT type="text" name="E05LCDM04" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM04().trim()%>" <%=ctrlReadonly%> ><BR>
      <% } 
         if (lines > 4) { %>
          <INPUT type="text" name="E05LCDM05" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM05().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM06" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM06().trim()%>" <%=ctrlReadonly%> ><BR>
      <% } 
         if (lines > 6) { %>
          <INPUT type="text" name="E05LCDM07" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM07().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM08" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM08().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM09" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM09().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM10" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM10().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM11" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM11().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM12" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM12().trim()%>" <%=ctrlReadonly%> ><BR>
      <% } 
         if (lines > 12) { %>
          <INPUT type="text" name="E05LCDM13" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM13().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM14" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM14().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM15" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM15().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM16" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM16().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM17" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM17().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM18" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM18().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM19" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM19().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM20" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM20().trim()%>" <%=ctrlReadonly%> ><BR>
      <% } 
         if (lines > 20) { %>
          <INPUT type="text" name="E05LCDM21" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM21().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM22" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM22().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM23" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM23().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM24" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM24().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM25" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM25().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM26" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM26().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM27" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM27().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM28" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM28().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM29" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM29().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM30" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM30().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM31" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM31().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM32" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM32().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM33" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM33().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM34" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM34().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM35" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM35().trim()%>" <%=ctrlReadonly%> ><BR>
      <% } 
         if (lines > 35) { %>
          <INPUT type="text" name="E05LCDM36" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM36().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM37" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM37().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM38" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM38().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM39" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM39().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM40" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM40().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM41" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM41().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM42" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM42().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM43" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM43().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM44" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM44().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM45" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM45().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM46" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM46().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM47" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM47().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM48" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM48().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM49" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM49().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM50" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM50().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM51" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM51().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM52" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM52().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM53" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM53().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM54" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM54().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM55" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM55().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM56" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM56().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM57" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM57().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM58" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM58().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM59" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM59().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM60" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM60().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM61" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM61().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM62" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM62().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM63" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM63().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM64" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM64().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM65" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM65().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM66" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM66().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM67" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM67().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM68" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM68().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM69" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM69().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM70" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM70().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM71" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM71().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM72" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM72().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM73" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM73().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM74" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM74().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM75" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM75().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM76" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM76().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM77" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM77().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM78" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM78().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM79" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM79().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM80" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM80().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM81" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM81().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM82" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM82().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM83" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM83().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM84" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM84().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM85" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM85().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM86" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM86().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM87" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM87().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM88" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM88().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM89" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM89().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM90" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM90().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM91" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM91().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM92" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM92().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM93" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM93().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM94" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM94().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM95" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM95().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM96" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM96().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM97" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM97().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM98" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM98().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM99" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM99().trim()%>" <%=ctrlReadonly%> ><BR>
          <INPUT type="text" name="E05LCDM00" size="70" maxlength="<%= chars %>" value="<%= msg.getE05LCDM00().trim()%>" <%=ctrlReadonly%> ><BR>
	  <% } %>          
      </div></TD>
    </TR>
  </TABLE>
  
  <% if (!userPO.getPurpose().equals("INQUIRY")) { %>
   <P align="center"><INPUT id="EIBSBTN" type=submit name="Submit" value="Enviar"></P>
  <% } %>
</FORM>
<script type="text/javascript">
  GetClauseTypes('<%= msg.getE05LCDFCD() %>');
</script>
</BODY>
</HTML>
