<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Tabla de Credito Milagroso</title>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<META name="GENERATOR" content="IBM WebSphere Studio">

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>
<jsp:useBean id= "RecData" class= "datapro.eibs.beans.EDL054701Message"  scope="session"/>
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%> 
<h3 align="center">Tabla de Credito Milagroso<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_enter_sel_tables.jsp, EDL0546"></h3>
<hr size="4">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSEDL0547" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  <INPUT TYPE=HIDDEN NAME="SEARCHC" VALUE="">

  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>

<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
  <tr >
    <td align="right" width="50%" nowrap>Modalidad :&nbsp;</td>
    <td  width="50%" valign="top">
      <SELECT name="E01CMLCON">
						<OPTION value="C" <%if (RecData.getE01CMLCON().equals("C")) { out.print("selected"); }%>>Consumo </OPTION>
						<OPTION value="L" <%if (RecData.getE01CMLCON().equals("L")) { out.print("selected"); }%>>Comercial </OPTION>
						<OPTION value="H" <%if (RecData.getE01CMLCON().equals("H")) { out.print("selected"); }%>>Vivienda </OPTION>
						<OPTION value="M" <%if (RecData.getE01CMLCON().equals("M")) { out.print("selected"); }%>>Microcredito </OPTION>
						
					</SELECT>
    </td>
  </tr>  
  <tr >
    <td align="right" width="50%" nowrap>Oficina :&nbsp;</td>
    <td  width="50%" valign="top">
  		 <input type="text" name="E01CMLBRN" size="5" maxlength="4" value="<%= RecData.getE01CMLBRN().trim()%>">
		 <a href="javascript:GetBranch('E01CMLBRN','<%=currUser.getE01UBK()%>')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
    </td>
  </tr>
   
  <tr align="center" >
    <td nowrap colspan="2" align="center">
    <div id="DIVSUBMIT" align="center">
      <input id="EIBSBTN" type="submit" name="Submit" value="Enviar">
    </div>
    </td>
  </tr>
</table>

</form>
</body>
</html>
