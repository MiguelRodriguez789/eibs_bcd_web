<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Pago/Liquidación de Cobranzas</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id="dcPag"  class="datapro.eibs.beans.EDC006001Message" scope="session" />
<SCRIPT type="text/javascript">
  function helpAcc(tipo,fldst,fld1,fld2){
    if(tipo=='A'){
        GetAccByClient(fldst,'','RT','','E01DCMCL1');
    }
    if(tipo=='G'){
       if(fld2==''){
          alert("Seleccione Moneda de Cuenta Contable");
          return;
       } 
        GetLedger(fldst,fld1,fld2,'');
    }    
  }
</SCRIPT>
<SCRIPT type="text/javascript">
  function fcvalida(){
     if(document.forms[0].E01DCMACC.value == "0.00"){ 
        alert("Debe de Ingrese monto de Pago");
        return false;
     }
     if(document.forms[0].E01TIPOPE.value == "0"){ 
        alert("Debe de Seleccionar Tipo de Operacion");
        return false;
     }
     
     if(document.forms[0].E01TIPOPE.value == "4" && document.forms[0].E01CONDCA.value == "X"){ 
        alert("Debe de Seleccionar condicion de la cancelacion");
        return false;
     }
     
     return true;
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

<H3 align="center">Pago/Liquidaci&oacute;n de Cobranzas <%=dcPag.getE01DCMTYP().equals("I") ? "Recibidas" : "Enviadas" %><IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" alt="coll_nego_enter_detail_incoming.jsp, EDC0060"></H3>
<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0060" onsubmit="return fcvalida();">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="2">

<table class="tableinfo">
	<tr>
		<td nowrap>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
			<TBODY><TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Banco :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01DCMBNK" readonly size="4" maxlength="2" value="<%=dcPag.getE01DCMBNK().trim()%>">
					</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Número de Cobranza   :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B> 
					<INPUT type="text" name="E01DCMACC" size="12" maxlength="12" value="<%=dcPag.getE01DCMACC().trim()%>" readonly>				
					</B></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
					<DIV align="right"><B>Cliente :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01CUSNA1" size="37" maxlength="35" value="<%=dcPag.getE01CUSNA1().trim()%>" readonly> 	</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Tipo de Cobranza :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="X01DCMTYP" size="20" maxlength="16" value="<%= dcPag.getE01DCMTYP().trim().equals("I") ? "RECIBIDA" : "ENVIADA" %>" readonly>
						<INPUT type="hidden" name="E01DCMTYP" value="<%= dcPag.getE01DCMTYP().trim() %>">
					</B></DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD nowrap width="16%">
					<DIV align="right"><B>Producto :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"><B>
						<INPUT type="text" name="E01DCMPRO" size="4" maxlength="4" value="<%=dcPag.getE01DCMPRO().trim()%>" readonly>
						<INPUT type="text" name="E01DSCPRO" size="37" maxlength="35" value="<%=dcPag.getE01DSCPRO().trim()%>" readonly>
					</B></DIV>
				</TD>	
				<TD nowrap width="16%">
					<DIV align="right"><B>Tipo de Operaci&oacute;n :</B></DIV>
				</TD>
				<TD nowrap width="16%"> <input type="hidden" name="E01TIPOPE" value="<%=dcPag.getE01TIPOPE()%>">
					<DIV align="left"><B>
						<% String valx = "";
							if (dcPag.getE01TIPOPE().equals("1"))
								valx = "Pago Total";
							else if	(dcPag.getE01TIPOPE().equals("2"))
								valx = "Pago Parcial";
							else if	(dcPag.getE01TIPOPE().equals("3"))
								valx = "Cobro de Comisiones";
							else if	(dcPag.getE01TIPOPE().equals("4"))
								valx = "Cancelaci&oacute;n";							
						 %>
					<input type="text" name="X01TIPOPE" size="30" maxlength="30" value="<%=valx%>" readonly>						 
					</B></DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="16%">
					<DIV align="right"><B>Moneda :</B></DIV>
				</TD>
				<TD nowrap width="20%">
					<DIV align="left">
						<INPUT type="text" name="E01CUSNA1" size="5" maxlength="5" value="<%=dcPag.getE01DCMCCY().trim()%>" readonly> 	</DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="right"><B>Monto a Pagar :</B></DIV>
				</TD>
				<TD nowrap width="16%">
					<DIV align="left"> <INPUT	type="text" name="E01MNTPAG" size="28" maxlength="35"	value="<%=dcPag.getE01MNTPAG()%>" readonly>
						</DIV>
				</TD>
			</TR>
			
			</TBODY></TABLE>
		</td>
	</tr>
</table>
<input type="hidden" name="E01CONDCA" value="<%= dcPag.getE01CONDCA()%>">
<br>  
<table class="tableinfo">
		    <TR id="trdark">
						  <TD width="25%" align="right" nowrap>Generar Swift MT400:</TD>
						  <TD nowrap width="25%"><INPUT type="radio" name="E01SWFMSG" value="Y">
						    Si
						    <INPUT type="radio" name="E01SWFMSG" value="N">
						    No </TD>
		    </TR> 
			  <TR id="trclear">
			    <TD align="right" nowrap>Banco Receptor:</TD>
			    <TD align="left" nowrap><INPUT type="text" name="E01SWFRCV" size="14" maxlength="12">
			     <INPUT TYPE=HIDDEN NAME="E01SWFRCV2" VALUE="">
			     <INPUT TYPE=HIDDEN NAME="E01SWFRCV3" VALUE="">
			     <INPUT TYPE=HIDDEN NAME="E01SWFRCV4" VALUE="">
			      <A href="javascript:GetSwiftIdDesc('E01SWFRCV','E01SWFRCV2','E01SWFRCV3','E01SWFRCV4')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda"  border="0"></A> </TD>
			  </TR>
			  
		</table>

<h4>Banco Intermediario</h4>
<table class="tableinfo">
	<tr>
		<td>
		<TABLE cellspacing="0" cellpadding="2" width="100%" border="0">
			<TBODY>
			  <TR id="trclear">
			    <TD align="right" nowrap width="50%">Codigo Swift:</TD>
			    <TD align="left" nowrap width="50%">
			    	<INPUT type="text" name="E01DCMRCI" size="14" maxlength="12" value="<%=dcPag.getE01DCMRCI()%>">
					<A href="javascript:GetSwiftIdDesc('E01DCMRCI','E01DCMRC1','E01DCMRC2','E01DCMRC3')"> 
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda"  border="0">
					</A> 
				 </TD>
			  </TR>
			<TR id="trdark">
				<TD>
					<DIV align="right">Nombre :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRC1" size="45" maxlength="35" value="<%=dcPag.getE01DCMRC1()%>">
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right">Dirección :</DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRC2" size="45" maxlength="35" value="<%=dcPag.getE01DCMRC2()%>">
					</DIV>
				</TD>
			</TR>
			<TR id="trdark">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRC3" size="45" maxlength="35" value="<%=dcPag.getE01DCMRC3()%>">
					</DIV>
				</TD>
			</TR>
			<TR id="trclear">
				<TD>
					<DIV align="right"></DIV>
				</TD>
				<TD>
					<DIV align="left">
						<INPUT type="text" name="E01DCMRC4" size="45" maxlength="35" value="<%=dcPag.getE01DCMRC4()%>">
					</DIV>
				</TD>
			</TR>
		</TBODY></TABLE>
		</td>
	</tr>
</table>

  <h4>Pago a trav&eacute;s de Banco Reembolsador</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		<TR id="trdark">
			<TD align="right" width="670">
				<DIV align="right">Vía de Reembolso :</DIV>
			</TD>
			<TD width="664">
				<SELECT name="E01REMVIA">
					<OPTION value=" " selected></OPTION>
					<!-- OPTION value="1" 	<%= dcPag.getE01REMVIA().equals("1")?"selected":"" %>>Cheque de Oficial</OPTION -->
					<OPTION value="2" 	<%= dcPag.getE01REMVIA().equals("2")?"selected":"" %>>Cuenta Corriente</OPTION>
					<OPTION value="3"	<%= dcPag.getE01REMVIA().equals("3")?"selected":"" %>>Cuenta Contable</OPTION>
					<!-- OPTION value="4" 	<%= dcPag.getE01REMVIA().equals("4")?"selected":"" %>>FED ( USA	)</OPTION -->
					<!-- OPTION value="5"	<%= dcPag.getE01REMVIA().equals("5")?"selected":"" %>>SWIFT</OPTION -->
					<!-- OPTION value="6"	<%= dcPag.getE01REMVIA().equals("6")?"selected":"" %>>Telex</OPTION -->
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" border="0" align="middle">
			</TD>
		</TR>
		<TR id="trclear">
			<TD width="670">
				<DIV align="right">Moneda de Reembolso :</DIV>
			</TD>
			<TD width="664">
				<DIV align="left"><INPUT type="text" name="E01REMCCY" size="4" maxlength="3" value="<%=dcPag.getE01REMCCY()%>">
				<A href="javascript:GetCurrency('E01REMCCY','')"><IMG	src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
				align="bottom" border="0"></A></DIV>
			</TD>
		</TR>
		<TR id="trdark">
			<TD width="670">
				<DIV align="right">Cuenta de Reembolso :</DIV>
			</TD>
			<TD width="664">
				<DIV align="left"><INPUT type="text" name="E01REMACC" size="17" maxlength="16" value="<%=dcPag.getE01REMACC()%>">
				<A href="javascript: helpAcc((document.forms[0].E01REMVIA.value == '2' ?'A': 'G'),'E01REMACC','01',document.forms[0].E01REMCCY.value)">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
				border="0" align="bottom"></A></DIV>
			</TD>
		</TR>
		<tr>
				  <TD align="right" nowrap>Tipo Mensaje Swift: </TD>
				  <TD align="left" nowrap>
				  	<SELECT name="E01REMSMT">
				  		<OPTION value=""></OPTION>
                      	<OPTION value="103">MT103</OPTION>
                      	<OPTION value="202">MT202</OPTION>
                  	</SELECT>
                  </TD>
		</Tr>	
		<TR id="trdark">
			    <TD align="right" nowrap>Banco Corresponsal:</TD>
			    <TD align="left" nowrap><INPUT type="text" name="E01CRPBID" size="14" maxlength="12">
			    <INPUT TYPE=HIDDEN NAME="E01CRPBID2" VALUE="">
			    <INPUT TYPE=HIDDEN NAME="E01CRPBID3" VALUE="">
			    <INPUT TYPE=HIDDEN NAME="E01CRPBID4" VALUE="">
			      <A href="javascript:GetSwiftIdDesc('E01CRPBID','E01CRPBID2','E01CRPBID3','E01CRPBID4')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda"  border="0"></A> </TD>
			  </TR>
		</table>
		</td>
	</tr>
</table>

  <h4>Liquidar con Cliente</h4>
<table class="tableinfo">
	<tr>
		<td>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
		<TR id="trdark">
			<TD align="right" width="671">
				<div align="right">Vía de Pago :</div>
			</TD>
			<TD width="663">
				<SELECT name="E01PAGVIA">
					<OPTION value=" " selected></OPTION>
					<OPTION value="2"	<%= dcPag.getE01PAGVIA().equals("2")?"selected":"" %>>Cuenta Corriente</OPTION>
					<OPTION value="3"	<%= dcPag.getE01PAGVIA().equals("3")?"selected":"" %>>Cuenta Contable</OPTION>
				</SELECT>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="mandatory field" border="0" align="middle">
			</TD>
		</TR>
		<TR id="trclear">
			<TD width="671">
				<DIV align="right">Moneda de Pago :</DIV>
			</TD>
			<TD width="663">
				<DIV align="left"><INPUT type="text" name="E01PAGCCY" size="4"
				maxlength="3" value="<%=dcPag.getE01PAGCCY()%>"> <A
				href="javascript:GetCurrency('E01PAGCCY','')"><IMG
				src="<%=request.getContextPath()%>/images/1b.gif" alt="help"
				align="bottom" border="0"></A></DIV>
			</TD>
		</TR>
		<TR id="trdark">
			<TD width="671">
				<DIV align="right">Número de Cuenta de Pago Principal :</DIV>
			</TD>
			<TD width="663">
				<DIV align="left"><INPUT type="text" name="E01PAGACCP" size="18"
				maxlength="16" value="<%=dcPag.getE01PAGACCP()%>"> <A
				href="javascript: helpAcc((document.forms[0].E01PAGVIA.value == '2' ?'A': 'G'),'E01PAGACCP','01',document.forms[0].E01PAGCCY.value)">
				<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
				border="0" align="bottom"></A></DIV>
			</TD>
		</TR>
		<%--
		<TR id="trclear" style="display:none">
			<TD width="671">
				<DIV align="right">Número de Cuenta de Pago de Comisión/Impuestos :</DIV>
			</TD>
			<TD width="663">
				<DIV align="left"><INPUT type="text" name="E01PAGACCC" size="18"
				maxlength="16" value="<%=dcPag.getE01PAGACCC()%>"> <A
				href="javascript: helpAcc((document.forms[0].E01PAGVIA.value == '2' ?'A': 'G'),'E01PAGACCC','01',document.forms[0].E01PAGCCY.value)">
			<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt=". . ."
				border="0" align="bottom"></A></DIV>
			</TD>
		</TR>
		--%>
		</table>
		</td>
	</tr>
</table>
<BR>
<div align="center"> 
    <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
</div>
<script type="text/javascript">
  document.forms[0].E01DCMACC.focus();
  document.forms[0].E01DCMACC.select();
</script>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
      error.setERRNUM("0");
 %>
     <SCRIPT type="text/javascript">
            showErrors();
     </SCRIPT>
 <%
 }
%>
</FORM>
<P><BR>

</BODY>
</HTML>
