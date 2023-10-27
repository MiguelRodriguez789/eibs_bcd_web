<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Cesiones de Cartas de Crédito</title>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<meta http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>

<jsp:useBean id="msgLC" class="datapro.eibs.beans.ELC051005Message"	scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript">
	builtNewMenu(lc_assignment);
	initMenu();
   
	function getAccountOfClient()
	{
		if (document.forms[0].E05LCTACF.selectedIndex == '1')
		{	
			return GetAccByClient('E05LCTCAC',document.forms[0].E05LCTCBK.value,'RT','',document.forms[0].E05LCTBAC.value);
		}		
		else
		{	
			return GetAccByClient('E05LCTCAC',document.forms[0].E05LCTCBK.value,'RT','','');
		}
	}
   	
</script>
<% 
	boolean isReadonly = userPO.getPurpose().equals("INQUIRY");
	String ctrlDisabled = isReadonly ? "disabled" : "";
	String ctrlReadonly = isReadonly ? "readonly" : "";
%>
<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
</head>
<body>
<h3 align="center">Cesiones de Cartas de Crédito 
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="lc_assignment.jsp, ELC0510"></h3>
<hr size="4">
<form method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510">
  <input TYPE=HIDDEN NAME="SCREEN" VALUE="112">
  <INPUT NAME="E01DOMFLG" TYPE=HIDDEN VALUE="<%=(request.getParameter("E01DOMFLG")==null?"":request.getParameter("E01DOMFLG"))%>">
  <table class="tableinfo">
    <tbody>
      <tr>
        <td nowrap><table cellspacing="0" cellpadding="2" width="100%" border="0">
            <tbody>
              <tr id="trdark">
                <td nowrap width="16%"><div align="right"><b>Banco :</b></div></td>
                <td nowrap width="20%"><input type="text" name="E05LCMBNK" readonly size="4" maxlength="2" value="<%=msgLC.getE05LCMBNK().trim()%>">
                </td>
                <td nowrap width="16%"><div align="right"><b>Número de Carta de Crédito :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <%if (msgLC.getE05LCMACC().trim().equals("999999999999")) {%>
                    <input type="text" size="12" maxlength="12" value="Nuevo" readonly>
                    <input type="hidden" name="E05LCMACC" value="<%=msgLC.getE05LCMACC().trim()%>" readonly>
                    <%} else {%>
                    <input type="text" name="E05LCMACC" size="12" maxlength="12" value="<%=msgLC.getE05LCMACC().trim()%>" readonly>
                    <%}%>
                    </b></div></td>
              </tr>
              <tr id="trdark">
                <td nowrap width="16%"><div align="right"><b>Nuestra Referencia :</b></div></td>
                <td nowrap width="20%"><div align="left">
                    <input type="text" name="E05LCMORF" size="20" maxlength="16" value="<%=msgLC.getE05LCMORF().trim()%>" readonly>
                  </div></td>
                <td nowrap width="16%"><div align="right"><b>Producto :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMPRO" size="4" maxlength="4" value="<%=msgLC.getE05LCMPRO().trim()%>" readonly>
                    </b></div></td>
              </tr>
              <tr id="trdark">
                <td nowrap width="16%"><div align="right"><b>Referencia del Otro Banco :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05LCMTRF" size="20" maxlength="16" value="<%=msgLC.getE05LCMTRF().trim()%>" readonly>
                    </b></div></td>
                <td nowrap width="16%"><div align="right"><b>Descripcion de Producto :</b></div></td>
                <td nowrap width="16%"><div align="left"><b>
                    <input type="text" name="E05DSCPRO" size="40" maxlength="35" value="<%=msgLC.getE05DSCPRO()%>"
							readonly>
                    </b></div></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table>
  <h4>Datos de la Cesión </h4>
  <table class="tableinfo">
    <tr id="trdark">
        <td align="right">Número : </td>
        <td align="left"><input type="text" name="E05LCTANUM" size="2"maxlength="2" readonly value="<%=msgLC.getE05LCTNUM()%>" <%=ctrlReadonly %>></td>
        <td align="right">Monto Asignado :</td>
		<td align="left"><input type="text" name="E05LCTAMT" size="20"maxlength="15" value="<%=msgLC.getE05LCTAMT()%>" <%=ctrlReadonly %>>
			<% if (!isReadonly) {%>
        	<img src="<%=request.getContextPath()%>/images/Check.gif" alt="campo obligatorio" border="0">
        	<% } %>
        </td>
        <TD align="right">I.V.A.: </TD>
        <TD align="left" nowrap><INPUT type="radio" name="E05LCTIVA" value="Y" <%=ctrlReadonly %> <% if(msgLC.getE05LCTIVA().equals("Y")) out.print("checked");%>>
				    Si
				    			<INPUT type="radio" name="E05LCTIVA" value="N" <%=ctrlReadonly %> <% if(msgLC.getE05LCTIVA().equals("N")) out.print("checked");%>>
				    No </TD>
    </tr>
  </table>
  <h4>Datos del Crédito</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td align="right">Fecha de Emisión :</td>
            <td align="left">
            	<eibsinput:date name="msgLC" fn_month="E05LCMIDM" fn_day="E05LCMIDD" fn_year="E05LCMIDY" readonly="<%= isReadonly %>"/>
              </td>
            
            <td align="right">Fecha de Expiración :</td>
            <td align="left">
				<eibsinput:date name="msgLC" fn_month="E05LCMEXM" fn_day="E05LCMEXD" fn_year="E05LCMEXY" readonly="<%= isReadonly %>"/>
			</td>
          </tr>
          <tr>
            <td align="right">Monto Original :</td>
            <td align="left"><input type="text" name="E05LCMCCN2" size="20"	maxlength="15" value="<%=msgLC.getE05LCMOAM().trim()%>" readonly="readonly"></td>
            <td align="right">Monto Disponible</td>
            <td><input type="text" name="E05LCMMEB" size="20" maxlength="15"	value="<%=msgLC.getE05LCMMEB().trim()%>" readonly="readonly"></td>
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
              <td align="right">Número de Cliente o de Cuenta :
                <select name="E05LCMACF" disabled="disabled">
                  <option value=" " <%if (!(msgLC.getE05LCMACF().equals("C") || msgLC.getE05LCMACF().equals("A")))
	out.print("selected");%> selected></option>
                  <option value="C" <%if (msgLC.getE05LCMACF().equals("C"))
	out.print("selected");%>>Cliente</option>
                  <option value="A" <%if (msgLC.getE05LCMACF().equals("A"))
	out.print("selected");%>>Cuenta</option>
                </select>
              </td>
              <td><input type="text" name="E05LCMBAC" size="12" maxlength="12"
				value='<%=(!msgLC.getE05LCMBAC().trim().equals("0") ? msgLC.getE05LCMBAC() : "")%>'
				readonly></td>
            </tr>
            <tr>
              <td><div align="right">Nombre :</div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN1" size="45" maxlength="35" value="<%=msgLC.getE05LCMBN1()%>" readonly>
                </div></td>
            </tr>
            <tr id="trdark">
              <td><div align="right">Direcci&oacute;n :</div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN2" size="45" maxlength="35" value="<%=msgLC.getE05LCMBN2()%>" readonly>
                </div></td>
            </tr>
            <tr id="trclear">
              <td><div align="right"></div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN3" size="45" maxlength="35" value="<%=msgLC.getE05LCMBN3()%>" readonly>
                </div></td>
            </tr>
            <tr id="trdark">
              <td><div align="right"></div></td>
              <td><div align="left">
                  <input type="text" name="E05LCMBN4" size="45" maxlength="35" value="<%=msgLC.getE05LCMBN4()%>" readonly>
                </div></td>
            </tr>
            <tr id="trclear">
              <td><div align="right">Estado</div></td>
              <td align="left"><table>
                  <tbody>
                    <tr>
                      <td><input type="text" name="E05LCMBN5" size="2" maxlength="2" value="<%=msgLC.getE05LCMBN5()%>" readonly>
                        C&oacute;digo Postal
                        <input type="text" name="E05LCMBN6" size="11" maxlength="10" value="<%=msgLC.getE05LCMBN6()%>" readonly>
                        Pa&iacute;s
                        <input type="text" name="E05LCMBN7" size="4" maxlength="4" value="<%=msgLC.getE05LCMBN7()%>" readonly></td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    
    
  </table>
  <h4>Nuevo Beneficiario/Asignado</h4>
  <table class="tableinfo">
    <tr>
      <td><table cellspacing="0" cellpadding="2" width="100%" border="0">
    <tbody>
      <tr id="trdark">
        <td align="right" >Numero de Cliente o de Cuenta :
          <select name="E05LCTACF" <%=ctrlDisabled %>>
            <option value=" "> </option>
            <option value="C"
					<%if (msgLC.getE05LCTACF().equals("C")) out.print("selected");%>>Cliente</option>
            <option value="A"
					<%if (msgLC.getE05LCTACF().equals("A")) out.print("selected");%>>Cuenta</option>
          </select></td>
        <td><input type="text" name="E05LCTBAC" size="12" maxlength="12"
				value='<%=(!msgLC.getE05LCTBAC().trim().equals("0") ? msgLC.getE05LCTBAC() : "")%>' <%=ctrlReadonly %>>
				<% if (!isReadonly) { %>
          <a
				href="javascript: GetCustomerDetails('E05LCTBAC','E05LCTBN1','','','E05LCTBN7','E05LCTBN2','E05LCTBN3','E05LCTBN4','','E05LCTBN5','','','E05LCTBN6','','','','','')"><img
				src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
				onclick="javascript: document.forms[0].E05LCTACF.selectedIndex = 1"
				border="0"></a>
				<% } %>
				Cliente o 
				
				<% if (!isReadonly) { %>
				<a
				href="javascript: GetAccByClient('E05LCTBAC','','RT','','E05LCTBN1')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
				onclick="javascript: document.forms[0].E05LCTACF.selectedIndex = 2"
				border="0"></a> 
				<% } %>
				Cuenta</td>
      </tr>
      <tr>
        <td><div align="right">Nombre :</div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN1" size="45" maxlength="35" value="<%=msgLC.getE05LCTBN1()%>" <%=ctrlReadonly %>>
            <img src="<%=request.getContextPath()%>/images/Check.gif" alt="campo obligatorio" border="0"></div></td>
      </tr>
      <tr id="trdark">
        <td><div align="right">Direcci&oacute;n :</div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN2" size="45" maxlength="35" value="<%=msgLC.getE05LCTBN2()%>" <%=ctrlReadonly %>>
          </div></td>
      </tr>
      <tr id="trclear">
        <td><div align="right"></div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN3" size="45" maxlength="35" value="<%=msgLC.getE05LCTBN3()%>" <%=ctrlReadonly %>>
          </div></td>
      </tr>
      <tr id="trdark">
        <td><div align="right"></div></td>
        <td><div align="left">
            <input type="text" name="E05LCTBN4" size="45" maxlength="35" value="<%=msgLC.getE05LCTBN4()%>" <%=ctrlReadonly %>>
          </div></td>
      </tr>
      <tr id="trclear">
        <td><div align="right">Estado</div></td>
        <td align="left"><table>
            <tbody>
              <tr>
                <td><input type="text" name="E05LCTBN5" size="2" maxlength="2" value="<%=msgLC.getE05LCTBN5()%>" <%=ctrlReadonly %>>
                <% if (!isReadonly) { %>
	                <a href="javascript:GetCodeCNOFC('E05LCTBN5','27')"><img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0"></a>
	                <% } %> 
                  C&oacute;digo Postal
                  <input type="text" name="E05LCTBN6" size="11" maxlength="10" value="<%=msgLC.getE05LCTBN6()%>" <%=ctrlReadonly %>>
                  Pa&iacute;s
                  <input type="text" name="E05LCTBN7" size="4" maxlength="4" value="<%=msgLC.getE05LCTBN7()%>" <%=ctrlReadonly %>>
                  <% if (! isReadonly) { %>
                  <a href="javascript:GetCodeCNOFC('E05LCTBN7','03')"> <img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0"></a>
                  <% } %>
                  </td>
              </tr>
            </tbody>
          </table></td>
      	</tr>
    </tbody>
  </table></td></tr></table>
