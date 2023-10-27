<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html> 
<%@page import="java.util.Iterator"%>
<%@page import="datapro.eibs.master.Util"%>
<%@page import="com.datapro.eibs.teller.vo.ATPARAMETERS"%>
<%@page import="com.datapro.eibs.teller.vo.ATTRNTYPEBYTELLUSERS"%>
<head>
<title>Perfil del Cajero</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="userRegistry" class="com.datapro.security.UserRegistryPasswordEntry"  scope="session" />
<jsp:useBean id="teller" class="com.datapro.eibs.teller.vo.ATTELLUSERSExtBasic"  scope="session" />
<jsp:useBean id="tellerDetails" class="datapro.eibs.beans.EDD031001Message"  scope="session" />
<jsp:useBean id="tellerTransactions" class="java.util.ArrayList"  scope="session" />
<jsp:useBean id="transactionsByUser" class="com.datapro.generic.beanutil.BeanList"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script type="text/javascript">

function del() {
	ok = confirm("Esta seguro que desea eliminar el usuario seleccionado?");
	if (ok){
		document.forms[0].del.value='Y';
		document.forms[0].submit();
	}
}

function toStart(theForm) {
	theForm.SCREEN.value='3';
	theForm.submit(); 
}

function checkSubmit(theForm){
	if(document.forms[0].E01TLMBNK.value == ''){
		if(document.forms[0].E01TLMBRN.value == ''){
			alert("Banco es requerido\nAgencia es requerido");
		} else {
			alert("Banco es requerido");
		}
		document.forms[0].E01TLMBNK.focus();
		return false;
	}
	if(document.forms[0].E01TLMBRN.value == ''){
		alert("Agencia es requerido");
		document.forms[0].E01TLMBRN.focus();
		return false;
	}
	document.forms[1].CODEBANK.value = document.forms[0].E01TLMBNK.value;
	document.forms[1].CODEBRANCH.value = document.forms[0].E01TLMBRN.value;
	theForm.submit();
}

function showTeller(){
	var type = document.getElementById('E01TLMTYP').value;
	var divs = document.getElementsByTagName("div");
	for(var ind = 0; divs[ind]; ind++ ) {
		var elem = divs[ind];
		if (elem.id.indexOf("regularTeller") == 0){
			if(type == 'T' || type == 'I'){
				elem.style.display='block';
			} else {
				elem.style.display='none';
			} 
	    } else if (elem.id.indexOf("superTeller") == 0){
			if(type == 'T' || type == 'I'){
				elem.style.display='none';
			} else {
				elem.style.display='block';
			} 	    
	    }
	}
}

function getTransactionsList() {
 	var page = doument.forms[1].action.value + "?SCREEN=7&TELLERID=" + document.forms[1].TELLUSERID.value;
 	CenterWindow(page, 650, 450, 2);
}

</script>

