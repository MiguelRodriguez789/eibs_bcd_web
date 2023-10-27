<!--
	Author:		Saif Mazhar
	Created:	1/26/07
	k0d3r
	-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Letter of Credit Details</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<jsp:useBean id="msg051005" class="datapro.eibs.beans.ELC051005Message"	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript">
   	
		builtNewMenu(lc_approval_transfer);
		initMenu();

</script>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
</head>
<body>
<h3 align="center">Transferencia de Carta De Credito <img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="lc_transfer.jsp, ELC0525"></h3>
<hr size="4">
<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525">
  <table class="tableinfo">
    <tbody>
      <tr>
        <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tbody>
              <tr id="trdark0">
                <td nowrap width="16%"><div align="right"><b>Banco :</b></div></td>
                <td nowrap width="20%"><input type="text" name="E05LCMBNK" readonly size="4" maxlength="2" value="<%=msg051005.getE05LCMBNK().trim()%>">
                </td>
                <td nowrap width="16%"><div align="right"><b>N�mero de Carta de Credito :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <%if (msg051005.getE05LCMACC().trim().equals("999999999999")) {%>
                    <input type="text" size="12" maxlength="12" value="Nuevo" readonly>
                    <input type="hidden" name="E05LCMACC" value="<%=msg051005.getE05LCMACC().trim()%>" readonly>
                    <%} else {%>
                    <input type="text" name="E05LCMACC" size="12" maxlength="12" value="<%=msg051005.getE05LCMACC().trim()%>" readonly>
                    <%}%>
                    </b></div></td>
              </tr>
              <tr id="trclear0">
                <td nowrap width="16%"><div align="right"><b>Nuestra Referencia :</b></div></td>
                <td nowrap width="20%"><div align="left">
                    <input type="text" name="E05LCMORF" size="20" maxlength="16" value="<%=msg051005.getE05LCMORF().trim()%>" readonly>
                  </div></td>
                <td nowrap width="16%"><div align="right"><b>Producto :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMPRO" size="4" maxlength="4" value="<%=msg051005.getE05LCMPRO().trim()%>" readonly>
                    </b></div></td>
              </tr>
              <tr id="trdark0">
                <td nowrap width="16%"><div align="right"><b>Referencia del Otro Banco :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMTRF" size="20" maxlength="16" value="<%=msg051005.getE05LCMTRF().trim()%>" readonly>
                    </b></div></td>
                <td nowrap width="16%"><div align="right"><b>Descripcion de Producto :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05DSCPRO" size="40" maxlength="35" value="<%=msg051005.getE05DSCPRO()%>"
							readonly>
                    </b></div></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table>
  <h4>Datos de la Transferencia </h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trclear">
            <td align="right">Numero : </td>
            <td align="left"><input type="text" name="E05LCTANUM" size="2"maxlength="2" readonly value="<%=msg051005.getE05LCTNUM()%>"></td>
            <td align="right">Monto a Transferir  :</td>
            <td align="left"><input type="text" name="E05LCTAMT" size="20"maxlength="15" value="<%=msg051005.getE05LCTAMT()%>">
            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></td>
            <td align="right">Referencia :</td>
            <td><input type="text" name="E05LCTREF" size="20"maxlength="15" value="<%=msg051005.getE05LCTREF()%>"></td>
          </tr>
      </table></td>
    </tr>
  </table>
  <h4>Datos del Credito</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td align="right">Fecha de Emisi�n:</td>
            <td align="left"><input type="text" name="E05LCMID12" size="3" maxlength="2" readonly
			value='<%=(msg051005.getE05LCMIDM().trim().equals("0") ? "" : msg051005.getE05LCMIDM().trim())%>' onKeyPress="enterInteger(event)">
              <input type="text" name="E05LCMID22" size="3" maxlength="2" readonly
			value='<%=(msg051005.getE05LCMIDD().trim().equals("0") ? "" : msg051005.getE05LCMIDD().trim())%>' onKeyPress="enterInteger(event)">
              <input type="text" name="E05LCMID32" size="5" maxlength="4" readonly
			value='<%if (msg051005.getE05LCMIDY().length() < 2 && !msg051005.getE05LCMIDY().equals("0"))
	out.print("0");
