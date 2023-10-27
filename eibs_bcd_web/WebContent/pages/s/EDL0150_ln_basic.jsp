<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.*" %>
<html>
<head>
<title>Mantenimiento de Prestamos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EDL015001Message"  scope="session" />
<jsp:useBean id="lnGenTran" class="datapro.eibs.beans.EDL015230Message"  scope="session" />
<jsp:useBean id= "ded" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "tax" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "com" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "iva" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "ins" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "coll" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "pmnt" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "pmntPlus" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

 

<SCRIPT type="text/javascript">

<%	if (userPO.getPurpose().equals("MAINTENANCE")){%>

   		builtNewMenu(ln_m_opt);

<%	
	}
%>
  	function showCollMaintB(){
      var client = document.getElementById("E01DEACUN").value;
      showCollMaint(client);
  	}

  	function showLimits(bank,prod){
  		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.helps.JSEWD0380?loan=true&bnk=" + bank + "&prd=" + prod;
  		CenterWindow(page, 700, 500, 2);
  	}

  	function getNewDeduct(acc) {
   		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0370?SCREEN=7&ACCNUM=" + acc;
   		CenterWindow(page, 800, 600, 2);
  	}
  
  	function getDeduct(acc, cod) {
  		var TBDEDUCT = document.getElementById('TBDEDUCT');
   		var row;
   		for (var i=1; i<TBDEDUCT.rows.length; i++) {
     		if (TBDEDUCT.rows[i].cells[0].innerText == cod) {
      			row = i;
      			break
     		}
   		}
   		page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0370?SCREEN=3&ACCNUM=" + acc + "&COD=" + cod + "&ROW="+ row;
   		CenterWindow(page, 800, 600, 2);
  	}
  
 	function UpdateFlag(val) {
  		document.forms[0].E01RCLFLC.value = (val) ? "X" : "";
 	}
 
 	function setRecalculate() {
 		if (isValidObject(document.forms[0].RECALC)) {
	  		document.forms[0].RECALC.checked = true;
	  		document.forms[0].RECALC.disabled = true;
	  		UpdateFlag(true);  
 		}
 	}

/*
	function RecalculateCommission(ncom) {
		var form = document.forms[0];
		for(var i=0; i<ncom; i++) {
			if (form["CMBCOM"+ i].value.trim() != "") {
				form["E02DEDAMTC"+ i].value = parseFloat((form["E01DEAOAM"].value)) * (3 - parseFloat(form["CMBCOM"+ i].value)) / 100;
			}
		}
		document.forms[0].submit();
 	}
*/

	function checkDiv(){
		if (isValidObject(document.getElementById("E01DEBCHF"))) {
			var debchfValue = document.getElementById("E01DEBCHF").value;
   			if (debchfValue == "2") {
				setVisibility(document.getElementById("DEBCHA"), "visible");
			} else {
   				setVisibility(document.getElementById("DEBCHA"), "hidden");
        		document.getElementById("E01DEBCHA").value = '';
			}
		}
	}
</SCRIPT>

</head>
<body onLoad="checkDiv();">
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }

	if (userPO.getPurpose().equals("MAINTENANCE")) {
 		out.println("<SCRIPT> initMenu(); </SCRIPT>");}

  		int numCom = 0;

  		boolean isDEAIPDNum = true;
  		boolean isDEAPPDNum = true;
	  	String DEAIPD = lnBasic.getE01DEAIPD().trim();
	  	String DEAPPD = lnBasic.getE01DEAPPD().trim();
	  	String E01FLGDED = lnBasic.getE01FLGDED().trim();
	  	String E01FLGREF = lnBasic.getE01FLGREF().trim();
	  	String E01FLGPAY = lnBasic.getE01FLGPAY().trim();
	  	String E01FLGCOL = lnBasic.getE01FLGCOL().trim();
	  	String E01DEACLF = lnBasic.getE01DEACLF().trim();
  
  		int i;
  		try {
    		i = Integer.parseInt(DEAIPD);
  		} catch (Exception e) {
    		isDEAIPDNum = false;
  		}
  		try {
    		i = Integer.parseInt(DEAPPD);
  		} catch (Exception e) {
    		isDEAPPDNum = false;
  		}

  		String genFlag = "";
  		try {
      		genFlag = request.getParameter("generic").trim();
      		//if (genFlag == null) genFlag = "";
  		} catch (Exception e) {
    		genFlag = lnBasic.getE01DEACLF().trim();
  		}

  		boolean protect = JSEIBSProp.getProtectedBNKBRN();
%> 

