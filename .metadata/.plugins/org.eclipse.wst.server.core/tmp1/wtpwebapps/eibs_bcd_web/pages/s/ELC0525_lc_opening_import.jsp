<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Letters of Credit Opening/Maintenance</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css">

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msg050001"  class="datapro.eibs.beans.ELC050001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript">

	builtNewMenu(lc_apr_cc_new);
	initMenu();
   
 function goMsgSwift() {
   var dx = 450;
   var dy = 350;
   var y0 = (screen.height - dy) / 2;
   var x0 = (screen.width - dx) / 2;
   var attr = 'toolbar=no,location=no,directories=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,left=' + x0 + ',top=' + y0 + ',height=' + dy + ',width=' + dx;

   page = "<%=request.getContextPath()%>/servlet/datapro.eibs.approval.JSEPR1080A?SCREEN=8&TRANSREFNUM="+document.forms[0].E01LCMACC.value;
   listin = window.open(page,'',attr);
 }
</SCRIPT>

<%if (!error.getERRNUM().equals("0")) {
	error.setERRNUM("0");
	out.println("<SCRIPT Language=\"Javascript\">");
	out.println("       showErrors()");
	out.println("</SCRIPT>");
}
%>
</HEAD>
<BODY>
<H3 align="center">Apertura de Carta de Cr�dito de Importaci�n
<IMG
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="ELC0525_lc_opening_import.jsp"></H3>
<HR size="4">
<FORM>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
	<TR id="trdark">
		<TD width="20%" align="right" nowrap="nowrap"><B>Banco : </B></TD>
		<TD width="26%" nowrap="nowrap"><INPUT type="text" name="E01LCMBNK" readonly size="4" maxlength="2" value="<%=msg050001.getE01LCMBNK().trim()%>"></TD>
		<TD width="25%" align="right" nowrap="nowrap"><B>N�mero de Carta de Cr&eacute;dito : </B></TD>
		<TD width="29%" nowrap="nowrap">
		  <%if (msg050001.getE01LCMACC().trim().equals("999999999999"))
				{%>
          <INPUT type="text" size="12" maxlength="12" value="Nuevo" readonly>
          <INPUT name="E01LCMACC" type="hidden" value="<%=msg050001.getE01LCMACC().trim()%>" readonly="readonly">
          <%}
				else
				{%>
          <INPUT type="text" name="E01LCMACC" size="12" maxlength="12" value="<%=msg050001.getE01LCMACC().trim()%>" readonly>
          <%}%>
		</TD>
	</TR>
	<TR>
		<TD align="right" nowrap="nowrap"><B>Nuestra Referencia : </B></TD>
		<TD nowrap="nowrap"><INPUT name="E01LCMORF" type="text" value="<%=msg050001.getE01LCMORF().trim()%>" size="20" maxlength="16" readonly="readonly"></TD>
		<TD align="right" nowrap="nowrap"><B>Producto : </B></TD>
		<TD nowrap="nowrap"><INPUT type="text" name="E01LCMPRO" size="4" maxlength="4" value="<%=msg050001.getE01LCMPRO().trim()%>" readonly></TD>
	</TR>
	<TR id="trdark">
		<TD align="right" nowrap="nowrap"><B>Referencia del Otro Banco : </B></TD>
		<TD nowrap="nowrap">
		  <INPUT name="E01LCMTRF" type="text" value="<%=msg050001.getE01LCMTRF().trim()%>" size="20" maxlength="16" readonly="readonly">
		</TD>
		<TD align="right" nowrap="nowrap"><B>Descripci&oacute;n del Producto : </B></TD>
		<TD nowrap="nowrap">
		  <INPUT type="text" name="E01DSCPRO" size="40"
						maxlength="40" value="<%=msg050001.getE01DSCPRO().trim()%>" readonly>
		</TD>
	</TR>
</TABLE>
 
<BR>

