<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%><html>
<%@ page import = "datapro.eibs.master.Util" %>

<head>
<title>Draft Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "lstAcceptors" class= "datapro.eibs.beans.JBListRec"  scope="session" />
<jsp:useBean id= "currClient" class= "datapro.eibs.beans.ESD080001Message"  scope="session" />

<%
	String client = currClient != null ? currClient.getE01CUSCUN() : ""; 
	String name = currClient != null ? currClient.getE01CUSNA1().trim() : ""; 
%>
<SCRIPT type="text/javascript">

	function setComissionTable(readOnly) {
		var notMissingInfo = true;
		var cun = getElement('E01DEACUN').value;
		var apcd = getElement('E01DEAACD').value;
		var bank = getElement('E01DEABNK').value;
		var type = getElement('E01DEATYP').value;
		var table = getElement('E01DEAOFT').value;
		var alertMessage = "Por Favor Ingresse : ";
		
		if(readOnly === "true" ){	
			page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table+"&readOnly="+readOnly;
		}else{
			page = "${pageContext.request.contextPath}/servlet/datapro.eibs.params.JSESD0525?SCREEN=1000&BANK="+bank+"&APCD="+apcd+"&TYPE="+type+"&CUN="+cun+"&TBL="+table;
			
			if(trim(bank) == "") {
				alert(alertMessage + "Banco")
				notMissingInfo = false;			
			}
			
			if(trim(table) == "") {
				alert(alertMessage + "Tabla de Cargos")
				notMissingInfo = false;			
			}		
		}
		
		if(notMissingInfo){			
			CenterWindow(page, 1200, 1000, 2);
		}	
		
	}	

function goAction(opt) {
		var OK = false;
		var exists = false;
		var page = "";
       if (getElement("E01DEAACC").value != "999999999999"){
       	if (opt == 'N') {
                 if (getElement("ideacc").value == "") {
    		   	    page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0800?SCREEN=600&ACTION=G" +
    		   	    	'&E01DEACMC='+ getElement("E01DEACMC").value + '&E01DEACMN=' + getElement("E01DEACMN").value;
                 } else {
                 	var formLength= document.forms[0].elements.length;
		   			
		   			for(var n=0;n<formLength;n++){
      	  	  			var elementName= document.forms[0].elements[n].name;
      	  	  			if (elementName == "IDACC1" && getElement("ideacc").value == document.forms[0].elements[n].value){
      	  	  	  			exists = true;
      	  	  	  			break;
      	  	  			}
		   			}
		   			if (exists) {
		   			  alert("Deudor ya existe!");
		   			} else {
			          page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0800?SCREEN=600&ACTION=G&E01DEACUN=" +
			          	 getElement("ideacc").value +	"&E01CUMMAN=" + getElement("E01CUMMAN").value + 
			          	 '&E01DEACMC='+ getElement("E01DEACMC").value + '&E01DEACMN=' + getElement("E01DEACMN").value;
			        }
                 }
       	}
       	if (opt == 'M') {
       	   page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0800?SCREEN=600&ACTION=G&E01DEACUN=" + document.forms[0].IDACC1.value;
       	}
		if (opt == 'D') {

		   var formLength= document.forms[0].elements.length;
		   var ideacc = "";
		   var mailAddr = "";
		   for(var n=0;n<formLength;n++){
      	  	  var elementName= document.forms[0].elements[n].name;
      	  	  if (elementName == "IDACC1" && document.forms[0].elements[n].checked){
      	  	  	  ideacc = document.forms[0].elements[n].value;
      	  	  	  OK = true;
      	  	  	  //break;
      	  	  }
      	  	  if (OK && elementName == "MailAddress" ) {
      	  	  	mailAddr = document.forms[0].elements[n].value;
      	  	  	break;
      	  	  }
		   }
		   
		   if (ideacc == "") {
		      alert("Por favor, seleccione un deudor primero, antes de visualizar los documentos.");
		      exists = true;
		   }
		   else {
       	      page = "${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDL0800?SCREEN=800&ACTION=G&E01DEAACC=" + 
       	      			getElement("E01DEAACC").value +"&IDEACC="+ideacc+"&MAILADDR="+mailAddr+"&GRP=4";
       	   }
       	}
        if (exists == false) {
			CenterWindow(page,1000,600,2);
		}
	} else {
         alert("Primero debe generar el numero de cuenta ..");
       }
}

