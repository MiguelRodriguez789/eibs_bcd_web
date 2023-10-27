<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Información Básica de Lineas de Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="clMant" class="datapro.eibs.beans.ELN000001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
<%
	boolean b_read_only1 = false;
%>
<%
	if (userPO.getPurpose().equals("INQUIRY")) {
		b_read_only1 = true;
	}
%>
function clearName() {
	document.getElementById("E01RCUNA1").value = "";
}
function updRelCust(type) {
	if (type == "????") { 
		type = document.getElementById("E01WLNTYL").value;
	}
	
	var divRelCust = document.getElementById("RelatedCust");
	if (type == "DEUD") {
		divRelCust.style.display="";
		}
	else {
		divRelCust.style.display="none";
	}
	if (type == "FGAR") { 
		hideDiv('DivFondo',false);
	}else{
		hideDiv('DivFondo',true);
	}
}

   builtNewMenu(cl_m_opt);
   initMenu(); 
   
   
function hideDiv(fld, value){
 if (value) {
   eval(fld+".style.display='none'");
   } else{
   eval(fld+".style.display=''");
   }
}
function goAction(type,op) {
	var SCREEN = "200";
	var OPECOD = "0025";
	var E01TB5MXD = document.forms[0].E01WLNAMN.value;
	var E01TB5CFG = document.forms[0].E01WLNSIC.value;
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSERA0088?SCREEN="+SCREEN+"&OPECOD="+OPECOD+"&E01TB5CFG="+E01TB5CFG+"&E01TB5MXD="+E01TB5MXD;
	CenterNamedWindow(page,'Information',1200,500,2);
}
</SCRIPT>

</head>

