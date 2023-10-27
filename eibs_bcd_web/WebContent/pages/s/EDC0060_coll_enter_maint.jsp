<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Pago/Liquidación de Cobranzas</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">


<SCRIPT type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp">
	
</SCRIPT>

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage"
	scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"
	scope="session" />
<jsp:useBean id="dcPag" class="datapro.eibs.beans.EDC006001Message"
	scope="session" />

<SCRIPT type="text/javascript">
	
</SCRIPT>
</HEAD>
<BODY>
	<H3 align="center">
		Pago/Liquidación de Cobranzas<IMG
			src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
			name="EIBS_GIF" title="coll_enter_maint.jsp, EDC00060">
	</H3>
	<HR size="4">
	<FORM method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0060">
		<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">
		<table class="tableinfo">
			<tr>
				<td nowrap>
					<TABLE class="tbenter" cellspacing=0 cellpadding=2 width="100%"
						border="0">
						<TR id="trdark">
							<TD nowrap width="50%">
								<div align="right">Número de Cobranza :</div></TD>
							<TD nowrap width="50%">
								<div align="left">
									<INPUT type="text" name="E01DCMACC" size="13" maxlength="12"
										value="<%=dcPag.getE01DCMACC()%>"
										onkeypress="enterInteger(event)"> <A
										href="javascript:GetAccount('E01DCMACC','','CL','')"><IMG
										src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda"
										border="0" align="bottom">
									</A>
								</div></TD>
						</TR>

						<TR id="trclear">
							<TD nowrap width="50%">
								<div align="right">Tipo de Operación :</div></TD>
							<TD nowrap width="50%">
								<div align="left">
									<select name="E01TIPOPE">
										<option value="0" selected></option>
										<option value="1"
											<%=dcPag.getE01TIPOPE().equals("1") ? "selected" : ""%>>Pago
											Total</option>
										<option value="2"
											<%=dcPag.getE01TIPOPE().equals("2") ? "selected" : ""%>>Pago
											Parcial</option>
										<option value="3"
											<%=dcPag.getE01TIPOPE().equals("3") ? "selected" : ""%>>Cobro
											de Comisiones</option>
										<option value="4"
											<%=dcPag.getE01TIPOPE().equals("4") ? "selected" : ""%>>Cancelacion</option>
									</select> <img src="<%=request.getContextPath()%>/images/Check.gif"
										title="mandatory field" border="0" align="middle">
								</div></TD>
						</TR>

						<TR id="trdark">
							<TD nowrap width="50%">
								<div align="right">Monto a Pagar :</div></TD>
							<TD nowrap width="50%">
								<div align="left">
									<INPUT type="text" name="E01MNTPAG" size="28" maxlength="35"
										value="<%=dcPag.getE01MNTPAG()%>"> <IMG
										src="<%=request.getContextPath()%>/images/Check.gif"
										title="mandatory field" border="0" align="middle">
								</div></TD>
						</TR>
					    <TR id="trclear"> 
					      <TD nowrap width="50%">
					      	<div align="right">Condición de la Cancelación :</div>
					      </TD>
					      <TD nowrap width="50%">
						    <div align="left">
					    	    <SELECT name="E01CONDCA">
								   <OPTION value="X" selected></OPTION>
								   <OPTION value="F" <%= dcPag.getE01CONDCA().equals("F")?"selected":"" %>>Libre de Pago</OPTION>
								   <OPTION value="R" <%= dcPag.getE01CONDCA().equals("R")?"selected":"" %>>Devuelta Impaga</OPTION>
							    </SELECT>
					    	</div>
					      </TD>
					    </TR>  						
					</table></td>
			</tr>
		</table>
		<br>
		<div align="center">
			<input id="EIBSBTN" type=submit name="Submit" value="Enviar">

		</div>
		<script type="text/javascript">
			document.forms[0].E01DCMACC.focus();
			document.forms[0].E01DCMACC.select();
		</script>
		<%
			if (!error.getERRNUM().equals("0")) {
				error.setERRNUM("0");
		%>
		<SCRIPT type="text/javascript">
			showErrors();
		</SCRIPT>
		<%
			}
		%>
	</FORM>
	<P>
		<BR>
</BODY>
</HTML>