<TABLE class="tableinfo" cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
          <TR id="trdark">
            <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Aplicante</B></FONT></TD>
          </TR>
          <TR id="">
            <TD width="35%" align="right">N�mero de Cliente o Cuenta: </TD>
            <TD nowrap><SELECT name="E01LCMAF2" disabled>
                <OPTION value=" "
								<%if (!(msg050001.getE01LCMAF2().equals("C") || msg050001.getE01LCMAF2().equals("A"))) out.print("selected");%>
								selected></OPTION>
                <OPTION value="C" <%if (msg050001.getE01LCMAF2().equals("C")) out.print("selected");%>>Cliente</OPTION>
                <OPTION value="A" <%if (msg050001.getE01LCMAF2().equals("A")) out.print("selected");%>>Cuenta</OPTION>
              </SELECT>
                <INPUT name="E01LCMAPA" type="text" value="<%=msg050001.getE01LCMAPA()%>" size="12"	maxlength="12" readonly="readonly"
				 <%if (msg050001.getE01LCMAF2().equals("A")) out.print("class=\"context-menu-inq\" onmousedown=\"init(inqAccount, this.value)\"");%>>
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
			 </TD>
          </TR>
          <TR id="">
            <TD align="right">Nombre: </TD>
            <TD align="left"><INPUT name="E01LCMAP1" type="text" value="<%=msg050001.getE01LCMAP1()%>" size="45"
					maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD align="right">Direcci�n: </TD>
            <TD align="left"><INPUT name="E01LCMAP2" type="text" value="<%=msg050001.getE01LCMAP2()%>" size="45"
					maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD></TD>
            <TD align="left"><INPUT name="E01LCMAP3" type="text" value="<%=msg050001.getE01LCMAP3()%>" size="45"
					maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD></TD>
            <TD align="left"><INPUT name="E01LCMAP4" type="text" value="<%=msg050001.getE01LCMAP4()%>" size="45"
					maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD align="right">Estado: </TD>
            <TD align="left"><INPUT name="E01LCMAP5" type="text"
							value="<%=msg050001.getE01LCMAP5()%>" size="4" maxlength="4" readonly="readonly">
              C�digo Postal
              <INPUT
							name="E01LCMAP6" type="text"
							value="<%=msg050001.getE01LCMAP6()%>" size="16" maxlength="15" readonly="readonly">
              Pa�s
              <INPUT
							name="E01LCMAP7" type="text"
							value="<%=msg050001.getE01LCMAP7()%>" size="4" maxlength="4" readonly="readonly">
               </TD>
          </TR>
  </TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
          <TR id="trdark">
            <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Beneficiario</B></FONT></TD>
          </TR>
          <TR id="">
            <TD width="35%" align="right">N�mero de Cliente o Cuenta: </TD>
            <TD nowrap><SELECT name="E01LCMAF3" disabled>
                <OPTION value=" " <%if (!(msg050001.getE01LCMAF3().equals("C") || msg050001.getE01LCMAF3().equals("A"))) out.print("selected");%>></OPTION>
                <OPTION value="C" <%if (msg050001.getE01LCMAF3().equals("C")) out.print("selected");%>>Cliente</OPTION>
                <OPTION value="A" <%if (msg050001.getE01LCMAF3().equals("A")) out.print("selected");%>>Cuenta</OPTION>
              </SELECT>
                <INPUT name="E01LCMBAC" type="text" value="<%=msg050001.getE01LCMBAC()%>" size="12" maxlength="12" readonly="readonly"  
				 <%if (msg050001.getE01LCMAF3().equals("A")) out.print("class=\"context-menu-inq\" onmousedown=\"init(inqAccount, this.value)\"");%>>
               </TD>
          </TR>
          <TR id="">
            <TD align="right"> Nombre: </TD>
            <TD align="left"><INPUT name="E01LCMBN1" type="text" value="<%=msg050001.getE01LCMBN1()%>" size="45"
					maxlength="35" readonly="readonly">
                <IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" border="0"></TD>
          </TR>
          <TR id="">
            <TD align="right">Direcci�n: </TD>
            <TD align="left"><INPUT name="E01LCMBN2" type="text" value="<%=msg050001.getE01LCMBN2()%>" size="45"
					maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD></TD>
            <TD align="left"><INPUT name="E01LCMBN3" type="text" value="<%=msg050001.getE01LCMBN3()%>" size="45"
					maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD></TD>
            <TD align="left"><INPUT name="E01LCMBN4" type="text" value="<%=msg050001.getE01LCMBN4()%>" size="45"
					maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD align="right">Estado: </TD>
            <TD align="left"><INPUT name="E01LCMBN5" type="text"
							value="<%=msg050001.getE01LCMBN5()%>" size="4" maxlength="4" readonly="readonly">
              C�digo Postal
              <INPUT
							name="E01LCMBN6" type="text"
							value="<%=msg050001.getE01LCMBN6()%>" size="16" maxlength="15" readonly="readonly">
              Pa�s
              <INPUT
							name="E01LCMBN7" type="text"
							value="<%=msg050001.getE01LCMBN7()%>" size="4" maxlength="4" readonly="readonly">
               </TD>
          </TR>
          <TR id="">
    <TD align="right">Correo Electr�nico: </TD>
    <TD align="left">
  	  <INPUT type="text" name="E01LCMEMB" size="50" maxlength="40" value="<%=msg050001.getE01LCMEMB()%>" readonly="readonly">
	</TD>
  </TR>
  </TABLE>
