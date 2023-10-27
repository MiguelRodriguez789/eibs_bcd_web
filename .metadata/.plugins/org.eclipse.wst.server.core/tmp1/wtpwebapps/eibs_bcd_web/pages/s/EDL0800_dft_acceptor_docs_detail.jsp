<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Draft Docs Maintenance</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/dynTable.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/cnofc.js"> </SCRIPT>


<%@ taglib uri="/WEB-INF/datapro-dyntable.tld" prefix="dyntable" %>
<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />
<jsp:useBean id="dftAcceptor" class="datapro.eibs.beans.EDL080003Message"  scope="session" />
<jsp:useBean id= "lstDocuments" class= "datapro.eibs.beans.JBObjList"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="dftDoc" class="datapro.eibs.beans.EDL080002Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">

<%if (userPO.getPurpose().equals("MAINTENANCE")){%>
   
    builtNewMenu(ln_m_opt);

<%}%>
var OK = true;
function verificaMonto() {
	var apaf07 = document.forms[0].E01APAF07.value;
	var deapct = parseFloat(document.forms[0].E01DEAPCT.value.replace(/,/g,''));
	var cien = parseFloat("100".replace(/,/g,''));
	var apaf09 = document.forms[0].E01APAF09.value;
	var lneNum = document.forms[0].E03DLDCMN.value;
	if (lneNum != 9999 && apaf07 == "Y") {
		var saldo = parseFloat(document.forms[0].E03LNEAVL.value.replace(/,/g,''));
		var formLength= document.forms[0].elements.length;
		   var amtFld = "";
		   if (apaf09 == "C") {
		   		amtFld = "dtf_E02DLDFAM_";	
		   } else {
	       		amtFld = "dtf_E02DLDOAM_";
	       }
	       for(var n=0;n<formLength;n++)
	       {
	      	  var elementName= document.forms[0].elements[n].name;
	      	  
	      	  if (elementName.length > 14) {
	      	  	var fldAmt = elementName.substring(0,14);
	      	  	if (fldAmt == amtFld ) {
					var amt = parseFloat(document.forms[0].elements[n].value.replace(/,/g,''));
					amt = amt * (deapct / cien);
					saldo = saldo - amt;
					if (saldo < 0) {
						alert("Documento Sobregira Linea de Credito")
						OK = false;
					} else {
	      	  			document.forms[0].E03LNEUSO.value = formatCCY(saldo + "");
	      	  			sessionStorage.setItem("LineAvl", document.forms[0].E03LNEUSO.value);
	      	  		}
	      	  	}
	      	  }
	       }
	   }
}
function verificaFecha() {
	var apaf07 = document.forms[0].E01APAF07.value;
	var lneNum = document.forms[0].E03DLDCMN.value;
	if (lneNum != 9999 && apaf07 == "Y") {
		var year = document.forms[0].E03LNEMAY.value;
		var month = document.forms[0].E03LNEMAM.value;
		var day = document.forms[0].E03LNEMAD.value;
		var year1 = document.forms[0].E03LNEMAY.value;
		var month1 = document.forms[0].E03LNEMAM.value;
		var day1 = document.forms[0].E03LNEMAD.value;
		var matDte = new Date();
		var lneDte = new Date();
		try {
			lneDte = new Date(year,month - 1,day);
		} catch(errLne) {
			alert("fecha de Linea Invalida");	
		}
		var formLength= document.forms[0].elements.length;
		   var dteFld = "dtf_E02DLDMA";
	       var dteFld1 = "dtf_E02DLDMAD_";
	       var dteFld2 = "dtf_E02DLDMAM_";
	       var dteFld3 = "dtf_E02DLDMAY_";
	       for(n=0;n<formLength;n++)
	       {
	      	  var elementName= document.forms[0].elements[n].name;  
	      	  if (elementName.length > 14) {
	      	  	var fldDate = elementName.substring(0,14);
	      	  	var fldDte = elementName.substring(0,12);
	      	  	if (fldDte == dteFld ) {
	      	  		for (d=0;d<3;d++) {
	      	  			if (fldDate == dteFld1) {
							day1 = document.forms[0].elements[n].value;
							if (day1.length == 1) {
								day1 = "0" + day1;
							}
						}
						if (fldDate == dteFld2) {
							month1 = document.forms[0].elements[n].value;
							if (month1.length == 1) {
								month1 = "0" + month1;
							}
						}
						if (fldDate == dteFld3) {
							year1 = document.forms[0].elements[n].value;
							if (year1.length < 4) {
								year1 = 1;
							}
						}
						n++;
						elementName= document.forms[0].elements[n].name;
						if (elementName.length > 14) {
	      	  				fldDate = elementName.substring(0,14);
	      	  				fldDte = elementName.substring(0,12);
	      	  			}
	      	  		}
	      	  		if (year1.length>3 && month1>0 && day1>0) {
	      	  			try {
							matDte = new Date(year1,month1-1,day1);
							} catch(errMat) {
								alert("fecha Vencimiento Invalida");
								OK = false;	
							}
							if (matDte > lneDte) {
								alert("Vencimiento Mayor que el Vencimiento de la Linea")
								OK = false;
							}
					}
	      	  	}
	      	  }
	       }
	   }

}
function goAction(opt) {
	   document.forms[0].ACTION.value = opt;
       var formLength= document.forms[0].elements.length;
       var ok = false;
       var nmevar = '';
       for(n=0;n<formLength;n++)
       {
      	  var elementName= document.forms[0].elements[n].name;
      	  
      	  for(m=0; m <= document.forms[0].NUMRECORDS.value;m++){
      	    nmevar = "NUMSEQ"+m;
      	  	if(elementName == nmevar && document.forms[0].elements[n].checked) {
        		  ok = true;
        		  break;
      	 	}
      	  }
       }
    if (ok == false && opt == "N") ok = true;

	if ( ok ) {
		if (opt == "A") {
			var where_to = confirm("¿Está seguro de que quiere eliminar todos los documentos?");
			if (where_to == true) {
				document.forms[0].submit();
			}
		}
		else if (opt == "D" || opt == "N") {
			document.forms[0].submit();
		}

	}
	else
	{
		alert("debe seleccionar al menos un registro");
	
	}

}
function Enviar() {
	verificaMonto();
	verificaFecha();
	if (OK) {
		document.forms[0].submit();
	}
}
function cloneCallback() {
	verificaMonto();
	verificaFecha();
}
function deleteCallback() {
	verificaMonto();
}
function deleteAllCallback()  {
	verificaMonto();
}
</SCRIPT>