<P><B>Cuenta de Repago (CR)</B></P>
<TABLE CLASS="tableinfo" CELLSPACING="0" CELLPADDING="2" WIDTH="100%" BORDER="0">	
		<TR ID="trdark">
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Banco</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Oficina</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">Mda</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">Cuenta Contable</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">Cuenta de Cliente</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Centro de Costo</TD>
		</TR>
	<TR id="trclear">
		<TD width="51" height="24" align="center" valign="top" nowrap>
			<INPUT type="text" name="E05LCTCBK" size="4" maxlength="2" value="<%=(!msgLC.getE05LCTCBK().trim().equals("0") ? msgLC.getE05LCTCBK() : "")%>" <%=ctrlReadonly %>></TD>
		<TD width="61" height="24" align="center" valign="top" nowrap>
	 		<INPUT class="context-menu-help" type="text" name="E05LCTCBR" size="6" maxlength="3" value="<%= msgLC.getE05LCTCBR()%>" <%=ctrlReadonly %>  
	 			<% if (!isReadonly) { %>
	 				onmousedown="init(branchHelp,this.name,document.forms[0].E05LCTCBK.value,'','','','')" onKeyPress="enterInteger(event)">
                <% } %>
	 	</TD>
		<TD width="47" height="24" align="center" valign="top" nowrap>
	  		<INPUT class="context-menu-help" type="text" name="E05LCTCCY" size="6" maxlength="3" value="<%= msgLC.getE05LCTCCY()%>"  <%=ctrlReadonly %>
	 			<% if (!isReadonly) { %>
	  				onmousedown="init(currencyHelp,this.name,document.forms[0].E05LCTCBK.value,'','','','')">
	 			<% } %>
	  	</TD>
		<TD width="128" height="24" align="center" valign="top" nowrap>
	  		<INPUT class="context-menu-help" type="text" name="E05LCTCGL" size="20" maxlength="16" value="<%= msgLC.getE05LCTCGL()%>" <%=ctrlReadonly %> 
	 			<% if (!isReadonly) { %>
	  				onKeyPress="enterInteger(event)"	onmousedown="init(ledgerHelp,this.name,document.forms[0].E05LCTCBK.value,document.forms[0].E05LCTCCY.value,'','','')" >
				<% } %>
		</TD>
		<TD width="132" height="24" align="center" valign="top" nowrap>
	  		<INPUT class="context-menu-help" type="text" name="E05LCTCAC" size="18" maxlength="13" value="<%= msgLC.getE05LCTCAC()%>" <%=ctrlReadonly %>
	 			<% if (!isReadonly) { %>
	  				onmousedown="init(accountHelp,this.name,document.forms[0].E05LCTCBK.value,'','','','RT')">
				<% } %>
	  	</TD>
		<TD width="114" height="24" align="center" valign="top" nowrap>
	  		<INPUT class="context-menu-help" type="text" name="E05LCTCCC" size="13" maxlength="9" value="<%= msgLC.getE05LCTCCC()%>"  <%=ctrlReadonly %>
	 			<% if (!isReadonly) { %>
	  				onmousedown="init(costcenterHelp,this.name,document.forms[0].E05LCTCBK.value,'','','','')">
				<% } %>
	  	</TD>
    </TR>
	