<h3 align="center"> <%= lnBasic.getE01DSCPRO().trim()%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_basic.jsp, EDL0150"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="F">
  <INPUT TYPE=HIDDEN NAME="E01DEARDM" value="<%= lnBasic.getE01DEARDM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARDD" value="<%= lnBasic.getE01DEARDD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARDY" value="<%= lnBasic.getE01DEARDY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCNC1" value="<%= lnBasic.getE01DLCNC1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCVA1" value="<%= lnBasic.getE01DLCVA1().trim()%>">
  <input type=HIDDEN name="E01DLCFP1" value="<%= lnBasic.getE01DLCFP1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCTP1" value="<%= lnBasic.getE01DLCTP1().trim()%>">
  <input type=HIDDEN name="E01DEATYP" value="<%= lnBasic.getE01DEATYP().trim()%>">
  
  <INPUT TYPE=HIDDEN NAME="E01RCLFLC" VALUE="<%= lnBasic.getE01RCLFLC().trim()%>">
  <INPUT TYPE=HIDDEN NAME="DEDFIN"    VALUE="<%= lnBasic.getE01DEDFIN().trim()%>">
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="16%" >
              <div align="left">
                <input type="text" name="E01DEACUN" id="E01DEACUN" size="10" maxlength="9" value="<%= lnBasic.getE01DEACUN().trim()%>">
                <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="16%" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= lnBasic.getE01CUSNA1().trim()%>">
                </font></font></font></div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Banco/Sucursal : </b></div>
            </td>
            <td nowrap width="16%"> 
             <% if( protect || !lnBasic.getH01FLGMAS().trim().equals("N")) {%>
              <input readonly type="text" id="E01DEABNK" name="E01DEABNK" size="2" maxlength="2" value="<%= lnBasic.getE01DEABNK().trim()%>" onchange="setRecalculate()">
              <input readonly type="text" id="E01DEABRN" name="E01DEABRN" size="4" maxlength="4" value="<%= lnBasic.getE01DEABRN().trim()%>"  onchange="setRecalculate()">          
			<%
            } else {
            %>      
              <input type="text" id="E01DEABNK" name="E01DEABNK" size="2" maxlength="2" value="<%= lnBasic.getE01DEABNK().trim()%>" onchange="setRecalculate()">
              <input type="text" id="E01DEABRN" name="E01DEABRN" size="4" maxlength="4" value="<%= lnBasic.getE01DEABRN().trim()%>" onchange="setRecalculate()">
              <a href="javascript:GetBranch('E01DEABRN',document.getElementById('E01DEABNK').value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
            <%} %>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap> 
              <div align="right"><b>Préstamo :</b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly
					value="<% if(userPO.getPurpose().equals("MAINTENANCE")) {out.print(lnBasic.getE01DEAACC().trim());} else { 
					if (lnBasic.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(lnBasic.getE01DEAACC().trim());} %>"
				>
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= lnBasic.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap> 
              <div align="left"><b>
                <input type="text" readonly name="E01DEAPRO" size="5" maxlength="4" value="<%= lnBasic.getE01DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>

		 <%if (lnBasic.getE01FLGIBF().equals("R")) {  %> 
          <tr id="trdark">
            <td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap> 
              <div align="right"> </div>
            </td>
            <td nowrap> 
              <div align="center"><b>Préstamos de Tasa Preferencial</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="right"> </div>
            </td>
          </tr>
		 <% } %> 

        </table>
      </td>
    </tr>
  </table>
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4> 
<%if ( genFlag.equals("U") == false ) {%>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <%  if (!(currUser.getE01INT().trim().equals("11"))) {%>  
            <td nowrap width="23%"> 
				<eibsinput:date name="lnBasic" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" readonly="true"/>
            </td>
            <% } else    {%> 
              <td nowrap width="23%"> 
				<eibsinput:date name="lnBasic" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" />
            </td>
            <% } %> 
            <td nowrap width="25%"> 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <%  if (!(currUser.getE01INT().trim().equals("11"))) {%> 
            <td nowrap width="27%"> 
              <input type="text" name="E01DEATRM" size="6" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>" onchange="setRecalculate()" <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %>>
              <select name="E01DEATRC" onchange="setRecalculate()" <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %> >
                            <OPTION value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
                            <OPTION value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            <OPTION value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
                        </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
             <% } else    {%>     
             <td nowrap width="27%"> 
              <input type="text" name="E01DEATRM" size="6" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>" onchange="setRecalculate()" >
              <select name="E01DEATRC" onchange="setRecalculate()"  >
                            <OPTION value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
                            <OPTION value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            <OPTION value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
                        </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
             <% } %> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <%  if (!(currUser.getE01INT().trim().equals("11"))) {%> 
            <td nowrap width="23%"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" readonly="true" required="true"/>
            </td>
            <% } else    {%> 
            <td nowrap width="23%"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" readonly="false" required="true"/>
            </td>
            <% } %> 
            <% if (!lnBasic.getH01FLGMAS().trim().equals("N"))  {%>
            <td nowrap width="25%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEAOAM" size="17" maxlength="15" value="<%= lnBasic.getE01DEAOAM().trim()%>" onKeypress="enterDecimal(event)" onchange="setRecalculate()" <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %>>
            </td>
             <% } else {%> 
              <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="27%"> 
            </td>
            <% } %>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tabla Tasa Flotante :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= lnBasic.getE01DEAFTB().trim()%>" onchange="setRecalculate()" >
              
              <a href="javascript:GetFloating('E01DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
              
              
              <select name="E01DEAFTY" onchange="setRecalculate()"> 
                <option value=" " <% if (!(lnBasic.getE01DEAFTY().equals("FP") ||lnBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (lnBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (lnBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01FLTRTE" readonly size="12" maxlength="10" value="<%= lnBasic.getE01FLTRTE().trim()%>" <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %> onKeypress="enterRate(event)" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tasa/Cargo por Mora :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAPEI" size="8" maxlength="7" value="<%= lnBasic.getE01DEAPEI().trim()%>" >
              <input type="text" name="E01DEAPIF" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPIF().trim()%>" >
              <a href="javascript:lnGetFact('E01DEAPIF','STATIC_ln_fact.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"  ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa Interes/Spread :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01DEARTE" size="12" maxlength="10" value="<%= lnBasic.getE01DEARTE().trim()%>" onKeypress="enterRate(event)" <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %>>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tasa M&iacute;nima Permitida :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01DEAMIR" size="12" maxlength="10" value="<%= lnBasic.getE01DEAMIR().trim()%>" <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %> onKeypress="enterRate(event)" >
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa M&aacute;xima Permitida :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01DEAMXR"  size="12" maxlength="10" value="<%= lnBasic.getE01DEAMXR().trim()%>" onKeypress="enterRate(event)" <%-- onKeypress="enterSignDecimal()" onchange="setRecalculate()" --%> <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %>>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">L&iacute;nea de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= lnBasic.getE01DEACMC().trim()%>" >
              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= lnBasic.getE01DEACMN().trim()%>" >
              <a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Numero Referencia :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAREF" size="12" maxlength="12" value="<%= lnBasic.getE01DEAREF().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Ciclo de Revisi&oacute;n :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= lnBasic.getE01DEARRP().trim()%>" onblur="rightAlignCharNumber()">
               <a href="javascript:GetCode('E01DEARRP','STATIC_cycle_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Fecha de Revisi&oacute;n :</div>
            </td>
            <td nowrap width="27%" > 
  				<eibsinput:date name="lnBasic" fn_year="E01DEARRY" fn_month="E01DEARRM" fn_day="E01DEARRD" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Impuesto/ITBMS. : </div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAWHF" size="2" maxlength="1" value="<%= lnBasic.getE01DEAWHF().trim()%>">
              <a href="javascript:GetCode('E01DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= lnBasic.getE01DEACCN().trim()%>">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Pr&eacute;stamo a Demanda :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="hidden" name="E01DEALNC" value="<%= lnBasic.getE01DEALNC()%>">
              <input type="radio" name="CE01DEALNC" value="Y" onClick="document.forms[0].E01DEALNC.value='Y'"
			  <%if(lnBasic.getE01DEALNC().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01DEALNC" value="N" onClick="document.forms[0].E01DEALNC.value='N'"
			  <%if(lnBasic.getE01DEALNC().equals("N")) out.print("checked");%>>
              No </td>
            <td nowrap width="25%" > 
              <div align="right">Direcci&oacute;n  Correo :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMLA().trim()%>">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0"></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tipo de Cambio :</div>
            </td>
            <td nowrap width="23%" > 
				<input type="text" name="E01DEAEXR" size="13" maxlength="12" value="<%= lnBasic.getE01DEAEXR().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Clase de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACLF" size="2" maxlength="1" value="<%= lnBasic.getE01DEACLF().trim()%>">
              <a href="javascript:GetClassCred('E01DEACLF','STATIC_ln_cred_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Comisionista :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEABRK" size="4" maxlength="3" value="<%= lnBasic.getE01DEABRK().trim()%>">
              <a href="javascript:GetBroker('E01DEABRK')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa Comisionista :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEABCP" size="10" maxlength="9" value="<%= lnBasic.getE01DEABCP().trim()%>"  >
              <a href="javascript:showLimits(document.forms[0].E01DEABNK.value,document.forms[0].E01DEAPRO.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">        		          
            <td nowrap width="25%" > 
              <div align="right">C&oacute;digo de Obligaci&oacute;n :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAOBL" size="3" maxlength="2" value="<%= lnBasic.getE01DEAOBL().trim()%>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">C&oacute;digo de Riesgo :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEARRC" size="3" maxlength="2" value="<%= lnBasic.getE01DEARRC().trim()%>">
            </td>		 
          </tr>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">        		          
            <td nowrap width="25%" >
              <div align="right">Clave de Descuento :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEACUI" size="8" maxlength="6" value="<%= lnBasic.getE01DEACUI().trim()%>">
              <a href="javascript:GetCodeDescCNOFC('E01DEACUI','','4D')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>		 
            <td align=right nowrap>
            </td>
            <td nowrap>
            </td>

          </tr>                    

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= lnBasic.getE01DEAICT().trim()%>">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a></td>
            <td nowrap width="25%" > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEABAS" size="4" maxlength="3" value="<%= lnBasic.getE01DEABAS().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">C&aacute;lculo  Int./Normal :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAIFL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAIFL().trim()%>">
              <a href="javascript:lnGetOver('E01DEAIFL','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">C&aacute;lculo  Int./Mora :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAPCL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPCL().trim()%>" >
              <a href="javascript:lnGetOver('E01DEAPCL','STATIC_ln_mor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a></td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tabla Cargos :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEATLN" size="3" maxlength="2" value="<%= lnBasic.getE01DEATLN().trim()%>">
              <a href="javascript:GetLoanTable('E01DEATLN',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAGPD" size="3" maxlength="2" value="<%= lnBasic.getE01DEAGPD().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tabla Tasas :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARTB" size="3" maxlength="2" value="<%= lnBasic.getE01DEARTB().trim() %>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0"></a> 
            </td>
          
           
          
           <%  if (currUser.getE01INT().trim().equals("07")) {%>
            <td nowrap width="25%" > 
              <div align="right">Condici&oacute;n  Cr&eacute;dito :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEADLC" size="2" maxlength="1" value="<%= lnBasic.getE01DEADLC().trim()%>">
              <a href="javascript:GetCodeCNOFC('E01DEADLC','S0')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>  
               <% } else {%> 
                <%  if (currUser.getE01INT().trim().equals("18")) {%>
                  <td nowrap width="25%" > 
                    <div align="right">Condici&oacute;n  Cr&eacute;dito :</div>
                  </td>
                  <td width="27%" > 
                    <select name="E01DEADLC">
                      <option value=" " <% if (!(lnBasic.getE01DEADLC().equals("1") ||lnBasic.getE01DEADLC().equals("2")||lnBasic.getE01DEADLC().equals("3")||lnBasic.getE01DEADLC().equals("4"))) out.print("selected"); %>></option>
                      <option value="1" <% if (lnBasic.getE01DEADLC().equals("1")) out.print("selected"); %>>Vigente</option>
                      <option value="2" <% if (lnBasic.getE01DEADLC().equals("2")) out.print("selected"); %>>Vencido</option>
                      <option value="3" <% if (lnBasic.getE01DEADLC().equals("3")) out.print("selected"); %>>Castigado</option>
                      <option value="4" <% if (lnBasic.getE01DEADLC().equals("4")) out.print("selected"); %>>Castigado N/Inf</option>
                    </select>
                  </td> 
                
                <% } else {%> 
                  <td nowrap width="25%" > 
                    <div align="right">Condici&oacute;n  Cr&eacute;dito :</div>
                  </td>
                  <td width="27%" > 
                    <select name="E01DEADLC">
                      <option value=" " <% if (!(lnBasic.getE01DEADLC().equals("1")||lnBasic.getE01DEADLC().equals("2")||lnBasic.getE01DEADLC().equals("3")||lnBasic.getE01DEADLC().equals("4")||lnBasic.getE01DEADLC().equals("5")||lnBasic.getE01DEADLC().equals("6")||lnBasic.getE01DEADLC().equals("7"))) out.print("selected"); %>></option>
                      <option value="1" <% if (lnBasic.getE01DEADLC().equals("1")) out.print("selected"); %>>Vigente</option>
                      <option value="2" <% if (lnBasic.getE01DEADLC().equals("2")) out.print("selected"); %>>Vencido</option>
                      <option value="3" <% if (lnBasic.getE01DEADLC().equals("3")) out.print("selected"); %>>Castigado</option>
                      <option value="4" <% if (lnBasic.getE01DEADLC().equals("4")) out.print("selected"); %>>Castigado N/Inf</option>
                      <option value="5" <% if (lnBasic.getE01DEADLC().equals("5")) out.print("selected"); %>>Acelerado</option>
                      <option value="6" <% if (lnBasic.getE01DEADLC().equals("6")) out.print("selected"); %>>Vencido Anticipado</option>
                      <option value="7" <% if (lnBasic.getE01DEADLC().equals("7")) out.print("selected"); %>>Ejecución Prejudicial</option>
                    </select>
                  </td>
                <% }%>   
          
             <% }%>   
            </tr>       

           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tipo de Relacion 1 :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAPAR" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPAR().trim()%>">
              <a href="javascript:GetRel1('E01DEAPAR','STATIC_ln_rel1.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Cuenta  Relacion 1 :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAPAC" size="12" maxlength="12" value="<%= lnBasic.getE01DEAPAC().trim()%>">
              <a href="javascript:GetAccount('E01DEAPAC',document.forms[0].E01DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" >
              <div align="right">Tipo de Relacion 2 :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01DEARET" size="2" maxlength="1" value="<%= lnBasic.getE01DEARET().trim()%>">
              <a href="javascript:GetRel2('E01DEARET','STATIC_ln_rel2.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a></td>
            <td nowrap width="25%" >
              <div align="right">Cuenta  Relacion 2 :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01DEAREA" size="12" maxlength="12" value="<%= lnBasic.getE01DEAREA().trim()%>">
              <a href="javascript:GetAccount('E01DEAREA',document.forms[0].E01DEABNK.value,'10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a></td>
          </tr>    
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" >
              <div align="right">Fecha Reestruc/Refinanc :</div>
            </td>
            <td nowrap width="23%" >
  				<eibsinput:date name="lnBasic" fn_year="E01DEAEXY" fn_month="E01DEAEXM" fn_day="E01DEAEXD" />
			</td>
 			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td width="25%"> 
	              <div align="right">Cobro del FECI :</div>
	            </td>
	            <td width="30%"> 
	              <input type="radio" name="E01DEATX2" value="F"  <%if (lnBasic.getE01DEATX2().equals("F")) out.print("checked"); %>>
	              Si 
	              <input type="radio" name="E01DEATX2" value="N"  <%if (!lnBasic.getE01DEATX2().equals("F")) out.print("checked"); %>>
	              No
	            </td>
			  <% } else { %>
	            <td nowrap width="25%" >
	              <div align="right"> </div>
	            </td>
	            <td nowrap width="27%" >
	              <div align="right"> </div>
				</td>
			  <% } %>
          </tr>                
        </table>
      </td>
    </tr>
  </table>
<% } else {%>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="23%"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEATRM" size="5" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>">
              <select name="E01DEATRC">
                <option value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="23%"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" required="true"/>
            </td>
            <td nowrap width="25%" > 
                 <div align="right">Tasa Interes/Spread :</div>
			</td>
              <td nowrap width="27%" > 
                    <input type="text" name="E01DEARTE" size="12" maxlength="10"
								value="<%= lnBasic.getE01DEARTE().trim()%>"
								onKeypress="enterRate(event)"
								<% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %>><img
								src="<%=request.getContextPath()%>/images/Check.gif"
								title="campo obligatorio" align="bottom" border="0">
			 </td>
           </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" >
            	<div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap width="23%" ><input type="text" name="E01DEAREF" size="12" maxlength="12" value="<%= lnBasic.getE01DEAREF().trim()%>"></td>
            <td nowrap width="25%" ><div align="right">Centro de Costo :</div></td>
            <td nowrap width="27%" ><input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= lnBasic.getE01DEACCN().trim()%>">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" ><div align="right">Direcci&oacute;n de Correos :</div></td>
            <td nowrap width="23%" ><input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMLA().trim()%>">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0"></a>
             </td>              
             <% if (!lnBasic.getH01FLGMAS().trim().equals("N")) {%>
            <td nowrap width="25%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEAOAM" size="17" maxlength="15" value="<%= lnBasic.getE01DEAOAM().trim()%>" onKeypress="enterDecimal(event)">
            </td>
            <% }%>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" ><div align="right">C&oacute;digo de Obligaci&oacute;n :</div></td>
            <td nowrap width="23%" ><input type="text" name="E01DEAOBL" size="3" maxlength="2" value="<%= lnBasic.getE01DEAOBL().trim()%>"></td>
            <td nowrap width="25%" > 
              <div align="right">C&oacute;digo de Riesgo :</div>            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEARRC" size="3" maxlength="2" value="<%= lnBasic.getE01DEARRC().trim()%>">
            </td>
          </tr>
          
          
        </table>
      </td>
    </tr>
  </table>

<% } %>
<%if ( genFlag.equals("U") == false ) {%>
  <%if (userPO.getPurpose().equals("MAINTENANCE")){%> 
  <h4>Prioridad de Pagos </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP1" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP1().trim()%>">
              </div>
            </td>
            <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP2" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP2().trim()%>">
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP3" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP3().trim()%>">
              </div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="14%"  > 
	              <div align="center"> 
	                <input type="text" name="E01DEAPP7" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP7().trim()%>">
	              </div>
	            </td>
			  <% } %>
			 <%if(currUser.getE01INT().equals("18")){%> 
	            <td nowrap width="14%"  > 
	              <div align="center"> 
	                <input type="text" name="E01DEAPP7" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP7().trim()%>">
	              </div>
	            </td>
			  <% } %>
            <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP4" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP4().trim()%>">
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP5" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP5().trim()%>">
              </div>
            </td>
            <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP6" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP6().trim()%>">
              </div>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="14%" > 
              <div align="center">Principal</div>
            </td>
            <td nowrap width="14%" > 
              <div align="center">Intereses</div>
            </td>
            <td nowrap width="14%" > 
              <div align="center">Mora</div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="14%" > 
	              <div align="center">FECI</div>
	            </td>
			  <% } %>
			 <%if(currUser.getE01INT().equals("18")){%> 
	            <td nowrap width="14%" > 
	              <div align="center">Reajuste</div>
	            </td>
			  <% } %>
            <td nowrap width="14%" > 
              <div align="center">Comisiones</div>
            </td>
            <td nowrap width="14%" > 
              <div align="center">Impuestos</div>
            </td>
            <td nowrap width="14%" > 
              <div align="center">Deducciones</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  
  <%if (userPO.getPurpose().equals("MAINTENANCE")){%> 
  <table class="tbenter">
    <tr > 
      <td nowrap>
       <B>Lista de Deducciones</B>
      </td>
      <td nowrap align=center class=tdbkg>
       <a onClick="setRecalculate()" href="javascript:getNewDeduct('<%= lnBasic.getE01DEAACC().trim() %>')">Nueva Deduccion</a>
      </td>
    </tr>
  </table> 
  
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table  id="TBDEDUCT" cellpadding=2 cellspacing=0 width="100%" border="0">
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="20%" > 
              <div align="center">C&oacute;digo</div>
            </td>
            <td nowrap width="30%" > 
              <div align="center">Compa&ntilde;&iacute;a</div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">P&oacute;liza N&uacute;mero</div>
            </td>
            <td nowrap width="20%" > 
              <div align="center">Deducci&oacute;n</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center">Factor</div>
            </td>
          </tr>
          <% if (!ded.getNoResult()) {
                ded.initRow();
                while (ded.getNextRow()) {
                    if (ded.getFlag().equals("")) {
                    		//out.println(list.getRecord());
	      %> 
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">      
            <td nowrap width="20%" > 
              <div align="center"><a onClick="setRecalculate()" href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(4) %></a></div>
            </td>
            <td nowrap width="30%" > 
              <div align="center"><a onClick="setRecalculate()" href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(10) %></a></div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"><a onClick="setRecalculate()" href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(16) %></a></div>
            </td>
            <td nowrap width="20%" > 
              <div align="center"><a onClick="setRecalculate()" href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(5) %></a></div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"><a onClick="setRecalculate()" href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%= ded.getRecord(6) %></a></div>
            </td>
          </tr>
          <%
                    }
                }
   		  } else {  %>         
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td colspan=5>
              <h5 align="center">No existen Deducciones asignadas</h5>
            </td>
         </tr>
       <%  }   %>
       </table>
        </td>
        </tr>
  </table>
  <%  }   %> 
  
  <h4>Condiciones de Pago<% if(DEAIPD.equals("MAT") && DEAPPD.equals("MAT")) { %> 
  </h4>
  <h5 align="center">Pagar el Inter&eacute;s y el Capital al Vencimiento (MAT) </h5>
  <%}%> <% if(isDEAIPDNum && DEAPPD.equals("MAT")){ %> 
  <h5 align="center">Pagar el Capital al Vencimiento y el Inter&eacute;s seg&uacute;n 
    su Ciclo</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%"> <input type="text" size="4" maxlength="3" name="E01DEAIPD" value="<%= lnBasic.getE01DEAIPD().trim()%>"> </td>
            <td nowrap width="22%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEARDY" fn_month="E01DEARDM" fn_day="E01DEARDD" required="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap width="15%"><input type="text" name="E01DEAPPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPPD().trim()%>"> </td>
            <td nowrap width="22%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
   <h5>Pagos Irregulares <a href="javascript:showIrregPayMaint()">
  <img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Pagos Irregulares" align="middle" border="0" ></a></h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center">Cuota No. </div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center">Principal</div>
                  </td>
                </tr>
                <%
                pmntPlus.initRow();
                while (pmntPlus.getNextRow()) {
                    if (pmntPlus.getFlag().equals("")) {
	      %> 
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(0) %></div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(1) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %> 
              </table>
            </td>
          </tr>
        </table>

        <p align="center">&nbsp;</p>
        
      </td>
    </tr>
  </table>  
  <%}%>
  <% if(isDEAIPDNum && isDEAPPDNum){ %>
  <h5 align="center">Pagar el Inter&eacute;s y el Capital seg&uacute;n sus ciclos</h5>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%"><input type="text" name="E01DEAIPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAIPD().trim()%>"> </td>
            <td nowrap width="22%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEARDY" fn_month="E01DEARDM" fn_day="E01DEARDD" required="true"/>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap width="15%"><input type="text" name="E01DEAPPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPPD().trim()%>"> </td>
            <td nowrap width="22%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2"> 
   				<eibsinput:date name="lnBasic" fn_year="E01DEAHEY" fn_month="E01DEAHEM" fn_day="E01DEAHED" required="true"/>
            </td>
          </tr>
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="E01DEAROA"  class="txtright" size="20" maxlength="19" value="<%= lnBasic.getE01DEAROA().trim()%>" onKeypress="enterDecimal(event)">
            </td>
            <td nowrap width="22%" >
              <div align="right">Incluye Intereses Pago :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="hidden" name="E01DEAIIP" value="<%= lnBasic.getE01DEAIIP()%>">
              <input type="radio" name="CE01DEAIIP" value="Y" onClick="document.forms[0].E01DEAIIP.value='Y'"
			  <%if(lnBasic.getE01DEAIIP().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01DEAIIP" value="N" onClick="document.forms[0].E01DEAIIP.value='N'"
			  <%if(lnBasic.getE01DEAIIP().equals("N")) out.print("checked");%>>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  ></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <h5>Pagos Irregulares <a href="javascript:showIrregPayMaint()">
  <img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Pagos Irregulares" align="middle" border="0" ></a></h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center">Cuota No. </div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center">Principal</div>
                  </td>
                </tr>
                <%
                pmntPlus.initRow();
                while (pmntPlus.getNextRow()) {
                    if (pmntPlus.getFlag().equals("")) {
	      %> 
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(0) %></div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(1) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %> 
              </table>
            </td>
          </tr>
        </table>

        <p align="center">&nbsp;</p>
        
      </td>
    </tr>
  </table>  
  <%}%>
  
    <% if(DEAIPD.equals("SC3") && DEAPPD.equals("SC3")){ %>
  <h5 align="center">Cuotas Niveladas (SC3)</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Total de Cuotas :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="VALNC01"  class="txtright" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onBlur="document.forms[0].E01DLCNC1.value = document.forms[0].VALNC01.value">
            </td>
            <td nowrap width="22%"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="FRCFP01" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onBlur="document.forms[0].E01DLCFP1.value = document.forms[0].FRCFP01.value">
              <select name="FRCTP01" onBlur="document.forms[0].E01DLCTP1.value = document.forms[0].FRCTP01.value">
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Intereses Prepagados Hasta :</div>
            </td>
            <td nowrap width="15%" >
  				<eibsinput:date name="lnBasic" fn_year="E01DEAPY1" fn_month="E01DLCPM1" fn_day="E01DLCPD1" />
            </td>
            <td nowrap width="22%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap colspan="2" > 
  				<eibsinput:date name="lnBasic" fn_year="E01DLCGY1" fn_month="E01DLCGM1" fn_day="E01DLCGD1" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Primera Fecha de Pago : </div>
            </td>
            <td nowrap width="15%" >
  				<eibsinput:date name="lnBasic" fn_year="E01DLCXY1" fn_month="E01DLCXM1" fn_day="E01DLCXD1" />
            </td>
            <td nowrap width="22%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="VALVA01"  class="txtright" size="14" maxlength="13" value="<%= lnBasic.getE01DLCVA1().trim()%>" onBlur="document.forms[0].E01DLCVA1.value = document.forms[0].VALVA01.value">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Mes de NO Pago :</div>
            </td>
            <td nowrap width="15%" >
                <input type="text" name="E01DLCMN1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCMN1().trim()%>">              
            </td>
            <td nowrap width="22%" >
                 
            </td>
            <td nowrap colspan="2" > 
                         
            </td>
          </TR>             
        </table>
      </td>
    </tr>
  </table>
    <h5>Pagos Irregulares <a href="javascript:showIrregPayMaint()">
  <img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Pagos Irregulares" align="middle" border="0" ></a></h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center">Cuota No. </div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center">Principal</div>
                  </td>
                </tr>
                <%
                pmntPlus.initRow();
                while (pmntPlus.getNextRow()) {
                    if (pmntPlus.getFlag().equals("")) {
	      %> 
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(0) %></div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(1) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %> 
              </table>
            </td>
          </tr>
        </table>

        <p align="center">&nbsp;</p>
        
      </td>
    </tr>
  </table>  
  <%}%>
  
  
  <% if(DEAIPD.equals("SC1") && DEAPPD.equals("SC1")){ %>
  <h5 align="center">Cuotas Niveladas (SC1)</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Total de Cuotas :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="VALNC01" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onBlur="document.forms[0].E01DLCNC1.value = document.forms[0].VALNC01.value">
            </td>
            <td nowrap width="22%"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="FRCFP01" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onBlur="document.forms[0].E01DLCFP1.value = document.forms[0].FRCFP01.value">
              <select name="FRCTP01" onblur="document.forms[0].E01DLCTP1.value = document.forms[0].FRCTP01.value">
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Intereses Prepagados Hasta :</div>
            </td>
            <td nowrap width="15%" >
   				<eibsinput:date name="lnBasic" fn_year="E01DLCPY1" fn_month="E01DLCPM1" fn_day="E01DLCPD1" />
            </td>
            <td nowrap width="22%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap colspan="2" > 
   				<eibsinput:date name="lnBasic" fn_year="E01DLCGY1" fn_month="E01DLCGM1" fn_day="E01DLCGD1" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Primera Fecha de Pago : </div>
            </td>
            <td nowrap width="15%" >
   				<eibsinput:date name="lnBasic" fn_year="E01DLCXY1" fn_month="E01DLCXM1" fn_day="E01DLCXD1" />
            </td>
            <td nowrap width="22%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="VALVA01"  class="txtright"  size="14" maxlength="13" value="<%= lnBasic.getE01DLCVA1().trim()%>" onBlur="document.forms[0].E01DLCVA1.value = document.forms[0].VALVA01.value">
            </td>
          </tr>
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Mes de NO Pago :</div>
            </td>
            <td nowrap width="15%" >
                <input type="text" name="E01DLCMN1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCMN1().trim()%>" onKeypress="enterInteger(event)">              
            </td>
            <td nowrap width="22%" >
                 
            </td>
            <td nowrap colspan="2" > 
                         
            </td>
          </TR>  
        </table>
      </td>
    </tr>
  </table>
  <h5>Pagos Irregulares <a href="javascript:showIrregPayMaint()">
  <img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Pagos Irregulares" align="middle" border="0" ></a></h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
                  <td nowrap width="25%"> 
                    <div align="center">Cuota No. </div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center">Principal</div>
                  </td>
                </tr>
                <%
                pmntPlus.initRow();
                while (pmntPlus.getNextRow()) {
                    if (pmntPlus.getFlag().equals("")) {
	      %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(0) %></div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(1) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %> 
              </table>
            </td>
          </tr>
        </table>

        <p align="center">&nbsp;</p>
        
      </td>
    </tr>
  </table>  
  <%}%>
  <% if(DEAIPD.equals("SC2") && DEAPPD.equals("SC2")){ %>
  <h5 align="center"> Doble Esquema de Pago (SC2)</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
     <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%"><b>Plan 1</b></td>
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="22%">&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Porcentaje Capital :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E01DLCOR1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCOR1().trim()%>">
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Valor Capital :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E01DLCPP1" size="14" maxlength="13" value="<%= lnBasic.getE01DLCPP1().trim()%>" onKeypress="enterDecimal(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">N&uacute;mero de Cuotas :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="VALNC11" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onBlur="document.forms[0].E01DLCNC1.value = document.forms[0].VALNC11.value">
            </td>
            <td nowrap width="22%" height="31"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2" height="31"> 
              <input type="text" name="FRCFP11" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onBlur="document.forms[0].E01DLCFP1.value = document.forms[0].FRCFP11.value">
              <select name="FRCTP11" onBlur="document.forms[0].E01DLCTP1.value = document.forms[0].FRCTP11.value">
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="VALVA11"  class="txtright" size="14" maxlength="13" value="<%= lnBasic.getE01DLCVA1().trim()%>" onblur="document.forms[0].E01DLCVA1.value = document.forms[0].VAlVA11.value">
            </td>
            <td nowrap width="22%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" >&nbsp; </td>
            <td nowrap width="22%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" ><b>Plan 2</b></td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Porcentaje Capital :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E01DLCOR2" size="4" maxlength="3" value="<%= lnBasic.getE01DLCOR2().trim()%>" onKeypress="enterDecimal(event)">
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Valor Capital :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E01DLCPP2" size="14" maxlength="13" value="<%= lnBasic.getE01DLCPP2().trim()%>" onKeypress="enterDecimal(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">N&uacute;mero de Cuotas :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="E01DLCNC2" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC2().trim()%>">
            </td>
            <td nowrap width="22%" > 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01DLCFP2" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP2().trim()%>">
              <select name="E01DLCTP2">
                <option value=" " <% if (!(lnBasic.getE01DLCTP2().equals("D") ||lnBasic.getE01DLCTP2().equals("M")||lnBasic.getE01DLCTP2().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP2().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP2().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP2().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="E01DLCVA2"   size="14" maxlength="13"  class="txtright"  value="<%= lnBasic.getE01DLCVA2().trim()%>" onKeypress="enterDecimal(event)">
            </td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
    <h5>Pagos Irregulares <a href="javascript:showIrregPayMaint()">
  <img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Pagos Irregulares" align="middle" border="0" ></a></h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center">Cuota No. </div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center">Principal</div>
                  </td>
                </tr>
                <%
                pmntPlus.initRow();
                while (pmntPlus.getNextRow()) {
                    if (pmntPlus.getFlag().equals("")) {
	      %> 
                <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(0) %></div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmntPlus.getRecord(1) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %> 
              </table>
            </td>
          </tr>
        </table>

        <p align="center">&nbsp;</p>
        
      </td>
    </tr>
  </table>  
  <%}%> <% if(DEAIPD.equals("SCH") && DEAPPD.equals("SCH")){ %> 
  <h5>Plan de Pagos <a href="javascript:showPayMaint()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Plan de Pagos" align="middle" border="0" ></a></h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%"> <%= lnBasic.getE01DEAIPD().trim()%> </td>
            <td nowrap width="22%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap colspan="2"><%= lnBasic.getE01DEAPPD().trim()%> </td>
          </tr>
        </table>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center">Cuota No. </div>
                  </td>
                  <td nowrap width="23%"> 
                    <div align="center">Fecha</div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center">Principal</div>
                  </td>
                  <td nowrap width="27%"> 
                    <div align="center">Intereses</div>
                  </td>
                  <td nowrap width="27%">
                    <div align="center">Intereses Incluidos en Pago </div>
                  </td>
                </tr>
                <%
                pmnt.initRow();
                while (pmnt.getNextRow()) {
                    if (pmnt.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmnt.getRecord(0) %></div>
                  </td>
                  <td nowrap width="23%"> 
                    <div align="center"><%= Util.formatDate(pmnt.getRecord(1),pmnt.getRecord(2),pmnt.getRecord(3))%></div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmnt.getRecord(4) %></div>
                  </td>
                  <td nowrap width="27%"> 
                    <div align="center"><%= pmnt.getRecord(5) %></div>
                  </td>
                  <td nowrap width="27%">
                    <div align="center"><% if(pmnt.getRecord(6).equals("Y")) out.print("Sí");
					else if(pmnt.getRecord(6).equals("N")) out.print("No");
				    else out.print("Sí"); %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %> 
              </table>
            </td>
          </tr>
        </table>

        <p align="center">&nbsp;</p>
        
      </td>
    </tr>
  </table>
  <%}%>
  <% if(isDEAIPDNum && DEAPPD.equals("SCH")){ %>
  <h5 align="center">Pagar el Inter&eacute;s seg&uacute;n Ciclo Preestablecido 
    y el Capital seg&uacute;n Plan de Pagos Irregular</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%"><input type="text" name="E01DEAIPD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAIPD().trim()%>"> </td>
            <td nowrap width="22%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap colspan="2"><%= lnBasic.getE01DEAPPD().trim()%> </td>
          </tr>
        </table>
        <p><b>Intereses</b></p>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap width="67%"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEARDY" fn_month="E01DEARDM" fn_day="E01DEARDD" />
            </td>
          </tr>
        </table>
        <p><b>Capital </b><a href="javascript:showPayMaint()"><img src="<%=request.getContextPath()%>/images/eibs_deducciones.gif" title="Plan de Pagos" align="middle" border="0" ></a></p>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center">Cuota No. </div>
                  </td>
                  <td nowrap width="23%"> 
                    <div align="center">Fecha</div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center">Principal</div>
                  </td>
                </tr>
                <%
                pmnt.initRow();
                while (pmnt.getNextRow()) {
                    if (pmnt.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmnt.getRecord(0) %></div>
                  </td>
                  <td nowrap width="23%"> 
                    <div align="center"><%= Util.formatDate(pmnt.getRecord(1),pmnt.getRecord(2),pmnt.getRecord(3))%></div>
                  </td>
                  <td nowrap width="25%"> 
                    <div align="center"><%= pmnt.getRecord(4) %></div>
                  </td>
                </tr>
                <%
                    }
                }
    %> 
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
<% } %>
  <h4>Cuenta a Debitar</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="28%" align="right"> Autoriza Sobregiro : 
            </td>
            <td nowrap width="10%" > 
              <div align="left">
              <input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%= lnBasic.getE01DEAODA().trim()%>">
              <a href="javascript:lnGetOver('E01DEAODA','STATIC_ln_over.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
               </div>
            </td>
            <td nowrap width="10%" > 
               <div align="right">Autoriza Pagos en Feriados : </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
                <input type="hidden" name="E01DEAHFQ" value="<%= lnBasic.getE01DEAHFQ()%>">
                <input type="radio" name="CE01DEAHFQ" value="1" onClick="document.forms[0].E01DEAHFQ.value='1'"
			  <%if(lnBasic.getE01DEAHFQ().equals("1")) out.print("checked");%> />
                S&iacute; 
                <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.forms[0].E01DEAHFQ.value='2'"
			  <%if(lnBasic.getE01DEAHFQ().equals("2")) out.print("checked");%> />
                No </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="28%" align="right"> Medio de Pago : 
            </td>
            <td nowrap width="10%" > 
              <div align="left">
               <select name="E01DEAPVI" >
                    <option value=" " <% if (lnBasic.getE01DEAPVI().equals(" ")) out.print("selected"); %>>Caja</option>
                    <option value="1" <% if (lnBasic.getE01DEAPVI().equals("1")) out.print("selected"); %>>Automatico </option>                   
                    <option value="2" <% if (lnBasic.getE01DEAPVI().equals("2")) out.print("selected"); %>>Convenio</option>                   
                  </select>
               </div>
            </td>
            <td nowrap width="10%" > 
               <div align="right">Codigo de Convenio : </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
                <input type="text" name="E01DEACNV" size="5" maxlength="4" value="<%= lnBasic.getE01DEACNV().trim()%>" readonly>
 			  </div>
             </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="28%"> 
              <div align="center">Concepto</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">Banco </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">Sucursal</div>
            </td>
            <td nowrap> 
              <div align="center">Moneda </div>
            </td>
            <td nowrap> 
              <div align="center">Cuenta Cliente</div>
            </td>
            <td nowrap> 
              <div align="center">Titular</div>
            </td>
            <td nowrap> 
            </td>
          </tr>

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="28%" > 
              <div align="center" > 
                <input type="text" name="E01PAGOPE" id="E01PAGOPE" value="<%= lnBasic.getE01PAGOPE().trim()%>" size="3" maxlength="3">
                <input type="hidden" name="E01PAGGLN" id="E01PAGGLN" value="<%= lnBasic.getE01PAGGLN().trim()%>">
                <input type="text" name="E01PAGCON" id="E01PAGCON" size="45" maxlength="45" readonly value="<%= lnBasic.getE01PAGCON().trim()%>" 
                	class="context-menu-help"
					onmousedown="init(conceptHelp,this.name,document.getElementById('E01DEABNK').value, document.forms[0].E01PAGCCY.value,'E01PAGGLN','E01PAGOPE','10')">
				</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBNK" id="E01PAGBNK" size="2" maxlength="2" value="<%= lnBasic.getE01PAGBNK().trim()%>">
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBRN" id="E01PAGBRN" size="4" maxlength="4" value="<%= lnBasic.getE01PAGBRN().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(branchHelp,this.name,document.getElementById('E01PAGBNK').value,'','','','')"> 
               </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <input type="text" name="E01PAGCCY" id="E01PAGCCY" size="3" maxlength="3" value="<%= lnBasic.getE01PAGCCY().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(currencyHelp,this.name,document.getElementById('E01PAGBNK').value,'','','','')">
              </div>
	      </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01PAGACC" id="E01PAGACC" size="12" maxlength="12"  value="<%= lnBasic.getE01PAGACC().trim()%>" 
                class="context-menu-help"
                onmousedown="init(accountCustomerHelp,this.name,document.getElementById('E01PAGBNK').value,'',document.getElementById('E01DEACUN').value,'','RT')">
              </div>
			</td>
			<td nowrap width="28%" > 
              <div align="center"> 
                <input type="text" readonly name="E01PAGNA1" id="E01PAGNA1" size="25" maxlength="25" value="<%= lnBasic.getE01PAGNA1().trim()%>">
              </div>
            </td>
          </tr>
           
        </table>
      </td>
    </tr>
  </table>

  <h4><%if (lnBasic.getE01FLGIBF().equals("R")) {  %> Préstamo Preferencial - Información Adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">N&uacute;mero de Finca :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01FIXMOD" size="17" maxlength="15" value="<%= lnBasic.getE01FIXMOD().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Registro Forestal :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01FIXRMK" size="27" maxlength="25" value="<%= lnBasic.getE01FIXRMK().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Provincia :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" readonly name="E01FIXMTH" size="4" maxlength="2" value="<%= lnBasic.getE01FIXMTH().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01FIXMTH','PV')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"  ></a>
			</td>
            <td nowrap width="25%"> 
              <div align="right">Corregimiento :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly name="E01FIXCLS" size="5" maxlength="4" value="<%= lnBasic.getE01FIXCLS().trim()%>">
                <a href="javascript:GetCodeCNOFC('E01FIXCLS','PE')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"  ></a>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Fecha Final Tramo Preferencial :</div>
            </td>
            <td nowrap width="23%">
  				<eibsinput:date name="lnBasic" fn_year="E01DEAPSY" fn_month="E01DEAPSM" fn_day="E01DEAPSD" />

            </td>
            <td nowrap width="25%"> 
              <div align="right">Valor del Terreno :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01FIXPPR" size="17" maxlength="15" value="<%= lnBasic.getE01FIXPPR().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha Inscripción Reg.Público :</div>
            </td>
            <td nowrap width="23%">
  				<eibsinput:date name="lnBasic" fn_year="E01FIXASN" fn_month="E01FIXCCN" fn_day="E01FIXPIN" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Valor Mejoras :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DLAIMP" size="17" maxlength="15" value="<%= lnBasic.getE01DLAIMP().trim()%>">
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="23%">
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Valor Total :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01FIXRVA" size="17" maxlength="15" value="<%= lnBasic.getE01FIXRVA().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Datos Préstamos Modificados :</div>
            </td>
            <td nowrap width="23%">
              <div align="right"> </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"> </div>
            </td>
            <td nowrap width="27%"> 
              <div align="right"> </div>
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">RUC Acreedor Anterior :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01FIXMAR" size="22" maxlength="20" value="<%= lnBasic.getE01FIXMAR().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Número Préstamo Anterior :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01FIXSER" size="17" maxlength="15" value="<%= lnBasic.getE01FIXSER().trim()%>">
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <%}%>


  <h4><% if(E01DEACLF.equals("A")) { %>Activos Fijos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">N&uacute;mero del Activo :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01FIXASN" size="9" maxlength="9" value="<%= lnBasic.getE01FIXASN().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" name="E01FIXGLN" size="16" maxlength="16" value="<%= lnBasic.getE01FIXGLN().trim()%>" onKeypress="enterInteger(event)">
              <a href="javascript:GetLedger('E01FIXGLN',document.forms[0].E01DEABNK.value,document.forms[0].E01DEACCY.value,'')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Marca del Activo :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01FIXMAR" size="20" maxlength="20" value="<%= lnBasic.getE01FIXMAR().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01FIXCCN" size="8" maxlength="8" value="<%= lnBasic.getE01FIXCCN().trim()%>">
              <a href="javascript:GetCostCenter('E01FIXCCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Centros de Costo" align="middle" border="0" ></a> 
            </td>
          </tr>
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Modelo del Activo :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXMOD" size="15" maxlength="15" value="<%= lnBasic.getE01FIXMOD().trim()%>" >
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXTIC" size="11" maxlength="11" value="<%= lnBasic.getE01FIXTIC().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Valor del Activo :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXPPR" size="15" maxlength="15" value="<%= lnBasic.getE01FIXPPR().trim()%>" >
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tipo de Depreciaci&oacute;n :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXDTY" size="2" maxlength="1" value="<%= lnBasic.getE01FIXDTY().trim()%>">
              <a href="javascript:GetDepTyp('E01FIXDTY','STATIC_ln_dep_typ.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">No. de Serie :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXSER" size="15" maxlength="15" value="<%= lnBasic.getE01FIXSER().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  align="bottom"> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Depreciaci&oacute;n :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXPRT" size="5" maxlength="4" value="<%= lnBasic.getE01FIXPRT().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Ubicaci&oacute;n :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXLOC" size="4" maxlength="3" value="<%= lnBasic.getE01FIXLOC().trim()%>">
              <a href="javascript:GetLoc('E01FIXLOC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero de Meses :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXMTH" size="4" maxlength="3" value="<%= lnBasic.getE01FIXMTH().trim()%>" onKeypress="enterInteger(event)">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" >
              <div align="right">Clase :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXCLS" size="5" maxlength="4" value="<%= lnBasic.getE01FIXCLS().trim()%>">
              <a href="javascript:GetAct('E01FIXCLS')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%" >
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXRMK" size="30" maxlength="25" value="<%= lnBasic.getE01FIXRMK().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Valor Residual :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXRVA" size="15" maxlength="15" value="<%= lnBasic.getE01FIXRVA().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero del Proveedor :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXPIN" size="10" maxlength="9" value="<%= lnBasic.getE01FIXPIN().trim()%>">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> <% if(E01FLGREF.equals("1")||E01FLGREF.equals("2") || E01FLGREF.equals("3")) { %> 
  <h4>Refinanciamiento<% if(E01FLGREF.equals("1")) { %> </h4>
  <h5 align="center">Refinanciamiento de Intereses</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Ciclo de Refinanciamiento :</div>
            </td>
            <td nowrap width="60%"> <%= lnBasic.getE01DEAXRC().trim()%> </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Fecha Pr&oacute;ximo Refinanciamiento :</div>
            </td>
            <td nowrap width="60%"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEAXRY" fn_month="E01DEAXRM" fn_day="E01DEAXRD" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%" > 
              <div align="right">Refinanciar hasta :</div>
            </td>
            <td nowrap width="60%" > 
  				<eibsinput:date name="lnBasic" fn_year="E01DEAPCY" fn_month="E01DEAPCM" fn_day="E01DEAPCD" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <% if(E01FLGREF.equals("2")) { %> 
  <h5 align="center">Refinanciamiento Parcial Cuota con Incremento al mismo Cr&eacute;dito</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto a Pagar :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="REFPAG01"  class="txtright" size="15" maxlength="15" value="<%= lnBasic.getE01REFPAG().trim()%>" onKeypress="enterDecimal(event)">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <% if(E01FLGREF.equals("3")) { %>
  <h5 align="center">Refinanciamiento Parcial Cuota con Incremento a otro Cr&eacute;dito</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">Monto a Pagar :</div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="REFPAG11"  class="txtright" size="17" maxlength="15" value="<%= lnBasic.getE01REFPAG().trim()%>" onKeypress="enterDecimal(event)">
            </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="40%"> 
              <div align="right">No. de Cr&eacute;dito para Aplicar Refinanciamiento 
                : </div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01REFACC" size="12" maxlength="12" value="<%= lnBasic.getE01REFACC().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  <%}%>
  <% if(E01FLGPAY.equals("Y")) { %>
  <h4>Proyecci&oacute;n de Cuota a Pagar</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">Monto Pago Final :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEABAP" size="15" maxlength="15" value="<%= lnBasic.getE01DEABAP().trim()%>" onKeypress="enterDecimal(event)">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha Pago Final :</div>
            </td>
            <td nowrap width="27%"> 
  				<eibsinput:date name="lnBasic" fn_year="E01DEABAY" fn_month="E01DEABAM" fn_day="E01DEABAD" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="right">% Incremento Pago :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEAPAP" size="10" maxlength="9" value="<%= lnBasic.getE01DEAPAP().trim()%>" onKeypress="enterDecimal(event)">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEA2TC" size="4" maxlength="1" value="<%= lnBasic.getE01DEA2TC().trim()%>">
              <a href="javascript:GetDepTyp('E01DEA2TC','STATIC_ln_fact_incre_cuota.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Ciclo Pr&oacute;ximo Incremento Pago : </div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAPCU" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPCU().trim()%>" onKeypress="enterInteger(event)">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="27%" > 
  				<eibsinput:date name="lnBasic" fn_year="E01DEALSY" fn_month="E01DEALSM" fn_day="E01DEALSD" />
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Abono a Capital :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLCABA" size="14" maxlength="13" value="<%= lnBasic.getE01DLCABA().trim()%>" onKeypress="enterDecimal(event)">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DLCABF" size="4" maxlength="1" value="<%= lnBasic.getE01DLCABF().trim()%>">
              <a href="javascript:GetDepTyp('E01DLCABF','STATIC_ln_fact_abo_cap.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Ciclo Pr&oacute;ximo Abono :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLCABC" size="4" maxlength="3" value="<%= lnBasic.getE01DLCABC().trim()%>" onKeypress="enterInteger(event)" >
            </td>
            <td nowrap width="25%" > 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="27%" > 
  				<eibsinput:date name="lnBasic" fn_year="E01DLCABY" fn_month="E01DLCABM" fn_day="E01DLCABD" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%> 
  
  <% if(datapro.eibs.master.JSEIBSProp.getShowCollateralList()) { %>
  <h4>Lista de Garant&iacute;as</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%"> 
              <div align="center">Garant&iacute;a No. </div>
            </td>
            <td nowrap width="23%"> 
              <div align="center">Tipo de Garant&iacute;a</div>
            </td>
            <td nowrap width="25%"> 
              <div align="center">Moneda</div>
            </td>
            <td nowrap width="27%"> 
              <div align="center">Monto </div>
            </td>
          </tr>
          <%
                coll.initRow();
                while (coll.getNextRow()) {
                    if (coll.getFlag().equals("")) {
                    		//out.println(coll.getRecord());
	      %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="center"><%= coll.getRecord(0) %></div>
            </td>
            <td nowrap width="23%"> 
              <div align="center"><%= coll.getRecord(1) %></div>
            </td>
            <td nowrap width="25%"> 
              <div align="center"><%= coll.getRecord(2) %></div>
            </td>
            <td nowrap width="27%"> 
              <div align="center"><%= Util.formatCCY(coll.getRecord(3)) %></div>
            </td>
          </tr>
          <%
                    }
                }
    %> 
        </table>
      </td>
    </tr>
  </table>
  <%}%> 

<% if (lnBasic.getH01FLGMAS().trim().equals("N")) {%>

<h4>Desembolso</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
		<% if (lnBasic.getE01FLGPRI().trim().equals("Y")) {%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><b>Monto Otorgado :</b></div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" class="txtright" name="E01DEAOAM" size="17" maxlength="15" value="<%= lnBasic.getE01DEAOAM().trim()%>" onKeypress="enterDecimal(event)" onchange="setRecalculate()">
            </td>
          </tr>
		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><b>Monto del Pr&eacute;stamo :</b></div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" class="txtright" name="E01TRNPRI" size="17" maxlength="15" value="<%= lnBasic.getE01TRNPRI().trim()%>" onKeypress="enterDecimal(event)" onchange="setRecalculate()">
            </td>
          </tr>
		  
		 <% } else {%>
		   <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><b>Monto Otorgado :</b></div>
            </td>
            <td nowrap colspan=2> 
              <input type="text" class="txtright" name="E01DEAOAM" size="17" maxlength="15" value="<%= lnBasic.getE01DEAOAM().trim()%>" onKeypress="enterDecimal(event)" onchange="setRecalculate()">
            </td>
          </tr>
       <% }%>

		 <%if (lnBasic.getE01FLGIBF().equals("Y")) {  %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
            <div align="right"><b>Desembolso Inicial :</b></div>
            </td>
            <td nowrap colspan=2> 
            <input type="text" class="txtright" name="E01DEAA01" size="17" maxlength="15" value="<%= lnBasic.getE01DEAA01().trim()%>" onKeyPress="enterDecimal(event)">
                 
            </td>
          </tr>

			<% } %>
          

		 <%if (lnBasic.getE01FLGIBF().equals("F")) {  %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
            <div align="right"><b>Valor Inmueble (IUSI) :</b></div>
            </td>
            <td nowrap colspan=2> 
            <input type="text" class="txtright" name="E01PARAVL" size="17" maxlength="15" value="<%= lnBasic.getE01PARAVL().trim()%>" onKeyPress="enterDecimal(event)">
                 
            </td>
          </tr>

			<% } %>
          

    
          <%if (lnBasic.getE01DEACLF().toUpperCase().equals("P")){%>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><b>Subsidio :</b></div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" class="txtright" name="E01DEAMPA" size="15" maxlength="15" value="<%= lnBasic.getE01DEAMPA().trim()%>" onKeypress="enterDecimal(event)" >
            </td>
          </tr>
          <%}%>
          <%
          if (!tax.getNoResult()){ %> <%
                tax.initRow();
                while (tax.getNextRow()) {
                    if (tax.getFlag().equals("")) {
	      %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><%= tax.getRecord(10) %> : </div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" name="E02DEDAMTT<%=tax.getCurrentRow()%>" size="15" maxlength="15" value="<%= tax.getRecord(2) %>" onKeypress="enterDecimal(event)">
            </td>
            <td nowrap> </td>
          </tr>
          <%
                    }
                }
           }
    	  %>
    	   <%
          if (!com.getNoResult()){ %> <%
                com.initRow();
                while (com.getNextRow()) {
                    if (com.getFlag().equals("")) {
	      %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap> 
              <div align="right"><%= com.getRecord(10) %> : </div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" name="E02DEDAMTC<%=com.getCurrentRow()%>" size="15" maxlength="15" value="<%= com.getRecord(2) %>" onKeypress="enterDecimal(event)">
              &nbsp;&nbsp;
              </td>
            
			 		<%
			     	if (com.getCurrentRow() == 0){
				    %> 
			        <td nowrap colspan="1"> 
			       		  Forma Pago Cargos :
			              <SELECT name="E01DEBCHF" onchange="checkDiv()">
                            <option value="1" <% if(lnBasic.getE01DEBCHF().equals("1")) out.print("selected");%>>Cargo a Desembolso</option>
			                <option value="2" <% if(lnBasic.getE01DEBCHF().equals("2")) out.print("selected");%>>Débito a Cuenta</option>
			                <option value="3" <% if(lnBasic.getE01DEBCHF().equals("3")) out.print("selected");%>>Capitalizar</option>
			              </SELECT>
						<BR/>
						  <div id="DEBCHA" >
	 			              Cuenta Numero :
				              <INPUT name="E01DEBCHA" size="13" maxlength="12" value="<%= lnBasic.getE01DEBCHA().trim()%>" >
							  <A href="javascript:GetAccByClient('E01DEBCHA','','RT','',document.getElementById('E01DEACUN').value)"> 
							  <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
						</div>
					</td>			
			     	<%
			          }
			        %>
          </tr>
          <%
          		numCom++;
                    }
                }
           }
    	  %> <%
          if (!ins.getNoResult()){ %> <%
                ins.initRow();
                while (ins.getNextRow()) {
                    if (ins.getFlag().equals("")) {
	      %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><%= ins.getRecord(10) %> : </div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" class="txtright" name="E02DEDAMTI<%=ins.getCurrentRow()%>" size="15" maxlength="15" value="<%= ins.getRecord(2) %>" onKeypress="enterDecimal(event)">
              <% if (ins.getRecord(22).trim().equals("3")) {%> Base : 
              <input type="text" class="txtright" name="E02BSEAMTI<%=ins.getCurrentRow()%>" size="15" maxlength="15" value="<%= ins.getRecord(0) %>" onKeypress="enterDecimal(event)">
              <% }%> 
              <input type="radio" name="E02DLIPBCI<%=ins.getCurrentRow()%>" value="1" <% if (!(ins.getRecord(21).trim().equals("2"))) out.print(" checked");%>>
              Financiado 
              <input type="radio" name="E02DLIPBCI<%=ins.getCurrentRow()%>" value="2" <% if (ins.getRecord(21).trim().equals("2")) out.print(" checked");%>>
              Pre-Pagado </td>
          </tr>
          <%
                    }
                }
           }
    	  %> <%
          if (!iva.getNoResult()){ %> <%
                iva.initRow();
                while (iva.getNextRow()) {
                    if (iva.getFlag().equals("")) {
	      %> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><%= iva.getRecord(10) %> : </div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" name="E02DEDAMTV<%=iva.getCurrentRow()%>" size="15" maxlength="15" value="<%= iva.getRecord(2) %>" onKeypress="enterDecimal(event)">
            </td>
            <td nowrap> </td>
          </tr>
          <%
                    }
                }
           }
    	  %> 
    	  <% if (!lnBasic.getE01DEDFIN().trim().equals("0")) { %>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><b>Total Cargos :</b></div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" style="color:red;" readonly name="E01SUBTOT" size="15" maxlength="15" value="<%= lnBasic.getE01SUBTOT().trim()%>">
            </td>
            <td nowrap>&nbsp; </td>		  
		  </tr>    	  
    	  
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><b>Cargos Financiados :</b></div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" style="color:red;" readonly name="E01DEDFIN" size="15" maxlength="15" value="<%= lnBasic.getE01DEDFIN().trim()%>">
            </td>
            <td nowrap>&nbsp; </td>		  
		  </tr>    	  
		  <% } %>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><b>Total Desembolso :</b></div>
            </td>
            <td nowrap> 
              <input type="text"  class="txtright" name="E01BALNET" size="15" maxlength="15" value="<%= lnBasic.getE01BALNET().trim()%>" onKeypress="enterDecimal(event)" onchange="setRecalculate()">
            </td>
            <td nowrap>&nbsp; </td>
          </tr>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap> 
              <div align="right"><b>Total Desembolso mas Cargos Financiados :</b></div>
            </td>
            <td nowrap>    
             <div align="center">         	
              	<% out.println(
              		Util.formatCCY(lnBasic.getBigDecimalE01BALNET().add(lnBasic.getBigDecimalE01DEDFIN()).toString()));%> 
			</div>
            </td>
            <td nowrap>&nbsp; </td>
          </tr>
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="50%">
              <div align="right"><b>Recalcular</b> <b>Nuevamente :</b></div>
            </td>
            <td nowrap width="50%"> 
              <div align="left">
                <input type="checkbox" name="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnBasic.getE01RCLFLC().trim().equals("X")) out.print(" checked disabled");%>>
                <b> </b></div>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<% }%>

 <h4 style="text-align:center"><input type="checkbox" name="RECALC" value="" onClick="UpdateFlag(this.checked)" >
      Recalcular Nuevamente</h4>

<% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(lnBasic.getH01FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Advertencias</h4>
  <% } %> 

  <table class="tbenter">
    <tr > 
      <td width="50%"> 
        
  <div align="center"> 
    <p>
      <input id="EIBSBTN" type=button name="Submit" OnClick="showCollMaintB()" value="Garantia">
    </p>
  </div>

      </td>
      
      <td width="50%"> 
      
  <div align="center"> 
  <p>
    <input id="EIBSBTN" type="submit" name="Submit"   value="Enviar">
  </p>
  </div>

      </td>
    </tr>
  </table>
  </form>
  
<SCRIPT type="text/javascript">
  checkDiv();
<%if (userPO.getPurpose().equals("NEW") && userPO.getHeader23().equals("RECALC")){%>
  setRecalculate();
<%}%>
</SCRIPT>
</body>
</html>
 