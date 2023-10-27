<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%><html>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="java.math.BigDecimal"%>

<head>
<title>Draft Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Loans/ln-opening.jsp"> </SCRIPT>

<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "lstAcceptors" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />
<jsp:useBean id= "msgFile" class= "datapro.eibs.beans.EDL081004Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id= "list" class= "datapro.eibs.beans.JBObjList"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String name = currClient != null ? currClient.getE01CUSNA1().trim() : ""; 
%>
<SCRIPT type="text/javascript">

function GoAction(opt) {
	if (opt == "V") {
		getElement("SCREEN").value = "1520";
	}
	if (opt == "B") {
		getElement("SCREEN").value = "1500";
	}
	getElement("ACTION").value = opt;
	document.forms[0].submit();
}

function showDirecciones(){

	if (document.forms[0].ideacc.value.trim() != ""){
		GetAcceptantAddr('E01CUMMAN','',document.forms[0].ideacc.value,'','','E01CUMMAN','E'	);
	} else {
		alert("Primero debe ingresar Numero de Deudor ..");
        document.forms[0].ideacc.focus();		
	}
}
function closeHiddenDivNew(){
	setVisibility(getElement("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = getElement("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	
    getElement("ideacc").focus();
}

function goNew(evt){
	if (getElement("E01DEAACC").value != "999999999999"){
		showHiddenDivNew(evt);
	} else {
		alert("Primero debe generar el numero de cuenta ..");
	}
}

addEventHandler(document, 'click', closeHiddenDivNew);

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
if (userPO.getPurpose().equals("MAINTENANCE")){
 out.println("<SCRIPT>  initMenu(); </SCRIPT>");}

  String DEAIPD, DEAPPD;
  String E01FLGDED, E01FLGREF,E01FLGPAY,E01FLGCOL,E01DEACLF;
  boolean isDEAIPDNum = true;
  boolean isDEAPPDNum = true;
  //DEAIPD = lnBasic.getE01DEAIPD().trim();
  //DEAPPD = lnBasic.getE01DEAPPD().trim();
  //E01FLGDED = lnBasic.getE01FLGDED().trim();
  //E01FLGREF = lnBasic.getE01FLGREF().trim();
  //E01FLGPAY = lnBasic.getE01FLGPAY().trim();
  //E01FLGCOL = lnBasic.getE01FLGCOL().trim();
  //E01DEACLF = lnBasic.getE01DEACLF().trim();
  
  String genFlag = "";
  try {
      genFlag = request.getParameter("generic").trim();
      if (genFlag == null) genFlag = "";
  } catch (Exception e) {
    //genFlag = lnBasic.getE01DEACLF().trim();
  }
	
  String strBlank = "";

%> 
<h3 align="center"> <%= dftBasic.getE01DSCPRO().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_upload_data.jsp, EDL0800"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800A" >
  <INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=dftBasic.getE01DEAACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="1520">
  <INPUT TYPE=HIDDEN NAME="ACTION" ID="ACTION" VALUE="">
  <input type=HIDDEN name="E01DEAACC" ID="E01DEAACC" value="<%= dftBasic.getE01DEAACC() %>">
  <input type=HIDDEN name="E01DEATYP" ID="E01DEATYP" value="<%= dftBasic.getE01DEATYP() %>">
  <input type=HIDDEN name="E01DEAGLN" ID="E01DEAGLN" value="<%= dftBasic.getE01DEAGLN() %>">
  <INPUT type="hidden" name="E01DEACLF" id="E01DEACLF" size="2" maxlength="1" value="<%= dftBasic.getE01DEACLF() %>" readonly>
  <input type=hidden name="GRP" id="GRP" value="0">


  <table class="tableinfo">
   <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="20%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" size="10" maxlength="9" readonly value="<%= dftBasic.getE01DEACUN() %>">
                </div>
            </td>
            <td nowrap width="20%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap width="40%"> 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="65" maxlength="60" readonly value="<%= dftBasic.getE01CUSNA1().trim().equals("") ? name : dftBasic.getE01CUSNA1().trim() %>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="20%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" readonly value="<%= dftBasic.getE01DEACCY() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="20%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="40%"> 
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" readonly value="<%= dftBasic.getE01DEAPRO() %>">
                
                <input type="text" name="E01PRODSC" size="60" maxlength="60" readonly value="<%= dftBasic.getE01DSCPRO() %>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Información Básica</h4> 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="23%"> 
           <eibsinput:date name="dftBasic" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" />
             
            </td>
            <td nowrap width="25%"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="27%">
				<input type="text" name="E01DEAOAM" size="15" maxlength="15" value="<%= dftBasic.getE01DEAOAM() %>">
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Mandatorio" align="bottom" border="0"  > 
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Tasa Flotante :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" value="<%= dftBasic.getE01DEAFTB() %>">
	              <a href="javascript:GetFloating('E01DEAFTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="middle" border="0" ></a> 
              <select name="E01DEAFTY">
		  		<option value=" " <% if (!(dftBasic.getE01DEAFTY().equals("FP") ||dftBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (dftBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (dftBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>
              <input type="text" name="E01FLTRTE" size="9" maxlength="9" value="<%= dftBasic.getE01FLTRTE() %>" readonly>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa de Inter&eacute;s/Spread :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= dftBasic.getE01DEARTE() %>" onKeypress="enterSignDecimal()">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Mandatorio" align="bottom" border="0"  > 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Documento :</div>
            </td>
            <td nowrap width="23%" >
			<select name="E01DEARET">
				<option value=" " <% if (dftBasic.getE01DEARET().trim().equals(""))  out.print("selected"); %>></option>
				<option value="1" <% if (dftBasic.getE01DEARET().equals("1"))  out.print("selected"); %>>Giros o Letras</option>
                <option value="2" <% if (dftBasic.getE01DEARET().equals("2")) out.print("selected"); %>>Conformes</option>
                <option value="3" <% if (dftBasic.getE01DEARET().equals("3")) out.print("selected"); %>>Facturas</option>
		        <option value="4" <% if (dftBasic.getE01DEARET().equals("4")) out.print("selected"); %>>Cheques</option>
		        <option value="5" <% if (dftBasic.getE01DEARET().equals("5")) out.print("selected"); %>>Cupones MasterCard</option>
			</select>
			<img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Mandatorio" align="bottom" border="0"  > 
         	</td>
            <td nowrap width="25%" > 
              <div align="right">Tasa / Cargo por Mora :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAPEI" size="8" maxlength="7" value="<%= dftBasic.getE01DEAPEI() %>" >
              <input type="text" name="E01DEAPIF" size="2" maxlength="1" value="<%= dftBasic.getE01DEAPIF() %>" >
              <a href="javascript:lnGetFact('E01DEAPIF','STATIC_ln_fact.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Línea de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEACMC" size="9" maxlength="9" value="<%= dftBasic.getE01DEACMC().trim().equals("0") ? client :  dftBasic.getE01DEACMC() %>" >
              <input type="text" name="E01DEACMN" size="4" maxlength="4" value="<%= dftBasic.getE01DEACMN() %>" >
              <a href="javascript:GetCreditLine('E01DEACMN',document.forms[0].E01DEACMC.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="Campo Mandatorio" align="bottom" border="0"  > 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo : </div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACCN" size="8" maxlength="8" value="<%= dftBasic.getE01DEACCN() %>">
              <a href="javascript:GetCostCenter('E01DEACCN',document.forms[0].E01DEABNK.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a> 
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Retención de Impuestos :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAWHF" size="2" maxlength="1" value="<%= dftBasic.getE01DEAWHF() %>">
              <a href="javascript:GetCode('E01DEAWHF','STATIC_cd_taxes.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Dirección de Correo :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAMLA" size="2" maxlength="2" value="<%= dftBasic.getE01DEAMLA() %>">
              <a href="javascript:GetMailing('E01DEAMLA',document.forms[0].E01DEACUN.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Direcciones de Correo del Cliente" align="middle" border="0"></a> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Comisionista :</div>
           </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEABRK" size="5" maxlength="4" value="<%= dftBasic.getE01DEABRK() %>">
              <a href="javascript:GetBroker('E01DEABRK')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Comisión :</div>
            </td>
            <td nowrap width="27%" > 
		<input type="text" name="E01DEABCP" size="10" maxlength="9" value="<%= dftBasic.getE01DEABCP() %>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero de Referencia:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAREF" size="12" maxlength="12" value="<%= dftBasic.getE01DEAREF() %>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Banco/Oficina :</div>
            </td>
            <td nowrap width="27%" > 
            <%if (userPO.getPurpose().equals("MAINTENANCE")){%> 
            <input readonly type="text" id="E01DEABNK" name="E01DEABNK" size="3" maxlength="2" value="<%= dftBasic.getE01DEABNK() %>" >
            <input readonly type="text" id="E01DEABRN" name="E01DEABRN" size="5" maxlength="4" value="<%= dftBasic.getE01DEABRN() %>" >
            <%} else {%>
            <input type="text" id="E01DEABNK" name="E01DEABNK" size="3" maxlength="2" value="<%= dftBasic.getE01DEABNK() %>" onKeypress="enterInteger(event)">
            <input type="text" id="E01DEABRN" name="E01DEABRN" size="5" maxlength="4" value="<%= dftBasic.getE01DEABRN() %>" onKeypress="enterInteger(event)">
            <a href="javascript:GetBranch('E01DEABRN','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"  ></a>
            <%}%>
            </td>
          </tr>
          
          
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Interés :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAICT() %>">
              <a href="javascript:GetCode('E01DEAICT','STATIC_cd_formula.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></td>
            <td nowrap width="25%" > 
              <div align="right">Período Base :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEABAS" size="4" maxlength="3" readonly value="<%= dftBasic.getE01DEABAS() %>">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Cálculo de Interés Normal :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAIFL" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAIFL() %>">
              <a href="javascript:lnGetOver('E01DEAIFL','STATIC_ln_prov.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Cálculo de Inter&eacute;s Mora :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAPCL" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAPCL() %>" >
              <a href="javascript:lnGetOver('E01DEAPCL','STATIC_ln_mor.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tabla de Parametros :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEATLN" size="3" maxlength="2" readonly value="<%= dftBasic.getE01DEATLN() %>">
              <a href="javascript:GetLoanTable('E01DEATLN',document.forms[0].E01DEATYP.value)"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%" >
              <div align="right">Período de Gracia :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAGPD" size="3" maxlength="2" value="<%= dftBasic.getE01DEAGPD() %>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" >
              <div align="right">Porcentaje de Comisión :</div> 
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAROR" size="10" maxlength="9" onKeypress="enterSignDecimal(event, 6)" value="<%= dftBasic.getE01DEAROR() %>"> 
            </td>
            
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Retención :</div>
            </td>
            <td nowrap width="27%" >
            	<input type="text" name="E01DEAPRP" size="10" maxlength="9"  onKeypress="enterSignDecimal(event, 6)" value="<%= dftBasic.getE01DEAPRP() %>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
             <div align="right">Tabla de Tasas :</div> 
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARTB" size="3" maxlength="2" readonly value="<%= dftBasic.getE01DEARTB() %>">
              <a href="javascript:GetRateTable('E01DEARTB')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a> 
            </td>
            <td nowrap width="25%" > 
              <div align="right">Cobro del FECI :</div>
            </td>
            <td nowrap width="27%" >
            	<input type="hidden" name="E01DEATX2" id="E01DEATX2" value="<%= dftBasic.getE01DEATX2() %>">
            	<input type="radio" name="CE01DEATX2" value="F"  onClick="getElement('E01DEATX2').value='F'"
            <%if(dftBasic.getE01DEATX2().equals("F")) out.print("checked");%>> Si 
	              <input type="radio" name="CE01DEATX2" value="N"  onClick="getElement('E01DEATX2').value='N'"
	        <%if(!dftBasic.getE01DEATX2().equals("F")) out.print("checked");%> > No
            </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap width="25%" > 
             <div align="right">Tabla de Cargos :</div> 
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAOFT" size="3" maxlength="2"  value="<%= dftBasic.getE01DEAOFT() %>">
              <a href="javascript:GetLoanChargeTable('E01DEAOFT',document.forms[0].E01DEATYP.value)">
              <img src="${pageContext.request.contextPath}/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <b>&nbsp; &nbsp; Personalizar</b>
		      <a href="javascript: setComissionTable('false')"><img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 	
            </td>
            <td nowrap width="25%" > 
              <div align="right"></div>
            </td>
            <td nowrap width="27%" >

            </td>
          </tr> 
        </table>
      </td>
    </tr>
  </table>

<h4>Cuenta de Pago</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellpadding=2 cellspacing=0 width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="33%"> 
              <div align="center">Concepto</div>
            </td>
            <td nowrap width="15%"> 
              <div align="center">Banco</div>
            </td>
            <td nowrap width="22%"> 
              <div align="center">Sucursal</div>
            </td>
            <td nowrap> 
              <div align="center">Moneda </div>
            </td>
            <td nowrap> 
              <div align="center">Referencia</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" > 
              <div align="center" > 
                <input type="text" name="E01PAGOPE" value="<%= dftBasic.getE01PAGOPE() %>" size="3" maxlength="3">
                <input type="hidden" name="E01PAGGLN" value="<%= dftBasic.getE01PAGGLN() %>">
                <input type="text" name="E01PAGCON" size="25" maxlength="25" readonly value="<%= dftBasic.getE01PAGCON() %>"
                  class="context-menu-help"
				  onmousedown="init(conceptHelp,this.name,getElement('E01DEABNK').value, document.forms[0].E01PAGCCY.value,'E01PAGGLN','E01PAGOPE','FA','01','')">
			  </div>
            </td>
            <td nowrap width="15%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBNK" size="2" maxlength="2" value="<%= dftBasic.getE01PAGBNK() %>">
              </div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBRN" size="4" maxlength="4" value="<%= dftBasic.getE01PAGBRN() %>"
                  class="context-menu-help"
				  onmousedown="init(branchHelp,this.name,getElement('E01DEABNK').value,'','','','')">
			  </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01PAGCCY" size="3" maxlength="3" value="<%= dftBasic.getE01PAGCCY() %>"
                  class="context-menu-help"
				  onmousedown="init(currencyHelp,this.name,getElement('E01DEABNK').value,'','','','')">
			</div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" name="E01PAGACC" size="12" maxlength="12"  value="<%= dftBasic.getE01PAGACC() %>"
                  class="context-menu-help"
				  onmousedown="init(lnreferHelp,this.name, getElement('E01DEABNK').value,'',getElement('E01DEACUN').value,'','RT')">
			  </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="33%" >&nbsp;</td>
            <td nowrap width="15%" >&nbsp;</td>
            <td nowrap width="22%" >&nbsp;</td>
            <td nowrap width="14%" >&nbsp;</td>
            <td nowrap width="16%" >&nbsp;</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="33%" >Autorización Sobregiro : <input type="text" name="E01DEAODA" size="2" maxlength="1" value="<%= dftBasic.getE01DEAODA() %>">
				<a href="javascript:lnGetOver('E01DEAODA','STATIC_ln_over.jsp')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a> 
            </td>
            <td nowrap width="15%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Autoriza Pagos en Feriados: </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
                <input type="hidden" name="E01DEAHFQ" id="E01DEAHFQ" value="<%= dftBasic.getE01DEAHFQ() %>">
                <input type="radio" name="CE01DEAHFQ" value="1" onClick="getElement('E01DEAHFQ').value='1'"
                <%if(dftBasic.getE01DEAHFQ().equals("1")) out.print("checked");%>> Si 
                <input type="radio" name="CE01DEAHFQ" value="2" onClick="getElement('E01DEAHFQ').value='2'"
			  	  <%if(dftBasic.getE01DEAHFQ().equals("2")) out.print("checked");%>> No 
			  </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>


<p align="center">&nbsp;</p>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    <tr bgcolor="#FFFFFF"> 
      <td width="33%"> 
        <div align="center"></div>
      </td>
      <td width="34%"> 
        <div align="center"> 
          <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="GoAction('V')">
          <% if (!userPO.getHeader6().trim().equals("") ) { %>
    		<input id="EIBSBTN" type="button" name="Regresar" value="Regresar" onClick="GoAction('B')">
    	  <% } %>
        </div>
      </td>
      <td width="33%"> 
        <div align="center"></div>
      </td>
    </tr>
    
  </table>
  <p align="center">&nbsp; </p>
  </form>

</body>
</html>
