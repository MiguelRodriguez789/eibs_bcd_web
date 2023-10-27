
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%><html>
<%@ page import = "datapro.eibs.master.Util" %><%@page import="java.math.BigDecimal"%>
<META HTTP-EQUIV="Pragma" CONTENT="No-cache">
<html>
<head>
<title>Pagos</title>
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util" %>
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id= "docData" class= "datapro.eibs.beans.DataPayDoc"  scope="session" />
<jsp:useBean id= "payDoc" class= "datapro.eibs.beans.EDL082501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript">

function goAction(opt) {
	document.forms[0].SCREEN.value = "" + opt;
	document.forms[0].submit();
}

function chgDate(){
	document.getElementById("buttonRecalc").style.display = "block";
	document.getElementById("buttonSubmit").style.display = "none";
}

function devIntClick(value){
	var principal = parseFloat("0.00");
    var interes   = parseFloat("0.00");
    var mora      = parseFloat("0.00");
    var comision  = parseFloat("0.00");
    var impuesto  = parseFloat("0.00");
    var retencion = parseFloat("0.00");
    var excedente = parseFloat("0.00");
    var iva       = parseFloat("0.00");
    var deduccion = parseFloat("0.00");
    var reval     = parseFloat("0.00");
    var cobranza  = parseFloat("0.00");
    var otros     = parseFloat("0.00");
    try{
		principal = parseFloat(document.forms[0].E01PAGVDO.value);
	} catch(e){
    	 principal = parseFloat("0.00");
    }
    try{
		interes   = parseFloat(document.forms[0].E01PAGINT.value);
	} catch(e){
     	interes   = parseFloat("0.00");
    }
    try{
		mora      = parseFloat(document.forms[0].E01PAGMOR.value);
	} catch(e){
    	 mora	  = parseFloat("0.00");
    }
    try{
		comision  = parseFloat(document.forms[0].E01PAGCOM.value);
	} catch(e){
     comision	  = parseFloat("0.00");
    }
    try{
		impuesto  = parseFloat(document.forms[0].E01PAGIMP.value);
	} catch(e){
     impuesto	  = parseFloat("0.00");
    }
     try{
		retencion  = parseFloat(document.forms[0].E01PAGHAM.value);
	} catch(e){
     retencion	  = parseFloat("0.00");
    }
     try{
		excedente  = parseFloat(document.forms[0].E01PAGEXC.value);
	} catch(e){
     excedente	  = parseFloat("0.00");
    }
    try{
		iva       = parseFloat(document.forms[0].E01PAGIVA.value);
	} catch(e){
     iva		  = parseFloat("0.00");
    }
    try{
		deduccion = parseFloat("0.00");
	} catch(e){
     deduccion	  = parseFloat("0.00");
    }
    try{
		reval     = parseFloat(document.forms[0].E01PAGREA.value);
	} catch(e){
     reval		  = parseFloat("0.00");
    }
    try{
		cobranza  = parseFloat("0.00");
	} catch(e){
     	cobranza  = parseFloat("0.00");
    }
    try{
		otros     = parseFloat("0.00");
	} catch(e){
     	otros  	  = parseFloat("0.00");
    }

	var totInt;
	var totPag;
	try{
     totPag = parseFloat(document.forms[0].TOT.value);}
    catch(e){
     totPag = 0.00;
    }
    try{
     totInt = parseFloat(document.forms[0].INT.value).toFixed(2);}
    catch(e){
     totInt = 0.00;
    }

	var divDevInt = document.getElementById("devInt");
	
	if (value == "Y"){
		hold.style.display="";
		plus.style.display="";
		divDevInt.style.display="";
		totPag = totPag + interes - retencion - excedente;
		totPag = totPag.toFixed(2);
	}
	else {
		totPag = totPag.toFixed(2);
		totPag = principal + mora + comision + impuesto + iva + deduccion + reval + cobranza + otros;
		divDevInt.style.display="none";
		hold.style.display="none";
		plus.style.display="none";
	}
	document.forms[0].E01PAGTOT.value = formatCCY(""+totPag);
	document.forms[0].E01PAGAMT.value = formatCCY(""+totPag);
}