<%if (userPO.getPurpose().equals("MAINTENANCE")){%>
   
    builtNewMenu(dft_m_opt);

<%}%>
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
function chgEfeRte(){
  var vlr = 0;
  document.forms[0].E01DEARTE.value = String(vlr.toFixed(6));
}

function chgSprRte(){
  var vlr = 0;
  document.forms[0].E01DEASPR.value = String(vlr.toFixed(6));
}
addEventHandler(document, 'click', closeHiddenDivNew );

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
<h3> 
<TD class=TDBKG colspan="2" align="center" width="394"> 
        <div align="center"><a id="eibsNew"><b><%= dftBasic.getE01DSCPRO().trim() %></b></a></div>
      </TD>    	
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=dftBasic.getE01DEAACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="502">
  <INPUT TYPE=HIDDEN NAME="ACTION" ID="ACTION" VALUE="F">
  <input type=HIDDEN name="E01DEATYP" ID="E01DEATYP" value="<%= dftBasic.getE01DEATYP() %>">
  <INPUT type="hidden" name="E01DEACLF" id="E01DEACLF" size="2" maxlength="1" value="<%= dftBasic.getE01DEACLF() %>" readonly>
  <input type=hidden name="GRP" id="GRP" value="0">

 <div id="hiddenDivNew" class="hiddenDiv">
 <TABLE id=tbhelp style="border-top-width : 1px;border-right-width : 1px;border-bottom-width : 1px;border-left-width : 1px;
	border-color: #0b23b5;
	border-style : solid solid solid solid;
	filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=3, OffY=3, Color='gray', Positive='true');">
	<TR>
	  <TD ALIGN=right nowrap>Ingrese Numero de Cliente del Deudor : 
		<input type="text" maxlength=10 size=9 name="ideacc" id="ideacc" value="">
		 <a href="javascript:GetCustomerDescId('ideacc','','')">
		 <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
      </TD>
     </TR>
     	<TR>
	  <TD ALIGN=right nowrap>Ingrese Numero de Direccion : 
		<input type="text" maxlength=10 size=9 name="E01CUMMAN" id="E01CUMMAN" value="">
		 <a href="javascript:showDirecciones('N')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0" ></a>
		 
      </TD>
     </TR>
     <TR>
      <TD ALIGN=center nowrap>
	     <a href="javascript:goAction('N')">
	     <img name="Image1" border="0" src="<%=request.getContextPath()%>/images/s/applicar_on.gif"></a> 
	  </TD>
   </TR>
 </TABLE>
</div>

  <table class="tableinfo">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <input type="text" name="E01DEACUN" size="10" maxlength="9" readonly="readonly" value="<%= dftBasic.getE01DEACUN().trim().equals("0") ? client : dftBasic.getE01DEACUN() %>">
             <%  if (dftBasic.getE01DEAACC().equals("999999999999")) { %>
                <a href="javascript:GetCustomerDescId('E01DEACUN','E01CUSNA1','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a></div>
			 <% } %>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <input type="text" name="E01CUSNA1" size="65" maxlength="60" readonly="readonly" value="<%= dftBasic.getE01CUSNA1().trim().equals("") ? name : dftBasic.getE01CUSNA1().trim() %>">
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
<%            
			  String strNroAcc = dftBasic.getE01DEAACC();
              if (dftBasic.getE01DEAACC().equals("999999999999")) {
              	strNroAcc = "NUEVA CUENTA";	  
              }
