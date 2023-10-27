<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
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

<jsp:useBean id="msg046005" class="datapro.eibs.beans.ELC046005Message"	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript">
   	
		  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   		initMenu();
   <%} else {%>
   builtNewMenu(lc_transfer_hist);
   initMenu();
  <%}%>
		

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
<h3 align="center">Historial de Transferencia de Carta de Crédito <img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="lc_transfer.jsp, ELC0460"></h3>
<hr size="4">
<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0450">
  
 <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="18%" align="right"><b>Tipo de Operacion :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E02LCMBNK" value="<%= userPO.getHeader1() %>" size="30" maxlength="30" readonly></td>
      <td height="18%" align="right"><b>Operador  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="30" maxlength="30" value="<%= userPO.getHeader2() %>" readonly></td>
      <td height="18%" align="right"><b>Fecha y Hora  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="20" maxlength="12" value="<%= userPO.getHeader3() %>" readonly></td>
    </tr>

    <tr id="trdark">
      <td width="18%" align="right"><b>Aprobación :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= userPO.getHeader4() %>" size="30" maxlength="30" readonly></td>
      <td height="18%" align="right"><b>Supervisor  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="30" maxlength="30" value="<%= userPO.getHeader5() %>" readonly></td>
      <td height="18%" align="right"><b>Fecha y Hora  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="20" maxlength="12" value="<%= userPO.getHeader6() %>" readonly></td>
    </tr>
  </table>
   <br>
  <table class="tableinfo">
    <tbody>
      <tr>
        <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tbody>
              <tr id="trdark">
                <td nowrap width="16%"><div align="right"><b>Banco :</b></div></td>
                <td nowrap width="20%"><input type="text" name="E05LCMBNK" readonly size="4" maxlength="2" value="<%=msg046005.getE05LCMBNK().trim()%>">
                </td>
                <td nowrap width="16%"><div align="right"><b>Número de Carta de Crédito :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMACC" size="12" maxlength="12" value="<%=msg046005.getE05LCMACC().trim()%>" readonly>
                    </b></div></td>
              </tr>
              <tr id="trclear">
                <td nowrap width="16%"><div align="right"><b>Nuestra Referencia :</b></div></td>
                <td nowrap width="20%"><div align="left">
                    <input type="text" name="E05LCMORF" size="20" maxlength="16" value="<%=msg046005.getE05LCMORF().trim()%>" readonly>
                  </div></td>
                <td nowrap width="16%"><div align="right"><b>Producto :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMPRO" size="4" maxlength="4" value="<%=msg046005.getE05LCMPRO().trim()%>" readonly>
                    </b></div></td>
              </tr>
              <tr id="trdark">
                <td nowrap width="16%"><div align="right"><b>Referencia del Otro Banco :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMTRF" size="20" maxlength="16" value="<%=msg046005.getE05LCMTRF().trim()%>" readonly>
                    </b></div></td>
                <td nowrap width="16%"><div align="right"><b>Descripción del Producto :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05DSCPRO" size="40" maxlength="35" value="<%=msg046005.getE05DSCPRO()%>"
							readonly>
                    </b></div></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table>
  <h4>Datos de la Transferencia </h4>
  <table class="tableinfo" cellpadding="0" cellspacing="0">
	<tr id="trdark">
        <td align="right">Número : </td>
        <td align="left"><input type="text" name="E05LCTNUM" size="2" maxlength="2" readonly value="<%=msg046005.getE05LCTNUM()%>"></td>
        <td align="right">Monto a Transferir :</td>
		<td align="left"><input type="text" name="E05LCTAMT" size="20" maxlength="15" value="<%=msg046005.getE05LCTAMT()%>" readonly></td>
    </tr>
    <tr id="trclear">
        <td align="right">Referencia :</td>
        <td><input type="text" name="E05LCTREF" size="20" maxlength="15" value="<%=msg046005.getE05LCTREF()%>" readonly></td>
        <td align="right">Nueva Carta de Crédito :</td>
        <td><input type="text" name="E05LCTNLC" size="20" maxlength="15" value="<%=msg046005.getE05LCTNLC()%>" readonly></td>
    </tr>    
	<tr id="trdark">
        <td align="right">Código de Producto : </td>
        <td align="left"><input type="text" name="E05LCTPRO" size="6" maxlength="4" readonly value="<%=msg046005.getE05LCTPRO()%>"></td>
		<td align="right">Fecha de Expiración :</td>
        <td align="left">
        	<eibsinput:date name="msg046005" fn_month="E05LCTEXM" fn_day="E05LCTEXD" fn_year="E05LCTEXY" readonly="true" />
		</td>
    </tr>     
  </table>
  <h4>Datos del Crédito</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td align="right">Fecha de Emisión:</td>
            <td align="left">
	        	<eibsinput:date name="msg046005" fn_month="E05LCMIDM" fn_day="E05LCMIDD" fn_year="E05LCMIDY" readonly="true" />
            </td>
            <td align="right">Fecha de Expiración:</td>
	        	<eibsinput:date name="msg046005" fn_month="E05LCMEXM" fn_day="E05LCMEXD" fn_year="E05LCMEXY" readonly="true" />
            </td>
          </tr>
          <tr>
            <td align="right">Monto Original:</td>
            <td align="left"><input type="text" name="E05LCMCCN2" size="20"	maxlength="15" value="<%=msg046005.getE05LCMOAM().trim()%>" readonly="readonly"></td>
            <td align="right">Monto Disponible</td>
            <td><input type="text" name="E05LCMMEB" size="20" maxlength="15"	value="<%=msg046005.getE05LCMMEB().trim()%>" readonly="readonly"></td>
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
                  <option value=" " <%if (!(msg046005.getE05LCMACF().equals("C") || msg046005.getE05LCMACF().equals("A")))
	out.print("selected");%> selected></option>
                  <option value="C" <%if (msg046005.getE05LCMACF().equals("C"))
	out.print("selected");%>>Cliente</option>
                  <option value="A" <%if (msg046005.getE05LCMACF().equals("A"))
	out.print("selected");%>>Cuenta</option>
                </select>
              </td>
              <td><input type="text" name="E05LCMBAC" size="12" maxlength="12"
				value='<%=(!msg046005.getE05LCMBAC().trim().equals("0") ? msg046005.getE05LCMBAC() : "")%>'
				readonly></td>
            </tr>
            <tr>
              <td><div align="right">Nombre: </div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN1" size="45" maxlength="35" value="<%=msg046005.getE05LCMBN1()%>" readonly>
                </div></td>
            </tr>
            <tr id="trdark">
              <td><div align="right">Dirección: </div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN2" size="45" maxlength="35" value="<%=msg046005.getE05LCMBN2()%>" readonly>
                </div></td>
            </tr>
            <tr id="trclear">
              <td><div align="right"></div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN3" size="45" maxlength="35" value="<%=msg046005.getE05LCMBN3()%>" readonly>
                </div></td>
            </tr>
            <tr id="trdark">
              <td><div align="right"></div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN4" size="45" maxlength="35" value="<%=msg046005.getE05LCMBN4()%>" readonly>
                </div></td>
            </tr>
            <tr id="trclear">
              <td><div align="right">Estado: </div></td>
              <td align="left"><table>
                  <tbody>
                    <tr>
                      <td><input type="text" name="E05LCMBN5" size="2" maxlength="2" value="<%=msg046005.getE05LCMBN5()%>" readonly>
                        C&oacute;digo Postal
                        <input type="text" name="E05LCMBN6" size="11" maxlength="10" value="<%=msg046005.getE05LCMBN6()%>" readonly>
                        Pa&iacute;s
                        <input type="text" name="E05LCMBN7" size="4" maxlength="4" value="<%=msg046005.getE05LCMBN7()%>" readonly></td>
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
          <select name="E05LCTACF" disabled>
            <option value=" "> </option>
            <option value="C"
					<%if (msg046005.getE05LCTACF().equals("C")) out.print("selected");%>>Cliente</option>
            <option value="A"
					<%if (msg046005.getE05LCTACF().equals("A")) out.print("selected");%>>Cuenta</option>
          </select></td>
        <td><input type="text" name="E05LCTBAC" size="12" maxlength="12"
				value='<%=(!msg046005.getE05LCTBAC().trim().equals("0") ? msg046005.getE05LCTBAC() : "")%>' readonly>
          </td>
      </tr>
      <tr>
        <td><div align="right">Nombre: </div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN1" size="45" maxlength="35" value="<%=msg046005.getE05LCTBN1()%>" readonly>
            </div></td>
      </tr>
      <tr id="trdark">
        <td><div align="right">Dirección: </div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN2" size="45" maxlength="35" value="<%=msg046005.getE05LCTBN2()%>" readonly>
          </div></td>
      </tr>
      <tr id="trclear">
        <td><div align="right"></div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN3" size="45" maxlength="35" value="<%=msg046005.getE05LCTBN3()%>" readonly>
          </div></td>
      </tr>
      <tr id="trdark">
        <td><div align="right"></div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN4" size="45" maxlength="35" value="<%=msg046005.getE05LCTBN4()%>" readonly>
          </div></td>
      </tr>
      <tr id="trclear">
        <td><div align="right">Estado: </div></td>
        <td align="left"><table>
            <tbody>
              <tr>
                <td><input type="text" name="E05LCTBN5" size="2" maxlength="2" value="<%=msg046005.getE05LCTBN5()%>" readonly>
                  C&oacute;digo Postal
                  <input type="text" name="E05LCTBN6" size="11" maxlength="10" value="<%=msg046005.getE05LCTBN6()%>" readonly>
                  Pa&iacute;s
                  <input type="text" name="E05LCTBN7" size="4" maxlength="4" value="<%=msg046005.getE05LCTBN7()%>" readonly>
                </td>
              </tr>
            </tbody>
          </table></td>
      	</tr>
    </tbody>
  </table></td></tr></table>

