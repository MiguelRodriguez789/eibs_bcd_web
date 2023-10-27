<%@ taglib uri="/WEB-INF/display.tld" prefix="display" %>
<!DOCTYPE HTML PUBLIC "-/W3C/DTD HTML 3.2 FINAL/EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="Author" CONTENT="Datapro">
<link rel="stylesheet" href="<%=request.getContextPath()%>/pages/style.css">
<TITLE>Internet Banking System</TITLE>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />

</HEAD>


<BODY topmargin="0" leftmargin="0">
<h3 align="center">Generación de Tarjetas de Seguridad<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cards_generate_report, ESS2070"></h3>
<FORM>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 %> 

<BR>

<table cellpadding=0 cellspacing=0 border=0 width=550 style="border-collapse: collapse" bgcolor="#FFFFFF">
    <tr>
<td>
<display:table width="550" name="lsCards" property="list" scope="session"  export="true">

  <display:column property="SERIAL"    align="center"  title="Serial"/>
  <display:column property="KEY01"    align="center"  title="A1"/>
  <display:column property="KEY02"    align="center"  title="A2"/>
  <display:column property="KEY03"    align="center"  title="A3"/>
  <display:column property="KEY04"    align="center"  title="A4"/>
  <display:column property="KEY05"    align="center"  title="A5"/>
  <display:column property="KEY06"    align="center"  title="B1"/>
  <display:column property="KEY07"    align="center"  title="B2"/>
  <display:column property="KEY08"    align="center"  title="B3"/>
  <display:column property="KEY09"    align="center"  title="B4"/>
  <display:column property="KEY10"    align="center"  title="B5"/>
  
  <display:column property="KEY11"    align="center"  title="C1"/>
  <display:column property="KEY12"    align="center"  title="C2"/>
  <display:column property="KEY13"    align="center"  title="C3"/>
  <display:column property="KEY14"    align="center"  title="C4"/>
  <display:column property="KEY15"    align="center"  title="C5"/>
  <display:column property="KEY16"    align="center"  title="D1"/>
  <display:column property="KEY17"    align="center"  title="D2"/>
  <display:column property="KEY18"    align="center"  title="D3"/>
  <display:column property="KEY19"    align="center"  title="D4"/>
  <display:column property="KEY20"    align="center"  title="D5"/>
  
  <display:column property="KEY21"    align="center"  title="E1"/>
  <display:column property="KEY22"    align="center"  title="E2"/>
  <display:column property="KEY23"    align="center"  title="E3"/>
  <display:column property="KEY24"    align="center"  title="E4"/>
  <display:column property="KEY25"    align="center"  title="E5"/>
  <display:column property="KEY26"    align="center"  title="F1"/>
  <display:column property="KEY27"    align="center"  title="F2"/>
  <display:column property="KEY28"    align="center"  title="F3"/>
  <display:column property="KEY29"    align="center"  title="F4"/>
  <display:column property="KEY30"    align="center"  title="F5"/>
  
  <display:column property="KEY31"    align="center"  title="G1"/>
  <display:column property="KEY32"    align="center"  title="G2"/>
  <display:column property="KEY33"    align="center"  title="G3"/>
  <display:column property="KEY34"    align="center"  title="G4"/>
  <display:column property="KEY35"    align="center"  title="G5"/>
  <display:column property="KEY36"    align="center"  title="H1"/>
  <display:column property="KEY37"    align="center"  title="H2"/>
  <display:column property="KEY38"    align="center"  title="H3"/>
  <display:column property="KEY39"    align="center"  title="H4"/>
  <display:column property="KEY40"    align="center"  title="H5"/>
  
  <display:column property="KEY41"    align="center"  title="J1"/>
  <display:column property="KEY42"    align="center"  title="J2"/>
  <display:column property="KEY43"    align="center"  title="J3"/>
  <display:column property="KEY44"    align="center"  title="J4"/>
  <display:column property="KEY45"    align="center"  title="J5"/>
  <display:column property="KEY46"    align="center"  title="K1"/>
  <display:column property="KEY47"    align="center"  title="K2"/>
  <display:column property="KEY48"    align="center"  title="K3"/>
  <display:column property="KEY49"    align="center"  title="K4"/>
  <display:column property="KEY50"    align="center"  title="K5"/>
  
  <display:setProperty name="export.xml" value="false" />
  <display:setProperty name="export.txt" value="false" />
  <display:setProperty name="export.qif" value="false" />
  <display:setProperty name="export.decorated" value="true" />
  <display:setProperty name="export.excel.include_header" value="true" /> 
  
</display:table> 
</td>
</tr>
</table>
<p align="CENTER">
   <input id="EIBSBTN" type=button name="Submit" value="Imprimir" onClick="window.location.href='ESS2070_cards_generate_report_print.jsp'"> 
  </p>
    

</FORM>
</BODY>
</HTML>
 