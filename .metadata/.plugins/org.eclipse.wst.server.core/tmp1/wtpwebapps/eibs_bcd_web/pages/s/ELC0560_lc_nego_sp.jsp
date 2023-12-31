<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %>

<HTML>
<HEAD>
<TITLE>Negociaciones de Cartas de Creditos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META NAME="GENERATOR" CONTENT="IBM WebSphere Page Designer V4.0 for Windows">
<META HTTP-EQUIV="Content-Style-Type" CONTENT="text/css">
<LINK HREF="<%=request.getContextPath()%>/pages/style.css" REL="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC056001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>



<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
 
 userPO.setPrevPage("ELC0560_lc_nego_sp.jsp");
 userPO.setNextPage("ELC0560_lc_nego_conf.jsp");
 msg01.setH01OPECOD("0005");
%>

</HEAD>

<BODY>

<H3 align="center">Pago/Negociaci�n de Cartas de Cr�dito
<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" title="ELC0560_lc_nego_sp.jsp" name="EIBS_GIF" align="left"></H3>
<HR size="4">

<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0560" >

    <INPUT TYPE="HIDDEN" name="SCREEN" value="3">

	<TABLE class="tableinfo">
      <TR bgcolor="#ffffff">
        <TD nowrap height="79" width="97%"><TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
            <TR ID="trdark">
              <TD ALIGN="right" VALIGN="top" HEIGHT="29"><B>Tipo de Negociaci&oacute;n: </B></TD>
              <TD NOWRAP VALIGN="top" HEIGHT="29" width="250"><INPUT TYPE="text" NAME="E01OPCODE" SIZE="4" MAXLENGTH="1" VALUE="<%= msg01.getE01OPCODE()%>" READONLY>
                  <INPUT TYPE="text" NAME="E01OPCDSC" SIZE="31" MAXLENGTH="30" VALUE="<%= msg01.getE01OPCDSC()%>" READONLY></TD>
              <TD NOWRAP ALIGN="right" VALIGN="top" HEIGHT="29" width="135"><B>Producto: </B></TD>
              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="29"><INPUT type="text" name="E01LCMPRO" size="8" maxlength="8"
					value="<%= msg01.getE01LCMPRO()%>" readonly></TD>
            </TR>
            <TR ID="trclear">
              <TD ALIGN="right" VALIGN="top" HEIGHT="24" WIDTH="128"><B>Carta de Cr&eacute;dito: </B></TD>
              <TD NOWRAP VALIGN="top" HEIGHT="24" width="250"><INPUT TYPE="text" NAME="E01LCRNUM" SIZE="23" MAXLENGTH="12"
							VALUE="<%= msg01.getE01LCRNUM()%>" READONLY></TD>
              <TD NOWRAP ALIGN="right" VALIGN="top" HEIGHT="24" width="135"><B>Moneda: </B></TD>
              <TD NOWRAP ALIGN="left" VALIGN="top" HEIGHT="24"><INPUT TYPE="text" NAME="E01LCMCCY" SIZE="8" MAXLENGTH="3"
							VALUE="<%= msg01.getE01LCMCCY()%>" READONLY>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<B>Monto: </B>
                <INPUT type="text" name="E01DRWAMN"
					size="18" maxlength="15" value="<%= msg01.getE01DRWAMN()%>" readonly></TD>
            </TR>
            <TR id="trdark">
              <TD align="right" valign="top" height="24"><B>Cliente: </B></TD>
              <TD nowrap align="left"  valign="top" height="24" width="250">
              <INPUT type="text" name="E01LCMCUN" size="12" maxlength="9" value="<%= msg01.getE01LCMCUN()%>" readonly></TD>
              <TD nowrap align="right" valign="top" height="24" width="135"><B>Nombre: </B></TD>
              <TD nowrap align="left"  valign="top" height="24">
              <INPUT type="text" name="E01CUSNA1" size="46" maxlength="45" value="<%= msg01.getE01CUSNA1()%>" readonly></TD>
            </TR>
            <TR id="trclear">
              <TD nowrap align="right" valign="top" height="24"><B>Mensaje Swift: </B></TD>
              <TD nowrap align="left" valign="top" height="24" width="250">
              <INPUT type="hidden" name="E01SWFMTP" size="3" maxlength="3" value="<%= msg01.getE01SWFMTP()%>" readonly>
              <SELECT name="msgtyp" disabled>
			  	<OPTION value="" selected></OPTION>
			  	<OPTION value="732" <%=msg01.getE01SWFMTP().equals("732")?"selected":"" %>>MT732</OPTION>
			  	<OPTION value="742" <%=msg01.getE01SWFMTP().equals("742")?"selected":"" %>>MT742</OPTION>
			   	<OPTION value="752" <%=msg01.getE01SWFMTP().equals("752")?"selected":"" %>>MT752</OPTION>
			   	<OPTION value="754" <%=msg01.getE01SWFMTP().equals("754")?"selected":"" %>>MT754</OPTION>
			   	<OPTION value="756" <%=msg01.getE01SWFMTP().equals("756")?"selected":"" %>>MT756</OPTION>
		      </SELECT>
              </TD>
              <TD align="right" valign="top" height="24" width="135"><B>Banco Receptor: </B></TD>
              <TD colspan=3 nowrap valign="top" height="24" align="left" width="372">
              <INPUT type="text" name="E01SWFRCV" size="14" maxlength="12" value="<%= msg01.getE01SWFRCV()%>" readonly></TD>
            </TR>
        </TABLE></TD>	
      </TR>
      
    </TABLE>
	<%if (msg01.getE01OPCODE().equals("1")){%>
	<P><B>Cuenta D�bito Principal</B></P>
<TABLE CLASS="tableinfo" CELLSPACING="0" CELLPADDING="2" WIDTH="100%" BORDER="0">
	
		<TR ID="trdark">
			<TD ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="230">Concepto</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="51">Banco</TD>
			<TD NOWRAP VALIGN="top" HEIGHT="24" ALIGN="center" WIDTH="61">Agencia</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="47">Mda</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="128">Cuenta Contable</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="132">Cuenta</TD>
			<TD NOWRAP ALIGN="center" VALIGN="top" HEIGHT="24" WIDTH="114">Centro de Costo</TD>
		</TR>
	<TR id="trclear">
		<TD width="230" height="24" align="left" valign="top" nowrap>
			<INPUT type="text" name="E01CONCDR" size="4" maxlength="2" value="<%= msg01.getE01CONCDR()%>">
	  		<INPUT type="text" name="E01CONCDD" size="25" maxlength="25" value="<%=msg01.getE01CONCDD()%>"
				class="context-menu-help" onmousedown="init(conceptHelp,'E01CONCDD','','','E01CUSGLN','E01CONCDR','40'); return false;"></TD>
		<TD width="51" height="24" align="center" valign="top" nowrap>
			<INPUT type="text" name="E01CUSBNK" size="4" maxlength="2" value="<%= msg01.getE01CUSBNK()%>"></TD>
		<TD width="61" height="24" align="center" valign="top" nowrap>
	 		<INPUT type="text" name="E01CUSBRN" size="6" maxlength="3" value="<%= msg01.getE01CUSBRN()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01CUSBNK.value,'','','','')" onKeyPress="enterInteger(event)"></TD>
		<TD width="47" height="24" align="center" valign="top" nowrap>
	  		<INPUT type="text" name="E01CUSCCY" size="6" maxlength="3" value="<%= msg01.getE01CUSCCY()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01CUSBNK.value,'','','','')"></TD>
		<TD width="128" height="24" align="center" valign="top" nowrap>
	  <INPUT type="text" name="E01CUSGLN" size="20" maxlength="16" value="<%= msg01.getE01CUSGLN()%>" onKeyPress="enterInteger(event)"
			class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CUSBNK.value,document.forms[0].E01CUSCCY.value,'','','')"></TD>
		<TD width="132" height="24" align="center" valign="top" nowrap>
	  <INPUT type="text" name="E01CUSACC" size="18" maxlength="12" value="<%= msg01.getE01CUSACC()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01CUSBNK.value,'','','','RT')"></TD>
		<TD width="114" height="24" align="center" valign="top" nowrap>
	  <INPUT type="text" name="E01CUSCCN" size="13" maxlength="8" value="<%= msg01.getE01CUSCCN()%>"class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].E01CUSBNK.value,'','','','')"></TD>
    </TR>
	
