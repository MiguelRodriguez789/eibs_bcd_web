<%@ taglib uri="/WEB-INF/display.tld" prefix="display" %>
<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 3.2 FINAL/EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<TITLE>Internet Banking System</TITLE>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</HEAD>

<jsp:useBean id="lsCards"  class="com.datapro.generics.BeanList"  scope="session"/>

<BODY topmargin="0" leftmargin="0">
<h3 align="center">Generación de Tarjetas de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cards_generate_report_print, ESS2070"></h3>
<FORM>

<br>

<BR>

<%
lsCards.initRow();
while(lsCards.getNextRow()){
  com.datapro.eibs.internet.databeans.DC_CARDS cardsdatabean = new com.datapro.eibs.internet.databeans.DC_CARDS();
  cardsdatabean = (com.datapro.eibs.internet.databeans.DC_CARDS) lsCards.getRecord();
%>
<%= cardsdatabean.getSERIAL() %>
<table border=2 CELLSPACING=0 CELLPADDING=0 WIDTH=95%>
  <tr>
   <td>&nbsp;</td>
     <td align="center">A</td>
     <td align="center">B</td>
     <td align="center">C</td>
     <td align="center">D</td>
     <td align="center">E</td>
     <td align="center">F</td>
     <td align="center">G</td>
     <td align="center">H</td>
     <td align="center">J</td>
     <td align="center">K</td>
     <td align="center">&nbsp;</td>
  </tr>  
  <tr>  
    <td align="center">1</td>
     <td align="center"><%= cardsdatabean.getKEY01() %></td>
     <td align="center"><%= cardsdatabean.getKEY06() %></td>
     <td align="center"><%= cardsdatabean.getKEY11() %></td>
     <td align="center"><%= cardsdatabean.getKEY16() %></td>
     <td align="center"><%= cardsdatabean.getKEY21() %></td>
     <td align="center"><%= cardsdatabean.getKEY26() %></td>
     <td align="center"><%= cardsdatabean.getKEY31() %></td>
     <td align="center"><%= cardsdatabean.getKEY36( )%></td>
     <td align="center"><%= cardsdatabean.getKEY41() %></td>
     <td align="center"><%= cardsdatabean.getKEY46() %></td>
     <td align="center">1</td>
  </tr>
  <tr>  
    <td align="center">2</td>
     <td align="center"><%= cardsdatabean.getKEY02() %></td>
     <td align="center"><%= cardsdatabean.getKEY07() %></td>
     <td align="center"><%= cardsdatabean.getKEY12() %></td>
     <td align="center"><%= cardsdatabean.getKEY17() %></td>
     <td align="center"><%= cardsdatabean.getKEY22() %></td>
     <td align="center"><%= cardsdatabean.getKEY27() %></td>
     <td align="center"><%= cardsdatabean.getKEY32() %></td>
     <td align="center"><%= cardsdatabean.getKEY37( )%></td>
     <td align="center"><%= cardsdatabean.getKEY42() %></td>
     <td align="center"><%= cardsdatabean.getKEY47() %></td>
     <td align="center">2</td>
  </tr>
  <tr>  
    <td align="center">3</td>
     <td align="center"><%= cardsdatabean.getKEY03() %></td>
     <td align="center"><%= cardsdatabean.getKEY08() %></td>
     <td align="center"><%= cardsdatabean.getKEY13() %></td>
     <td align="center"><%= cardsdatabean.getKEY18() %></td>
     <td align="center"><%= cardsdatabean.getKEY23() %></td>
     <td align="center"><%= cardsdatabean.getKEY28() %></td>
     <td align="center"><%= cardsdatabean.getKEY33() %></td>
     <td align="center"><%= cardsdatabean.getKEY38( )%></td>
     <td align="center"><%= cardsdatabean.getKEY43() %></td>
     <td align="center"><%= cardsdatabean.getKEY48() %></td>
     <td align="center">3</td>
  </tr>
  <tr>  
    <td align="center">4</td>
     <td align="center"><%= cardsdatabean.getKEY04() %></td>
     <td align="center"><%= cardsdatabean.getKEY09() %></td>
     <td align="center"><%= cardsdatabean.getKEY14() %></td>
     <td align="center"><%= cardsdatabean.getKEY19() %></td>
     <td align="center"><%= cardsdatabean.getKEY24() %></td>
     <td align="center"><%= cardsdatabean.getKEY29() %></td>
     <td align="center"><%= cardsdatabean.getKEY34() %></td>
     <td align="center"><%= cardsdatabean.getKEY39( )%></td>
     <td align="center"><%= cardsdatabean.getKEY44() %></td>
     <td align="center"><%= cardsdatabean.getKEY49() %></td>
     <td align="center">4</td>
  </tr>
  <tr>  
    <td align="center">5</td>
     <td align="center"><%= cardsdatabean.getKEY05() %></td>
     <td align="center"><%= cardsdatabean.getKEY10() %></td>
     <td align="center"><%= cardsdatabean.getKEY15() %></td>
     <td align="center"><%= cardsdatabean.getKEY20() %></td>
     <td align="center"><%= cardsdatabean.getKEY25() %></td>
     <td align="center"><%= cardsdatabean.getKEY30() %></td>
     <td align="center"><%= cardsdatabean.getKEY35() %></td>
     <td align="center"><%= cardsdatabean.getKEY40( )%></td>
     <td align="center"><%= cardsdatabean.getKEY45() %></td>
     <td align="center"><%= cardsdatabean.getKEY50() %></td>
     <td align="center">5</td>
  </tr>
</table>

<BR>
<BR>
<BR>

<%
}
%>  

<br>

<table CELLSPACING=0 CELLPADDING=0 width=95%>
  <TR> 
    <TD WIDTH=100% ALIGN="CENTER"><input id="EIBSBTN" type=button value="Imprimir"   onClick="eIBSPrint()"></TD>
  </TR>
</TABLE>

 
</FORM>
</BODY>
</HTML>
 