<BR>
<TABLE border="0" cellpadding="2"  cellspacing="0" class="tableinfo" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Banco  Corresponsal / Confirmador</B></FONT></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right" nowrap="NOWRAP">N�mero de Cliente o Cuenta: </TD>
    <TD nowrap><SELECT name="E01LCMAF4" disabled>
      <OPTION value=""></OPTION>
      <OPTION value="C" <%if (msg050001.getE01LCMAF4().equals("C")) out.print("selected");%>>Cliente</OPTION>
      <OPTION value="A" <%if (msg050001.getE01LCMAF4().equals("A")) out.print("selected");%>>Cuenta</OPTION>
    </SELECT>
        <INPUT name="E01LCMABA" type="text" value="<%=msg050001.getE01LCMABA()%>" size="12" maxlength="12" readonly="readonly" 
				 <%if (msg050001.getE01LCMAF2().equals("A")) out.print("class=\"context-menu-inq\" onmousedown=\"init(inqAccount, this.value)\"");%>>
        </TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap>Codigo Swift: </TD>
    <TD align="left" nowrap><INPUT name="E01LCMABI" type="text" value="<%=msg050001.getE01LCMABI()%>" size="12" maxlength="12" readonly="readonly">
       </TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap>Nombre: </TD>
    <TD align="left" nowrap><INPUT name="E01LCMAB1" type="text" value="<%=msg050001.getE01LCMAB1()%>" size="45" maxlength="35" readonly="readonly">
        <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap>Direcci�n: </TD>
    <TD align="left" nowrap><INPUT name="E01LCMAB2" type="text" value="<%=msg050001.getE01LCMAB2()%>" size="45" maxlength="35" readonly="readonly">
    </TD>
  </TR>
  <TR id="">
    <TD nowrap></TD>
    <TD align="left" nowrap><INPUT name="E01LCMAB3" type="text" value="<%=msg050001.getE01LCMAB3()%>" size="45" maxlength="35" readonly="readonly">
    </TD>
  </TR>
  <TR id="">
    <TD nowrap></TD>
    <TD align="left" nowrap><INPUT name="E01LCMAB4" type="text" value="<%=msg050001.getE01LCMAB4()%>" size="45" maxlength="35" readonly="readonly">
    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom" nowrap>Estado: </TD>
    <TD align="left" nowrap><INPUT name="E01LCMAB5" type="text" value="<%=msg050001.getE01LCMAB5()%>" size="4" maxlength="4" readonly="readonly">
      C�digo Postal
      <INPUT name="E01LCMAB6" type="text" value="<%=msg050001.getE01LCMAB6()%>" size="16" maxlength="15" readonly="readonly">
      Pa�s
      <INPUT name="E01LCMAB7" type="text" value="<%=msg050001.getE01LCMAB7()%>" size="4" maxlength="4" readonly="readonly">
      </TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right" nowrap="nowrap">L&iacute;nea de Cr&eacute;dito: </TD>
    <TD align="left" nowrap><INPUT name="E01LCMCOR" type="text" id="E01LCMCOR" value="<%=msg050001.getE01LCMCOR()%>" size="12" maxlength="12" readonly="readonly">
      <INPUT name="E01LCMCMG" type="text" value="<%=msg050001.getE01LCMCMG()%>" size="4" maxlength="4" readonly="readonly">
	</TD>
      </TR> 
