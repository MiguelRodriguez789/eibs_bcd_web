<html>
<head>
<title>Consulta de Cartas de Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<jsp:useBean id="msg046001" class="datapro.eibs.beans.ELC046001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   <%} else {%>
   builtNewMenu(sb_his_inq);
<%}%>

</SCRIPT>

</head>

<body bgcolor="#FFFFFF">

<%@ page import = "datapro.eibs.master.Util" %>
<SCRIPT> initMenu(); </SCRIPT>

<H3 align="center">Consulta de Historial Carta de Cr&eacute;dito StandBy Recibida<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_inq_basic_incoming_sb.jsp,ELC0460"></h3>

<hr size="4">

<form method="post">
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="">
 
 <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="18%" align="right"><b>Tipo de Operacion :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= userPO.getHeader1() %>" size="30" maxlength="30" readonly></td>
      <td height="18%" align="right"><b>Operador  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="25"
			maxlength="30" value="<%= userPO.getHeader2() %>" readonly></td>
      <td height="18%" align="right"><b>Fecha y Hora  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="20" maxlength="12" value="<%= userPO.getHeader3() %>" readonly></td>
    </tr>

    <tr id="trdark">
      <td width="18%" align="right"><b>Aprobaci�n :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= userPO.getHeader4() %>" size="30" maxlength="30" readonly></td>
      <td height="18%" align="right"><b>Supervisor  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="25"
			maxlength="30" value="<%= userPO.getHeader5() %>" readonly></td>
      <td height="18%" align="right"><b>Fecha y Hora  :</b></td>
      <td width="18%"><input type="text" name="E02ACC" size="20" maxlength="12" value="<%= userPO.getHeader6() %>" readonly></td>
    </tr>
  </table>
  <BR>
  <TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
            <TR id="trdark">
              <TD nowrap width="16%" align="right"><B>Banco : </B> </TD>
              <TD nowrap width="20%" align="left"><INPUT type="text" name="E01LCMBNK" readonly
						size="4" maxlength="2" value="<%= msg046001.getE01LCMBNK().trim()%>"></TD>
              <TD nowrap width="16%" align="right"><B>N�mero de Carta de Cr&eacute;dito : </B> </TD>
              <TD nowrap width="16%" align="left"><B> <B>
                <INPUT type="text" name="E01LCMACC" size="15"
			maxlength="12" value="<%= msg046001.getE01LCMACC().trim()%>" readonly>
                </B></B></TD>
            </TR>
            <TR>
              <TD nowrap width="16%" align="right"><B>Nuestra Referencia : </B> </TD>
              <TD nowrap width="20%" align="left"><INPUT name="E01LCMORF" type="text" value="<%= msg046001.getE01LCMORF().trim()%>" size="20"
						maxlength="16" readonly="readonly">
              </TD>
              <TD nowrap width="16%" align="right"><B>Producto : </B> </TD>
              <TD nowrap width="16%" align="left"><B>
                <INPUT type="text" name="E01LCMPRO" size="4"
						maxlength="4" value="<%= msg046001.getE01LCMPRO().trim()%>" readonly>
                </B> </TD>
            </TR>
            <TR id="trdark">
              <TD nowrap width="16%" align="right"><B>Referencia del Otro Banco : </B> </TD>
              <TD nowrap width="16%" align="left"><B>
                <INPUT name="E01LCMTRF" type="text" value="<%=msg046001.getE01LCMTRF().trim()%>" size="20" maxlength="16" readonly="readonly">
                </B> </TD>
              <TD nowrap width="16%" align="right"><B>Descripci�n del Producto : </B> </TD>
              <TD nowrap width="16%" align="left"><B>
                <INPUT type="text" name="E01DSCPRO" size="40"
						maxlength="35" value="<%=msg046001.getE01DSCPRO().trim()%>" readonly><%userPO.setHeader22(msg046001.getE01DSCPRO().trim()); %>
                </B> </TD>
            </TR>
  </TABLE>