out.print(
	(msg051005.getE05LCMIDY().trim().equals("0")
		? ""
		: msg051005.getE05LCMIDY().trim()));%>'
			onKeyPress="enterInteger(event)">
              <a href="javascript:DatePicker(document.forms[0].E05LCMID1,document.forms[0].E05LCMID2,document.forms[0].E05LCMID3)"> <img src="<%=request.getContextPath()%>/images/calendar.gif" title="help" align="middle" border="0"></a></td>
            <td align="right">Fecha de Expiraci�n:</td>
            <td align="left"><input type="text" name="E05LCMEX12" size="3" maxlength="2"
			value='<%=(msg051005.getE05LCMEXM().trim().equals("0") ? "" : msg051005.getE05LCMEXM().trim())%>' onKeyPress="enterInteger(event)">
              <input type="text" name="E05LCMEX22" size="3" maxlength="2"
			value='<%=(msg051005.getE05LCMEXD().trim().equals("0") ? "" : msg051005.getE05LCMEXD().trim())%>' onKeyPress="enterInteger(event)">
              <input type="text" name="E05LCMEX32"
			size="5" maxlength="4"
			value='<%if (msg051005.getE05LCMEXY().length() < 2 && !msg051005.getE05LCMEXY().equals("0"))
	out.print("0");
out.print(
	(msg051005.getE05LCMEXY().trim().equals("0")
		? ""
		: msg051005.getE05LCMEXY().trim()));%>'
			onKeyPress="enterInteger(event)">
              <a
			href="javascript:DatePicker(document.forms[0].E05LCMEX1,document.forms[0].E05LCMEX2,document.forms[0].E05LCMEX3)"> <img src="<%=request.getContextPath()%>/images/calendar.gif"
			title="help" align="middle" border="0"></a></td>
          </tr>
          <tr>
            <td align="right">Monto Original:</td>
            <td align="left"><input type="text" name="E05LCMCCN2" size="20"	maxlength="15" value="<%=msg051005.getE05LCMOAM().trim()%>" readonly="readonly"></td>
            <td align="right">Monto Disponible</td>
            <td><input type="text" name="E05LCMMEB" size="20" maxlength="15"	value="<%=msg051005.getE05LCMMEB().trim()%>" readonly="readonly"></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <h4>Beneficiario Original</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tbody>
            <tr id="trdark">
              <td align="right">Numero de Cliente o de Cuenta:
                <select name="E05LCMACF" disabled="disabled">
                  <option value=" " <%if (!(msg051005.getE05LCMACF().equals("C") || msg051005.getE05LCMACF().equals("A")))
	out.print("selected");%> selected></option>
                  <option value="C" <%if (msg051005.getE05LCMACF().equals("C"))
	out.print("selected");%>>Cliente</option>
                  <option value="A" <%if (msg051005.getE05LCMACF().equals("A"))
	out.print("selected");%>>Cuenta</option>
                </select>
              </td>
              <td><input type="text" name="E05LCMBAC" size="12" maxlength="12"
				value='<%=(!msg051005.getE05LCMBAC().trim().equals("0") ? msg051005.getE05LCMBAC() : "")%>'
				readonly></td>
            </tr>
            <tr>
              <td><div align="right">Nombre :</div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN1" size="45" maxlength="35" value="<%=msg051005.getE05LCMBN1()%>" readonly>
                </div></td>
            </tr>
            <tr id="trdark">
              <td><div align="right">Direcci&oacute;n :</div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN2" size="45" maxlength="35" value="<%=msg051005.getE05LCMBN2()%>" readonly>
                </div></td>
            </tr>
            <tr id="trclear">
              <td><div align="right"></div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN3" size="45" maxlength="35" value="<%=msg051005.getE05LCMBN3()%>" readonly>
                </div></td>
            </tr>
            <tr id="trdark">
              <td><div align="right"></div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN4" size="45" maxlength="35" value="<%=msg051005.getE05LCMBN4()%>" readonly>
                </div></td>
            </tr>
            <tr id="trclear">
              <td><div align="right">Estado</div></td>
              <td align="left"><table>
                  <tbody>
                    <tr>
                      <td><input type="text" name="E05LCMBN5" size="2" maxlength="2" value="<%=msg051005.getE05LCMBN5()%>" readonly>
                        C&oacute;digo Postal
                        <input type="text" name="E05LCMBN6" size="11" maxlength="10" value="<%=msg051005.getE05LCMBN6()%>" readonly>
                        Pa&iacute;s
                        <input type="text" name="E05LCMBN7" size="4" maxlength="4" value="<%=msg051005.getE05LCMBN7()%>" readonly></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    
  </table>
  <h4>Nuevo Beneficiario</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
    <tbody>
      <tr id="trdark">
        <td align="right" >Numero de Cliente o de Cuenta:
          <select name="E05LCTACF">
            <option value=" "> </option>
            <option value="C"
					<%if (msg051005.getE05LCTACF().equals("C")) out.print("selected");%>>Cliente</option>
            <option value="A"
					<%if (msg051005.getE05LCTACF().equals("A")) out.print("selected");%>>Cuenta</option>
          </select></td>
        <td><input type="text" name="E05LCTBAC" size="12" maxlength="12"
				value='<%=(!msg051005.getE05LCTBAC().trim().equals("0") ? msg051005.getE05LCTBAC() : "")%>'>
          <a
				href="javascript: GetCustomerDetails('E05LCTBAC','E05LCTBN1','','','E05LCTBN7','E05LCTBN2','E05LCTBN3','E05LCTBN4','','E05LCTBN5','','','E05LCTBN6','','','','','')"><img
				src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
				onclick="javascript: document.forms[0].E05LCTACF.selectedIndex = 1"
				border="0"></a>Cliente o <a
				href="javascript: GetAccByClient('E05LCTBAC','','RT','','E05LCTBN1')"> <img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
				onclick="javascript: document.forms[0].E05LCTACF.selectedIndex = 2"
				border="0"></a> Cuenta</td>
      </tr>
      <tr>
        <td><div align="right">Nombre :</div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN1" size="45" maxlength="35" value="<%=msg051005.getE05LCTBN1()%>">
            <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></div></td>
      </tr>
      <tr id="trdark">
        <td><div align="right">Direcci&oacute;n :</div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN2" size="45" maxlength="35" value="<%=msg051005.getE05LCTBN2()%>">
          </div></td>
      </tr>
      <tr id="trclear">
        <td><div align="right"></div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN3" size="45" maxlength="35" value="<%=msg051005.getE05LCTBN3()%>">
          </div></td>
      </tr>
      <tr id="trdark">
        <td><div align="right"></div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN4" size="45" maxlength="35" value="<%=msg051005.getE05LCTBN4()%>">
          </div></td>
      </tr>
      <tr id="trclear">
        <td><div align="right">Estado</div></td>
        <td align="left"><table>
            <tbody>
              <tr>
                <td><input type="text" name="E05LCTBN5" size="2" maxlength="2" value="<%=msg051005.getE05LCTBN5()%>">
	                <a href="javascript:GetCodeCNOFC('E05LCTBN5','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0"></a> 
                  C&oacute;digo Postal
                  <input type="text" name="E05LCTBN6" size="11" maxlength="10" value="<%=msg051005.getE05LCTBN6()%>">
                  Pa&iacute;s
                  <input type="text" name="E05LCTBN7" size="4" maxlength="4" value="<%=msg051005.getE05LCTBN7()%>">
                  <a href="javascript:GetCodeCNOFC('E05LCTBN7','03')"> <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></a></td>
              </tr>
            </tbody>
          </table></td>
      	</tr>
    </tbody>
  </table></td></tr></table>