</head>
<body bgcolor="#FFFFFF">
<% 
boolean isNew = !"MAINTENANCE".equals(userPO.getPurpose());
if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0") ;
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
}
%>
<h3 align="center">Perfil del Cajero<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="Users_teller_basic" ></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersTeller">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">
  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="25%"> 
              <div align="right"><b>Identificación :</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01TLMTID" size="12" maxlength="10" value="<%= tellerDetails.getE01TLMTID()%>"
					   readonly>
              </div>
            </td>
            <td nowrap width="25%"> 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap width="25%"> 
              <div align="left"> 
                <input type="text" name="E01EUPNME" size="45" maxlength="45" value="<%= userRegistry.getDisplayName()%>"
					   readonly>
              </div>
            </td>
          </tr>
         <tr id="trclear"> 
            <td nowrap height="23"> 
              <div align="right">Banco :</div>
            </td>
            <td nowrap height="23"> 
				<input type="text" name="E01TLMBNK" size="2" maxlength="2" value="<%= tellerDetails.getE01TLMBNK().trim()%>" >
       			<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0"  >
            </td>
            <td nowrap height="23"> 
              <div align="right">Agencia :</div>
            </td>
            <td nowrap height="23"> 
              <input type="text" name="E01TLMBRN" size="4" maxlength="3" value="<%= tellerDetails.getE01TLMBRN().trim()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetBranch('E01TLMBRN',document.forms[0].E01TLMBNK.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Help" align="bottom" border="0"  ></a>
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
            </td>
		</tr>
         <tr id="trdark"> 
            <td nowrap> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap> 
            <div align="left">
                <input type="text" name="E01TLMCCY" size="4"  maxlength="3" value="<%= tellerDetails.getE01TLMCCY().trim()%>">
				<a href="javascript:GetCurrency('E01TLMCCY',document.forms[0].E01TLMBNK.value)">
			<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0"></a>
			</div>
            </td>
    		<td nowrap> 
              <div align="right"><b>Tipo :</b></div>
            </td>
            <td nowrap> 
              <div align="left"> 
              <SELECT name="E01TLMTYP" <%=isNew ? "" : " "%> onchange="showTeller()">
              
				<OPTION value="T" <%if (tellerDetails.getE01TLMTYP().equals("T")) { out.print("selected"); }%>>Regular</OPTION>
				<OPTION value="H" <%if (tellerDetails.getE01TLMTYP().equals("H")) { out.print("selected"); }%>>Principal</OPTION>
				<OPTION value="O" <%if (tellerDetails.getE01TLMTYP().equals("O")) { out.print("selected"); }%>>Oficial S/G</OPTION>
				<OPTION value="S" <%if (tellerDetails.getE01TLMTYP().equals("S")) { out.print("selected"); }%>>Supervisor Operaciones</OPTION>
				<OPTION value="I" <%if (tellerDetails.getE01TLMTYP().equals("I")) { out.print("selected"); }%>>Cajero Interfase</OPTION>
		
			</SELECT>              
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
	<h4>Perfil de eIBS</h4>  
	<table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="30%" height="23">
				<div id="regularTellerMXC" align="right">Efectivo Máximo Permitido :</div>
				<div id="superTellerMXC" align="right">Monto Sobregiro :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMMXC" size="25"	maxlength="16" value="<%= tellerDetails.getE01TLMMXC().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="23"> 
				<div id="regularTellerFLW" align="right">Límite de Retiros en Efectivo :</div>
				<div id="superTellerFLW" align="right">Monto Retiros :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMFLW" size="25"	maxlength="16" value="<%= tellerDetails.getE01TLMFLW().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="30%" height="23"> 
				<div id="regularTellerFLD" align="right">Límite de Depósitos Efectivo :</div>
				<div id="superTellerFLD" align="right">Monto Depósitos :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMFLD" size="25"	maxlength="16" value="<%= tellerDetails.getE01TLMFLD().trim()%>" onkeypress="enterDecimal()">
            </td>
          </tr>

		<tr id="trclear"> 
		<td nowrap colspan="4">
        <div id="regularTellerAccounting" style="position:relative; display:block">   
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Cta. Efectivo Cajero :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMGLN" size="17"
					 maxlength="16" value="<%= tellerDetails.getE01TLMGLN().trim()%>">
              <a href="javascript:GetLedger('E01TLMGLN',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%" height="23"> 
              <div align="right">Cta.  Chq. Mismo Banco (Sin Retenciones) :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMONG" size="17"	
                     maxlength="16" value="<%= tellerDetails.getE01TLMONG().trim()%>">
              <a href="javascript:GetLedger('E01TLMONG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
             
            </td>
          </tr>
          <tr> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Cta.  Chq. Mismo Bco (Con Retenciones) :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMOHG" size="17"	
                     maxlength="16" value="<%= tellerDetails.getE01TLMOHG().trim()%>">
              <a href="javascript:GetLedger('E01TLMOHG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a>
              Días: <input type="text" name="E01TLMOHD" size="3" maxlength="2" value="<%= tellerDetails.getE01TLMOHD().trim()%>">  
              
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%" height="23"> 
              <div align="right">Cta. Compensacion Misma Plz. Otros Bancos :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMLOG" size="17"	
                     maxlength="16" value="<%= tellerDetails.getE01TLMLOG().trim()%>">
              <a href="javascript:GetLedger('E01TLMLOG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
               Días: <input type="text" name="E01TLMLOD" size="3" maxlength="2" value="<%= tellerDetails.getE01TLMLOD().trim()%>"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">Cta. Compensacion Otras Plz. Internacional :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMNLG" size="17"	
                     maxlength="16" value="<%= tellerDetails.getE01TLMNLG().trim()%>">
              <a href="javascript:GetLedger('E01TLMNLG',document.forms[0].E01TLMBNK.value,document.forms[0].E01TLMCCY.value,'')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0" ></a> 
              Días: <input type="text" name="E01TLMNLD" size="3" maxlength="2" value="<%= tellerDetails.getE01TLMNLD().trim()%>"> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="30%" height="23"> 
              <div align="right">No. Lote Cajero :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMBTH" size="5" maxlength="4" value="<%= tellerDetails.getE01TLMBTH().trim()%>" onkeypress="enterInteger(event)">
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="30%" height="23"> 
              <div align="right">No. Centro Costo Cajero :</div>
            </td>
            <td nowrap height="23" colspan="3"> 
              <input type="text" name="E01TLMCST" size="9" maxlength="8" value="<%= tellerDetails.getE01TLMCST().trim()%>" onkeypress="enterInteger(event)">
              <a href="javascript:GetCostCenter('E01TLMCST',document.forms[0].E01TLMBNK.value)">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            </td>
          </tr>
        </table>
		</div>  
      </td>
    </tr>
	</table>
	</td>
    </tr>
	</table>
  <br>
  <div align="center"> 
   <p align="center">
    		<input id="EIBSBTN" type="button" name="Submit" value="Actualizar eIBS" onclick="checkSubmit(document.forms[0])">
			<input id="EIBSBTN" type="button" name="Start" value="Inicio" onclick="toStart(document.forms[0])">
            <%if (currUser.getH01OPE().trim().equals("0002")) { %>
    		<input id="EIBSBTN" type="button" name="Submit" value="Eliminar" onclick="del()">
			<% } %>
  </p>
  </div>
  <script type="text/javascript">
	showTeller();
  </script>
  </form>

 <FORM id="formTeller" name="formTeller" METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.security.JSUsersTeller">
  <p>
    <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="10">
  </p>

  <h4>Perfil de eIBS Branch </h4>
  
  <table  class="tableinfo">
    <tr >
      <td nowrap>
		<input type="hidden" name="TELLUSERID" size="12" maxlength="10" value="<%= teller.getTELLUSERID()%>" readonly>
		<input type="hidden" name="USERNAME" size="35" maxlength="50" value="<%= teller.getUSERNAME().length() > 20 ? teller.getUSERNAME().substring(0, 20) : teller.getUSERNAME() %>" >
       	<input type="hidden" name="CODEBANK" size="5" maxlength="4" value="<%= teller.getCODEBANK().substring(2, 4) %>" <%= !isNew ? " readonly" : "" %>>
		<input type="hidden" name="CODEBRANCH" size="5" maxlength="4" value="<%= Integer.parseInt(teller.getCODEBRANCH())%>">
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap>
              <div align="right">Nivel :</div>
            </td>
            <td nowrap>
             	<input type="text" name="USERNIVEL" size="5" maxlength="4" value="<%= teller.getUSERNIVEL()%>" readonly="readonly">
				<a href="javascript:GetTellerParameters('0002','USERNIVEL','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
             </td>
            <td nowrap>
              <div align="right">Jornada :</div>
            </td>
            <td nowrap>
             	<input type="text" name="CODESHIFT" size="5" maxlength="4" value="<%= teller.getCODESHIFT()%>" readonly="readonly">
				<a href="javascript:GetTellerShifts('CODESHIFT', '', document.formTeller.CODEBANK.value, document.formTeller.CODEBRANCH.value)">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap>
              <div align="right">Estado :</div>
            </td>
            <td nowrap>
             	<input type="text" name="USERMOD" size="5" maxlength="4" value="<%= teller.getUSERMOD()%>" readonly="readonly">
				<a href="javascript:GetTellerParameters('0011','USERMOD','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="mandatory field" align="bottom" border="0">
             </td>          
            <td nowrap>
              <div align="right">Secuencia :</div>
            </td>
            <td nowrap>
             	<input type="text" name="TRNSEQ" size="16" maxlength="15" value="<%= teller.getTRNSEQ()%>" onkeypress="enterInteger(event)">
             </td> 
          </tr>
          <tr id="trdark">
            <td nowrap>
              <div align="right">e-mail:</div>
            </td>
            <td nowrap>
             	<input type="text" name="USEREMAIL" size="40" maxlength="35" value="<%= teller.getUSEREMAIL()%>" readonly>
             </td>          
            <td nowrap>
              <div align="right">Identificación:</div>
            </td>
            <td nowrap>
             	<input type="text" name="USERID" size="40" maxlength="35" value="<%= teller.getUSEREMAIL()%>" readonly>
             </td>          
          </tr>
         </table>
      </td>
    </tr>
  </table>
    <br>
  <h4>Asignacion de Transacciones </h4>