</TABLE>

<%}%>
<P><B>Cuenta D&eacute;bito Comisiones e Impuestos </B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
         <TR id="trdark">
           <TD align="center" valign="top" height="24" width="230">Concepto</TD>
           <TD nowrap valign="top" height="24" align="center" width="51">Banco</TD>
           <TD nowrap valign="top" height="24" align="center" width="61">Agencia</TD>
           <TD nowrap align="center" valign="top" height="24" width="47">Mda</TD>
           <TD nowrap align="center" valign="top" height="24" width="128">Cuenta Contable</TD>
           <TD nowrap align="center" valign="top" height="24" width="132">Cuenta</TD>
           <TD nowrap align="center" valign="top" height="24" width="114">Centro de Costo</TD>
		</TR>
         <TR id="trclear">
           <TD width="230" height="24" align="left" valign="top" nowrap>
			<INPUT type="text" name="E01CONDCO" value="<%=msg01.getE01CONDCO()%>" size="4" maxlength="2">
             <INPUT type="text" name="E01CONDCB" size="25" maxlength="25" value="<%=msg01.getE01CONDCB()%>"
				class="context-menu-help" onmousedown="init(conceptHelp,'E01CONDCB','','','E01DEBGL2','E01CONDCO','40'); return false;"></TD>
           <TD nowrap valign="top" height="24" align="center" width="51">
			<INPUT type="text" name="E01DEBBK2" size="4" maxlength="2" value="<%=msg01.getE01DEBBK2()%>"></TD>
           <TD nowrap valign="top" height="24" align="center" width="61">
			<INPUT type="text" name="E01DEBBR2" size="6" maxlength="3" value="<%=msg01.getE01DEBBR2()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01DEBBK2.value,'','','','')" onKeyPress="enterInteger(event)"></TD>
           <TD nowrap align="center" valign="top" height="24" width="47">
			<INPUT type="text" name="E01DEBCY2" size="6" maxlength="3" value="<%=msg01.getE01DEBCY2()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01DEBBK2.value,'','','','')"></TD>
           <TD nowrap align="center" valign="top" height="24" width="128">
			<INPUT type="text" name="E01DEBGL2" size="20" maxlength="16" value="<%=msg01.getE01DEBGL2()%>" onKeyPress="enterInteger(event)"
			class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01DEBBK2.value,document.forms[0].E01DEBCY2.value,'','','')"></TD>
           <TD nowrap align="center" valign="top" height="24" width="132">
			<INPUT type="text" name="E01DEBAC2" size="18" maxlength="12" value="<%=msg01.getE01DEBAC2()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01DEBBK2.value,'','','','RT')"></TD>
           <TD nowrap align="center" valign="top" height="24" width="114">
			<INPUT type="text" name="E01DEBCC2" size="13" maxlength="8" value="<%=msg01.getE01DEBCC2()%>"class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].E01DEBBK2.value,'','','','')"></TD>
		</TR>