<body onload="updateDate('<%=clMant.getE01WLNFL1().trim()%>')">


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center">Lineas de Cr&eacute;dito - Informaci&oacute;n B&aacute;sica
	<%if (clMant.getE01GRPFLG().equals("G")) { out.print("<BR> Grupo"); %> <%= clMant.getE01GRPNUM()%> - <%= clMant.getE01GRPNA1() %> - Nivel <%= clMant.getE01GRPLVL() %> <%} %>
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_maint,ELN0000"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="OPTION" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E01GRPNUM" VALUE="<%=clMant.getE01GRPNUM()%>">
  <INPUT TYPE=HIDDEN NAME="E01GRPLVL" VALUE="<%=clMant.getE01GRPLVL()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="13%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
       	       <eibsinput:text 	name="clMant" property="E01WLNCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
 			  </div>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><b>Linea : </b></div>
            </td>
            <td nowrap width="17%" > 
       	       <eibsinput:text 	name="clMant" property="E01WLNNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE %>" readonly="true"/>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
       	       <eibsinput:text 	name="clMant" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
                </div>
            </td>
          </table>
          <table id="RelatedCust" style=display:"none" cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          </tr>
           <tr id="trdark" > 
            <td nowrap width="13%" > 
              <div align="right"><b>Cliente Cedente:</b></div>
            </td>
            <td nowrap width="20%" > 
	              <eibsinput:help name="clMant" property="E01WLNRAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" 
	              fn_param_one="E01WLNRAC" fn_param_two="E01ACPNA1" onblur="clearName()" required="true"/>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><b>Linea del Cedente: </b></div>
            </td>
            <td nowrap width="17%" > 
       	       <eibsinput:help name="clMant" property="E01WLNCD3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE%>" 
               	    	fn_param_one="E01WLNCD3" fn_param_two="document.forms[0].E01WLNRAC.value" required="true"/>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><b>Nombre del Deudor:</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2"> 
       	       <eibsinput:text 	name="clMant" property="E01ACPNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
                </font></font></font></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Datos B&aacute;sicos</h4>
      <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Banco / Sucursal :</div>
            </td>
            <td nowrap width="28%" > 
       	       <eibsinput:text 	name="clMant" property="E01WLNBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
                <eibsinput:help name="clMant" property="E01WLNBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" required="true"
               	    	fn_param_one="E01WLNBRN" fn_param_two="document.forms[0].E01WLNBNK.value"/>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Comprometida o No :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="hidden" name="E01WLNCOU" value="<%= clMant.getE01WLNCOU()%>">
              <input type="radio" name="CE01WLNCOU" value="C" onClick="document.forms[0].E01WLNCOU.value='C'"
			  <%if(clMant.getE01WLNCOU().equals("C")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01WLNCOU" value="U" onClick="document.forms[0].E01WLNCOU.value='U'"
			  <%if(clMant.getE01WLNCOU().equals("U")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Moneda / Cuenta Contable :</div>
            </td>
            <td nowrap width="28%" > 
                <eibsinput:help name="clMant" property="E01WLNCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" 
               	    	fn_param_one="E01WLNCCY" fn_param_two="document.forms[0].E01WLNBNK.value"/>
                <eibsinput:help name="clMant" property="E01WLNGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" 
               	    	fn_param_one="E01WLNGLN" fn_param_two="document.forms[0].E01WLNBNK.value" fn_param_three="document.forms[0].E01WLNCCY.value" fn_param_four="90"/>
			</td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="24%" > 
				<eibsinput:date name="clMant" fn_year="E01WLNOPY" fn_month="E01WLNOPM" fn_day="E01WLNOPD" required="true" />
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="28%" > 
				<eibsinput:date name="clMant" fn_year="E01WLNMTY" fn_month="E01WLNMTM" fn_day="E01WLNMTD" required="true" />
            </td>
            <td nowrap width="24%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="24%" > 
				<eibsinput:help name="clMant" property="E01WLNCCS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_COST_CENTER%>" 
               	    	fn_param_one="E01WLNCCS" fn_param_two="document.forms[0].E01WLNBNK.value"/>
            </td>
          </tr>
          
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="28%" > 
       	       <eibsinput:text 	name="clMant" property="E01WLNTER" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_TERM %>" />
              <select name="E01WLNTRC">
                <option value=" " <% if (!(clMant.getE01WLNTRC().equals("D") ||clMant.getE01WLNTRC().equals("M")||clMant.getE01WLNTRC().equals("Y"))) out.print("selected"); %>></option>
                <option value="D" <% if(clMant.getE01WLNTRC().equals("D")) out.print("selected");%>>D&iacute;a(s)</option>
                <option value="M" <% if(clMant.getE01WLNTRC().equals("M")) out.print("selected");%>>Mes(es)</option>
                <option value="Y" <% if(clMant.getE01WLNTRC().equals("Y")) out.print("selected");%>>A&ntilde;o(s)</option>
              </select>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Autorizaci&oacute;n :</div>
            </td>
            <td nowrap width="24%" > 
				<eibsinput:date name="clMant" fn_year="E01WLNAUY" fn_month="E01WLNAUM" fn_day="E01WLNAUD" required="true" />
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Tipo de Autorizaci&oacute;n :</div>
            </td>
            <td nowrap width="28%" > 
				<input type="text" name="E01WLNATY" size="2" maxlength="3" value="<%= clMant.getE01WLNATY().trim()%>">            
					<A href="javascript:GetCodeCNOFC('E01WLNATY','A4')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0">
					</A>
			</td>
            <td nowrap width="24%" > 
              <div align="right">Tipo de Linea :</div>
            </td>
            <td nowrap width="24%" >
            	<input type="text" id="E01WLNTYL" name="E01WLNTYL" maxlength="4" size="5" value="<%=clMant.getE01WLNTYL()%>" 
            		 onchange="updRelCust(this.value) " class="txtright" <% if (clMant.getE01FLGTYL().equals("Y")) { out.print("readonly"); } %>>
            		 <% if (!clMant.getE01FLGTYL().equals("Y")) { %>
            			<a id="linkHelp" href="javascript:GetCodeDescCNOFC('E01WLNTYL', '','14')">
            				<img src="<%=request.getContextPath()%>/images/1b.gif" align="bottom" border="0"/></a>
            		<% } %>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Categor&iacute;a de la Linea :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01WLNCAT" size="2" maxlength="1" value="<%= clMant.getE01WLNCAT().trim()%>" >
              <a href="javascript:GetCode('E01WLNCAT','STATIC_cl_cat.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Revisi&oacute;n :</div>
            </td>
            <td nowrap width="24%" > 
				<eibsinput:date name="clMant" fn_year="E01WLNRVY" fn_month="E01WLNRVM" fn_day="E01WLNRVD" />
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" height="22" > 
              <div align="right">Importe Aprobado :</div>
            </td>
            <td nowrap width="28%" height="22" > 
			    <eibsinput:text name="clMant" property="E01WLNAMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true"/>
            </td>
            <td nowrap width="24%" height="22" > 
              <div align="right">Fecha de Reasignaci&oacute;n :</div>
            </td>
            <td nowrap width="24%" height="22" > 
				<eibsinput:date name="clMant" fn_year="E01WLNREY" fn_month="E01WLNREM" fn_day="E01WLNRED" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Monto de Reasignaci&oacute;n :</div>
            </td>
            <td nowrap width="28%" > 
			    <eibsinput:text name="clMant" property="E01WLNREA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" />
            </td>
            <td nowrap width="24%" > 
              <div align="right">Operaci&oacute;n en otra Moneda :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="hidden" name="E01WLNMUB" value="<%= clMant.getE01WLNMUB()%>">
              <input type="radio" name="CE01WLNMUB" value="Y" onClick="document.forms[0].E01WLNMUB.value='Y'"
			  <%if(clMant.getE01WLNMUB().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01WLNMUB" value="N" onClick="document.forms[0].E01WLNMUB.value='N'"
			  <%if(clMant.getE01WLNMUB().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Autorizada por :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01WLNABY" size="45" maxlength="45" value="<%= clMant.getE01WLNABY().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Indicador T&eacute;rmino :</div>
            </td>
            <td nowrap width="24%" > 
              <select name="E01WLNTRM">
                <option value=" " <% if (!(clMant.getE01WLNTRM().equals("D") ||clMant.getE01WLNTRM().equals("M")||clMant.getE01WLNTRM().equals("Y"))) out.print("selected"); %>></option>
                <option value="L" <% if(clMant.getE01WLNTRM().equals("L")) out.print("selected");%>>Largo 
                Plazo</option>
                <option value="S" <% if(clMant.getE01WLNTRM().equals("S")) out.print("selected");%>>Corto 
                Plazo</option>
                <option value="T" <% if(clMant.getE01WLNTRM().equals("T")) out.print("selected");%>>Tomadas 
                a Corresponsal</option>
              </select>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Cliente / Linea Relacionada :</div>
            </td>
            <td nowrap width="28%" > 
            <div align="left">
                <input type="text" name="E01WLNCGM" size="10" maxlength="9" <% if (clMant.getE01FLGCGM().equals("Y")) { out.print("readonly"); } %>
                		value="<%= clMant.getE01WLNCGM().trim()%>" onKeypress="enterInteger(event)">
                		<%if (clMant.getE01GRPFLG().equals("G")) { %>
                			<!-- <a href="javascript:GetCustomerGroupLevel('E01WLNCGM',document.forms[0].E01GRPNUM.value,document.forms[0].E01GRPLVL.value)">
                			<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>  -->
               		 <% } else { %>
                			<a href="javascript:GetCustomer('E01WLNCGM')">
                		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
                <% } %>
           		<input type=TEXT name="E01WLNLGM" size=5 maxlength=4 <% if (clMant.getE01FLGLGM().equals("Y")) { out.print("readonly"); } %>
           			 value="<%= clMant.getE01WLNLGM().trim()%>" onKeypress="enterInteger(event)">
            		<% if (!clMant.getE01FLGLGM().equals("Y") ) { %>
            		<a href="javascript:GetCreditLine('E01WLNLGM',document.forms[0].E01WLNCGM.value)">
            		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" >
            		<% } %>
            	</a>
            	
           </div>   	    	
               	    	
            </td>
            <td nowrap width="24%" > 
              <div align="right">Linea de Control :</div>
            </td>
              <td nowrap width="24%" > 
       	       <eibsinput:text 	name="clMant" property="E01WLNCCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" />
				<eibsinput:help name="clMant" property="E01WLNCLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE%>" 
               	    	fn_param_one="E01WLNCLN" fn_param_two="document.forms[0].E01WLNCCU.value"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Indice de Cobertura de la Garantía :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01WLNFL4" size="10" maxlength="9" value="<%= clMant.getE01WLNFL4().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="24%" > 
              <div align="right"> </div>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
  <h4>Tarifas</h4>
  <table class="tableinfo">
    <tr "> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para Prestamos :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01WLNTLN" size="3" maxlength="2" value="<%= clMant.getE01WLNTLN().trim()%>" >
              <a href="javascript:GetLoanTable('E01WLNTLN','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0" ></a> 
            </td>
            <td nowrap width="21%" > 
              <div align="right">Tasa de Inter&eacute;s :</div>
            </td>
            <td nowrap width="20%" > 
			    <eibsinput:text name="clMant" property="E01WLNORT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para L/C :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01WLNTLC" size="3" maxlength="2" value="<%= clMant.getE01WLNTLC().trim()%>" >
              <a href="javascript:GetTariffLC('E01WLNTLC','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0" ></a> 
            </td>
            <td nowrap width="21%" > 
              <div align="right">Tasa D&iacute;as Gracia :</div>
            </td>
            <td nowrap width="20%" > 
			    <eibsinput:text name="clMant" property="E01WLNMRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para Cta./ Cte. :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01WLNTRT" size="3" maxlength="2" value="<%= clMant.getE01WLNTRT().trim()%>" >
              <a href="javascript:GetRetCod('E01WLNTRT','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0" ></a> 
            </td>
            <td nowrap width="21%" > 
              <div align="right">D&iacute;as Gracia Inter&eacute;s :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01WLNMXT" size="4" maxlength="3" value="<%= clMant.getE01WLNMXT().trim()%>" onKeypress="enterInteger(event)" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla / Tipo Tasa Flotante :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01WLNFTB" size="3" maxlength="2" value="<%= clMant.getE01WLNFTB().trim()%>">
              <a href="javascript:GetFloating('E01WLNFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Tabla de Tasas Flotantes" align="middle" border="0" ></a> 
              <select name="E01WLNFTY">
                <option value=" " <% if (!(clMant.getE01WLNFTY().equals("FP") ||clMant.getE01WLNFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (clMant.getE01WLNFTY().equals("FP")) out.print("selected"); %>>Primaria</option>
                <option value="FS" <% if (clMant.getE01WLNFTY().equals("FS")) out.print("selected"); %>>Secundaria</option>
              </select>
            </td>
            <td nowrap width="21%" > 
              <div align="right">Nivel Cr&eacute;dito Cliente :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01WLNCRR" size="2" maxlength="1" value="<%= clMant.getE01WLNCRR().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Prop&oacute;sito de L&iacute;nea :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01WLNPUR" size="45" maxlength="60" value="<%= clMant.getE01WLNPUR().trim()%>">
            </td>
            <td nowrap width="21%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="20%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Cargos</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="19%" > 
              <div align="right">Tipo de Cargos :</div>
            </td>
            <td nowrap width="40%" > 
              <input type="text" name="E01WLNFET" size="3" maxlength="2" value="<%= clMant.getE01WLNFET().trim()%>" >
              <a href="javascript:GetCode('E01WLNFET','STATIC_cl_chrg.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" > 
            </td>
            <td nowrap width="21%" > 
              <div align="right">Fecha Pr&oacute;ximo Cargo :</div>
            </td>
            <td nowrap width="20%" > 
				<eibsinput:date name="clMant" fn_year="E01WLNCHY" fn_month="E01WLNCHM" fn_day="E01WLNCHD" />
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="19%" > 
              <div align="right">Tasa para Cargos :</div>
            </td>
            <td nowrap width="40%" > 
			    <eibsinput:text name="clMant" property="E01WLNBSR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" />
            </td>
            <td nowrap width="21%" > 
              <div align="right">Base para Cargos :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" name="E01WLNYBS" size="4" maxlength="3" value="<%= clMant.getE01WLNYBS().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="19%" > 
              <div align="right">Frecuencia :</div>
            </td>
            <td nowrap width="40%" >
              <input type="text" name="E01WLNPRD" size="2" maxlength="1" value="<%= clMant.getE01WLNPRD().trim()%>" >
              <a href="javascript:GetCode('E01WLNPRD','STATIC_cl_frec.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="21%" > 
              <div align="right">I.V.A. :</div>
            </td>
            <td nowrap width="20%" >
              <input type="hidden" name="E01WLNIVA" value="<%= clMant.getE01WLNIVA()%>">
              <input type="radio" name="CE01WLNIVA" value="Y" onClick="document.forms[0].E01WLNIVA.value='Y'"
			  <%if(clMant.getE01WLNIVA().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01WLNIVA" value="N" onClick="document.forms[0].E01WLNIVA.value='N'"
			  <%if(clMant.getE01WLNIVA().equals("N")) out.print("checked");%>>
              No </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="19%" > 
              <div align="right">Cuenta Contable a Debitar :</div>
            </td>
            <td nowrap width="40%" > 
			    <eibsinput:text name="clMant" property="E01WLNBDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" />
                <eibsinput:help name="clMant" property="E01WLNDAB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" 
               	    	fn_param_one="E01WLNDAB" fn_param_two="document.forms[0].E01WLNBDA.value"/>
                <eibsinput:help name="clMant" property="E01WLNCDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" 
               	    	fn_param_one="E01WLNCDA" fn_param_two="document.forms[0].E01WLNDAB.value"/>
                <eibsinput:help name="clMant" property="E01WLNADN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" 
               	    	fn_param_one="E01WLNADN" fn_param_two="document.forms[0].E01WLNBDA.value" fn_param_three="document.forms[0].E01WLNCDA.value" fn_param_four=""/>
            </td>
            <td nowrap width="21%" >
              <div align="right">Cuenta Detalle a Debitar :</div>
            </td>
            <td nowrap width="20%" >
                <eibsinput:help name="clMant" property="E01WLNDAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" 
               	    	fn_param_one="E01WLNDAC" fn_param_three="RA" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Bloqueos</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Linea Bloqueada :</div>
            </td>
            <td nowrap width="25%" >
              <input type="radio" name="E01WLNFL1" value="Y" <%= clMant.getE01WLNFL1().equals("Y") ? "checked" : ""%> onclick="updateDate(this.value)">S&iacute; 
              <input type="radio" name="E01WLNFL1" value="N" <%= !clMant.getE01WLNFL1().equals("Y") ? "checked" : ""%> onclick="updateDate(this.value)">No </td>

            <td nowrap width="25%" > 
              <div align="right">Fecha Bloqueo :</div>
            </td>
            <td nowrap width="25%" > 
				<eibsinput:date name="clMant" fn_year="E01WLNRDY" fn_month="E01WLNRDM" fn_day="E01WLNRDD" />
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<div id="DivFondo" style="position:relative; display:block;">

  <h4>Fondos de Garantías</h4>
  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Código Fondo de Garantías :</div>
            </td>
            <td nowrap width="25%" >
             <div>
              <INPUT type="text" name="E01WLNSIC" size="5" maxlength="4" value="<%= clMant.getE01WLNSIC().trim()%>" >
			<%
				if (b_read_only1 == false) {
			%>
              <a href="javascript:GetCodeDescCNOFC('E01WLNSIC','D01WLNSIC','FJ')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a> 
            <%} %>
              <INPUT type="text" name="D01WLNSIC" size="32" maxlength="30" value="<%= clMant.getD01WLNSIC().trim()%>" readonly>
             </div>

            <td nowrap width="25%" > 
              <div align="right"> </div>
            </td>
            <td nowrap width="25%" > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" height="22" > 
              <div align="right">Monto Mínimo Alerta de Cupo :</div>
            </td>
            <td nowrap width="28%" height="22" > 
			    <eibsinput:text name="clMant" property="E01WLNFL3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" required="true"/>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Controlar cupos por Ciudades : </div>
            </td>
            <td nowrap width="24%" > 
              <input type="radio" name="E01WLNRLT" value="Y" <%= clMant.getE01WLNRLT().equals("Y") ? "checked" : ""%> onclick="updateCity(this.value)">S&iacute; 
              <input type="radio" name="E01WLNRLT" value="N" <%= !clMant.getE01WLNRLT().equals("Y") ? "checked" : ""%> onclick="updateCity(this.value)">No
            </td>
          </tr>
          <tr id="trdark"> 
			<td class=TDBKG width="100%" colspan=4>
				<div align="center" display:block;><a href="javascript:goAction()" id="btnA1"><b>Lista Ciudades <br>para distribuir cupo</b></a></div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</div>

	    <div align="center"> 
    	  <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goSubmit()">
   		</div>

  </form>
  
 <script type="text/javascript">
 	function updateDate(value) {
 		if (value == "Y") {
 			getElement("E01WLNRDM").disabled = false;
 			getElement("E01WLNRDD").disabled = false;
 			getElement("E01WLNRDY").disabled = false;
 		} else {
 			getElement("E01WLNRDM").disabled = true;
 			getElement("E01WLNRDD").disabled = true;
 			getElement("E01WLNRDY").disabled = true;
 		}
 		updRelCust("????");
 	}
 	function updateCity(value) {
 		if (value == "Y") {
		hideDiv('btnA1',false);
	}else{
		hideDiv('btnA1',true);
 		}
 	}
 	
 	function goSubmit() {
 		var element = getElementChecked("E01WLNFL1");
 		var val = element.value;
 		if (val == "N") {
 			getElement("E01WLNRDM").value = "";
 			getElement("E01WLNRDD").value = "";
 			getElement("E01WLNRDY").value = "";
 		}
 		submitForm();
 	}
 	
 	 	if (document.forms[0].E01WLNTYL.value != "FGAR") {
		hideDiv('DivFondo',true)
	}else{
		hideDiv('DivFondo',false)
	}
 	
 </script> 
  
</body>
</html>
