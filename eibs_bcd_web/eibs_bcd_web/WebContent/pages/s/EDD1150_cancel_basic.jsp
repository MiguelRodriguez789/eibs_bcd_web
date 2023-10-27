<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@ page  import = "datapro.eibs.master.Util" %>

<html>
<head>
<title>Cancelacion de Cuentas de Detalle</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="rtCancel" class="datapro.eibs.beans.EDD115001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<SCRIPT type="text/javascript">

function CheckAcc(){
 if(confirm("Esta Ud. seguro que desea cancelar la Cuenta número: " + getElement("E01ACMACC").value )) {
     document.forms[0].submit();
  }
}

</SCRIPT>
</head>
<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 String blocked = "";
	if (!currUser.getE01AUT().equals("B")) {
		blocked = "readonly disabled";
	} 

%> 
<H3 align="center">Cancelacion de Cuentas de Detalle<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="cancel_basic.jsp, EDD1150"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDD1150">
  <INPUT TYPE=HIDDEN NAME="SCREEN" id="SCREEN" value="2">
  <INPUT TYPE=HIDDEN NAME="ACMACD" id="ACMACD" value="<%= rtCancel.getE01ACMACD().trim()%>">
 
 <% int row = 0;%>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
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
                <input type="text"  name="E01ACMACC" id="E01ACMACC" size="13" maxlength="12" value="<%= rtCancel.getE01ACMACC().trim()%>" readonly>
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
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">          
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="28%" height="23"> 
              <div align="right">Fecha de Apertura :</div>
            </td>
            <td nowrap width="20%" height="23"> 
				<eibsinput:date name="rtCancel" fn_year="E01OPNDTY" fn_month="E01OPNDTM" fn_day="E01OPNDTD" readonly="true"/>
            </td>
            <td nowrap width="24%" height="23"> 
              <div align="right">Fecha de Cancelacion :</div>
            </td>
            <td nowrap width="28%" height="23"> 
				<eibsinput:date name="rtCancel" fn_year="E01RUNDTY" fn_month="E01RUNDTM" fn_day="E01RUNDTD" readonly="true"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  
  <h4>Saldos</h4>
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"> <b>Saldo Contable :</b></div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="rtCancel" property="E01GRSBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">(+) Monto Diferido :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="rtCancel" property="E01UNCBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">(-) Monto Retenido :</div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="rtCancel" property="E01HLDAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right"> <b>Saldo Disponible :</b></div>
            </td>
            <td nowrap width="60%"> 
 		        <eibsinput:text name="rtCancel" property="E01NETBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(+) Intereses Pagados :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01INTAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Intereses Recibidos :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01OVDAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(+) Reajsutes Positivo :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01REAAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Reajsutes Negativo :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01RECAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Comisiones :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01COMAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Otros Cargos :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01DDCAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Pendiente Amortizar :</div>
            </td>
            <td nowrap width="60%" height="19"> 
				<eibsinput:text name="rtCancel" property="E01AMOAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>"  readonly="true"/>
            </td>
          </tr>  
           <tr id="trclear">
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Monto Rte. Fte. :</div>
            </td>
            <td nowrap width="60%" height="19">
             <eibsinput:text name="rtCancel" property="E01MONRFT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>  
          <tr id="trdark">
            <td nowrap width="40%" height="19"> 
              <div align="right">(-) Monto G.M.F :</div>
            </td>
            <td nowrap width="60%" height="19">
             <eibsinput:text name="rtCancel" property="E01MONIDB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%" height="19">
              <div align="right"><b>Saldo a Pagar :</b></div>
            </td>
            <td nowrap width="60%" height="19">
            <% if (Util.fcolorCCY(rtCancel.getE01PAGAMT().trim()).startsWith("<FONT COLOR=RED>")) { %>
		        <eibsinput:text name="rtCancel" property="E01PAGAMT" style="color:RED" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
			<% } else { %>
		        <eibsinput:text name="rtCancel" property="E01PAGAMT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
			<% } %>
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
              <input type="radio" name="E01NPGINT" value="Y" onClick="CalculateAvail();"
			  <%if(!(rtCancel.getE01NPGINT().equals("N"))) out.print("checked");%>  >
              Si 
              <input type="radio" name="E01NPGINT" value="N" onClick="CalculateAvail();"
			  <%if(rtCancel.getE01NPGINT().equals("N")) out.print("checked");%> >
              No </td>
            <td nowrap width="25%"> 
              <div align="right">Cobra Intereses Sobregiro :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="radio" name="E01NPGOVD" value="Y" onClick="CalculateAvail();"
			  <%if(!(rtCancel.getE01NPGOVD().equals("N"))) out.print("checked");%> >
              Si 
              <input type="radio" name="E01NPGOVD" value="N" onClick="CalculateAvail();"
			  <%if(rtCancel.getE01NPGOVD().equals("N")) out.print("checked");%> >
              No </td>
          </tr> 
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="25%">  
              <div align="right">Pago Reajuste Calculados :</div>
            </td>
            <td nowrap width="25%">
              <input type="radio" name="E01NPGREA" value="Y" onClick="CalculateAvail();"
			  <%if(!(rtCancel.getE01NPGREA().equals("N"))) out.print("checked");%>  >
              Si 
              <input type="radio" name="E01NPGREA" value="N" onClick="CalculateAvail();"
			  <%if(rtCancel.getE01NPGREA().equals("N")) out.print("checked");%> >
              No </td>
            <td nowrap width="25%"> 
              <div align="right">Cobra Comisiones Pendientes :</div>
            </td>
            <td nowrap width="25%"> 
              <input type="radio" name="E01NPGCOM" value="Y" onClick="CalculateAvail();"
			  <%if(!(rtCancel.getE01NPGCOM().equals("N"))) out.print("checked");%> >
              Si 
              <input type="radio" name="E01NPGCOM" value="N" onClick="CalculateAvail();"
			  <%if(rtCancel.getE01NPGCOM().equals("N")) out.print("checked");%> >
              No </td>
          </tr> 
          <tr id="trclear"> 
            <td nowrap width="25%" > 
              <div align="right">Exenta de G.M.F. :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="hidden" name="E01FLGIDB" value="<%= rtCancel.getE01FLGIDB()%>">
              <input type="radio" name="CE01FLGIDB" value="Y" onClick="document.forms[0].E01FLGIDB.value = 'Y'"
			  <% if(rtCancel.getE01FLGIDB().equals("Y")) out.print("checked");%> disabled="disabled" >
              S&iacute; 
              <input type="radio" name="CE01FLGIDB" value="N" onClick="document.forms[0].E01FLGIDB.value = 'N'"
			  <% if(!rtCancel.getE01FLGIDB().equals("Y")) out.print("checked");%> disabled="disabled" >
              No </td>
            <td nowrap width="25%" > 
              <div align="right">Monto Base Imponible G.M.F :</div>
            </td>
            <td nowrap width="25%" > 
             <eibsinput:text name="rtCancel" property="E01BASIMP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true"/>
            </td>
          </tr>
           <tr id="trdark"> 
            <td nowrap width="25%" > 
              <div align="right">Exenta de Rte. Fte. :</div>
            </td>
            <td nowrap width="25%" > 
              <input type="hidden" name="E01FLGRFT" value="<%= rtCancel.getE01FLGRFT()%>">
              <input type="radio" name="CE01FLGRTF" value="Y" onClick="document.forms[0].E01FLGRFT.value = 'Y'"
              <%if(rtCancel.getE01FLGRFT().equals("Y")) out.print("checked");%> disabled="disabled" >
              S&iacute; 
              <input type="radio" name="CE01FLGRTF" value="N" onClick="document.forms[0].E01FLGRFT.value = 'N'"
              <%if(!rtCancel.getE01FLGRFT().equals("Y")) out.print("checked");%> disabled="disabled" >
              No </td>
            <td nowrap width="25%" > 
              <div align="right">Monto Base Imponible Rte. Fte. :</div>
            </td>
            <td nowrap width="25%" >
             <eibsinput:text name="rtCancel" property="E01BASRFT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
            </td>
          </tr>
          
          
        </table>
      </td>
    </tr>
  </table>
 
  <table class="tableinfo">
    <tr > 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Observaciones :</div>
            </td>
            <td nowrap width="60%">
                 <eibsinput:text property="E01NARRAT" name="rtCancel" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true"/>
            </td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap width="40%"> 
              <div align="right">Razon de Cancelación :</div>
            </td>
            <td nowrap width="60%" >
                 <eibsinput:cnofc name="rtCancel" property="E01CANRSN" required="false" flag="50" fn_code="E01CANRSN" fn_description="E01DSCRSN" />
                 <eibsinput:text property="E01DSCRSN" name="rtCancel" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true"/>
            </td> 
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            <td nowrap  width="40%"> 
              <div align="right">Oficial :</div>
            </td>
            <td nowrap width="60%"> 
                 <eibsinput:cnofc name="rtCancel" property="E01ACMOFC" required="false" flag="15" fn_code="E01ACMOFC" fn_description="E01DSCOFC" />
                 <eibsinput:text property="E01DSCOFC" name="rtCancel" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NAME%>" required="true" readonly="true"/>
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
            <td nowrap  width="20%"> 
              <div align="center"> 
                <input type="text" size="3" maxlength="2" readonly name="E01PAGOPC" value="<%= rtCancel.getE01PAGOPC().trim()%>">
