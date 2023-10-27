<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Tabla de Gastos y Comisiones de Cartas de Crédito por Cliente</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="msg01" class="datapro.eibs.beans.ELC060001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>

</HEAD>

<BODY>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
 	 error.setERRNUM("0");
    out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
  String field; int x = 1;
%>

<H3 align="center">Tabla de Gastos y Comisiones de Cartas de Crédito por Cliente<IMG 
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="ELC0600_sc_cust_basic_inc"></H3>
<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0600" >
  <input readonly TYPE=HIDDEN NAME="SCREEN" VALUE="205">
  <input readonly TYPE=HIDDEN NAME="E01RLCCUN" VALUE="<%=msg01.getE01RLCCUN()%>">
  
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap  ><B>Banco :</B></TD>
            <TD width="25%" nowrap  ><input readonly type="text" name="E01RLCBNK" size="3" maxlength="2" value="<%= msg01.getE01RLCBNK().trim()%>" readonly></TD>
            <TD width="25%" align="right" nowrap  ><B>N&uacute;mero de Tabla :</B></TD>
            <TD width="25%" nowrap  ><input readonly type="text" name="E01RLCTAR" size="3" maxlength="2" value="<%= msg01.getE01RLCTAR().trim()%>" readonly></TD>
    </TR>
          <TR id="trclear"> 
            <TD align="right" nowrap  ><B>Moneda de Tarifa :</B></TD>
            <TD nowrap  ><input readonly type="text" name="E01RLCTCY" size="4" maxlength="3" value="<%= msg01.getE01RLCTCY().trim()%>" >
               </TD>
            <TD align="right" nowrap  ><b>Moneda de Cuenta :</b></TD>
            <TD nowrap ><input readonly type="text" name="E01RLCACY" size="4" maxlength="3" value="<%= msg01.getE01RLCACY().trim()%>" >
              </TD>
    </TR>
          <TR id="trdark"> 
            <TD align="right" nowrap  ><b>Número de Cliente :</b></TD>
            <TD nowrap  ><input readonly type=HIDDEN name="OPT" value="<%= userPO.getPurpose()%>">
            <input readonly type="text" name="E01RLCCUN2" size="10" maxlength="9" value="<%= msg01.getE01RLCCUN().trim()%>" readonly ></TD>
            <TD align="right" nowrap  ><b>Nombre del Cliente :</b></TD>
            <TD nowrap ><input readonly type="text" name="E01CUSNME" size="48" maxlength="45" value="<%= msg01.getE01CUSNME().trim()%>" readonly></TD>
    </TR>
          <TR id="trclear">
            <TD align="right" nowrap  ><B>Tipo de Producto :</B></TD>
            <TD nowrap  ><input readonly type="text" name="E01RLCATY"  size=5 maxlength="8" value="<%= msg01.getE01RLCATY().trim()%>">
         </TD>
            <TD align="right" nowrap  ><b>Descripción :</b></TD>
            <TD nowrap ><input readonly type="text" name="E01RLCDSC" size="48" maxlength="45" value="<%= msg01.getE01RLCDSC().trim()%>" ></TD>
          </TR>
</TABLE>


<H4><B>Cargos</B></H4>

