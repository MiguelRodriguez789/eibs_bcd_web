<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>

<HTML>
<HEAD>
<TITLE>Mantenimiento Carta de Credito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<jsp:useBean id="msgLC"  class="datapro.eibs.beans.ELC051001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript">

builtNewMenu(<%= (msgLC.getE01LCMOPT().trim().equals("N") ? "lc_opening" : "lc_maint")%>);

</SCRIPT>
<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}

if (!userPO.getPurpose().equals("NEW")) {
	out.println("<SCRIPT> initMenu();  </SCRIPT>");
}
%>
</HEAD>
<BODY>
<H3 align="center">Mantenimiento de Carta de Cr�dito de Exportaci�n<IMG
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="ELC0510_lc_opening_export.jsp"></H3>
<HR size="4">
<FORM method="post"
	action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0510">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="4">
  <INPUT TYPE=HIDDEN NAME="E01LCMATY" VALUE="<%=msgLC.getE01LCMATY().trim()%>">
  <INPUT type="hidden" NAME="E01LCMTYP" VALUE="<%=msgLC.getE01LCMTYP().trim()%>">
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
    <TR id="trdark">
      <TD nowrap width="16%" align="right"><B>Banco :</B> </TD>
      <TD nowrap width="20%" align="left"><INPUT type="text" name="E01LCMBNK" readonly
						size="4" maxlength="2" value="<%= msgLC.getE01LCMBNK().trim()%>"></TD>
      <TD nowrap width="16%" align="right"><B>N&uacute;mero de Carta de Cr�dito :</B> </TD>
      <TD nowrap width="16%" align="left"><B> <B>
        <INPUT type="text" name="E01LCMACC" size="13" maxlength="12"
						value="<%= msgLC.getE01LCMACC().trim()%>" readonly>
      </B></B></TD>
    </TR>
    <TR>
      <TD nowrap width="16%" align="right"><B>Nuestra Referencia :</B> </TD>
      <TD nowrap width="20%" align="left"><INPUT type="text" name="E01LCMORF" size="20"
						maxlength="16" value="<%= msgLC.getE01LCMORF().trim()%>">
      </TD>
      <TD nowrap width="16%" align="right"><B>Producto :</B> </TD>
      <TD nowrap width="16%" align="left"><B>
        <INPUT type="text" name="E01LCMPRO" size="4"
						maxlength="4" value="<%= msgLC.getE01LCMPRO().trim()%>" readonly>
      </B> </TD>
    </TR>
    <TR id="trdark">
      <TD nowrap width="16%" align="right"><B>Referencia del Otro Banco :</B> </TD>
      <TD nowrap width="16%" align="left"><B>
        <INPUT type="text" name="E01LCMTRF" size="20" maxlength="16" value="<%=msgLC.getE01LCMTRF().trim()%>">
      </B> </TD>
      <TD nowrap width="16%" align="right"><B>Descripci�n del Producto :</B> </TD>
      <TD nowrap width="16%" align="left"><B>
        <INPUT type="text" name="E01DSCPRO" size="60"
						maxlength="60" value="<%=msgLC.getE01DSCPRO().trim()%>" readonly>
      </B> </TD>
    </TR>
  </TABLE>
  <H4>Tipo de Operaci&oacute;n</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark">
                <TD nowrap width="16%" align="right"><B>Enmienda :</B> </TD>
                <TD nowrap width="20%" align="left"><% if (msgLC.getE01LCMAMF().equals("Y")) out.print("YES"); else out.print("NO");%>
                    <INPUT type="HIDDEN" name="E01LCMLAN" value="<%= msgLC.getE01LCMLAN().trim()%>">
                </TD>
                <TD nowrap width="16%" align="right"><B>Ultima Enmienda: </B> </TD>
                <TD nowrap width="16%" align="left"><B>
                  <INPUT type="text" name="E01LCMLAN" size="4"
							maxlength="4" value="<%= msgLC.getE01LCMLAN().trim()%>" readonly>
                  </B>
                    <INPUT type="HIDDEN" name="E01LCMLAN" value="<%= msgLC.getE01LCMLAN().trim()%>"></TD>
                <TD nowrap width="16%" align="right"><B>Fecha Ultima Enmienda: </B></TD>
                <TD nowrap width="16%" align="left"><B>
                	<eibsinput:date name="msgLC" fn_month="E01LCMLAM" fn_day="E01LCMLAD" fn_year="E01LCMLAY" readonly="true" />
				</B>
				</TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  <P>&nbsp;</P>
  <TABLE class="tableinfo" cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
      <TR id="trdark">
        <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Aplicante</B></FONT></TD>
      </TR>
      <TR id="">
        <TD width="35%" align="right">N�mero de Cliente o Cuenta: </TD>
        <TD nowrap><SELECT name="E01LCMAF2">
            <OPTION value=" "
								<%if (!(msgLC.getE01LCMAF2().equals("C") || msgLC.getE01LCMAF2().equals("A"))) out.print("selected");%>
								selected></OPTION>
            <OPTION value="C" <%if (msgLC.getE01LCMAF2().equals("C")) out.print("selected");%>>Cliente</OPTION>
            <OPTION value="A" <%if (msgLC.getE01LCMAF2().equals("A")) out.print("selected");%>>Cuenta</OPTION>
          </SELECT>
            <INPUT type="text" name="E01LCMAPA" size="12"
							maxlength="12" value="<%=msgLC.getE01LCMAPA()%>">            <A href="javascript: GetCustomerDetailsLC('E01LCMAPA','E01LCMAP1','E01LCMAP2','E01LCMAP3','E01LCMAP4','E01LCMAP5','E01LCMAP6','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onClick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 1"
			border="0"></A> Cliente o <A
							href="javascript: GetAccByClient('E01LCMAPA','','RT','','E01LCMAP1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
							onclick="javascript: document.forms[0].E01LCMAF2.selectedIndex = 2"  border="0"></A> Cuenta</TD>
      </TR>
      <TR id="">
        <TD align="right">Nombre: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMAP1" size="48"
					maxlength="45" value="<%=msgLC.getE01LCMAP1().trim()%>">
        <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">        </TD>
      </TR>
      <TR id="">
        <TD align="right">Direcci�n: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMAP2" size="48"
					maxlength="45" value="<%=msgLC.getE01LCMAP2().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMAP3" size="48"
					maxlength="45" value="<%=msgLC.getE01LCMAP3().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMAP4" size="48"
					maxlength="45" value="<%=msgLC.getE01LCMAP4().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD align="right">Estado: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMAP5" size="4" maxlength="4"
							value="<%=msgLC.getE01LCMAP5()%>">
              <A href="javascript:GetCodeCNOFC('E01LCMAP5','27')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></A>
          C�digo Postal
          <INPUT type="text"
							name="E01LCMAP6" size="16" maxlength="15"
							value="<%=msgLC.getE01LCMAP6().trim()%>">
          Pa�s
          <INPUT type="text"
							name="E01LCMAP7" size="4" maxlength="4"
							value="<%=msgLC.getE01LCMAP7()%>">
          <A href="javascript:GetCodeCNOFC('E01LCMAP7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></A> </TD>
      </TR>
  </TABLE>
    <BR>
    <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
      <TR id="trdark">
        <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Beneficiario</B></FONT></TD>
      </TR>
      <TR id="">
        <TD width="35%" align="right">N�mero de Cliente o Cuenta: </TD>
        <TD nowrap><SELECT name="E01LCMAF3">
            <OPTION value=" " <%if (!(msgLC.getE01LCMAF3().equals("C") || msgLC.getE01LCMAF3().equals("A"))) out.print("selected");%>></OPTION>
            <OPTION value="C" <%if (msgLC.getE01LCMAF3().equals("C")) out.print("selected");%>>Cliente</OPTION>
            <OPTION value="A" <%if (msgLC.getE01LCMAF3().equals("A")) out.print("selected");%>>Cuenta</OPTION>
          </SELECT>
            <INPUT type="text" name="E01LCMBAC" size="12" maxlength="12" value="<%=msgLC.getE01LCMBAC()%>">
            <A href="javascript: GetCustomerDetailsLC('E01LCMBAC','E01LCMBN1','E01LCMBN2','E01LCMBN3','E01LCMBN4','E01LCMBN5','E01LCMBN6','','')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onClick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 1"
			border="0"></A> Cliente o <A
							href="javascript: GetAccByClient('E01LCMBAC','','RT','','E01LCMBN1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ."
							onclick="javascript: document.forms[0].E01LCMAF3.selectedIndex = 2" border="0"></A> Cuenta</TD>
      </TR>
      <TR id="">
        <TD align="right"> Nombre: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMBN1" size="48"
					maxlength="45" value="<%=msgLC.getE01LCMBN1().trim()%>">
            <IMG	src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" border="0">
		</TD>
      </TR>
      <TR id="">
        <TD align="right">Direcci�n: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMBN2" size="48"
					maxlength="45" value="<%=msgLC.getE01LCMBN2().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMBN3" size="48"
					maxlength="45" value="<%=msgLC.getE01LCMBN3().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMBN4" size="48"
					maxlength="45" value="<%=msgLC.getE01LCMBN4().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD align="right">Estado: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMBN5" size="4" maxlength="4"
							value="<%=msgLC.getE01LCMBN5()%>">
              <A href="javascript:GetCodeCNOFC('E01LCMBN5','27')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></A>
          C�digo Postal
          <INPUT type="text"
							name="E01LCMBN6" size="16" maxlength="15"
							value="<%=msgLC.getE01LCMBN6().trim()%>">
          Pa�s
          <INPUT type="text"
							name="E01LCMBN7" size="4" maxlength="4"
							value="<%=msgLC.getE01LCMBN7()%>">
          <A href="javascript:GetCodeCNOFC('E01LCMBN7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></A> </TD>
      </TR>
        <TR id="">
    <TD align="right">Correo Electr�nico: </TD>
    <TD align="left">
  	  <INPUT type="text" name="E01LCMEMB" size="50" maxlength="40" value="<%=msgLC.getE01LCMEMB()%>">
	</TD>
  </TR>
    </TABLE>
    <BR>
    <TABLE border="0" cellpadding="2"  cellspacing="0" class="tableinfo" width="100%" align="center">
      <TR id="trdark">
        <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Banco Emisor </B></FONT></TD>
      </TR>
      <TR id="">
        <TD width="35%" align="right" nowrap="NOWRAP">N�mero de Cliente o Cuenta: </TD>
        <TD nowrap><SELECT name="E01LCMAF1">
            <OPTION value=" "></OPTION>
            <OPTION value="C" <%if (msgLC.getE01LCMAF1().equals("C")) out.print("selected");%>>Cliente</OPTION>
            <OPTION value="A" <%if (msgLC.getE01LCMAF1().equals("A")) out.print("selected");%>>Cuenta</OPTION>
          </SELECT>
            <INPUT type="text" name="E01LCMIBA" size="12" maxlength="12" value="<%=msgLC.getE01LCMIBA()%>">
            <A href="javascript: GetCustomerDetailsLC('E01LCMIBA','E01LCMIB1','E01LCMIB2','E01LCMIB3','E01LCMIB4','E01LCMIB5','E01LCMIB6','','C')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 1"
			border="0"></A> Cliente o <A href="javascript: GetAccByClient('E01LCMIBA','','RT','','E01LCMIB1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." onClick="javascript: document.forms[0].E01LCMAF1.selectedIndex = 2" border="0"></A> Cuenta</TD>
      </TR>
      <TR id="">
        <TD align="right">Codigo Swift: </TD>
        <TD align="left" nowrap><INPUT type="text" name="E01LCMIBI" size="26" maxlength="25" value="<%=msgLC.getE01LCMIBI().trim()%>">
          <A href="javascript:GetSwiftIdDesc('E01LCMIBI','E01LCMIB1','E01LCMIB2','E01LCMIB3')">
          <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A></TD>
      </TR>
      <TR id="">
        <TD align="right">Nombre: </TD>
        <TD align="left" nowrap><INPUT type="text" name="E01LCMIB1" size="48" maxlength="45" value="<%=msgLC.getE01LCMIB1().trim()%>">
          <A href="javascript:GetCorrespondentDescIdSwift('E01LCMIBI','','')"></A>
          <IMG	src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" border="0">
         </TD>
      </TR>
      <TR id="">
        <TD align="right">Direcci�n: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMIB2" size="48" maxlength="45" value="<%=msgLC.getE01LCMIB2().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMIB3" size="48" maxlength="45" value="<%=msgLC.getE01LCMIB3().trim()%>"></TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMIB4" size="48" maxlength="45" value="<%=msgLC.getE01LCMIB4().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD align="right" valign="bottom">Estado: </TD>
        <TD align="left" valign="bottom" nowrap><INPUT type="text" name="E01LCMIB5" size="4" maxlength="4" value="<%=msgLC.getE01LCMIB5()%>">
              <A href="javascript:GetCodeCNOFC('E01LCMIB5','27')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></A>
          C�digo Postal
          <INPUT type="text" name="E01LCMIB6" size="16" maxlength="15" value="<%=msgLC.getE01LCMIB6().trim()%>">
          Pa�s
          <INPUT type="text" name="E01LCMIB7" size="4" maxlength="4" value="<%=msgLC.getE01LCMIB7()%>">
          <A href="javascript:GetCodeCNOFC('E01LCMIB7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A> </TD>
      </TR>
    </TABLE>
    <BR>
    <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
      <TR id="trdark">
        <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Banco Avisador / Avisar a Traves de </B></FONT></TD>
      </TR>
      <TR id="">
        <TD width="35%" align="right" nowrap="nowrap">Cliente: </TD>
        <TD align="left" nowrap><INPUT type="text" name="E01LCMCBC" size="14" maxlength="12" value="<%=msgLC.getE01LCMCBC()%>">
          <A href="javascript: GetCustomerDetailsLC('E01LCMCBC','E01LCMCA1','E01LCMCA2','E01LCMCA3','E01LCMCA4','E01LCMCA5','E01LCMCA6','','C')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A></TD>
      </TR>
      <TR id="">
        <TD nowrap="nowrap" align="right">Codigo Swift: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMCAI" size="26" maxlength="25" value="<%=msgLC.getE01LCMCAI().trim()%>">
          <A href="javascript:GetSwiftIdDesc('E01LCMCAI','E01LCMCA1','E01LCMCA2','E01LCMCA3')">
          <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></A> </TD>
      </TR>
      <TR id="">
        <TD align="right"> Nombre: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMCA1" size="48" maxlength="45" value="<%=msgLC.getE01LCMCA1().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD align="right">Direcci�n: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMCA2" size="48" maxlength="45" value="<%=msgLC.getE01LCMCA2().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMCA3" size="48" maxlength="45" value="<%=msgLC.getE01LCMCA3()%>">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMCA4" size="48" maxlength="45" value="<%=msgLC.getE01LCMCA4().trim()%>">
        </TD>
      </TR>
      <TR id="">
        <TD align="right" valign="bottom">Estado: </TD>
        <TD align="left" nowrap><INPUT type="text" name="E01LCMCA5" size="4" maxlength="4" value="<%=msgLC.getE01LCMCA5()%>">
              <A href="javascript:GetCodeCNOFC('E01LCMCA5','27')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></A>
          C�digo Postal
          <INPUT type="text" name="E01LCMCA6" size="16" maxlength="15" value="<%=msgLC.getE01LCMCA6().trim()%>">
          Pa�s
          <INPUT type="text" name="E01LCMCA7" size="4" maxlength="4" value="<%=msgLC.getE01LCMCA7()%>">
          <A href="javascript:GetCodeCNOFC('E01LCMCA7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A></TD>
      </TR>
    </TABLE>
    
    <BR>
    <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
      <TR id="trdark">
        <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Banco Reembolsador</B></FONT></TD>
      </TR>
      <TR id="">
        <TD nowrap="nowrap" align="right">N�mero de Cliente o Cuenta: </TD>
        <TD  align="left" nowrap><INPUT type="text" name="E01LCMRBA" size="12" maxlength="12" value="<%=msgLC.getE01LCMRBA()%>">
            <A href="javascript: GetCustomerDetailsLC('E01LCMRBA','E01LCMRB1','E01LCMRB2','E01LCMRB3','E01LCMRB4','E01LCMRB5','E01LCMRB6','','5')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A> Cliente o <A href="javascript: GetAccByClient('E01LCMRBA','','RT','','E01LCMRB1')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A> Cuenta </TD>
      </TR>
      <TR id="">
        <TD nowrap="nowrap" align="right">Codigo Swift: </TD>
        <TD align="left" nowrap><INPUT type="text" name="E01LCMRBI" size="26" maxlength="25" value="<%=msgLC.getE01LCMRBI().trim()%>">
          <A href="javascript:GetCorrespondentDescIdSwift('E01LCMRBI','','')">
          <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></A></TD>
      </TR>
      <TR id="">
        <TD align="right" nowrap="nowrap">Nombre: </TD>
        <TD><INPUT type="text" name="E01LCMRB1" size="48" maxlength="45" value="<%=msgLC.getE01LCMRB1().trim()%>"></TD>
      </TR>
      <TR id="">
        <TD align="right">Direcci�n: </TD>
        <TD align="left"><INPUT type="text" name="E01LCMRB2" size="48" maxlength="45" value="<%=msgLC.getE01LCMRB2().trim()%>"></TD>
      </TR>
      <TR id="">
        <TD width="35%"></TD>
        <TD align="left"><INPUT type="text" name="E01LCMRB3" size="48" maxlength="45" value="<%=msgLC.getE01LCMRB3().trim()%>"></TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT type="text" name="E01LCMRB4" size="48" maxlength="45" value="<%=msgLC.getE01LCMRB4().trim()%>"></TD>
      </TR>
      <TR id="">
        <TD align="right" valign="bottom">Estado: </TD>
        <TD align="left" valign="bottom" nowrap><INPUT type="text" name="E01LCMRB5" size="4" maxlength="4" value="<%=msgLC.getE01LCMRB5()%>">
              <A href="javascript:GetCodeCNOFC('E01LCMRB5','27')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></A>
          C�digo Postal
          <INPUT type="text" name="E01LCMRB6" size="16" maxlength="15" value="<%=msgLC.getE01LCMRB6().trim()%>">
          Pa�s
          <INPUT type="text" name="E01LCMRB7" size="4" maxlength="4" value="<%=msgLC.getE01LCMRB7()%>">
          <A href="javascript:GetCodeCNOFC('E01LCMRB7','03')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A></TD>
      </TR>
    </TABLE>
    <DIV align="center">
  <INPUT id="EIBSBTN" type=submit name="Submit"
	value="Enviar"></DIV>
</FORM>
<!--<H5 align="left">
  <%
String s = msgLC.toString();
for(int i = 0; i < s.length(); i++)
{
	if(s.charAt(i) == ':')	out.print("<BR>");
	else if (s.charAt(i) == '<') out.print("{");
		else if (s.charAt(i) == '>') out.print("}");
	else 					out.print(s.charAt(i));

}%>
</H5>-->
</BODY>
</HTML>
