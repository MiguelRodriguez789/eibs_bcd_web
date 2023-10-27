<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Historial de Mantenimiento</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id= "dbList" 	class= "datapro.eibs.beans.JBObjList"  			scope="session" />
<jsp:useBean id= "userPO" 	class= "datapro.eibs.beans.UserPos"  			scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  	scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">  
<% 
	String optMenu = request.getParameter("OPTMENU") == null ? "" : request.getParameter("OPTMENU").trim();

	if (!"".equals(optMenu)) { %>
   		builtNewMenu(<%=optMenu%>);
<%	} else { %>
		builtNewMenu(lc_i_opt); 
<%	} %>
</SCRIPT>
</head>

<BODY>
<%
	// show option menu
	if (userPO.getOption().equals("LN") 
		|| userPO.getOption().equals("LN_PAYMENTCOND")
		|| userPO.getOption().equals("CD")
		|| userPO.getOption().equals("DV")
		|| userPO.getOption().equals("LC")
		|| userPO.getOption().equals("CL")
		|| userPO.getOption().equals("RT")
		|| userPO.getOption().equals("SV")
		|| userPO.getOption().equals("CR")
		|| userPO.getOption().equals("CLIENT_C")
		|| userPO.getOption().equals("CLIENT_P")) {
	
 		out.println("<SCRIPT> initMenu();  </SCRIPT>");
	}
	
	if(optMenu.equals("nv_i_opt")) { 
%>
		<h3 align="center">Historial de Garantias Navieras
			<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="db_change_list.jsp, ELC0450"></h3>
<%	} else { %>
		<h3 align="center">Historial de Cartas de Cr&eacute;dito
			<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="db_change_list.jsp, ELC0450"></h3>
<%	} %>
<hr size="4">
<FORM >
	
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="25%" > 
              <div align="left"> 
                <input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%=  userPO.getBank().trim()%>">
              </div>
            </td>
			<% if(optMenu.equals("nv_i_opt")) { %>
            <td nowrap width="25%" > 
              <div align="right"><b>N&uacute;mero de Garantia :</b> </div>
            </td>
			<%} else {%>
            <td nowrap width="25%" > 
              <div align="right"><b>N&uacute;mero de Carta de Cr&eacute;dito :</b> </div>
            </td>
			<%}%>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E02NA12" size="27" maxlength="25" readonly value="<%= userPO.getIdentifier().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="3" maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="12%"> 
              <div align="right">Producto :</div>
            </td>
            <td nowrap width="33%"> 
              <div align="left"><b> 
                <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <p>
  <%if ( dbList.getNoResult() ) {%>
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
          dbList.initRow();
          boolean firstTime = true;
          String chk = "";
          while (dbList.getNextRow()) {
                
                datapro.eibs.beans.ELC045002Message msgList = (datapro.eibs.beans.ELC045002Message) dbList.getRecord();
		 %>
          <tr>
			<% String script = "";
				if ("D".equals(msgList.getE02LCLTTP())){
					script = "javascript:goDetailDoc('" + msgList.getE02LCLACC() + "', '" +  msgList.getE02LCLTNO() + "', '" +  msgList.getE02LCLTDM() + "', '" +  msgList.getE02LCLTDD() + "', '" +  msgList.getE02LCLTDY() + "', '" +  msgList.getE02LCLTTM() + "','" + msgList.getE02LCLTDY() + "', '" + msgList.getE02LCLTDM() + "', '" + msgList.getE02LCLTDD() + "', '" + msgList.getE02LCLTTM() + "', '" + msgList.getE02LCLADM() + "', '" + msgList.getE02LCLADD() + "', '" + msgList.getE02LCLADY() + "', '" + msgList.getE02LCLATM() + "', '" +  msgList.getE02DSCTTP()  + "', '" +  msgList.getE02LCLOPR()  + "', '" +  msgList.getE02APPREJ()  + "', '" +  msgList.getE02LCLSUP() + "')";
				} else if ("P".equals(msgList.getE02LCLTTP())||"I".equals(msgList.getE02LCLTTP())||"D".equals(msgList.getE02LCLTTP())||"R".equals(msgList.getE02LCLTTP())) {
					script = "javascript:goDetailPayment('" + msgList.getE02LCLACC() + "', '" +  msgList.getE02LCLTNO() + "', '" + msgList.getE02LCLOTP() + "', '" + msgList.getE02LCLTDM() + "', '" +  msgList.getE02LCLTDD() + "', '" +  msgList.getE02LCLTDY() + "', '" +  msgList.getE02LCLTTM() + "','" + msgList.getE02LCLTDY() + "', '" + msgList.getE02LCLTDM() + "', '" + msgList.getE02LCLTDD() + "', '" + msgList.getE02LCLTTM() + "', '" + msgList.getE02LCLADM() + "', '" + msgList.getE02LCLADD() + "', '" + msgList.getE02LCLADY() + "', '" + msgList.getE02LCLATM() + "', '" +  msgList.getE02DSCTTP()  + "', '" +  msgList.getE02LCLOPR()  + "', '" +  msgList.getE02APPREJ()  + "', '" +  msgList.getE02LCLSUP() + "')";
				} else if ("T".equals(msgList.getE02LCLTTP())) {
					script = "javascript:goDetailTransferAssignment('" + msgList.getE02LCLACC() + "', '" +  msgList.getE02LCLTNO() + "', '" + msgList.getE02LCLOTP() + "', '" + msgList.getE02LCLTDM() + "', '" +  msgList.getE02LCLTDD() + "', '" +  msgList.getE02LCLTDY() + "', '" +  msgList.getE02LCLTTM() + "','" + msgList.getE02LCLTDY() + "', '" + msgList.getE02LCLTDM() + "', '" + msgList.getE02LCLTDD() + "', '" + msgList.getE02LCLTTM() + "', '" + msgList.getE02LCLADM() + "', '" + msgList.getE02LCLADD() + "', '" + msgList.getE02LCLADY() + "', '" + msgList.getE02LCLATM() + "', '" +  msgList.getE02DSCTTP()  + "', '" +  msgList.getE02LCLOPR()  + "', '" +  msgList.getE02APPREJ()  + "', '" +  msgList.getE02LCLSUP() + "')";
				} else {
					script = "javascript:goDetail('" + msgList.getE02LCLTNO() + "', '" + msgList.getE02LCLTDY() + "', '" + msgList.getE02LCLTDM() + "', '" + msgList.getE02LCLTDD() + "', '" + msgList.getE02LCLTTM() + "', '" + msgList.getE02LCLADY() + "', '" + msgList.getE02LCLADM() + "', '" + msgList.getE02LCLADD() + "', '" + msgList.getE02LCLATM() + "', '" +  msgList.getE02DSCTTP()  + "', '" +  msgList.getE02LCLOPR()  + "', '" +  msgList.getE02APPREJ()  + "', '" +  msgList.getE02LCLSUP() + "')";
				}
			%>
            <td NOWRAP  align=CENTER><A href="<%=script %>"><%= Util.formatDate(msgList.getE02LCLTDD(), msgList.getE02LCLTDM(), msgList.getE02LCLTDY()) %></A></td>
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
  		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?H01OPECOD=0004&SCREEN=430&E01LCMTDY="+year_
		  																		+"&E02LCLTNO="+tno
		  																		+"&E01LCMTDM="+month_
		  																		+"&E01LCMTDD="+day_
		  																		+"&E01LCMTTM="+time_
		  																		+"&E01LCMADM="+month_1
		  																		+"&E01LCMADD="+day_1
		  																		+"&E01LCMADY="+year_1
		  																		+"&E01LCMATM="+time_1
		  																		+"&E01DSCTTP="+type
		  																		+"&E01LCMOPR="+opera
		  																		+"&E01APPREJ="+appro
		  																		+"&E01LCMSUP="+superv
		  																		+"&E01LCMACC=<%= userPO.getAccNum().trim()%>"
		  																		+"&E01LCMCCY=<%= userPO.getCurrency().trim()%>"
		  																		+"&E01LCMPRO=<%= userPO.getHeader1()%>"
		  																		+"&E01LCMBNK=<%= userPO.getBank().trim()%>";
		CenterNamedWindow(page, 'wHist', 900, 800, 2);
	}
 
 	function goDetailPayment(acc, tno, otp, tdm, tdd, tdy, ttm, month_, day_, year_, time_, month_1, day_1, year_1, time_1, type, opera, appro, superv){
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=2000&E02LCLACC="+acc
		  																		+"&E02LCLTNO="+tno
		  																		+"&E02LCLOTP="+otp
		  																		+"&E02LCLTDM="+tdm
		  																		+"&E02LCLTDD="+tdd
		  																		+"&E02LCLTDY="+tdy
		  																		+"&E02LCLTTM="+ttm//
		  																		+"&E01LCMTDY="+year_
		  																		+"&E01LCMTDM="+month_
		  																		+"&E01LCMTDD="+day_
		  																		+"&E01LCMTTM="+time_
		  																		+"&E01LCMADM="+month_1
		  																		+"&E01LCMADD="+day_1
		  																		+"&E01LCMADY="+year_1
		  																		+"&E01LCMATM="+time_1
		  																		+"&E01DSCTTP="+type
		  																		+"&E01LCMOPR="+opera
		  																		+"&E01APPREJ="+appro
		  																		+"&E01LCMSUP="+superv;
																
		CenterNamedWindow(page, 'wHist', 900, 800, 2);
 	}
 
 	function goDetailTransferAssignment(acc, tno, otp, tdm, tdd, tdy, ttm, month_, day_, year_, time_, month_1, day_1, year_1, time_1, type, opera, appro, superv){
		  var scrr = otp == "T" ? "2100" : "2200";
		  var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450?SCREEN=" + scrr + "&E02LCLACC="+acc
		  																		+"&E02LCLTNO="+tno
		  																		+"&E02LCLOTP="+otp
		  																		+"&E02LCLTDM="+tdm
		  																		+"&E02LCLTDD="+tdd
		  																		+"&E02LCLTDY="+tdy
		  																		+"&E02LCLTTM="+ttm//
		  																		+"&E01LCMTDY="+year_
		  																		+"&E01LCMTDM="+month_
		  																		+"&E01LCMTDD="+day_
		  																		+"&E01LCMTTM="+time_
		  																		+"&E01LCMADM="+month_1
		  																		+"&E01LCMADD="+day_1
		  																		+"&E01LCMADY="+year_1
		  																		+"&E01LCMATM="+time_1
		  																		+"&E01DSCTTP="+type
		  																		+"&E01LCMOPR="+opera
		  																		+"&E01APPREJ="+appro
		  																		+"&E01LCMSUP="+superv;
																
		CenterNamedWindow(page, 'wHist', 900, 800, 2);
 	}
 
 	function goDetailDoc(acc, tno, tdm, tdd, tdy, ttm, month_, day_, year_, time_, month_1, day_1, year_1, time_1, type, opera, appro, superv){
		var page = "<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0220?SCREEN=9&E02LCLACC="+acc
		  																		+"&E02LCLTNO="+tno
		  																		+"&E02LCLTDM="+tdm
		  																		+"&E02LCLTDD="+tdd
		  																		+"&E02LCLTDY="+tdy
		  																		+"&E02LCLTTM="+ttm//
		  																		+"&E01LCMTDY="+year_
		  																		+"&E01LCMTDM="+month_
		  																		+"&E01LCMTDD="+day_
		  																		+"&E01LCMTTM="+time_
		  																		+"&E01LCMADM="+month_1
		  																		+"&E01LCMADD="+day_1
		  																		+"&E01LCMADY="+year_1
		  																		+"&E01LCMATM="+time_1
		  																		+"&E01DSCTTP="+type
		  																		+"&E01LCMOPR="+opera
		  																		+"&E01APPREJ="+appro
		  																		+"&E01LCMSUP="+superv;
																
		CenterNamedWindow(page, 'wHist', 900, 800, 2);
 	}
 
</SCRIPT>
</form>
</body>
</html>