<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<TBODY><TR id="trdark">
		<TD nowrap align="center"><B>Concepto</B></TD>
		<TD nowrap align="center"><B>Monto</B></TD>
		<TD nowrap align="center"><B>Porcentaje</B></TD>
		<TD nowrap align="center"><B>Período</B></TD>
		<TD nowrap align="center"><B>Mínimo</B></TD>
		<TD nowrap align="center"><B>Máximo</B></TD>
		<TD nowrap align="center"><B>IVA</B></TD>
		<TD nowrap align="center"><B>Aplica</B></TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Apertura 1 :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIFA" size="12" maxlength="11" value="<%= msg01.getE01RLCIFA().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIBR" size="12" maxlength="11" value="<%= msg01.getE01RLCIBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIBP" size="5" maxlength="4" value="<%= msg01.getE01RLCIBP().trim()%>" onkeypress="enterInteger(event)"></DIV>
					</TD>
					<TD nowrap>

					<DIV align="center"><input readonly type="text" name="E01RLCIMF" size="12" maxlength="11" value="<%= msg01.getE01RLCIMF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIMX" size="12" maxlength="11" value="<%= msg01.getE01RLCIMX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI01">
						<OPTION value=" " <% if (!(msg01.getE01RLCI01().equals("Y")||msg01.getE01RLCI01().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI01().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI01().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap>
		<%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Apertura 2 :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIA2" size="12" maxlength="11" value="<%= msg01.getE01RLCIA2().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIR2" size="12" maxlength="11" value="<%= msg01.getE01RLCIR2().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIP2" size="5" maxlength="4" value="<%= msg01.getE01RLCIP2().trim()%>" onkeypress="enterInteger(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIM2" size="12" maxlength="11" value="<%= msg01.getE01RLCIM2().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCIX2" size="12" maxlength="11" value="<%= msg01.getE01RLCIX2().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
		<TD nowrap></TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Aviso :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCADF" size="12" maxlength="11" value="<%= msg01.getE01RLCADF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI02">
						<OPTION value=" " <% if (!(msg01.getE01RLCI02().equals("Y")||msg01.getE01RLCI02().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI02().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI02().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Confirmación 1 :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCFA" size="12" maxlength="11" value="<%= msg01.getE01RLCCFA().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCBR" size="12" maxlength="11" value="<%= msg01.getE01RLCCBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCBP" size="5" maxlength="4" value="<%= msg01.getE01RLCCBP().trim()%>" onkeypress="enterInteger(event)"></DIV>
					</TD>
					<TD nowrap>

					<DIV align="center"><input readonly type="text" name="E01RLCCMF" size="12" maxlength="11" value="<%= msg01.getE01RLCCMF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCMX" size="12" maxlength="11" value="<%= msg01.getE01RLCCMX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI03">
						<OPTION value=" " <% if (!(msg01.getE01RLCI03().equals("Y")||msg01.getE01RLCI03().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI03().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI03().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Confirmación 2 :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCC2" size="12" maxlength="11" value="<%= msg01.getE01RLCCC2().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCR2" size="12" maxlength="11" value="<%= msg01.getE01RLCCR2().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCP2" size="5" maxlength="4" value="<%= msg01.getE01RLCCP2().trim()%>" onkeypress="enterInteger(event)"></DIV>
					</TD>
					<TD nowrap>

					<DIV align="center"><input readonly type="text" name="E01RLCCM2" size="12" maxlength="11" value="<%= msg01.getE01RLCCM2().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCX2" size="12" maxlength="11" value="<%= msg01.getE01RLCCX2().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
		<TD nowrap></TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Extensión de Validez:</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCEVF" size="12" maxlength="11" value="<%= msg01.getE01RLCEVF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCEBR" size="12" maxlength="11" value="<%= msg01.getE01RLCEBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCEBP" size="5" maxlength="4" value="<%= msg01.getE01RLCEBP().trim()%>" onkeypress="enterInteger(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCEMF" size="12" maxlength="11" value="<%= msg01.getE01RLCEMF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCEMX" size="12" maxlength="11" value="<%= msg01.getE01RLCEMX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI04">
						<OPTION value=" " <% if (!(msg01.getE01RLCI04().equals("Y")||msg01.getE01RLCI04().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI04().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI04().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Enmienda :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCAMF" size="12" maxlength="11" value="<%= msg01.getE01RLCAMF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI05">
						<OPTION value=" " <% if (!(msg01.getE01RLCI05().equals("Y")||msg01.getE01RLCI05().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI05().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI05().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Aviso de Enmienda :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCAAF" size="12" maxlength="11" value="<%= msg01.getE01RLCAAF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI06">
						<OPTION value=" " <% if (!(msg01.getE01RLCI06().equals("Y")||msg01.getE01RLCI06().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI06().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI06().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Discrepancia :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCDIF" size="12" maxlength="11" value="<%= msg01.getE01RLCDIF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI07">
						<OPTION value=" " <% if (!(msg01.getE01RLCI07().equals("Y")||msg01.getE01RLCI07().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI07().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI07().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Pago a la Vista :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCSPF" size="12" maxlength="11" value="<%= msg01.getE01RLCSPF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCSBR" size="12" maxlength="11" value="<%= msg01.getE01RLCSBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCSPM" size="12" maxlength="11" value="<%= msg01.getE01RLCSPM().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCSPX" size="12" maxlength="11" value="<%= msg01.getE01RLCSPX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI08">
						<OPTION value=" " <% if (!(msg01.getE01RLCI08().equals("Y")||msg01.getE01RLCI08().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI08().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI08().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Aceptación :</DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCACB" size="12" maxlength="11" value="<%= msg01.getE01RLCACB().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCABP" size="5" maxlength="4" value="<%= msg01.getE01RLCABP().trim()%>" onkeypress="enterInteger(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCACM" size="12" maxlength="11" value="<%= msg01.getE01RLCACM().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCAMX" size="12" maxlength="11" value="<%= msg01.getE01RLCAMX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI09">
						<OPTION value=" " <% if (!(msg01.getE01RLCI09().equals("Y")||msg01.getE01RLCI09().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI09().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI09().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Pagos Diferido :</DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCDPB" size="12" maxlength="11" value="<%= msg01.getE01RLCDPB().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCDBP" size="5" maxlength="4" value="<%= msg01.getE01RLCDBP().trim()%>" onkeypress="enterInteger(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCDPM" size="12" maxlength="11" value="<%= msg01.getE01RLCDPM().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCDMX" size="12" maxlength="11" value="<%= msg01.getE01RLCDMX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI10">
						<OPTION value=" " <% if (!(msg01.getE01RLCI10().equals("Y")||msg01.getE01RLCI10().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI10().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI10().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Negociación :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCNEF" size="12" maxlength="11" value="<%= msg01.getE01RLCNEF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCNBR" size="12" maxlength="11" value="<%= msg01.getE01RLCNBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCNMF" size="12" maxlength="11" value="<%= msg01.getE01RLCNMF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCNMX" size="12" maxlength="11" value="<%= msg01.getE01RLCNMX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI11">
						<OPTION value=" " <% if (!(msg01.getE01RLCI11().equals("Y")||msg01.getE01RLCI11().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI11().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI11().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Asignación de Fondos :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCAPF" size="12" maxlength="11" value="<%= msg01.getE01RLCAPF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCAPB" size="12" maxlength="11" value="<%= msg01.getE01RLCAPB().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCAPM" size="12" maxlength="11" value="<%= msg01.getE01RLCAPM().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCAPX" size="12" maxlength="11" value="<%= msg01.getE01RLCAPX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI12">
						<OPTION value=" " <% if (!(msg01.getE01RLCI12().equals("Y")||msg01.getE01RLCI12().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI12().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI12().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Transferencia :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCTRA" size="12" maxlength="11" value="<%= msg01.getE01RLCTRA().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCTBR" size="12" maxlength="11" value="<%= msg01.getE01RLCTBR().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCTMF" size="12" maxlength="11" value="<%= msg01.getE01RLCTMF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCTMX" size="12" maxlength="11" value="<%= msg01.getE01RLCTMX().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI13">
						<OPTION value=" " <% if (!(msg01.getE01RLCI13().equals("Y")||msg01.getE01RLCI13().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI13().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI13().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Portes :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCPST" size="12" maxlength="11" value="<%= msg01.getE01RLCPST().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI14">
						<OPTION value=" " <% if (!(msg01.getE01RLCI14().equals("Y")||msg01.getE01RLCI14().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI14().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI14().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Courier :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCOU" size="12" maxlength="11" value="<%= msg01.getE01RLCCOU().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI15">
						<OPTION value=" " <% if (!(msg01.getE01RLCI15().equals("Y")||msg01.getE01RLCI15().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI15().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI15().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Cancelación :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCAN" size="12" maxlength="11" value="<%= msg01.getE01RLCCAN().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI16">
						<OPTION value=" " <% if (!(msg01.getE01RLCI16().equals("Y")||msg01.getE01RLCI16().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI16().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI16().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Timbres :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCNOF" size="12" maxlength="11" value="<%= msg01.getE01RLCNOF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI17">
						<OPTION value=" " <% if (!(msg01.getE01RLCI17().equals("Y")||msg01.getE01RLCI17().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI17().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI17().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Transferencia de Fondos :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCWTF" size="12" maxlength="11" value="<%= msg01.getE01RLCWTF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI18">
						<OPTION value=" " <% if (!(msg01.getE01RLCI18().equals("Y")||msg01.getE01RLCI18().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI18().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI18().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Swift de Apertura :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCTF" size="12" maxlength="11" value="<%= msg01.getE01RLCCTF().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI19">
						<OPTION value=" " <% if (!(msg01.getE01RLCI19().equals("Y")||msg01.getE01RLCI19().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI19().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI19().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Swift Adicional :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCTM" size="12" maxlength="11" value="<%= msg01.getE01RLCCTM().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCI20">
						<OPTION value=" " <% if (!(msg01.getE01RLCI20().equals("Y")||msg01.getE01RLCI20().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCI20().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCI20().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01APPF" + ( x < 10 ? "0" : "") + x; x++; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trclear">
					<TD nowrap>
					<DIV align="right">Comisión por A.C.H. :</DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCA3" size="12" maxlength="11" value="<%= msg01.getE01RLCCA3().trim()%>" onKeyPress="return enterDecimalNum(event)"></DIV>
					</TD>
					<TD nowrap>
					
					</TD>
					<TD nowrap>

					<DIV align="center"><input readonly type="text" name="E01RLCCN3" size="12" maxlength="11" value="<%= msg01.getE01RLCCN3().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCV3" size="12" maxlength="11" value="<%= msg01.getE01RLCCV3().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCCI3">
						<OPTION value=" " <% if (!(msg01.getE01RLCCI3().equals("Y")||msg01.getE01RLCCI3().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCCI3().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCCI3().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01RLCAF3"; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
				<TR id="trdark">
					<TD nowrap>
					<DIV align="right">Comisión de Reembolso :</DIV>
					</TD>
					<TD nowrap>
					<DIV align="center"><input readonly type="text" name="E01RLCCA2" size="12" maxlength="11" value="<%= msg01.getE01RLCCA2().trim()%>" onKeyPress="enterDecimal(event)"></DIV>
					</TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap></TD>
					<TD nowrap>
					<DIV align="center"><select disabled="disabled" name="E01RLCCI2">
						<OPTION value=" " <% if (!(msg01.getE01RLCCI2().equals("Y")||msg01.getE01RLCI14().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="Y" <% if (msg01.getE01RLCCI2().equals("Y")) out.print("selected"); %>>Si</OPTION>
						<OPTION value="N" <% if (msg01.getE01RLCCI2().equals("N")) out.print("selected"); %>>No</OPTION>
					</select></DIV>
					</TD>
		<TD nowrap><%	field = "E01RLCAF2"; %>
		<select disabled="disabled" name="<%=field%>"> 
			<OPTION value=" "> </OPTION>
			<OPTION value="I" <% if (msg01.getField(field).getString().equals("I")) out.print("selected"); %>>Apertura</OPTION>
			<OPTION value="A" <% if (msg01.getField(field).getString().equals("A")) out.print("selected"); %>>Enmienda</OPTION>
			<OPTION value="E" <% if (msg01.getField(field).getString().equals("E")) out.print("selected"); %>>Extension De Validez</OPTION>
			<OPTION value="N" <% if (msg01.getField(field).getString().equals("N")) out.print("selected"); %>>Incremento</OPTION>
			<OPTION value="T" <% if (msg01.getField(field).getString().equals("T")) out.print("selected"); %>>Transferencia</OPTION>
			<OPTION value="P" <% if (msg01.getField(field).getString().equals("P")) out.print("selected"); %>>asignacion De Fondos</OPTION>
			<OPTION value="1" <% if (msg01.getField(field).getString().equals("1")) out.print("selected"); %>>Pago</OPTION>
			<OPTION value="2" <% if (msg01.getField(field).getString().equals("2")) out.print("selected"); %>>Negociacion</OPTION>
			<OPTION value="3" <% if (msg01.getField(field).getString().equals("3")) out.print("selected"); %>>Pago y Negociacion</OPTION>
			<OPTION value="4" <% if (msg01.getField(field).getString().equals("4")) out.print("selected"); %>>Cancelacion</OPTION>
			<OPTION value="X" <% if (msg01.getField(field).getString().equals("X")) out.print("selected"); %>>Siempre</OPTION>
		</select>
		</TD>
	</TR>
</TBODY></TABLE>

<BR>
<H4> Cuentas Contables</H4> 
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
	<tr id="trdark">
			<TD nowrap align="center" width="30%"><B>Concepto</B></TD>
			<TD nowrap align="left" width="10%"><B>Cuenta</B></TD>
	</tr>	
	
	<tr  id="trclear">
      <td align="right" width="30%"> Apertura : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGIS" size="17" maxlength="16" value = "<%= msg01.getE01RLCGIS() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGIS','','')">
        <input readonly type="text" name="E01DSCGIS" size="60" maxlength="60" value = "<%= msg01.getE01DSCGIS() %>" readonly>
      </td>
    </tr>
    
    <tr  id="trdark">
      <td align="right" width="30%"> Aviso : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGAD" size="17" maxlength="16" value = "<%= msg01.getE01RLCGAD() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGAD','','')">
        <input readonly type="text" name="E01DSCGAD" size="60" maxlength="60" value = "<%= msg01.getE01DSCGAD() %>" readonly>
      </td>
    </tr>
    
    <tr  id="trclear">
      <td align="right" width="30%"> Confirmación : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGCO" size="17" maxlength="16" value = "<%= msg01.getE01RLCGCO() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGCO','','')">
        <input readonly type="text" name="E01DSCGCO" size="60" maxlength="60" value = "<%= msg01.getE01DSCGCO() %>" readonly>
      </td>
    </tr>
			
	<tr  id="trdark">
      <td align="right" width="30%"> Extensión de Validez : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGEV" size="17" maxlength="16" value = "<%= msg01.getE01RLCGEV() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGEV','','')">
        <input readonly type="text" name="E01DSCGEV" size="60" maxlength="60" value = "<%= msg01.getE01DSCGEV() %>" readonly>
      </td>
    </tr>			
			
	<tr  id="trclear">
      <td align="right" width="30%"> Enmienda : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGAM" size="17" maxlength="16" value = "<%= msg01.getE01RLCGAM() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGAM','','')">
        <input readonly type="text" name="E01DSCGAM" size="60" maxlength="60" value = "<%= msg01.getE01DSCGAM() %>" readonly>
      </td>
    </tr>			

	<tr  id="trdark">
      <td align="right" width="30%"> Aviso de Enmienda : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGAA" size="17" maxlength="16" value = "<%= msg01.getE01RLCGAA() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGAA','','')">
        <input readonly type="text" name="E01DSCGAA" size="60" maxlength="60" value = "<%= msg01.getE01DSCGAA() %>" readonly>
      </td>
    </tr>			
			
	<tr  id="trclear">
      <td align="right" width="30%"> Discrepancia : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGDI" size="17" maxlength="16" value = "<%= msg01.getE01RLCGDI() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGDI','','')">
        <input readonly type="text" name="E01DSCGDI" size="60" maxlength="60" value = "<%= msg01.getE01DSCGDI() %>" readonly>
      </td>
    </tr>	
    
	<tr  id="trdark">
      <td align="right" width="30%"> Pago a la Vista : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGPM" size="17" maxlength="16" value = "<%= msg01.getE01RLCGPM() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGPM','','')">
        <input readonly type="text" name="E01DSCGPM" size="60" maxlength="60" value = "<%= msg01.getE01DSCGPM() %>" readonly>
      </td>
    </tr>	    		
			
	<tr  id="trclear">
      <td align="right" width="30%"> Aceptación : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGAC" size="17" maxlength="16" value = "<%= msg01.getE01RLCGAC() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGAC','','')">
        <input readonly type="text" name="E01DSCGAC" size="60" maxlength="60" value = "<%= msg01.getE01DSCGAC() %>" readonly>
      </td>
    </tr>							

	<tr  id="trdark">
      <td align="right" width="30%"> Pagos Diferido : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGDP" size="17" maxlength="16" value = "<%= msg01.getE01RLCGDP() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGDP','','')">
        <input readonly type="text" name="E01DSCGDP" size="60" maxlength="60" value = "<%= msg01.getE01DSCGDP() %>" readonly>
      </td>
    </tr>	

	<tr  id="trclear">
      <td align="right" width="30%"> Negociacion : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGNE" size="17" maxlength="16" value = "<%= msg01.getE01RLCGNE() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGNE','','')">
        <input readonly type="text" name="E01DSCGNE" size="60" maxlength="60" value = "<%= msg01.getE01DSCGNE() %>" readonly>
      </td>
    </tr>	

	<tr  id="trdark">
      <td align="right" width="30%"> Asignación de Fondos : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGAS" size="17" maxlength="16" value = "<%= msg01.getE01RLCGAS() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGAS','','')">
        <input readonly type="text" name="E01DSCGAS" size="60" maxlength="60" value = "<%= msg01.getE01DSCGAS() %>" readonly>
      </td>
    </tr>	

	<tr  id="trclear">
      <td align="right" width="30%"> Transferencia : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGTR" size="17" maxlength="16" value = "<%= msg01.getE01RLCGTR() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGTR','','')">
        <input readonly type="text" name="E01DSCGTR" size="60" maxlength="60" value = "<%= msg01.getE01DSCGTR() %>" readonly>
      </td>
    </tr>		
			
	<tr  id="trdark">
      <td align="right" width="30%"> Portes : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGPO" size="17" maxlength="16" value = "<%= msg01.getE01RLCGPO() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGPO','','')">
        <input readonly type="text" name="E01DSCGPO" size="60" maxlength="60" value = "<%= msg01.getE01DSCGPO() %>" readonly>
      </td>
    </tr>	
			
	<tr  id="trclear">
      <td align="right" width="30%"> Courier : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGCR" size="17" maxlength="16" value = "<%= msg01.getE01RLCGCR() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGCR','','')">
        <input readonly type="text" name="E01DSCGCR" size="60" maxlength="60" value = "<%= msg01.getE01DSCGCR() %>" readonly>
      </td>
    </tr>	

	<tr  id="trdark">
      <td align="right" width="30%"> Cancelación : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGCA" size="17" maxlength="16" value = "<%= msg01.getE01RLCGCA() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGCA','','')">
        <input readonly type="text" name="E01DSCGCA" size="60" maxlength="60" value = "<%= msg01.getE01DSCGCA() %>" readonly>
      </td>
    </tr>	
    
	<tr  id="trclear">
      <td align="right" width="30%"> Timbres : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGNF" size="17" maxlength="16" value = "<%= msg01.getE01RLCGNF() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGNF','','')">
        <input readonly type="text" name="E01DSCGNF" size="60" maxlength="60" value = "<%= msg01.getE01DSCGNF() %>" readonly>
      </td>
    </tr>	
        					
	<tr  id="trdark">
      <td align="right" width="30%"> Transferencia de Fondos : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGWT" size="17" maxlength="16" value = "<%= msg01.getE01RLCGWT() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGWT','','')">
        <input readonly type="text" name="E01DSCGWT" size="60" maxlength="60" value = "<%= msg01.getE01DSCGWT() %>" readonly>
      </td>
    </tr>			
			
	<tr  id="trclear">
      <td align="right" width="30%"> Swift de Apertura : </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGTF" size="17" maxlength="16" value = "<%= msg01.getE01RLCGTF() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGTF','','')">
        <input readonly type="text" name="E01DSCGTF" size="60" maxlength="60" value = "<%= msg01.getE01DSCGTF() %>" readonly>
      </td>
    </tr>			

	<tr  id="trdark">
      <td align="right" width="30%"> Swift Adicional: </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCGTM" size="17" maxlength="16" value = "<%= msg01.getE01RLCGTM() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01DSCGTM','','')">
        <input readonly type="text" name="E01DSCGTM" size="60" maxlength="60" value = "<%= msg01.getE01DSCGTM() %>" readonly>
      </td>
    </tr>	
    
	<tr  id="trclear">
      <td align="right" width="30%"> Comisión A.C.H.: </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCCG3" size="17" maxlength="16" value = "<%= msg01.getE01RLCCG3() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01RLCCD3','','')">
        <input readonly type="text" name="E01RLCCD3" size="60" maxlength="60" value = "<%= msg01.getE01RLCCD3() %>" readonly>
      </td>
    </tr>	    		
			
	<tr  id="trdark">
      <td align="right" width="30%"> Comisión de Reembolso: </td>
      <td align="left" width="60%" nowrap> 
        <input readonly type="text" name="E01RLCCG2" size="17" maxlength="16" value = "<%= msg01.getE01RLCCG2() %>" onkeypress="enterInteger(event)"
        class="context-menu-help" onmousedown1="init(ledgerHelp,this.name,document.forms[0].E01RLCBNK.value,document.forms[0].E01RLCACY.value,'E01RLCCD2','','')">
        <input readonly type="text" name="E01RLCCD2" size="60" maxlength="60" value = "<%= msg01.getE01RLCCD2() %>" readonly>
      </td>
    </tr>

</TABLE>

	
   <BR>
 
</FORM>
  
</BODY>
</HTML>