%>
                <input type="hidden" name="E01DEAACC" id="E01DEAACC" size="13" maxlength="12" value="<%= dftBasic.getE01DEAACC()  %>">
                <input type="text" name="E01DEAACCDSC" readonly="readonly" size="13" maxlength="12" value="<%= strNroAcc  %>">              

              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= dftBasic.getE01DEACCY() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <input type="text" name="E01DEAPRO" size="4" maxlength="4" readonly="readonly" value="<%= dftBasic.getE01DEAPRO() %>">
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
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right">Fecha de Vencimiento :</div>
            </td>
            <td nowrap width="23%"> 
            <%if (dftBasic.getE01APAF14().equals("Y")) { %>
            	<eibsinput:date name="dftBasic" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" />
            <% } else { %>
           		<eibsinput:date name="dftBasic" fn_year="E01DEAMDY" fn_month="E01DEAMDM" fn_day="E01DEAMDD" readonly="true" />
            <% } %> 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Tasa de Inter&eacute;s/Efectiva Anual :</div>
            </td>
            <td nowrap width="27%">
				<input type="text" name="E01DEASPR" size="15" maxlength="15" value="<%= dftBasic.getE01DEASPR() %>" onchange="chgEfeRte();">
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
              <input type="text" name="E01DEARTE" size="10" maxlength="9" value="<%= dftBasic.getE01DEARTE() %>" onKeypress="enterSignDecimal()"  onchange="chgSprRte();">
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
              <input type="text" id="E01DEACMC" name="E01DEACMC" size="9" maxlength="9" value="<%= dftBasic.getE01DEACMC().trim().equals("0") ? client :  dftBasic.getE01DEACMC() %>" >
              <input type="text" id="E01DEACMN" name="E01DEACMN" size="4" maxlength="4" value="<%= dftBasic.getE01DEACMN() %>" >
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
              <div align="right">Porcentaje Comisionista :</div>
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
              <div align="right"><%if(currUser.getE01INT().equals("07")){ out.print("Cobro del FECI :"); } else 
              	if (currUser.getE01INT().equals("05")){ out.print("Base Liquidacion GMF :"); } else 
              	{ out.print("Debito Bancario :"); }%> </div>
            </td>
            <td nowrap width="27%" >
            	<%if (currUser.getE01INT().equals("07")){ %>
            		<input type="hidden" name="E01DEATX2" id="E01DEATX2" value="<%= dftBasic.getE01DEATX2() %>">
            		<input type="radio" name="CE01DEATX2" value="F"  onClick="getElement('E01DEATX2').value='F'"
            		<%if(dftBasic.getE01DEATX2().equals("F")) out.print("checked");%>> Si 
	              		<input type="radio" name="CE01DEATX2" value="N"  onClick="getElement('E01DEATX2').value='N'"
	        		<%if(!dftBasic.getE01DEATX2().equals("F")) out.print("checked");%> > No
	        	<% } else { %>
	        <!--  		<input type="text" name="E01DEASCA" size="15" maxlength="15" value="<%= dftBasic.getE01DEAOAM() %>"> -->
				<% } %>
            </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap width="25%" > 
             <div align="right">Tabla de Cargos :</div> 
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAOFT" size="3" maxlength="2"  value="<%= dftBasic.getE01DEAOFT() %>">
              <a href="javascript:GetLoanChargeTable('E01DEAOFT',document.forms[0].E01DEATYP.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <b>&nbsp; &nbsp; Personalizar</b>
		      <a href="javascript: setComissionTable('false')"><img src="<%=request.getContextPath()%>/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 	
            </td>
            <td nowrap width="25%" > 
              <% if (dftBasic.getE01APAF09().equals("C")) { %>
              <div align="right">Porcentaje de Negociacion</div>
              <% } %>
            </td>
            <td nowrap width="27%" >
              <% if (dftBasic.getE01APAF09().equals("C")) { %>
				<input type="text" name="E01DEAPCT" size="10" maxlength="9" onKeypress="enterSignDecimal(event, 6)" value="<%= dftBasic.getE01DEAPCT() %>">
			  <% } %>
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
				  onmousedown="init(lnreferHelp,this.name,getElement('E01DEABNK').value,'',getElement('E01DEACUN').value,'','RT')">
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

