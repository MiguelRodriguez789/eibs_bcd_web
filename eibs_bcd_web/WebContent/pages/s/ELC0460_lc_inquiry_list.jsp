<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Historial de Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "jbList" class= "datapro.eibs.beans.JBObjList" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%>
</head>

<BODY>

<h3 align="center">Historial de Cartas de Cr&eacute;dito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_inquiry_list.jsp, ELC0460"></h3>
<hr size="4">
<FORM name="letterOfCreditHistory" method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450" target="wHist" >
	<INPUT TYPE=HIDDEN NAME="H01OPECOD" id="H01OPECOD" VALUE="0004">
	<INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="430">
	<INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="A">
	<INPUT TYPE=HIDDEN NAME="E01LCMTDY" id="E01LCMTDY" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMTDM" id="E01LCMTDM" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMTDD" id="E01LCMTDD" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMTTM" id="E01LCMTTM" VALUE="">
	
	<INPUT TYPE=HIDDEN NAME="E01LCMADM" id="E01LCMADM" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMADD" id="E01LCMADD" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMADY" id="E01LCMADY" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMATM" id="E01LCMATM" VALUE="">
	
	<INPUT TYPE=HIDDEN NAME="E01DSCTTP" id="E01DSCTTP" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMOPR" id="E01LCMOPR" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01APPREJ" id="E01APPREJ" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01LCMSUP" id="E01LCMSUP" VALUE="">
	
	<INPUT TYPE=HIDDEN NAME="E02LCLACC" id="E02LCLACC" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E02LCLTNO" id="E02LCLTNO" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E02LCLTDM" id="E02LCLTDM" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E02LCLTDD" id="E02LCLTDD" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E02LCLTDY" id="E02LCLTDY" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E02LCLTTM" id="E02LCLTTM" VALUE="">
	
	<INPUT TYPE=HIDDEN NAME="E02LCLOTP" id="E02LCLOTP" VALUE="">
	
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="15%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="30%" > 
              <div align="left"> 
                <input type="text" name="E01LCMBNK" size="9" maxlength="9" readonly value="<%= userPO.getBank().trim()%>">
              </div>
            </td>
            <td nowrap width="15%" > 
              <div align="right"><b>N&uacute;mero de Carta de Cr&eacute;dito :</b> </div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"> 
                <input type="text" name="E01LCMACC" size="27" maxlength="25" readonly value="<%= userPO.getAccNum().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left"><b> 
                <input type="text" name="E01LCMCCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="15%"> 
              <div align="right">Producto :</div>
            </td>
            <td nowrap width="30%"> 
              <div align="left"><b> 
                <input type="text" name="E01LCMPRO" size="4" maxlength="4" readonly value="<%= userPO.getProdCode()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p>
  <%if ( jbList.getNoResult() ) {%>
  </p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <TABLE class="tbenter" width="100%" >
    <TR>
      <TD > 
        <div align="center"> 
          <p><b>No hay resultados para su criterio de búsqueda</b></p>
          <p>&nbsp;</p>
        </div>
	  </TD>
	</TR>
    </TABLE>
	<%} else {%> 
  <p> 
  <br>
  <table  id=cfTable class="tableinfo">
    <tr > 
      <td NOWRAP valign="top" width="100%"> 
        <table id="headTable" width="100%">
          <tr id="trdark"> 
            <th align=CENTER nowrap width="16%"> 
              <div align="center">FECHA</div>
            </th>
            <th align=CENTER nowrap width="16%"> 
              <div align="center">HORA</div>
            </th>
            <th align=CENTER nowrap width="18%"> 
              <div align="center">TIPO TRANSACCION</div>
            </th>
            <th align=CENTER nowrap width="16%"> 
              <div align="center">OPERADOR</div>
            </th>
            <th align=CENTER nowrap width="16%"> 
              <div align="center">APROBADA/RECHAZADA</div>
            </th>
            <th align=CENTER nowrap width="16%"> 
              <div align="center">SUPERVISOR</div>
            </th>            
          </tr>
          <%
          jbList.initRow();
          boolean firstTime = true;
          String chk = "";
          while (jbList.getNextRow()) {
                
                datapro.eibs.beans.ELC045002Message msgList = (datapro.eibs.beans.ELC045002Message) jbList.getRecord();
		 %>
          <tr>
<%--             <td NOWRAP  align=CENTER><%= msgList.getE02LCLTDD() %>/<%= msgList.getE02LCLTDM() %>/<%= msgList.getE02LCLTDY() %></td> --%>
            <% String script = "";
				if ("D".equals(msgList.getE02LCLTTP())){
					script = "javascript:goDetailDoc('" + msgList.getE02LCLACC() + "', '" +  msgList.getE02LCLTNO() + "', '" +  msgList.getE02LCLTDM() + "', '" +  msgList.getE02LCLTDD() + "', '" +  msgList.getE02LCLTDY() + "', '" +  msgList.getE02LCLTTM() + "','" + msgList.getE02LCLTDY() + "', '" + msgList.getE02LCLTDM() + "', '" + msgList.getE02LCLTDD() + "', '" + msgList.getE02LCLTTM() + "', '" + msgList.getE02LCLADM() + "', '" + msgList.getE02LCLADD() + "', '" + msgList.getE02LCLADY() + "', '" + msgList.getE02LCLATM() + "', '" +  msgList.getE02DSCTTP()  + "', '" +  msgList.getE02LCLOPR()  + "', '" +  msgList.getE02APPREJ()  + "', '" +  msgList.getE02LCLSUP() + "')";
				} else if ("P".equals(msgList.getE02LCLTTP())) {
					script = "javascript:goDetailPayment('" + msgList.getE02LCLACC() + "', '" +  msgList.getE02LCLTNO() + "', '" + msgList.getE02LCLOTP() + "', '" + msgList.getE02LCLTDM() + "', '" +  msgList.getE02LCLTDD() + "', '" +  msgList.getE02LCLTDY() + "', '" +  msgList.getE02LCLTTM() + "','" + msgList.getE02LCLTDY() + "', '" + msgList.getE02LCLTDM() + "', '" + msgList.getE02LCLTDD() + "', '" + msgList.getE02LCLTTM() + "', '" + msgList.getE02LCLADM() + "', '" + msgList.getE02LCLADD() + "', '" + msgList.getE02LCLADY() + "', '" + msgList.getE02LCLATM() + "', '" +  msgList.getE02DSCTTP()  + "', '" +  msgList.getE02LCLOPR()  + "', '" +  msgList.getE02APPREJ()  + "', '" +  msgList.getE02LCLSUP() + "')";
				} else if ("T".equals(msgList.getE02LCLTTP())) {
					script = "javascript:goDetailTransferAssignment('" + msgList.getE02LCLACC() + "', '" +  msgList.getE02LCLTNO() + "', '" + msgList.getE02LCLOTP() + "', '" + msgList.getE02LCLTDM() + "', '" +  msgList.getE02LCLTDD() + "', '" +  msgList.getE02LCLTDY() + "', '" +  msgList.getE02LCLTTM() + "','" + msgList.getE02LCLTDY() + "', '" + msgList.getE02LCLTDM() + "', '" + msgList.getE02LCLTDD() + "', '" + msgList.getE02LCLTTM() + "', '" + msgList.getE02LCLADM() + "', '" + msgList.getE02LCLADD() + "', '" + msgList.getE02LCLADY() + "', '" + msgList.getE02LCLATM() + "', '" +  msgList.getE02DSCTTP()  + "', '" +  msgList.getE02LCLOPR()  + "', '" +  msgList.getE02APPREJ()  + "', '" +  msgList.getE02LCLSUP() + "')";
				} else {
					script = "javascript:goDetail('" + msgList.getE02LCLTNO() + "', '" + msgList.getE02LCLTDY() + "', '" + msgList.getE02LCLTDM() + "', '" + msgList.getE02LCLTDD() + "', '" + msgList.getE02LCLTTM() + "', '" + msgList.getE02LCLADM() + "', '" + msgList.getE02LCLADD() + "', '" + msgList.getE02LCLADY() + "', '" + msgList.getE02LCLATM() + "', '" +  msgList.getE02DSCTTP()  + "', '" +  msgList.getE02LCLOPR()  + "', '" +  msgList.getE02APPREJ()  + "', '" +  msgList.getE02LCLSUP() + "');";
				}
			%>
            <td NOWRAP  align=CENTER><A href="<%=script %>"><%= Util.formatDate(msgList.getE02LCLTDD(), msgList.getE02LCLTDM(), msgList.getE02LCLTDY())%></A></td>
            <td NOWRAP  align=CENTER><A href="<%=script %>"><%= Util.formatTime(msgList.getE02LCLTTM()) %></A></td>
            <td NOWRAP  align=CENTER><A href="<%=script %>"><%= msgList.getE02DSCTTP() %></A></td>
            <td NOWRAP  align=CENTER><A href="<%=script %>"><%= msgList.getE02LCLOPR() %></A></td>
            <td NOWRAP  align=CENTER><A href="<%=script %>"><%= msgList.getE02APPREJ() %></A></td>
            <td NOWRAP  align=CENTER><A href="<%=script %>"><%= msgList.getE02LCLSUP() %></A></td>
          </tr>
          <%}%>
        </table>
  </table>
     
<%}%>

