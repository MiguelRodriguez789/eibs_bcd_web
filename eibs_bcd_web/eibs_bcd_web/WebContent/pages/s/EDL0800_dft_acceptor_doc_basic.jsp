
<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Documentos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/dynTable.js"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/Ajax.js"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/cnofc.js"> </SCRIPT>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ taglib uri="/WEB-INF/datapro-dyntable.tld" prefix="dyntable" %>
<jsp:useBean id="dftBasic" class="datapro.eibs.beans.EDL080001Message"  scope="session" />
<jsp:useBean id="dftDoc" class="datapro.eibs.beans.EDL080002Message"  scope="session" />
<jsp:useBean id="dftAcceptor" class="datapro.eibs.beans.EDL080003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">
	var OK = true;
	function goAction() {
		OK = true;
		var apaf07 = document.forms[0].E01APAF07.value;
		var deapct = parseFloat(document.forms[0].E01DEAPCT.value.replace(/,/g,''));
		var cien = parseFloat("100".replace(/,/g,''));
		var apaf09 = document.forms[0].E01APAF09.value;
		var monto = 0;
		var amount = 0;
		var year2 = parseFloat(getElement("E02DLDMAY").value);
		var month2 = parseFloat(getElement("E02DLDMAM").value);
		var day2 = parseFloat(getElement("E02DLDMAD").value);
		try {
			monto = parseFloat(getElement("E02DLDOAM").value);
		} catch (e) {
			monto = 0;
		}
		try {
			amount = parseFloat(getElement("E02DLDFAM").value);
		} catch (e) {
			amount = 0;
		}
		if (year2 > 2000 && month2 >0 && month2 < 13 && day2 > 0 && day2 < 32) {
			verificaFecha();
		} else {
			alert("Fecha Invalida");
			OK = false;
		}
		if (amount == 0 ) {
			alert("El monto del Documento no puede ser 0.00");
			OK = false;
		}
		monto = amount * (deapct / cien);
		if (monto == 0 ) {
			alert("El monto negociado no puede ser 0.00");
			OK = false;
		} else {
			verificaMonto();
		}
		
		if (monto > amount ) {
			alert("El monto negociado no puede Mayor al Monto del Documento");		
			OK = false;
		}
		return OK;
	}
function verificaMonto() {
	OK = true;
	var apaf07 = document.forms[0].E01APAF07.value; 
	var lneNum = document.forms[0].E03DLDCMN.value;
	if (lneNum != 9999 && apaf07 == "Y") {
		var saldo = parseFloat(document.forms[0].LINEAVL.value.replace(/,/g,''));
		var amt =   parseFloat(document.forms[0].E02DLDOAM.value.replace(/,/g,''));
		saldo = saldo - amt;
		if (saldo < 0) {
			alert("Documento Sobregira Linea de Credito");
			OK = false;
		} 
	}
}
function verificaFecha() {
	OK = true;
	var apaf07 = document.forms[0].E01APAF07.value; 
	var lneNum = document.forms[0].E03DLDCMN.value;
	if (lneNum != 9999 && apaf07 == "Y") {
		var year = parseFloat(getElement("E02DLDMAY").value);
		var month = parseFloat(getElement("E02DLDMAM").value);
		var day = parseFloat(getElement("E02DLDMAD").value);
		var year1 = parseFloat(getElement("E03LNEMAY").value);
		var month1 = parseFloat(getElement("E03LNEMAM").value);
		var day1 = parseFloat(getElement("E03LNEMAD").value);
		var matDte = new Date();
		var lneDte = new Date();
		try {
			lneDte = new Date(year1,month1 - 1,day1);
		} catch(errLne) {
			alert("fecha de Linea Invalida");
			OK = false;	
		}
		try {
			if (year > 2000 && month > 0 && month < 13 && day > 0 && day < 32) {
				matDte = new Date(year,month - 1,day);
				if (matDte > lneDte) {
					alert("Vencimiento Mayor que el Vencimiento de la Linea");
					OK = false;
				}
			}
		} catch(errLne) {
			alert("fecha de Vencimiento Invalida");	
			OK = false;
		}
	   }
}
function loadMonto() {
	var LineAvl = sessionStorage.getItem("LineAvl");
	document.forms[0].LINEAVL.value = LineAvl;
}

</SCRIPT>