<h4>Mensaje Swift</h4>
	<table class="tableinfo">
		<TR id="trdark">
			<TD width="14%" align="right" nowrap>Generar Swift: </TD>
  			<TD nowrap width="16%">
  				<INPUT type="radio" name="E05LCTSWF" value="Y" <% if(!msg046005.getE05LCTSWF().equals("N")) out.print("checked");%> disabled="disabled">Si
				<INPUT type="radio" name="E05LCTSWF" value="N" <% if( msg046005.getE05LCTSWF().equals("N")) out.print("checked");%> disabled="disabled">No 
    		</TD>
  			<TD align="right" width="14%" nowrap>Tipo Mensaje: </TD>
  			<TD align="left" width="16%" nowrap>
  				<SELECT name="E05MSGTYP" disabled>
          			<OPTION value="720" <% if(msg046005.getE05MSGTYP().equals("720")) out.print("selected");%>>MT720</OPTION>
  					<OPTION value="700" <% if(msg046005.getE05MSGTYP().equals("700")) out.print("selected");%>>MT700</OPTION>
  				</SELECT>
  			</TD>
			<TD width="14%" align="right" nowrap>Banco Receptor: </TD>
    		<TD align="left" width="16%" nowrap><INPUT type="text" name="E05RCVRID" size="14" maxlength="12" value="<%=msg046005.getE05RCVRID()%>" disabled>
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