</head>
<body onload="verificaMonto();verificaFecha();" >
<% 
 String strBlank = "";
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors();");
     out.println("</SCRIPT>");
 }
%> 
<h3 align="center">Detalle de Documentos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_acceptor_docs_detail.jsp,EDL0800"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1811">
  <INPUT TYPE=HIDDEN NAME="totalRow" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NUMRECORDS" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="NUMINI" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="ACTION" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="FREC" VALUE="0">
  <INPUT TYPE=HIDDEN NAME="TYPFREC" VALUE="">
  <INPUT TYPE=HIDDEN NAME="E03LNEAVL" Value="<%=dftAcceptor.getE03LNEAVL() %>">
  <INPUT TYPE=HIDDEN NAME="E03CUMMAN" Value="<%=dftAcceptor.getE03CUMMAN() %>">
  <INPUT TYPE=HIDDEN NAME="E01APAF07" Value="<%=dftBasic.getE01APAF07() %>">
  <INPUT TYPE=HIDDEN NAME="E01APAF09" Value="<%=dftBasic.getE01APAF09() %>">
  <INPUT TYPE=HIDDEN NAME="E01DEAPCT" Value="<%=dftBasic.getE01DEAPCT() %>">
  
  <% //TYPFREC : D - days , M - months , Y - years %>
  <% int deaict = 0;
  	try { 
        deaict = Integer.valueOf(dftBasic.getE01DEAICT().trim());
  	} catch (Exception e) {
        deaict = 0;
   	} %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :<%=deaict %></b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left">
                <INPUT type="text" name="E01DEACUN" size="10" maxlength="9" value="<%= userPO.getCusNum()%>" readonly>
                </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"><font face="Arial"><font face="Arial"><font size="2">
                <INPUT type="text" name="E01CUSNA1" size="45" maxlength="45" value="<%= userPO.getCusName() %>" readonly>
                </font></font></font></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta :</b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left">
                <INPUT type="text" name="E01DEAACC" size="13" maxlength="12" value="<%= userPO.getIdentifier() %>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <INPUT type="text" name="E01DEACCY" size="4" maxlength="3" value="<%= userPO.getCurrency() %>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b>
                <INPUT type="text" name="E01DEAPRO" size="4" maxlength="4" value="<%= userPO.getProdCode() %>" readonly>
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Documentos del Deudor - Monto de la linea antes de estos Documentos : <%=dftAcceptor.getE03LNEAVL() %></h4>
<table cellpadding="2" cellspacing="0" width="100%" border="0" class="tableinfo">
 <tr id="trdark">
  <td nowrap width="25%"> 
  <div align="right">Identificación :</div>
  </td>
  <td nowrap width="25%"> 
  <input type="text" name="E03NUMIDE" size="25" maxlength="25" value="<%= dftAcceptor.getE03NUMIDE() %>" readonly>
  </td>
  <td nowrap width="25%"> 
  <div align="right">Direccion :</div>
  </td>
  <td nowrap width="25%"> 
  <input type="text" name="E03CUMMAN" size="3" maxlength="2" value="<%= dftAcceptor.getE03CUMMAN() %>" readonly>
  </td>
  <td nowrap width="16%">
  <div align="right">Nombre :</div>
  </td>
  <td nowrap width="20%">
  <input type="text" name="E03CUMMA1" size="60" maxlength="60" value="<%= dftAcceptor.getE03CUMMA1() %>" readonly>
  </td>
  <td nowrap width="25%">
  <div align="right">Dias Para Ejercer Recursos :</div>
  </td>
  <td nowrap width="20%">
  <input type="text" name="E03CUMNST" size="5" maxlength="5" value="<%= dftAcceptor.getE03CUMNST() %>" readonly>
  </td>
 </tr>
  <tr id="trdark">
  <td nowrap width="25%"> 
  <div align="right">Cliente:</div>
  </td>
  <td nowrap width="25%"> 
  <input type="text" name="E03CUN" size="10" maxlength="9" value="<%= dftAcceptor.getE03CUN() %>" readonly>
  </td>
  <td nowrap width="25%"> 
  <div align="right">Linea de Credito:</div>
  </td>
  <td nowrap width="25%"> 
  <input type="text" name="E03DLDCMN" size="5" maxlength="4" value="<%= dftAcceptor.getE03DLDCMN() %>" readonly>
  </td>
  <td nowrap width="16%">
  <div align="right">Monto Disponible :</div>
  </td>
  <td nowrap width="20%">
     <input type="text" name="E03LNEUSO" size="20" maxlength="18" onblur="verificaMonto()" readonly>
  </td>
  <td nowrap width="16%">
  <div align="right">Fecha de Vencimiento :</div>
  </td>
  <td nowrap width="20%">
  <% if (currUser.getE01DTF().equals("MDY") ) { %>
  	<input type="text" name="E03LNEMAM" size="2" maxlength="2" value="<%= dftAcceptor.getE03LNEMAM() %>" readonly>
  	<input type="text" name="E03LNEMAD" size="2" maxlength="2" value="<%= dftAcceptor.getE03LNEMAD() %>" readonly>
  	<input type="text" name="E03LNEMAY" size="4" maxlength="4" value="<%= dftAcceptor.getE03LNEMAY() %>" readonly>
  <% } else { %>
  	<input type="text" name="E03LNEMAD" size="2" maxlength="2" value="<%= dftAcceptor.getE03LNEMAD() %>" readonly>
  	<input type="text" name="E03LNEMAM" size="2" maxlength="2" value="<%= dftAcceptor.getE03LNEMAM() %>" readonly>
  	<input type="text" name="E03LNEMAY" size="4" maxlength="4" value="<%= dftAcceptor.getE03LNEMAY() %>" readonly>
  <% } %>
  </td>
  </tr>