function UpdateTotal(value, fld){
	value = parseFloat(value);
	if ( isNaN(value) ) {
    	value=0.00;
    }

    var pp0 = parseInt("0", 10);
    var pp1 = parseInt("0", 10);
    var pp2 = parseInt("0", 10);
    var pp3 = parseInt("0", 10);
    var pp4 = parseInt("0", 10);
    var pp5 = parseInt("0", 10);
    var pp6 = parseInt("0", 10);
    var pp7 = parseInt("0", 10);
    var pp8 = parseInt("0", 10);
    var pp9 = parseInt("0", 10);
    try {
    	pp1 = parseInt(document.forms[0].E01DEAPP1.value, 10);
    	pp2 = parseInt(document.forms[0].E01DEAPP2.value, 10);
    	pp3 = parseInt(document.forms[0].E01DEAPP3.value, 10);
    	pp4 = parseInt(document.forms[0].E01DEAPP4.value, 10);
    	pp5 = parseInt(document.forms[0].E01DEAPP5.value, 10);
    	pp6 = parseInt(document.forms[0].E01DEAPP6.value, 10);
    	pp7 = parseInt(document.forms[0].E01DEAPP7.value, 10);
    	pp8 = parseInt(document.forms[0].E01DEAPP8.value, 10);
    	pp9 = parseInt(document.forms[0].E01DEAPP9.value, 10);
    } catch (e) {
    	alert("Error");
    }

    var priority = [pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9];
	var montos = new Array(7);
	
    var principal = parseFloat("0.00");
    var interes   = parseFloat("0.00");
    var mora      = parseFloat("0.00");
    var comision  = parseFloat("0.00");
    var impuesto  = parseFloat("0.00");
    var iva       = parseFloat("0.00");
    var hold      = parseFloat("0.00");
	var exc       = parseFloat("0.00");
    var deduccion = parseFloat("0.00");
    var reval     = parseFloat("0.00");
    var cobranza  = parseFloat("0.00");
    var otros     = parseFloat("0.00");
    try{
    	principal = parseFloat(document.forms[0].PRINCIPAL.value);
    } catch(e){
     	principal = parseFloat("0.00");
    }
    try{
    	interes = parseFloat(document.forms[0].INTERES.value);
    } catch(e){
     	interes = parseFloat("0.00");
    }
    try{
    	mora = parseFloat(document.forms[0].PAGMORA.value);
    } catch(e){
     	mora = parseFloat("0.00");
    }
    try{
    	reval = parseFloat(document.forms[0].REVAL.value);
    } catch(e){
     	reval = parseFloat("0.00");
    }

    try{
    	iva = parseFloat(document.forms[0].IVA.value);
    } catch(e){
     	iva = parseFloat("0.00");
    }
    try{
    	hold = parseFloat(document.forms[0].E01PAGHAM.value);
    } catch(e){
      hold = parseFloat("0.00");
    }
    try{
    	exc = parseFloat(document.forms[0].E01PAGEXC.value);
    } catch(e){
     	exc = parseFloat("0.00");
    }
    try{
    	comision = parseFloat(document.forms[0].COMISION.value);
    } catch(e){
     	comision = parseFloat("0.00");
    }
    try{
    	impuesto = parseFloat(document.forms[0].IMPUESTO.value);
    } catch(e){
     	impuesto = parseFloat("0.00");
    }
	var devInt = document.getElementsByName("E01DEVINT");
	if (devInt[1].checked){
		interes = parseFloat("0.00");
		hold 	= parseFloat("0.00");
		exce	= parseFloat("0.00");
	}
    switch (fld) {
		case "PRI":
			document.forms[0].E01PAGVDO.value = formatCCY(""+value);
			break;
		case "MOR":
			document.forms[0].E01PAGMOR.value = formatCCY(""+value);
			break;
		case "REV":
			document.forms[0].E01PAGREA.value = formatCCY(""+value);
			break;
		case "INT":
			document.forms[0].E01PAGINT.value = formatCCY(""+value);
			break;
		case "HLD":
			document.forms[0].E01PAGHAM.value = formatCCY(""+value);
			hold = value;
			break;
		case "EXC":
			document.forms[0].E01PAGEXC.value = formatCCY(""+value);
			exc = value;
			break;
		case "IVA":
			document.forms[0].E01PAGIVA.value = formatCCY(""+value);
			break;
		case "COM":
			document.forms[0].E01PAGCOM.value = formatCCY(""+value);
			break;
		case "IMP":
			document.forms[0].E01PAGIMP.value = formatCCY(""+value);
			break;
		case "TOT":
			document.forms[0].E01PAGTOT.value = formatCCY(""+value);
			break;
	}

   var numval;
   var total;
    if ( isNaN(value) ) {
    	value=0.00;
    }
    if (fld!="TOT") {
   		total=parseFloat(principal)+parseFloat(mora)+parseFloat(reval)+parseFloat(interes)-parseFloat(hold)-parseFloat(exc)+parseFloat(iva)+parseFloat(comision)+parseFloat(impuesto);
   		total = total.toFixed(2);
   		document.forms[0].E01PAGTOT.value=formatCCY(total);
   		document.forms[0].E01PAGAMT.value = formatCCY(""+total);
    } else {
		montos[pp1] = principal;
		montos[pp2] = interes;
		montos[pp3] = mora;
   		montos[pp4] = comision;
   		montos[pp5] = impuesto;
   		montos[pp6] = deduccion;
   		montos[pp7] = reval;
   		montos[pp8] = cobranza;
   		montos[pp9] = otros;

   		var val = parseFloat(value);
   		for (var i = 1;i < 10;i++) {
   			var amt = parseFloat(montos[i]);
   			val = parseFloat(val);
   			if (null == amt || isNaN(amt)) {
   				amt = "0.00";
   			}
   			if (null == val || isNaN(val)) {
   				val = "0.00";
   			}

   			if (parseFloat(amt) > parseFloat(val)) {
   				montos[i] = parseFloat(val);
   				if (parseInt(i, 10) == parseInt(pp5, 10)) {
   					if (parseFloat(iva) > parseFloat(value)) {
   						iva = parseFloat(value);
   						value = parseFloat(val) - parseFloat(iva);
   					}
   				}
   			} else {
   				//montos[i] = parseFloat(val);
   			} 
   			if (null == montos[i] || isNaN(montos[i])) {
   				montos[i] = "0.00";
   			}
   			if (null == val || isNaN(val)) {
   				val = "0.00";
   			}

   			val = parseFloat(val) - parseFloat(montos[i]);


   		}
		document.forms[0].E01PAGVDO.value = formatCCY(""+montos[pp1]);
		document.forms[0].E01PAGINT.value = formatCCY(""+montos[pp2]);
		document.forms[0].E01PAGMOR.value = formatCCY(""+montos[pp3]);
		document.forms[0].E01PAGCOM.value = formatCCY(""+montos[pp4]);
		document.forms[0].E01PAGIVA.value = formatCCY(""+montos[pp5]);
		//document.forms[0].E01PAGVDO.value = formatCCY(montos[pp6]);
		try {
			document.forms[0].E01PAGREA.value = formatCCY(""+montos[pp7]);
		} catch (e) {
		}
		//document.forms[0].E01PAGVDO.value = formatCCY(montos[pp8]);
		//document.forms[0].E01PAGVDO.value = formatCCY(montos[pp9]);
		if (montos[pp1] > 0) {
			document.getElementById("buttonRecalc").style.display = "block";
			document.getElementById("buttonSubmit").style.display = "none";
		}
		document.forms[0].E01PAGAMT.value = formatCCY(""+document.forms[0].E01PAGTOT.value);
   	}
  }
  
  function UpdateTemp(value){
    document.forms[0].TMPAMT.value=formatCCY(value);
  }