</TABLE>



<%if (msg01.getE01OPCODE().equals("1")){%>
<P><B>Cuenta Cr�dito</B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">

		<TR id="trdark">
			<TD align="center" valign="top" height="24" width="230">Concepto</TD>
			<TD nowrap valign="top" height="24" align="center" width="51">Banco</TD>
			<TD nowrap valign="top" height="24" align="center" width="61">Agencia</TD>
			<TD nowrap align="center" valign="top" height="24" width="47">Mda</TD>
			<TD nowrap align="center" valign="top" height="24" width="128">Cuenta Contable</TD>
			<TD nowrap align="center" valign="top" height="24" width="132">Cuenta</TD>
			<TD nowrap align="center" valign="top" height="24" width="114">Centro de Costo</TD>
		</TR>
		<TR id="trclear">
			<TD width="230" height="24" align="left" valign="top" nowrap>
				<INPUT type="text" name="E01CONCCR" size="4" maxlength="2" value="<%= msg01.getE01CONCCR()%>">
		  		<INPUT type="text" name="E01CONCCD" size="25" maxlength="25" value="<%= msg01.getE01CONCCD()%>" 
				class="context-menu-help" onmousedown="init(conceptHelp,'E01CONCCD','','','E01PMTGLN','E01CONCCR','40'); return false;"></TD>
			<TD nowrap valign="top" height="24" align="center" width="51">
				<INPUT type="text" name="E01PMTBNK" size="4" maxlength="2" value="<%= msg01.getE01PMTBNK()%>"></TD>
			<TD nowrap valign="top" height="24" align="center" width="61">
				<INPUT type="text" name="E01PMTBRN" size="6" maxlength="3" value="<%= msg01.getE01PMTBRN()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01PMTBNK.value,'','','','')" onKeyPress="enterInteger(event)"></TD>
			<TD nowrap align="center" valign="top" height="24" width="47">
				<INPUT type="text" name="E01PMTCCY" size="6" maxlength="3" value="<%= msg01.getE01PMTCCY()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01PMTBNK.value,'','','','')"></TD>
			<TD nowrap align="center" valign="top" height="24" width="128">
				<INPUT type="text" name="E01PMTGLN" size="20" maxlength="16" value="<%= msg01.getE01PMTGLN()%>" onKeyPress="enterInteger(event)"
			class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01PMTBNK.value,document.forms[0].E01PMTCCY.value,'','','')"></TD>
			<TD nowrap align="center" valign="top" height="24" width="132">
				<INPUT type="text" name="E01PMTACC" size="18" maxlength="12" value="<%= msg01.getE01PMTACC()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01PMTBNK.value,'','','','RT')"></TD>
			<TD nowrap align="center" valign="top" height="24" width="114">
				<INPUT type="text" name="E01PMTCCN" size="13" maxlength="8" value="<%= msg01.getE01PMTCCN()%>"class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].E01PMTBNK.value,'','','','')"></TD>
		</TR>
  </TABLE>


<%}%>
<%if (msg01.getH01FLGWK3().equals("Y") && 
		(msg01.getE01OPCODE().equals("1") || msg01.getE01OPCODE().equals("6"))){ %>
<P><B> Cuenta Cr�dito Banco Corresponsal </B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
    <TD align="center" valign="top" height="24" width="230">Concepto</TD>
    <TD nowrap valign="top" height="24" align="center" width="51">Banco</TD>
    <TD nowrap valign="top" height="24" align="center" width="61">Agencia</TD>
    <TD nowrap align="center" valign="top" height="24" width="47">Mda</TD>
    <TD nowrap align="center" valign="top" height="24" width="128">Cuenta Contable</TD>
    <TD nowrap align="center" valign="top" height="24" width="132">Cuenta</TD>
    <TD nowrap align="center" valign="top" height="24" width="114">Centro de Costo</TD>
	</TR>
  <TR id="trclear">
    <TD width="230" height="24" align="left" valign="top" nowrap>
		<INPUT type="text" name="E01CONCBC" size="4" maxlength="2" value="<%=msg01.getE01CONCBC()%>">
		<INPUT type="text" name="E01CONCBD" size="25" maxlength="25"  value="<%=msg01.getE01CONCBD()%>"
				class="context-menu-help" onmousedown="init(conceptHelp,'E01CONCBD','','','E01CRPGLN','E01CONCBC','40'); return false;"></TD>
    <TD nowrap valign="top" height="24" align="center" width="51">
		<INPUT type="text" name="E01CRPBNK" size="4" maxlength="2" value="<%=msg01.getE01CRPBNK()%>"></TD>
    <TD nowrap valign="top" height="24" align="center" width="61">
		<INPUT type="text" name="E01CRPBRN" size="6" maxlength="3" value="<%=msg01.getE01CRPBRN()%>" class="context-menu-help" onmousedown="init(branchHelp,this.name,document.forms[0].E01CRPBNK.value,'','','','')" onKeyPress="enterInteger(event)"></TD>
    <TD nowrap align="center" valign="top" height="24" width="47">
		<INPUT type="text" name="E01CRPCCY" size="6" maxlength="3" value="<%=msg01.getE01CRPCCY()%>" class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01CRPBNK.value,'','','','')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="128">
		<INPUT type="text" name="E01CRPGLN" size="20" maxlength="16" value="<%=msg01.getE01CRPGLN()%>" onKeyPress="enterInteger(event)"
			class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01CRPBNK.value,document.forms[0].E01CRPCCY.value,'','','')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="132">
		<INPUT type="text" name="E01CRPACC" size="18" maxlength="12" value="<%=msg01.getE01CRPACC()%>" class="context-menu-help" onmousedown="init(accountHelp,this.name,document.forms[0].E01CRPBNK.value,'','','','RT')"></TD>
    <TD nowrap align="center" valign="top" height="24" width="114">
			<INPUT type="text" name="E01CRPCCN" size="13" maxlength="8" value="<%=msg01.getE01CRPCCN()%>"class="context-menu-help" onmousedown="init(costcenterHelp,this.name,document.forms[0].E01CRPBNK.value,'','','','')"></TD>
	</TR>