<%
	if (tellerTransactions.isEmpty() ) {
%>
<TABLE class="tbenter" width="95%" ALIGN="CENTER">
	<TR>
		<TD>
			<div align="center"><b>No hay datos que correspondan con su criterio de búsqueda</b></div>
		</TD>
	</TR>
</TABLE>
<%
	} else {
%>
  <TABLE class="tableinfo" width="95%" ALIGN=CENTER>
     	<%
		Iterator iter = tellerTransactions.listIterator();
		int index = 0;
        while (iter.hasNext()) {
			ATPARAMETERS entry = (ATPARAMETERS) iter.next();
			if (!entry.getATCODEITEMPARAM().equals("0000")) {
				String check = "";
				if (!transactionsByUser.isEmpty()) {
					transactionsByUser.initRow();
					while (transactionsByUser.getNextRow()) {
						check = "";
						ATTRNTYPEBYTELLUSERS code = (ATTRNTYPEBYTELLUSERS) transactionsByUser.getRecord();
						if (code.getTRNTYPECODE().trim().equals(entry.getATCODEITEMPARAM().trim())) {
							check = "checked";
							break;
						}
					}
				}
				if ((index % 2) == 0) {
		%>
		        <TR>
		<%		} %>        
					<td NOWRAP align="left">
					<input type="checkbox" name="code_<%=entry.getATCODEITEMPARAM().toUpperCase()%>" id="code" <%=check%>>
					<%=Util.formatCell(entry.getATVALPARAM1().toUpperCase())%></td>
		<%		if ((index % 2) != 0) { %>			
				</TR>  
		<%		} %>		 		
		<% 
				index++;
			}
		} 
		%>   
  </TABLE>
	<%}%>
    <br>
   <p align="center">
    		<input id="EIBSBTN" type="button" name="Submit" value="Actualizar eIBS Branch" onclick="checkSubmit(document.forms[1])">
			<input id="EIBSBTN" type="button" name="Start" value="Inicio" onclick="toStart(document.forms[1])">
            <%if (currUser.getH01OPE().trim().equals("0002")) { %>
    		<input id="EIBSBTN" type="button" name="Submit" value="Eliminar" onclick="del()">
			<% } %>
  </p>

</form>
</body>
</html>