<!--                    class="context-menu-help" onmousedown="init(conceptHelp,this.name,getElement('E01PAGOBK').value, getElement('E01PAGOCY').value,'E01PAGOGL','E01PAGOPC',getElement('ACMACD').value, '06')"> -->
                <input type=HIDDEN name="E01PAGOGL" value="<%= rtCancel.getE01PAGOGL().trim()%>">
                <input type="text" size="25" maxlength="25" readonly name="E01PAGCON" value="<%= rtCancel.getE01PAGCON().trim()%>"
                   class="context-menu-help" onmousedown="init(conceptHelp,this.name,getElement('E01PAGOBK').value, getElement('E01PAGOCY').value,'E01PAGOGL','E01PAGOPC',getElement('ACMACD').value, '06')">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
                <input type="text" size="2" maxlength="2" value="<%= rtCancel.getE01PAGOBK().trim()%>" name="E01PAGOBK" id="E01PAGOBK" onKeyPress="enterInteger(event)">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
                <input type="text" size="4" maxlength="4" value="<%= rtCancel.getE01PAGOBR().trim()%>" name="E01PAGOBR" 
                 class="context-menu-help" onmousedown="init(branchHelp,this.name,getElement('E01PAGOBK').value,'','','','')" onKeyPress="enterInteger(event)">
              </div>
            </td>
            <td nowrap width="20%"> 
              <div align="center"> 
                <input type="text" size="3" maxlength="3" name="E01PAGOCY" value="<%= "".equals(rtCancel.getE01PAGOCY().trim()) ? rtCancel.getE01ACMCCY().trim() : rtCancel.getE01PAGOCY() %>"
                class="context-menu-help" onmousedown="init(currencyHelp,this.name,getElement('E01PAGOBK').value,'','','','')">
              </div>
            </td>
            <td nowrap  width="20%"> 
              <div align="center"> 
                <input type="text" size="16" maxlength="16" value="<%= rtCancel.getE01PAGOAC().trim()%>" name="E01PAGOAC" 
                 class="context-menu-help" onmousedown="init(accountHelp,this.name,getElement('E01PAGOBK').value,'','','','RT')"  onKeyPress="enterInteger(event)">
              </div>
            </td>
          </tr>
        </table>
      </TD>  
	</TR>	
</TABLE>    

  <p align="center"> 
    <input id="EIBSBTN" type=button name="Submit" OnClick="CheckAcc()" value="Enviar">
  </p>

 </form>
</body>
</html>