</TABLE>
<%}%>
<P></P>


<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<TR id="trdark">
		<TD align="right">Forma / V�a de Pago: </TD>
		<TD nowrap align="left"><SELECT
			name="E01PMTVIA">
			<OPTION value="">&nbsp;</OPTION>
				<!--	<OPTION value="1" <%if (msg01.getE01PMTVIA().equals("1")) { out.print("selected"); }%>>Cheque Oficial</OPTION>-->
			<OPTION value="2" <%if (msg01.getE01PMTVIA().equals("2")) { out.print("selected"); }%>>Dep�sito Cta. Cte.</OPTION>
			<OPTION value="3" <%if (msg01.getE01PMTVIA().equals("3")) { out.print("selected"); }%>>Cuenta Contable</OPTION>
			<OPTION value="5" <%if (msg01.getE01PMTVIA().equals("5")) { out.print("selected"); }%>>Swift</OPTION>
			</SELECT></TD>
		<TD nowrap align="right">Formato Swift: </TD>
		<TD nowrap align="left">
		<SELECT name="E01SWFFMT">
			<OPTION value="">&nbsp;</OPTION>
			<OPTION value="103" <%if (msg01.getE01SWFFMT().equals("103")) { out.print("selected"); }%>>MT103</OPTION>
			<OPTION value="202" <%if (msg01.getE01SWFFMT().equals("202")) { out.print("selected"); }%>>MT202</OPTION>
		</SELECT></TD>
	</TR>
	<TR id="trclear">
		<TD align="right">Debitar Comisiones a Cta. del Beneficiario: </TD>
		<TD nowrap align="left">
			<INPUT type="radio" name="E01DEBFLG" value="Y" <%if (msg01.getE01DEBFLG().equals("Y")) out.print("checked"); %>> Si 
			<INPUT type="radio" name="E01DEBFLG" value="N" <%if (msg01.getE01DEBFLG().equals("N")) out.print("checked"); %>> No				</TD>
		<TD nowrap align="right">BIC Banco Beneficiario: </TD>
		<TD nowrap align="left">
			<INPUT type="text" name="E01CRPBID" size="16" maxlength="12" value=<%=msg01.getE01CRPBID() %> >
      		<A href="javascript:GetSwiftIdDesc('E01CRPBID','','','')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"  border="0"></A> 
		</TD>
	</TR>
	<TR id="trdark">
	  <TD nowrap align="right">Cancelar Saldo Remanente: </TD>
	  <TD nowrap align="left"><INPUT type="radio" name="E01CANBAL" value="Y" <%if (msg01.getE01CANBAL().equals("Y")) out.print("checked"); %>>
	    Si
	    <INPUT type="radio" name="E01CANBAL" value="N" <%if (msg01.getE01CANBAL().equals("N")) out.print("checked"); %>>
	    No </TD>
		<TD nowrap align="right">Garant�a en Efectivo: </TD>
		<TD nowrap align="left"><INPUT type="text" name="E01CSHAMN" size="18" maxlength="15"></TD>
	</TR>
	 
	<TR id="trclear">
	  	<TD align="right" nowrap>Autorizaci�n / Acci�n: </TD>
		<TD align="left" nowrap>
		  	<SELECT name="E01LCCFL2">
		  		<OPTION value="" <%= msg01.getE01LCCFL2().equals("")?"selected":"" %>></OPTION>
               	<OPTION value="A" <%= msg01.getE01LCCFL2().equals("A")?"selected":"" %>>Aceptar</OPTION>
               	<OPTION value="D" <%= msg01.getE01LCCFL2().equals("D")?"selected":"" %>>Debitar Nuestra Cuenta</OPTION>
               	<OPTION value="N" <%= msg01.getE01LCCFL2().equals("N")?"selected":"" %>>Negociar</OPTION>
               	<OPTION value="R" <%= msg01.getE01LCCFL2().equals("R")?"selected":"" %>>Solicitar Reembolso</OPTION>
               	<OPTION value="P" <%= msg01.getE01LCCFL2().equals("P")?"selected":"" %>>Remitir Fondos</OPTION>
               	<OPTION value="S" <%= msg01.getE01LCCFL2().equals("S")?"selected":"" %>>Instrucciones Especiales</OPTION>
           	</SELECT>
    	</TD>
	    <TD align="right" nowrap>Impuesto Sustitutivo: </TD>
	    <TD align="left" nowrap><INPUT type="radio" name="E01ITEGLG" value="Y" <%if (msg01.getE01ITEFLG().equals("Y")) out.print("checked"); %>>
	    Si
	    <INPUT type="radio" name="E01ITEFLG" value="N" <%if (msg01.getE01ITEFLG().equals("N")) out.print("checked"); %>>
	    No </TD>
	</TR>	 
	 
	<TR id="trdark">
	    <% if(msg01.getH01FLGWK3().equals("Y")){ %>
		<TD align="right">Monto Debitado por Corresponsal: </TD>
		<% } else { %> 
		<TD align="right">Cargos del Banco Corresponsal: </TD>
		<% } %>
		<TD nowrap align="left"><INPUT type="text" name="E01DEBCRP" size="18" maxlength="17" value="<%=msg01.getE01DEBCRP()%>"></TD>
		<TD nowrap align="right">Cargos Bco. Corresponsal x Cta. de: </TD>
		<TD nowrap align="left">
			<SELECT	name="E01CRPPBY">
				<OPTION value="">&nbsp;</OPTION>
				<OPTION value="A" <%if (msg01.getE01CRPPBY().equals("A")) { out.print("selected"); }%>>Aplicante</OPTION>
				<OPTION value="B" <%if (msg01.getE01CRPPBY().equals("B")) { out.print("selected"); }%>>Beneficiario</OPTION>
			</SELECT>
		</TD>
	</TR>
	
	<TR id="trdark">
		<TD colspan="4" align="CENTER">
			<TABLE width="100%">
				<TR id="trdark" >
					<TD width="10%" nowrap align="CENTER">Monto FOB : </TD>
					<TD width="15%"><INPUT type="text" name="E01LCCFOB" size="18" maxlength="17" value="<%=msg01.getE01LCCFOB()%>"></TD>
					<TD width="10%" nowrap align="CENTER">Monto Seguro : </TD>
					<TD width="15%"><INPUT type="text" name="E01LCCCOF" size="18" maxlength="17" value="<%=msg01.getE01LCCCOF()%>"></TD>
					<TD width="10%" nowrap align="CENTER">Monto Flete : </TD>
					<TD width="15%"><INPUT type="text" name="E01LCCCOI" size="18" maxlength="17" value="<%=msg01.getE01LCCCOI()%>"></TD>
				</TR>
			</TABLE>
		</TD>	
	</TR>
  </TABLE>

