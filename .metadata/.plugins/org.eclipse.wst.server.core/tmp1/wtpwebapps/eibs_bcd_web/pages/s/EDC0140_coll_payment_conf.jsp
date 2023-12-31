 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Negociaciones de Cartas de Creditos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<%@ page import = "datapro.eibs.master.Util, datapro.eibs.beans.EDC014002Message, datapro.eibs.beans.JBDC0060_trnsgl"  %>

<jsp:useBean id= "msg01" class= "datapro.eibs.beans.EDC014001Message"  scope="session"/>
<jsp:useBean id= "msg02" class= "datapro.eibs.beans.JBObjList"  scope="session"/>
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">
  builtNewMenu('dc0140_trn_inquiry');	
  initMenu();	
</SCRIPT>

</HEAD>

<BODY>
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEDC0140" onsubmit="return ValidConf()">
<INPUT type="hidden" name="SCREEN" value="4">
<INPUT type="hidden" name="H02FLGWK1" value="">

<H3 align="center"> Liquidacion de Cobranza
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="coll_payment_conf.jsp, EDC0140"></H3>
<HR size="4">
<BR>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"	class="tableinfo">
	<TBODY>
		<TR id="trdark">
			<TD nowrap width="16%">
			<DIV align="right"><B>Banco :</B></DIV>
			</TD>
			<TD nowrap width="20%">
			<DIV align="left"><INPUT type="text" name="E01DCMBNK" readonly 	size="3" maxlength="2" value="<%=msg01.getE01DCMBNK().trim()%>"></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="right"><B>N�mero de Cobranza :</B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="left"><B> <INPUT type="text" name="E01DCMACC" size="13" maxlength="12" value="<%=msg01.getE01DCMACC().trim()%>" readonly> </B></DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="16%">
			<DIV align="right"><B>Cliente :</B></DIV>
			</TD>
			<TD nowrap width="20%">
			<DIV align="left"><INPUT type="text" name="E01CUSNA1" size="37" maxlength="35" value="<%=msg01.getE01CUSNA1().trim()%>"></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="right"><B>Producto :</B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="left"><B> <INPUT type="text" name="E01DCMPRO" size="4" 	maxlength="4" value="<%=msg01.getE01DCMPRO().trim()%>" readonly> </B></DIV>
			</TD>
		</TR>
		<TR id="trdark">
			<TD nowrap width="16%">
			<DIV align="right"><B>Tipo de Cobranza :</B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="left"><B> <INPUT type="text" name="E01DSCTYP" size="20" maxlength="16" value="<%=msg01.getE01DSCTYP().trim()%>"> </B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="right"><B>Descripcion de Producto :</B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="left"><B> <INPUT type="text" name="E01DSCPRO" size="40" maxlength="30" value="<%=msg01.getE01DSCPRO().trim()%>" readonly> </B></DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<BR>
<BR>
<% 
	double TotalDeb = 0.00;
	double TotalCre = 0.00;
   	boolean glnzero = false;
%>

<TABLE  id="mainTable" class="tableinfo" width="100%">
	<tr height="5%">
		<td NOWRAP valign="top" width="100%">
			<TABLE id="headTable" width="100%">
        		<tr id="trdark">
					<th align="center" width="5%"><B>Agencia</B></th>
				    <th align="center" width="5%"><B>Moneda</B></th>
				    <th align="center" width="10%"><B>Cuenta Contable</B></th>
				    <th align="center" width="15%"><B>No. de Cuenta</B></th>
				    <th align="center" width="5%"><B>Cod.Trans.</B></th>
				    <th align="center" width="30%"><B>Descripcion</B></th>
				    <th align="center" width="15%"><B>Debito</B></th>
				    <th align="center" width="15%"><B>Credito</B></th>
        		</tr>
        	</TABLE>
        </td>		 
	</tr>
	<tr height="90%">
		<td NOWRAP valign="top" width="100%">
			<div id="dataDiv1" style="height:70% overflow:auto;">
				<table id=dataTable width="100%">
<%
						msg02.initRow();
						while (msg02.getNextRow()) {
							EDC014002Message msgPart = (EDC014002Message) msg02.getRecord();
							JBDC0060_trnsgl BDC0060 = new JBDC0060_trnsgl(msgPart.getE02TRNS01());
							if (BDC0060.getTRNAMT() > 0) {
       							TotalDeb +=  BDC0060.getTRNTYP().equals("D") ? BDC0060.getTRNAMT() : 0;
       							TotalCre +=  BDC0060.getTRNTYP().equals("C") ? BDC0060.getTRNAMT() : 0;
       							glnzero = !glnzero ? Double.valueOf(BDC0060.getTRNGLN()).longValue() == 0 : true;
%>
	  						<TR>
  	    						<TD align="center" width="5%"><INPUT type="text" name="CCY1" value="<%= BDC0060.getTRNBRN() %>" size="4" maxlength="4" readonly style="text-align: center"></TD>	
							    <TD align="center" width="5%"><INPUT type="text" name="CCY1" value="<%= BDC0060.getTRNCCY() %>" size="4" maxlength="4" readonly style="text-align: center"></TD>	
							    <TD align="center" width="10%"><INPUT type="text" name="GLN1" value="<%= BDC0060.getTRNGLN() %>" size="17" maxlength="16" readonly></TD>	    
							    <TD align="center" width="15%"><INPUT type="text" name="ACC1" value="<%= BDC0060.getTRNACC() %>" size="13" maxlength="13" readonly></TD>
							    <TD align="center" width="5%"><INPUT type="text" name="TCD1" value="<%= BDC0060.getTRNTCD() %>" size="5" maxlength="4" readonly style="text-align: center"></TD>	    
							    <TD align="center" width="30%"><INPUT type="text" name="DSC1" value="<%= BDC0060.getTRNDSC() %>" size="40" maxlength="30" readonly></TD>
							    <TD align="center" width="15%"><INPUT type="text" name="DEB1" value="<%= Util.formatCCY(BDC0060.getTRNTYP().equals("D") ? BDC0060.getTRNAMT() : 0) %>" size="17" maxlength="17" readonly style="text-align: right"></TD>
							    <TD align="center" width="15%"><INPUT type="text" name="CRE1" value="<%= Util.formatCCY(BDC0060.getTRNTYP().equals("C") ? BDC0060.getTRNAMT() : 0) %>" size="17" maxlength="17" readonly style="text-align: right"></TD>
	  						</TR>
<%
							}
						} 
%>               
				</table>
			</div>
		</td>		
	</tr>
	<tr height="5%">
		<td NOWRAP valign="top" width="100%">
			<TABLE id="headTable" width="100%">
  				<TR id="trdark">
     				<TD align="right" width="70%"><B>Totales</B></TD>
     				<TD align="center" width="15%"><B><INPUT type="text" name="TOTCRE" value="<%= Util.formatCCY(TotalDeb)  %>" size="17" maxlength="17" readonly style="text-align: right"></B></TD>
     				<TD align="center" width="15%"><B><INPUT type="text" name="TOTDEB" value="<%= Util.formatCCY(TotalCre) %>" size="17" maxlength="17" readonly style="text-align: right"></B></TD>
  				</TR>
			</TABLE>
		</td>
	</tr>		
</TABLE>
<BR>
<DIV align="center">
	<INPUT id="EIBSBTN" type=button name="Submit" value="Imprimir" onclick="javascript:eIBSPrint()">
</DIV>

</FORM>
</BODY>
</HTML>
