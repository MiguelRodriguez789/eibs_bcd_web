 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>Negociaciones de Cartas de Creditos</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V4.0 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="${pageContext.request.contextPath}/pages/style.css" rel="stylesheet">
<%@ page import = "datapro.eibs.master.Util" %>

<jsp:useBean id= "dcNew" class= "datapro.eibs.beans.EDC000001Message"  scope="session"/>
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="${pageContext.request.contextPath}/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);

   <%}%>
   <%if ("N".equals(dcNew.getE01DCMOPT())) {%>
		builtNewMenu('dc_d_inquiry_opening');
	   <% } else { %>
	   	builtNewMenu('dc_d_inquiry');
	   <% } %>
   initMenu();   
  function ValidConf(){
     if(document.forms[0].H02FLGWK1.value == "Y"){
        if(document.forms[0].GLNZERO.value == "Y"){
           alert("Error Cuenta Contable en Tabla de Comisiones");
           return false;
        }        
        if(document.forms[0].TOTDEB.value != document.forms[0].TOTCRE.value){
           alert("Debitos y Creditos no cuadran");
           return false;
        }   
     }
     return true;
  }
  
  function enviar(tipo) {
  	if (tipo == 'modi')
  		document.forms[0].H02FLGWK1.value='N';
  	else
  		document.forms[0].H02FLGWK1.value='Y';
  	
  	if (ValidConf())
  		document.forms[0].submit();
  }
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
<FORM method="post" action="${pageContext.request.contextPath}/servlet/datapro.eibs.products.JSEDC0060">
<INPUT type="hidden" name="SCREEN" value="4">
<INPUT type="hidden" name="H02FLGWK1" value="">

<H3 align="center">Transacciones de Apertura de Cobranza Documentaria<IMG src="${pageContext.request.contextPath}/images/e_ibs.gif" align="left" name="EIBS_GIF" title="dc_trans_doc.jsp, EDC0000"></H3>
<HR size="4">
<BR>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0"	class="tableinfo">
	<TBODY>
		<TR id="trdark">
			<TD nowrap width="16%">
			<DIV align="right"><B>Banco :</B></DIV>
			</TD>
			<TD nowrap width="20%">
			<DIV align="left"><INPUT type="text" name="E01DCMBNK" readonly 	size="4" maxlength="2" value="<%=dcNew.getE01DCMBNK().trim()%>"></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="right"><B>Número de Cobranza :</B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="left"><B> <INPUT type="text" name="E01DCMACC" size="12" maxlength="12" value="<%=dcNew.getE01DCMACC().trim()%>" readonly> </B></DIV>
			</TD>
		</TR>
		<TR id="trclear">
			<TD nowrap width="16%">
			<DIV align="right"><B>Cliente :</B></DIV>
			</TD>
			<TD nowrap width="20%">
			<DIV align="left"><INPUT type="text" name="E01CUSNA1" size="37" maxlength="35" value="<%=dcNew.getE01CUSNA1().trim()%>"></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="right"><B>Producto :</B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="left"><B> <INPUT type="text" name="E01DCMPRO" size="4" 	maxlength="4" value="<%=dcNew.getE01DCMPRO().trim()%>" readonly> </B></DIV>
			</TD>
		</TR>
		<TR id="trdark">
			<TD nowrap width="16%">
			<DIV align="right"><B>Tipo de Cobranza :</B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="left"><B> 
			<INPUT type="text" name="X01DCMTYP" size="20" maxlength="16" value="<%= dcNew.getE01DCMTYP().trim().equals("I") ? "RECIBIDA" : "ENVIADA" %>" readonly>
			<INPUT type="hidden" name="E01DCMTYP" value="<%= dcNew.getE01DCMTYP().trim() %>">
			</B>
			</DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="right"><B>Descripcion de Producto :</B></DIV>
			</TD>
			<TD nowrap width="16%">
			<DIV align="left"><B> <INPUT type="text" name="E01DSCPRO" size="30" maxlength="30" value="<%=dcNew.getE01DSCPRO().trim()%>" readonly> </B></DIV>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<BR>

<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
     <TD align="center" width="5%"><B>Agencia</B></TD>
     <TD align="center" width="5%"><B>Moneda</B></TD>
     <TD align="center" width="10%"><B>Cuenta Contable</B></TD>
     <TD align="center" width="15%"><B>No. de Cuenta</B></TD>
     <TD align="center" width="15%"><B>Centro de Costo</B></TD>
     <TD align="center" width="5%"><B>Cod.Trans.</B></TD>
     <TD align="center" width="40%"><B>Descripcion</B></TD>
     <TD align="center" width="15%"><B>Debito</B></TD>
     <TD align="center" width="15%"><B>Credito</B></TD>
  </TR>
	  <TR>
  	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= dcNew.getE01BNK01() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= dcNew.getE01CCY01() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= dcNew.getE01GLN01() %>" size="17" maxlength="16" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= dcNew.getE01ACC01() %>" size="13" maxlength="13" readonly></TD>
	    <TD align="center"><INPUT type="text" name="ACC1"
			value="<%= dcNew.getE01CCN01() %>" size="5" maxlength="3" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= dcNew.getE01TCD01() %>" size="3" maxlength="3" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= dcNew.getE01TRD01() %>" size="35" maxlength="45" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= dcNew.getE01DEB01() %>" size="17" maxlength="17" align="right" readonly></TD>
	    <TD align="center"><INPUT type="text" name="CRE1" value="<%= dcNew.getE01CRE01() %>" size="17" maxlength="17" align="right" readonly></TD>
	  </TR>
	  
  	  <TR>
  	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= dcNew.getE01BNK02() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="CCY1" value="<%= dcNew.getE01CCY02() %>" size="4" maxlength="4" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="GLN1" value="<%= dcNew.getE01GLN02() %>" size="17" maxlength="16" readonly></TD>	    
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= dcNew.getE01ACC02() %>" size="13" maxlength="13" readonly></TD>
	    <TD align="center"><INPUT type="text" name="ACC1"
			value="<%= dcNew.getE01CCN02() %>" size="5" maxlength="3" readonly></TD>	
	    <TD align="center"><INPUT type="text" name="ACC1" value="<%= dcNew.getE01TCD02() %>" size="3" maxlength="3" readonly></TD>
   	    <TD align="center"><INPUT type="text" name="DSC1" value="<%= dcNew.getE01TRD02() %>" size="35" maxlength="45" readonly></TD>
	    <TD align="center"><INPUT type="text" name="DEB1" value="<%= dcNew.getE01DEB02() %>" size="17" maxlength="17" align="right" readonly></TD>
	    <TD align="center"><INPUT type="text" name="CRE1" value="<%= dcNew.getE01CRE02() %>" size="17" maxlength="17" align="right" readonly></TD>
	  </TR>

 
</TABLE>

<BR>
<TABLE class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0">
  <TR id="trdark">
     <TD align="right" width="70%"><B>Totales</B></TD>
     <TD align="center" width="15%"><B><INPUT type="text" name="TOTCRE" value="<%= dcNew.getE01CRE02()  %>" size="17" maxlength="17" readonly></B></TD>
     <TD align="center" width="15%"><B><INPUT type="text" name="TOTDEB" value="<%= dcNew.getE01DEB01() %>" size="17" maxlength="17" readonly></B></TD>
  </TR>
</TABLE>

<BR>
<DIV align="center">
	<INPUT id="EIBSBTN" type=button name="Submit" value="Imprimir" onclick="javascript:eIBSPrint()">
</DIV>

</FORM>

</BODY>
</HTML>