</table>
<% // checks
	String urlRelated = false ? "/servlet/datapro.eibs.tools.JSEDI0110Docs?ADD=true&ACCOUNT=" + userPO.getIdentifier() : "";
	if (dftBasic.getE01DEARET().trim().equals("4")){ 
%>
<dyntable:params list="lstDocuments" name="dtf" form="dftDoc" actionClone="true" width="600"
	 urlDetail="/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1800&ADD=true&LNEAVL=<%=dftDoc.getE02AVLAMT()%>"
	 urlRelated="<%= urlRelated %>" >
	
		<dyntable:element fn_name='E02DLDNDR' fn_value='' fn_type='TEXT' fn_label='' maxlength="9">
			<dyntable:element-column-caption>Secuencia</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DLDRFN' fn_value='' fn_type='TEXT' fn_label='' maxlength="11">
			<dyntable:element-column-caption>Documento</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='' fn_value='' fn_type='TEXT' 
			fn_nameD='E02DLDMAD' fn_nameM='E02DLDMAM' fn_nameY='E02DLDMAY' 
			fn_nameD_value='' fn_nameM_value='' fn_nameY_value=''>
			<dyntable:element-column-caption>Fecha de<br>Pago</dyntable:element-column-caption>			
		</dyntable:element>
		<dyntable:element fn_name='' fn_value='' fn_type='TEXT' 
			fn_nameD='E02DLDPDD' fn_nameM='E02DLDPDM' fn_nameY='E02DLDPDY' 
			fn_nameD_value='E02DLDPDD' fn_nameM_value='E02DLDPDM' fn_nameY_value='E02DLDPDY'  onblur='verificaFecha()' readonly="true">
			<dyntable:element-column-caption>Fecha para Ejercer<br>el Recurso</dyntable:element-column-caption>			
		</dyntable:element>
		<dyntable:element fn_name='E02DLDOAM' fn_value='' fn_type='TEXT' maxlength='15' onblur='verificaMonto()'>
			<dyntable:element-column-caption>Valor<br> cheque</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='' fn_value='' fn_type='TEXT' 
			fn_nameD='E02DLDMAD' fn_nameM='E02DLDMAM' fn_nameY='E02DLDMAY' 
			fn_nameD_value='' fn_nameM_value='' fn_nameY_value='' >
			<dyntable:element-column-caption>Fecha<br>Vence</dyntable:element-column-caption>			
		</dyntable:element>
		<dyntable:element fn_name='E02DLDEXT' fn_value='' fn_type='SELECT'>
			<dyntable:element-column-caption>Tipo de Cambio</dyntable:element-column-caption>
			<dyntable:select>
				<dyntable:option value=""></dyntable:option>
				<dyntable:option value="1">Oficial</dyntable:option>
				<dyntable:option value="2">Observado</dyntable:option>
				<dyntable:option value="3">Compra/Venta</dyntable:option>
			</dyntable:select>			
		</dyntable:element>
		<dyntable:element fn_name='E02DLDCOI' fn_value='' fn_type='TEXT' maxlength='4'>
			<dyntable:element-column-caption>Instr.<br>Cobro</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DLDKBK' fn_value='' fn_type='TEXT' maxlength='2' align="right">
			<dyntable:element-column-caption>Banco</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DLDKBR' fn_value='' fn_type='TEXT' maxlength='4' align="right">
			<dyntable:element-column-caption>Sucursal</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DLDCTA' fn_value='' fn_type='TEXT' maxlength='12' align="right">
			<dyntable:element-column-caption>Cuenta<br>Cheque</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DLDCHQ' fn_value='' fn_type='TEXT' maxlength='9' align="right">
			<dyntable:element-column-caption>Numero<br>Cheque</dyntable:element-column-caption>
		</dyntable:element>
</dyntable:params>

<% } else { %>

<dyntable:params list="lstDocuments" name="dtf" form="dftDoc" actionClone="true" width="600"

	urlDetail="/servlet/datapro.eibs.products.JSEDL0800?SCREEN=1800&ADD=true"
	urlRelated="<%= urlRelated %>" >
	
		<dyntable:element fn_name='E02DLDNDR' fn_value='' fn_type='TEXT' fn_label='' maxlength="9">
			<dyntable:element-column-caption>Secuencia</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DLDRFN' fn_value='' fn_type='TEXT' fn_label='' maxlength="11">
			<dyntable:element-column-caption>Numero de <br>Documento</dyntable:element-column-caption>
		</dyntable:element>
		<% if (dftBasic.getE01APAF14().trim().equals("Y") ) { %>
			<dyntable:element fn_name='' fn_value='' fn_type='TEXT' 
			fn_nameD='E02DLDD5D' fn_nameM='E02DLDD5M' fn_nameY='E02DLDD5Y' 
			fn_nameD_value='E02DLDD5D' fn_nameM_value='E02DLDD5M' fn_nameY_value='E02DLDD5Y'  onblur='verificaFecha()'>
			<dyntable:element-column-caption>Fecha Emision<br>Documento</dyntable:element-column-caption>			
			</dyntable:element>
			<dyntable:element fn_name='' fn_value='' fn_type='TEXT' 
			fn_nameD='E02DLDD6D' fn_nameM='E02DLDD6M' fn_nameY='E02DLDD6Y' 
			fn_nameD_value='E02DLDD6D' fn_nameM_value='E02DLDD6M' fn_nameY_value='E02DLDD6Y'  onblur='verificaFecha()'>
			<dyntable:element-column-caption>Fecha Vencimiento<br>Documento</dyntable:element-column-caption>			
			</dyntable:element>
		<% } else { %>
			<dyntable:element fn_name='' fn_value='' fn_type='TEXT' 
			fn_nameD='E02DLDMAD' fn_nameM='E02DLDMAM' fn_nameY='E02DLDMAY' 
			fn_nameD_value='E02DLDMAD' fn_nameM_value='E02DLDMAM' fn_nameY_value='E02DLDMAY'  onblur='verificaFecha()'>
			<dyntable:element-column-caption>Fecha de<br>Vencimiento</dyntable:element-column-caption>			
		</dyntable:element>
		<% } %>
		

		<dyntable:element fn_name='' fn_value='' fn_type='TEXT' 
			fn_nameD='E02DLDPDD' fn_nameM='E02DLDPDM' fn_nameY='E02DLDPDY' 
			fn_nameD_value='E02DLDPDD' fn_nameM_value='E02DLDPDM' fn_nameY_value='E02DLDPDY' readonly="true">
			<dyntable:element-column-caption>Fecha para<br>Ejercer Recurso</dyntable:element-column-caption>			
		</dyntable:element>
		<dyntable:element fn_name='E02DLDFAM' fn_value='' fn_type='TEXT' maxlength='15' onblur='verificaMonto()'>
			<dyntable:element-column-caption>Monto<br>Documento</dyntable:element-column-caption>
		</dyntable:element>
		<% if (!dftBasic.getE01APAF09().trim().equals("C") ) { %>
		<dyntable:element fn_name='E02DLDOAM' fn_value='' fn_type='TEXT' maxlength='15' onblur='verificaMonto()' >
			<dyntable:element-column-caption>Monto<br>Negociado</dyntable:element-column-caption>
		</dyntable:element>
		<% } %>
		<% if (dftBasic.getE01APAF13().equals("N") ) { %>
		<% if (deaict > 0 && deaict < 7 )  { %>
			<dyntable:element fn_name='E02DLDSPR' fn_value='' fn_type='TEXT' maxlength='10'>
			<dyntable:element-column-caption>Tasa<br>Efectiva</dyntable:element-column-caption>
			</dyntable:element>
		<% } else { %>
			<dyntable:element fn_name='E02DLDARC' fn_value='' fn_type='TEXT' maxlength='10'>
			<dyntable:element-column-caption>Tasa<br>Nominal</dyntable:element-column-caption>
			</dyntable:element>
		<% } %>
		<% } %>
		<dyntable:element fn_name='E02DLDACC' fn_value='' fn_type='TEXT' maxlength='20'>
			<dyntable:element-column-caption>Cuenta de Débito</dyntable:element-column-caption>
		</dyntable:element>
		<dyntable:element fn_name='E02DLDEXT' fn_value='' fn_type='SELECT'>
			<dyntable:element-column-caption>Tipo de Cambio</dyntable:element-column-caption>
			<dyntable:select>
				<dyntable:option value=""></dyntable:option>
				<dyntable:option value="1">Oficial</dyntable:option>
				<dyntable:option value="2">Observado</dyntable:option>
				<dyntable:option value="3">Compra/Venta</dyntable:option>
			</dyntable:select>			
		</dyntable:element>
</dyntable:params>
<% } %> 
<%	if (lstDocuments.size()  > 10) { %>
        <SCRIPT type="text/javascript">
               document.forms[0].totalRow.value="<%= lstDocuments.size() %>";
   		</SCRIPT>	 
<%	}  %>
	<SCRIPT type="text/javascript">
		document.forms[0].NUMRECORDS.value="<%= lstDocuments.size() %>";
   	</SCRIPT>

<br>
  <div align="center"> 
    <input id="EIBSBTN" type=button onclick="Enviar()" name="Submit" value="Enviar">
  </div>

<SCRIPT type="text/javascript">
setCenterSize(1200, 600);

$().ready(function(){
	$("td").attr("nowrap","nowrap");
});
</SCRIPT>
</form>
</body>
</html>
