<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session"/>

<script type="text/javascript">
function advanceSearch(){
	  document.forms[0].SCREEN.value = 300;
	  document.forms[0].submit();
}

function validPortfolio(){
	var valRet = true;
	if (document.forms[0].SEARCHC.value == 'P' && trim(document.forms[0].CUSTOMER.value) != ''){
   		valRet= false;
		alert("invalid customer number");
	} 
	return valRet;
}

function validCustomer() {
	var valRet = true;
	if (trim(document.forms[0].PORTFOLIO.value) == '') {
   		document.forms[0].SEARCHC.value = 'C';
	} else {
	   document.forms[0].SEARCHC.value = 'P';
	}
}

function validOptions(opt) {
   document.forms[0].SEARCHC.value=opt;
}	 
</script>

<META name="GENERATOR" content="IBM WebSphere Studio">
</head>
<body>

 
 <% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
    }
%>
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.invest.JSEWD0309" onSubmit="return(validPortfolio())">
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <input type=HIDDEN name="SEARCHC" value="">
  <h3 align="center">Orden de Compra - Venta (Back Office)</h3>
  <table class="tbenter" height="55%" width="100%" border="0">
    <tr> 
      <td nowrap align="center"> 
        <table class="tableinfo" align="center" width="100%" >
          <tr> 
            <td> 
              <table width="100%">
                <tr tr id="trdark"> 
                  <td valign="middle" align="center" colspan="2" height=33> 
                    <div align="left"><b>Buscar por</b></div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="27%" nowrap> 
                    <div align="right">N&uacute;mero de Transacci&oacute;n :</div>
                  </td>
                  <td width="73%" nowrap> 
                    <input type="text" name="ORDERNUM"  size=9 maxlength="9" 
					  onChange="document.forms[0].SEARCHC.value='O'">
                    o</td>
                </tr>
                <tr id="trclear"> 
                  <td width="27%" nowrap> 
                    <div align="right">Cliente :</div>
                  </td>
                  <td width="73%" nowrap> 
                    <input type="text" name="CUSTOMER"  size=9 maxlength="9" 
						onChange="javascript:validCustomer()">
                    <a href="javascript:GetCustomerDescId('CUSTOMER','','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a> 
                    y / o Portafolio : 
                    <INPUT type="text" name="PORTFOLIO" size="6" maxlength="5" onchange="document.forms[0].SEARCHC.value='P'">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" > 
                    o</td>
                </tr>
                <tr id="trclear"> 
                  <td width="27%" nowrap> 
                    <div align="right">Broker : </div>
                  </td>
                  <td nowrap width="73%"> 
                    <input type="text" name="BROKER"  size=5 maxlength="4" 
					onChange="document.forms[0].SEARCHC.value='B'">
                    <input type="text" name="BDESC"  size=35 maxlength="30" 
					onChange="document.forms[0].SEARCHC.value='B'">
                    <a href="javascript:GetBrokerI('BROKER','BDESC')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0"></a> 
                    o</td>
                </tr>
                <tr id="trclear"> 
                  <td width="27%" nowrap > 
                    <div align="right">Emisor : </div>
                  </td>
                  <td nowrap width="73%" > 
                    <input type="text" name="ISSUER"  size=35 maxlength="30" 
					onChange="document.forms[0].SEARCHC.value='I'">
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="27%" nowrap > 
                    <div align="right">Tipo de Instrumento : </div>
                  </td>
                  <td nowrap width="73%" > 
                    <div align="left"> 
                      <select name="TYPE">
                        <option value=" ">Todos </option>
                        <option value="BND">Bonos</option>
                        <option value="EQT">Acciones</option>
                        <option value="MUT">Fondos Mutuos</option>
                        <option value="PFS">Acciones Preferenciales</option>
                      </select>
                    </div>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="27%" nowrap > 
                    <div align="right">Tipo de Transacci&oacute;n :</div>
                  </td>
                  <td nowrap width="73%" > 
                    <select name="TRANSTYPE">
                      <option value="">Todas</option>
                      <option value="1">Compra</option>
                      <option value="2">Venta</option>
                      <option value="3">Transferencia de Entrada</option>
                      <option value="4">Transferencia de Salida</option>
                      <option value="5">Compras M�ltiples</option>
                    </select>
                  </td>
                </tr>
                <tr id="trclear"> 
                  <td width="31%" nowrap > 
                    <div align="right">Fecha de la Orden : </div>
                  </td>
                  <td nowrap width="69%" > 
                    <div align="left"> 
                      <input type="text" size="3" maxlength="2" name="DATEF1" onChange="document.forms[0].SEARCHC.value='D'">
                      <input type="text" size="3" maxlength="2" name="DATEF2" onKeyPress="enterInteger(event)">
                      <input type="text" size="5" maxlength="4" name="DATEF3" onKeyPress="enterInteger(event)">
                      <a href="javascript:DatePicker(document.forms[0].DATEF1,document.forms[0].DATEF2,document.forms[0].DATEF3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
                      para 
                      <input type="text" size="3" maxlength="2" name="DATET1" onChange="document.forms[0].SEARCHC.value='D'">
                      <input type="text" size="3" maxlength="2" name="DATET2" onKeyPress="enterInteger(event)">
                      <input type="text" size="5" maxlength="4" name="DATET3" onKeyPress="enterInteger(event)">
                      <a href="javascript:DatePicker(document.forms[0].DATET1,document.forms[0].DATET2,document.forms[0].DATET3)"><img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a> 
                    </div>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
          <tr bgcolor="#FFFFFF"> 
            <td width="33%"> 
              <div align="center"> 
                <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
              </div>
            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td> 
              <div align="center"> </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