</SCRIPT>
</head>
<body>
<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
   
</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT Language="Javascript">;
            showErrors();
     </SCRIPT>
 <%
 }
%>
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0825">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
	<INPUT TYPE=HIDDEN NAME="TMPAMT" VALUE="">
	<INPUT TYPE=HIDDEN NAME="E01PAGANT" VALUE="<%= payDoc.getE01PAGANT() %>">
	<INPUT TYPE=HIDDEN NAME="E01DEACUN" VALUE="<%= payDoc.getE01DEACUN() %>">
	<INPUT TYPE=HIDDEN NAME="BANK" VALUE="<%= payDoc.getE01DLDBNK() %>">
	<INPUT TYPE=HIDDEN NAME="INT" VALUE="<% if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGINT()); else out.print(payDoc.getE01TRNINT());%>">
	<INPUT TYPE=HIDDEN NAME="TOT" VALUE="<% if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGTOT()); else out.print(payDoc.getE01TRNTOT());%>">
	
	<INPUT TYPE=HIDDEN NAME="PRINCIPAL" VALUE="<%= payDoc.getE01TRNVDO()%>">
	<INPUT TYPE=HIDDEN NAME="INTERES" VALUE="<%= payDoc.getE01TRNINT()%>">
	<INPUT TYPE=HIDDEN NAME="PAGINTERES" VALUE="<%= payDoc.getE01PAGINT()%>">
	<INPUT TYPE=HIDDEN NAME="MORA" VALUE="<%= payDoc.getE01TRNMOR()%>">
	<INPUT TYPE=HIDDEN NAME="PAGMORA" VALUE="<%= payDoc.getE01PAGMOR()%>">
	<INPUT TYPE=HIDDEN NAME="COMISION" VALUE="<%= payDoc.getE01TRNCOM()%>">
	<INPUT TYPE=HIDDEN NAME="IVA" VALUE="<%= payDoc.getE01TRNIVA()%>">
	<INPUT TYPE=HIDDEN NAME="IMPUESTO" VALUE="<%=payDoc.getE01TRNIMP()%>">
	<INPUT TYPE=HIDDEN NAME="HOLD" VALUE="<%=payDoc.getE01DEAHAM()%>">
	<INPUT TYPE=HIDDEN NAME="EXCE" VALUE="<%=payDoc.getE01DLDEXC()%>">
	<INPUT TYPE=HIDDEN NAME="DEDUCCION" VALUE="0.00">
	<INPUT TYPE=HIDDEN NAME="REVAL" VALUE="<%= payDoc.getE01TRNREA()%>">
	<INPUT TYPE=HIDDEN NAME="COBRANZA" VALUE="0.00">
	<INPUT TYPE=HIDDEN NAME="OTROS" VALUE="0.00">
	
	<INPUT TYPE=HIDDEN NAME="E01DEAPP1" VALUE="<%= payDoc.getE01DEAPP1()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPP2" VALUE="<%= payDoc.getE01DEAPP2()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPP3" VALUE="<%= payDoc.getE01DEAPP3()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPP4" VALUE="<%= payDoc.getE01DEAPP4()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPP5" VALUE="<%= payDoc.getE01DEAPP5()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPP6" VALUE="<%= payDoc.getE01DEAPP6()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPP7" VALUE="<%= payDoc.getE01DEAPP7()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPP8" VALUE="<%= payDoc.getE01DEAPP8()%>">
	<INPUT TYPE=HIDDEN NAME="E01DEAPP9" VALUE="<%= payDoc.getE01DEAPP9()%>">
	
	
	<% int opt = 0; %>
  <h3 align="center">Pagos</h3>
  <table class="tableinfo" cellpadding="2" cellspacing="0">
    <tr id="trdark">
	  <td align="right" width="20%" nowrap> <b> Cuenta : </b></td>
	  <td align="left" nowrap><%= payDoc.getE01DEAACC() %><b> - </b><%= payDoc.getE01CUSNA1() %> </td>
      <td nowrap align="left"> <b>No. Documento : </b><%= payDoc.getE01SELNDR() %> 
      </td> 
    </tr> 
	<tr id="trdark">
	  <td align="right" width="20%"> <b>Aceptante : </b></td>
	  <td align="left" nowrap colspan=2>
       <%= payDoc.getE01SELDID() %><b> - </b><%= payDoc.getE01ACPNME() %>
      </td>
	</tr>  
  </table>
  <BR>
  <table class="tableinfo" cellpadding="2" cellspacing="2">
    <tr> 
      <td nowrap>  
  <table width="100%">
    <tr> 
      <td id=trdark width="20%" nowrap>    
      </td>
	  <td id=trdark width="40%" nowrap align="center"> 
		A Pagar
      </td>
      <td id=trdark width="40%" nowrap  align="center"> 
        Pagado 
	  </td>
    </tr>
    <tr> 
      <td  width="20%" nowrap>  
        <div align="right"><b>Principal Documento :</b><br>
        	<b>Principal Negociado :</b>	
        </div>
      </td>
	  <td width="40%" nowrap align="right"> 
	  	<%= payDoc.getE01DLDFBL() %> <BR>
			<%= payDoc.getE01DLDBAL() %>
		<!--  <%= payDoc.getE01TRNVDO() %> -->
      </td>
      <td width="40%" nowrap  align="right"> 
        <input type="text" name="E01PAGVDO" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGVDO()); else out.print(payDoc.getE01TRNVDO());%>" 
		onKeypress="enterDecimalNew(event)" onChange="UpdateTotal(this.value,'PRI')" onfocus="UpdateTemp(this.value)" readonly >
      </td>
    </tr>
    <tr> 
      <td width="20%" nowrap>  
        <div align="right"><b>Mora : </b></div>
      </td>
	  <td width="40%" nowrap align="right"> 
		<%= payDoc.getE01TRNMOR()%> 
      </td>
      <td width="40%" nowrap align="right"> 
        <input type="text" name="E01PAGMOR" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGMOR()); else out.print(payDoc.getE01TRNMOR());%>"
		onKeypress="enterDecimalNew(event)" onChange="UpdateTotal(this.value,'MOR')" onFocus="UpdateTemp(this.value)" readonly >
      </td>
    </tr>
    <tr> 
      <td width="20%" nowrap>  
        <div align="right"><b>Ajuste de Mora : </b></div>
      </td>
	  <td width="40%" nowrap align="right"> 
		<%= payDoc.getE01TRNAJM()%> 
      </td>
      <td width="40%" nowrap align="right"> 
      </td>
    </tr>
    <% if (payDoc.getH01FLGWK3().equals("R")) {%> 
     <tr> 
      <td width="20%" nowrap>  
        <div align="right"><b>Reajuste : </b></div>
      </td>
	  <td width="40%" nowrap align="right"> 
		<%= payDoc.getE01TRNREA()%> 
      </td>
      <td width="40%" nowrap align="right"> 
        <input type="text" name="E01PAGREA" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGREA()); else out.print(payDoc.getE01TRNREA());%>"
		onKeypress="enterDecimalNew(event)" onChange="UpdateTotal(this.value,'REV')" onFocus="UpdateTemp(this.value)" readonly>
      </td>
    </tr>
    <%
      }
    %>
    <tr>
      <td width="100%" colspan="3" nowrap>  
		<div id="devInt" align="center"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr> 
		      <td width="20%" nowrap>  
		        <div align="right"><b>Saldo de Interés : </b></div>
		      </td>
			  <td width="40%" nowrap align="right"> 
				<%= payDoc.getE01TRNINT()%> 
		      </td>
		      <td width="40%" nowrap align="right"> 
		      <input type="text" name="E01PAGINT" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGINT()); else out.print(payDoc.getE01TRNINT());%>"
				onKeypress="enterDecimalNew(event)" onChange="UpdateTotal(this.value,'INT')" onFocus="UpdateTemp(this.value)" readonly>
		      </td>
          </tr>
          <tr> 
		      <td width="20%" nowrap>  
		        <div align="right"><b>Ajuste de Interes : </b></div>
		      </td>
		      <td width="40%" nowrap align="right"> 
		        <%= payDoc.getE01TRNAJI()%> 
		      </td>
		      <td width="40%" nowrap align="right"> 
		      </td>
          </tr>
         </table>
		</div> 
      </td>
    </tr>
    <tr>
      <td width="100%" colspan="3" nowrap>  
		<div id="hold" align="center"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr> 
		      <td width="20%" nowrap>  
		        <div align="right"><b>Monto Retenido : </b></div>
		      </td>
			  <td width="40%" nowrap align="right"> 
				<%= payDoc.getE01DEAHAM()%> 
		      </td>
		      <td width="40%" nowrap align="right"> 
		      <input type="text" name="E01PAGHAM" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGHAM()); else out.print(payDoc.getE01TRNHAM());%>"
					onKeypress="enterDecimal()" onblur="UpdateTotal(this.value, 'HLD')" >
		      </td>
          </tr>
         </table>
		</div> 
      </td>
    </tr>
    <tr>
      <td width="100%" colspan="3" nowrap>  
		<div id="plus" align="center"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" >
          <tr> 
		      <td width="20%" nowrap>  
		        <div align="right"><b>Excedente : </b></div>
		      </td>
			  <td width="40%" nowrap align="right"> 
				<%= payDoc.getE01DLDEXC()%> 
		      </td>
		      <td width="40%" nowrap align="right">
		      <input type="text" name="E01PAGEXC" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGEXC()); else out.print(payDoc.getE01TRNEXC());%>"
					onKeypress="enterDecimal()" onblur="UpdateTotal(this.value, 'EXC')" > 
		      </td>
          </tr>
         </table>
		</div> 
      </td>
    </tr>
    <tr>
      <td width="20%" nowrap>
        <div align="right"><b><%if (currUser.getE01INT().equals("07") ) { out.print("FECI :"); } else { out.print("I.V.A. :"); } %> </b></div>
      </td>
	  <td width="40%" nowrap align="right"> 
		<%= payDoc.getE01TRNIVA() %> 
      </td>
      <td width="40%" nowrap align="right"> 
        <input type="text" name="E01PAGIVA" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGIVA()); else out.print(payDoc.getE01TRNIVA());%>" 
		onKeypress="enterDecimalNew(event)" onChange="UpdateTotal(this.value,'IVA')" onfocus="UpdateTemp(this.value)" readonly>
      </td>
    </tr>
    <tr> 
      <td  width="20%" nowrap>  
        <div align="right"><b>Comisión : </b></div>
      </td>
	  <td width="40%" nowrap align="right"> 
		<%= payDoc.getE01TRNCOM() %> 
      </td>
      <td width="40%" nowrap align="right"> 
        <input type="text" name="E01PAGCOM" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGCOM()); else out.print(payDoc.getE01TRNCOM());%>" 
		onKeypress="enterDecimalNew(event)" onChange="UpdateTotal(this.value,'COM')" onfocus="UpdateTemp(this.value)" readonly>
      </td>
    </tr>
    <tr> 
      <td  width="20%" nowrap>  
        <div align="right"><b>Impuesto : </b></div>
      </td>
	  <td width="40%" nowrap align="right"> 
		<%= payDoc.getE01TRNIMP() %> 
      </td>
      <td width="40%" nowrap align="right"> 
        <input type="text" name="E01PAGIMP" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGIMP()); else out.print(payDoc.getE01TRNIMP());%>" 
		onKeypress="enterDecimalNew(event)" onChange="UpdateTotal(this.value,'IMP')" onfocus="UpdateTemp(this.value)" readonly>
      </td>
    </tr>
    <tr id=trdark> 
      <td width="20%" nowrap>  
        <div align="right"><b>Total : </b></div>
      </td>
	  <td width="40%" nowrap align="right" id="Pago"> 
		<%= payDoc.getE01TRNTOT()%> 
      </td>
      <td width="40%" nowrap  align="right"> 
        <input type="text" name="E01PAGTOT" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGTOT()); else out.print(payDoc.getE01TRNTOT());%>" 
        onKeypress="enterDecimalNew(event)" onChange="UpdateTotal(this.value,'TOT');" onfocus="UpdateTemp(this.value)" >
      </td>
    </tr>
	
  </table> 
  <BR>
  <table width="100%" >
  
	<tr>
            <td nowrap width="20%"> 
              <div align="right">Fecha Valor :</div>
            </td>  
			<td nowrap >
			  <div align="left"> 
        		<div align="left">
 				  <% if (payDoc.getE01MANPAG().equals("Y") ){ %>
			   	<eibsinput:date name="payDoc" fn_year="E01PAGVDY" fn_month="E01PAGVDM" fn_day="E01PAGVDD" /> 
			  <% } else { %>
			    	<eibsinput:date name="docData" 
			  		fni_year="E01PAGVDY" fn_year="PAGVDY" 
			  		fni_month="E01PAGVDM" fn_month="PAGVDM" 
			  		fni_day="E01PAGVDD" fn_day="PAGVDD" />
			  <% } %>
        		
      		  </div>
      		  </div> <!--  onchange="chgDate();" -->
			</td>
			<td nowrap width="20%"> 
              <div align="right">Comentario :</div>
            </td>  
			<td nowrap >
			  <div align="left"> 
        		<input type="text" name="E01DEANR1" size="60" maxlength="60" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01DEANR1().trim()); else if (!(docData.getDEANR1()==null)) out.print(docData.getDEANR1().trim());%>">
              </div>
			</td>
          </tr>
		<tr>
            <td nowrap width="20%">
               <div align="right">Devolver Intereses :</div>
            </td>  
			<td nowrap> 
               	<INPUT type="radio" name="E01DEVINT" value="Y" onClick="devIntClick('Y')" <% if(payDoc.getE01DEVINT().equals("Y")) out.print("checked");%>>Sí
               	<INPUT type="radio" name="E01DEVINT" value="N" onClick="devIntClick('N')" <% if(!payDoc.getE01DEVINT().equals("Y")) out.print("checked");%>>No
			</td>
			<td nowrap width="20%"> 
			<!--   <div id="titpagdev"align="right">Pagar Saldo Con Devolución :</div>-->
            </td>  
			<td nowrap > 
			  <div id="pagdev" align="left"> 
               	<INPUT type="radio" name="E01PGWDEV" value="Y"  <% if(payDoc.getE01PGWDEV().equals("Y")) out.print("checked");%>>Sí
               	
               	<INPUT type="radio" name="E01PGWDEV" value="N" <% if(!payDoc.getE01PGWDEV().equals("Y")) out.print("checked");%>>No 
              </div>
              
			</td>
          </tr>
    </table>
  <BR>
    <table width="100%">
		 <tr id="trdark">
            <td nowrap width="30%"> 
              <div align="center">Concepto</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">Banco</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">Sucursal</div>
            </td>
            <td nowrap width="10%"> 
              <div align="center">Moneda</div>
            </td>
            <td nowrap width="20%"> 
              <div align="center">Referencia</div>
            </td>
            <td nowrap width="20%"> 
              <div id="titamt" align="center">Monto</div>
            </td>
          </tr>
		  <tr id="trclear">
             <td nowrap width="40%"> 
              <div align="center"> 
                <input type=text name="E01PAGOPC" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGOPC().trim()); else if (!(docData.getPAGOPC()==null)) out.print(docData.getPAGOPC().trim());%>" size="3" maxlength="3">
                <input type=HIDDEN name="E01PAGOGL" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGOGL().trim()); else if (!(docData.getPAGOGL()==null)) out.print(docData.getPAGOGL().trim());%>">
                <input type="text" name="E01PAGCON" size="25" maxlength="25" readonly value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGCON().trim()); else if (!(docData.getPAGCON()==null)) out.print( docData.getPAGCON().trim());%>"
                 		oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].E01PAGOBK.value,'','E01PAGOGL','E01PAGOPC','FA')">
			  </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01PAGOBK" size="2" maxlength="2" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGOBK().trim()); else if (!(docData.getPAGOBK()==null)) out.print(docData.getPAGOBK().trim());%>">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01PAGOBR" size="4" maxlength="4" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGOBR().trim()); else if (!(docData.getPAGOBR()==null)) out.print(docData.getPAGOBR().trim());%>"
                    oncontextmenu="showPopUp(branchHelp,this.name,document.forms[0].E01PAGOBK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="10%"> 
              <div align="center"> 
                <input type="text" name="E01PAGOCY" size="3" maxlength="3" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGOCY().trim()); else if (!(docData.getPAGOCY()==null)) out.print(docData.getPAGOCY().trim());%>"
                 oncontextmenu="showPopUp(currencyHelp,this.name,document.forms[0].E01PAGOBK.value,'','','','')">
              </div>
            </td>
            <td nowrap width="30%"> 
              <div align="center"> 
                <input type="text" name="E01PAGOAC" size="16" maxlength="16" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGOAC().trim()); else if (!(docData.getPAGOAC()==null)) out.print(docData.getPAGOAC().trim());%>"
                 oncontextmenu="showPopUp(accbyclientHelp,this.name,document.forms[0].E01PAGOBK.value,'',document.forms[0].E01DEACUN.value,'','RT')">
              </div>
            </td>
			<td nowrap width="20%">
            	<div id="amt1" >
            		<input type="text" name="E01PAGAMT" size="17" maxlength="17" 
            		value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PAGAM1()); 
            		else if (!(docData.getPAGAMT()==null)) out.print(Util.formatCCY(docData.getPAGAMT()));%>"
						onKeypress="enterDecimalNew(event)" >
				</div> 
			</td>
          </tr>
          <% if (opt > 0) { %>
          <tr id="trdark" style=dspInt >
             <td nowrap width="30%"> 
              <div id="con2"align="center"> 
                <input type=text name="E01PA1OPC" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PA1OPC().trim());
                	 else if (!(payDoc.getE01PA1OPC()==null)) out.print(payDoc.getE01PA1OPC().trim());%>" size="3" maxlength="3">
                <input type=HIDDEN name="E01PA1OGL" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PA1OGL().trim());
                	 else if (!(payDoc.getE01PA1OGL()==null)) out.print(payDoc.getE01PA1OGL().trim());%>"
                	 onpropertychange="payDoc.getField("E01PA1OGL").setString(this.value)";userPO.setGenLedger(this.value);>
                <input type="text" name="E01PA1CON" size="25" maxlength="25" readonly 
                		value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PA1CON().trim());
                		 else if (!(payDoc.getE01PA1CON()==null)) out.print( payDoc.getE01PA1CON().trim());%>"
                 		oncontextmenu="showPopUp(conceptHelp,this.name,document.forms[0].BANK.value,'','E01PA1OGL','E01PA1OPC','FA','E01OF1TYP')">
			  </div>
            </td>
            <td nowrap width="10%"> 
				<input type="hidden" name="E01OF1TYP" size="2" maxlength="1" >
            </td>
            <td nowrap width="10%"> 
              
            </td>
            <td nowrap width="10%"> 
              
            </td>
            <td nowrap width="20%"> 
              
            </td>
            <td nowrap width="20%">
            	<div id="amt2" >
            		<input type="text" name="E01PA1AM2" size="17" maxlength="17" value="<%if (payDoc.getE01MANPAG().equals("Y")) out.print(payDoc.getE01PA1AMT()); else out.print("0.00");%>"
						onKeypress="enterDecimalNew(event)" >
				</div> 
			</td>
			<td nowrap width="20%">
            	
            </td>
          </tr>
          <% } %>
        </table>
   </td>
   </tr>
  </table>
	
	<div align="center" id="buttonSubmit" > 
		<br>
    	<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goAction(4)">
  	</div>

	<div align="center" id="buttonRecalc" style = "display:none" > 
		<br>
    	<input id="EIBSBTN" type="button" name="Recalc" value="Recalcular" onclick="goAction(7)">
  	</div>

<SCRIPT language="JavaScript">
<%if (payDoc.getE01DEVINT().equals("Y") ) {%>
     devIntClick('Y');
<%} else { %>
     devIntClick("N");
<%}%>
</SCRIPT>

</form>
</body>
</html>			
