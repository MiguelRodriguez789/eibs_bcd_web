<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Información Básica de Certificados de Depósito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="deduct" class="datapro.eibs.beans.EDL037001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>
<% 
    String row = "0";
    try {
      row = request.getParameter("ROW");
      if (row==null) row ="0";
    }
    catch (Exception e) {
      row = "0";
    } 
 %>
<h3 align="center">Deducciones
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ded_basic.jsp,EDL0370"></h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDL0370" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" ID="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01DEABNK"  ID="E01DEABNK"  value="<%= deduct.getE01DEABNK().trim()%>">
  <input type=HIDDEN NAME="E01DEAACD"  ID="E01DEAACD"  value="<%= deduct.getE01DEAACD().trim()%>">
  <INPUT TYPE=HIDDEN NAME="OPT" ID="OPT" VALUE="N"> 	  
  <INPUT TYPE=HIDDEN NAME="ROW" ID="ROW" VALUE="<%= row %>">
  <input type=HIDDEN NAME="E01DLITYP" ID="E01DLITYP"  value="<%= deduct.getE01DLITYP().trim()%>"> 
 <% int rw = 0;%>

  <table class="tableinfo" id="headtable">
    <tr> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="0" width="100%" >          
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap> 
              <div align="right"><b>No. Prestamo :</b></div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01DEAACC" id="E01DEAACC" size="13" maxlength="12" value="<%= deduct.getE01DEAACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="right"><b>Compañia : </b></div>
            </td>
            <td nowrap> 
              <div align="left">
                <input type="text" name="E01DLICDE" size="4" value="<%= deduct.getE01DLICDE().trim()%>" readonly>
                <input type="text" name="E01DLINME" size="35" value="<%= deduct.getE01DLINME().trim()%>" readonly>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Prestatario</h4>

    <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing=0 cellpadding=2 width="100%" border="0">
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="right">No Poliza :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DLIREF" size="20" maxlength="20" value="<%= deduct.getE01DLIREF().trim()%>"> </td>
            <td nowrap > 
              <div align="right">Valor Compra :</div>
            </td>
            <td nowrap> 
                <eibsinput:text property="E01DLIPAM" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" />
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="right">Descripción :</div>
            </td>
            <td nowrap colspan="3"> 
                <eibsinput:text property="E01DLIRMK" name="deduct" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" />
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="right">Cobro de Impuesto/ IVA / ITBMS :</div>
            </td>
            <td nowrap> 
              <input type="radio" name="E01DLIIVA" value="Y" <%if(deduct.getE01DLIIVA().equals("Y")) out.print("checked");%>>
                Sí 
                <input type="radio" name="E01DLIIVA" value="N" <%if(!deduct.getE01DLIIVA().equals("Y")) out.print("checked");%>>
                No
            </td>
            <td nowrap > 
              <div align="right">Factor :</div>
            </td>
            <td nowrap> 
              <select name="E01DLIFAC" id="E01DLIFAC">
                <option value="F" <% if (!(deduct.getE01DLIFAC().equals("1") ||deduct.getE01DLIFAC().equals("2") ||deduct.getE01DLIFAC().equals("3")||deduct.getE01DLIFAC().equals("4"))) out.print("selected"); %>>FACTOR FIJO</option>
                <option value="1" <% if (deduct.getE01DLIFAC().equals("1")) out.print("selected"); %>>% sobre Monto Original</option>
                <option value="2" <% if (deduct.getE01DLIFAC().equals("2")) out.print("selected"); %>>% sobre Monto Principal</option>
                <option value="3" <% if (deduct.getE01DLIFAC().equals("3")) out.print("selected"); %>>% sobre valor Cuota</option>
                <option value="4" <% if (deduct.getE01DLIFAC().equals("4")) out.print("selected"); %>>% sobre Principal Mensual</option>
              </select>
            </td>
          </tr>
 
  <% if (!deduct.getH01FLGWK3().equals("3")) {%>        
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="right">Cuenta Acreditar :</div>
            </td>
            <td nowrap>                
                <input type="text" name="E01DLIBNK" id="E01DLIBNK" size="2" maxlength="2" value="<%= deduct.getE01DLIBNK().trim()%>">              
                <input type="text" name="E01DLIBRN" id="E01DLIBRN" size="4" maxlength="4" value="<%= deduct.getE01DLIBRN().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(branchHelp,this.name,document.getElementById('E01DLIBNK').value,'','','','')">              
                <input type="text" name="E01DLICCY" id="E01DLICCY" size="3" maxlength="3" value="<%= deduct.getE01DLICCY().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(currencyHelp,this.name,document.getElementById('E01DLIBNK').value,'','','','')">              
                <input type="text" name="E01DLIGLN" id="E01DLIGLN" size="17" maxlength="17"  value="<%= deduct.getE01DLIGLN().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(ledgerHelp,this.name,document.getElementById('E01DLIBNK').value,document.getElementById('E01DLICCY').value,'','','')">        
            </td>
            <td nowrap > 
              <div align="right">Forma de Pago :</div>
            </td>
            <td nowrap> 
              <select name="E01DLIPMF" id="E01DLIPMF">
              	<option value=" " <% if (!(deduct.getE01DLIPMF().equals("1") || deduct.getE01DLIPMF().equals("2") || deduct.getE01DLIPMF().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if (deduct.getE01DLIPMF().equals("1")) out.print("selected"); %>>Apertura Pre Pagado</option>
                <option value="2" <% if (deduct.getE01DLIPMF().equals("2")) out.print("selected"); %>>Apertura capitalizado</option>
                <option value="3" <% if (deduct.getE01DLIPMF().equals("3")) out.print("selected"); %>>Ciclo de Pago</option>
              </select>
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>">
            <td nowrap > 
              <div align="right">Deducción :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DLIDPM" size="17" maxlength="17" value="<%= deduct.getE01DLIDPM().trim()%>" >
            </td>
            <td nowrap > 
              <div align="right">Fecha de Próximo Pago:</div>
            </td>
            <td nowrap width="50%"> 
				<eibsinput:date name="deduct" fn_year="E01DLINPY" fn_month="E01DLINPM" fn_day="E01DLINPD" />
            </td>  
          </tr>
  <% } else { %>        
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="right">Año Fabricación :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DLIYOP" size="5" maxlength="4" value="<%= deduct.getE01DLIYOP().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Tabla Seguro :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01DLITBL" size="2" maxlength="2" value="<%= deduct.getE01DLITBL().trim()%>" >
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="right">Tipo Cobertura :</div>
            </td>
            <td nowrap >
             <INPUT type="checkbox" name="E01DLICMP" value="1" <% if (deduct.getE01DLICMP().equals("1")) out.print("checked"); %> >Comprensivo
            </td>
            <td nowrap >
             <INPUT type="checkbox" name="E01DLICOL" value="1" <% if (deduct.getE01DLICOL().equals("1")) out.print("checked"); %> >Colisión
            </td>
            <td nowrap >
             <INPUT type="checkbox" name="E01DLIINC" value="1" <% if (deduct.getE01DLIINC().equals("1")) out.print("checked"); %> >Incendio
            </td>
            <td nowrap >
             <INPUT type="checkbox" name="E01DLIROB" value="1" <% if (deduct.getE01DLIROB().equals("1")) out.print("checked"); %> >Robo
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="right">Meses de Seguro :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DLIINM" size="3" maxlength="3" value="<%= deduct.getE01DLIINM().trim()%>">
            </td>
            <td nowrap > 
              <div align="right">Meses Incli.Princ.:</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01DLIDDY" size="3" maxlength="2" value="<%= deduct.getE01DLIDDY().trim()%>">
            </td>
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
           <td nowrap > 
              <div align="right">Forma de Pago :</div>
            </td>
            <td nowrap > 
              <select name="E01DLIPMF" id="E01DLIPMF">
                <option value=" " <% if (!(deduct.getE01DLIPMF().equals("1") || deduct.getE01DLIPMF().equals("2") || deduct.getE01DLIPMF().equals("3"))) out.print("selected"); %>></option>
                <option value="1" <% if (deduct.getE01DLIPMF().equals("1")) out.print("selected"); %>>Apertura Pre Pagado</option>
                <option value="2" <% if (deduct.getE01DLIPMF().equals("2")) out.print("selected"); %>>Apertura capitalizado</option>
                <option value="3" <% if (deduct.getE01DLIPMF().equals("3")) out.print("selected"); %>>Ciclo de Pago</option>
                </select>
            </td>
            <td nowrap > 
              <div align="right">Incluye Cuota Fin. :</div>
            </td>
            <td nowrap > 
				<input type="radio" name="E01DLIPTY" value="Y"
					<%if(deduct.getE01DLIPTY().equals("Y")) out.print("checked");%>>Si<input
					type="radio" name="E01DLIPTY" value="N"
					<%if(!deduct.getE01DLIPTY().equals("Y")) out.print("checked");%>>No</td>
            <td nowrap >
          </tr>
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>">
            <td nowrap > 
              <div align="right">Pago Mensual :</div>
            </td>
            <td nowrap > 
              <input type="text" name="E01DLIDPM" size="17" maxlength="17" value="<%= deduct.getE01DLIDPM().trim()%>" >
            </td>
            <td nowrap > 
              <div align="right">Pago 1er Año :</div>
            </td>
            <td nowrap> 
              <input type="text" name="E01DLIBEG" size="17" maxlength="17" value="<%= deduct.getE01DLIBEG().trim()%>" onKeypress="enterDecimal()">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<h4>Contrapartida</h4>
  
  <TABLE id="mainTable" class="tableinfo">
  <TR>
  	<TD>
   		<table cellspacing=0 cellpadding=2 width="100%" border="0">
    		
          <tr id="<%= (rw % 2 == 1) ? "trdark" : "trclear" %><%rw++;%>"> 
            <td nowrap > 
              <div align="right">Bnc/Suc/Mnd/GL :</div>
            </td>
            <td nowrap >                
                <input type="text" name="E01DLIBNK" id="E01DLIBNK" size="2" maxlength="2" value="<%= deduct.getE01DLIBNK().trim()%>">             
                <input type="text" name="E01DLIBRN" id="E01DLIBRN" size="4" maxlength="4" value="<%= deduct.getE01DLIBRN().trim()%>"
                 class="context-menu-help"
                 onmousedown="init(branchHelp,this.name,document.getElementById('E01DLIBNK').value,'','','','')">             
                <input type="text" name="E01DLICCY" id="E01DLICCY" size="3" maxlength="3" value="<%= deduct.getE01DLICCY().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(currencyHelp,this.name,document.getElementById('E01DLIBNK').value,'','','','')">              
                <input type="text" name="E01DLIGLN" id="E01DLIGLN" size="17" maxlength="17"  value="<%= deduct.getE01DLIGLN().trim()%>" 
                 class="context-menu-help"
                 onmousedown="init(ledgerHelp,this.name,document.getElementById('E01DLIBNK').value,document.getElementById('E01DLICCY').value,'','','')">        
            </td>
            <td nowrap > 
              <div align="right"> </div>
            </td>
            <td nowrap> 
            </td>
          </tr>
        </table>
	</TD>
</TR>
</TABLE>

  <% } %>

  <% 
    String dedNew = "";
    try {
      dedNew = request.getParameter("NEW");
      if (dedNew==null) dedNew="N";
    }
    catch (Exception e) {
      dedNew = "N";
    } 
    
    if (dedNew.equals("Y")) { %> 
  <table border="0" width="100%">
    <tr>
      <td>
        <div align="center">
          <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
        </div>
      </td>
    </tr>
  </table>
  
  <div align="center"> </div>
  <% } else {%> 
  <table border="0" width="100%">
    <tr> 
      <td>
        <div align="center">
          <input type="checkbox" name="DELDED" id="DELDED" value="Y">
          Eliminar Deducción</div>
      </td>
    </tr>
    <tr>
      <td>
        <div align="center">
          <input id="EIBSBTN" type=button onClick="javascript:checkDelDed()" value="Enviar">
        </div>
      </td>
    </tr>
  </table>
  
  <div align="center"> </div>
  <% } %> 
<SCRIPT type="text/javascript">
 
 function checkDelDed(){
  var okdel=false;
	
  document.getElementById("OPT").value="M";
  // alert("opt=" + document.forms[0].OPT.value);
  if (document.getElementById("DELDED").checked) {
    okdel = confirm("Esta opcion borrara todo el lote de transacciones");
    if ( okdel ) document.getElementById("OPT").value="D"; else return false; 
  }
  document.forms[0].submit();
 }

</SCRIPT>
</form>
</body>
</html>
