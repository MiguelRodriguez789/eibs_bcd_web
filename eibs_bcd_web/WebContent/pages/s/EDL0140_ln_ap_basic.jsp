<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
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
<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EDL015001Message"  scope="session" />

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

   //builtNewMenu(ln_i_2_opt); 
   builtNewMenu(ln_a_opt); 
   
  function getNewDeduct(acc){
   page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0370?SCREEN=7&ACCNUM=" + acc;
   CenterWindow(page,600,500,2);
  }
  
  function getDeduct(acc,cod){
   var row;
   for(var i=1;i < TBDEDUCT.rows.length;i++){
     if (TBDEDUCT.rows[i].cells[0].innerText == cod) {
      row = i;
      break
     }
   }
   page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0370?SCREEN=10&ACCNUM=" + acc + "&COD=" + cod + "&ROW="+ row;
   CenterWindow(page,600,500,2);
  }
  
 function UpdateFlag(val) {
  document.forms[0].E01RCLFLC.value = (val==true)?"X":"";
 }
 
 function setRecalculate() {
  document.forms[0].RECALC.checked = true;
  document.forms[0].RECALC.disabled = true;
  UpdateFlag(true);  
 }
</SCRIPT>

</head>
<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
     }
//if (userPO.getPurpose().equals("MAINTENANCE")){
 out.println("<SCRIPT> initMenu(); </SCRIPT>");
 //}
  int numCom = 0;

  String DEAIPD, DEAPPD;
  String E01FLGDED, E01FLGREF,E01FLGPAY,E01FLGCOL,E01DEACLF;
  boolean isDEAIPDNum = true;
  boolean isDEAPPDNum = true;
  DEAIPD = lnBasic.getE01DEAIPD().trim();
  DEAPPD = lnBasic.getE01DEAPPD().trim();
  E01FLGDED = lnBasic.getE01FLGDED().trim();
  E01FLGREF = lnBasic.getE01FLGREF().trim();
  E01FLGPAY = lnBasic.getE01FLGPAY().trim();
  E01FLGCOL = lnBasic.getE01FLGCOL().trim();
  E01DEACLF = lnBasic.getE01DEACLF().trim();
  
  try {
    int i = Integer.parseInt(DEAIPD);
  }
  catch (Exception e) {
    isDEAIPDNum = false;
  }
  try {
    int i = Integer.parseInt(DEAPPD);
  }
  catch (Exception e) {
    isDEAPPDNum = false;
  }

  String genFlag = "";
  try {
      genFlag = request.getParameter("generic").trim();
      if (genFlag == null) genFlag = "";
  } catch (Exception e) {
    genFlag = lnBasic.getE01DEACLF().trim();
  }

  boolean protect = JSEIBSProp.getProtectedBNKBRN();
%> 

<h3 align="center"> <%= lnBasic.getE01DSCPRO().trim()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ln_ap_basic.jsp,EDL0140"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="F">
  <!--INPUT TYPE=HIDDEN NAME="E01DEABNK" value="<%= lnBasic.getE01DEABNK().trim()%>"-->
  <INPUT TYPE=HIDDEN NAME="E01DEARDM" value="<%= lnBasic.getE01DEARDM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARDD" value="<%= lnBasic.getE01DEARDD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEARDY" value="<%= lnBasic.getE01DEARDY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCNC1" value="<%= lnBasic.getE01DLCNC1().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCVA1" value="<%= lnBasic.getE01DLCVA1().trim()%>">
  <input type=HIDDEN name="E01DLCFP1" value="<%= lnBasic.getE01DLCFP1().trim()%>">
 <%-- <INPUT TYPE=HIDDEN NAME="E01DLCTP1" value="<%= lnBasic.getE01DLCTP1().trim()%>">--%> 
  <input type=HIDDEN name="E01DEATYP" value="<%= lnBasic.getE01DEATYP().trim()%>">
  
  <INPUT TYPE=HIDDEN NAME="E01RCLFLC" VALUE="<%= lnBasic.getE01RCLFLC().trim()%>">
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" <% if (lnBasic.getF01DEACUN().equals("Y")) out.print("class=\"txtchanged\""); %> size="10" maxlength="9" value="<%= lnBasic.getE01DEACUN().trim()%>" readonly>
                <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')"></a></div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= lnBasic.getE01CUSNA1().trim()%>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Préstamo :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="13" maxlength="12"  readonly
					value="<% if(userPO.getPurpose().equals("MAINTENANCE")) {out.print(lnBasic.getE01DEAACC().trim());} else { 
					if (lnBasic.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(lnBasic.getE01DEAACC().trim());} %>"
				>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= lnBasic.getE01DEACCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" readonly name="E01DEAPRO" size="4" maxlength="4" value="<%= lnBasic.getE01DEAPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4> 

