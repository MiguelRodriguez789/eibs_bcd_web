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

<jsp:useBean id="msg050004" class="datapro.eibs.beans.ELC050004Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<SCRIPT type="text/javascript">
	builtNewMenu(lc_apr_cc_new);
	initMenu(); 
</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%>
</HEAD>

<BODY>
<H3 align="center">Comisiones de Cartas de Credito<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_commissi.jsp, ELC0525"></H3>
<HR size="4">


<FORM>
<TABLE width="100%" border="0" cellpadding="2" cellspacing="0" class="tableinfo">
    <TR id="trdark">
      <TD width="15%" align="right" nowrap="nowrap"><B>Banco</B></TD>
      <TD width="31%" nowrap="nowrap"><INPUT type="text" name="E04LCMBNK" readonly
					size="4" maxlength="2" value="<%=msg050004.getE04LCMBNK().trim()%>"> 
        <B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Producto</B> <B>
        <INPUT type="text" name="E01LCMPRO" size="4"
					maxlength="4" value="<%=msg050004.getE04LCMPRO().trim()%>" readonly>
        </B></TD>
      <TD width="35%" align="right" nowrap="nowrap"><B>N&uacute;mero de Carta de Credito</B></TD>
      <TD width="19%" nowrap="nowrap"><B>
        <INPUT type="text" name="E04LCMACC" size="12"
					maxlength="12" value="<%=msg050004.getE04LCMACC().trim()%>" readonly>
      </B></TD>
    </TR>
    <TR id="trclear">
      <TD align="right" nowrap="nowrap"><B>Fecha Emision</B></TD>
      <TD nowrap="nowrap">
		<eibsinput:date name="msg050004" fn_month="E04LCMIDM" fn_day="E04LCMIDD" fn_year="E04LCMIDY" readonly="true"/>
		</TD>
      <TD align="right" nowrap="nowrap"><B>Tarifa de Cargos y Moneda</B></TD>
      <TD nowrap="nowrap"><INPUT type="text" name="E04LCMTAR" size="2"
					maxlength="2" value= "<%=msg050004.getE04LCMTAR()%>" readonly>
        <INPUT type="text" name="E04LCMTCY" size="3"
					maxlength="3" value= "<%=msg050004.getE04LCMTCY()%>" readonly></TD>
    </TR>
    <TR id="trdark">
      <TD align="right" nowrap="nowrap"><B>Fecha Expiracion</B></TD>
      <TD nowrap="nowrap" align"left">
			<eibsinput:date name="msg050004" fn_month="E04LCMEXM" fn_day="E04LCMEXD" fn_year="E04LCMEXY" readonly="true"/>  	
		</TD>
      <TD align="right" nowrap="nowrap"><B>Monto del Credito</B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E04LCMOAM" size="12"
					maxlength="12" value="<%=msg050004.getE04LCMOAM()%>" readonly>
      </B></TD>
    </TR>
  </TABLE>
  <BR>
<H4>Informaci�n</H4>
<TABLE class="tableinfo" border="0" cellspacing="0" cellpadding="4" width="100%">
					<TR id="trdark">
						<TD width="38%" align="right" nowrap></TD>
						<TD width="14%" align="center" nowrap ><B>Monto</B></TD>
						<TD nowrap align="center" width="11%"><B>Por Cta de</B></TD>
						<TD nowrap align="center" ></TD>
						<TD nowrap align="center" width="12%"></TD>
					</TR>
					
<%
					int size = 9;
					java.util.ArrayList name = new java.util.ArrayList();
					java.util.ArrayList field1 = new java.util.ArrayList();
					java.util.ArrayList field2 = new java.util.ArrayList();

					if (msg050004.getH04FLGWK3().equals("N")) {
						name.add("Comision Apertura");
						field1.add("E04LCMC01");
						field2.add("E04LCMP01");

						name.add("Comision Aviso");
						field1.add("E04LCMC02");
						field2.add("E04LCMP02");

						name.add("Comision Confirmacion");
						field1.add("E04LCMC03");
						field2.add("E04LCMP03");

						name.add("Timbres");
						field1.add("E04LCMC08");
						field2.add("E04LCMP08");

					} else {
						name.add("Comision de Enmienda");
						field1.add("E04LCMC04");
						field2.add("E04LCMP04");

						name.add("Aviso de Enmienda");
						field1.add("E04LCMC05");
						field2.add("E04LCMP05");

						name.add("Discrepencia");
						field1.add("E04LCMC06");
						field2.add("E04LCMP06");

						name.add("Extension de Validez");
						field1.add("E04LCMC07");
						field2.add("E04LCMP07");
					}
					
					
					name.add("Portes");
					field1.add("E04LCMC09");
					field2.add("E04LCMP09");
					
					name.add("Courier");
					field1.add("E04LCMC10");
					field2.add("E04LCMP10");
					
					name.add("Swift Apertura");
					field1.add("E04LCMC11");
					field2.add("E04LCMP11");
					
					name.add("Swift Adicional");
					field1.add("E04LCMC12");
					field2.add("E04LCMP12");
					
					if (userPO.getID().equals("18")) {
						name.add("Gastos Notariales");
						field1.add("E04GASNOT");
						field2.add("E04NOTPBY");
						
						name.add("Seguro de Desgravamen");
						field1.add("E04SEGDES");
						field2.add("E04SEGPBY");
					}	

					java.util.ArrayList value2 = new java.util.ArrayList();
					for(int i = 0; i < field2.size(); i++) {
						value2.add(msg050004.getField((String)field2.get(i)).getString().trim());
					}

					for (int i = 0; i < name.size(); i++) {
%>
					
						<TR id="<%=( i%2==0 ? "trclear" : "trdark" )%>">
							<TD width="38%" align="right" nowrap><%=(String) name.get(i)%> :</TD>
							<TD nowrap  align="center">
								<INPUT type="text" name="<%=field1.get(i)%>" size="15" maxlength="15"
									value="<%=msg050004.getField((String) field1.get(i)).getString().trim()%>">
							</TD>
							<TD nowrap width="11%">
								<SELECT name="<%=field2.get(i)%>" disabled >
									<OPTION value="A" <%=value2.get(i).toString().equals("A") ? "selected" : ""%>>Aplicante</OPTION>
									<OPTION value="B" <%=value2.get(i).toString().equals("B") ? "selected" : ""%>>Beneficiario</OPTION>
									<OPTION value="W" <%=value2.get(i).toString().equals("W") ? "selected" : ""%>>Condonar</OPTION>
						  </SELECT></TD>
							<TD nowrap width="25%"></TD>
							<TD nowrap width="12%"></TD>
						</TR>
					
					<%}%>
			</TABLE>


</FORM>
</BODY>
</HTML>
