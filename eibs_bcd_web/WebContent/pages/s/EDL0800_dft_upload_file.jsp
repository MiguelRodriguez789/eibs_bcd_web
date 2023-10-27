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

function goAction(opt) {
	if (opt == "V") {
		if ( document.forms[0].FILENAME.value.length < 1) {
  			alert("Localización o Nombre de Archivo no Válidos");
  			document.forms[0].FILENAME.value='';
  			document.forms[0].FILENAME.focus();
		} else {
			document.getElementById("SCREEN").value = "1530";
		}
	}
	if (opt == "B") {
		document.getElementById("SCREEN").value = "1520";
	}
	document.getElementById("ACTION").value = opt;
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
	setVisibility(document.getElementById("hiddenDivNew"), "hidden");
}

function showHiddenDivNew(evt) {
	evt = (evt) ? evt : ((window.event) ? window.event : "");
 	
	var hiddenDivNew = document.getElementById("hiddenDivNew");

	var y=evt.clientY + document.body.scrollTop;
	var x=evt.clientX + document.body.scrollLeft;
     
	cancelBub(evt);

	moveElement(hiddenDivNew, y, x);
	setVisibility(hiddenDivNew, "visible");
	
    document.getElementById("ideacc").focus();
}

function goNew(evt){
	if (document.getElementById("E01DEAACC").value != "999999999999"){
		showHiddenDivNew(evt);
	} else {
		alert("Primero debe generar el numero de cuenta ..");
	}
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
<h3 align="center"> <%= dftBasic.getE01DSCPRO().trim() %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_upload_file.jsp, EDL0800"> 
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800A" ENCTYPE="multipart/form-data">
  <INPUT TYPE=HIDDEN NAME="E01DEAACD" id="E01DEAACD" VALUE="<%=dftBasic.getE01DEAACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="1530">
  <INPUT TYPE=HIDDEN NAME="ACTION" ID="ACTION" >
  <input type=HIDDEN name="E01DEATYP" ID="E01DEATYP" value="<%= dftBasic.getE01DEATYP() %>">
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
           <eibsinput:date name="dftBasic" fn_year="E01DEAODY" fn_month="E01DEAODM" fn_day="E01DEAODD" readonly="true" />
             
            </td>
            <td nowrap width="25%"> 
              <div align="right">Monto Original :</div>
            </td>
            <td nowrap width="27%">
				<input type="text" name="E01DEAOAM" size="15" maxlength="15" readonly value="<%= dftBasic.getE01DEAOAM() %>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Tasa Flotante :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAFTB" size="2" maxlength="2" readonly value="<%= dftBasic.getE01DEAFTB() %>">
              <select name="E01DEAFTY" disabled>
		  		<option value=" " <% if (!(dftBasic.getE01DEAFTY().equals("FP") ||dftBasic.getE01DEAFTY().equals("FS"))) out.print("selected"); %>></option>
                <option value="FP" <% if (dftBasic.getE01DEAFTY().equals("FP")) out.print("selected"); %>>FP</option>
                <option value="FS" <% if (dftBasic.getE01DEAFTY().equals("FS")) out.print("selected"); %>>FS</option>
              </select>
              <input type="text" name="E01FLTRTE" size="9" maxlength="9" readonly value="<%= dftBasic.getE01FLTRTE() %>" readonly>
            </td>
            <td nowrap width="25%" > 
              <div align="right">Tasa de Inter&eacute;s/Spread :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEARTE" size="10" maxlength="9" readonly value="<%= dftBasic.getE01DEARTE() %>" onKeypress="enterSignDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Documento :</div>
            </td>
            <td nowrap width="23%" >
			<select name="E01DEARET" disabled>
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
              <input type="text" name="E01DEAPEI" size="8" maxlength="7" readonly value="<%= dftBasic.getE01DEAPEI() %>" >
              <input type="text" name="E01DEAPIF" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAPIF() %>" >
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Línea de Cr&eacute;dito :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEACMC" size="9" maxlength="9" readonly  value="<%= dftBasic.getE01DEACMC().trim().equals("0") ? client :  dftBasic.getE01DEACMC() %>" >
              <input type="text" name="E01DEACMN" size="4" maxlength="4" readonly value="<%= dftBasic.getE01DEACMN() %>" >
            </td>
            <td nowrap width="25%" > 
              <div align="right">Centro de Costo : </div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEACCN" size="8" maxlength="8" readonly  value="<%= dftBasic.getE01DEACCN() %>">
            </td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Retención de Impuestos :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAWHF" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAWHF() %>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Dirección de Correo :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAMLA" size="2" readonly maxlength="2" value="<%= dftBasic.getE01DEAMLA() %>">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Comisionista :</div>
           </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEABRK" size="5" maxlength="4" readonly value="<%= dftBasic.getE01DEABRK() %>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Comisión :</div>
            </td>
            <td nowrap width="27%" > 
		<input type="text" name="E01DEABCP" size="10" maxlength="9" readonly value="<%= dftBasic.getE01DEABCP() %>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">N&uacute;mero de Referencia:</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAREF" size="12" maxlength="12" readonly value="<%= dftBasic.getE01DEAREF() %>">
            </td>
            <td nowrap width="25%" >
              <div align="right">Banco/Oficina :</div>
            </td>
            <td nowrap width="27%" > 
            <%if (userPO.getPurpose().equals("MAINTENANCE")){%> 
            <input readonly type="text" id="E01DEABNK" name="E01DEABNK" size="3" maxlength="2" value="<%= dftBasic.getE01DEABNK() %>" >
            <input readonly type="text" id="E01DEABRN" name="E01DEABRN" size="5" maxlength="4" value="<%= dftBasic.getE01DEABRN() %>" >
            <%} else {%>
            <input readonly type="text" id="E01DEABNK" name="E01DEABNK" size="3" maxlength="2" value="<%= dftBasic.getE01DEABNK() %>" onKeypress="enterInteger(event)">
            <input readonly type="text" id="E01DEABRN" name="E01DEABRN" size="5" maxlength="4" value="<%= dftBasic.getE01DEABRN() %>" onKeypress="enterInteger(event)">
            <%}%>
            </td>
          </tr>
          
          
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tipo de Interés :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAICT" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAICT() %>">
			</td>
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
             </td>
            <td nowrap width="25%" > 
              <div align="right">Cálculo de Inter&eacute;s Mora :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAPCL" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAPCL() %>" >
			</td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Tabla de Parametros :</div>
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEATLN" size="3" maxlength="2" readonly value="<%= dftBasic.getE01DEATLN() %>">
             </td>
            <td nowrap width="25%" >
              <div align="right">Período de Gracia :</div>
            </td>
            <td nowrap width="27%" > 
              <input type="text" name="E01DEAGPD" size="3" maxlength="2" readonly value="<%= dftBasic.getE01DEAGPD() %>" >
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="25%" >
              <div align="right">Porcentaje de Comisión :</div> 
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAROR" size="10" maxlength="9" readonly onKeypress="enterSignDecimal(event, 6)" value="<%= dftBasic.getE01DEAROR() %>"> 
            </td>
            
            <td nowrap width="25%" > 
              <div align="right">Porcentaje de Retención :</div>
            </td>
            <td nowrap width="27%" >
            	<input type="text" name="E01DEAPRP" size="10" maxlength="9"  readonly onKeypress="enterSignDecimal(event, 6)" value="<%= dftBasic.getE01DEAPRP() %>">
              </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="25%" > 
             <div align="right">Tabla de Tasas :</div> 
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEARTB" size="3" maxlength="2" readonly value="<%= dftBasic.getE01DEARTB() %>">
            </td>
            <td nowrap width="25%" > 
              <div align="right">Cobro del FECI :</div>
            </td>
            <td nowrap width="27%" >
            	<input type="hidden" name="E01DEATX2" id="E01DEATX2" readonly value="<%= dftBasic.getE01DEATX2() %>">
            	<input type="radio" name="CE01DEATX2" value="F" disabled  onClick="document.getElementById('E01DEATX2').value='F'"
            <%if(dftBasic.getE01DEATX2().equals("F")) out.print("checked");%>> Si 
	              <input type="radio" name="CE01DEATX2" value="N"  onClick="document.getElementById('E01DEATX2').value='N'"
	        <%if(!dftBasic.getE01DEATX2().equals("F")) out.print("checked");%> > No
            </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap width="25%" > 
             <div align="right">Tabla de Cargos :</div> 
            </td>
            <td nowrap width="23%" > 
              <input type="text" name="E01DEAOFT" size="3" maxlength="2"  readonly value="<%= dftBasic.getE01DEAOFT() %>">

              <b>&nbsp; &nbsp; Personalizar</b>
		      <img src="${pageContext.request.contextPath}/images/ico3.gif" title=". . ." align="bottom" border="0" ></a> 	
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
                <input type="text" name="E01PAGOPE" readonly value="<%= dftBasic.getE01PAGOPE() %>" size="3" maxlength="3">
                <input type="hidden" name="E01PAGGLN" value="<%= dftBasic.getE01PAGGLN() %>">
                <input type="text" name="E01PAGCON" size="25" maxlength="25" readonly value="<%= dftBasic.getE01PAGCON() %>" >
			  </div>
            </td>
            <td nowrap width="15%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBNK" size="2" maxlength="2" readonly value="<%= dftBasic.getE01PAGBNK() %>">
              </div>
            </td>
            <td nowrap width="22%" > 
              <div align="center"> 
                <input type="text" name="E01PAGBRN" size="4" maxlength="4" readonly value="<%= dftBasic.getE01PAGBRN() %>"
                  class="context-menu-help"
				  onmousedown="init(branchHelp,this.name,document.getElementById('E01DEABNK').value,'','','','')">
			  </div>
            </td>
            <td nowrap width="14%" > 
              <div align="center"> 
                <input type="text" name="E01PAGCCY" size="3" maxlength="3" readonly value="<%= dftBasic.getE01PAGCCY() %>"
                  class="context-menu-help"
				  onmousedown="init(currencyHelp,this.name,document.getElementById('E01DEABNK').value,'','','','')">
			</div>
            </td>
            <td nowrap width="16%" > 
              <div align="center"> 
                <input type="text" name="E01PAGACC" size="12" maxlength="12"  readonly value="<%= dftBasic.getE01PAGACC() %>" >
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
            <td nowrap width="33%" >Autorización Sobregiro : <input type="text" name="E01DEAODA" size="2" maxlength="1" readonly value="<%= dftBasic.getE01DEAODA() %>">
            </td>
            <td nowrap width="15%" > 
              <div align="center"> </div>
            </td>
            <td nowrap width="22%" > 
              <div align="right">Autoriza Pagos en Feriados: </div>
            </td>
            <td nowrap colspan="2" > 
              <div align="left">
                <input type="hidden" name="E01DEAHFQ" id="E01DEAHFQ" readonly value="<%= dftBasic.getE01DEAHFQ() %>">
                <input type="radio" name="CE01DEAHFQ" disabled value="1" onClick="document.getElementById('E01DEAHFQ').value='1'"
                <%if(dftBasic.getE01DEAHFQ().equals("1")) out.print("checked");%>> Si 
                <input type="radio" name="CE01DEAHFQ" value="2" onClick="document.getElementById('E01DEAHFQ').value='2'"
			  	  <%if(dftBasic.getE01DEAHFQ().equals("2")) out.print("checked");%>> No 
			  </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<TABLE class="tableinfo">
       
		<TR align="center">
			<TD align="right"><h3>Archivo : </h3></TD>
			<TD align="left">
				<H3>
			<% if ( error.getERRNUM().equals("0") && list.isEmpty()) {%>
				<input type=file name="FILENAME" height="20" size="100" maxlength="255">

			<% } else { %>
				<input type=file name="FILENAME" value=<%=userPO.getSource() %> height="20" size="100" maxlength="255"  disabled>
				
			<% } %>
				</H3>
			</TD>
		</TR>

</TABLE>
<% if ( !error.getERRNUM().equals("0")   || !list.isEmpty()) {%>
<br>

	<h4>Registros con errores</h4>
	  <table class="tableinfo">
	    <tr > 
	      <td nowrap> 
	        <table cellpadding=2 cellspacing=0 width="100%" border="0">
	          <tr id="trdark"> 
	            <td nowrap> 
	              <div align="center">Num de Linea</div>
	            </td>
	            <td nowrap> 
	              <div align="center">RFC Deudor</div>
	            </td>
	            <td nowrap> 
	              <div align="center">Referencia</div>
	            </td>
	            <td nowrap> 
	              <div align="center">Valor Negociado</div>
	            </td>
	            <td nowrap> 
	              <div align="center">Fecha Vencimiento</div>
	            </td>
	            </tr>
	<% list.initRow();
		datapro.eibs.beans.EDL080004Message msgData = new datapro.eibs.beans.EDL080004Message();
		datapro.eibs.beans.ELEERRMessage msgError = new datapro.eibs.beans.ELEERRMessage();
     	while (list.getNextRow()) {
     		datapro.eibs.sockets.MessageRecord message = (datapro.eibs.sockets.MessageRecord)list.getRecord();
     		if ("EDL080004".equals(message.getFormatName())) {
     			msgData = (datapro.eibs.beans.EDL080004Message)list.getRecord();
     			list.getNextRow();
     			msgError = (datapro.eibs.beans.ELEERRMessage)list.getRecord();
     		} else {
     			msgError = (datapro.eibs.beans.ELEERRMessage)list.getRecord();
     			list.getNextRow();
     			msgData = (datapro.eibs.beans.EDL080004Message)list.getRecord();
     		}
   			String dia = "";
   			String mes = "";
   			String ano = ""; 
   			String vencimiento = "";
   			if (currUser.getE01DTF().equals("DMY") ) {
   				vencimiento = msgData.getE04DLDMAD() + "/" +  msgData.getE04DLDMAM() + "/" + msgData.getE04DLDMAY();
			} else if (currUser.getE01DTF().equals("MDY") ) {
   				vencimiento = msgData.getE04DLDMAM() + "/" +  msgData.getE04DLDMAD() + "/" + msgData.getE04DLDMAY();
     		} else if (currUser.getE01DTF().equals("YMD") ) {
   				vencimiento = msgData.getE04DLDMAY() + "/" +  msgData.getE04DLDMAM() + "/" + msgData.getE04DLDMAD();
   			}
     	 %>

	          <tr id="trclear"> 
	            <td nowrap> 
	              <div align="center"><%= msgData.getBigDecimalE04DLDRRN().add(new BigDecimal("2")) %> </div> 
	            </td>
	            <td nowrap> 
	      	      <div align="center"><%=  msgData.getE04DLDDID() %></div> 
	            </td>
	            <td nowrap> 
	       	     <div align="center"><%= msgData.getE04DLDRFN() %></div>
	            </td>
	            <td nowrap> 
	       	    <div align="center"><%=   msgData.getE04DLDOAM() %></div>
	            </td>
	            <td nowrap width="25%"> 
	             <div align="center"><%=vencimiento%></div> 
	            </td>
	            
	          </tr>

	          <tr id="trclear"> 
	            <td nowrap> 
	              <div align="center"><font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              		<%= msgError.getField("ERDS01").getString() %>
	              		</font></div>
	            </td>
	            <td nowrap> 
	              <div align="center"><font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              <%= msgError.getField("ERDS02").getString() %>
	              </font></div>
	            </td>
	            <td nowrap> 
	              <div align="center"><font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              <%= msgError.getField("ERDS03").getString() %>
	              </font></div>
	            </td>
	            <td nowrap width="25%"> <font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              <%= msgError.getField("ERDS04").getString() %>
	              </font>
	            </td>
	            <td nowrap width="25%"> <font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              <%= msgError.getField("ERDS04").getString() %>
	              </font>
	            </td>
	            <% if (msgError.getBigDecimalERRNUM().compareTo(new BigDecimal(5)) > 0) { %>
	            <tr id="trclear"> 
	            <td nowrap> 
	              <div align="center"><font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              		<%= msgError.getField("ERDS06").getString() %>
	              		</font></div>
	            </td>
	            <td nowrap> 
	              <div align="center"><font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              <%= msgError.getField("ERDS07").getString() %>
	              </font></div>
	            </td>
	            <td nowrap> 
	              <div align="center"><font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              <%= msgError.getField("ERDS08").getString() %>
	              </font></div>
	            </td>
	            <td nowrap width="25%"> <font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              <%= msgError.getField("ERDS09").getString() %>
	              </font>
	            </td>
	            <td nowrap width="25%"> <font style="font-family: Arial, Helvetica, sans-serif;color: red;font-size: 6pt;" >
	              <%= msgError.getField("ERDS10").getString() %>
	              </font>
	            </td>
	          </tr>
	          <% } %>
	<% }%>
	        </table>
	      </td>
	    </tr>
	  </table>
	  <div align="center"> 
    <input id="EIBSBTN" type="button" name="Salir" value="Salir" onClick="goAction('S')">
  </div>	
<% }  else { %>

<div align="center"> 
    <input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction('V')">
	<input id="EIBSBTN" type="button" name="Regresar" value="Regresar" onClick="goAction('B')">
  </div>
<% } %>

  </form>

</body>
</html>
