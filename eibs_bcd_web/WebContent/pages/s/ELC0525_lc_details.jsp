<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>Apertura de Carta de Credito Comercial</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msg050002" class="datapro.eibs.beans.ELC050002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

	builtNewMenu(lc_apr_cc_new);
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
<H3 align="center">Apertura de Carta de Credito Comercial
	<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_details.jsp, ELC0525"></H3> 
<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0525" >

  <INPUT NAME="SCREEN" TYPE=HIDDEN VALUE="5004" readonly="readonly">
  <INPUT NAME="MSG" TYPE=HIDDEN VALUE="ELC050002" readonly="readonly">
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
    <TR id="trdark">
      <TD width="20%" align="right" nowrap="nowrap"><B>Banco : </B></TD>
      <TD width="26%" nowrap="nowrap"><INPUT type="text" name="E02LCMBNK" 
							size="4" maxlength="2" value="<%=msg050002.getE02LCMBNK().trim()%>" readonly></TD>
      <TD width="25%" align="right" nowrap="nowrap"><B>N&uacute;mero de Carta de Credito : </B></TD>
      <TD width="29%" nowrap="nowrap"><B>
        <%if (msg050002.getE02LCMACC().trim().equals("999999999999"))
				{%>
        <INPUT type="text" size="12" maxlength="12" value="Nuevo" readonly>
        <INPUT name="E02LCMACC" type="hidden" disabled
							value="<%=msg050002.getE02LCMACC().trim()%>" readonly="readonly">
        <%}
				else
				{%>
        <INPUT type="text" name="E02LCMACC" size="14" maxlength="12"
							value="<%=msg050002.getE02LCMACC().trim()%>" readonly>
        <%}%>
      </B></TD>
    </TR>
    <TR>
      <TD align="right" nowrap="nowrap"><B>Nuestra Referencia : </B></TD>
      <TD nowrap="nowrap"><INPUT type="text" name="E02LCMORF" size="20"
							maxlength="16" value="<%=msg050002.getE02LCMORF().trim()%>" readonly></TD>
      <TD align="right" nowrap="nowrap"><B>Producto : </B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02LCMPRO" size="4"
							maxlength="4" value="<%=msg050002.getE02LCMPRO().trim()%>" readonly>
      </B></TD>
    </TR>
    <TR id="trdark">
      <TD align="right" nowrap="nowrap"><B>Referencia del Otro Banco : </B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02LCMTRF"
							size="20" maxlength="16" value="<%=msg050002.getE02LCMTRF().trim()%>" readonly>
      </B></TD>
      <TD align="right" nowrap="nowrap"><B>Descripcion del Producto : </B></TD>
      <TD nowrap="nowrap"><B>
        <INPUT type="text" name="E02DSCPRO"
							size="42" maxlength="35" value="<%=userPO.getHeader2().trim()%>" readonly>
      </B></TD>
    </TR>
  </TABLE>
  <BR>