</TABLE>  
  
<BR>
    <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
          <TR id="trdark">
            <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Banco Avisador / Avisar a Traves de </B></FONT></TD>
          </TR>
          <TR id="">
            <TD width="35%" align="right" nowrap="nowrap">Cliente: </TD>
            <TD align="left" nowrap><INPUT name="E01LCMCBC" type="text" value="<%=msg050001.getE01LCMCBC()%>" size="12" maxlength="12" readonly="readonly">
              </TD>
          </TR>
          <TR id="">
            <TD nowrap="nowrap" align="right">Codigo Swift: </TD>
            <TD align="left"><INPUT name="E01LCMCAI" type="text" value="<%=msg050001.getE01LCMCAI()%>" size="12" maxlength="12" readonly="readonly">
               </TD>
          </TR>
          <TR id="">
            <TD align="right"> Nombre: </TD>
            <TD align="left"><INPUT name="E01LCMCA1" type="text" value="<%=msg050001.getE01LCMCA1()%>" size="45" maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD align="right">Direcci�n: </TD>
            <TD align="left"><INPUT name="E01LCMCA2" type="text" value="<%=msg050001.getE01LCMCA2()%>" size="45" maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD></TD>
            <TD align="left"><INPUT name="E01LCMCA3" type="text" value="<%=msg050001.getE01LCMCA3()%>" size="45" maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD></TD>
            <TD align="left"><INPUT name="E01LCMCA4" type="text" value="<%=msg050001.getE01LCMCA4()%>" size="45" maxlength="35" readonly="readonly">
            </TD>
          </TR>
          <TR id="">
            <TD align="right" valign="bottom">Estado: </TD>
            <TD align="left" nowrap><INPUT name="E01LCMCA5" type="text" value="<%=msg050001.getE01LCMCA5()%>" size="4" maxlength="4" readonly="readonly">
              C�digo Postal
              <INPUT name="E01LCMCA6" type="text" value="<%=msg050001.getE01LCMCA6()%>" size="16" maxlength="15" readonly="readonly">
              Pa�s
              <INPUT name="E01LCMCA7" type="text" value="<%=msg050001.getE01LCMCA7()%>" size="4" maxlength="4" readonly="readonly">
              </TD>
          </TR>
  </TABLE>