<%--
<P><B>Tipos de Cambio</B></P>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
			<TD>Moneda</TD>
			<TD>T/C Compra</TD>
			<TD>T/C Venta</TD>
			<TD>Moneda</TD>
			<TD>T/C Compra</TD>
			<TD>T/C Venta</TD>
	</TR>
		<TR>
    <TD><INPUT type="text" name="E01FXCCY1" value="<%=msg01.getE01FXCCY1()%>" size="9" maxlength="3"></TD>
    <TD><INPUT type="text" name="E01FXRPU1" value="<%=msg01.getE01FXRPU1()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01FXRSA1" value="<%=msg01.getE01FXRSA1()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01FXCCY2" value="<%=msg01.getE01FXCCY2()%>" size="9" maxlength="3"></TD>
    <TD><INPUT type="text" name="E01FXRPU2" value="<%=msg01.getE01FXRPU2()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01FXRSA2" value="<%=msg01.getE01FXRSA2()%>" size="20" maxlength="11"></TD>
		</TR>
		<TR>
    <TD><INPUT type="text" name="E01FXCCY3" value="<%=msg01.getE01FXCCY3()%>" size="9" maxlength="3"></TD>
    <TD><INPUT type="text" name="E01FXRPU3" value="<%=msg01.getE01FXRPU3()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01FXRSA3" value="<%=msg01.getE01FXRSA3()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01FXCCY4" value="<%=msg01.getE01FXCCY4()%>" size="9" maxlength="3"></TD>
    <TD><INPUT type="text" name="E01FXRPU4" value="<%=msg01.getE01FXRPU4()%>" size="20" maxlength="11"></TD>
    <TD><INPUT type="text" name="E01FXRSA4" value="<%=msg01.getE01FXRSA4()%>" size="20" maxlength="11"></TD>
		</TR>
  </TABLE>
--%>

<%	int i = 0;	%>

<P><B>Comisiones y Gastos :</B> Cobrar IVA : <input type="hidden" name="E01IVAFLG" value="<%= msg01.getE01IVAFLG()%>">
              <input type="radio" name="CE01IVAFLG" value="Y" onClick="document.forms[0].E01IVAFLG.value='Y'"
			  <%if(msg01.getE01IVAFLG().equals("Y")) out.print("checked");%>>
              S&iacute; 
              <input type="radio" name="CE01IVAFLG" value="N" onClick="document.forms[0].E01IVAFLG.value='N'"
			  <%if(msg01.getE01IVAFLG().equals("N")) out.print("checked");%>>
              No </P>
              