<H4>Informaci�n de la Carta de Cr�dito</H4>
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY><TR id="trdark"> 
            <TD width="25%" align="right" nowrap>Fecha de Emisi�n: </TD>
            <TD nowrap width="25%"> 
				<eibsinput:date name="msg050002" fn_month="E02LCMIDM" fn_day="E02LCMIDD" fn_year="E02LCMIDY" readonly="true"/>		
            </TD>
            <TD width="25%" align="right" nowrap>Fecha de Expiraci�n: </TD>
            <TD nowrap width="27%"> 
				<eibsinput:date name="msg050002" fn_month="E02LCMEXM" fn_day="E02LCMEXD" fn_year="E02LCMEXY" readonly="true"/>
          </TD>
          </TR>   
           <TR id="trclear"> 
            <TD width="25%" align="right" nowrap>Ultima Fecha de Embarque: </TD>
            <TD nowrap width="25%"> 
				<eibsinput:date name="msg050002" fn_month="E02LCMSDM" fn_day="E02LCMSDD" fn_year="E02LCMSDY" readonly="true"/>
			</TD>
            <TD width="25%" align="right" nowrap>Fecha de Aviso/Confirmaci�n: </TD>
            <TD nowrap width="27%"> 
				<eibsinput:date name="msg050002" fn_month="E02LCMCNM" fn_day="E02LCMCND" fn_year="E02LCMCNY" readonly="true"/>
            </TD>
          </TR>                        
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap>Oficina: </TD>
            <TD nowrap width="25%">
              <INPUT name="E02LCMBRN" type="text" disabled value="<%= msg050002.getE02LCMBRN().trim()%>" size="5" maxlength="4" readonly="readonly">
            </TD>
            <TD width="25%" align="right" nowrap>Moneda y Tipo de Cambio M/E: </TD>
            <TD nowrap width="27%"> 
              <INPUT name="E02LCMFCY" type="text" disabled value="<%= msg050002.getE02LCMFCY().trim()%>" size="4" maxlength="3" readonly="readonly">
              <INPUT name="E02LCMOFX" type="text" disabled value="<%= msg050002.getE02LCMOFX().trim()%>" size="12" maxlength="11" readonly="readonly">
            </TD>
          </TR>                        
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap>Monto del Cr�dito: </TD>
            <TD nowrap width="25%"> 
            	<INPUT name="E02LCMOAM" type="text" onKeyPress="enterDecimal(event)" value="<%= msg050002.getE02LCMOAM().trim()%>" size="17" maxlength="16" readonly="readonly">
 				<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
			</TD>
            <TD width="25%" align="right" nowrap></TD>
            <TD nowrap width="27%"> 
             </TD>
          </TR>         
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap>Clausula de Aproximaci�n: </TD>
            <TD width="25%" align="left" nowrap> 
                	<INPUT name="E02LCMABC" type="radio" disabled value="Y" readonly="readonly" <% if(msg050002.getE02LCMABC().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMABC" type="radio" disabled value="N" readonly="readonly" <% if(msg050002.getE02LCMABC().equals("N")) out.print("checked");%>>No
    	        &nbsp; &nbsp; &nbsp; Porcentaje: <INPUT name="E02LCMABP" type="text" onKeyPress="enterInteger(event)"
				value="<%if(msg050002.getE02LCMABP().trim().length() == 1 && !msg050002.getE02LCMABP().trim().equals("0")) out.print("0");%><%= msg050002.getE02LCMABP().trim()%>" size="2" maxlength="2" readonly="readonly">
    	        <INPUT name="E02LCMAPM" type="text" onKeyPress="enterInteger(event)"
				value="<%if(msg050002.getE02LCMAPM().trim().length() == 1 && !msg050002.getE02LCMAPM().trim().equals("0")) out.print("0");%><%= msg050002.getE02LCMAPM().trim()%>" size="2" maxlength="2" readonly="readonly"></TD>
            <TD width="25%" align="right" nowrap>Incoterms: </TD>
            <TD nowrap width="27%"> 
              <INPUT name="E02LCMITR" type="text" value="<%= msg050002.getE02LCMITR().trim()%>" size="4" maxlength="4" readonly="readonly">
               			</TD>
          </TR>           
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap>Tenor: </TD>
            <TD nowrap width="25%"> 
				<SELECT name="E02LCMTNR" disabled>
                	<OPTION value=" "></OPTION>
                	<OPTION value="S" <% if(msg050002.getE02LCMTNR().equals("S")) out.print("selected");%>>Pago</OPTION>
                	<OPTION value="A" <% if(msg050002.getE02LCMTNR().equals("A")) out.print("selected");%>>Aceptaci�n</OPTION>
                	<OPTION value="M" <% if(msg050002.getE02LCMTNR().equals("M")) out.print("selected");%>>Pago Mixto</OPTION>
                	<OPTION value="D" <% if(msg050002.getE02LCMTNR().equals("D")) out.print("selected");%>>Pago Diferido</OPTION>
                	<OPTION value="N" <% if(msg050002.getE02LCMTNR().equals("N")) out.print("selected");%>>Negociaci�n</OPTION>
              	</SELECT>
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
            <TD width="25%" align="right" nowrap>Confirmada: </TD>
            <TD nowrap width="27%"> 
                	<INPUT name="E02LCMCNF" type="radio" disabled value="Y" readonly="readonly" <% if(msg050002.getE02LCMCNF().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMCNF" type="radio" disabled value="N" readonly="readonly" <% if(msg050002.getE02LCMCNF().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>   
          <TR id="trdark"> 
            <TD nowrap width="25%" align="right">Agregar Confirmacion: </TD>
            <TD nowrap width="25%" align="left">
                <% 
                	String test = msg050002.getE02LCMCNO().trim();
                	String confirm = null;
                	if(test.equalsIgnoreCase("Y")){
                		confirm =  "Confirmar (CONFIRM)";
                	}
                	else if(test.equalsIgnoreCase("N")){
                		confirm = "No Confirmar (WITHOUT)";
                	}
                	else if(test.equalsIgnoreCase("M")){
                		confirm = "Puede Confirmar (MAY ADD)";
                	}
                	else
                		confirm = ""; 
                %>
              	<INPUT name="E02LCMCNO" type="TEXT" size="28" readonly="readonly"  value = "<%= confirm %>">
			</TD>
            <TD width="25%" align="right" nowrap>Transferible: </TD>
            <TD nowrap width="25%"> 
                	<INPUT name="E02LCMTRN" type="radio" disabled value="Y" readonly="readonly" <% if(msg050002.getE02LCMTRN().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMTRN" type="radio" disabled value="N" readonly="readonly" <% if(msg050002.getE02LCMTRN().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>       
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap>Embarques Parciales: </TD>
            <TD nowrap width="25%"> 
                	<INPUT name="E02LCMPSH" type="radio" disabled value="Y" readonly="readonly" <% if(msg050002.getE02LCMPSH().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMPSH" type="radio" disabled value="N" readonly="readonly" <% if(msg050002.getE02LCMPSH().equals("N")) out.print("checked");%>>
                	No</TD>
            <TD width="25%" align="right" nowrap>Transbordo: </TD>
            <TD nowrap width="27%">
                	<INPUT name="E02LCMTSH" type="radio" disabled value="Y" readonly="readonly" <% if(msg050002.getE02LCMTSH().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMTSH" type="radio" disabled value="N" readonly="readonly" <% if(msg050002.getE02LCMTSH().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>  
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap>Agente/Representante: </TD>
            <TD nowrap width="25%"> 
            <INPUT name="E02LCMBRK" type="text" disabled value="<%= msg050002.getE02LCMBRK().trim()%>" size="3" maxlength="3" readonly="readonly"></TD>
            <TD width="25%" align="right" nowrap>% Garant�a Efectivo: </TD>
            <TD nowrap width="27%"> 
  			<INPUT name="E02LCMCPE" type="text" disabled onKeyPress="enterDecimal(event)" value="<%= msg050002.getE02LCMCPE().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
          </TR>   
          <TR id="trclear">
            <TD align="right" nowrap>N�mero Referencia ALADI: </TD>
            <TD nowrap><INPUT name="E02LCMSRF" type="text" disabled value="<%= msg050002.getE02LCMSRF().trim()%>" size="17" maxlength="16" readonly="readonly"></TD> 
            <TD width="25%" align="right" nowrap></TD>
            <TD nowrap width="27%"> 
            	</TD>
          </TR>        
          <TR id="trdark">
			  <TD width="25%" align="right" nowrap>Lugar de Expiraci&oacute;n: </TD>
				<TD nowrap width="25%"> 
				<INPUT name="E02LCMPLE" type="text" value="<%= msg050002.getE02LCMPLE().trim()%>" size="29" maxlength="29" readonly="readonly">
            <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
				
			<TD width="25%" align="right" nowrap>Referencia Pre-Aviso: </TD>
			<TD nowrap width="27%">
				<INPUT type="text" name="E02LCMRF1" size="18" maxlength="16" value="<%= msg050002.getE02LCMRF1().trim()%>" readonly>
			</TD>
			</TR>
			<TR id="trclear">
			  <% if (userPO.getID().equals("18") ) { %>		
              		<TD width="25%" align="right" nowrap>Notario: </TD>
              		<TD nowrap width="27%"><INPUT type="text" name="E02LCMUC5" size="6" maxlength="3" value="<%= msg050002.getE02LCMUC5().trim()%>"></TD>
			  <% } else {%>
				  	<TD width="25%" align="right" nowrap></TD>
				  	<TD width="25%" align="right" nowrap></TD>
			  <% } %>
				<TD width="25%" align="right" nowrap> </TD>
				<TD width="25%">
					
				</TD>
			</TR>
				<TR id="trdark">
					<TD width="25%" align="right" nowrap>Reglas a Aplicar: </TD>
					<TD nowrap width="27%" colspan="3"><SELECT name="E02LCMAPR" disabled>
						<OPTION value=""></OPTION>
						<OPTION value="1" <% if(msg050002.getE02LCMAPR().equals("1")) out.print("selected");%>>UCP Latest Version</OPTION>
						<OPTION value="2" <% if(msg050002.getE02LCMAPR().equals("2")) out.print("selected");%>>EUCP Latest Version</OPTION>
						<OPTION value="3" <% if(msg050002.getE02LCMAPR().equals("3")) out.print("selected");%>>UCPURR Latest Version</OPTION>
						<OPTION value="4" <% if(msg050002.getE02LCMAPR().equals("4")) out.print("selected");%>>EUCPURR Latest Version</OPTION>
						<OPTION value="5" <% if(msg050002.getE02LCMAPR().equals("5")) out.print("selected");%>>ISP Latest Version</OPTION>
						<OPTION value="6" <% if(msg050002.getE02LCMAPR().equals("6")) out.print("selected");%>>Other</OPTION>
					</SELECT> <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
					<INPUT name="E02LCMST3" type="text" value="<%= msg050002.getE02LCMST3().trim()%>" size="40" maxlength="35" readonly="readonly"></TD>
				</TR>
				<TR id="trclear">
			  <TD width="25%" align="right" nowrap>Lugar de&nbsp;Recepci&oacute;n Mercancia: </TD>
				<TD nowrap width="27%" colspan="3">
                <INPUT name="E02LCMPLR" type="text" value="<%= msg050002.getE02LCMPLR().trim()%>" size="65" maxlength="65" readonly="readonly"></TD>
			 </TR>
				<TR id="trdark">
				  <TD width="25%" align="right" nowrap>Puerto/Aeropuerto de Salida: </TD>
					<TD nowrap width="27%" colspan="3">
            <INPUT name="E02LCMPOL" type="text" value="<%= msg050002.getE02LCMPOL().trim()%>" size="65" maxlength="65" readonly="readonly"></TD>
				</TR>
				<TR id="trclear">
				<TD width="25%" align="right" nowrap>Puerto/Aeropuerto de Destino: </TD>
					<TD nowrap width="27%" colspan="3"><INPUT name="E02LCMPOD" type="text" value="<%= msg050002.getE02LCMPOD().trim()%>" size="65" maxlength="65" readonly="readonly"></TD>
				</TR>
			<TR id="trdark">
				<TD width="25%" align="right" nowrap>Lugar de Entrega Mercancia: </TD><TD nowrap width="27%" colspan="3">
				<INPUT name="E02LCMPLD" type="text" value="<%= msg050002.getE02LCMPLD().trim()%>" size="65" maxlength="65" readonly="readonly"></TD>
			</TR>
				<TR id="trclear">
				  <TD align="right" nowrap>Credito Disponible Con: </TD>
				  <TD align="left" nowrap><INPUT name="E02LCMAWI" type="text" value="<%= msg050002.getE02LCMAWI().trim()%>" size="14" maxlength="12" readonly="readonly">
				  </TD>
				  <TD align="right" nowrap>Banco Girado: </TD>
				  <TD align="left" nowrap><INPUT name="E02LCMDWI" type="text" value="<%= msg050002.getE02LCMDWI().trim()%>" size="14" maxlength="12" readonly="readonly">
			      </TD>
		     </TR>
				<TR id="trdark">
                  <TD align="right" nowrap>Cargos O/B por Cuenta de: </TD>
				  <TD align="left" nowrap><SELECT name="E02LCMOBC" disabled>
                      <OPTION value=" "></OPTION>
                      <OPTION value="A" <% if(msg050002.getE02LCMOBC().equals("A")) out.print("selected");%>>Aplicante</OPTION>
                      <OPTION value="B" <% if(msg050002.getE02LCMOBC().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
                    </SELECT>
				  </TD>
				  <TD align="right" nowrap></TD>
				  <TD align="left" nowrap>
                  </TD>
		     </TR>
		     <TR id="trclear">
                  <TD align="right" nowrap>Nro. de Dias: </TD>
				  <TD align="left" nowrap><INPUT type="text" name="E02LCMTRM" size="5" maxlength="3" value="<%= msg050002.getE02LCMTRM().trim()%>" readonly="readonly"></TD>

				  <TD align="right" nowrap>C�digo T&eacute;rmino: </TD>
				  <TD align="left" nowrap>
				  <SELECT name="E02LCMTRC" disabled >
				                	<OPTION value="  " <% if ((!msg050002.getE02LCMTRC().equals("AS")) && (!msg050002.getE02LCMTRC().equals("BE")) && (!msg050002.getE02LCMTRC().equals("BL")) && (!msg050002.getE02LCMTRC().equals("CC")) && (!msg050002.getE02LCMTRC().equals("FD")) && (!msg050002.getE02LCMTRC().equals("FP")) && (!msg050002.getE02LCMTRC().equals("GA")) && (!msg050002.getE02LCMTRC().equals("ID")) && (!msg050002.getE02LCMTRC().equals("ST")) && (!msg050002.getE02LCMTRC().equals("TD"))) out.println("selected"); %>></OPTION>
			                		<OPTION value="AS" <% if (msg050002.getE02LCMTRC().equals("AS")) out.println("selected"); %>>A la vista</OPTION>
			                		<OPTION value="BE" <% if (msg050002.getE02LCMTRC().equals("BE")) out.println("selected"); %>>Despu�s de Fecha de Letra de Cambio</OPTION>
		                			<OPTION value="BL" <% if (msg050002.getE02LCMTRC().equals("BL")) out.println("selected"); %>>Despu�s de Fecha de Embarque</OPTION>
		                			<OPTION value="CC" <% if (msg050002.getE02LCMTRC().equals("CC")) out.println("selected"); %>>Despu�s de Pase de Mercanc�a por Aduana</OPTION>
				                 	<OPTION value="FD" <% if (msg050002.getE02LCMTRC().equals("FD")) out.println("selected"); %>>Despu�s de Pase de Mercanc�a por Revisi�n</OPTION>
			                		<OPTION value="FP" <% if (msg050002.getE02LCMTRC().equals("FP")) out.println("selected"); %>>Primera Presentaci�n</OPTION>
			                		<OPTION value="GA" <% if (msg050002.getE02LCMTRC().equals("GA")) out.println("selected"); %>>Despu�s de Arribo de Mercanc�a</OPTION>
			                		<OPTION value="ID" <% if (msg050002.getE02LCMTRC().equals("ID")) out.println("selected"); %>>Despu�s de Fecha de Factura</OPTION>
				                	<OPTION value="ST" <% if (msg050002.getE02LCMTRC().equals("ST")) out.println("selected"); %>>Despu�s de Entregado</OPTION>
					                <OPTION value="TD" <% if (msg050002.getE02LCMTRC().equals("TD")) out.println("selected"); %>>Despu�s de Fecha de Doc. de Transporte</OPTION>
			                    </SELECT>
				</TD>
		     	</TR>

				<TR id="trdark">
                  <TD align="right" nowrap>Flete: </TD>
				  <TD align="left" nowrap>
				  <SELECT name="E02LCMFRC" disabled>
                        		<OPTION value=" "></OPTION>
            	            	<OPTION value="P" <% if(msg050002.getE02LCMFRC().equals("P")) out.print("selected");%>>Pagado</OPTION>
                         		<OPTION value="C" <% if(msg050002.getE02LCMFRC().equals("C")) out.print("selected");%>>Al Cobro</OPTION>
                    	</SELECT>
                    	</TD>

				  <TD align="right" nowrap></TD>
				  <TD align="left" nowrap>
             	        
				</TD>
		     	</TR>
			<% if(msg050002.getH02FLGWK3().equals("Y")){ %>
			 <TR id="trclear">
				  <TD width="25%" align="right" nowrap>Tipo de Inter&eacute;s: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMICT" type="text" disabled="disabled" value="<%= msg050002.getE02LCMICT().trim()%>" size="1" maxlength="1" readonly="readonly"></TD>
				  <TD width="25%" align="right" nowrap>Tasa de Inter&eacute;s: </TD>
				  <TD nowrap width="27%"><INPUT name="E02LCMIRT" type="text" disabled value="<%= msg050002.getE02LCMIRT().trim()%>" size="9" maxlength="9" readonly="readonly"></TD>
				</TR>
				<TR id="trdark">
				  <TD width="25%" align="right" nowrap>Tabla / Tipo de Tasa Flotante: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMFTB" type="text" disabled value="<%= msg050002.getE02LCMFTB().trim()%>" size="2" maxlength="2" readonly="readonly">
                      <SELECT name="E02LCMFTY" disabled="disabled">
                        <OPTION value=" "> </OPTION>
                        <OPTION value="FP">Tasa Primaria</OPTION>
                        <OPTION value="FS" <% if(msg050002.getE02LCMOCI().equals("FS")) out.print("selected");%>>Tasa Secundaria</OPTION>
                    </SELECT></TD>
				  <TD width="25%" align="right" nowrap>Per&iacute;odo Base Calc.Intereses: </TD>
				  <TD nowrap width="27%"><INPUT name="E02LCMBAS" type="text" disabled onKeyPress="enterInteger(event)" value="<%= msg050002.getE02LCMBAS().trim()%>" size="3" maxlength="3" readonly="readonly"></TD>
			</TR>
		     <TR id="trclear">
					<TD nowrap width="25%" align="right">Condonar Intereses en Cancelacion: </TD>
					<TD nowrap width="25%">
					   <INPUT type="radio" name="E02LCMWIF" disabled value="Y" readonly="readonly" <% if(msg050002.getE02LCMWIF().equals("Y")) out.print("checked");%>>Si
                	   <INPUT type="radio" name="E02LCMWIF" disabled value="N" readonly="readonly" <% if(msg050002.getE02LCMWIF().equals("N")) out.print("checked");%>>No  
					</TD>
				    <TD nowrap width="25%" align="right">Cuenta de Repago de Intereses: </TD>
					<TD nowrap width="25%">
				       <INPUT type="text" name="E02LCMIPA" size="17" maxlength="12" value="<%= msg050002.getE02LCMIPA().trim()%>" readonly="readonly">
					</TD>
		     
			</TR>
		    <% } %>
			<TR id="trdark">
				  <TD width="25%" align="right" nowrap>Generar Swift: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMSWF" type="radio" disabled value="Y" readonly="readonly" <% if(msg050002.getE02LCMSWF().equals("Y")) out.print("checked");%>>
				    Si
				    <INPUT name="E02LCMSWF" type="radio" disabled value="N" readonly="readonly" <% if( !msg050002.getE02LCMSWF().equals("Y")) out.print("checked");%>>
				    No </TD>
				  <TD nowrap>&nbsp;</TD>
				  <TD nowrap>&nbsp;</TD>
			</TR>
		  </TBODY></TABLE>
      </TD>
    </TR>
  </TABLE>  
<BR>
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>
           <TR id="trclear"> 
            <TD width="25%" align="right" nowrap>Monto Garant�a Efectivo: </TD>
            <TD nowrap width="25%"> 
				<INPUT name="E02LCMCAM" type="text" disabled onKeyPress="enterDecimal(event)" value="<%= msg050002.getE02LCMCAM().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
            <TD width="25%" align="right" nowrap>Cuenta Garant�a Efectivo: </TD><TD nowrap width="27%">
					<TABLE  id="trdark">
						<TBODY>
							<TR id="trdark">
								<TD rowspan="2"><INPUT name="E02LCMCCA" type="text" disabled value="<%= msg050002.getE02LCMCCA().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
							</TR></TBODY>
					</TABLE>
					</TD>
          </TR>
          <TR id="trdark"> 
			<TD align="right" nowrap>Linea de Cr&eacute;dito del Cliente: </TD>
            <TD nowrap>
            	<INPUT type="text" name="E02LCMLNR" size="10" maxlength="9" value="<%= msg050002.getE02LCMLNR().trim()%>" readonly="readonly" >
                <INPUT type="text" name="E02LCMCMN" size="4" maxlength="4" value="<%= msg050002.getE02LCMCMN().trim()%>" readonly="readonly" >
			</TD> 
            <TD width="25%" align="right" nowrap>Centro de Costo: </TD>
            <TD nowrap width="25%"><input type="text" name="E02LCMCCN" size="9" maxlength="8" value="<%= msg050002.getE02LCMCCN().trim()%>" readonly="readonly" >
			</TD>
          </TR>
			<TR id="trclear"> 
            	<TD nowrap width="25%" align="right">Tarifa del Cliente: </TD>
            	<TD nowrap width="25%"> 
					<INPUT type="text" name="E02LCMTAR" size="2" maxlength="2" value="<%= msg050002.getE02LCMTAR().trim()%>" readonly="readonly" >
            		<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
            	<TD align="right" nowrap>Nuestros Cargos por Cuenta de: </TD>
           		 <TD nowrap width="25%" align="left" nowrap>
            		<SELECT name="E02LCMAOB" disabled>
                		<OPTION value=" "></OPTION>
                		<OPTION value="A" <% if(msg050002.getE02LCMAOB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
                		<OPTION value="B" <% if(msg050002.getE02LCMAOB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
              		</SELECT>
                	<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
                </TD>
			</TR>
          <TR id="trdark">
            <TD width="25%" align="right" nowrap>Cuenta Debito Comisiones: </TD>
			<TD width="25%">
				<INPUT type="text" name="E02LCMSCA" size="17" maxlength="12" value="<%= msg050002.getE02LCMSCA().trim()%>" readonly="readonly" >
			</TD>
             <TD width="25%" align="right" nowrap>Com.Apertura D&iacute;a Emisi&oacute;n: </TD>
            <TD nowrap width="25%">
                	<INPUT type="radio" name="E02LCMOCI" value="Y" <% if(msg050002.getE02LCMOCI().equals("Y")) out.print("checked");%> readonly="readonly" disabled>Si
                	<INPUT type="radio" name="E02LCMOCI" value="N" <% if(msg050002.getE02LCMOCI().equals("N")) out.print("checked");%> readonly="readonly" disabled>
                	No</TD>
          </TR>        
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap>Com.Enmienda D�a Enmienda:  </TD>
            <TD nowrap width="27%">
                	<INPUT type="radio" name="E02LCMACI" value="Y" <% if(msg050002.getE02LCMACI().equals("Y")) out.print("checked");%> readonly="readonly" disabled>Si
                	<INPUT type="radio" name="E02LCMACI" value="N" <% if(msg050002.getE02LCMACI().equals("N")) out.print("checked");%> readonly="readonly" disabled>
                	No</TD>
            <TD width="25%" align="right" nowrap></TD>
            <TD nowrap width="27%">
        	</TD>
          </TR>
		  </TBODY></TABLE>
      </TD>
    </TR>
  </TABLE>
</FORM>
</BODY>
</HTML>