<h4>Mensaje Swift</h4>
	<table class="tableinfo">
		<TR id="trdark">
			<TD width="14%" align="right" nowrap>Generar Swift:</TD>
  			<TD nowrap width="16%">
  				<INPUT type="radio" name="E05LCTSWF" value="Y" <% if(!msg051005.getE05LCTSWF().equals("N")) out.print("checked");%>>Si
				<INPUT type="radio" name="E05LCTSWF" value="N" <% if( msg051005.getE05LCTSWF().equals("N")) out.print("checked");%>>No 
    		</TD>
  			<TD align="right" width="14%" nowrap>Tipo Mensaje: </TD>
  			<TD align="left" width="16%" nowrap>
  				<SELECT name="E05MSGTYP">
          			<OPTION value="720" <% if(msg051005.getE05MSGTYP().equals("720")) out.print("selected");%>>MT720</OPTION>
  					<OPTION value="700" <% if(msg051005.getE05MSGTYP().equals("700")) out.print("selected");%>>MT700</OPTION>
  				</SELECT>
  			</TD>
			<TD width="14%" align="right" nowrap>Banco Receptor:</TD>
    		<TD align="left" width="16%" nowrap><INPUT type="text" name="E05RCVRID" size="14" maxlength="12" value="<%=msg051005.getE05RCVRID()%>">
      			<A href="javascript:GetSwiftId('E05RCVRID')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A>
  			</TD>
		</TR>
	</table>

  <br>
  <div align="center">
    <input type="hidden" name="H02FLGWK1" value="">
  </div>

</form>
</body>
</html>
