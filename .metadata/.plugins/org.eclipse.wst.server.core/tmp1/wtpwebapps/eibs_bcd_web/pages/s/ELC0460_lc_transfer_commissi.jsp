<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Letters of Credit Opening/Maintenance</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msg046005" class="datapro.eibs.beans.ELC046005Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   <%} else {%>
	builtNewMenu(lc_transfer_hist);
	  <%}%>
   	builtHPopUp();

function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
}
   
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
    out.println("<SCRIPT> initMenu();  </SCRIPT>");
%>

</HEAD>

<BODY>
<H3 align="center">Historial de Comisiones de Transferencias de Cartas de Credito
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_transfer_commissi.jsp, ELC0460"></H3>
<HR size="4">


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510" >
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="109">
  
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
                <td nowrap width="16%"><div align="right"><b>Descripcion de Producto :</b></div></td>
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
<BR>

<h4>Informacion</h4>
<table class="tableinfo">
	<tbody>
		<tr>
			<td>
			<table border="0" cellspacing="0" width="100%">
					<tr id="trdark">
						<td align="right"></td>
						<td nowrap align="center" width="17%"><b>Monto</b></td>
						<td nowrap align="center" width="15%"><b>Por Cta de</b></td>
						<td nowrap align="center" width="26%"></td>
						<td nowrap align="center" width="12%"></td>
					</tr>
					<tr id="trclear">
						<td align="right">Comision por Transferencia</td>
						<td nowrap width="17%" align="center">
							<input readonly type="text" name="E05LCTC01" size="15" maxlength="15" value="<%=msg046005.getE05LCTC01()%>">
						</td>
						<td nowrap width="15%">
							<select disabled name="E05LCTP01"  >
								<option value="A">Primer Beneficiario</option>
								<option value="B" <%if(msg046005.getE05LCTP01().equals("B")) out.print("selected");%>>Segundo Beneficiario</option>
								<option value="W" <%if(msg046005.getE05LCTP01().equals("W")) out.print("selected");%>>Condonar</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr><tr id="trdark">
						<td align="right">Comision por Swift</td>
						<td nowrap width="17%" align="center">
							<input readonly type="text" name="E05LCTC03" size="15" maxlength="15" value="<%=msg046005.getE05LCTC03()%>">
						</td>
						<td nowrap width="15%">
							<select disabled name="E05LCTP03">
								<option value="A">Primer Beneficiario</option>
								<option value="B" <%if(msg046005.getE05LCTP03().equals("B")) out.print("selected");%>>Segundo Beneficiario</option>
								<option value="W" <%if(msg046005.getE05LCTP03().equals("W")) out.print("selected");%>>Condonar</option>
							</select></td>
						<td nowrap width="26%"></td>
						<td nowrap width="12%"></td>
					</tr>
			</table>
			</td>
		</tr>
	</tbody>
</table>

</FORM>
</BODY>
</HTML>
