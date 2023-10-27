<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page import="com.datapro.eibs.constants.ISOCodes"%>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<%@ page  import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Cancelacion de Cuentas de Detalle</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">



<jsp:useBean id="rtCancel" class="datapro.eibs.beans.EDD115001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtHPopUp();

  function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }	

</SCRIPT>

<SCRIPT type="text/javascript">
function CalculateAvail(){

  var myForm = document.forms[0];

  var PAGAMT = 0;
  var GRSBAL = parseFloat((myForm.E01GRSBAL.value));
  var INTAMT = parseFloat((myForm.E01INTAMT.value));
  var OVDAMT = parseFloat((myForm.E01OVDAMT.value));
  var COMAMT = parseFloat((myForm.E01COMAMT.value));

  PAGAMT = GRSBAL - COMAMT;

  if(myForm.E01NPGINT.value=='Y'){
    PAGAMT = PAGAMT + INTAMT;
  }
  if(myForm.E01NPGOVD.value=='Y'){
    PAGAMT = PAGAMT - OVDAMT;
  }
  myForm.E01PAGAMT.value = PAGAMT + '';
}

function loadInitial(){

var myForm = document.forms[0];

myForm.E01NPGOVD.value = myForm.CE01NPGOVD.value;
myForm.E01NPGINT.value = myForm.CE01NPGINT.value;

}

</SCRIPT>

