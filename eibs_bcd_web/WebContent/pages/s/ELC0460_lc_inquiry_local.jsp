<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>Letters of Credit Opening/Maintenance</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<jsp:useBean id="msg046001"  class="datapro.eibs.beans.ELC046001Message" scope="session" />
<jsp:useBean id="error"  class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript">
 <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   <%} else {%>
	builtNewMenu(lc_his_inq);
	<%}%>
	initMenu();
   
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
<H3 align="center">Consulta de Historial de Cartas de Crédito Local<IMG
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="ELC0460_lc_inquiry_local.jsp"></H3>
<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.trade.JSELC0450">
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="18%" align="right"><b>Tipo de Operacion :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= userPO.getHeader1() %>" size="30" maxlength="30" readonly></td>
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
  <BR>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
            <TR id="trdark">
              <TD nowrap width="16%" align="right"><B>Banco : </B> </TD>
              <TD nowrap width="20%" align="left"><INPUT type="text" name="E01LCMBNK" readonly
						size="4" maxlength="2" value="<%= msg046001.getE01LCMBNK().trim()%>"></TD>
              <TD nowrap width="16%" align="right"><B>Número de Carta de Cr&eacute;dito : </B> </TD>
              <TD nowrap width="16%" align="left"><B> <B>
                <INPUT type="text" name="E01LCMACC" size="14"
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
              <TD nowrap width="16%" align="right"><B>Descripción del Producto : </B> </TD>
              <TD nowrap width="16%" align="left"><B>
                <INPUT type="text" name="E01DSCPRO" size="40"
						maxlength="35" value="<%=msg046001.getE01DSCPRO().trim()%>" readonly><%userPO.setHeader22(msg046001.getE01DSCPRO().trim()); %>
                </B> </TD>
            </TR>
  </TABLE>
  <H4>Tipo de Operación</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark">
                <TD nowrap width="16%" align="right"><B>Enmienda : </B> </TD>
                <TD nowrap width="20%" align="left"><% if (msg046001.getE01LCMAMF().equals("Y")) out.print("YES"); else out.print("NO");%>
                  <INPUT name="E01LCMLAN" type="HIDDEN"
							value="<%= msg046001.getE01LCMLAN().trim()%>" readonly="readonly">
                </TD>
                <TD nowrap width="16%" align="right"><B>Ultima Enmienda : </B> </TD>
                <TD nowrap width="16%" align="left"><B>
                  <INPUT type="text" name="E01LCMLAN" size="4"
							maxlength="4" value="<%= msg046001.getE01LCMLAN().trim()%>" readonly>
                  </B>
                  <INPUT name="E01LCMLAN" type="HIDDEN" value="<%= msg046001.getE01LCMLAN().trim()%>" readonly="readonly"></TD>
                <TD nowrap width="16%" align="right"><B>Fecha Ultima Enmienda : </B></TD>
                <TD nowrap width="16%" align="left"><B>
					<eibsinput:date name="msg046001" fn_month="E01LCMLAM" fn_day="E01LCMLAD" fn_year="E01LCMLAY" readonly="true"/>
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
      <TD width="35%" align="right">Número de Cliente o Cuenta: </TD>
      <TD nowrap>
      	<SELECT name="E01LCMAF2" disabled >
          		<OPTION value=" "	<%if (!(msg046001.getE01LCMAF2().equals("C") || msg046001.getE01LCMAF2().equals("A"))) out.print("selected");%>selected></OPTION>
          		<OPTION value="C" <%if (msg046001.getE01LCMAF2().equals("C")) out.print("selected");%>>Cliente</OPTION>
          		<OPTION value="A" <%if (msg046001.getE01LCMAF2().equals("A")) out.print("selected");%>>Cuenta</OPTION>
        </SELECT>
        <INPUT name="E01LCMAPA" type="text" value="<%=msg046001.getE01LCMAPA()%>" size="12"	maxlength="12" readonly="readonly" 
        	<%if (msg046001.getF01LCMAPA().equals("Y")) out.print("class=\"txtchanged\"");%>>
        	<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">  
      </TD>
    </TR>
    <TR id="">
      <TD align="right">Nombre: </TD>
      <TD align="left"><INPUT name="E01LCMAP1" type="text" value="<%=msg046001.getE01LCMAP1()%>" size="45" maxlength="35" readonly="readonly" 
        	<%if (msg046001.getF01LCMAP1().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
    <TR id="">
      <TD align="right">Dirección: </TD>
      <TD align="left"><INPUT name="E01LCMAP2" type="text" value="<%=msg046001.getE01LCMAP2()%>" size="45" maxlength="35" readonly="readonly"
        	<%if (msg046001.getF01LCMAP2().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
    <TR id="">
      <TD></TD>
      <TD align="left"><INPUT name="E01LCMAP3" type="text" value="<%=msg046001.getE01LCMAP3()%>" size="45" maxlength="35" readonly="readonly"
        	<%if (msg046001.getF01LCMAP3().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
    <TR id="">
      <TD></TD>
      <TD align="left"><INPUT name="E01LCMAP4" type="text" value="<%=msg046001.getE01LCMAP4()%>" size="45" maxlength="35" readonly="readonly"
        	<%if (msg046001.getF01LCMAP4().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
    <TR id="">
      <TD align="right">Estado: </TD>
      <TD align="left"><INPUT name="E01LCMAP5" type="text" value="<%=msg046001.getE01LCMAP5()%>" size="4" maxlength="4" readonly="readonly"
        	<%if (msg046001.getF01LCMAP5().equals("Y")) out.print("class=\"txtchanged\"");%>>
        Código Postal
         <INPUT name="E01LCMAP6" type="text"	value="<%=msg046001.getE01LCMAP6()%>" size="11" maxlength="10" readonly="readonly"
        	<%if (msg046001.getF01LCMAP6().equals("Y")) out.print("class=\"txtchanged\"");%>>
        País
         <INPUT name="E01LCMAP7" type="text" value="<%=msg046001.getE01LCMAP7()%>" size="4" maxlength="4" readonly="readonly"
        	<%if (msg046001.getF01LCMAP7().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
  </TABLE>
  <BR>
  <TABLE class="tableinfo"  cellspacing="0" cellpadding="2" border="0" width="100%" align="center">
    <TR id="trdark">
      <TD colspan="2" align="center" valign="middle"><FONT size="medium"><B>Beneficiario</B></FONT></TD>
    </TR>
    <TR id="">
      <TD width="35%" align="right">Número de Cliente o Cuenta: </TD>
      <TD nowrap><SELECT name="E01LCMAF3" disabled >
          <OPTION value=" " <%if (!(msg046001.getE01LCMAF3().equals("C") || msg046001.getE01LCMAF3().equals("A"))) out.print("selected");%>></OPTION>
          <OPTION value="C" <%if (msg046001.getE01LCMAF3().equals("C")) out.print("selected");%>>Cliente</OPTION>
          <OPTION value="A" <%if (msg046001.getE01LCMAF3().equals("A")) out.print("selected");%>>Cuenta</OPTION>
        </SELECT>
        <INPUT name="E01LCMBAC" type="text" value="<%=msg046001.getE01LCMBAC()%>" size="12" maxlength="12" readonly="readonly"
        	<%if (msg046001.getF01LCMBAC().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
    <TR id="">
      <TD align="right"> Nombre: </TD>
      <TD align="left"><INPUT name="E01LCMBN1" type="text" value="<%=msg046001.getE01LCMBN1()%>" size="45" maxlength="35" readonly="readonly"
        	<%if (msg046001.getF01LCMBN1().equals("Y")) out.print("class=\"txtchanged\"");%>>
          <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
    </TR>
    <TR id="">
      <TD align="right">Dirección: </TD>
      <TD align="left"><INPUT name="E01LCMBN2" type="text" value="<%=msg046001.getE01LCMBN2()%>" size="45" maxlength="35" readonly="readonly"
        	<%if (msg046001.getF01LCMBN2().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
    <TR id="">
      <TD></TD>
      <TD align="left"><INPUT name="E01LCMBN3" type="text" value="<%=msg046001.getE01LCMBN3()%>" size="45" maxlength="35" readonly="readonly"
        	<%if (msg046001.getF01LCMBN3().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
    <TR id="">
      <TD></TD>
      <TD align="left"><INPUT name="E01LCMBN4" type="text" value="<%=msg046001.getE01LCMBN4()%>" size="45" maxlength="35" readonly="readonly"
        	<%if (msg046001.getF01LCMBN4().equals("Y")) out.print("class=\"txtchanged\"");%>>
      </TD>
    </TR>
    <TR id="">
      <TD align="right">Estado: </TD>
      <TD align="left"><INPUT name="E01LCMBN5" type="text" value="<%=msg046001.getE01LCMBN5()%>" size="2" maxlength="2" readonly="readonly"
        	<%if (msg046001.getF01LCMBN5().equals("Y")) out.print("class=\"txtchanged\"");%>>
        Código Postal
        <INPUT name="E01LCMBN6" type="text"	value="<%=msg046001.getE01LCMBN6()%>" size="11" maxlength="10" readonly="readonly"
        	<%if (msg046001.getF01LCMBN6().equals("Y")) out.print("class=\"txtchanged\"");%>>
        País
        <INPUT name="E01LCMBN7" type="text"	value="<%=msg046001.getE01LCMBN7()%>" size="4" maxlength="4" readonly="readonly"
        	<%if (msg046001.getF01LCMBN7().equals("Y")) out.print("class=\"txtchanged\"");%>>
         </TD>
    </TR>
    <TR id="">
    <TD align="right">Correo Electrónico: </TD>
    <TD align="left">
  	  <INPUT type="text" name="E01LCMEMB" size="50" maxlength="40" value="<%=msg046001.getE01LCMEMB()%>" <%if (msg046001.getF01LCMBN7().equals("Y")) out.print("class=\"txtchanged\"");%>>
	</TD>
  </TR>
  </TABLE>
 
</FORM>
</BODY>
</HTML>
