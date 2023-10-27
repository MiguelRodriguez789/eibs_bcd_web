<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.*" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<%@page import="com.datapro.eibs.constants.StyleID"%>

<html> 
<head>
<title>Apertura de Creditos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="lnBasic" class="datapro.eibs.beans.EPV015001Message" scope="session" /> 
<jsp:useBean id="msg" class="datapro.eibs.beans.ECO004001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-opening.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">
<%	if (userPO.getPurpose().equals("MAINTENANCE")){%>
   		builtNewMenu(pv_m_opt);
   		initMenu();
<% } %>
</SCRIPT>

</head>
<body onload="forma();">
<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
    }
    
	boolean isDEAIPDNum = true;
	boolean isDEAPPDNum = true;
	String DEAIPD = lnBasic.getE01DEAIPD().trim();
	String DEAPPD = lnBasic.getE01DEAPPD().trim();
	String FLGDED = lnBasic.getE01FLGDED().trim();
	String FLGREF = lnBasic.getE01FLGREF().trim();
	String FLGPAY = lnBasic.getE01FLGPAY().trim();
	String FLGCOL = lnBasic.getE01FLGCOL().trim();
	String FLGNEW = lnBasic.getE01FLGNEW().trim();
	String ASSEST = lnBasic.getE01FLGACT().trim();
	String FLGFND = lnBasic.getE01FLGFND().trim();
	String FLGSBS = lnBasic.getE01FLGSBS().trim();
	String FLGDIA = lnBasic.getE01DLCFL5().trim();
 
	int num;
	try {
		num = Integer.parseInt(DEAIPD);
	} catch (Exception e) {
		isDEAIPDNum = false;
	}
	try {
		num = Integer.parseInt(DEAPPD);
	} catch (Exception e) {
		isDEAPPDNum = false;
	}
    
%>

<h3 align="center"> Informaci&oacute;n de Credito - <%=lnBasic.getE01DSCPRO()%><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="loans_basic_information.jsp, EPV0150"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" VALUE="301">
  <INPUT TYPE=HIDDEN NAME="H01FLGMAS" id="H01FLGMAS" VALUE="<%=lnBasic.getH01FLGMAS()%>">
  <INPUT TYPE=HIDDEN NAME="H01FLGWK1" id="H01FLGWK1" VALUE="<%=lnBasic.getH01FLGWK1()%>">
  <INPUT TYPE=HIDDEN NAME="H01FLGWK3" id="H01FLGWK3" VALUE="<%=lnBasic.getH01FLGWK3()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=lnBasic.getE01DEAACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAACC" id="E01DEAACC" VALUE="<%=lnBasic.getE01DEAACC().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01PFNPAC" id="E01PFNPAC" VALUE="<%=lnBasic.getE01PFNPAC().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAOFN" id="E01DEAOFN" VALUE="<%=lnBasic.getE01DEAOFN().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01OLDOAM" id="E01OLDOAM" VALUE="<%=lnBasic.getE01OLDOAM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGDED" id="E01FLGDED" VALUE="<%=lnBasic.getE01FLGDED().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGREF" id="E01FLGREF" VALUE="<%=lnBasic.getE01FLGREF().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGPAY" id="E01FLGPAY" VALUE="<%=lnBasic.getE01FLGPAY().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGCOL" id="E01FLGCOL" VALUE="<%=lnBasic.getE01FLGCOL().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGRCL" id="E01FLGRCL" VALUE="<%=lnBasic.getE01FLGRCL().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGNEW" id="E01FLGNEW" VALUE="<%=lnBasic.getE01FLGNEW().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGFVE" id="E01FLGFVE" VALUE="<%=lnBasic.getE01FLGFVE().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGFND" id="E01FLGFND" VALUE="<%=lnBasic.getE01FLGFND().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGSBS" id="E01FLGSBS" VALUE="<%=lnBasic.getE01FLGSBS().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGACT" id="E01FLGACT" VALUE="<%=lnBasic.getE01FLGACT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01FLGFLT" id="E01FLGFLT" VALUE="<%=lnBasic.getE01FLGFLT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01PLGFLT" id="E01PLGFLT" VALUE="<%=lnBasic.getE01PLGFLT().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DLCFL5" id="E01DLCFL5" VALUE="<%=lnBasic.getE01DLCFL5().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01DEAGLN" id="E01DEAGLN" VALUE="<%=lnBasic.getE01DEAGLN().trim()%>">

<% if(!isDEAIPDNum){ %>
  <INPUT TYPE=HIDDEN NAME="E01DEAPPD" id="E01DEAPPD" VALUE="<%=lnBasic.getE01DEAPPD().trim()%>">
<% } %>  
<% if(!isDEAPPDNum){ %>
  <INPUT TYPE=HIDDEN NAME="E01DEAIPD" id="E01DEAIPD" VALUE="<%=lnBasic.getE01DEAIPD().trim()%>">
<% } %>  

  
<%int row = 0; %>
 <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark">
            <td nowrap width="15%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="10%" > 
              <div align="left">
              	<eibsinput:text property="E01DEACUN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
			  </div>
            </td>
            <td nowrap width="10%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E01CUSNA1" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Tipo : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E01DEATYP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="15%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="10%"> 
              <div align="left"> 
                <input type="text" name="E01DEAACC" size="14" maxlength="12"  readonly value="<% if (lnBasic.getE01DEAACC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(lnBasic.getE01DEAACC().trim()); %>">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="35%"> 
              <div align="left">
              	<eibsinput:text property="E01DEACCY" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
              	<eibsinput:text property="E01DEAPRO" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
 </table>

<% if (lnBasic.getE01DEACLF().equals("S")) { %>
  <!-- Creditos Avalados -->
  <% session.setAttribute("EMPAV","S"); %>
  <iframe id="ifrempav" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1140?SCREEN=101&ACT=N&E01PVTCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PVTNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>  
<% } %>

<% if (("Y".equals(ASSEST)) && (!lnBasic.getE01DEACLF().equals("S"))) { %>
<h4>Cotitulares/Avales</h4>
  <TABLE  id="mainTable" class="tableinfo" style="height:106px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th nowrap width="15%" align="center">Nro Cliente</th>
	            <th nowrap width="45%" align="center">Nombre</th>
	            <th nowrap width="15%" align="center">Identificacion</th>
	            <th nowrap width="10%" align="center">Relacion</th>
	            <th nowrap width="15%" align="center">Porcentaje</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:106px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
           for (int i=1;i<10;i++) {
          %> 
          <tr id="trclear"> 
            <td nowrap width="15%" align="center"> 
   				<%= i %>
				<input type=text name="<%="E01TACUN"+i%>" size="10" maxlength="9" value="<%=lnBasic.getFieldString("E01TACUN"+i) %>" 
					class="context-menu-help" onmousedown="init(custdescidHelp,this.name,'','','E01TANME<%= i %>','E01TAIDN<%= i %>','')" onKeyPress="enterInteger(event)">	
			</td>
            <td nowrap width="45%" align="center"> 
            	<input type="text" name="<%="E01TANME"+i %>" size="60" maxlength="60" value="<%=lnBasic.getFieldString("E01TANME"+i) %>" readonly> 
           	</td>
            <td nowrap width="15%" align="center"> 
            	<input type="text" name="<%="E01TAIDN"+i %>" size="28" maxlength="25" value="<%=lnBasic.getFieldString("E01TAIDN"+i) %>" readonly>  
            </td>
            <td nowrap width="10%" align="center"> 
            	<input type="text" name="<%="E01TAREL"+i %>" size="2" maxlength="1" value="<%=lnBasic.getFieldString("E01TAREL"+i) %>"
            		class="context-menu-help" onmousedown="init(accholdersHelp,this.name,'','','','','')" >  
            </td>
            <td nowrap width="15%" align="center"> 
            	<input type="text" class="txtright" name="<%="E01TAPRC"+i %>" size="7" maxlength="6" value="<%=lnBasic.getFieldString("E01TAPRC"+i) %>" onKeyPress="enterInteger(event)">  
            </td>
          </tr> 
   		  <%}%>
             </table>
        	</div>
    	</td>
	</tr>
</table>
<% } %>