</head>
<body onload="loadMonto();">
<h3 align="center">Documentos del Deudor <img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dft_acceptor_doc_basic.jsp,EDL0800"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0800" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="1801">
  <INPUT TYPE=HIDDEN NAME="E02DLDPDD" VALUE="<%=dftDoc.getE02DLDPDD()%>">
  <INPUT TYPE=HIDDEN NAME="E02DLDPDM" VALUE="<%=dftDoc.getE02DLDPDM()%>">
  <INPUT TYPE=HIDDEN NAME="E02DLDPDY" VALUE="<%=dftDoc.getE02DLDPDY()%>">
  
  <INPUT TYPE=HIDDEN NAME="E03LNEMAM" VALUE="<%=dftAcceptor.getE03LNEMAM()%>">
  <INPUT TYPE=HIDDEN NAME="E03LNEMAD" VALUE="<%=dftAcceptor.getE03LNEMAD()%>">
  <INPUT TYPE=HIDDEN NAME="E03LNEMAY" VALUE="<%=dftAcceptor.getE03LNEMAY()%>">
  <INPUT TYPE=HIDDEN NAME="LINEAVL" VALUE="" >
  <INPUT TYPE=HIDDEN NAME="E03DLDCMN" VALUE="<%=dftAcceptor.getE03DLDCMN()%>">
  <INPUT TYPE=HIDDEN NAME="E01APAF07" Value="<%=dftBasic.getE01APAF07() %>">
  <INPUT TYPE=HIDDEN NAME="E01APAF09" Value="<%=dftBasic.getE01APAF09() %>">
  <INPUT TYPE=HIDDEN NAME="E01DEAPCT" Value="<%=dftBasic.getE01DEAPCT() %>">
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
		   <td nowrap width="16%"> 
		  <div align="right">Identificación :</div>
		  </td>
		  <td nowrap width="20%"> 
		  <input type="text" name="E02DLDDID" size="18" maxlength="2" value="<%= dftDoc.getE02DLDDID() %>" readonly>
		  </td>
		  <td nowrap width="16%">
		  <div align="right">Nombre :</div>
		  </td>
		  <td nowrap width="20%">
		  <input type="text" name="E02DLDNME" size="35" maxlength="30" value="<%= dftDoc.getE02DLDNME() %>" readonly>
		  </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <h4>Información Básica</h4> 
  <%int row = 1; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap>
		<table cellpadding=2 cellspacing=0 width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
				<div align="right">Secuencia :</div>
				</td>
				<td nowrap width="33%">
					<INPUT type="text" name="E02DLDNDR" size="10" maxlength="9" value="<%=dftDoc.getE02DLDNDR()%>" readonly="readonly">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
				<div align="right">Referencia :</div>
				</td>
				<td nowrap width="33%">
					<INPUT type="text" name="E02DLDRFN" size="17" maxlength="11" value="<%=dftDoc.getE02DLDRFN()%>">
				</td>
			</tr>
			<% if (dftBasic.getE01APAF14().trim().equals("Y") ) { %>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
					<div align="right">Fecha Emision Documento :</div>
				</td>
				<td nowrap width="33%">
					<% if (currUser.getE01DTF().equals("MDY") ) { %>
						<input type="text" id="E02DLDD5M" name="E02DLDD5M" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()" />
						<input type="text" id="E02DLDD5D" name="E02DLDD5D" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDD5Y" name="E02DLDD5Y" size="5" maxlength="4" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()" />
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E02DLDD5M,document.forms[0].E02DLDD5D,document.forms[0].E02DLDD5Y)"> <img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" style="vertical-align: bottom;" border="0"/></a>				
					<% } else { %>
						<input type="text" id="E02DLDD5D" name="E02DLDD5D" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDD5M" name="E02DLDD5M" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDD5Y" name="E02DLDD5Y" size="5" maxlength="4" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E02DLDD5D,document.forms[0].E02DLDD5M,document.forms[0].E02DLDD5Y)"> <img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" style="vertical-align: bottom;" border="0"/></a>				
					<% } %>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
					<div align="right">Fecha Vencimiento Documento :</div>
				</td>
				<td nowrap width="33%">
					<% if (currUser.getE01DTF().equals("MDY") ) { %>
						<input type="text" id="E02DLDD6M" name="E02DLDD6M" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()" />
						<input type="text" id="E02DLDD6D" name="E02DLDD6D" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDD6Y" name="E02DLDD6Y" size="5" maxlength="4" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()" />
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E02DLDD6M,document.forms[0].E02DLDD6D,document.forms[0].E02DLDD6Y)">
						<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" style="vertical-align: bottom;" border="0"/></a>
					<% } else { %>
						<input type="text" id="E02DLDD6D" name="E02DLDD6D" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDD6M" name="E02DLDD6M" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDD6Y" name="E02DLDD6Y" size="5" maxlength="4" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E02DLDD6D,document.forms[0].E02DLDD6M,document.forms[0].E02DLDD6Y)">
						<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" style="vertical-align: bottom;" border="0"/></a>
					<% } %>
				</td>
			</tr>
			<% } else { %>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
					<div align="right">Fecha de Vencimiento :</div>
				</td>
				<td nowrap width="33%">
					<!--<eibsinput:date property="dftDocs" fn_year="E02DLDMAY" fn_month="E02DLDMAM" fn_day="E02DLDMAD" onblur="verificaFecha()"/>-->
					<% if (currUser.getE01DTF().equals("MDY") ) { %>
						<input type="text" id="E02DLDMAM" name="E02DLDMAM" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()" />
						<input type="text" id="E02DLDMAD" name="E02DLDMAD" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDMAY" name="E02DLDMAY" size="5" maxlength="4" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()" />
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E02DLDMAM,document.forms[0].E02DLDMAD,document.forms[0].E02DLDMAY)">
						<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" style="vertical-align: bottom;" border="0"/></a>
					<% } else { %>
						<input type="text" id="E02DLDMAD" name="E02DLDMAD" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDMAM" name="E02DLDMAM" size="3" maxlength="2" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<input type="text" id="E02DLDMAY" name="E02DLDMAY" size="5" maxlength="4" value="0"  class="txtright" onkeypress=" enterInteger(event)" onblur="verificaFecha()"/>
						<a id="linkHelp" href="javascript:DatePicker(document.forms[0].E02DLDMAD,document.forms[0].E02DLDMAM,document.forms[0].E02DLDMAY)">
						<img src="${pageContext.request.contextPath}/images/calendar.gif" title="null" style="vertical-align: bottom;" border="0"/></a>
					<% } %>
				</td>
			</tr>
			<% } %>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
				<div align="right">Monto Documento :</div>
				</td>
				<td nowrap width="33%">
					<INPUT type="text" name="E02DLDFAM" size="17" maxlength="15" value="<%=dftDoc.getE02DLDFAM()%>" onkeypress="enterDecimal(event)">
				</td>
			</tr>
			<% if (!dftBasic.getE01APAF09().trim().equals("C") ) { %>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
				<div align="right">Monto Negociado :</div>
				</td>
				<td nowrap width="33%">
					<INPUT type="text" name="E02DLDOAM" size="17" maxlength="15" value="<%=dftDoc.getE02DLDOAM()%>" onblur="verificaMonto()" onkeypress="enterDecimal(event)">
              		<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  > 
				</td>
			</tr>
			<% } %>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
				<div align="right">Tasa <% if (deaict > 0 && deaict < 7) { out.print("Efectiva"); } else { out.print("Nominal"); } %>:</div>
				</td>
				<td nowrap width="33%">
					<% if (deaict > 0 && deaict < 7) { %>
						<INPUT type="text" name="E02DLDSPR" size="17" maxlength="15" value="<%=dftDoc.getE02DLDSPR()%>">
					<% } else { %>
						<INPUT type="text" name="E02DLDARC" size="17" maxlength="15" value="<%=dftDoc.getE02DLDARC()%>">
					<% } %>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
				<div align="right">Cuenta de Débito Automática :</div>
				</td>
				<td nowrap width="33%">
					<INPUT type="text" name="E02DLDACC" size="17" maxlength="15" value="<%=dftDoc.getE02DLDACC()%>">
					<a href="javascript:GetAccount('E02DLDACC','','RT','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" border="0"  ></a>
				</td>
			</tr>
			<!--  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
				<div align="right">Ruta de Cobro :</div>
				</td>
				<td nowrap width="33%">
					<INPUT type="text" name="E02DLDREW" size="17" maxlength="15" value="<%=dftDoc.getE02DLDREW()%>">
					<a href="javascript:GetCodeCNOFC('E02DLDREW','42')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" border="0"  ></a>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="33%">
				<div align="right">Tipo de Cambio :</div>
				</td>
				<td nowrap width="33%">
		 			<select name="E02DLDEXT">
						<option value="" <%=!dftDoc.getE02DLDEXT().trim().equals("1")
										&& !dftDoc.getE02DLDEXT().trim().equals("2")
										&& !dftDoc.getE02DLDEXT().trim().equals("3") ? " selected": " "%>></option>
						<option value="1" <%=dftDoc.getE02DLDEXT().equals("1") ? " selected": " "%>>Oficial</option>
						<option value="2" <%=dftDoc.getE02DLDEXT().equals("2") ? " selected": " "%>>Observado</option>
						<option value="3" <%=dftDoc.getE02DLDEXT().equals("3") ? " selected": " "%>>Compra/Venta</option>
					</select>					
				</td>
			</tr>
			-->
		</table>
		</td>
    </tr>
	</table>
	<dyntable:button name="dtf" styleClass="EIBSBTN" beanToValidate="dftDoc" onValidate="goAction()">Enviar</dyntable:button>
</form>
</body>
</html>