<BR>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Aplicante</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">N�mero de Cliente o Cuenta: </TD>
    <TD nowrap><SELECT name="E01LCMAF2" disabled>
        <OPTION value=" "
						  <%if (!(msg046001.getE01LCMAF2().equals("C") || msg046001.getE01LCMAF2().equals("A"))) out.print("selected");%>
								selected></OPTION>
        <OPTION value="C" <%if (msg046001.getE01LCMAF2().equals("C")) out.print("selected");%>>Cliente</OPTION>
        <OPTION value="A" <%if (msg046001.getE01LCMAF2().equals("A")) out.print("selected");%>>Cuenta</OPTION>
      </SELECT>
        <INPUT name="E01LCMAPA" type="text" value="<%=msg046001.getE01LCMAPA()%>" size="12"	maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Nombre: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP1().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP1" type="text" value="<%=msg046001.getE01LCMAP1()%>" size="45" maxlength="35" readonly="readonly">    
		<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right">Direcci�n: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP2().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP2" type="text" value="<%=msg046001.getE01LCMAP2()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP3().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP3" type="text" value="<%=msg046001.getE01LCMAP3()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP4().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP4" type="text" value="<%=msg046001.getE01LCMAP4()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Estado: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMAP5().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP5" type="text"
							value="<%=msg046001.getE01LCMAP5()%>" size="4" maxlength="4" readonly="readonly">
      C�digo Postal
      <INPUT <%if (msg046001.getF01LCMAP6().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMAP6" type="text"
							value="<%=msg046001.getE01LCMAP6()%>" size="11" maxlength="10" readonly="readonly">
      Pa�s
      <INPUT <%if (msg046001.getF01LCMAP7().equals("Y")) out.print("class=\"txtchanged\"");%>
							name="E01LCMAP7" type="text"
							value="<%=msg046001.getE01LCMAP7()%>" size="4" maxlength="4" readonly="readonly"></TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Beneficiario</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right">N�mero de Cliente o Cuenta: </TD>
    <TD nowrap><SELECT name="E01LCMAF3" disabled>
        <OPTION value=" " <%if (!(msg046001.getE01LCMAF3().equals("C") || msg046001.getE01LCMAF3().equals("A"))) out.print("selected");%>></OPTION>
        <OPTION value="C" <%if (msg046001.getE01LCMAF3().equals("C")) out.print("selected");%>>Cliente</OPTION>
        <OPTION value="A" <%if (msg046001.getE01LCMAF3().equals("A")) out.print("selected");%>>Cuenta</OPTION>
      </SELECT>
        <INPUT <%if (msg046001.getF01LCMBAC().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBAC" type="text" value="<%=msg046001.getE01LCMBAC()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Nombre: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN1().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN1" type="text" value="<%=msg046001.getE01LCMBN1()%>" size="45"
					maxlength="35" readonly="readonly">
        <IMG
					src="<%=request.getContextPath()%>/images/Check.gif"
					title="campo obligatorio" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right">Direcci�n: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN2().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN2" type="text" value="<%=msg046001.getE01LCMBN2()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN3().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN3" type="text" value="<%=msg046001.getE01LCMBN3()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN4().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN4" type="text" value="<%=msg046001.getE01LCMBN4()%>" size="45"
					maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Estado: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMBN5().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMBN5" type="text"
							value="<%=msg046001.getE01LCMBN5()%>" size="2" maxlength="2" readonly="readonly">
      C�digo Postal
      <INPUT <%if (msg046001.getF01LCMBN6().equals("Y")) out.print("class=\"txtchanged\"");%>
							name="E01LCMBN6" type="text"
							value="<%=msg046001.getE01LCMBN6()%>" size="11" maxlength="10" readonly="readonly">
      Pa�s
      <INPUT <%if (msg046001.getF01LCMBN7().equals("Y")) out.print("class=\"txtchanged\"");%>
							name="E01LCMBN7" type="text"
							value="<%=msg046001.getE01LCMBN7()%>" size="4" maxlength="4" readonly="readonly">
     </TD>
  </TR>
  <TR id="">
    <TD align="right">Correo Electr�nico: </TD>
    <TD align="left">
  	  <INPUT type="text" name="E01LCMEMB" size="50" maxlength="40" value="<%=msg046001.getE01LCMEMB()%>" <%if (msg046001.getF01LCMEMB().equals("Y")) out.print("class=\"txtchanged\"");%>>
	</TD>
  </TR>
</TABLE>
<BR>
<TABLE border="0" cellpadding="2"  cellspacing="0" class="tableinfo" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Banco Emisor</B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="NOWRAP">N�mero de Cliente o Cuenta: </TD>
    <TD nowrap><SELECT name="E01LCMAF1" disabled>
        <OPTION value=" "></OPTION>
        <OPTION value="C" <%if (msg046001.getE01LCMAF1().equals("C")) out.print("selected");%>>Cliente</OPTION>
        <OPTION value="A" <%if (msg046001.getE01LCMAF1().equals("A")) out.print("selected");%>>Cuenta</OPTION>
      </SELECT>
        <INPUT <%if (msg046001.getF01LCMIBA().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMIBA" type="text" value="<%=msg046001.getE01LCMIBA()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right">Codigo Swift: </TD>
    <TD align="left" nowrap><INPUT <%if (msg046001.getF01LCMIBI().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMIBI" type="text" value="<%=msg046001.getE01LCMIBI()%>" size="14" maxlength="12" readonly="readonly">
      </TD>
  </TR>
  <TR id="">
    <TD align="right">Nombre: </TD>
    <TD align="left" nowrap><INPUT <%if (msg046001.getF01LCMIB1().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMIB1" type="text" value="<%=msg046001.getE01LCMIB1()%>" size="45" maxlength="35" readonly="readonly">
      <IMG src="<%=request.getContextPath()%>/images/Check.gif"
			title="campo obligatorio" border="0"></TD>
  </TR>
  <TR id="">
    <TD align="right">Direcci�n: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMIB2().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMIB2" type="text" value="<%=msg046001.getE01LCMIB2()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMIB3().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMIB3" type="text" value="<%=msg046001.getE01LCMIB3()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMIB4().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMIB4" type="text" value="<%=msg046001.getE01LCMIB4()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">Estado: </TD>
    <TD align="left" valign="bottom" nowrap><INPUT <%if (msg046001.getF01LCMIB5().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMIB5" type="text" value="<%=msg046001.getE01LCMIB5()%>" size="2" maxlength="2" readonly="readonly">
      C�digo Postal
      <INPUT <%if (msg046001.getF01LCMIB6().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMIB6" type="text" value="<%=msg046001.getE01LCMIB6()%>" size="11" maxlength="10" readonly="readonly">
      Pa�s
      <INPUT name="E01LCMIB7" type="text" value="<%=msg046001.getE01LCMIB7()%>" size="4" maxlength="4" readonly="readonly">
       </TD>
  </TR>
</TABLE>
<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Banco Avisador / Avisar a Traves de </B></FONT></TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Cliente: </TD>
    <TD align="left" nowrap><INPUT <%if (msg046001.getF01LCMCBC().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCBC" type="text" value="<%=msg046001.getE01LCMCBC()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%" align="right" nowrap="nowrap">Codigo Swift: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMCAI().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCAI" type="text" value="<%=msg046001.getE01LCMCAI()%>" size="12" maxlength="12" readonly="readonly">
 </TD>
  </TR>
  <TR id="">
    <TD align="right"> Nombre: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMCA1().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCA1" type="text" value="<%=msg046001.getE01LCMCA1()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right">Direcci�n: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMCA2().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCA2" type="text" value="<%=msg046001.getE01LCMCA2()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMCA3().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCA3" type="text" value="<%=msg046001.getE01LCMCA3()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMCA4().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCA4" type="text" value="<%=msg046001.getE01LCMCA4()%>" size="45" maxlength="35" readonly="readonly">    </TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">Estado: </TD>
    <TD align="left" nowrap><INPUT <%if (msg046001.getF01LCMCA5().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCA5" type="text" value="<%=msg046001.getE01LCMCA5()%>" size="2" maxlength="2" readonly="readonly">
      C&oacute;digo Postal
      <INPUT <%if (msg046001.getF01LCMCA6().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCA6" type="text" value="<%=msg046001.getE01LCMCA6()%>" size="11" maxlength="10" readonly="readonly">
      Pa&iacute;s
      <INPUT <%if (msg046001.getF01LCMCA7().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMCA7" type="text" value="<%=msg046001.getE01LCMCA7()%>" size="3" maxlength="7" readonly="readonly"></TD>
  </TR>
</TABLE>

<BR>
<TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
  <TR id="trdark">
    <TD colspan="2" align="center" valign="middle" ><FONT size="medium"><B>Banco Reembolsador</B></FONT></TD>
  </TR>
  <TR id="">
    <TD nowrap="nowrap" align="right">N�mero: </TD>
    <TD  align="left" nowrap><INPUT <%if (msg046001.getF01LCMRBA().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRBA" type="text" value="<%=msg046001.getE01LCMRBA()%>" size="12" maxlength="12" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD nowrap="nowrap" align="right">Codigo Swift: </TD>
    <TD align="left" nowrap><INPUT <%if (msg046001.getF01LCMRBI().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRBI" type="text" value="<%=msg046001.getE01LCMRBI()%>" size="14" maxlength="12" readonly="readonly">
      </TD>
  </TR>
  <TR id="">
    <TD align="right" nowrap="nowrap">Nombre: </TD>
    <TD><INPUT <%if (msg046001.getF01LCMRB1().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRB1" type="text" value="<%=msg046001.getE01LCMRB1()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD align="right">Direcci�n: </TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMRB2().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRB2" type="text" value="<%=msg046001.getE01LCMRB2()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD width="35%"></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMRB3().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRB3" type="text" value="<%=msg046001.getE01LCMRB3()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD></TD>
    <TD align="left"><INPUT <%if (msg046001.getF01LCMRB4().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRB4" type="text" value="<%=msg046001.getE01LCMRB4()%>" size="45" maxlength="35" readonly="readonly"></TD>
  </TR>
  <TR id="">
    <TD align="right" valign="bottom">Estado: </TD>
    <TD align="left" valign="bottom" nowrap><INPUT <%if (msg046001.getF01LCMRB5().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRB5" type="text" value="<%=msg046001.getE01LCMRB5()%>" size="2" maxlength="2" readonly="readonly">
      C�digo Postal
      <INPUT <%if (msg046001.getF01LCMRB6().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRB6" type="text" value="<%=msg046001.getE01LCMRB6()%>" size="11" maxlength="10" readonly="readonly">
      Pa�s
      <INPUT <%if (msg046001.getF01LCMRB7().equals("Y")) out.print("class=\"txtchanged\"");%> name="E01LCMRB7" type="text" value="<%=msg046001.getE01LCMRB7()%>" size="4" maxlength="4" readonly="readonly">
      </TD>
  </TR>
</TABLE>


</form>
</body>
</html>