<%int row1 = 0; %>
<%if ( genFlag.equals("U") == false ) {%>
  
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
          <TBODY>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <TD nowrap width="25%"> 
              <DIV align="right">Fecha de Apertura :</DIV>
            </TD>
            <TD nowrap width="25%"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" modified="F01DEAODM;F01DEAODD;F01DEAODY" readonly="true"/>
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">T&eacute;rmino :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEATRM" <% if (lnBasic.getF01DEATRM().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>" onchange="setRecalculate()" <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %> readonly>
              <SELECT name="E01DEATRC" onchange="setRecalculate()" <% if (!(lnBasic.getH01FLGMAS().equals("N") )) out.print("disabled"); %> disabled>
                            <OPTION value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></OPTION>
                            <OPTION value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
                            <OPTION value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
                            <OPTION value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
                        </SELECT>
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"> 
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <TD nowrap width="25%"> 
              <DIV align="right">Fecha Vencimiento :</DIV>
            </TD>
            <TD nowrap width="25%" colspan="<%= lnBasic.getH01FLGMAS().trim().equals("N") ? "3" : "1"%>"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" modified="F01DEAMDM;F01DEAMDD;F01DEAMDY" readonly="true"/>
            </TD>
            <% if (!lnBasic.getH01FLGMAS().trim().equals("N")) {%>
            <TD nowrap width="25%"> 
              <DIV align="right">Monto :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <eibsinput:text name="lnBasic" property="E01DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </TD>
            <% } %>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Tipo Tasa Flotante :</DIV>
            </TD>
            <TD nowrap> 
              <INPUT type="text" name="E01DEAFTB" <% if (lnBasic.getF01DEAFTB().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="2" value="<%= lnBasic.getE01DEAFTB().trim()%>" onchange="setRecalculate()" readonly>
              <A href="javascript:GetFloating('E01DEAFTB')"></A> 
              <SELECT name="E01DEAFTY" onchange="setRecalculate()" disabled>
                <OPTION value=" " <% if (!(lnBasic.getE01DEAFTY().equals("FP") ||lnBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></OPTION>
                <OPTION value="FP" <% if (lnBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</OPTION>
                <OPTION value="FS" <% if (lnBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</OPTION>
              </SELECT>
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Tasa Flotante  - Tasa M&iacute;nima :</DIV>
            </TD>
            <TD nowrap> 
              <eibsinput:text name="lnBasic" property="E01FLTRTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
              <eibsinput:text name="lnBasic" property="E01DEAMIR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Tasa/Cargo por Mora :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <eibsinput:text name="lnBasic" property="E01DEAPEI" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
              <INPUT type="text" name="E01DEAPIF" <% if (lnBasic.getF01DEAPIF().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPIF().trim()%>" readonly>
              <A href="javascript:lnGetFact('E01DEAPIF','STATIC_ln_fact.jsp')"></A> 
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Tasa Int./Spread - Tasa M&aacute;xima :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <eibsinput:text name="lnBasic" property="E01DEARTE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
              <eibsinput:text name="lnBasic" property="E01DEAMXR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Linea de Cr&eacute;dito :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <eibsinput:text name="lnBasic" property="E01DEACMC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
              <eibsinput:text name="lnBasic" property="E01DEACMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE %>" readonly="true"/>
               
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"> 
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Nro  Referencia :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAREF" <% if (lnBasic.getF01DEAREF().equals("Y")) out.print("class=\"txtchanged\""); %> size="12" maxlength="12" value="<%= lnBasic.getE01DEAREF().trim()%>" readonly>
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Ciclo de Revisi&oacute;n :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEARRP" <% if (lnBasic.getF01DEARRP().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="3" value="<%= lnBasic.getE01DEARRP().trim()%>" readonly>
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Fecha de Revisi&oacute;n :</DIV>
            </TD>
            <TD nowrap width="25%"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEARRY" fn_month="E01DEARRM" fn_day="E01DEARRD" modified="F01DEARRM;F01DEARRD;F01DEARRY" readonly="true"/>
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Retenci&oacute;n  Impuestos : </DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAWHF" <% if (lnBasic.getF01DEAWHF().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAWHF().trim()%>" readonly>
               
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Centro de Costo :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <eibsinput:text name="lnBasic" property="E01DEACCN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER %>" readonly="true" modified="F01DEACCN"/>
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Pr&eacute;stamo a Demanda :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="hidden" name="E01DEALNC" value="<%= lnBasic.getE01DEALNC()%>">
              <INPUT type="radio" name="CE01DEALNC" value="Y" onclick="document.forms[0].E01DEALNC.value='Y'" <%if(lnBasic.getE01DEALNC().equals("Y")) out.print("checked");%> disabled>
              S&iacute; 
              <INPUT type="radio" name="CE01DEALNC" value="N" onclick="document.forms[0].E01DEALNC.value='N'" <%if(lnBasic.getE01DEALNC().equals("N")) out.print("checked");%> disabled>
              No </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Direcci&oacute;n  Correo :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAMLA" <% if (lnBasic.getF01DEAMLA().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="2" value="<%= lnBasic.getE01DEAMLA().trim()%>" readonly>
               
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <TD nowrap width="25%"> 
              <DIV align="right">Tipo de Cambio :</DIV>
            </TD>
            <TD nowrap width="25%"> 
				<INPUT type="text" name="E01DEAEXR" size="13" maxlength="12" value="<%= lnBasic.getE01DEAEXR().trim()%>" readonly>
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Clase de Cr&eacute;dito :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEACLF" <% if (lnBasic.getF01DEACLF().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEACLF().trim()%>" readonly>
               
            </TD>
          </TR>
          <%--
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Comisionista :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEABRK" <% if (lnBasic.getF01DEABRK().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DEABRK().trim()%>" readonly>
               
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Tasa  Comisionista :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <eibsinput:text name="lnBasic" property="E01DEABCP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </TD>
          </TR>
          --%>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">        		          
            <TD nowrap width="25%"> 
              <DIV align="right">C&oacute;digo de Obligaci&oacute;n :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAOBL" <% if (lnBasic.getF01DEAOBL().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DEAOBL().trim()%>" readonly>
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">C&oacute;digo de Riesgo :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEARRC" <% if (lnBasic.getF01DEARRC().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DEARRC().trim()%>" readonly>
            </TD>		 
          </TR>         
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">        		          
            <TD align="right" nowrap>
              <DIV align="right">Banco/Sucursal :</DIV>
            </TD>
            <TD nowrap>
             <% if( protect || !lnBasic.getH01FLGMAS().trim().equals("N")) {%>
              <INPUT readonly type="text" size="2" maxlength="2" value="<%= lnBasic.getE01DEABNK().trim()%>" name="E01DEABNK" onchange="setRecalculate()">
              <INPUT readonly type="text" name="E01DEABRN" size="4" maxlength="4" value="<%= lnBasic.getE01DEABRN().trim()%>" onchange="setRecalculate()">          
			<%
            } else {
            %>      
              <INPUT type="text" size="2" maxlength="2" value="<%= lnBasic.getE01DEABNK().trim()%>" name="E01DEABNK" onchange="setRecalculate()" readonly>
              <INPUT type="text" name="E01DEABRN" size="4" maxlength="4" value="<%= lnBasic.getE01DEABRN().trim()%>" onchange="setRecalculate()" readonly>
              
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" border="0">
            <%} %>
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Código de Promoción :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" readonly name="E01DLEPRO" size="5" maxlength="4" value="<%= lnBasic.getE01DLEPRO().trim()%>">
              <INPUT type="hidden" name="D02PRO" size="40" maxlength="35" value=" " readonly>
            </TD>
            		 
          </TR>                    
          <% if (!lnBasic.getH01FLGMAS().trim().equals("N")) {%>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <TD nowrap width="25%"> 
              <DIV align="right">Tipo de Inter&eacute;s :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAICT" <% if (lnBasic.getF01DEAICT().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAICT().trim()%>" readonly>
              </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Per&iacute;odo Base :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEABAS" <% if (lnBasic.getF01DEABAS().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DEABAS().trim()%>" readonly>
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">C&aacute;lculo  Int./Normal :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAIFL" <% if (lnBasic.getF01DEAIFL().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAIFL().trim()%>" readonly>
               
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">C&aacute;lculo  Int./Mora :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAPCL" <% if (lnBasic.getF01DEAPCL().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPCL().trim()%>" readonly>
              </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Tabla Cargos :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEATLN" <% if (lnBasic.getF01DEATLN().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="2" value="<%= lnBasic.getE01DEATLN().trim()%>" readonly>
               
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Per&iacute;odo de Gracia :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAGPD" <% if (lnBasic.getF01DEAGPD().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DEAGPD().trim()%>" readonly>
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Tabla Tasas :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEARTB" <% if (lnBasic.getF01DEARTB().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEARTB().trim()%>" readonly>
               
            </TD>
            
            <%  if (currUser.getE01INT().trim().equals("07")) {%>
            
            <TD nowrap width="25%"> 
              <DIV align="right">Condici&oacute;n  Cr&eacute;dito :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEADLC" <% if (lnBasic.getF01DEADLC().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEADLC().trim()%>" readonly>
               
            </TD>
            
             <% } else {%> 
                <%  if (currUser.getE01INT().trim().equals("18")) {%>
                  <td nowrap width="25%" > 
                    <div align="right">Condici&oacute;n  Cr&eacute;dito :</div>
                  </td>
                  <td width="27%" > 
                    <select name="E01DEADLC" disabled>
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
                    <select name="E01DEADLC" disabled>
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
            
        
          <%}%> 
           </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%"> 
              <DIV align="right">Tipo de Relacion 1 :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAPAR" <% if (lnBasic.getF01DEAPAR().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPAR().trim()%>" readonly>
               
            </TD>
            <TD nowrap width="25%"> 
              <DIV align="right">Cuenta  Relacion 1 :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <INPUT type="text" name="E01DEAPAC" <% if (lnBasic.getF01DEAPAC().equals("Y")) out.print("class=\"txtchanged\""); %> size="12" maxlength="12" value="<%= lnBasic.getE01DEAPAC().trim()%>" readonly>
               
            </TD>
          </TR>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <TD nowrap width="25%">
              <DIV align="right">Tipo de Relacion 2 :</DIV>
            </TD>
            <TD nowrap width="25%">
              <INPUT type="text" name="E01DEARET" <% if (lnBasic.getF01DEARET().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEARET().trim()%>" readonly>
              </TD>
            <TD nowrap width="25%">
              <DIV align="right">Cuenta  Relacion 2 :</DIV>
            </TD>
            <TD nowrap width="25%">
              <INPUT type="text" name="E01DEAREA" <% if (lnBasic.getF01DEAREA().equals("Y")) out.print("class=\"txtchanged\""); %> size="12" maxlength="12" value="<%= lnBasic.getE01DEAREA().trim()%>" readonly>
              </TD>
          </TR> 

          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <TD nowrap width="25%"> 
              <DIV align="right">Clave de Descuento :</DIV>
            </TD>
            <TD nowrap width="25%"> 
              <input type="text" readonly name="E01DEACUI" size="8" maxlength="6" value="<%= lnBasic.getE01DEACUI().trim()%>">
              <input type="text" readonly name="D01DEACUI" size="40" maxlength="35" value="<%= lnBasic.getD01DEACUI().trim()%>">
            </TD>
 			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td width="25%"> 
	              <div align="right">Cobro del FECI :</div>
	            </td>
	            <td width="25%"> 
	              <input type="radio" disabled name="E01DEATX2" value="F"  <%if (lnBasic.getE01DEATX2().equals("F")) out.print("checked"); %>>
	              Si 
	              <input type="radio" disabled name="E01DEATX2" value="N"  <%if (!lnBasic.getE01DEATX2().equals("F")) out.print("checked"); %>>
	              No
	            </td>
			  <% } else { %>
	            <td nowrap width="25%" >
	              <div align="right"> </div>
	            </td>
	            <td nowrap width="25%" >
	              <div align="right"> </div>
				</td>
			  <% } %>
          </TR>


         
        </TBODY></TABLE>
      </td>
    </tr>
  </table>
<% } else {%>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" modified="F01DEAODM;F01DEAODD;F01DEAODY" readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEATRM" <% if (lnBasic.getF01DEATRM().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>" readonly>
              <select name="E01DEATRC" disabled>
                <option value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" modified="F01DEAMDM;F01DEAMDD;F01DEAMDY" readonly="true"/>
            </td>
            <% if (!lnBasic.getH01FLGMAS().trim().equals("N")) {%>
            <td nowrap width="25%"> 
              <div align="right">Monto :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:text name="lnBasic" property="E01DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <% }%>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" >
            	<div align="right">N&uacute;mero de Referencia :</div>
            </td>
            <td nowrap width="25%" ><input type="text" name="E01DEAREF" <% if (lnBasic.getF01DEAREF().equals("Y")) out.print("class=\"txtchanged\""); %> size="12" maxlength="12" value="<%= lnBasic.getE01DEAREF().trim()%>" readonly></td>
            <td nowrap width="25%" ><div align="right">Centro de Costo :</div></td>
            <td nowrap width="25%" ><input type="text" name="E01DEACCN" <% if (lnBasic.getF01DEACCN().equals("Y")) out.print("class=\"txtchanged\""); %> size="8" maxlength="8" value="<%= lnBasic.getE01DEACCN().trim()%>" readonly>
               </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="25%" ><div align="right">Direcci&oacute;n de Correos :</div></td>
            <td nowrap width="25%" ><input type="text" name="E01DEAMLA" <% if (lnBasic.getF01DEAMLA().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="2" value="<%= lnBasic.getE01DEAMLA().trim()%>" readonly>
               </td>
            <td nowrap width="25%" > 
              
            </td>
            <td nowrap width="25%" > 
              
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="25%" ><div align="right">C&oacute;digo de Obligaci&oacute;n :</div></td>
            <td nowrap width="25%" ><input type="text" name="E01DEAOBL" <% if (lnBasic.getF01DEAOBL().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DEAOBL().trim()%>" readonly></td>
            <td nowrap width="25%" > 
              <div align="right">C&oacute;digo de Riesgo :</div>            </td>
            <td nowrap width="25%" > 
              <input type="text" name="E01DEARRC" <% if (lnBasic.getF01DEARRC().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DEARRC().trim()%>" readonly>
            </td>
          </tr>
          
          
        </table>
      </td>
    </tr>
  </table>

<% } %>
<%if ( genFlag.equals("U") == false ) {%>
  <h4>Prioridad de Pagos </h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP1" <% if (lnBasic.getF01DEAPP1().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP1().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP2" <% if (lnBasic.getF01DEAPP2().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP2().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP3" <% if (lnBasic.getF01DEAPP3().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP3().trim()%>" readonly>
              </div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="14%"  > 
	              <div align="center"> 
	                <input type="text" name="E01DEAPP7" <% if (lnBasic.getF01DEAPP7().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP7().trim()%>" readonly>
	              </div>
	            </td>
			  <% } %>
			 <%if(currUser.getE01INT().equals("18")){%> 
	            <td nowrap width="14%"  > 
	              <div align="center"> 
	                <input type="text" name="E01DEAPP7" <% if (lnBasic.getF01DEAPP7().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP7().trim()%>" readonly>
	              </div>
	            </td>
			  <% } %>
           <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP4" <% if (lnBasic.getF01DEAPP4().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP4().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP5" <% if (lnBasic.getF01DEAPP5().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP5().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="14%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP6" <% if (lnBasic.getF01DEAPP6().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP6().trim()%>" readonly>
              </div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%"> <input type="text" size="4" maxlength="3" name="E01DEAIPD" value="<%= lnBasic.getE01DEAIPD().trim()%>" readonly> </td>
            <td nowrap width="22%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEARDY" fn_month="E01DEARDM" fn_day="E01DEARDD" modified="F01DEARDM;F01DEARDD;F01DEARDY" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap width="15%"><input type="text" name="E01DEAPPD" <% if (lnBasic.getF01DEAPPD().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DEAPPD().trim()%>"> </td>
            <td nowrap width="22%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% if(!pmntPlus.getNoResult()){ %>
  <h5>Pagos Irregulares </h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
  <%}%>
  <% if(isDEAIPDNum && isDEAPPDNum){ %>
  <h5 align="center">Pagar el Inter&eacute;s y el Capital seg&uacute;n sus ciclos</h5>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%"><input type="text" name="E01DEAIPD" <% if (lnBasic.getF01DEAIPD().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DEAIPD().trim()%>" readonly> </td>
            <td nowrap width="22%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2"> 
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap width="15%"><input type="text" name="E01DEAPPD" <% if (lnBasic.getF01DEAPPD().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DEAPPD().trim()%>" readonly> </td>
            <td nowrap width="22%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAHEY" fn_month="E01DEAHEM" fn_day="E01DEAHED" modified="F01DEAHEM;F01DEAHED;F01DEAHEY" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" > 
              <eibsinput:text name="lnBasic" property="E01DEAROA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="22%" >
              <div align="right">Incluye Intereses Pago :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="hidden" name="E01DEAIIP" value="<%= lnBasic.getE01DEAIIP()%>">
              <input type="radio" name="CE01DEAIIP" value="Y" onClick="document.forms[0].E01DEAIIP.value='Y'"
			  <%if(lnBasic.getE01DEAIIP().equals("Y")) out.print("checked");%> disabled>
              S&iacute; 
              <input type="radio" name="CE01DEAIIP" value="N" onClick="document.forms[0].E01DEAIIP.value='N'"
			  <%if(lnBasic.getE01DEAIIP().equals("N")) out.print("checked");%> disabled>
              No <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0" width="16" height="20"  ></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% if(!pmntPlus.getNoResult()){ %>
    <h5>Pagos Irregulares </h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
  <%}%>
  
    <% if(DEAIPD.equals("SC3") && DEAPPD.equals("SC3")){ %>
  <h5 align="center">Cuotas Niveladas (SC3)</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Total de Cuotas :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="VALNC01" <% if (lnBasic.getF01DLCNC1().equals("Y")) out.print("class=\"txtchanged\""); %> size="6" maxlength="5" value="<%= lnBasic.getE01DLCNC1().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01DLCFP1" <% if (lnBasic.getF01DLCFP1().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" readonly>
              <select name="E01DLCTP1" disabled>
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%" > 
              <div align="right">Intereses Prepagados Hasta :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DLCPM1" <% if (lnBasic.getF01DLCPM1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCPM1().trim()%>" readonly>
              <input type="text" name="E01DLCPD1" <% if (lnBasic.getF01DLCPD1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCPD1().trim()%>" readonly>
              <input type="text" name="E01DLCPY1" <% if (lnBasic.getF01DLCPY1().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="4" value="<%= lnBasic.getE01DLCPY1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01DLCGM1" <% if (lnBasic.getF01DLCGM1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCGM1().trim()%>" readonly>
              <input type="text" name="E01DLCGD1" <% if (lnBasic.getF01DLCGD1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCGD1().trim()%>" readonly>
              <input type="text" name="E01DLCGY1" <% if (lnBasic.getF01DLCGY1().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="4" value="<%= lnBasic.getE01DLCGY1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%" > 
              <div align="right">Primera Fecha de Pago : </div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DLCXM1" <% if (lnBasic.getF01DLCXM1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCXM1().trim()%>" readonly>
              <input type="text" name="E01DLCXD1" <% if (lnBasic.getF01DLCXD1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCXD1().trim()%>" readonly>
              <input type="text" name="E01DLCXY1" <% if (lnBasic.getF01DLCXY1().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="4" value="<%= lnBasic.getE01DLCXY1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="VALVA01" size="14" maxlength="13" value="<%= lnBasic.getE01DLCVA1().trim()%>" onBlur="document.forms[0].E01DLCVA1.value = document.forms[0].VALVA01.value" readonly>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Mes de NO Pago :</div>
            </td>
            <td nowrap width="15%" >
                <input type="text" name="E01DLCMN1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCMN1().trim()%>" readonly>              
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
  <% if(!pmntPlus.getNoResult()){ %>
    <h5>Pagos Irregulares </h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
  <%}%>
  
  
  <% if(DEAIPD.equals("SC1") && DEAPPD.equals("SC1")){ %>
  <h5 align="center">Cuotas Niveladas (SC1)</h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Total de Cuotas :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="VALNC01" <% if (lnBasic.getF01DLCNC1().equals("Y")) out.print("class=\"txtchanged\""); %> size="6" maxlength="5" value="<%= lnBasic.getE01DLCNC1().trim()%>" readonly>
            </td>
            <td nowrap width="22%"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01DLCFP1" <% if (lnBasic.getF01DLCFP1().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" readonly>
               <select name="E01DLCTP1" disabled>
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="33%" > 
              <div align="right">Intereses Prepagados Hasta :</div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DLCPM1" <% if (lnBasic.getF01DLCPM1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCPM1().trim()%>" readonly>
              <input type="text" name="E01DLCPD1" <% if (lnBasic.getF01DLCPD1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCPD1().trim()%>" readonly>
              <input type="text" name="E01DLCPY1" <% if (lnBasic.getF01DLCPY1().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="4" value="<%= lnBasic.getE01DLCPY1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01DLCGM1" <% if (lnBasic.getF01DLCGM1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCGM1().trim()%>" readonly>
              <input type="text" name="E01DLCGD1" <% if (lnBasic.getF01DLCGD1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCGD1().trim()%>" readonly>
              <input type="text" name="E01DLCGY1" <% if (lnBasic.getF01DLCGY1().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="4" value="<%= lnBasic.getE01DLCGY1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%" > 
              <div align="right">Primera Fecha de Pago : </div>
            </td>
            <td nowrap width="15%" >
              <input type="text" name="E01DLCXM1" <% if (lnBasic.getF01DLCXM1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCXM1().trim()%>" readonly>
              <input type="text" name="E01DLCXD1" <% if (lnBasic.getF01DLCXD1().equals("Y")) out.print("class=\"txtchanged\""); %> size="3" maxlength="2" value="<%= lnBasic.getE01DLCXD1().trim()%>" readonly>
              <input type="text" name="E01DLCXY1" <% if (lnBasic.getF01DLCXY1().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="4" value="<%= lnBasic.getE01DLCXY1().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="text" name="VALVA01" size="20" maxlength="18" value="<%= lnBasic.getE01DLCVA1().trim()%>" onBlur="document.forms[0].E01DLCVA1.value = document.forms[0].VALVA01.value" readonly class="txtright">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Mes de NO Pago :</div>
            </td>
            <td nowrap width="15%" >
                <input type="text" name="E01DLCMN1" size="2" maxlength="2" value="<%= lnBasic.getE01DLCMN1().trim()%>" readonly>              
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
  
  <h5>Pagos Irregulares </h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"><b>Plan 1</b></td>
            <td nowrap width="15%">&nbsp;</td>
            <td nowrap width="22%">&nbsp;</td>
            <td nowrap colspan="2">&nbsp;</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="33%"> 
              <div align="right">Porcentaje Capital :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E01DLCOR1" <% if (lnBasic.getF01DLCOR1().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DLCOR1().trim()%>" readonly>
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Valor Capital :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E01DLCPP1" <% if (lnBasic.getF01DLCPP1().equals("Y")) out.print("class=\"txtchanged\""); %> size="14" maxlength="13" value="<%= lnBasic.getE01DLCPP1().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="33%" height="31"> 
              <div align="right">N&uacute;mero de Cuotas :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="VALNC11" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onBlur="document.forms[0].E01DLCNC1.value = document.forms[0].VALNC11.value" readonly>
            </td>
            <td nowrap width="22%" height="31"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2" height="31"> 
              <input type="text" name="E01DLCFP1" <% if (lnBasic.getF01DLCFP1().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onBlur="document.forms[0].E01DLCFP1.value = document.forms[0].FRCFP11.value" readonly>
              <select name="E01DLCTP1" disabled>
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="VALVA11" size="20" maxlength="18" value="<%= lnBasic.getE01DLCVA1().trim()%>" onBlur="document.forms[0].E01DLCVA1.value = document.forms[0].VAlVA11.value" readonly class="txtright">
            </td>
            <td nowrap width="22%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="15%" >&nbsp; </td>
            <td nowrap width="22%" > 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2" >&nbsp; </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%" ><b>Plan 2</b></td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Porcentaje Capital :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E01DLCOR2" <% if (lnBasic.getF01DLCOR2().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DLCOR2().trim()%>" readonly>
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Valor Capital :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" name="E01DLCPP2" <% if (lnBasic.getF01DLCPP2().equals("Y")) out.print("class=\"txtchanged\""); %> size="14" maxlength="13" value="<%= lnBasic.getE01DLCPP2().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">N&uacute;mero de Cuotas :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="E01DLCNC2" <% if (lnBasic.getF01DLCNC2().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC2().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01DLCFP2" <% if (lnBasic.getF01DLCFP2().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP2().trim()%>" readonly>
              <select name="E01DLCTP2" disabled>
                <option value=" " <% if (!(lnBasic.getE01DLCTP2().equals("D") ||lnBasic.getE01DLCTP2().equals("M")||lnBasic.getE01DLCTP2().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP2().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP2().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP2().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" > 
              <input type="text" name="E01DLCVA2" <% if (lnBasic.getF01DLCVA2().equals("Y")) out.print("class=\"txtchanged\""); %> size="20" maxlength="18" value="<%= lnBasic.getE01DLCVA2().trim()%>" readonly class="txtright">
            </td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap colspan="2" >&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <% if(!pmntPlus.getNoResult()){ %>
    <h5>Pagos Irregulares </h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
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
  <%}%> <% if(DEAIPD.equals("SCH") && DEAPPD.equals("SCH")){ %> 
  <h5>Plan de Pagos </h5>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%"><input type="text" name="E01DEAIPD" <% if (lnBasic.getF01DEAIPD().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DEAIPD().trim()%>" readonly> </td>
            <td nowrap width="22%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap colspan="2"><%= lnBasic.getE01DEAPPD().trim()%> </td>
          </tr>
        </table>
        <p><b>Intereses</b></p>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap width="67%"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEARDY" fn_month="E01DEARDM" fn_day="E01DEARDD" modified="F01DEARDM;F01DEARDD;F01DEARDY" readonly="true"/>
            </td>
          </tr>
        </table>
        <p><b>Capital </b></p>
        <table class="tableinfo" style="filter:''">
          <tr > 
            <td nowrap> 
              <table cellpadding=2 cellspacing=0 width="100%" border="0">
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
                <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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

<% if(E01FLGDED.equals("Y")) { %>
<h5>Deducciones</h5>
<table class="tableinfo">
	<tr>
		<td nowrap>
		  <table class="tableinfo" style="filter: ''">
		    <tr>
		      <td nowrap>
		        <table id="TBDEDUCT" cellpadding=2 cellspacing=0 width="100%" border="0">
			     <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
				  <td nowrap width="20%">
				    <div align="center">C&oacute;digo</div>
				  </td>
				  <td nowrap width="30%">
				    <div align="center">Compa&ntilde;&iacute;a</div>
				  </td>
				  <td nowrap width="20%">
				    <div align="center">P&oacute;liza N&uacute;mero</div>
				  </td>
				  <td nowrap width="20%">
				    <div align="center">Deducci&oacute;n</div>
				  </td>
				  <td nowrap width="10%">
				    <div align="center">Factor</div>
				  </td>
				  
			     </tr>
				
	<%ded.initRow();
	while (ded.getNextRow()) { 
	    boolean mostrar = false;
        try {
            Integer.parseInt(ded.getRecord(1));
        } catch(NumberFormatException e){
        	mostrar = true;
        }
		if (ded.getFlag().equals("")){%>
			<tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
				<td nowrap width="20%">
				<div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%=ded.getRecord(4)%></a></div>
				</td>
				<td nowrap width="20%">
				<div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%=ded.getRecord(10)%></a></div>
				</td>
				<td nowrap width="20%">
				<div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%=ded.getRecord(16)%></a></div>
				</td>
				<td nowrap width="20%">
				<div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%=ded.getRecord(5)%></a></div>
				</td>
				<td nowrap width="10%">
				<div align="center"><a href="javascript:getDeduct('<%= lnBasic.getE01DEAACC().trim() %>','<%= ded.getRecord(4) %>')"><%=ded.getRecord(6)%></a></div>
				</td>
			</tr>
			<%}
			}%>
			
			</table>
				</td>
			</tr>
		</table>

		<p align="center">&nbsp;</p>

		</td>
	</tr>
</table>
<%}%>



  <h4>Cuenta de Pago</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="28%" >
              <div align="right">Autoriza Pagos en Feriados : </div>
            </td>
            <td nowrap width="10%" > 
              <input type="text" name="E01DEAODA" <% if (lnBasic.getF01DEAODA().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01DEAODA().trim()%>" readonly>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Autoriza Pagos en Feriados : </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
                <input type="hidden" name="E01DEAHFQ" value="<%= lnBasic.getE01DEAHFQ()%>">
                <input type="radio" name="CE01DEAHFQ" value="1" onClick="document.forms[0].E01DEAHFQ.value='1'"
			  <%if(lnBasic.getE01DEAHFQ().equals("1")) out.print("checked");%> disabled>
                S&iacute; 
                <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.forms[0].E01DEAHFQ.value='2'"
			  <%if(lnBasic.getE01DEAHFQ().equals("2")) out.print("checked");%> disabled>
                No </div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="28%" align="right"> Medio de Pago : 
            </td>
            <td nowrap width="10%" > 
              <div align="left">
               <select name="E01DEAPVI" disabled>
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="28%"> 
              <div align="center">Concepto</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">Banco </div>
            </td>
            <td nowrap width="17%"> 
              <div align="center">Sucursal</div>
            </td>
            <td nowrap> 
              <div align="center">Moneda </div>
            </td>
            <td nowrap> 
              <div align="center">Referencia</div>
            </td>
            <td nowrap> 
              <div align="center">Titular</div>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="28%" > 
              <div align="center"> 
                <input type="text" name="E01PAGOPE" value="<%= lnBasic.getE01PAGOPE().trim()%>" size="3" maxlength="3" readonly>
                <input type="hidden" name="E01PAGGLN" value="<%= lnBasic.getE01PAGGLN().trim()%>">
                <input type="text" name="E01PAGCON" size="25" maxlength="25" readonly value="<%= lnBasic.getE01PAGCON().trim()%>">
				</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                 <eibsinput:text name="lnBasic" property="E01PAGBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <eibsinput:text name="lnBasic" property="E01PAGBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" readonly="true"/>
               </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <eibsinput:text name="lnBasic" property="E01PAGCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
	      </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <eibsinput:text name="lnBasic" property="E01PAGACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
              </div>
			</td>
			
			<td nowrap width="28%" > 
              <div align="center"> 
                <input type="text" readonly name="E01PAGNA1" size="25" maxlength="25" value="<%= lnBasic.getE01PAGNA1().trim()%>">
              </div>
            </td>
			
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="28%" >&nbsp;</td>
            <td nowrap width="10%" >&nbsp;</td>
            <td nowrap width="10%" >&nbsp;</td>
            <td nowrap width="10%" >&nbsp;</td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="28%" >&nbsp;</td>
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">N&uacute;mero de Finca :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" readonly name="E01FIXMOD" size="17" maxlength="15" value="<%= lnBasic.getE01FIXMOD().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Registro Forestal :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly name="E01FIXRMK" size="27" maxlength="25" value="<%= lnBasic.getE01FIXRMK().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Provincia :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" readonly name="E01FIXMTH" size="4" maxlength="2" value="<%= lnBasic.getE01FIXMTH().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Corregimiento :</div>
            </td>
            <td nowrap width="27%">
              <input type="text" readonly name="E01FIXCLS" size="5" maxlength="4" value="<%= lnBasic.getE01FIXCLS().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha Final Tramo Preferencial :</div>
            </td>
            <td nowrap width="23%">
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAPSY" fn_month="E01DEAPSM" fn_day="E01DEAPSD" modified="F01DEAPSM;F01DEAPSD;F01DEAPSY" readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Valor del Terreno :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly name="E01FIXPPR" size="20" maxlength="18" value="<%= lnBasic.getE01FIXPPR().trim()%>" class="txtright">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha Inscripción Reg.Público :</div>
            </td>
            <td nowrap width="23%">
 		   		<eibsinput:date name="lnBasic" fn_year="E01FIXASN" fn_month="E01FIXCCN" fn_day="E01FIXPIN"  readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Valor Mejoras :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly name="E01DLAIMP" size="20" maxlength="18" value="<%= lnBasic.getE01DLAIMP().trim()%>" class="txtright">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
              <input type="text" readonly name="E01FIXRVA" size="20" maxlength="18" value="<%= lnBasic.getE01FIXRVA().trim()%>" class="txtright">
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">RUC Acreedor Anterior :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" readonly name="E01FIXMAR" size="22" maxlength="20" value="<%= lnBasic.getE01FIXMAR().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Número Préstamo Anterior :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" readonly name="E01FIXSER" size="17" maxlength="15" value="<%= lnBasic.getE01FIXSER().trim()%>">
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">N&uacute;mero del Activo :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01FIXASN" <% if (lnBasic.getF01FIXASN().equals("Y")) out.print("class=\"txtchanged\""); %> size="9" maxlength="9" value="<%= lnBasic.getE01FIXASN().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cuenta Contable :</div>
            </td>
            <td nowrap width="27%">
              
              <eibsinput:text name="lnBasic" property="E01FIXGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
               
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Marca del Activo :</div>
            </td>
            <td nowrap width="23%">
              <input type="text" name="E01FIXMAR" <% if (lnBasic.getF01FIXMAR().equals("Y")) out.print("class=\"txtchanged\""); %> size="20" maxlength="20" value="<%= lnBasic.getE01FIXMAR().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01FIXCCN" <% if (lnBasic.getF01FIXCCN().equals("Y")) out.print("class=\"txtchanged\""); %> size="8" maxlength="8" value="<%= lnBasic.getE01FIXCCN().trim()%>" readonly>
               
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">M&oacute;dulo del Activo :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXMOD" <% if (lnBasic.getF01FIXMOD().equals("Y")) out.print("class=\"txtchanged\""); %> size="15" maxlength="15" value="<%= lnBasic.getE01FIXMOD().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa de Cambio :</div>
            </td>
            <td nowrap width="27%" >
              <eibsinput:text name="lnBasic" property="E01FIXTIC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Valor del Activo :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXPPR" <% if (lnBasic.getF01FIXPPR().equals("Y")) out.print("class=\"txtchanged\""); %> size="15" maxlength="15" value="<%= lnBasic.getE01FIXPPR().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tipo de Depreciaci&oacute;n :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXDTY" <% if (lnBasic.getF01FIXDTY().equals("Y")) out.print("class=\"txtchanged\""); %> size="2" maxlength="1" value="<%= lnBasic.getE01FIXDTY().trim()%>" readonly>
               
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">No. de Serie :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXSER" <% if (lnBasic.getF01FIXSER().equals("Y")) out.print("class=\"txtchanged\""); %> size="15" maxlength="15" value="<%= lnBasic.getE01FIXSER().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Depreciaci&oacute;n :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXPRT" <% if (lnBasic.getF01FIXPRT().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="4" value="<%= lnBasic.getE01FIXPRT().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Ubicaci&oacute;n :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXLOC" <% if (lnBasic.getF01FIXLOC().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01FIXLOC().trim()%>" readonly>
               
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero de Meses :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXMTH" <% if (lnBasic.getF01FIXMTH().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01FIXMTH().trim()%>" onKeypress="enterInteger(event)" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="25%" >
              <div align="right">Clase :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXCLS" <% if (lnBasic.getF01FIXCLS().equals("Y")) out.print("class=\"txtchanged\""); %> size="5" maxlength="4" value="<%= lnBasic.getE01FIXCLS().trim()%>" readonly>
               
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
            <td nowrap width="25%" >
              <div align="right">Comentarios :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXRMK" <% if (lnBasic.getF01FIXRMK().equals("Y")) out.print("class=\"txtchanged\""); %> size="30" maxlength="25" value="<%= lnBasic.getE01FIXRMK().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Valor Residual :</div>
            </td>
            <td nowrap width="23%" >
              <input type="text" name="E01FIXRVA" <% if (lnBasic.getF01FIXRVA().equals("Y")) out.print("class=\"txtchanged\""); %> size="15" maxlength="15" value="<%= lnBasic.getE01FIXRVA().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero del Proveedor :</div>
            </td>
            <td nowrap width="27%" >
              <input type="text" name="E01FIXPIN" <% if (lnBasic.getF01FIXPIN().equals("Y")) out.print("class=\"txtchanged\""); %> size="10" maxlength="9" value="<%= lnBasic.getE01FIXPIN().trim()%>" readonly>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"  > 
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Ciclo de Refinanciamiento :</div>
            </td>
            <td nowrap width="60%"> <%= lnBasic.getE01DEAXRC().trim()%> </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Fecha Pr&oacute;ximo Refinanciamiento :</div>
            </td>
            <td nowrap width="60%"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAXRY" fn_month="E01DEAXRM" fn_day="E01DEAXRD" modified="F01DEAXRM;F01DEAXRD;F01DEAXRY" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%" > 
              <div align="right">Refinanciar hasta :</div>
            </td>
            <td nowrap width="60%" > 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAPCY" fn_month="E01DEAPCM" fn_day="E01DEAPCD" modified="F01DEAPCM;F01DEAPCD;F01DEAPCY" readonly="true"/>
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Monto a Pagar :</div>
            </td>
            <td nowrap width="60%"> 
              <eibsinput:text name="lnBasic" property="E01REFPAG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap width="40%"> 
              <div align="right">Monto a Pagar :</div>
            </td>
            <td nowrap width="60%"> 
               <eibsinput:text name="lnBasic" property="E01REFPAG" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">No. de Cr&eacute;dito para Aplicar Refinanciamiento 
                : </div>
            </td>
            <td nowrap width="60%"> 
              <input type="text" name="E01REFACC" <% if (lnBasic.getF01REFACC().equals("Y")) out.print("class=\"txtchanged\""); %> size="12" maxlength="12" value="<%= lnBasic.getE01REFACC().trim()%>" readonly>
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Monto Pago Final :</div>
            </td>
            <td nowrap width="23%"> 
              <eibsinput:text name="lnBasic" property="E01DEABAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha Pago Final :</div>
            </td>
            <td nowrap width="27%"> 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEABAY" fn_month="E01DEABAM" fn_day="E01DEABAD" modified="F01DEABAM;F01DEABAD;F01DEABAY" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">% Incremento Pago :</div>
            </td>
            <td nowrap width="23%"> 
              <input type="text" name="E01DEAPAP" <% if (lnBasic.getF01DEAPAP().equals("Y")) out.print("class=\"txtchanged\""); %> size="10" maxlength="9" value="<%= lnBasic.getE01DEAPAP().trim()%>" readonly>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="27%"> 
              <input type="text" name="E01DEA2TC" <% if (lnBasic.getF01DEA2TC().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="1" value="<%= lnBasic.getE01DEA2TC().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Ciclo Pr&oacute;ximo Incremento Pago : </div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAPCU" <% if (lnBasic.getF01DEAPCU().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DEAPCU().trim()%>" onKeypress="enterInteger(event)" readonly>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="27%" > 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEALSY" fn_month="E01DEALSM" fn_day="E01DEALSD" modified="F01DEALSM;F01DEALSD;F01DEALSY" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Abono a Capital :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLCABA" <% if (lnBasic.getF01DLCABA().equals("Y")) out.print("class=\"txtchanged\""); %> size="14" maxlength="13" value="<%= lnBasic.getE01DLCABA().trim()%>" readonly>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Factor :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DLCABF" <% if (lnBasic.getF01DLCABF().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="1" value="<%= lnBasic.getE01DLCABF().trim()%>" readonly>
            </td>
          </tr>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap width="25%" > 
              <div align="right">Ciclo Pr&oacute;ximo Abono :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DLCABC" <% if (lnBasic.getF01DLCABC().equals("Y")) out.print("class=\"txtchanged\""); %> size="4" maxlength="3" value="<%= lnBasic.getE01DLCABC().trim()%>" onKeypress="enterInteger(event)" readonly>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Fecha :</div>
            </td>
            <td nowrap width="27%" > 
 		   		<eibsinput:date name="lnBasic" fn_year="E01DEAABY" fn_month="E01DEAABM" fn_day="E01DEAABD" modified="F01DEAABM;F01DEAABD;F01DEAABY" readonly="true"/>
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap> 
              <div align="right"><b>Monto del Pr&eacute;stamo :</b></div>
            </td>
            <td nowrap colspan=2> 
              <eibsinput:text name="lnBasic" property="E01DEAOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
          </tr>
          
          <%if (lnBasic.getE01DEACLF().toUpperCase().equals("P")){%>
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap> 
              <div align="right"><b>Subsidio :</b></div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" class="txtright" name="E01DEAMPA" size="20" maxlength="18" value="<%= lnBasic.getE01DEAMPA().trim()%>" readonly>
            </td>
          </tr>
          <%}%>
          
          
          
          
          <%
          if (!tax.getNoResult()){ %> <%
                tax.initRow();
                while (tax.getNextRow()) {
                    if (tax.getFlag().equals("")) {
	      %> 
	     
	      
	      <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap> 
              <div align="right"><%= tax.getRecord(10) %> : </div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" name="E02DEDAMTT<%=tax.getCurrentRow()%>" size="20" maxlength="18" value="<%= tax.getRecord(2) %>" readonly class="txtright">
            </td>
            <td nowrap> </td>
          </tr>
          <%
                    }
                }
           }
    	  %> <%
          if (!com.getNoResult()){ %> <%
                com.initRow();
                while (com.getNextRow()) {
                    if (com.getFlag().equals("")) {
	      %> 
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap> 
              <div align="right"><%= com.getRecord(10) %> : </div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" name="E02DEDAMTC<%=com.getCurrentRow()%>" size="20" maxlength="18" value="<%= com.getRecord(2) %>" readonly class="txtright">
              &nbsp;&nbsp;
            </td>
                        
		 		<%
		     	if (com.getCurrentRow() == 0){
			    %> 
		        <td nowrap colspan="1"> 
		       		  Forma Pago Cargos :
		              <SELECT name="E01DEBCHF" onchange="setRecalculate()" disabled  >
                           <option value="1" <% if(lnBasic.getE01DEBCHF().equals("1")) out.print("selected");%>>Cargo a Desembolso</option>
		                <option value="2" <% if(lnBasic.getE01DEBCHF().equals("2")) out.print("selected");%>>Débito a Cuenta</option>
		                <option value="3" <% if(lnBasic.getE01DEBCHF().equals("3")) out.print("selected");%>>Capitalizar</option>
		              </SELECT>
					<BR/>
					  <div id="DEBCHA" >
 			              Cuenta Numero :
			              <INPUT name="E01DEBCHA" size="13" maxlength="12" readonly value="<%= lnBasic.getE01DEBCHA().trim()%>" >
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap> 
              <div align="right"><%= ins.getRecord(10) %> : </div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" class="txtright" name="E02DEDAMTI<%=ins.getCurrentRow()%>" size="20" maxlength="18" value="<%= ins.getRecord(2) %>" readonly class="txtright">
              <% if (ins.getRecord(22).trim().equals("3")) {%> Base : 
              <input type="text" class="txtright" name="E02BSEAMTI<%=ins.getCurrentRow()%>" size="20" maxlength="18" value="<%= ins.getRecord(0) %>" readonly class="txtright">
              <% }%> D&eacute;bito a : 
              <input type="radio" name="E02DLIPBCI<%=ins.getCurrentRow()%>" value="1" <% if (!(ins.getRecord(21).trim().equals("2"))) out.print(" checked");%> disabled>
              Cliente 
              <input type="radio" name="E02DLIPBCI<%=ins.getCurrentRow()%>" value="2" <% if (ins.getRecord(21).trim().equals("2")) out.print(" checked");%> disabled>
              Banco </td>
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
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap> 
              <div align="right"><%= iva.getRecord(10) %> : </div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" name="E02DEDAMTV<%=iva.getCurrentRow()%>" size="20" maxlength="18" value="<%= iva.getRecord(2) %>" readonly class="txtright">
            </td>
            <td nowrap> </td>
          </tr>
          <%
                    }
                }
           }
    	  %> 
	      
	      
          
    	  
    	  
		  <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap> 
              <div align="right"><b>Total Cargos :</b></div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" style="color:red;" readonly name="E01SUBTOT" size="20" maxlength="18" value="<%= lnBasic.getE01SUBTOT().trim()%>" class="txtright">
            </td>
            <td nowrap>&nbsp; </td>		  
		  </tr>    	  
    	  
		  <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>">
            <td nowrap> 
              <div align="right"><b>Cargos Financiados :</b></div>
            </td>
            <td nowrap> 
              <input type="text" class="txtright" style="color:red;" readonly name="E01DEDFIN" size="20" maxlength="18" value="<%= lnBasic.getE01DEDFIN().trim()%>" class="txtright">
            </td>
            <td nowrap>&nbsp; </td>		  
		  </tr>    	  
		      	  
    	  
    	  
    	  
    	  
    	  
    	  
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap> 
              <div align="right"><b>Total Desembolso :</b></div>
            </td>
            <td nowrap> 
              <eibsinput:text name="lnBasic" property="E01BALNET" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap>&nbsp; </td>
          </tr>
                     <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap> 
              <div align="right"><b>Total Desembolso mas Cargos Financiados :</b></div>
            </td>
            <td nowrap>    
             <div align="left">         	
              	<% out.println(
              		Util.formatCCY(lnBasic.getBigDecimalE01BALNET().add(lnBasic.getBigDecimalE01DEDFIN()).toString()));%> 
			</div>
            </td>
            <td nowrap>&nbsp; </td>
          </tr>
          
          
          <tr id="<%= (row1 % 2 == 1) ? "trdark" : "trclear" %><%row1++;%>"> 
            <td nowrap>
              <div align="right"><b>Recalcular</b> <b>Nuevamente :</b></div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="checkbox" name="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnBasic.getE01RCLFLC().trim().equals("X")) out.print(" checked disabled");%> disabled>
                <b> </b></div>
            </td>
            <td nowrap>&nbsp;</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<% }%>

  <p align="center">
  
  </p>
  </form>
</body>
</html>