</TABLE>

<P><B>Cuenta de Debito</B></P>
<TABLE CLASS="tableinfo" CELLSPACING="0" CELLPADDING="2" WIDTH="100%" BORDER="0">	
		<TR ID="trdark">
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Banco</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Oficina</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">Mda</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">Cuenta Contable</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">Cuenta de Cliente</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Centro de Costo</TD>
		</TR>
	<TR id="trclear">
		<TD width="51" height="24" align="center" valign="top" nowrap>
			<INPUT type="text" name="E05LCTDBK" size="4" maxlength="2" value="<%=(!msgLC.getE05LCTDBK().trim().equals("0") ? msgLC.getE05LCTDBK() : "")%>" <%=ctrlReadonly %>></TD>
		<TD width="61" height="24" align="center" valign="top" nowrap>
	 		<INPUT class="context-menu-help" type="text" name="E05LCTDBR" size="6" maxlength="3" value="<%= msgLC.getE05LCTDBR()%>" <%=ctrlReadonly %>  
	 			<% if (!isReadonly) { %>
	 				onmousedown="init(branchHelp,this.name,document.forms[0].E05LCTDBK.value,'','','','')" onKeyPress="enterInteger(event)">
                <% } %>
	 	</TD>
		<TD width="47" height="24" align="center" valign="top" nowrap>
	  		<INPUT class="context-menu-help" type="text" name="E05LCTDCY" size="6" maxlength="3" value="<%= msgLC.getE05LCTDCY()%>"  <%=ctrlReadonly %>
	 			<% if (!isReadonly) { %>
	  				onmousedown="init(currencyHelp,this.name,document.forms[0].E05LCTDBK.value,'','','','')">
	 			<% } %>
	  	</TD>
		<TD width="128" height="24" align="center" valign="top" nowrap>
	  		<INPUT class="context-menu-help" type="text" name="E05LCTDGL" size="20" maxlength="16" value="<%= msgLC.getE05LCTDGL()%>" <%=ctrlReadonly %> 
	 			<% if (!isReadonly) { %>
	  				onKeyPress="enterInteger(event)"	onmousedown="init(ledgerHelp,this.name,document.forms[0].E05LCTDBK.value,document.forms[0].E05LCTDCY.value,'','','')" >
				<% } %>
		</TD>
		<TD width="132" height="24" align="center" valign="top" nowrap>
	  		<INPUT class="context-menu-help" type="text" name="E05LCTDAC" size="18" maxlength="13" value="<%= msgLC.getE05LCTDAC()%>" <%=ctrlReadonly %>
	 			<% if (!isReadonly) { %>
	  				onmousedown="init(accountHelp,this.name,document.forms[0].E05LCTDBK.value,'','','','RT')">
				<% } %>
	  	</TD>
		<TD width="114" height="24" align="center" valign="top" nowrap>
	  		<INPUT class="context-menu-help" type="text" name="E05LCTDCC" size="13" maxlength="9" value="<%= msgLC.getE05LCTDCC()%>"  <%=ctrlReadonly %>
	 			<% if (!isReadonly) { %>
	  				onmousedown="init(costcenterHelp,this.name,document.forms[0].E05LCTDBK.value,'','','','')">
				<% } %>
	  	</TD>
    </TR>
	
</TABLE>

  <br>




  
   <% if (!isReadonly) { %>
  <div align="center">
    <input type="hidden" name="H02FLGWK1" value="">
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
  </div>
  <% } %>

</form>
</body>
</html>
