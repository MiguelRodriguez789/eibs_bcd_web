<HTML>
<HEAD>
<TITLE>Documents Required (46A)</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<LINK href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.ELC051003Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

	builtNewMenu(lc_i_opt);
	initMenu();
   
</SCRIPT>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}

	String title = "Consulta Carta de Cr�dito ["; 
	int lines = 0;
	int chars = 0;
	int size = 0;
	
	datapro.eibs.master.SwiftStructure swift = new datapro.eibs.master.SwiftStructure();
	
	if (swift.locateField(msg.getE03LCDFCD().trim())) {
		title = title + swift.getLabel("sp");
		lines = swift.getLines();
		chars = swift.getChars();
		size = chars + 30;
	}
	
	title = title + " (" + msg.getE03LCDFCD().trim() + ")]";

%>

</HEAD>

<BODY bgcolor="#FFFFFF">
<H3 align="center"><%= title %>
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_field_info_inquiry.jsp, ELC0450"></H3>
<HR size="4">


 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.trade.JSELC0450" >
  <INPUT NAME="SCREEN" TYPE=HIDDEN VALUE="15" readonly="readonly">
   
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="14%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="9%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap > 
              <div align="left"> 
                <input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3().trim()%>">
              </div>
            </td>
            <td nowrap > 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap ><b> 
              <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
              </b></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="14%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"> 
                <input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>">
                </b> </div>
            </td>
            <td nowrap width="11%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<BR>
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap align="center"> 
      	<div style="height: 320px; overflow-y: scroll"> 
          <INPUT name="E03LCDM01" type="text" value="<%= msg.getE03LCDM01().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM02" type="text" value="<%= msg.getE03LCDM02().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM03" type="text" value="<%= msg.getE03LCDM03().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
      <% if (lines > 3) { %>
          <INPUT name="E03LCDM04" type="text" value="<%= msg.getE03LCDM04().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
      <% } 
         if (lines > 4) { %>
          <INPUT name="E03LCDM05" type="text" value="<%= msg.getE03LCDM05().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM06" type="text" value="<%= msg.getE03LCDM06().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
      <% } 
         if (lines > 6) { %>
          <INPUT name="E03LCDM07" type="text" value="<%= msg.getE03LCDM07().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM08" type="text" value="<%= msg.getE03LCDM08().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM09" type="text" value="<%= msg.getE03LCDM09().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM10" type="text" value="<%= msg.getE03LCDM10().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM11" type="text" value="<%= msg.getE03LCDM11().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM12" type="text" value="<%= msg.getE03LCDM12().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
      <% } 
         if (lines > 12) { %>
          <INPUT name="E03LCDM13" type="text" value="<%= msg.getE03LCDM13().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM14" type="text" value="<%= msg.getE03LCDM14().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM15" type="text" value="<%= msg.getE03LCDM15().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM16" type="text" value="<%= msg.getE03LCDM16().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM17" type="text" value="<%= msg.getE03LCDM17().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM18" type="text" value="<%= msg.getE03LCDM18().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM19" type="text" value="<%= msg.getE03LCDM19().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM20" type="text" value="<%= msg.getE03LCDM20().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
      <% } 
         if (lines > 20) { %>
          <INPUT name="E03LCDM21" type="text" value="<%= msg.getE03LCDM21().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM22" type="text" value="<%= msg.getE03LCDM22().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM23" type="text" value="<%= msg.getE03LCDM23().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM24" type="text" value="<%= msg.getE03LCDM24().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM25" type="text" value="<%= msg.getE03LCDM25().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM26" type="text" value="<%= msg.getE03LCDM26().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM27" type="text" value="<%= msg.getE03LCDM27().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM28" type="text" value="<%= msg.getE03LCDM28().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM29" type="text" value="<%= msg.getE03LCDM29().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM30" type="text" value="<%= msg.getE03LCDM30().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM31" type="text" value="<%= msg.getE03LCDM31().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM32" type="text" value="<%= msg.getE03LCDM32().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM33" type="text" value="<%= msg.getE03LCDM33().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM34" type="text" value="<%= msg.getE03LCDM34().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
      <% } 
         if (lines > 35) { %>
          <INPUT name="E03LCDM35" type="text" value="<%= msg.getE03LCDM35().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM36" type="text" value="<%= msg.getE03LCDM36().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM37" type="text" value="<%= msg.getE03LCDM37().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM38" type="text" value="<%= msg.getE03LCDM38().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM39" type="text" value="<%= msg.getE03LCDM39().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM40" type="text" value="<%= msg.getE03LCDM40().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM41" type="text" value="<%= msg.getE03LCDM41().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM42" type="text" value="<%= msg.getE03LCDM42().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM43" type="text" value="<%= msg.getE03LCDM43().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM44" type="text" value="<%= msg.getE03LCDM44().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM45" type="text" value="<%= msg.getE03LCDM45().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM46" type="text" value="<%= msg.getE03LCDM46().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM47" type="text" value="<%= msg.getE03LCDM47().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM48" type="text" value="<%= msg.getE03LCDM48().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM49" type="text" value="<%= msg.getE03LCDM49().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM50" type="text" value="<%= msg.getE03LCDM50().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM51" type="text" value="<%= msg.getE03LCDM51().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM52" type="text" value="<%= msg.getE03LCDM52().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM53" type="text" value="<%= msg.getE03LCDM53().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM54" type="text" value="<%= msg.getE03LCDM54().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM55" type="text" value="<%= msg.getE03LCDM55().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM56" type="text" value="<%= msg.getE03LCDM56().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM57" type="text" value="<%= msg.getE03LCDM57().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM58" type="text" value="<%= msg.getE03LCDM58().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM59" type="text" value="<%= msg.getE03LCDM59().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM60" type="text" value="<%= msg.getE03LCDM60().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM61" type="text" value="<%= msg.getE03LCDM61().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM62" type="text" value="<%= msg.getE03LCDM62().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM63" type="text" value="<%= msg.getE03LCDM63().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM64" type="text" value="<%= msg.getE03LCDM64().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM65" type="text" value="<%= msg.getE03LCDM65().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM66" type="text" value="<%= msg.getE03LCDM66().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM67" type="text" value="<%= msg.getE03LCDM67().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM68" type="text" value="<%= msg.getE03LCDM68().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM69" type="text" value="<%= msg.getE03LCDM69().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM70" type="text" value="<%= msg.getE03LCDM70().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM71" type="text" value="<%= msg.getE03LCDM71().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM72" type="text" value="<%= msg.getE03LCDM72().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM73" type="text" value="<%= msg.getE03LCDM73().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM74" type="text" value="<%= msg.getE03LCDM74().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM75" type="text" value="<%= msg.getE03LCDM75().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM76" type="text" value="<%= msg.getE03LCDM76().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM77" type="text" value="<%= msg.getE03LCDM77().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM78" type="text" value="<%= msg.getE03LCDM78().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM79" type="text" value="<%= msg.getE03LCDM79().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM80" type="text" value="<%= msg.getE03LCDM80().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM81" type="text" value="<%= msg.getE03LCDM81().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM82" type="text" value="<%= msg.getE03LCDM82().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM83" type="text" value="<%= msg.getE03LCDM83().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM84" type="text" value="<%= msg.getE03LCDM84().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM85" type="text" value="<%= msg.getE03LCDM85().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM86" type="text" value="<%= msg.getE03LCDM86().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM87" type="text" value="<%= msg.getE03LCDM87().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM88" type="text" value="<%= msg.getE03LCDM88().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM89" type="text" value="<%= msg.getE03LCDM89().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM90" type="text" value="<%= msg.getE03LCDM90().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM91" type="text" value="<%= msg.getE03LCDM91().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM92" type="text" value="<%= msg.getE03LCDM92().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM93" type="text" value="<%= msg.getE03LCDM93().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM94" type="text" value="<%= msg.getE03LCDM94().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM95" type="text" value="<%= msg.getE03LCDM95().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM96" type="text" value="<%= msg.getE03LCDM96().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM97" type="text" value="<%= msg.getE03LCDM97().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM98" type="text" value="<%= msg.getE03LCDM98().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM99" type="text" value="<%= msg.getE03LCDM99().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
          <INPUT name="E03LCDM00" type="text" value="<%= msg.getE03LCDM00().trim()%>" size="<%=size%>" maxlength="<%= chars %>" readonly="readonly"><BR>
	  <% } %>          
      	</div>
      </TD>
    </TR>
  </TABLE>
  
</FORM>
</BODY>
</HTML>