<h4>Datos B&aacute;sicos de la Operaci&oacute;n</h4> 
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <% if("N".equals(FLGNEW)){ %>
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
              <td nowrap width="25%"> 
              <eibsinput:date name="lnBasic" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" onclick="setRecalculate()" onchange="setRecalculate()" /> 
            </td>
            <% }else{ %>
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
              <td nowrap width="25%"> 
              <eibsinput:date name="lnBasic" fn_month="E01DEAODM" fn_day="E01DEAODD" fn_year="E01DEAODY" onclick="setRecalculate()" onchange="setRecalculate()" readonly="true"/> 
            </td>
            <% } %>
            <% if("N".equals(FLGNEW)){ %>
            <td nowrap width="25%"> 
              <div align="right">T&eacute;rmino o Plazo :</div>
            </td>
             <td nowrap width="25%"> 
              <input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>" onchange="setRecalculate()">
              <select name="E01DEATRC" onchange="setRecalculate()" >
	              <OPTION value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></OPTION>
	              <OPTION value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
	              <OPTION value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
	              <OPTION value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <% }else{ %>
            <td nowrap width="25%"> 
              <div align="right">T&eacute;rmino :</div>
            </td>
             <td nowrap width="25%"> 
              <input type="text" name="E01DEATRM" id="E01DEATRM" size="6" maxlength="5" value="<%= lnBasic.getE01DEATRM().trim()%>" onchange="setRecalculate()" readonly>
			  <INPUT TYPE=HIDDEN NAME="E01DEATRC" id="E01DEATRC" VALUE="<%=lnBasic.getE01DEATRC().trim()%>">
              <select name="I01DEATRC" disabled="disabled">
	              <OPTION value=" " <% if (!(lnBasic.getE01DEATRC().equals("D") ||lnBasic.getE01DEATRC().equals("M")||lnBasic.getE01DEATRC().equals("Y"))) out.print("selected"); %>></OPTION>
	              <OPTION value="D" <% if(lnBasic.getE01DEATRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</OPTION>
	              <OPTION value="M" <% if(lnBasic.getE01DEATRC().equals("M")) out.print("selected");%>>Mes(es)</OPTION>
	              <OPTION value="Y" <% if(lnBasic.getE01DEATRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</OPTION>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <% } %>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <% if("N".equals(FLGNEW)){ %>
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:date name="lnBasic"  fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY" required="True" onchange="setRecalculate()" /> 
            </td>
			<% }else{ %>
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:date name="lnBasic"  fn_month="E01DEAMAM" fn_day="E01DEAMAD" fn_year="E01DEAMAY" required="True" onchange="setRecalculate()" readonly="true"/> 
            </td>
			<% } %>
            <td nowrap width="25%"> 
              <div align="right">Tabla Tasa Flotante :</div>
            </td>
            <% if("N".equals(FLGNEW)){ %>
            <td nowrap width="25%"> 
            	<eibsinput:help name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" fn_param_one="E01DEAFTB" fn_param_two="E01FLGFLT" fn_param_three="E01FLTDSC" fn_param_four="PRIMARYRATE" fn_param_five="SECONDARYRATE" fn_param_six="E01DEAFTY" property="E01DEAFTB" help="<%=HelpTypes.FLOATING_RATE_TABLES%>" onchange="rateDisplay(activeProductRates);setRecalculate();totalRate(activeProductRates)" /> 
               <select name="E01DEAFTY" onchange="setRecalculate();rateDisplay(activeProductRates);totalRate(activeProductRates)"> 
                <option value=" " <% if (!(lnBasic.getE01DEAFTY().equals("FP") ||lnBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (lnBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (lnBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>
            </td>
            <%}else{%>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= lnBasic.getE01DEAFTB().trim()%>" readonly>
			  <INPUT TYPE=HIDDEN NAME="E01DEAFTY" id="E01DEAFTY" VALUE="<%=lnBasic.getE01DEAFTY().trim()%>">
               <select name="I01DEAFTY" disabled="disabled"> 
                <option value=" " <% if (!(lnBasic.getE01DEAFTY().equals("FP") ||lnBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (lnBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (lnBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>
            </td>
            <%}%>
          </tr>
          <tr id="FLOATINGTABLE2" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none">
            <td nowrap width="25%" > 
              <div align="right">Descripcion Tabla Flotante :</div>
            </td>
             <td nowrap width="25%"> 
            	<eibsinput:text property="E01FLTDSC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Flotante Base :</div>
            </td>
             <td nowrap width="25%"> 
				<%if(lnBasic.getE01FLGFLT().equals("2")){%>
  					<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=lnBasic.getE01FLTORG().trim()%>">
			  		<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=lnBasic.getE01FLTORG().trim()%>">
			  	<%}else{%>
  					<INPUT TYPE=HIDDEN NAME="PRIMARYRATE" id="PRIMARYRATE" VALUE="<%=lnBasic.getE01FLTRTE().trim()%>">
			  		<INPUT TYPE=HIDDEN NAME="SECONDARYRATE" id="SECONDARYRATE" VALUE="<%=lnBasic.getE01FLTRTE().trim()%>">
			  	<%}%>
            	<eibsinput:text property="E01FLTORG" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          </tr>
          <tr id="FLOATINGTABLE" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: none"> 
            <td nowrap width="25%" > 
              <div align="right">Manejo Puntos Adicional  :</div>
            </td>
            <% if("N".equals(FLGNEW)){ %>
            <td nowrap width="25%"> 
	             <select name="E01DEAFLX" onclick="setRecalculate()" >
	              <OPTION value=" " <% if (!(lnBasic.getE01DEAFLX().equals("B") ||lnBasic.getE01DEAFLX().equals("E")||lnBasic.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(lnBasic.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(lnBasic.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(lnBasic.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	      	</td>
            <td nowrap width="25%"> 
              <div align="right">Valor Tasa Adicional :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEARTX" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" onchange="setRecalculate();totalRate(activeProductRates)"/>
            </td>
		  <%}else{%>
            <td nowrap width="25%"> 
	        	 <INPUT TYPE=HIDDEN NAME="E01DEAFLX" id="E01DEAFLX" VALUE="<%=lnBasic.getE01DEAFLX().trim()%>">
	             <select name="I01DEAFLX" disabled="disabled" >
	              <OPTION value=" " <% if (!(lnBasic.getE01DEAFLX().equals("B") ||lnBasic.getE01DEAFLX().equals("E")||lnBasic.getE01DEAFLX().equals("N"))) out.print("selected"); %>></OPTION>
	              <OPTION value="B" <% if(lnBasic.getE01DEAFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
	              <OPTION value="E" <% if(lnBasic.getE01DEAFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
	              <OPTION value="N" <% if(lnBasic.getE01DEAFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
	             </select>
	      	</td>
            <td nowrap width="25%"> 
              <div align="right">Valor Tasa Adicional :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEARTX" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" readonly="true"/>
            </td>
		  <%}%>
	      </tr>
          <% if (!("N".equals(FLGNEW))){ %>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>  
            </td>
            <td nowrap width="25%" > 
            </td>
            <td nowrap>
            </td>
          </tr>
          <% } %>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Clase de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEACLF" id="E01DEACLF" size="2" maxlength="1" value="<%= lnBasic.getE01DEACLF().trim()%>">
              <a href="javascript:GetClassCred('E01DEACLF','STATIC_ln_cred_class.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Flotante :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01FLTRTE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" onchange="setRecalculate();totalRate(activeProductRates)"/>  
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tipo de Inter&eacute;s :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" value="<%= lnBasic.getE01DEAICT().trim()%>" onchange="setRecalculate()">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" onclick="setRecalculate()"></a>
             </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa Interes/Spread :</div>
            </td>
            <td nowrap width="25%"> 
	            <% if("N".equals(FLGNEW)){ %>
            		<eibsinput:text property="E01DEARTE" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" onchange="setRecalculate();rateDisplay(activeProductRates);totalRate(activeProductRates)" />
		            <b>&nbsp; &nbsp;Tasa Futuros</b>
		            <a href="javascript: goFutureRates('false')"><img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
				<% }else{ %>
	            	<eibsinput:text property="E01DEARTE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true" onchange="setRecalculate()" readonly="true"/> 
		            <b>&nbsp; &nbsp;Tasa Futuros</b>
		            <a href="javascript: goFutureRates('false')"><img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 
				<% } %>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tasa Efectiva Anual:</div>
            </td>
            <td nowrap width="25%"> 
	          <% if (!("N".equals(FLGNEW))){ %>
				<eibsinput:text property="E01DEASPR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true"/>
				<%}else{%>
				<eibsinput:text property="E01DEASPR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" onchange="setRecalculate()"/>
            	<%}%>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa del Prestamo :</div>
            </td>
            <td nowrap width="25%"> 
				<eibsinput:text property="E01LNSRTE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Per&iacute;odo Base :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEABAS" name="lnBasic" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa M&iacute;nima Permitida :</div>
            </td>
            <td nowrap width="25%"> 
				<eibsinput:text property="E01DEAMIR" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true"/>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">C&aacute;lculo  Interes Normal :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAIFL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAIFL().trim()%>" onchange="setRecalculate()">
              <a href="javascript:lnGetOver('E01DEAIFL','STATIC_ln_prov.jsp')" onclick="setRecalculate()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" ></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa M&aacute;xima Permitida :</div>
            </td>
            <td nowrap width="25%"> 
				<eibsinput:text property="E01DEAMXR" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" required="true"/>
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">C&aacute;lculo  Interes de Mora :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAPCL" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPCL().trim()%>" onchange="setRecalculate()">
              <a href="javascript:lnGetOver('E01DEAPCL','STATIC_ln_mor.jsp')" onclick="setRecalculate()"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" ></a></td>
            <td nowrap width="25%"> 
              <div align="right">Tasa o Cargo por Mora :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" class="txtright" name="E01DEAPEI" size="8" maxlength="7" value="<%= lnBasic.getE01DEAPEI().trim()%>" >
              <input type="text" name="E01DEAPIF" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPIF().trim()%>" >
              <a href="javascript:lnGetFact('E01DEAPIF','STATIC_ln_fact.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" ></a> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">L&iacute;nea de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= lnBasic.getE01DEACMC().trim()%>" >
              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= lnBasic.getE01DEACMN().trim()%>" >
              <a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= lnBasic.getE01DEACCN().trim()%>">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Banco/Sucursal :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEABNK" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" />
            	<eibsinput:help fn_param_one="E01DEABRN" fn_param_two="''" property="E01DEABRN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Numero Referencia :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:text property="E01DEAREF" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_REFERENCE %>"/> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tabla Tasas :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEARTB" size="3" maxlength="2" value="<%= lnBasic.getE01DEARTB().trim() %>">
              <a href="javascript:GetRateTable('E01DEARTB','P')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tabla de Parametros :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEATLN" size="3" maxlength="2" value="<%= lnBasic.getE01DEATLN().trim()%>">
              <a href="javascript:GetLoanTable('E01DEATLN',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Uso de Domicilio :</div>
            </td>
            <td nowrap width="25%"> 
              <select name="E01DEAWHF" id="E01DEAWHF" >
                <option value=" " <% if (!(lnBasic.getE01DEAWHF().equals("R")|| lnBasic.getE01DEAWHF().equals("C"))) out.print("selected"); %>> 
                </option>
                <option value="R" <% if (lnBasic.getE01DEAWHF().equals("R")) out.print("selected"); %>>Dirección Fisica</option>
                <option value="C" <% if (lnBasic.getE01DEAWHF().equals("C")) out.print("selected"); %>>Correo Eléctronico</option>
              </select> 
              <input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= lnBasic.getE01DEAMLA().trim()%>">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value,document.forms[0].E01DEAWHF.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0"></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tabla de Cargos :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAOFT" size="3" maxlength="2" value="<%= lnBasic.getE01DEAOFT().trim()%>">
              <a href="javascript:GetLoanChargeTable('E01DEAOFT',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	          <td nowrap width="25%" > 
		          <div align="right">Condici&oacute;n  Cr&eacute;dito :</div>
	          </td>
            <td nowrap width="25%"> 
	    	 	  <input type="text" name="E01DEADLC" size="2" maxlength="1" value="<%=lnBasic.getE01DEADLC() %>">
	          	  <a href="javascript:GetCondicionesCode('E01DEADLC')">
		              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0">
	              </a> 
	                <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
	          </td> 
             <td nowrap width="25%"> 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAGPD" size="3" maxlength="2" value="<%= lnBasic.getE01DEAGPD().trim()%>" >
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Comisionista :</div>
            </td>
            <td nowrap width="25%"> 
            	<eibsinput:help fn_param_one="E01DEABRK" fn_param_three="S" property="E01DEABRK" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER %>" />
            </td>
            <td nowrap width="25%"> 
              <div align="right">Porcentaje Comisionista :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEABCP" size="10" maxlength="9" value="<%= lnBasic.getE01DEABCP().trim()%>"  >
            </td>
          </tr>
           <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Ciclo Revisi&oacute;n de Tasa :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEARRP" size="3" maxlength="3" value="<%= lnBasic.getE01DEARRP().trim()%>">
               <a href="javascript:GetCode('E01DEARRP','STATIC_cycle_rev.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha Revisi&oacute;n de Tasa :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:date name="lnBasic"  fn_month="E01DEARRM" fn_day="E01DEARRD" fn_year="E01DEARRY" /> 
            </td>
          </tr>
           <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Ciclo Emisi&oacute;n de Extracto :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEASTC" size="3" maxlength="3" value="<%= lnBasic.getE01DEASTC().trim()%>">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Fecha Emisi&oacute;n de Extracto :</div>
            </td>
            <td nowrap width="25%"> 
              <eibsinput:date name="lnBasic" fn_month="E01DEAEDM" fn_day="E01DEAEDD" fn_year="E01DEAEDY" /> 
            </td>
          </tr>

           <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" > 
              <div align="right">Tipo de Relacion 1 :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAPAR" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPAR().trim()%>">
              <a href="javascript:GetRel1('E01DEAPAR','STATIC_ln_rel1.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cuenta  Relacion 1 :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAPAC" size="12" maxlength="12" value="<%= lnBasic.getE01DEAPAC().trim()%>">
              <a href="javascript:GetAccount('E01DEAPAC',document.forms[0].E01DEABNK.value,'','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a> 
            </td>
          </tr>
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" >
              <div align="right">Tipo de Relacion 2 :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEARET" size="2" maxlength="1" value="<%= lnBasic.getE01DEARET().trim()%>">
              <a href="javascript:GetRel2('E01DEARET','STATIC_ln_rel2.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a></td>
            <td nowrap width="25%"> 
              <div align="right">Cuenta  Relacion 2 :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" name="E01DEAREA" size="12" maxlength="12" value="<%= lnBasic.getE01DEAREA().trim()%>">
              <a href="javascript:GetAccount('E01DEAREA',document.forms[0].E01DEABNK.value,'10','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="middle" border="0" ></a></td>
          </tr>  
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" >
              <div align="right">Informa x Reestructuraci&oacute;n :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="radio" name="E01DEAFLY" value="Y" <%if (lnBasic.getE01DEAFLY().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E01DEAFLY" value="N" <%if (lnBasic.getE01DEAFLY().equals("N")) out.print("checked"); %>> No
            </td>
			<td nowrap width=25%>
				<div align="right">Acci&oacute;n Sobre Cambio Tasa :</div>
			</td>
			<td nowrap width="27%">
				<select name="E01DEAXRF">
					<option value=""></option>
						<option value="T" <%if (lnBasic.getE01DEAXRF().equals("T")) { out.print("selected"); }%>>Cambiar el Plazo</option>
						<option value="P" <%if (lnBasic.getE01DEAXRF().equals("P")) { out.print("selected"); }%>>Cambiar la Cuota</option>
				</select>
			</td>
          </tr>  
          <tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="25%" >
              <div align="right">Registra FNG :</div>
            </td>
            <td nowrap width="23%"> 
				<input type="radio" name="E01DLCFL6" value="Y" <%if (lnBasic.getE01DLCFL6().equals("Y")) out.print("checked"); %>> Si 
				<input type="radio" name="E01DLCFL6" value="N" <%if (lnBasic.getE01DLCFL6().equals("N")) out.print("checked"); %>> No
            </td>
            <td nowrap width="25%"> 
              	<div align="right">Tasa de Cambio :</div>
              </td>
            <td nowrap width="25%"> 
				<eibsinput:text property="E01DEAEXR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_EXCHANGE_RATE%>" />
              </td>
          </tr>  
			<%if(lnBasic.getE01DEACLF().equals("H")){%>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td width="25%">
					<div align="right">Valor de la Vivienda : </div>
				</td>
           		<td nowrap width="25%"> 
					<eibsinput:text property="E01DLCVVI" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" /> 
				</td>
                <td nowrap width="25%"> 
				<div align="right">Aplica Renta Exenta :</div>
				</td>
           		<td nowrap width="25%"> 
					<input type="radio" name="E01DLCFRE" value="Y" <%if (lnBasic.getE01DLCFRE().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01DLCFRE" value="N" <%if (lnBasic.getE01DLCFRE().equals("N")) out.print("checked"); %>> No
                </td>
			</tr>
			<% } %>   
			<%if(lnBasic.getE01DEACLF().equals("S")){%>
			<tr class="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            <td nowrap width="25%" > 
	              <div align="right">Entidad Avaladora : </div>
	            </td>
	            <td nowrap colspan="3" > 
	              <eibsinput:help name="lnBasic" fn_param_one="E01DLCCAV" fn_param_two="E01DSCCAV" fn_param_three="L" property="E01DLCCAV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" />
				  <eibsinput:text name="lnBasic" property="E01DSCCAV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" />
	            </td>
			</tr>
			<% } %>  			          
        </table>
      </td>
    </tr>
  </table>

<H4>Información  Impuestos</H4>
  <table  class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
	      <%if(currUser.getE01INT().equals("05")){%> 
            <%if (lnBasic.getE01FLGNEW().trim().equals("N")) {%>         
            <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%><%row++;%>">
	         <td nowrap width="25%" > 
                  <div align="right">Afecto a G.M.F. :</div>
                </td>
	       	    <td nowrap width="25%" > 
					<input type="radio" name="E01FLGIDB" value="Y" <%if (lnBasic.getE01FLGIDB().equals("Y")) out.print("checked"); %>> Si 
					<input type="radio" name="E01FLGIDB" value="N" <%if (lnBasic.getE01FLGIDB().equals("N")) out.print("checked"); %>> No
                </td>
	      	   <td nowrap width="25%" > 
                  <div align="right">Monto Base Imponible G.M.F :</div>
                </td>
		         <td nowrap width="25%" > 
                	<eibsinput:text property="E01BASIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"/> 
                </td>
              </tr>
		    <%} else { %>
	           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            <td nowrap width="25%" > 
                  <div align="right"></div>
                </td>
	            <td nowrap width="25%" > 
                </td>
	            <td nowrap width="25%" > 
                  <div align="right">Monto Base Imponible G.M.F :</div>
                </td>
	           <td nowrap width="25%" > 
                	<eibsinput:text property="E01BASIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"/> 
                </td>
              </tr>
		    <%}%>
		  <%}%>
 		  <%if(currUser.getE01INT().equals("07")){%> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	           <td nowrap width="25%" > 
	            <div align="right">Cobro del FECI :</div>
	          </td>
	           <td nowrap width="25%" > 
	            <input type="radio" name="E01DEATX2" value="F"  <%if (lnBasic.getE01DEATX2().equals("F")) out.print("checked"); %>>Si 
	            <input type="radio" name="E01DEATX2" value="N"  <%if (!lnBasic.getE01DEATX2().equals("F")) out.print("checked"); %>>No
	          </td>
	           <td nowrap width="25%" > 
                  <div align="right"></div>
                </td>
	           <td nowrap width="25%" > 
                </td>
	        </tr>  
		  <% } %>
        </table>
      </td>
    </tr>
  </table>
  
<% if ("Y".equals(FLGSBS)) { %>
<H4>Subsidio</H4>
<table  class="tableinfo" >
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Entidad : </div>
            </td>
            <td nowrap width="75%">
              <eibsinput:help name="lnBasic" fn_param_one="E01DLCCFS" fn_param_two="E01DSCCFS" fn_param_three="F" property="E01DLCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" />
			  <eibsinput:text name="lnBasic" property="E01DSCCFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" />
            </td>
          </tr> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Tasa Subsidio : </div>
            </td>
            <td nowrap width="75%">
            <eibsinput:text name="lnBasic" property="E01DLCRFS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" onchange="goSubsidizedRate();"/>
            </td>
          </tr> 
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Tasa Total de Prestamo : </div>
            </td>
            <td nowrap width="75%">
			  <eibsinput:text name="lnBasic" property="E01TOTRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"/>
            </td>
          </tr> 

          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Referencia Subsidio: </div>
            </td>
            <td nowrap width="75%">
              <eibsinput:text name="lnBasic" property="E01DLCNRS" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_TEXT%>" size="12" maxlength="12" />
            </td>
          </tr> 

           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Status del Subsidio : </div>
            </td>
            <td nowrap width="75%">
              <select name="E01DLCFFS" >
	              <OPTION value=" " <% if (!(lnBasic.getE01DLCFFS().equals("1") ||lnBasic.getE01DLCFFS().equals("2")||lnBasic.getE01DLCFFS().equals("3")|| lnBasic.getE01DLCFFS().equals("4") 
	              					|| lnBasic.getE01DLCFFS().equals("5") || lnBasic.getE01DLCFFS().equals("6") || lnBasic.getE01DLCFFS().equals("7")))  out.print("selected"); %>></OPTION>
	              <OPTION value="1" <% if(lnBasic.getE01DLCFFS().equals("1")) out.print("selected");%>>Pago Anticipado</OPTION>
	              <OPTION value="2" <% if(lnBasic.getE01DLCFFS().equals("2")) out.print("selected");%>>Vencido</OPTION>
	              <OPTION value="3" <% if(lnBasic.getE01DLCFFS().equals("3")) out.print("selected");%>>Cesion de Contrato</OPTION>
	              <OPTION value="4" <% if(lnBasic.getE01DLCFFS().equals("4")) out.print("selected");%>>Reestructuracion</OPTION>
	              <OPTION value="5" <% if(lnBasic.getE01DLCFFS().equals("5")) out.print("selected");%>>Aceleracion</OPTION>
	              <OPTION value="6" <% if(lnBasic.getE01DLCFFS().equals("6")) out.print("selected");%>>Peticion Cliente</OPTION>
	              <OPTION value="7" <% if(lnBasic.getE01DLCFFS().equals("7")) out.print("selected");%>>Fallecimiento Cliente</OPTION>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>          
			<%if(!lnBasic.getE01DEACLF().equals("H")){%>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Valor de la Vivienda : </div>
            </td>
            <td nowrap width="75%">
			  <eibsinput:text name="lnBasic" property="E01DLCVVI" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
          </tr> 
          <%}%>
           <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="25%">
              <div align="right">Fecha de Expiraci&oacute;n : </div>
            </td>
            <td nowrap width="75%">
              <eibsinput:date name="lnBasic" fn_month="E01DLCFSM" fn_day="E01DLCFSD" fn_year="E01DLCFSY" />
            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>
  
<%}%>  

  <h4>Prioridad de Pagos </h4>
  <table class="tableinfo" >
    <tr > 
      <td nowrap > 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
         <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP1" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP1().trim()%>">
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP2" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP2().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP3" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP3().trim()%>">
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP4" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP4().trim()%>">
              </div>
            </td>
            <td nowrap width="12%" > 
              <div align="center"> 
                <input type="text" name="E01DEAPP5" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP5().trim()%>">
              </div>
            </td>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP6" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP6().trim()%>">
              </div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%"  > 
	              <div align="center"> 
	                <input type="text" name="E01DEAPP7" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP7().trim()%>">
	              </div>
	            </td>
			  <% } %>
            <td nowrap width="12%"  > 
              <div align="center"> 
                <input type="text" name="E01DEAPP8" size="2" maxlength="1" value="<%= lnBasic.getE01DEAPP8().trim()%>">
              </div>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="12%" > 
              <div align="center">Principal</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Intereses</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Mora</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Comisiones</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Impuestos</div>
            </td>
            <td nowrap width="12%" > 
              <div align="center">Deducciones</div>
            </td>
			 <%if(currUser.getE01INT().equals("07")){%> 
	            <td nowrap width="12%" > 
	              <div align="center">FECI</div>
	            </td>
			  <% } %>
            <td nowrap width="12%" > 
              <div align="center">Cobranzas</div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  

 
<% if ("N".equals(FLGNEW) && "Y".equals(ASSEST)){ %>  
  <br>
  <!-- Reliquidaciones de Creditos -->
  <% session.setAttribute("EMPRC","S"); %>
  <input type="hidden" name="RCTOT" id="RCTOT" value="0">
  <iframe id="ifremprc" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1110?SCREEN=101&ACT=N&E01PRLCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PRLNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>  
<% } %> 

  <a name="CuentaPago"></a>   
  <h4>Forma de pago Automatico</h4>
  <table class="tableinfo" >
    <tr> 
      <td nowrap align="left"> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0" >
          <tr id="<%= (row % 2 == 1) ?  "trdark" : "trdark" %><% if(row % 2 == 1){ row++; }else{row++;row++;}%>">
            <td nowrap width="33%" align="right"> Autoriza Sobregiro : 
            </td>
            <td nowrap width="15%" > 
              <div align="left">
              <input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%= lnBasic.getE01DEAODA().trim()%>">
              <a href="javascript:lnGetOver('E01DEAODA','STATIC_ln_over.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
               </div>
            </td>
            <td nowrap width="10%" > 
               <div align="right">Permite Pagos en Feriados : </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
              <eibsinput:text property="E01DEAHFQ" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="2" maxlength="1" readonly="true"/>
              <a href="javascript:GetCode('E01DEAHFQ','STATIC_ln_tables_holidays.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom"border="0"></a>
			  </div>
            </td>
            
            <td nowrap width="10%" > 
               <div align="right"></div>
            </td>
            
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="28%" align="right"> Forma de Pago : 
            </td>
            <td nowrap width="10%" > 
              <div align="left">
               <select name="E01DEAPVI" id="E01DEAPVI" onchange="javascript:cuentas();">
                    <option value=" " <% if (lnBasic.getE01DEAPVI().equals(" ")) out.print("selected"); %>>Caja</option>
                    <option value="1" <% if (lnBasic.getE01DEAPVI().equals("1")) out.print("selected"); %>>Automatico </option>                   
                    <option value="2" <% if (lnBasic.getE01DEAPVI().equals("2")) out.print("selected"); %>>Convenio</option>  
                    <option value="3" <% if (lnBasic.getE01DEAPVI().equals("3")) out.print("selected"); %>>M&uacute;ltiple Cuentas</option>                 
                    <option value="4" <% if (lnBasic.getE01DEAPVI().equals("4")) out.print("selected"); %>>PAC Multibanco</option>                   
                  </select>
               </div>
            </td>
            <td nowrap width="10%" id="intento" style="border: 0px; display: none;"> 
               <div align="right">Intento Cobro : </div>
            </td>
            <td nowrap id="intento2" style="border: 0px; display: none;"> 
              <div align="left">
 			  	<eibsinput:text property="E01DLCCMC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="3" maxlength="2" />
  			  </div>
             </td>
            <td align="LEFT" id="convenioAsignar" style="border: 0px; display: none;" ><a href="#CuentaPago" onclick="goAsign();"><b>Asignar</b></a></td>
            <td colspan="4" > 
            </td>
          </tr>
		
		<tr>
		<table id="autocuenta" style="border: 0px; display: none; ">
          <tr id="trdark"> 
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
              <div align="center">Referencia</div>
            </td>
            <td nowrap> 
              <div align="center">Titular</div>
            </td>
            <td nowrap> 
            </td>
          </tr>

          <tr id="trclear">
            <td nowrap width="28%" > 
              <div align="center" > 
                <input type="text" name="E01PAGOPE" id="E01PAGOPE" value="<%= lnBasic.getE01PAGOPE().trim()%>" size="3" maxlength="3">
                <input type="hidden" name="E01PAGGLN" value="<%= lnBasic.getE01PAGGLN().trim()%>">
                <input type="text" name="E01PAGCON" id="E01PAGCON" size="25" maxlength="25" readonly value="<%= lnBasic.getE01PAGCON().trim()%>"
					class="context-menu-help" onmousedown="init(conceptHelp,this.name,document.forms[0].E01DEABNK.value,'','E01PAGGLN','E01PAGOPE','10')">
				</div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBNK" size="2" maxlength="2" value="<%= lnBasic.getE01PAGBNK().trim()%>">
              </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBRN" size="4" maxlength="4" value="<%= lnBasic.getE01PAGBRN().trim()%>"
                 class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')"> 
               </div>
            </td>
            <td nowrap width="10%" > 
              <div align="center"> 
                <input type="text" name="E01PAGCCY" size="3" maxlength="3" value="<%= lnBasic.getE01PAGCCY().trim()%>"
                 class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEABNK.value,'','','','')">
              </div>
	      </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01PAGACC" size="12" maxlength="12"  value="<%= lnBasic.getE01PAGACC().trim()%>"
                class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01DEABNK.value,'',document.forms[0].E01DEACUN.value,'','RT')">
              </div>
			</td>
			<td nowrap width="28%" > 
              <div align="center"> 
                <input type="text" readonly name="E01PAGNME" size="25" maxlength="25" value="<%= lnBasic.getE01PAGNME().trim()%>">
              </div>
            </td>
          </tr>
	 	</table>
		<table id="convenioTable" style="border: 0px; display: none; height:100%; width: 100%;">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td width="33%">
               <div align="right">Codigo de Convenio : </div>
            </td>
            <td nowrap > 
              <div align="left" >
                    <input type="text" name="E01DEACNV" size="5" maxlength="4" value="<%= lnBasic.getE01DEACNV().trim()%>"   >
		            <a href="javascript:GetConvenio('E01DEACNV','E01DSCCNV',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
		            <eibsinput:text name="lnBasic" property="E01DSCCNV" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
 			  </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="33%">
				<div align="right">Pagadurias : </div>              
			  </td>
            <td nowrap > 
              <div align="left">
                    <input type="text" name="E01DEAPGD" size="4" maxlength="3" value="<%= lnBasic.getE01DEAPGD().trim()%>" onKeypress="enterInteger(event);">
		            <a href="javascript:GetPagadurias('E01DEAPGD',document.forms[0].E01DEACNV.value,'E01DSCPGD')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
		            &nbsp;&nbsp;
		            <eibsinput:text name="lnBasic" property="E01DSCPGD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
 			  </div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td width="33%">
				<div align="right">Novedad : </div>              
			  </td>
            <td nowrap > 
              <div align="left">
                 <input type="text" name="E01DEAUC6" size="4" maxlength="2" value="<%= lnBasic.getE01DEAUC6().trim()%>"   >
 	             <a href="javascript:GetCodeDescCNOFC('E01DEAUC6', 'E01DSCUC6','NC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
		         <eibsinput:text name="lnBasic" property="E01DSCUC6" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
 			  </div>
            </td>
          </tr ><%row++;%>
	 	</table>
		<tr>
		<td colspan="5">
		<table id="multicuenta" style="border: 0px; display: none; height:100%; width: 100%;" >
	    	<tr  height="5%"> 
      			<td NOWRAP valign="top" width="100%">
      				<table id="headTable" width="100%"> 
				        <tr id="trdark"> 
			        	    <th nowrap width="15%" align="center">Cuenta</th>
			    	        <th nowrap width="50%" align="center">Nombre</th>
			        	    <th nowrap width="10%" align="center">Tipo</th>
			        	    <th nowrap width="10%" align="center">Producto</th>
			            	<th nowrap width="15%" align="center">%USO</th>
			       		</tr>
		       		</table>
	       		</td>
       		</tr>
		  	<tr  height="95%">    
		    	<td nowrap="nowrap" valign="top">      
					<div id="dataDiv1" style="width: 100%; height:106px; overflow:auto;"> 
		        		<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
				       		<% for (int i=1;i<10;i++) {%>
				       			<tr id="trclear"> 
				       				
				            		<td nowrap width="15%" align="center">
				            			<%= i %>
				            			<input type=text name="<%="E01PGACC"+i%>" size="13" maxlength="12" value="<%=lnBasic.getFieldString("E01PGACC"+i) %>" 
				            			class="context-menu-help" onmousedown="init(accountCustomerNameHelp,this.name,document.forms[0].E01DEABNK.value,'','E01PGNME<%=i%>','','RT')"> 
				            		</td>
				            		<td nowrap width="50%" align="center">
				            			<input type=text name="<%="E01PGNME"+i%>" size="60" maxlength="60" value="<%=lnBasic.getFieldString("E01PGNME"+i) %>" readonly> 
				            		</td>
				            		<td nowrap width="10%" align="center">
				            			<input type=text name="<%="E01PGTYP"+i%>" size="5" maxlength="4" value="<%=lnBasic.getFieldString("E01PGTYP"+i) %>" readonly> 
				            		</td>
				            		<td nowrap width="10%" align="center">
				            			<input type=text name="<%="E01PGPRD"+i%>" size="5" maxlength="4" value="<%=lnBasic.getFieldString("E01PGPRD"+i) %>" readonly> 
				            		</td>
				            		<td nowrap width="15%" align="center">
				            			<input type=text name="<%="E01PGPER"+i%>" size="8" maxlength="7" class="txtright" value="<%=lnBasic.getFieldString("E01PGPER"+i) %>"> 
				            		</td>
				          		</tr> 
				   		 	<%}%>
			   		 	</table>
					</div>
	   		 	</td>
   		 	</tr>
	 	</table>
 		 </td>	
		</tr>
        </table>
      </td>
    </tr>
   </table> 

<h4>Condiciones de Pago </h4>
<% if(DEAIPD.equals("MAT") && DEAPPD.equals("MAT")) { %> 
	<h5 align="center">Pagar el Inter&eacute;s y el Capital al Vencimiento (MAT) </h5>
<%}%> 

<% if(isDEAIPDNum && DEAPPD.equals("MAT")){ %> 
 <h5 align="center">Pagar el Capital al Vencimiento y el Inter&eacute;s seg&uacute;n su Ciclo</h5>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%">
            	<eibsinput:text property="E01DEAIPD" name="lnBasic" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>"/>
            </td>
            <td nowrap width="25%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2">
            	 <eibsinput:date name="lnBasic"  fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY"  onchange="setRecalculate();" required="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap width="15%">
            	<eibsinput:text property="E01DEAPPD" name="lnBasic" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>"/>
           	</td>
            <td nowrap width="25%"> 
              <div align="right"></div>
            </td>
            <td nowrap colspan="2">&nbsp; </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  
  <% if(isDEAIPDNum && isDEAPPDNum){ %>
  <h5 align="center">Pagar el Inter&eacute;s y el Capital seg&uacute;n sus ciclos</h5>
  <table class="tableinfo" >
    <tr> 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago de Intereses :</div>
            </td>
            <td nowrap width="15%">
            	 <input type="text" size="4" maxlength="3" name="E01DEAIPD" value="<%= lnBasic.getE01DEAIPD().trim()%>"> 
           	</td>
            <td nowrap width="22%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2"> 
            	<eibsinput:date name="lnBasic"  fn_month="E01DEARDM" fn_day="E01DEARDD" fn_year="E01DEARDY"  onchange="setRecalculate();" required="true"/>
            </td>
          </tr>
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Ciclo Pago Capital :</div>
            </td>
            <td nowrap width="15%">
            	 <input type="text" size="4" maxlength="3" name="E01DEAPPD" value="<%= lnBasic.getE01DEAPPD().trim()%>"> 
            </td>
            <td nowrap width="22%"> 
              <div align="right">Pr&oacute;xima Fecha de Pago :</div>
            </td>
            <td nowrap colspan="2"> 
            	<eibsinput:date name="lnBasic"  fn_month="E01DEAHEM" fn_day="E01DEAHED" fn_year="E01DEAHEY"  onchange="setRecalculate();" required="true"/>
            </td>
          </tr>
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" >
            	<eibsinput:text property="E01DEAROA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate();amountRecalculate();"/> 
            </td>
            <td nowrap width="22%" >
              <div align="right">Incluye Intereses Pago :</div>
            </td>
            <td nowrap colspan="2" >
              <input type="hidden" name="E01DEAIIP" value="<%= lnBasic.getE01DEAIIP()%>">
              <input type="radio" name="CE01DEAIIP" value="Y" onClick="document.forms[0].E01DEAIIP.value='Y'"
			  <%if(lnBasic.getE01DEAIIP().equals("Y")) out.print("checked");%>>S&iacute; 
              <input type="radio" name="CE01DEAIIP" value="N" onClick="document.forms[0].E01DEAIIP.value='N'"
			  <%if(lnBasic.getE01DEAIIP().equals("N")) out.print("checked");%>>No 
			  <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0" width="16" height="20"  ></td>
          </tr>
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
           		<div align="right">Recalcular Fecha Vencimiento :</div>
            </td>
            <td nowrap width="15%" >
               	<input type="checkbox" name="AmountROA" id="AmountROA" value="" onClick="UpdateAmountFlag(this.checked)" <% if (lnBasic.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%>>
            </td>
           	<td nowrap width="22%">
           	</td>
           	<td nowrap colspan="2">
           	</td>
        </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  
  <% if(DEAIPD.equals("SC1") && DEAPPD.equals("SC1")){ %>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
	  <h5 align="center">Cuotas Niveladas (SC1) <%if("Y".equals(FLGDIA)) out.print(" Decreciente, Incremento Anual"); %></h5>
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Total de Cuotas :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E01DLCNC1" id="E01DLCNC1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onkeypress="enterInteger(event)" onchange="setRecalculate();amountRecalculate();wipeValorCuota();">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="22%"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01DLCFP1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onchange="setRecalculate();amountRecalculate();wipeValorCuota();">
              <select name="E01DLCTP1" onchange="setRecalculate();amountRecalculate();wipeValorCuota();">
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Intereses Prepagados Hasta :</div>
            </td>
            <td nowrap width="15%" >
              <eibsinput:date name="lnBasic"  fn_month="E01DLCPM1" fn_day="E01DLCPD1" fn_year="E01DLCPY1"  onchange="setRecalculate();amountRecalculate()"/> 
            </td>
            <td nowrap width="22%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap colspan="2" > 
              <eibsinput:date name="lnBasic"  fn_month="E01DLCGM1" fn_day="E01DLCGD1" fn_year="E01DLCGY1"  onchange="setRecalculate();amountRecalculate()"/> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Fecha Proximo Pago : </div>
            </td>
            <td nowrap width="15%" >
              <eibsinput:date name="lnBasic"  fn_month="E01DLCXM1" fn_day="E01DLCXD1" fn_year="E01DLCXY1"  onchange="setRecalculate();amountRecalculate()"/> 
            </td>
            <td nowrap width="22%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap colspan="2" >
            	<eibsinput:text property="E01DLCVA1" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="amountRecalculate();setRecalculate()"/> 
            </td>
          </tr>
       <% if(!lnBasic.getE01DLCIGA().equals("0.00")){ %>  
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Forma Cobro del periodo de Gracia :</div>
            </td>
            <td nowrap width="15%" >
				<select name="E01DLCIGF" id="E01DLCIGF" onchange="setRecalculate(); nCuotas();">
					<option value="" <%if (lnBasic.getE01DLCIGF().equals("") ) { out.print("selected"); }%>>Interes Deudor</option>
					<option value="1" <%if (lnBasic.getE01DLCIGF().equals("1")) { out.print("selected"); }%>>Prepaga los Intereses</option>
					<option value="2" <%if (lnBasic.getE01DLCIGF().equals("2")) { out.print("selected"); }%>>Cobrar en la 1ra Cuota</option>
					<option value="3" <%if (lnBasic.getE01DLCIGF().equals("3")) { out.print("selected"); }%>>Cobrar en NN Cuotas</option>
				</select>
            </td>
            <td nowrap width="22%" id="num1" style="display: none;">
            	<div align="right">Numero de Cutoas a Diferir :</div>
            </td>
            <td nowrap colspan="2" id="num2" style="display: none;">
            	<eibsinput:text property="E01DLCIGN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5"/> 
            </td>
            <td nowrap width="22%" id="num3" style="display: none;">
            </td>
            <td nowrap colspan="2" id="num4" style="display: none;">
            </td>
       </tr>  
       <% } %>          
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Valor Intereses del periodo de Gracia :</div>
            </td>
            <td nowrap width="15%" >
            	<eibsinput:text property="E01DLCIGA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 
            </td>
           	<td nowrap width="22%">
             		<div align="right">Recalcular Fecha Vencimiento :</div>
           	</td>
           	<td nowrap colspan="2">
               	<input type="checkbox" name="AmountSC1" id="AmountSC1" value="" onClick="UpdateAmountFlag(this.checked)" <% if (lnBasic.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%>>
           	</td>
       </tr>  
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Mes de NO Pago :</div>
            </td>
            <td nowrap width="15%" >
            	<eibsinput:text property="E01DLCMN1" name="lnBasic" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()"/>
            	<eibsinput:text property="E01DLCMN2" name="lnBasic" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()"/>
            	<eibsinput:text property="E01DLCMN3" name="lnBasic" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()"/>
            </td>
            <td nowrap width="22%" >
            	<div align="right">Abono Extraordinario :</div>
            </td>
            <td nowrap colspan="2" >
            	<input type="checkbox" name="E01FLGPEX" id="E01FLGPEX" value="" onClick="UpdateAbono(this.checked)" <% if (lnBasic.getE01FLGPEX().trim().equals("Y")) out.print(" checked disabled");%>> 
            </td>
          </tr>  
		<tr id="trclear">
			<td colspan="5"> 
				<table align="center" style="border: 0px; width: 75%; display: <%= ("Y".equals(FLGDIA) ? "table" : "none")  %>">
			    	<tr  height="5%"> 
		       		</tr>
			    	<tr  height="5%"> 
		      			<td width="100%">
		      				<table id="headTable" width="100%" > 
						        <tr id="trdark"> 
					        	    <th nowrap width="16.6%" align="center">Mes</th>
					    	        <th nowrap width="16.6%" align="center">Cuota (UVR)</th>
					        	    <th nowrap width="16.6%" align="center">Mes</th>
					    	        <th nowrap width="16.6%" align="center">Cuota (UVR)</th>
					        	    <th nowrap width="16.6%" align="center">Mes</th>
					    	        <th nowrap width="17%" align="center">Cuota (UVR)</th>
					       		</tr>
						        <tr id="trclear"> 
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic"  property="E01IDAM01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2" readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM05" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2" readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC05" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM09" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2" readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 17%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC09" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        </tr>
						        <tr id="trclear"> 
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM06" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC06" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM10" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 17%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC10" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        </tr>
						        <tr id="trclear"> 
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM07" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC07" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM11" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 17%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC11" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        </tr>
						        <tr id="trclear"> 
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM08" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC08" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM12" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 17%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC12" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        </tr>
				       		</table>
			       		</td>
		       		</tr>
		       	</table>
		     </td>
		    </tr>	
			<tr id="trclear">
			<td colspan="5"> 
				<table align="center" id="abono" style="border: 0px; height: 110px; display: none">
			    	<tr  height="5%"> 
		      			<td width="100%">
		      				<h5 align="center">Abono Extraordinario </h5>
		      				<table id="headTable" width="100%"> 
						        <tr id="trdark"> 
					        	    <th nowrap width="10%" align="center">Cuota</th>
					    	        <th nowrap width="15%" align="center">Monto</th>
					       		</tr>
				       		</table>
			       		</td>
		       		</tr>
				  	<tr height="95%">    
				    	<td nowrap="nowrap" >      
							<div id="dataDiv1" style="height:150px; width: 250px; overflow:auto;"> 
				        		<table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
						       		<% 	String seq="";
						       			for (int i=1;i<61;i++) {
							            if (i < 10) seq = "0"+i; else seq = ""+i;
						       		%>
						       			<tr id="trclear"> 
						            		<td nowrap width="10%" align="center">
						            			<%= i %>
						            			<input type=text name="<%="E01PENR"+seq%>" size="6" maxlength="5" value="<%=lnBasic.getFieldString("E01PENR"+seq) %>" onchange="setRecalculate()"> 
						            		</td>
						            		<td nowrap width="15%" align="center">
						            			<input type=text name="<%="E01PEAM"+seq%>" size="18" maxlength="15" class="txtright" value="<%=lnBasic.getFieldString("E01PEAM"+seq) %>" onchange="setRecalculate()"> 
						            		</td>
						          		</tr> 
						   		 	<%}%>
					   		 	</table>
					   		 </div>
			   		 	</td>
		   		 	</tr>
			 	</table>
			</td>
		</tr> 
        </table>
      </td>
    </tr>
  </table>
<%}%>
  
 <% if(DEAIPD.equals("SC2") && DEAPPD.equals("SC2")){ %>
  <h5 align="center"> Doble Esquema de Pago (SC2)</h5>
  <table class="tableinfo" >
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
              <input type="text" name="E01DLCOR1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCOR1().trim()%>" onchange="setRecalculate()">
              % </td>
            <td nowrap width="22%"> 
              <div align="right">Valor Capital :</div>
            </td>
            <td nowrap colspan="2">
            	<eibsinput:text property="E01DLCPP1" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate()"/> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">N&uacute;mero de Cuotas :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="E01DLCNC1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onchange="setRecalculate();amountRecalculate();wipeValorCuota();">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="22%" height="31"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2" height="31"> 
              <input type="text" name="E01DLCFP1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onchange="setRecalculate();amountRecalculate();wipeValorCuota();">
              <select name="E01DLCTP1"  onchange="setRecalculate();amountRecalculate();wipeValorCuota();">
                <option value=" " <% if (!(lnBasic.getE01DLCTP1().equals("D") ||lnBasic.getE01DLCTP1().equals("M")||lnBasic.getE01DLCTP1().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP1().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP1().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP1().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Fecha Proximo Pago : </div>
            </td>
            <td nowrap width="15%" >
              <eibsinput:date name="lnBasic"  fn_month="E01DLCXM1" fn_day="E01DLCXD1" fn_year="E01DLCXY1"  readonly="true" onchange="setRecalculate();amountRecalculate()"/> 
            </td>
            <td nowrap width="22%" > 
            </td>
            <td nowrap colspan="2" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" > 
            	<eibsinput:text property="E01DLCVA1" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate();amountRecalculate();"/> 
            </td>
           	<td nowrap width="22%">
             	<div align="right">Recalcular Fecha Vencimiento :</div>
           	</td>
           	<td nowrap colspan="2">
               	<input type="checkbox" name="AmountSC21" id="AmountSC21" value="" onClick="UpdateAmountFlag(this.checked)" <% if (lnBasic.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%>>
           	</td>
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
            	<eibsinput:text property="E01DLCOR2" name="lnBasic" size="4" maxlength="3" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" onchange="setRecalculate()" readonly="true"/> % 
           	</td>
            <td nowrap width="22%"> 
              <div align="right">Valor Capital :</div>
            </td>
            <td nowrap colspan="2"> 
            	<eibsinput:text property="E01DLCPP2" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate()" readonly="true"/>  
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%" height="31"> 
              <div align="right">N&uacute;mero de Cuotas :</div>
            </td>
            <td nowrap width="15%" height="31"> 
              <input type="text" name="E01DLCNC2" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC2().trim()%>" onchange="setRecalculate();amountRecalculate();">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
            </td>
            <td nowrap width="22%" > 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2" > 
              <input type="text" name="E01DLCFP2" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP2().trim()%>" onchange="setRecalculate();amountRecalculate();">
              <select name="E01DLCTP2" onchange="setRecalculate();amountRecalculate();">
                <option value=" " <% if (!(lnBasic.getE01DLCTP2().equals("D") ||lnBasic.getE01DLCTP2().equals("M")||lnBasic.getE01DLCTP2().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(lnBasic.getE01DLCTP2().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(lnBasic.getE01DLCTP2().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(lnBasic.getE01DLCTP2().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Fecha Proximo Pago : </div>
            </td>
            <td nowrap width="15%" >
              <eibsinput:date name="lnBasic"  fn_month="E01DLCXM2" fn_day="E01DLCXD2" fn_year="E01DLCXY2"  readonly="true" onchange="setRecalculate();amountRecalculate();"/> 
            </td>
            <td nowrap width="22%" > 
            </td>
            <td nowrap colspan="2" >
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="33%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap width="15%" > 
             	<eibsinput:text property="E01DLCVA2" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate();amountRecalculate();"/> 
            </td>
           	<td nowrap width="22%">
             	<div align="right">Recalcular Fecha Vencimiento :</div>
           	</td>
           	<td nowrap colspan="2">
               	<input type="checkbox" name="AmountSC22" id="AmountSC22" value="" onClick="UpdateAmountFlag(this.checked)" <% if (lnBasic.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%>>
           	</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <%}%>
  
 <% if(DEAIPD.equals("SC3") && DEAPPD.equals("SC3")){ %>
  <h5 align="center">Cuotas Niveladas (SC3) <%if("Y".equals(FLGDIA)) out.print(" Decreciente, Incremento Anual"); %> </h5>
  <table class="tableinfo" >
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%"> 
              <div align="right">Total de Cuotas :</div>
            </td>
            <td nowrap width="15%"> 
              <input type="text" name="E01DLCNC1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCNC1().trim()%>" onchange="amountRecalculate();setRecalculate();wipeValorCuota();">
            </td>
            <td nowrap width="22%"> 
              <div align="right">Frecuencia de Pagos :</div>
            </td>
            <td nowrap colspan="2">
              <input type="text" name="E01DLCFP1" size="4" maxlength="3" value="<%= lnBasic.getE01DLCFP1().trim()%>" onchange="amountRecalculate();setRecalculate();wipeValorCuota();">
              <select name="E01DLCTP1" onchange="amountRecalculate();setRecalculate();wipeValorCuota();">
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
              <eibsinput:date name="lnBasic"  fn_month="E01DLCPM1" fn_day="E01DLCPD1" fn_year="E01DLCPY1" onchange="setRecalculate();"/> 
            </td>
            <td nowrap width="22%" > 
              <div align="right">Per&iacute;odo de Gracia :</div>
            </td>
            <td nowrap colspan="2" > 
              <eibsinput:date name="lnBasic"  fn_month="E01DLCGM1" fn_day="E01DLCGD1" fn_year="E01DLCGY1" onchange="setRecalculate()"/> 
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
              <div align="right">Primera Fecha de Pago : </div>
            </td>
            <td nowrap width="15%" >
              <eibsinput:date name="lnBasic"  fn_month="E01DLCXM1" fn_day="E01DLCXD1" fn_year="E01DLCXY1" onchange="setRecalculate()"/> 
            </td>
            <td nowrap width="22%" > 
              <div align="right">Valor de la Cuota :</div>
            </td>
            <td nowrap colspan="2" >
            	<eibsinput:text property="E01DLCVA1" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="amountRecalculate();setRecalculate()"/> 
            </td>
          </tr>
       <% if(!lnBasic.getE01DLCIGA().equals("0.00")){ %>  
       <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Forma Cobro del periodo de Gracia :</div>
            </td>
            <td nowrap width="15%" >
				<select name="E01DLCIGF" id="E01DLCIGF" onchange="setRecalculate(); nCuotas();">
					<option value="" <%if (lnBasic.getE01DLCIGF().equals("") ) { out.print("selected"); }%>>Interes Deudor</option>
					<option value="1" <%if (lnBasic.getE01DLCIGF().equals("1")) { out.print("selected"); }%>>Prepaga los Intereses</option>
					<option value="2" <%if (lnBasic.getE01DLCIGF().equals("2")) { out.print("selected"); }%>>Cobrar en la 1ra Cuota</option>
					<option value="3" <%if (lnBasic.getE01DLCIGF().equals("3")) { out.print("selected"); }%>>Cobrar en NN Cuotas</option>
				</select>
            </td>
            <td nowrap width="22%" id="num1" style="display: none;">
            	<div align="right">Numero de Cutoas a Diferir :</div>
            </td>
            <td nowrap colspan="2" id="num2" style="display: none;">
            	<eibsinput:text property="E01DLCIGN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="6" maxlength="5"/> 
            </td>
            <td nowrap width="22%" id="num3" style="display: none;">
            </td>
            <td nowrap colspan="2" id="num4" style="display: none;">
            </td>
       </tr>  
       <% } %>          
        <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Valor Intereses del periodo de Gracia :</div>
            </td>
            <td nowrap width="15%" >
            	<eibsinput:text property="E01DLCIGA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 
            </td>
           	<td nowrap width="22%">
             		<div align="right">Recalcular Fecha Vencimiento :</div>
           	</td>
           	<td nowrap colspan="2">
               	<input type="checkbox" name="AmountSC3" id="AmountSC3" value="" onClick="UpdateAmountFlag(this.checked)" <% if (lnBasic.getE01FLGFVE().trim().equals("Y")) out.print(" checked disabled");%>>
           	</td>
       </tr>  
          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="33%" > 
                 <div align="right">Mes de NO Pago :</div>
            </td>
            <td nowrap width="15%" >
                <eibsinput:text property="E01DLCMN1" name="lnBasic" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()"/>
                <eibsinput:text property="E01DLCMN2" name="lnBasic" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()"/>
                <eibsinput:text property="E01DLCMN3" name="lnBasic" size="3" maxlength="2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" onchange="setRecalculate()"/>
            </td>
           	<td nowrap width="22%">
           	</td>
           	<td nowrap colspan="2">
           	</td>
          </TR>    
		<tr id="trclear">
			<td colspan="5"> 
				<table align="center" style="border: 0px; height: 110px; display: <%= ("Y".equals(FLGDIA) ? "table" : "none")  %>">
			    	<tr  height="5%"> 
		       		</tr>
			    	<tr  height="5%"> 
		      			<td width="100%">
		      				<table id="headTable" width="100%" > 
						        <tr id="trdark"> 
					        	    <th nowrap width="16.6%" align="center">Mes</th>
					    	        <th nowrap width="16.6%" align="center">Cuota (UVR)</th>
					        	    <th nowrap width="16.6%" align="center">Mes</th>
					    	        <th nowrap width="16.6%" align="center">Cuota (UVR)</th>
					        	    <th nowrap width="16.6%" align="center">Mes </th>
					    	        <th nowrap width="17%" align="center">Cuota (UVR)</th>
					       		</tr>
						        <tr id="trclear"> 
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC01" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM05" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC05" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM09" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 17%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC09" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        </tr>
						        <tr id="trclear"> 
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC02" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM06" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC06" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM10" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 17%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC10" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        </tr>
						        <tr id="trclear"> 
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC03" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM07" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC07" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM11" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 17%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC11" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        </tr>
						        <tr id="trclear"> 
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC04" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM08" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC08" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 16.6%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAM12" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" size="3" maxlength="2"  readonly="true" />
						        		</div>
						        	</td>
						        	<td nowrap="nowrap" style="width: 17%">
						        		<div align="center">
						        			<eibsinput:text name="lnBasic" property="E01IDAC12" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT_FEE%>"  readonly="true" />
						        		</div>
						        	</td>
						        </tr>
				       		</table>
			       		</td>
		       		</tr>
		       	</table>
		      </td>
		    </tr>                   
        </table>
      </td>
    </tr>
  </table>
  <%}%>

 <% if(isDEAIPDNum && DEAPPD.equals("SCH")){ %>
  <h5 align="center">Pagar el Inter&eacute;s seg&uacute;n Ciclo Preestablecido 
    y el Capital seg&uacute;n Plan de Pagos Irregular</h5>
 <%}%>
 
 <%if (DEAIPD.equals("SCH") && DEAPPD.equals("SCH")) { %> 
   <%if (!lnBasic.getE01DEAACC().trim().equals("999999999999") ){ %> 
     <% session.setAttribute("EMPPP","S"); %>
     <iframe id="ifremppp" frameborder="0" scrolling="no" height="184" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0155?SCREEN=2&E01DEAACC=<%=lnBasic.getE01DEAACC()%>"></iframe>
   <%}%>
 <%}%>

<% if ("N".equals(FLGNEW)){ %>

<% if ("Y".equals(ASSEST)){ %>

<% if(lnBasic.getE01FLGREF().equals("N")) {	%>
  <br>
  <!-- Seguros Financiados -->
  <% session.setAttribute("EMPSG","S"); %>
  <input type="hidden" name="SGTOT" id="SGTOT" value="0">
  <iframe id="ifrempsg" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&ACT=N&E01PSGCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PSGNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>

  <br>
  <!-- Cargos Adicionales -->
  <% session.setAttribute("EMPCA","S"); %>
  <input type="hidden" name="CAIMP" id="CAIMP" value="0">
  <input type="hidden" name="CACOM" id="CACOM" value="0">
  <input type="hidden" name="CADED" id="CADED" value="0">
  <input type="hidden" name="CAIVA" id="CAIVA" value="0">
  <iframe id="ifrempca" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&ACT=N&E01PVHCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PVHNUM=<%=lnBasic.getE01DEAOFN().trim()%>"> </iframe>

	<h4>Distribuci&oacute;n</h4> 
	<table class="tableinfo"  >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Monto del Cr&eacute;dito :</div>
						</td>
						<td nowrap width="20%"> 
							<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" onchange="updateAmount()"/> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Cr&eacute;dito Renegociados :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTCRN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Impuestos :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Comisiones :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTCOM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Deducciones :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTDED" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Seguros :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTSGR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">I.V.A. :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTIVA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">G.M.F. :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTGMF" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Otros Cargos :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTOTH" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
			   <%if (!lnBasic.getE01TOTPIN().trim().equals("0.00") ){ %> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="10%"></td>
						<td nowrap width="20%"> 
							<div align="right">Interes Prepagado :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01TOTPIN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>	
			   <%}%>
			   <%if (!lnBasic.getE01INTGRA().trim().equals("0.00") ){ %> 
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="10%"></td>
						<td nowrap width="20%"> 
							<div align="right">Pago Interes de Gracia :</div>
						</td>
						<td nowrap width="20%">
							 <eibsinput:text property="E01INTGRA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>	
			   <%}%>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right" style="font-weight: bold;">Monto Neto(Desembolso) :</div>
						</td>
						<td nowrap width="15%">
							 <eibsinput:text property="E01BALNET" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate()"/>
						</td>
						<td nowrap width="15%" style="font-weight: bold;">
							<div align="right">Saldo(Desembolso) :</div>
						</td>
						<td nowrap width="20%">
							<eibsinput:text property="SALNET" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
						</td>
						<td nowrap width="15%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="10%"></td>
						<td nowrap width="20%">
								<div align="right"><b>Recalcular</b></div>
						</td>
						<td nowrap width="20%">
								<input type="checkbox" name="RECALC" id="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnBasic.getE01FLGRCL().trim().equals("X")) out.print(" checked disabled");%>>
						</td>
						<td nowrap width="15%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="15%"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

  <br> 
  <!-- Desembolso -->
  <% session.setAttribute("EMPDS","S"); %>
  <input type="hidden" name="DSTOT" id="DSTOT" value="0">
  <iframe id="ifrempds" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=101&ACT=S&E01PVBCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PVBNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>  

	<% }else { %>
  <br>
  <!-- Seguros Financiados -->
  <% session.setAttribute("EMPSG","S"); %>
  <input type="hidden" name="SGTOT" id="SGTOT" value="0">
  <iframe id="ifrempsg" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1180?SCREEN=101&ACT=N&E01PSGCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PSGNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>  

  <br>
  <!-- Cargos Adicionales -->
  <% session.setAttribute("EMPCA","S"); %>
  <input type="hidden" name="CAIMP" id="CAIMP" value="0">
  <input type="hidden" name="CACOM" id="CACOM" value="0">
  <input type="hidden" name="CADED" id="CADED" value="0">
  <input type="hidden" name="CAIVA" id="CAIVA" value="0">
	<iframe id="ifrempca" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1165?SCREEN=101&ACT=N&E01PVHCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PVHNUM=<%=lnBasic.getE01DEAOFN().trim()%>"> </iframe>

	<h4>Distribuci&oacute;n</h4> 
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            		<td nowrap width="10%"> 
	              			<div align="right"></div>
	            		</td>
	            		<td nowrap width="10%">
	            		</td>
			            <td nowrap width="13%"> 
			              <div align="right">Monto del Cr&eacute;dito :</div>
			            </td>
	                    <td nowrap width="67%"> 
	            			<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="false"/> 
			            </td>
			          </tr>
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            		<td nowrap width="10%"> 
	              			<div align="right"></div>
	            		</td>
	            		<td nowrap width="10%">
	            		</td>
			            <td nowrap width="13%"> 
			              <div align="right">Cr&eacute;dito Reestructurado :</div>
			            </td>
	                    <td nowrap width="67%"> 
			            	 <eibsinput:text property="E01TOTCRN" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
			          </tr>
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            		<td nowrap width="10%"> 
	              			<div align="right"></div>
	            		</td>
	            		<td nowrap width="10%">
	            		</td>
			            <td nowrap width="13%"> 
			              <div align="right">Impuestos :</div>
			            </td>
	                    <td nowrap width="67%"> 
			            	 <eibsinput:text property="E01TOTIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
			          </tr>
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            		<td nowrap width="10%"> 
	              			<div align="right"></div>
	            		</td>
	            		<td nowrap width="10%">
	            		</td>
			            <td nowrap width="13%"> 
			              <div align="right">Comisiones :</div>
			            </td>
	                    <td nowrap width="67%"> 
			            	 <eibsinput:text property="E01TOTCOM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
			          </tr>
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            		<td nowrap width="10%"> 
	              			<div align="right"></div>
	            		</td>
	            		<td nowrap width="10%">
	            		</td>
			            <td nowrap width="13%"> 
			              <div align="right">Deducciones :</div>
			            </td>
	                    <td nowrap width="67%"> 
			            	 <eibsinput:text property="E01TOTDED" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
			          </tr>
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            		<td nowrap width="10%"> 
	              			<div align="right"></div>
	            		</td>
	            		<td nowrap width="10%">
	            		</td>
			            <td nowrap width="13%"> 
			              <div align="right">Seguros :</div>
			            </td>
	                    <td nowrap width="67%"> 
			            	 <eibsinput:text property="E01TOTSGR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
			          </tr>
			          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            		<td nowrap width="10%"> 
	              			<div align="right"></div>
	            		</td>
	            		<td nowrap width="10%">
	            		</td>
			            <td nowrap width="13%" style="font-weight: bold;"> 
			              <div align="right">Monto Neto :</div>
			            </td>
	                    <td nowrap width="67%"> 
			            	 <eibsinput:text property="E01BALNET" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			            </td>
			          </tr>
	  	              <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
	            		<td nowrap width="10%"> 
	              			<div align="right"></div>
	            		</td>
	            		<td nowrap width="10%">
	            		</td>
			            <td nowrap width="13%"> 
		              		<div align="right"><b>Recalcular</b></div>
		            	</td>
	                    <td nowrap width="67%"> 
		                	<input type="checkbox" name="RECALC" id="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnBasic.getE01FLGRCL().trim().equals("X")) out.print(" checked disabled");%>>
		            	</td>
		         	 </tr>
		  		</table>
	  		</td>
		</tr>
	</table>
	<% } %>
	
	<% }else{ %>

	<h4>Distribuci&oacute;n</h4> 
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Monto del Cr&eacute;dito :</div>
						</td>
						<td nowrap width="15%"> 
							<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="updateAmount()"/> 
							<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"  >
						</td>
						<td nowrap width="20%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="10%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
							<div align="right">Impuestos :</div>
						</td>
						<td nowrap width="15%"> 
							 <eibsinput:text property="E01TOTIMP" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
						</td>
						<td nowrap width="20%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="10%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%" style="font-weight: bold;"> 
							<div align="right">Monto Neto(Desembolso) :</div>
						</td>
						<td nowrap width="15%"> 
							 <eibsinput:text property="E01BALNET" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" onchange="setRecalculate()"/>
						</td>
						<td nowrap width="20%" style="font-weight: bold;">
							<div align="right">Saldo(Desembolso) :</div>
						</td>
						<td nowrap width="20%"> 
							<eibsinput:text property="SALNET" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true" />
						</td>
						<td nowrap width="10%"></td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="13%"></td>
						<td nowrap width="20%"> 
								<div align="right"><b>Recalcular</b></div>
						</td>
						<td nowrap width="15%"> 
								<input type="checkbox" name="RECALC" id="RECALC" value="" onClick="UpdateFlag(this.checked)" <% if (lnBasic.getE01FLGRCL().trim().equals("X")) out.print(" checked disabled");%>>
						</td>
						<td nowrap width="20%"></td>
						<td nowrap width="20%"></td>
						<td nowrap width="10%"></td>
					</tr>
		  		</table>
	  		</td>
		</tr>
	</table>

  <br> 
  <!-- Desembolso -->
  <% session.setAttribute("EMPDS","S"); %>
  <input type="hidden" name="DSTOT" id="DSTOT" value="0">
  <iframe id="ifrempds" frameborder="0" scrolling="no" height="200" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1100?SCREEN=101&ACT=S&E01PVBCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PVBNUM=<%=lnBasic.getE01DEAOFN().trim()%>"></iframe>  
	
	
<% } %>

<% }else{ %>

<h4>Saldos</h4> 
<table class="tableinfo" >
	<tr > 
		<td nowrap> 
			<table cellpadding=2 cellspacing=0 width="100%" border="0">
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="10%"> 
              			<div align="right"></div>
            		</td>
            		<td nowrap width="10%">
            		</td>
		            <td nowrap width="13%"> 
		              <div align="right">Monto Inicial :</div>
		            </td>
                    <td nowrap width="67%"> 
            			<eibsinput:text property="E01DEAOAM" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="10%"> 
              			<div align="right"></div>
            		</td>
            		<td nowrap width="10%">
            		</td>
		            <td nowrap width="13%"> 
		              <div align="right">Saldo Capital :</div>
		            </td>
                    <td nowrap width="67%"> 
		            	 <eibsinput:text property="E01SALPRI" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
				<% if ("R".equals(lnBasic.getH01FLGWK3())){ %>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="10%"> 
              			<div align="right"></div>
            		</td>
            		<td nowrap width="10%">
            		</td>
		            <td nowrap width="13%"> 
		              <div align="right">Saldo Reajuste :</div>
		            </td>
                    <td nowrap width="67%"> 
		            	 <eibsinput:text property="E01SALREA" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <%}%>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="10%"> 
              			<div align="right"></div>
            		</td>
            		<td nowrap width="10%">
            		</td>
		            <td nowrap width="13%"> 
		              <div align="right">Saldo Intereses :</div>
		            </td>
                    <td nowrap width="67%"> 
		            	 <eibsinput:text property="E01SALINT" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="10%"> 
              			<div align="right"></div>
            		</td>
            		<td nowrap width="10%">
            		</td>
		            <td nowrap width="13%"> 
		              <div align="right">Saldo Mora :</div>
		            </td>
                    <td nowrap width="67%"> 
		            	 <eibsinput:text property="E01SALMOR" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="10%"> 
              			<div align="right"></div>
            		</td>
            		<td nowrap width="10%">
            		</td>
		            <td nowrap width="13%"> 
		              <div align="right">Otros Cargos :</div>
		            </td>
                    <td nowrap width="67%"> 
		            	 <eibsinput:text property="E01SALOTH" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
		          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            		<td nowrap width="10%"> 
              			<div align="right"></div>
            		</td>
            		<td nowrap width="10%">
            		</td>
		            <td nowrap width="13%"> 
		              <div align="right">Total Deuda :</div>
		            </td>
                    <td nowrap width="67%"> 
		            	 <eibsinput:text property="E01SALDUE" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
		            </td>
		          </tr>
	  		</table>
  		</td>
	</tr>
</table>

<% } %>

<% if ("Y".equals(FLGFND) && "N".equals(FLGNEW)){ %>
  <!-- Fomento -->
  
  <h4>Fomento - Credito Pasivo</h4> 

<%int rowF = 0;%>  
<table class="tableinfo" >
	<tr > 
		<td nowrap> 
			<table cellpadding=2 cellspacing=0 width="100%" border="0">
				<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
         				 <div align="right" style="font-weight: bold;">Plan de Fomento :</div>
					</td>
					<td width="75%" nowrap="nowrap" colspan="3">
		              	<eibsinput:text name="lnBasic" property="E01PFNCOD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true" onchange="setRecalculate();rateDisplay(passiveProductRates);" />
						<a href="javascript: GetFomento('E01PFNCOD', document.forms[0].E01DEABNK.value, document.forms[0].E01DEAPRO.value, 'E01PFNDSC',
														'E01PFNCUP', 'E01PFNCNM', 'E01PFNPRD', 'E01PFNFTB', 'E01PFNFTY','E01PFNBNK', 'E01PFNBRN',
														'E01PFNOBK','E01PFNOBR', 'E01PFNOCY', 'E01PFNOGL','E01PDSPRD','E01PLGFLT','E01PLTDSC')"> 
							<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0"></a>
		              	<eibsinput:text name="lnBasic" property="E01PFNDSC" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
					</td>
    	        </tr>
				<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
		              <div align="right">Codigo de Producto :</div>
					</td>
					<td width="75%" nowrap="nowrap" colspan="3">
              			<eibsinput:text name="lnBasic" property="E01PFNPRD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT%>" readonly="true" />
              			&nbsp;
		              	<eibsinput:text name="lnBasic" property="E01PDSPRD" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
					</td>
    	        </tr>
				<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
		              <div align="right">Cliente Fomento :</div>
					</td>
					<td width="75%" nowrap="nowrap" colspan="3">
		              	<eibsinput:text name="lnBasic" property="E01PFNCUP" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER%>" readonly="true" />
		              	&nbsp;
		              	<eibsinput:text name="lnBasic" property="E01PFNCNM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true" />
					</td>
    	        </tr>
				<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
		              <div align="right">Prestamo Pasivo :</div>
					</td>
					<td width="25%" nowrap="nowrap">
		                <input type="text" name="E01PFNPAC" size="14" maxlength="12"  readonly value="<% if (lnBasic.getE01PFNPAC().trim().equals("999999999999")) out.print("NUEVA CUENTA"); else out.print(lnBasic.getE01PFNPAC().trim()); %>">
					</td>
					<td width="25%" nowrap="nowrap">
		              <div align="right">Tabla Tasa Flotante :</div>
					</td>
					<td width="25%" nowrap="nowrap">
             		 <div align="left">
		            	<eibsinput:help name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" 
		            	                fn_param_one="E01PFNFTB" 
		            	                fn_param_two="E01PLGFLT" 
		            	                fn_param_three="E01PLTDSC" 
		            	                fn_param_four="PRIMARYRATE_FOMENTO" 
		            	                fn_param_five="SECONDARYRATE_FOMENTO" 
		            	                fn_param_six="E01PFNFTY" 
		            	                property="E01PFNFTB" help="<%=HelpTypes.FLOATING_RATE_TABLES%>" onchange="setRecalculate();rateDisplay(passiveProductRates);"/>       	
		               <select name="E01PFNFTY" id="E01PFNFTY" onchange="setRecalculate();rateDisplay(passiveProductRates);totalRate(passiveProductRates)"> 
		                <option value=" " <% if (!(lnBasic.getE01PFNFTY().equals("FP") || lnBasic.getE01PFNFTY().equals("FS"))) out.print("selected"); %>></option>
		                <option value="FP" <% if (lnBasic.getE01PFNFTY().equals("FP")) out.print("selected"); %>>FP</option>
		                <option value="FS" <% if (lnBasic.getE01PFNFTY().equals("FS")) out.print("selected"); %>>FS</option>
		              </select>             	
		              </div>
					</td>
    	        </tr>
	          <tr id="FLOATINGTABLE_FOMENTO2" class="<%=(rowF % 2 == 1) ? "trdark" : "trclear"%><%rowF++;%>" style="display: none;">
	            <td> 
	              <div align="right">Descripcion Tabla Flotante :</div>
	            </td>
	            <td> 
	            	<eibsinput:text property="E01PLTDSC" name="lnBasic" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME%>" readonly="true" />  
	            </td>
	            <td> 
	              <div align="right">Tasa Flotante Base :</div>
	            </td>
	            <td nowrap>
					<%if(lnBasic.getE01PLGFLT().equals("2")){%>
	  					<INPUT TYPE=HIDDEN NAME="PRIMARYRATE_FOMENTO" id="PRIMARYRATE_FOMENTO" VALUE="<%=lnBasic.getE01PLTORG().trim()%>">
				  		<INPUT TYPE=HIDDEN NAME="SECONDARYRATE_FOMENTO" id="SECONDARYRATE_FOMENTO" VALUE="<%=lnBasic.getE01PLTORG().trim()%>">
				  	<%}else{%>
	  					<INPUT TYPE=HIDDEN NAME="PRIMARYRATE_FOMENTO" id="PRIMARYRATE_FOMENTO" VALUE="<%=lnBasic.getE01PFNFRT().trim()%>">
				  		<INPUT TYPE=HIDDEN NAME="SECONDARYRATE_FOMENTO" id="SECONDARYRATE_FOMENTO" VALUE="<%=lnBasic.getE01PFNFRT().trim()%>">
				  	<%}%>
	            	<eibsinput:text property="E01PLTORG" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" readonly="true" />
	            </td>
	          </tr>
	          <tr id="FLOATINGTABLE_FOMENTO" class="<%=(rowF % 2 == 1) ? "trdark" : "trclear"%><%rowF++;%>" style="display: none"> 
	            <td> 
	              <div align="right">Manejo Puntos Adicional  :</div>
	            </td>
	            <td nowrap width="25%" > 
		             <select name="E01PFNFLX" onclick="setRecalculate()" >
		              <OPTION value=" " <% if (!(lnBasic.getE01PFNFLX().equals("B") ||lnBasic.getE01PFNFLX().equals("E")||lnBasic.getE01PFNFLX().equals("N"))) out.print("selected"); %>></OPTION>
		              <OPTION value="B" <% if(lnBasic.getE01PFNFLX().equals("B")) out.print("selected");%>>+/- Tasa Base</OPTION>
		              <OPTION value="E" <% if(lnBasic.getE01PFNFLX().equals("E")) out.print("selected");%>>+/- Tasa Efectiva</OPTION>
		              <OPTION value="N" <% if(lnBasic.getE01PFNFLX().equals("N")) out.print("selected");%>>+/- Tasa Nominal</OPTION>
		             </select>
		      	</td>
		      	<td> 
	              <div align="right">Valor Tasa Adicional :</div>
	            </td>
	            <td nowrap width="25%"> 
	            	<eibsinput:text property="E01PFNRTX" name="lnBasic" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE %>" onchange="setRecalculate();totalRate(passiveProductRates)"/>
	            </td>
	          </tr>
				<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
           			   <div align="right">Monto Original :</div>
					</td>
					<td width="25%" nowrap="nowrap">
		              	<eibsinput:text name="lnBasic" property="E01PFNOAM" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="false" />
					</td>
					<td width="25%" nowrap="nowrap">
           			   <div align="right">Tasa Flotante :</div>
					</td>
					<td width="25%" nowrap="nowrap">
              			<eibsinput:text name="lnBasic" property="E01PFNFRT" type="<%=EibsFields.EIBS_FIELD_TYPE_SIGN_DECIMAL%>" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true" />
					</td>
    	        </tr>
				<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
              			<div align="right">Valor de Cuota :</div>
					</td>
					<td width="25%" nowrap="nowrap">
              			<eibsinput:text name="lnBasic" property="E01PFNVCU" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
					</td>
					<td width="25%" nowrap="nowrap">
           			   <div align="right">Tasa Fomento/Spread :</div>
					</td>
					<td width="25%" nowrap="nowrap">
        		      	<eibsinput:text name="lnBasic" property="E01PFNRTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>"  onchange="setRecalculate();totalRate(passiveProductRates)"  />
					</td>
    	        </tr>
				<tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
          			    <div align="right">Comision :</div>
					</td>
					<td width="25%" nowrap="nowrap">
              			<eibsinput:text name="lnBasic" property="E01PFNVCO" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
					</td>	
					<td width="25%" nowrap="nowrap">
          			    <div align="right">Tasa del Prestamo :</div>
					</td>
					<td width="25%" nowrap="nowrap">
            		  	<eibsinput:text name="lnBasic" property="E01PTORTE" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"  />
					</td>
    	        </tr>
  	            <tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
         			     <div align="right">Banco/Surcusal :</div>
					</td>
					<td width="25%" nowrap="nowrap">
		              	<eibsinput:text name="lnBasic" property="E01PFNBNK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" />
						<eibsinput:help name="lnBasic" property="E01PFNBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" 
		 	 				fn_param_one="E01PFNBRN" fn_param_two="document.forms[0].E01PFNBNK.value" />              	
					</td>
					<td width="25%" nowrap="nowrap">
             		 	<div align="right">Tasa Efectiva :</div>
					</td>
					<td width="25%" nowrap="nowrap">
            		  	<eibsinput:text name="lnBasic" property="E01PFNSPR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_RATE%>" readonly="true"  />
					</td>			
	            </tr>
  	            <tr class="<%= (rowF % 2 == 1) ? "trdark" : "trclear" %><%rowF++;%>">
					<td width="25%" nowrap="nowrap">
             		 	<div align="right">Cuenta de Desembolso :</div>
					</td>
					<td width="25%" nowrap="nowrap">
		              	<eibsinput:text name="lnBasic" property="E01PFNOBK" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="true" />
		              	<eibsinput:text name="lnBasic" property="E01PFNOBR" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BRANCH%>" readonly="true" />
		              	<eibsinput:text name="lnBasic" property="E01PFNOCY" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" readonly="true" />
		              	<eibsinput:text name="lnBasic" property="E01PFNOGL" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" readonly="true" />
					</td>			
					<td width="25%" nowrap="nowrap">
         			     <div align="right"></div>
					</td>
					<td width="25%" nowrap="nowrap">
					</td>
	            </tr>
	  		</table>
  		</td>
	</tr>
</table> 
<%--   
   <% //session.setAttribute("EMPFM","S"); %>
  	   <iframe id="ifrempfm" frameborder="0" scrolling="no" height="235" width="100%" src="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV1130?SCREEN=100&ACT=S&E01PFNCUN=<%=lnBasic.getE01DEACUN().trim()%>&E01PFNNUM=<%=lnBasic.getE01DEAOFN().trim()%>&E01PFNACC=<%=lnBasic.getE01DEAACC().trim()%>&E01PFNCNM=<%=lnBasic.getE01CUSNA1().trim()%>"></iframe>  
 
 --%> <% } %>


  <!-- Reajuste por Correcci&oacute;n Monetaria -->
<%if (!lnBasic.getE01DEAACC().trim().equals("999999999999")) {%>
<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=lnBasic.getH01FLGWK3()%>" />
</jsp:include>
<%}%>


<% if ("Y".equals(ASSEST)){ %>
<h4>Garantias</h4>
  <TABLE  id="mainTable" class="tableinfo" style="height:106px;">
    <tr  height="5%"> 
      <td NOWRAP valign="top" width="100%"> 
		<table id="headTable" width="98%">
			<tr id="trdark">
	            <th nowrap width="16%" align="center">Cuenta</th>
	            <th nowrap width="7%"  align="center">Prod</th>
	            <th nowrap width="30%" align="center">Nombre</th>
	            <th nowrap width="7%"  align="center">Moneda</th>
	            <th nowrap width="20%" align="center">Monto Garantizado</th>
	            <th nowrap width="20%" align="center">Valor del bien</th>
			</tr>
        </table>
      </td>
    </tr>    
		  <tr  height="95%">    
		    <td nowrap="nowrap">      
		       <div id="dataDiv1" style="height:106px; overflow:auto;"> 
		       <table id="dataTable" cellspacing="0" cellpadding="1" border="0" width="100%">         
          <%
           for (int i=1;i<10;i++) {
          %> 
          <tr id="trclear"> 
            <td nowrap width="16%" align="center"> 
   				<%= i %>
				<input type=text name="<%="E01CLACB"+i%>" size="13" maxlength="12" value="<%=lnBasic.getFieldString("E01CLACB"+i) %>" 
				class="context-menu-help" onmousedown="init(accountCustomerHelp,this.name,document.forms[0].E01DEABNK.value,'',document.forms[0].E01DEACUN.value,'','91')">			</td>
            <td nowrap width="7%"  align="center"> 
				<input type="text" name="<%="E01CLTYB"+i %>" size="5" maxlength="4" value="<%=lnBasic.getFieldString("E01CLTYB"+i) %>" readonly>
			</td>
            <td nowrap width="30%" align="center"> 
            	<input type="text" name="<%="E01CLDSC"+i %>" size="46" maxlength="45" value="<%=lnBasic.getFieldString("E01CLDSC"+i) %>" readonly> 
           	</td>
            <td nowrap width="7%"  align="center"> 
            	<input type="text" name="<%="E01CLCCY"+i %>" size="4" maxlength="3" value="<%=lnBasic.getFieldString("E01CLCCY"+i) %>" readonly>  
            </td>
            <td nowrap width="20%" align="center"> 
            	<input type="text" class="txtright" name="<%="E01CLAMT"+i %>" size="19" maxlength="18" value="<%=lnBasic.getFieldString("E01CLAMT"+i) %>">  
            </td>
            <td nowrap width="20%" align="center"> 
                <input type="text" class="txtright" name="<%="E01CLBOP"+i %>" size="19" maxlength="18" value="<%=lnBasic.getFieldString("E01CLBOP"+i) %>" readonly>  
            </td>
          </tr> 
   		  <%}%>
        </table>
      </div>
	 </td>
	</tr>
 </table>
<% } %>


<% if(error.getERWRNG().equals("Y")){%>
   <h4 style="text-align:center"><input type="checkbox" name="H01FLGWK2" value="A" <% if(lnBasic.getH01FLGWK2().equals("A")){ out.print("checked");} %> >Aceptar con Aviso</h4>
<% } %> 

<table class="tbenter" >
	<tr > 
	<td width="10%"> 
    	<div align="center"> 
  			<p> <input class="EIBSBTN" type="button" name="Submit"   value="Enviar" onclick="submitPage(this)"> </p>
		</div>
	</td>
    </tr>
</table>

<SCRIPT type="text/javascript">
	if (isValidObject(getElement("hiddenDivNew"))) {
		document.getElementById("hiddenDivNew").onclick = cancelBub;
	}


function forma() {
	cuentas();
	nCuotas();
	goSubsidizedRate(); 
}

function reloadIFrame(name) {		// Esta funcion se llama desde los iframes
	if (isValidObject(document.getElementById(name))) {
		var iframe = document.getElementById(name);
		var source = iframe.src.replace("ACT=N", "ACT=S");;
		iframe.src = source;
	}
}


var activeProductRates = new FloatRate('E01FLGFLT', 'E01DEAFTB', 'E01DEAFTY',  'FLOATINGTABLE', 'FLOATINGTABLE2', 'E01DEARTE', 'E01FLTORG', 'E01FLTRTE', 'PRIMARYRATE', 'SECONDARYRATE', 'E01LNSRTE', 'E01DEAFLX', 'E01DEARTX','Basic Information');
var passiveProductRates = new FloatRate('E01PLGFLT', 'E01PFNFTB', 'E01PFNFTY',  'FLOATINGTABLE_FOMENTO', 'FLOATINGTABLE_FOMENTO2', 'E01PFNRTE', 'E01PLTORG', 'E01PFNFRT', 'PRIMARYRATE_FOMENTO', 'SECONDARYRATE_FOMENTO', 'E01PTORTE', 'E01PFNFLX', 'E01PFNRTX');

</SCRIPT>

</form>  
</body>
</html>
 