<!-- <BR> -->
<!-- <TABLE width="100%" border="0" align="center" cellpadding="2"  cellspacing="0" class="tableinfo">
      <TR id="trdark">
        <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Banco Linea </B></FONT></TD>
      </TR>
      <TR id="">
        <TD width="35%" align="right" nowrap="nowrap">Cliente: </TD>
        <TD align="left" nowrap><INPUT name="E01LCMCOR" type="text" id="E01LCMCOR" value="<%=msg050001.getE01LCMCOR()%>" size="12" maxlength="12" readonly="readonly">
             Linea de Credito:
          <INPUT name="E01LCMCMG" type="text" value="<%=msg050001.getE01LCMCMG()%>" size="4" maxlength="4" readonly="readonly">
		  </TD>
      </TR>
      <TR id="">
        <TD nowrap="nowrap" align="right">Codigo Swift: </TD>
        <TD align="left"><INPUT name="E01LCMCBI" type="text" id="E01LCMCBI" value="<%=msg050001.getE01LCMCBI()%>" size="12" maxlength="12" readonly="readonly">
           </TD>
      </TR>
      <TR id="">
        <TD align="right"> Nombre: </TD>
        <TD align="left"><INPUT name="E01LCMCB1" type="text" id="E01LCMCB1" value="<%=msg050001.getE01LCMCB1()%>" size="45" maxlength="35" readonly="readonly">
        </TD>
      </TR>
      <TR id="">
        <TD align="right">Direcci&oacute;n: </TD>
        <TD align="left"><INPUT name="E01LCMCB2" type="text" id="E01LCMCB2" value="<%=msg050001.getE01LCMCB2()%>" size="45" maxlength="35" readonly="readonly">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT name="E01LCMCB3" type="text" id="E01LCMCB3" value="<%=msg050001.getE01LCMCB3()%>" size="45" maxlength="35" readonly="readonly">
        </TD>
      </TR>
      <TR id="">
        <TD></TD>
        <TD align="left"><INPUT name="E01LCMCB4" type="text" id="E01LCMCB4" value="<%=msg050001.getE01LCMCB4()%>" size="45" maxlength="35" readonly="readonly">
        </TD>
      </TR>
      <TR id="">
        <TD align="right" valign="bottom">Estado </TD>
        <TD align="left" nowrap><INPUT name="E01LCMCB5" type="text" id="E01LCMCB5" value="<%=msg050001.getE01LCMCB5()%>" size="2" maxlength="2" readonly="readonly">
          C&oacute;digo Postal
          <INPUT name="E01LCMCB6" type="text" id="E01LCMCB6" value="<%=msg050001.getE01LCMCB6()%>" size="16" maxlength="15" readonly="readonly">
          Pa&iacute;s
          <INPUT name="E01LCMCB7" type="text" id="E01LCMCB7" value="<%=msg050001.getE01LCMCB7()%>" size="3" maxlength="7" readonly="readonly">
          </TD>
      </TR>
    </TABLE> -->
    
 <BR>
  <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Banco Reembolsador</B></FONT></TD>
  </TR>
  <TR id="">
    <TD nowrap="nowrap" align="right">N�mero de Cliente o Cuenta: </TD>
    <TD  align="left" nowrap><INPUT name="E01LCMRBA" type="text" value="<%=msg050001.getE01LCMRBA()%>" size="12" maxlength="12" readonly="readonly">
        </TD>
  </TR>
  <TR id="">
    <TD nowrap="nowrap" align="right">Codigo Swift: </TD>
    <TD align="left" nowrap><INPUT name="E01LCMRBI" type="text" value="<%=msg050001.getE01LCMRBI()%>" size="14" maxlength="12" readonly="readonly">
</TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Nombre: </TD>
    <TD><INPUT name="E01LCMRB1" type="text" value="<%=msg050001.getE01LCMRB1()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD align="right">Direcci�n: </TD>
    <TD align="left"><INPUT name="E01LCMRB2" type="text" value="<%=msg050001.getE01LCMRB2()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%"></TD>
    <TD align="left"><INPUT name="E01LCMRB3" type="text" value="<%=msg050001.getE01LCMRB3()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT name="E01LCMRB4" type="text" value="<%=msg050001.getE01LCMRB4()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">Estado: </TD>
    <TD align="left" valign="bottom" nowrap><INPUT name="E01LCMRB5" type="text" value="<%=msg050001.getE01LCMRB5()%>" size="4" maxlength="4" readonly="readonly">
      C�digo Postal
      <INPUT name="E01LCMRB6" type="text" value="<%=msg050001.getE01LCMRB6()%>" size="16" maxlength="15" readonly="readonly">
      Pa�s
      <INPUT name="E01LCMRB7" type="text" value="<%=msg050001.getE01LCMRB7()%>" size="4" maxlength="4" readonly="readonly">
      </TD>
  </TR>
</TABLE>


</FORM>
</BODY>
</HTML>
