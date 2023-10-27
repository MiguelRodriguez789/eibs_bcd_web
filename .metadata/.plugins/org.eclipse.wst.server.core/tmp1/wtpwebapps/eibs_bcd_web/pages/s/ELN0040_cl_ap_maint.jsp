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

   builtNewMenu(cl_a_opt);

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

<body>


<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
  out.println("<SCRIPT> initMenu(); </SCRIPT>");
%>

<h3 align="center">Lineas de Cr&eacute;dito - Informaci&oacute;n B&aacute;sica</h3>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cl_ap_maint,ELN0040">
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.credit.JSELN0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01WLNBNK"  value="<%= clMant.getE01WLNBNK().trim()%>">
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2"  class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="13%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
 	             <eibsinput:text name="clMant" property="E01WLNCUN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>"  readonly="true"/> 
              </div>
            </td>
            <td nowrap width="17%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
 	             <eibsinput:text name="clMant" property="E01CUSNA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME %>"  readonly="true"/> 
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="13%"> 
              <div align="right"><b>Linea : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
 	             <eibsinput:text name="clMant" property="E01WLNNUM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE %>"  readonly="true"/> 
              </div>
            </td>
            <td nowrap width="17%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="9%"> 
              <div align="left"><b>
              <eibsinput:text name="clMant" property="E01WLNCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" modified="F01LNECCY" readonly="true"/> 
                </b> </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Cupo de Cr&eacute;dito :</b></div>
            </td>
            <td nowrap width="21%"> 
              <div align="left"><b>
                <input type="text" readonly <% if (clMant.getF01LNECCU().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCCU1" size="9" maxlength="9" value="<%= clMant.getE01WLNCCU().trim()%>" >
                </b> </div>
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
        <table cellspacing=0 cellpadding=2 width="100%" >
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Banco / Sucursal :</div>
            </td>
            <td nowrap width="28%" > 
              <eibsinput:text name="clMant" property="E01WLNBNK" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" modified="F01LNEBNK" readonly="true"/> 
              <eibsinput:text name="clMant" property="E01WLNBRN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" modified="F01LNEBRN" readonly="true"/> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Comprometida o No :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clMant.getF01LNECOU().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCOU" size="2" 
				value="<% if (clMant.getE01WLNCOU().equals("C")) out.print("Si"); else if (clMant.getE01WLNCOU().equals("U")) out.print("No"); %>" >
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Moneda / Cuenta Contable :</div>
            </td>
            <td nowrap width="28%" > 
              <eibsinput:text name="clMant" property="E01WLNCCY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" modified="F01LNECCY" readonly="true"/>              
              <eibsinput:text name="clMant" property="E01WLNGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" modified="F01LNEGLN" readonly="true"/> 
            </td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="24%" > 
		   		<eibsinput:date name="clMant" fn_year="E01WLNMTY" fn_month="E01WLNMTM" fn_day="E01WLNMTD"  readonly="true"/>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="28%" > 
		   		<eibsinput:date name="clMant" fn_year="E01WLNOPY" fn_month="E01WLNOPM" fn_day="E01WLNOPD" readonly="true"/>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Centro de Costo :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clMant.getF01LNECCS().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCCS" size="8" maxlength="8" value="<%= clMant.getE01WLNCCS().trim()%>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">T&eacute;rmino :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clMant.getF01LNETER().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTER" size="4" maxlength="3" value="<%= clMant.getE01WLNTER().trim()%>">
              <input type="text" readonly <% if (clMant.getF01LNETRC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTRC" size="10" 
                value="<% if(clMant.getE01WLNTRC().equals("D")) out.print("Día(s)");
                	 	  else if(clMant.getE01WLNTRC().equals("M")) out.print("Mes(es)");
                		  else if(clMant.getE01WLNTRC().equals("Y")) out.print("A#o(s)"); %>">
            </td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Autorización :</div>
            </td>
            <td nowrap width="24%" > 
		   		<eibsinput:date name="clMant" fn_year="E01WLNAUY" fn_month="E01WLNAUM" fn_day="E01WLNAUD" readonly="true"/>
            </td>
          </tr>
 
          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Tipo de Autorizaci&oacute;n :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clMant.getF01LNEATY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNATY" size="2" maxlength="3" value="<%= clMant.getE01WLNATY().trim()%>">
			</td>
            <td nowrap width="24%" > 
              <div align="right">Tipo de Linea :</div>
            </td>
            <td nowrap width="24%" > 
              <eibsinput:text name="clMant" property="E01WLNTYL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CNOFC %>" modified="F01LNETYL" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Categor&iacute;a de la Linea :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clMant.getF01LNECAT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCAT" size="2" maxlength="1" value="<%= clMant.getE01WLNCAT().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Fecha de Revisi&oacute;n :</div>
            </td>
            <td nowrap width="24%" > 
		   		<eibsinput:date name="clMant" fn_year="E01WLNRVY" fn_month="E01WLNRVM" fn_day="E01WLNRVD" readonly="true"/>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="24%" height="22" > 
              <div align="right">Importe Aprobado :</div>
            </td>
            <td nowrap width="28%" height="22" > 
              <eibsinput:text name="clMant" property="E01WLNAMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" modified="F01LNEAMN" readonly="true"/>
            </td>
            <td nowrap width="24%" height="22" > 
              <div align="right">Fecha de Reasignaci&oacute;n :</div>
            </td>
            <td nowrap width="24%" height="22" > 
		   		<eibsinput:date name="clMant" fn_year="E01WLNREY" fn_month="E01WLNREM" fn_day="E01WLNRED" modified="F01LNEREM" readonly="true"/>
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Monto de Reasignaci&oacute;n :</div>
            </td>
            <td nowrap width="28%" > 
              <eibsinput:text name="clMant" property="E01WLNREA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" modified="F01LNEREA" readonly="true"/>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Operaci&oacute;n en otra Moneda :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clMant.getF01LNEMUB().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNMUB" size="2" 
				value="<% if (clMant.getE01WLNMUB().equals("Y")) out.print("Si"); else if (clMant.getE01WLNMUB().equals("N")) out.print("No"); %>" >
			</td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Autorizada por :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" readonly <% if (clMant.getF01LNEABY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNABY" size="45" maxlength="45" value="<%= clMant.getE01WLNABY().trim()%>" >
            </td>
            <td nowrap width="24%" > 
              <div align="right">Indicador T&eacute;rmino :</div>
            </td>
            <td nowrap width="24%" > 
              <input type="text" readonly <% if (clMant.getF01LNETRM().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTRM" size="24" 
                value="<% if (clMant.getE01WLNTRM().equals("L")) out.print("Largo Plazo");
                		  else if (clMant.getE01WLNTRM().equals("S")) out.print("Corto Plazo");
                		  else if(clMant.getE01WLNTRM().equals("T")) out.print("Tomadas a Corresponsal"); %>">
            </td>
          </tr>

          <tr id="trclear"> 
            <td nowrap width="24%" > 
              <div align="right">Cliente / Linea Relacionada :</div>
            </td>
            <td nowrap width="28%" > 
              <eibsinput:text name="clMant" property="E01WLNCGM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" modified="F01LNECGM" readonly="true"/>
              <eibsinput:text name="clMant" property="E01WLNLGM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE %>" modified="F01LNELGM" readonly="true"/>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Linea de Control :</div>
            </td>
            <td nowrap width="24%" > 
              <eibsinput:text name="clMant" property="E01WLNCCU" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" modified="F01LNECCU" readonly="true"/>
              <eibsinput:text name="clMant" property="E01WLNCLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CREDIT_LINE %>" modified="F01LNECLN" readonly="true"/>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="24%" > 
              <div align="right">Indice de Cobertura de la Garantía :</div>
            </td>
            <td nowrap width="28%" > 
              <input type="text" name="E01WLNFL4" size="10" maxlength="9" value="<%= clMant.getE01WLNFL4().trim()%>" readonly>
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
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%">
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para Prestamos :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clMant.getF01LNETLN().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTLN" size="2" maxlength="1" value="<%= clMant.getE01WLNTLN().trim()%>" >
            </td>
            <td nowrap width="21%" > 
              <div align="right">Tasa de Inter&eacute;s :</div>
            </td>
            <td nowrap width="20%" > 
              <eibsinput:text name="clMant" property="E01WLNORT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" modified="F01LNEORT" readonly="true"/>
            </td>
          </tr>

          
          <tr id="trclear"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para L/C :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clMant.getF01LNETLC().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTLC" size="2" maxlength="1" value="<%= clMant.getE01WLNTLC().trim()%>" >
            </td>
            <td nowrap width="21%" > 
              <div align="right">Tasa D&iacute;as Gracia :</div>
            </td>
            <td nowrap width="20%" > 
              <eibsinput:text name="clMant" property="E01WLNMRT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" modified="F01LNEMRT" readonly="true"/>
            </td>
          </tr>

          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla de Tarifas para Cta./ Cte. :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clMant.getF01LNETRT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNTRT" size="2" maxlength="1" value="<%= clMant.getE01WLNTRT().trim()%>" >
            </td>
            <td nowrap width="21%" > 
              <div align="right">D&iacute;as Gracia Inter&eacute;s :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly <% if (clMant.getF01LNEMXT().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNMXT" size="4" maxlength="3" value="<%= clMant.getE01WLNMXT().trim()%>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="32%" > 
              <div align="right">Tabla / Tipo Tasa Flotante :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clMant.getF01LNEFTB().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNFTB" size="2" maxlength="2" value="<%= clMant.getE01WLNFTB().trim()%>">
              <input type="text" readonly <% if (clMant.getF01LNEFTY().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNFTY" size="10"
                value="<% if (clMant.getE01WLNFTY().equals("FP")) out.print("Primaria");
                		  else if (clMant.getE01WLNFTY().equals("FS")) out.print("Secundaria");
						  else out.println(""); %>">
            </td>
            <td nowrap width="21%" > 
              <div align="right">Nivel Cr&eacute;dito Cliente :</div>
            </td>
            <td nowrap width="20%" > 
              <input type="text" readonly <% if (clMant.getF01LNECRR().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNCRR" size="2" maxlength="1" value="<%= clMant.getE01WLNCRR().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="32%" > 
              <div align="right">Prop&oacute;sito de L&iacute;nea :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" readonly <% if (clMant.getF01LNEPUR().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNPUR" size="45" maxlength="60" value="<%= clMant.getE01WLNPUR().trim()%>">
            </td>
            <td nowrap width="21%" > 
            <td nowrap width="20%" > 
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Cargos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%">
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">Tipo de Cargos :</div>
            </td>
            <td nowrap width="16%" > 
              <input type="text" readonly <% if (clMant.getF01LNEFET().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNFET" size="3" maxlength="2" value="<%= clMant.getE01WLNFET().trim()%>" >
            </td>
            <td nowrap width="22%" > 
              <div align="right">Fecha Pr&oacute;ximo Cargo :</div>
            </td>
            <td nowrap width="40%" > 
            	<eibsinput:date name="clMant" fn_year="E01WLNCHY" fn_month="E01WLNCHM" fn_day="E01WLNCHD" modified="F01LNECHM" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="22%" > 
              <div align="right">Tasa para Cargos :</div>
            </td>
            <td nowrap width="16%" > 
              <eibsinput:text name="clMant" property="E01WLNBSR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" modified="F01LNEBSR" readonly="true"/>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Base para Cargos :</div>
            </td>
            <td nowrap width="40%" > 
              <input type="text" readonly <% if (clMant.getF01LNEYBS().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNYBS" size="4" maxlength="3" value="<%= clMant.getE01WLNYBS().trim()%>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="22%" > 
              <div align="right">Frecuencia :</div>
            </td>
            <td nowrap width="16%" >
              <input type="text" name="E01WLNPRD" size="2" maxlength="1" value="<%= clMant.getE01WLNPRD().trim()%>" >
            </td>
            <td nowrap width="22%" > 
              <div align="right">I.V.A. :</div>
            </td>
            <td nowrap width="40%" >
              <input type="text" readonly <% if (clMant.getF01LNEIVA().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNIVA" size="2" 
				value="<% if (clMant.getE01WLNIVA().equals("Y")) out.print("Si"); else if (clMant.getE01WLNIVA().equals("N")) out.print("No"); %>" >
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="22%" >
              <div align="right">Cuenta Contable a Debitar :</div>
            </td>
            <td nowrap width="16%" >
			    <eibsinput:text name="clMant" property="E01WLNBDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BANK %>" modified="F01LNEBDA" readonly="true"/>
                <eibsinput:text name="clMant" property="E01WLNDAB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_BRANCH %>" modified="F01LNEDAB" readonly="true"/>
                <eibsinput:text name="clMant" property="E01WLNCDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_CURRENCY%>" modified="F01LNECDA" readonly="true"/>
                <eibsinput:text name="clMant" property="E01WLNADN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER%>" modified="F01LNEADN" readonly="true"/>
            </td>
            <td nowrap width="22%" >
              <div align="right">Cuenta Contable a Debitar :</div>
            </td>
            <td nowrap width="40%" >
                <eibsinput:text name="clMant" property="E01WLNDAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" modified="F01LNEDAC" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Bloqueos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Linea Bloqueada :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="text" readonly <% if (clMant.getF01LNEFL1().equals("Y")) out.print("class=\"txtchanged\""); %> name="E01WLNFL1" size="2" 
				value="<% if (clMant.getE01WLNFL1().equals("Y")) out.print("Si"); else out.print("No"); %>" >

            </td>
            <td nowrap width="25%" > 
              <div align="right">Fecha Bloqueo :</div>
            </td>
            <td nowrap width="40%" > 
 		   		<eibsinput:date name="clMant" fn_year="E01WLNRDY" fn_month="E01WLNRDM" fn_day="E01WLNRDD" modified="F01LNERDM" readonly="true"/>
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
              <INPUT type="text" name="E01WLNSIC" size="5" maxlength="4" value="<%= clMant.getE01WLNSIC().trim()%>"  <% if (clMant.getF01LNESIC().equals("Y")) out.print("class=\"txtchanged\""); %> readonly>
              <INPUT type="text" name="D01WLNSIC" size="32" maxlength="30" value="<%= clMant.getD01WLNSIC().trim()%>" <% if (clMant.getF01LNESIC().equals("Y")) out.print("class=\"txtchanged\""); %> readonly>
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
			    <eibsinput:text name="clMant" property="E01WLNFL3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" modified="E01WLNUC1" readonly="true"/>
            </td>
            <td nowrap width="24%" > 
              <div align="right">Controlar cupos por Ciudades : </div>
            </td>
            <td nowrap width="24%" > 
              <input type="radio" name="E01WLNRLT" value="Y" <%= clMant.getE01WLNRLT().equals("Y") ? "checked" : ""%> disabled>S&iacute; 
              <input type="radio" name="E01WLNRLT" value="N" <%= !clMant.getE01WLNRLT().equals("Y") ? "checked" : ""%> disabled>No
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
   
  </form>
   <script type="text/javascript">
 	if (document.forms[0].E01WLNTYL.value != "FGAR") {
		hideDiv('DivFondo',true)
	}else{
		hideDiv('DivFondo',false)
	}
 	
 </script> 
  
</body>
</html>