<% if(msg01.getH01FLGWK3().equals("Y")){ %>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TBODY>
    <TR id="trdark">
	    <TD>&nbsp;</TD>
        <TD colspan="2" align="center"><B>Nuestros</B></TD>
        <TD colspan="2" align="center"><B>Banco Corresponsal</B></TD>
	</TR>
    <TR id="trdark">
    <TD nowrap align="left"><b>Comisi&oacute;n</b></TD>
    <TD nowrap align="center"><b>Monto</b></TD>
    <TD nowrap align="center"><b>Por</b></TD>
    <TD nowrap align="center"><b>Monto</b></TD>
    <TD nowrap align="center"><b>Por</b></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Emisi&oacute;n</TD>
	    <TD align="center"><INPUT name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01ISSPBY">
			<OPTION value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT name="E01CRPISS" type="text" id="E01CRPISS" value="<%=msg01.getE01CRPISS()%>"></TD><TD align="center"><SELECT name="E01ISSCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ISSCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ISSCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ISSCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Aviso</TD>
	    <TD align="center"><INPUT name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01ADVPBY">
			<OPTION value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPADV" value="<%=msg01.getE01CRPADV()%>"></TD><TD align="center"><SELECT name="E01ADVCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ADVCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ADVCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ADVCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Confirmaci&oacute;n</TD>
	    <TD align="center"><INPUT type="text" name="E01CNFCOM" value="<%=msg01.getE01CNFCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01CNFPBY">
			<OPTION value="A" <%if(msg01.getE01CNFPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01CNFPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01CNFPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPCNF" value="<%=msg01.getE01CRPCNF()%>"></TD><TD align="center"><SELECT name="E01CNFCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01CNFCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01CNFCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01CNFCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Enmienda</TD>
	    <TD align="center"><INPUT type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01AMDPBY">
			<OPTION value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPAMD" value="<%=msg01.getE01CRPAMD()%>"></TD><TD align="center"><SELECT name="E01AMDCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01AMDCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01AMDCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01AMDCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Aviso de Enmienda</TD>
	    <TD align="center"><INPUT type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>"></TD>
	    <TD align="center"><SELECT name="E01AAMPBY">
			<OPTION value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPAAM" value="<%=msg01.getE01CRPAAM()%>"></TD><TD align="center"><SELECT name="E01AAMCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01AAMCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01AAMCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01AAMCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Discrepancia</TD>
	    <TD align="center"><INPUT type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01DISPBY">
			<OPTION value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPDIS" value="<%=msg01.getE01CRPDIS()%>"></TD><TD align="center"><SELECT name="E01DISCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01DISCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01DISCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01DISCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Extensi�n de Validez</TD>
	    <TD align="center"><INPUT type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01EOVPBY">
			<OPTION value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPEOV" value="<%=msg01.getE01CRPEOV()%>"></TD><TD align="center"><SELECT name="E01EOVCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01EOVCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01EOVCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01EOVCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Portes</TD>
	    <TD align="center"><INPUT type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>"></TD>
	    <TD align="center"><SELECT name="E01POSPBY">
			<OPTION value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPPOS" value="<%=msg01.getE01CRPPOS()%>"></TD><TD align="center"><SELECT name="E01POSCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01POSCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01POSCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01POSCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Courier</TD>
	    <TD align="center"><INPUT type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>"></TD>
	    <TD align="center"><SELECT name="E01COUPBY">
			<OPTION value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPCOU" value="<%=msg01.getE01CRPCOU()%>"></TD><TD align="center"><SELECT name="E01COUCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01COUCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01COUCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01COUCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Swift de Apertura</TD>
	    <TD align="center"><INPUT type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01SWFPBY">
			<OPTION value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPSWF" value="<%=msg01.getE01CRPSWF()%>"></TD><TD align="center"><SELECT name="E01SWFCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01SWFCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01SWFCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01SWFCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Swift Adicional(es)</TD>
	    <TD align="center"><INPUT type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01TLXPBY">
			<OPTION value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPTLX" value="<%=msg01.getE01CRPTLX()%>"></TD><TD align="center"><SELECT name="E01TLXCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01TLXCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01TLXCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01TLXCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Cancelaci�n</TD>
	    <TD align="center"><INPUT type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01CANPBY">
			<OPTION value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPCAN" value="<%=msg01.getE01CRPCAN()%>"></TD><TD align="center"><SELECT name="E01CANCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01CANCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01CANCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01CANCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Pago</TD>
	    <TD align="center"><INPUT type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01PMCPBY">
			<OPTION value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPPAY" value="<%=msg01.getE01CRPPAY()%>"></TD><TD align="center"><SELECT name="E01PMCCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01PMCCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01PMCCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01PMCCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Transferencia de Fondos</TD>
	    <TD align="center"><INPUT type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01WTRPBY">
			<OPTION value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPWTR" value="<%=msg01.getE01CRPWTR()%>"></TD><TD align="center"><SELECT name="E01WTRCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01WTRCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01WTRCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01WTRCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Reembolso</TD>
	    <TD align="center"><INPUT type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01RMBPBY">
			<OPTION value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPRMB" value="<%=msg01.getE01CRPRMB()%>"></TD><TD align="center"><SELECT name="E01RMBCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01RMBCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01RMBCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01RMBCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<%	if (userPO.getHeader1().equals("02")){%>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
		<TD align="left">Comision Por Plazo</TD>
	    <TD align="center"><INPUT type="text" name="E01TRMCOM" value="<%=msg01.getE01TRMCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01TRMPBY">
			<OPTION value="A" <%if(msg01.getE01TRMPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01TRMPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01TRMPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center">&nbsp;</TD>
	    <TD align="center">&nbsp;</TD>
	</TR>
	<%}%>
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">	<% if(msg01.getE01LCCFL1().equals("Y"))  out.print("Convenio ALADI");
	    					else out.print("Timbres");%>
	    </TD>
	    <TD align="center"><INPUT type="text" name="E01ALDCOM" value="<%=msg01.getE01ALDCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01ALDPBY">
			<OPTION value="A" <%if(msg01.getE01ALDPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01ALDPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01ALDPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center"><INPUT type="text" name="E01CRPALD" value="<%=msg01.getE01CRPALD()%>"></TD>
		    <TD align="center"><SELECT name="E01ALDCPB">
	    	<% if (msg01.getE01CRPPBY().equals("A")) { %>
			<OPTION value="A" <%if(msg01.getE01ALDCPB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<% } %>
	    	<% if (msg01.getE01CRPPBY().equals("B")) { %>
			<OPTION value="B" <%if(msg01.getE01ALDCPB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<% } %>
			<OPTION value="W" <%if(msg01.getE01ALDCPB().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Comisi�n de Agente</TD>
	    <TD align="center"><INPUT type="text" name="E01BRKCOM" value="<%=msg01.getE01BRKCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01BRKPBY">
			<OPTION value="A" <%if(msg01.getE01BRKPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01BRKPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01BRKPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center">&nbsp;</TD><TD align="center">&nbsp;</TD>
	</TR>
    <%	if (userPO.getHeader1().equals("18")){%>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Intereses</TD>
	    <TD align="center"><INPUT type="text" name="E01INTCHG" value="<%=msg01.getE01INTCHG()%>"></TD>
	    <TD align="center"><SELECT name="E01INTPBY">
			<OPTION value="A" <%if(msg01.getE01INTPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01INTPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01INTPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center">&nbsp;</TD><TD align="center">&nbsp;</TD>
	</TR>
   <%}%>
  </TBODY>
</TABLE>
<% } else { %>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TBODY>
  
    <TR id="trdark">
        <TD nowrap align="left"><b>Comisi&oacute;n</b></TD>
        <TD nowrap align="center"><b>Monto</b></TD>
        <TD nowrap align="center"><b>Por</b></TD>
    </TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Emisi&oacute;n</TD>
	    <TD align="center"><INPUT name="E01ISSFEE" type="text" id="E01ISSFEE" value="<%=msg01.getE01ISSFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01ISSPBY">
			<OPTION value="A" <%if(msg01.getE01ISSPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01ISSPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01ISSPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Aviso</TD>
	    <TD align="center"><INPUT name="E01ADVCOM" type="text" value="<%=msg01.getE01ADVCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01ADVPBY">
			<OPTION value="A" <%if(msg01.getE01ADVPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01ADVPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01ADVPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Confirmaci&oacute;n</TD>
	    <TD align="center"><INPUT type="text" name="E01CNFCOM" value="<%=msg01.getE01CNFCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01CNFPBY">
			<OPTION value="A" <%if(msg01.getE01CNFPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01CNFPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01CNFPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Enmienda</TD>
	    <TD align="center"><INPUT type="text" name="E01AMDFEE" value="<%=msg01.getE01AMDFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01AMDPBY">
			<OPTION value="A" <%if(msg01.getE01AMDPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01AMDPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01AMDPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	      <TD align="left">Aviso de Enmienda</TD>
	      <TD align="center"><INPUT type="text" name="E01ADVAMF" value="<%=msg01.getE01ADVAMF()%>"></TD>
	      <TD align="center"><SELECT name="E01AAMPBY">
			<OPTION value="A" <%if(msg01.getE01AAMPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01AAMPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01AAMPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	      <TD align="left">Discrepancia</TD>
	      <TD align="center"><INPUT type="text" name="E01DISCOM" value="<%=msg01.getE01DISCOM()%>"></TD>
	      <TD align="center"><SELECT name="E01DISPBY">
			<OPTION value="A" <%if(msg01.getE01DISPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01DISPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01DISPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>	
    </TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Extensi�n de Validez</TD>
	    <TD align="center"><INPUT type="text" name="E01EOVCOM" value="<%=msg01.getE01EOVCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01EOVPBY">
			<OPTION value="A" <%if(msg01.getE01EOVPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01EOVPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01EOVPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Portes</TD>
	    <TD align="center"><INPUT type="text" name="E01POSTAM" value="<%=msg01.getE01POSTAM()%>"></TD>
	    <TD align="center"><SELECT name="E01POSPBY">
			<OPTION value="A" <%if(msg01.getE01POSPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01POSPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01POSPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Courier</TD>
	    <TD align="center"><INPUT type="text" name="E01COURAM" value="<%=msg01.getE01COURAM()%>"></TD>
	    <TD align="center"><SELECT name="E01COUPBY">
			<OPTION value="A" <%if(msg01.getE01COUPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01COUPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01COUPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Swift de Apertura</TD>
	    <TD align="center"><INPUT type="text" name="E01SWFFEE" value="<%=msg01.getE01SWFFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01SWFPBY">
			<OPTION value="A" <%if(msg01.getE01SWFPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01SWFPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01SWFPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	      <TD align="left">Swift Adicional(es)</TD>
	      <TD align="center"><INPUT type="text" name="E01TLXFEE" value="<%=msg01.getE01TLXFEE()%>"></TD>
	      <TD align="center"><SELECT name="E01TLXPBY">
			<OPTION value="A" <%if(msg01.getE01TLXPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01TLXPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01TLXPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Cancelaci�n</TD>
	    <TD align="center"><INPUT type="text" name="E01CANFEE" value="<%=msg01.getE01CANFEE()%>"></TD>
	    <TD align="center"><SELECT name="E01CANPBY">
			<OPTION value="A" <%if(msg01.getE01CANPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01CANPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01CANPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	      <TD align="left">Pago</TD>
	      <TD align="center"><INPUT type="text" name="E01PAYCOM" value="<%=msg01.getE01PAYCOM()%>"></TD>
	      <TD align="center"><SELECT name="E01PMCPBY">
			<OPTION value="A" <%if(msg01.getE01PMCPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01PMCPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01PMCPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	      <TD align="left">Transferencia de Fondos</TD>
	      <TD align="center"><INPUT type="text" name="E01WTRCOM" value="<%=msg01.getE01WTRCOM()%>"></TD>
	      <TD align="center"><SELECT name="E01WTRPBY">
			<OPTION value="A" <%if(msg01.getE01WTRPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01WTRPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01WTRPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Reembolso</TD>
	    <TD align="center"><INPUT type="text" name="E01RMBCOM" value="<%=msg01.getE01RMBCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01RMBPBY">
			<OPTION value="A" <%if(msg01.getE01RMBPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01RMBPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01RMBPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <%	if (userPO.getHeader1().equals("02")){%>	   
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Comision Por Plazo</TD>
	    <TD align="center"><INPUT type="text" name="E01TRMCOM" value="<%=msg01.getE01TRMCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01TRMPBY">
			<OPTION value="A" <%if(msg01.getE01TRMPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01TRMPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01TRMPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
		    <TD align="center">&nbsp;</TD>
	    <TD align="center">&nbsp;</TD>
	</TR>
    <%}%>	
    <TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">	<% if(msg01.getE01LCCFL1().equals("Y"))  out.print("Convenio ALADI");
	    					else out.print("Timbres");%>
	    </TD>
	    <TD align="center"><INPUT type="text" name="E01ALDCOM" value="<%=msg01.getE01ALDCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01ALDPBY">
			<OPTION value="A" <%if(msg01.getE01ALDPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01ALDPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01ALDPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Comisi�n de Agente</TD>
	    <TD align="center"><INPUT type="text" name="E01BRKCOM" value="<%=msg01.getE01BRKCOM()%>"></TD>
	    <TD align="center"><SELECT name="E01BRKPBY">
			<OPTION value="A" <%if(msg01.getE01BRKPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01BRKPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01BRKPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <%	if (userPO.getHeader1().equals("18")){%>
	<TR id='<%= (i++ %2 == 0 ? "trclear" : "trdark") %>'>
	    <TD align="left">Intereses</TD>
	    <TD align="center"><INPUT type="text" name="E01INTCHG" value="<%=msg01.getE01INTCHG()%>"></TD>
	    <TD align="center"><SELECT name="E01INTPBY">
			<OPTION value="A" <%if(msg01.getE01INTPBY().equals("A")) out.print("selected");%>>Aplicante</OPTION>
			<OPTION value="B" <%if(msg01.getE01INTPBY().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
			<OPTION value="W" <%if(msg01.getE01INTPBY().equals("W")) out.print("selected");%>>No Cobrar</OPTION>
			</SELECT></TD>
	</TR>
    <%}%>
  </TBODY>
</TABLE>
<% } %>
<BR>

<h4>Informaci�n Banco a Banco</h4>
  <table class="tableinfo">
    <tr bordercolor="#FFFFFF">
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap align="center">
                <INPUT type="text" name="E01BKTBK1" maxlength="35" size="45" value="<%= msg01.getE01BKTBK1().trim()%>">
            </td>  
          </tr>
          <tr id="trclear">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK2" maxlength="35" size="45" value="<%= msg01.getE01BKTBK2().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK3" maxlength="35" size="45" value="<%= msg01.getE01BKTBK3().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK4" maxlength="35" size="45" value="<%= msg01.getE01BKTBK4().trim()%>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK5" maxlength="35" size="45" value="<%= msg01.getE01BKTBK5().trim()%>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap align="center">
            	<INPUT type="text" name="E01BKTBK6" maxlength="35" size="45" value="<%= msg01.getE01BKTBK6().trim()%>">
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>

<DIV align="center">
	<H4 style="text-align:center">
		<INPUT type="checkbox" name="H01FLGWK2" value="Y" <% if(msg01.getH01FLGWK2().equals("A")){ out.print("checked");} %>>Aceptar con Advertencias
	</H4>
	   <INPUT id="EIBSBTN" type=submit name="Submit" value="Enviar">
</DIV>

</FORM>

</BODY>
</HTML>