<SCRIPT type="text/javascript">
function CheckAcc(){
if(confirm("Esta Ud. seguro que desea cancelar la Cuenta número: " + document.forms[0].E01ACMACC.value )){
document.forms[0].submit();
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
  

%> 
<H3 align="center">Cancelacion de Cuentas de Detalle<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cancel_ap_basic.jsp, EDD1150"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1150" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="ACMACD" value="<%= rtCancel.getE01ACMACD().trim()%>">

  <table class="tableinfo">
    <tr > 
      <td nowrap height="69"> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01ACMCUN" size="10" maxlength="9" value="<%= rtCancel.getE01ACMCUN().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text"  name="E01CUSNA1" size="45" maxlength="45" readonly value="<%= rtCancel.getE01CUSNA1().trim()%>">
              </div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="16%"> 
              <div align="right"><b>Cuenta : </b></div>
            </td>
            <td nowrap width="20%"> 
              <div align="left"> 
                <input type="text"  name="E01ACMACC" size="13" maxlength="9" value="<%= rtCancel.getE01ACMACC().trim()%>" readonly>
              </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Moneda :</b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text"  name="E01ACMCCY" size="3" maxlength="3" value="<%= rtCancel.getE01ACMCCY().trim()%>" readonly>
                </b> </div>
            </td>
            <td nowrap width="16%"> 
              <div align="right"><b>Producto : </b></div>
            </td>
            <td nowrap width="16%"> 
              <div align="left"><b> 
                <input type="text"  name="E01ACMPRO" size="4" maxlength="4" readonly value="<%= rtCancel.getE01ACMPRO().trim()%>">
                </b> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
 
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  
  <%int row = 0; %>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%"> 
              <div align="right">Saldo Neto :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01GRSBAL" size="15" maxlength="13" value="<%= rtCancel.getE01GRSBAL().trim()%>" onkeypress="enterInteger(event)">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Monto Diferido :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01UNCBAL" size="15" maxlength="13" value="<%= rtCancel.getE01UNCBAL().trim()%>" onKeyPress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%"> 
              <div align="right">Saldo Disponible :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01NETBAL" size="15" maxlength="13" value="<%= rtCancel.getE01NETBAL().trim()%>" onKeyPress="enterInteger(event)">
            </td>
            <td nowrap width="25%"> 
              <div align="right">Monto Retenido :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="text" readonly name="E01HLDAMT" size="15" maxlength="13" value="<%= rtCancel.getE01HLDAMT().trim()%>" onKeyPress="enterInteger(event)">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" height="23"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="25%" height="23"> 
  				<eibsinput:date name="rtCancel" fn_year="E01OPNDTY" fn_month="E01OPNDTM" fn_day="E01OPNDTD" readonly="true"/>
            </td>
            <td nowrap width="25%" height="23"> 
              <div align="right">Fecha de Cancelacion :</div>
            </td>
            <td nowrap width="25%" height="23"> 
  				<eibsinput:date name="rtCancel" fn_year="E01RUNDTY" fn_month="E01RUNDTM" fn_day="E01RUNDTD" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n de Cancelaci&oacute;n</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%" height="19"> 
              <div align="right">Intereses Pagados :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E01INTAMT" size="15" maxlength="13" 
			  onBlur="javascript:CalculateAvail();"
			  value="<%= rtCancel.getE01INTAMT().trim()%>" onKeyPress="enterDecimal()" readonly>
            </td>
            <td nowrap width="25%" height="19"> 
              <div align="right">Intereses Recibidos :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E01OVDAMT" size="15" maxlength="13" 
			  onBlur="javascript:CalculateAvail();"
			  value="<%= rtCancel.getE01OVDAMT().trim()%>" onKeyPress="enterDecimal()" readonly>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">  
            <td nowrap width="25%" height="19"> 
              <div align="right">Comisiones :</div>
            </td>
            <td nowrap width="25%" height="19"> 
              <input type="text" name="E01COMAMT" size="15" maxlength="13" 
			 onBlur="javascript:CalculateAvail();" 
			 value="<%= rtCancel.getE01COMAMT().trim()%>" onKeyPress="enterDecimal()" readonly>
            </td>
            <td nowrap width="25%" height="19">
              <div align="right"><b>Saldo Disponible :</b></div>
            </td>
            <td nowrap width="25%" height="19">
              <input type="text" readonly name="E01PAGAMT" size="15" maxlength="13" value="<%= Util.fcolorCCY(rtCancel.getE01PAGAMT().trim())%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n Adicional</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Pago Intereses Calculados :</div>
            </td>
            <td nowrap width="25%">
              <input type="radio" name="E01NPGINT" value="Y" disabled
			  onClick="CalculateAvail();"
			  <%if(rtCancel.getE01NPGINT().equals("Y")) out.print("checked");%> >
              Si 
              <input type="radio" name="E01NPGINT" value="N" disabled
			  onClick="CalculateAvail();"
			  <%if(!(rtCancel.getE01NPGINT().equals("Y"))) out.print("checked");%>>
              No 
            </td>
            <td nowrap width="25%"> 
              <div align="right">Cobra Intereses Sobregiro :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="radio" name="E01NPGOVD" value="Y" disabled
			  onClick="CalculateAvail();"
			  <%if(rtCancel.getE01NPGOVD().equals("Y")) out.print("checked");%> >
              Si 
              <input type="radio" name="E01NPGOVD" value="N" disabled
			  onClick="CalculateAvail();"
			  <%if(!(rtCancel.getE01NPGOVD().equals("Y"))) out.print("checked");%>>
              No 
             </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%"> 
              <div align="right">Razon de Cancelación :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" readonly name="E01CANRSN" size="5" maxlength="3" value="<%= rtCancel.getE01CANRSN().trim()%>"> 
            </td> 
            <td nowrap width="25%"> 
              <div align="right">Observaciones :</div>
            </td>
            <td nowrap width="25%">
              <input type="text" readonly name="E01NARRAT" size="35" maxlength="30" value="<%= rtCancel.getE01NARRAT().trim()%>">
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap colspan="2"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap colspan="2"> 
              <input type="text" readonly name="E01ACMOFC" size="5" maxlength="3" value="<%= rtCancel.getE01ACMOFC().trim()%>">
              <input type="text" readonly name="E01DSCOFC" size="36" maxlength="35" value="<%= rtCancel.getE01DSCOFC().trim()%>" readonly>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Cuenta de Repago </h4>
  <TABLE class="tableinfo" >
  <TR>
      <TD>
        <table style="filter:''" width="100%">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="20%"> 
              <div align="center">Concepto</div>
            </td>
            <td nowrap  width="20%"> 
              <div align="center">Banco</div>
            </td>
            <td nowrap  width="20%"> 
              <div align="center">Agencia</div>
            </td>
            <td nowrap  width="20%"> 
              <div align="center">Moneda </div>
            </td>
            <td nowrap  width="20%"> 
              <div align="center">Referencia</div>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  > 
              <div align="center"> 
                <input type="text" size="3" maxlength="2" readonly name="E01PAGOPC" value="<%= rtCancel.getE01PAGOPC().trim()%>" readonly>
                <input type=HIDDEN name="E01PAGOGL" value="<%= rtCancel.getE01PAGOGL().trim()%>">
                <input type="text" size="25" maxlength="25" readonly name="E01PAGCON" value="<%= rtCancel.getE01PAGCON().trim()%>" readonly>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" size="2" maxlength="2" value="<%= rtCancel.getE01PAGOBK().trim()%>" name="E01PAGOBK" readonly>
              </div>
            </td>
            <td nowrap> 
              <div align="center"> 
                <input type="text" size="4" maxlength="4" value="<%= rtCancel.getE01PAGOBR().trim()%>" name="E01PAGOBR" readonly>
              </div>
            </td>
            <td nowrap > 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" name="E01PAGOCY" value="<%= rtCancel.getE01PAGOCY().trim()%>" readonly>
              </div>
            </td>
            <td nowrap  > 
              <div align="center"> 
                <input type="text" size="17" maxlength="16" value="<%= rtCancel.getE01PAGOAC().trim()%>" name="E01PAGOAC" readonly>
              </div>
            </td>
          </tr>
        </table>
      </TD>  
</TR>	
</TABLE>    

  
  </form>
<SCRIPT>
      //CalculateAvail();
</SCRIPT>
</body>
</html>