<SCRIPT type="text/javascript">
	function goDetail(tno, year_, month_, day_, time_, month_1, day_1, year_1, time_1, type, opera, appro, superv){
 		  document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450";
		document.getElementById("E02LCLACC").value = '';
		document.getElementById("SCREEN").value = '430';
		document.getElementById("E02LCLTNO").value = tno;
		document.getElementById("E01LCMTDY").value = year_;
		document.getElementById("E01LCMTDM").value = month_;
		document.getElementById("E01LCMTDD").value = day_;
		document.getElementById("E01LCMTTM").value = time_;
		document.getElementById("E01LCMADM").value = month_1;
		document.getElementById("E01LCMADD").value = day_1;
		document.getElementById("E01LCMADY").value = year_1;
		document.getElementById("E01LCMATM").value = time_1;
		document.getElementById("E01DSCTTP").value = type;
		document.getElementById("E01LCMOPR").value = opera;
		document.getElementById("E01APPREJ").value = appro;
		document.getElementById("E01LCMSUP").value = superv;
		  CenterNamedWindow('<%=request.getContextPath()%>/pages/s/MISC_wait.jsp','wHist',900,800,2);
		  document.forms[0].submit();
 }
 
 function goDetailPayment(acc, tno, otp, tdm, tdd, tdy, ttm, year_, month_, day_, time_, month_1, day_1, year_1, time_1, type, opera, appro, superv){
 		  document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450";
		  document.getElementById("SCREEN").value = '2000';
		  document.getElementById("E02LCLACC").value = acc;
		  document.getElementById("E02LCLTNO").value = tno;
		  document.getElementById("E02LCLOTP").value = otp;
		  document.getElementById("E02LCLTDM").value = tdm;
		  document.getElementById("E02LCLTDD").value = tdd;
		  document.getElementById("E02LCLTDY").value = tdy;
		  document.getElementById("E02LCLTTM").value = ttm;
		  
		  document.getElementById("E01LCMTDY").value = year_;
		  document.getElementById("E01LCMTDM").value = month_;
		  document.getElementById("E01LCMTDD").value = day_;
		  document.getElementById("E01LCMTTM").value = time_;
		  document.getElementById("E01LCMADM").value = month_1;
		  document.getElementById("E01LCMADD").value = day_1;
		  document.getElementById("E01LCMADY").value = year_1;
	      document.getElementById("E01LCMATM").value = time_1;
		  document.getElementById("E01DSCTTP").value = type;
		  document.getElementById("E01LCMOPR").value = opera;
		  document.getElementById("E01APPREJ").value = appro;
		  document.getElementById("E01LCMSUP").value = superv;
		  CenterNamedWindow('<%=request.getContextPath()%>/pages/s/MISC_wait.jsp','wHist',900,800,2);
		  document.forms[0].submit();
 }
 
 function goDetailTransferAssignment(acc, tno, otp, tdm, tdd, tdy, ttm, year_, month_, day_, time_, month_1, day_1, year_1, time_1, type, opera, appro, superv){
 		  document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450";
 		  if(otp == 'T') {
		  	document.getElementById("SCREEN").value = '2100';
		  } else {
		  	document.getElementById("SCREEN").value = '2200';
		  }
		  document.getElementById("E02LCLACC").value = acc;
		  document.getElementById("E02LCLTNO").value = tno;
		  document.getElementById("E02LCLOTP").value = otp;
		  document.getElementById("E02LCLTDM").value = tdm;
		  document.getElementById("E02LCLTDD").value = tdd;
		  document.getElementById("E02LCLTDY").value = tdy;
		  document.getElementById("E02LCLTTM").value = ttm;
		  
		  document.getElementById("E01LCMTDY").value = year_;
		  document.getElementById("E01LCMTDM").value = month_;
		  document.getElementById("E01LCMTDD").value = day_;
		  document.getElementById("E01LCMTTM").value = time_;
		  document.getElementById("E01LCMADM").value = month_1;
		  document.getElementById("E01LCMADD").value = day_1;
		  document.getElementById("E01LCMADY").value = year_1;
	      document.getElementById("E01LCMATM").value = time_1;
		  document.getElementById("E01DSCTTP").value = type;
		  document.getElementById("E01LCMOPR").value = opera;
		  document.getElementById("E01APPREJ").value = appro;
		  document.getElementById("E01LCMSUP").value = superv;
		  CenterNamedWindow('<%=request.getContextPath()%>/pages/s/MISC_wait.jsp','wHist',900,800,2);
		  document.forms[0].submit();
 }
 
 function goDetailDoc(acc, tno, tdm, tdd, tdy, ttm, year_, month_, day_, time_, month_1, day_1, year_1, time_1, type, opera, appro, superv){
	
		  document.forms[0].action = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0220";
		  document.getElementById("SCREEN").value = '9';
		  document.getElementById("E02LCLACC").value = acc;
		  document.getElementById("E02LCLTNO").value = tno;
		  document.getElementById("E02LCLTDM").value = tdm;
		  document.getElementById("E02LCLTDD").value = tdd;
		  document.getElementById("E02LCLTDY").value = tdy;
		  document.getElementById("E02LCLTTM").value = ttm;
		  
		  document.getElementById("E01LCMTDY").value = year_;
		  document.getElementById("E01LCMTDM").value = month_;
		  document.getElementById("E01LCMTDD").value = day_;
		  document.getElementById("E01LCMTTM").value = time_;
		  document.getElementById("E01LCMADM").value = month_1;
		  document.getElementById("E01LCMADD").value = day_1;
		  document.getElementById("E01LCMADY").value = year_1;
	      document.getElementById("E01LCMATM").value = time_1;
		  document.getElementById("E01DSCTTP").value = type;
		  document.getElementById("E01LCMOPR").value = opera;
		  document.getElementById("E01APPREJ").value = appro;
		  document.getElementById("E01LCMSUP").value = superv;
		  CenterNamedWindow('<%=request.getContextPath()%>/pages/s/MISC_wait.jsp','wHist',900,800,2);
		  document.forms[0].submit();
 }
</SCRIPT>
</form>
</body>
</html>