<h4>Deudores</h4>

<TABLE class="tableinfo">
   <tr > 
      <td nowrap>
            <table cellpadding="2" cellspacing="0" width="100%" border="0">

    		<TR bgcolor="#FFFFFF">
    			<TD width="2%">
    			</TD>
      <TD class=TDBKG colspan="2" align="center" width="394"> 
        <div align="center"><a id="eibsNew"><b>Deudor</b></a></div>
      </TD>    			
                <TD align="left" colspan="2" width="161"><A href="javascript:goAction('D')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','<%=request.getContextPath()%>/images/s/documents_over.gif',1)"><IMG name="Image5" border="0" src="<%=request.getContextPath()%>/images/s/documents.gif"></A>
    			</TD>
    		</TR>
    <tr id="trdark">
      		<TD nowrap width="2%"> 
          	<div align="center"></div>
        	</TD>
            <TD nowrap width="15%"> 
          	<div align="center">Cliente</div>
        	</TD>
        	<!-- 
        	<TD nowrap width="10%"> 
          	<div align="center">Num Direccion</div>
        	</TD>
        	<TD nowrap width="10%"> 
          	<div align="center">Linea de Credito</div>
        	</TD>
        	 -->
            <TD nowrap width="30%"> 
          	<div align="center">Nombre</div>
        	</TD>
            <TD nowrap width="20%"> 
          	<div align="center">Monto</div>
        	</TD>
        	<TD nowrap width="20%"> 
          	<div align="center">Intereses</div>
        	</TD>
	</tr>
		<% 
	lstAcceptors.initRow();
	boolean firstTime = true;
	String chk = "";
     	while (lstAcceptors.getNextRow()) {
         	if (lstAcceptors.getFlag().equals("")) {
         		if (firstTime) {
                 chk = "checked"; 
                 firstTime = false;
            	} else {
                 chk = "";
				}
		%>
     	<tr id="trclear">
		<TD width="2%">
		<div align="center"><INPUT type="radio" name="IDACC1" value="<%= lstAcceptors.getRecord(6) %>" <%= chk %>></div>
		</TD>
		<TD nowrap width="10%">
		<div align="center"><INPUT size="12" type="text" name="IDACCEPTOR" value="<%= lstAcceptors.getRecord(6)%>" readonly></div>
		</TD>
		<!--  
		<TD nowrap width="15%">
		<div align="center"><INPUT size="3" type="text" name="MailAddress" value="<%= lstAcceptors.getRecord(4)%>" readonly></div>
		</TD>
		<TD nowrap width="5%">
		<div align="center"><INPUT size="4" type="text" name="LINEACRED" value="<%= lstAcceptors.getRecord(8)%>" readonly></div>
		</TD>
		-->
		<TD nowrap width="30%">
		<div align="center"><INPUT size="60" type="text" name="NMEACCEPTOR" value="<%= lstAcceptors.getRecord(1)%>" readonly></div>
		</TD>
		<TD nowrap width="25%">
		<div align="center"><INPUT size="25" type="text" name="TOTACCEPTOR" value="<%= Util.formatCCY(lstAcceptors.getRecord(2))%>" readonly></div>
		</TD>
		<TD nowrap width="25%">
		<div align="center"><INPUT size="25" type="text" name="TOTACCEPTOR" value="<%= Util.formatCCY(lstAcceptors.getRecord(3))%>" readonly></div>
		</TD>
		</tr>
        <% }
       }
%>
   </table>
   	</TD>
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
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
        </div>
      </td>
      <td width="33%"> 
        <div align="center"></div>
      </td>
    </tr>
    
  </table>
  <p align="center">&nbsp; </p>
  </form>
<SCRIPT>

	applyTrans(getElement("hiddenDivNew"));
	
	getElement("hiddenDivNew").onclick=cancelBub;
	getElement("eibsNew").onclick=goNew;

</SCRIPT>
</body>
</html>
