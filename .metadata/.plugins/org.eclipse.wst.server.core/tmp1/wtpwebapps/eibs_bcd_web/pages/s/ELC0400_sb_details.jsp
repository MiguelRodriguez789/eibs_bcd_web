<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>Letter of Credit Details</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msg" class="datapro.eibs.beans.ELC040002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   		initMenu();
   <%} else {%>
<%if (!userPO.getPurpose().equals("NEW")){%>
	builtNewMenu(sb_opening);
	initMenu();
<%}%>
   <%}%>
function enviarSubmit() {
	getElement("EIBSBTN").disabled = true;
	document.forms[0].submit();
}

function finalizarSubmit() {
	getElement("FLAG").value="Y";
	getElement("btnFinalizarID").disabled = true;
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
<H3 align="center"><%= (msg.getE02LCMOPT().equals("N") ? "Apertura" : "Mantenimiento") %> de Carta de Crédito Standby <IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="sb_details, ELC0400"></H3> 

<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0400">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="6">

<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo">
					<TR id="trdark">
						<TD nowrap width="16%" align="right"><B>Banco : </B></TD>
						<TD nowrap width="20%">
						<INPUT type="text" name="E02LCMBNK" size="4" maxlength="2" value="<%=msg.getE02LCMBNK().trim()%>" readonly></TD>
						<TD nowrap width="16%" align="right"><B>Número de Carta de Credito : </B></TD>
						<TD nowrap width="16%">
						<DIV align="left"><B> <%if (msg.getE02LCMACC().trim().equals("999999999999"))
				{%> <INPUT type="text" size="12" maxlength="12" value="Nuevo"
							readonly> <INPUT type="hidden" name="E02LCMACC"
							value="<%=msg.getE02LCMACC().trim()%>" readonly> <%}
				else
				{%> <INPUT type="text" name="E02LCMACC" size="14" maxlength="12"
							value="<%=(msg.getE02LCMACC().trim().equals("0") ? userPO.getIdentifier() : msg.getE02LCMACC().trim() )%>" readonly> <%}%> </B></DIV>
						</TD>
					</TR>
					<TR>
						<TD nowrap width="16%" align="right"><B>Nuestra Referencia : </B>
						</TD>
						<TD nowrap width="20%" align="left"><INPUT type="text" name="E02LCMORF" size="20"
							maxlength="16" value="<%=msg.getE02LCMORF().trim()%>" readonly>
						</TD>
						<TD nowrap width="16%" align="right"><B>Producto : </B></TD>
						<TD nowrap width="16%" align="left"><B> <INPUT type="text" name="E02LCMPRO" size="4"
							maxlength="4" value="<%=msg.getE02LCMPRO().trim()%>" readonly>
						</B></TD>

					</TR>
					<TR id="trdark">
						<TD width="16%" align="right" nowrap><B>Referencia del Otro Banco : </B></TD>
						<TD nowrap width="16%"><B> <INPUT type="text" name="E02LCMTRF"
							size="20" maxlength="16" value="<%=msg.getE02LCMTRF().trim()%>" readonly>
						</B></TD>

						<TD nowrap width="16%" align="right"><B>Descripción del Producto : </B></TD>
						<TD nowrap width="16%" align="left"><B><INPUT type="text" name="E02DSCPRO"
							size="40" maxlength="35" value="<%=userPO.getHeader2().trim()%>"
							readonly> </B></TD>

					</TR>
				</TABLE>

  <%  if (!"N".equals(msg.getE02LCMOPT())){ %>
  <H4>Tipo de Operación</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark">
                <TD nowrap width="16%"align="right"><B>Enmienda : </B></TD>
                <TD nowrap width="20%" align="left">
                  <% if (msg.getE02LCMAMF().equals("Y")) out.print("YES"); else out.print("NO");%>
                  <INPUT type="HIDDEN" name="E02LCMLAN"	value="<%= msg.getE02LCMLAN().trim()%>"></TD>
                <TD nowrap width="16%"align="right"><B>Ultima Enmienda : </B></TD>
                <TD nowrap width="16%">
                	<DIV align="left"><B><INPUT type="text" name="E02LCMLAN" size="4" maxlength="4" value="<%= msg.getE02LCMLAN().trim()%>" disabled></B></DIV>
                  	<INPUT type="HIDDEN" name="E02LCMLAN" value="<%= msg.getE02LCMLAN().trim()%>">
                </TD>
                <TD nowrap width="16%"align="right"><B>Fecha Ultima Enmienda : </B></TD>
                <TD nowrap width="16%" align="left">
						<eibsinput:date name="msg" fn_month="E02LCMLAM" fn_day="E02LCMLAD" fn_year="E02LCMLAY" readonly="true"/>
                 </TD>
              </TR>
            </TBODY>
          </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
    <% }%>
    
<H4>Información de la Carta de Crédito</H4> 
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>
           <TR id="trdark"> 
            <TD nowrap width="25%" align="right">Fecha de Emisión: </TD>
            <TD nowrap width="25%"> 
				<eibsinput:date name="msg" fn_month="E02LCMIDM" fn_day="E02LCMIDD" fn_year="E02LCMIDY" required="true"/>
            </TD>
            <TD nowrap width="25%" align="right"> Fecha de Expiración: </TD>
            <TD nowrap width="27%"> 
				<eibsinput:date name="msg" fn_month="E02LCMEXM" fn_day="E02LCMEXD" fn_year="E02LCMEXY" required="true"/>
            </TD>
          </TR>   
           <TR id="trclear"> 
            <TD nowrap width="25%" align="right">Fecha de Aviso/Confirmación: </TD>
            <TD nowrap width="25%"> 
				<eibsinput:date name="msg" fn_month="E02LCMCNM" fn_day="E02LCMCND" fn_year="E02LCMCNY" required="false"/>
            </TD>
            <TD nowrap width="25%" align="right">Oficina: </TD>
            <TD nowrap width="25%">   
			<% if (msg.getE02LCMOPT().equals("N")) { %>			
              <INPUT type="text" name="E02LCMBRN" size="5" maxlength="3" value="<%= msg.getE02LCMBRN().trim() %>"  <%= ( !msg.getE02LCMOPT().equals("N") ? "readonly" : "" ) %>>
				<A href="javascript:GetBranch('E02LCMBRN',document.forms[0].E02LCMBNK.value,'')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
			<% } else { %>
              <INPUT type="text" name="E02LCMBRN" size="5" maxlength="3" value="<%= msg.getE02LCMBRN().trim() %>"  readonly = "readonly">
				<img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0">
			<% } %>
			</TD>
          </TR>         
           <TR id="trdark"> 
			<TD nowrap width="25%" align="right">Moneda y Tipo de Cambio: </TD>
            <TD nowrap width="25%"><INPUT type="text" name="E02LCMFCY" size="4" maxlength="4" value="<%= msg.getE02LCMFCY().trim()%>" readonly>
            <%if(currUser.getE01INT()==null||currUser.getE01INT().compareTo("18")!=0){%>
            <A href="javascript:GetCurrency('E02LCMFCY','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
			<%}%> 
            <INPUT type="text" name="E02LCMOFX" size="12" maxlength="11" value="<%= msg.getE02LCMOFX().trim() %>" 
            	onKeyPress="enterDecimal(6)" <%= msg.getE02LCMOPT().equals("N") ? "" : "readonly" %>>
            </TD>
            <TD nowrap width="25%" align="right">Monto del Crédito: </TD><TD nowrap width="27%">
            <INPUT type="text" name="E02LCMOAM" size="17" maxlength="16" value="<%= msg.getE02LCMOAM().trim()%>" 
             <%= ( msg.getE02LCMOPT().equals("N") ? "onKeyPress=\"enterDecimal(event)\"" : "disabled=\"disabled\"" )%>>
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
          </TR>           
          <TR id="trclear">
            <TD nowrap align="right">Confirmada: </TD>
            <TD nowrap><INPUT type="radio" name="E02LCMCNF" value="Y" <% if(msg.getE02LCMCNF().equals("Y")) out.print("checked");%>>
              Si
              <INPUT type="radio" name="E02LCMCNF" value="N" <% if(msg.getE02LCMCNF().equals("N")) out.print("checked");%>>
              No </TD> 
            <TD nowrap align="right">Agregar Confirmación: </TD>
             <TD align="left" nowrap><SELECT name="E02LCMCNO">
                  <OPTION value=" "></OPTION>
                  <OPTION value="Y" <% if(msg.getE02LCMCNO().equals("Y")) out.print("selected");%>>Confirmar (CONFIRM)</OPTION>
                  <OPTION value="N" <% if(msg.getE02LCMCNO().equals("N")) out.print("selected");%>>No Confirmar (WITHOUT)</OPTION>
                  <OPTION value="M" <% if(msg.getE02LCMCNO().equals("M")) out.print("selected");%>>Puede Confirmar (MAY ADD)</OPTION>
                </SELECT>             
              </TD>
          </TR>   
          <TR id="trdark">
            <TD nowrap align="right">Tenor: </TD>
            <TD nowrap><SELECT name="E02LCMTNR" disabled="disabled">
                <OPTION value="S" <% if(msg.getE02LCMTNR().equals("S")) out.print("selected");%>>Pago</OPTION>
                <OPTION value="A" <% if(msg.getE02LCMTNR().equals("A")) out.print("selected");%>>Aceptaci&oacute;n</OPTION>
                <OPTION value="M" <% if(msg.getE02LCMTNR().equals("M")) out.print("selected");%>>Pago Mixto</OPTION>
                <OPTION value="D" <% if(msg.getE02LCMTNR().equals("D")) out.print("selected");%>>Pago Diferido</OPTION>
                <OPTION value="N" <% if(msg.getE02LCMTNR().equals("N")) out.print("selected");%>>Negociaci&oacute;n</OPTION>
              </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD> 
            <TD nowrap align="right">Boleta de Garantia : </TD>
            <TD nowrap>
            	<INPUT type="radio" name="E02BOLETA" value="Y" <% if(msg.getE02BOLETA().equals("Y")) out.print("checked");%>> Si
            	<INPUT type="radio" name="E02BOLETA" value="N" <% if(msg.getE02BOLETA().equals("N")) out.print("checked");%>> No 
            </TD> 
          </TR>   
				<TR id="trclear">
				  <TD nowrap width="25%" align="right">Reglas a Aplicar: </TD>
				  <TD nowrap width="25%">
				  	<SELECT name="E02LCMAPR">
                		<OPTION value="0">NONE</OPTION>
                		<OPTION value="7" <% if(msg.getE02LCMAPR().equals("7")) out.print("selected");%>>ICC URCG</OPTION>
                		<OPTION value="8" <% if(msg.getE02LCMAPR().equals("8")) out.print("selected");%>>ICC URDG</OPTION>
				    	<OPTION value="9" <% if(msg.getE02LCMAPR().equals("9")) out.print("selected");%>>ISP - Ultima Versión</OPTION>  
                		<OPTION value="6" <% if(msg.getE02LCMAPR().equals("6")) out.print("selected");%>>Other</OPTION>
              		</SELECT>  
  			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"><INPUT type="text" name="E02LCMST3"
						size="30" maxlength="25" value="<%= msg.getE02LCMST3().trim()%>"></TD>
				  <TD nowrap width="25%" align="right">Lugar de Expiración: </TD>
				  <TD nowrap width="27%"><INPUT type="text" name="E02LCMPLE" size="37" maxlength="29" value="<%= msg.getE02LCMPLE().trim()%>"></TD>
				</TR>
				<TR id="trdark">
				  <TD align="right" nowrap>Renovación Automática: </TD>
				  <TD align="left" nowrap><INPUT type="radio" name="E02LCMEVF" value="Y" <% if(msg.getE02LCMEVF().equals("Y")) out.print("checked");%>>
				    Si
				    <INPUT type="radio" name="E02LCMEVF" value="N" <% if( !msg.getE02LCMEVF().equals("Y")) out.print("checked");%>>
				    No </TD>
				  <TD nowrap align="right"></TD>
				  <TD nowrap></TD>
			 </TR>
				<TR id="trclear">
				  <TD align="right" nowrap>Días Límite de Aviso No-Renovación: </TD>
				  <TD align="left" nowrap><INPUT type="text" name="E02LCMNRD" size="3" maxlength="3" value="<%= msg.getE02LCMNRD().trim()%>" onKeyPress="enterInteger(event)"></TD>
				  <TD align="right" nowrap>Período de Prórroga / Renovación: </TD>
				  <TD align="left" nowrap><INPUT type="text" name="E02LCMRDY" size="3" maxlength="3" value="<%= msg.getE02LCMRDY().trim()%>" onKeyPress="enterInteger(event)">
				<SELECT name="E02LCMFL1">
                    <OPTION value="D" <% if(msg.getE02LCMFL1().equals("D")) out.print("selected");%>>Dias</OPTION>
                    <OPTION value="M" <% if(msg.getE02LCMFL1().equals("M")) out.print("selected");%>>Meses</OPTION>
                    <OPTION value="Y" <% if(msg.getE02LCMFL1().equals("Y")) out.print("selected");%>>Anos</OPTION>
                  </SELECT></TD>
			 </TR>
				<TR id="trdark">
				  <TD align="right" nowrap>Generar Swift: </TD>
				  <TD align="left" nowrap><INPUT type="radio" name="E02LCMSWF" value="Y" <% if(msg.getE02LCMSWF().equals("Y")) out.print("checked");%>>
				    Si
				    <INPUT type="radio" name="E02LCMSWF" value="N" <% if( !msg.getE02LCMSWF().equals("Y")) out.print("checked");%>>
				    No </TD>
				  <TD align="right" nowrap>Tipo de Mensaje Swift: </TD>
				  <TD align="left" nowrap><SELECT name="E02LCMSMT">
				   <% 
				   	  	if (msg.getE02LCMTYP().equals("S")) {
				   	  	// STAND BY EMITIDA 
							if (msg.getE02LCMOPT().equals("N")) { 
					   	  	// STAND BY EMITIDA / APERTURA	
				   %>  
                      <OPTION value="760" <% if(msg.getE02LCMSMT().equals("760")) out.print("selected");%>>MT760</OPTION>
                      <OPTION value="730" <% if(msg.getE02LCMSMT().equals("730")) out.print("selected");%>>MT730</OPTION>
                      <OPTION value="700" <% if(msg.getE02LCMSMT().equals("700")) out.print("selected");%>>MT700</OPTION>
                                            
                   <% 	} else {
                   		// STAND BY EMITIDA / MANTENIMIENTO	 
                   %>   
                      <OPTION value="707" <% if(msg.getE02LCMSMT().equals("707")) out.print("selected");%>>MT707</OPTION>
                      <OPTION value="767" <% if(msg.getE02LCMSMT().equals("767")) out.print("selected");%>>MT767</OPTION>
                      <OPTION value="768" <% if(msg.getE02LCMSMT().equals("768")) out.print("selected");%>>MT768</OPTION>
                      <OPTION value="769" <% if(msg.getE02LCMSMT().equals("769")) out.print("selected");%>>MT769</OPTION>
                      <%if(msg.getE02LCMAMF().equals("Y")) {%>
                      	<OPTION value="730" <% if(msg.getE02LCMSMT().equals("730")) out.print("selected");%>>MT730</OPTION>
                      <%}%>
                                            
				   <%	} 
				   	  } 
				   	  else { // STAND BY RECIBIDA
				   	  	if (msg.getE02LCMOPT().equals("N")) {
					   	  	// STAND BY RECIBIDA / APERTURA	
				   %>  
                      <OPTION value="710" <% if(msg.getE02LCMSMT().equals("710")) out.print("selected");%>>MT710</OPTION>
                      <OPTION value="768" <% if(msg.getE02LCMSMT().equals("768")) out.print("selected");%>>MT768</OPTION>
                      <OPTION value="730" <% if(msg.getE02LCMSMT().equals("730")) out.print("selected");%>>MT730</OPTION>
                      
                   <% 	} else {
                   		// STAND BY RECIBIDA / MANTENIMIENTO	 
                   %>   
                      <OPTION value="707" <% if(msg.getE02LCMSMT().equals("707")) out.print("selected");%>>MT707</OPTION>
                      <OPTION value="767" <% if(msg.getE02LCMSMT().equals("767")) out.print("selected");%>>MT767</OPTION>
                      <OPTION value="769" <% if(msg.getE02LCMSMT().equals("769")) out.print("selected");%>>MT769</OPTION>                      
   					  <OPTION value="730" <% if(msg.getE02LCMSMT().equals("730")) out.print("selected");%>>MT730</OPTION>
                   
				   <%	} 
				   	  } %>   
                  </SELECT></TD>
		</TR>
	    </TBODY>
	   </TABLE>
      </TD>
    </TR>
  </TABLE>  
  
  <br>
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>
				<TR id="trdark"> 
					<TD nowrap width="25%" align="right">Monto Garantía Efectivo: </TD>
					<TD nowrap width="25%"> 
						<INPUT name="E02LCMCAM" type="text" onKeyPress="enterDecimal(event)" value="<%= msg.getE02LCMCAM().trim()%>" size="17" maxlength="16" <%= !msg.getE02LCMOPT().equals("N") ? "readonly" : "" %>>
					</TD>
					<TD nowrap width="25%" align="right">Cuenta Garantía Efectivo: </TD>
					<TD nowrap width="27%">
						<TABLE id="trdark">
							<TBODY>
								<TR>
									<TD rowspan="2"><INPUT name="E02LCMCCA" type="text" value="<%= msg.getE02LCMCCA().trim()%>" size="17" maxlength="16"></TD>
									<TD>Cuenta<BR>Contable</TD>
									<TD rowspan="2"><A href="javascript:GetLedger('E02LCMCCA',document.forms[0].E02LCMBNK.value,'','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A></TD>
									<TD>Cuenta<BR>Cliente</TD>
									<TD rowspan="2"><A href="javascript: GetAccByClient('E02LCMCCA','','RT','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
				</TR>
				<TR id="trclear">
					<TD align="right" nowrap>Linea de Cr&eacute;dito del Cliente: </TD>
					<TD align="left" nowrap>
						<INPUT type="text" name="E02LCMLNR" size="10" maxlength="9" value="<%= msg.getE02LCMLNR().trim()%>" onKeyPress="enterInteger(event)">
                		<A href="javascript:GetCustomer('E02LCMLNR')"> <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
                		<INPUT type="text" name="E02LCMCMN" size="4" maxlength="4" value="<%= msg.getE02LCMCMN().trim()%>" onKeyPress="enterInteger(event)">
						<A href="javascript:GetCreditLine('E02LCMCMN',document.forms[0].E02LCMLNR.value)"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></A>
					</TD>
		            <TD nowrap width="25%" align="right">Centro de Costo: </TD>
            		<TD nowrap width="27%"> 
						<INPUT type="text" name="E02LCMCCN" size="9" maxlength="8" value="<%= msg.getE02LCMCCN().trim()%>" <%= ( !msg.getE02LCMOPT().equals("N") ? "readonly" : "" ) %>> 
						<A href="javascript:GetCostCenter('E02LCMCCN',document.forms[0].E02LCMBNK.value)">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
            		</TD>
				</TR>
           </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TABLE>

  <H4>Comisiones</H4>
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>
				<TR id="trdark"> 
            		<TD nowrap width="25%" align="right">Tarifa de Comisiones: </TD>
            		<TD nowrap width="25%"> 
						<INPUT type="text" name="E02LCMTAR" size="2" maxlength="2" value="<%= msg.getE02LCMTAR().trim()%>">
						<A href="javascript:GetTariffLC('E02LCMTAR','<%=msg.getE02LCMATY()%>','<%=msg.getE02LCMCUN()%>','C')">
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A> 
            			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD>
            		<TD nowrap align="right">Nuestros Cargos por Cuenta de: </TD>
            		<TD nowrap>
            			<SELECT name="E02LCMAOB">
                			<OPTION value=" "></OPTION>
                			<OPTION value="A" <% if(msg.getE02LCMAOB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
                			<OPTION value="B" <% if(msg.getE02LCMAOB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
              			</SELECT>
                		<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
                	</TD>
			 	</TR>   
          		<TR id="trclear">
            		<TD nowrap align="right">Cuenta Débito Comisiones: </TD>
            		<TD nowrap>
            			<INPUT type="text" name="E02LCMSCA" size="17" maxlength="12" value="<%= msg.getE02LCMSCA().trim()%>">
						<A href="javascript: GetAccByClient('E02LCMSCA','','RT','','')" >
						<IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
					</TD> 
			  		<TD align="right" nowrap>Cargos O/B por Cuenta de: </TD>
					<TD align="left" nowrap>
						<SELECT name="E02LCMOBC">
                    		<OPTION value=" "></OPTION>
                    		<OPTION value="A" <% if(msg.getE02LCMOBC().equals("A")) out.print("selected");%>>Aplicante</OPTION>
                    		<OPTION value="B" <% if(msg.getE02LCMOBC().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
                  		</SELECT>
                  	</TD>
				</TR>        
				<TR id="trdark">
            		<TD nowrap width="25%" align="right">Ciclo de Pago de Comisiones: </TD>
            		<TD nowrap width="27%">
            			<INPUT type="text" name="E02LCMCCD" size="3" maxlength="3" value="<%= msg.getE02LCMCCD().trim()%>" readonly>
            			<INPUT type="hidden" name="E02LCMCCC" value="<%= msg.getE02LCMCCC().trim()%>">
						<SELECT name="CE02LCMCCC" disabled>
							<OPTION value="D" <% if(msg.getE02LCMCCC().equals("D")) out.print("selected");%>>Dias</OPTION>
							<OPTION value="M" <% if(msg.getE02LCMCCC().equals("M")) out.print("selected");%>>Meses</OPTION>
							<OPTION value="Y" <% if(msg.getE02LCMCCC().equals("Y")) out.print("selected");%>>Anos</OPTION>
						</SELECT>
					</TD>
            		<TD nowrap width="25%" align="right">Fecha de Próximo Pago de Comisiones: </TD>
            		<TD nowrap width="25%"> 
						<eibsinput:date name="msg" fn_month="E02LCMSCM" fn_day="E02LCMSCD" fn_year="E02LCMSCY" readonly="true"/>
            		</TD>
				</TR>
          		<TR id="trclear"> 
            		<TD nowrap width="25%" align="right">Com. Apertura Día de Emisión: </TD>
            		<TD nowrap width="25%">
                		<INPUT type="radio" name="E02LCMOCI" value="Y" <% if(msg.getE02LCMOCI().equals("Y")) out.print("checked");%>>Si
                		<INPUT type="radio" name="E02LCMOCI" value="N" <% if(msg.getE02LCMOCI().equals("N")) out.print("checked");%>>No
                		<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
                	</TD>
            		<TD nowrap width="25%" align="right">Com. Enmienda Día de Enmienda: </TD>
            		<TD nowrap width="27%">
                		<INPUT type="radio" name="E02LCMACI" value="Y" <% if(msg.getE02LCMACI().equals("Y")) out.print("checked");%>>Si
                		<INPUT type="radio" name="E02LCMACI" value="N" <% if(msg.getE02LCMACI().equals("N")) out.print("checked");%>>No
  			        	<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
  			        </TD>
				</TR>
           </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TABLE>

  <%if(userPO.getID().equals("18")){%>
  <H4>Intereses</H4>
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>
				<TR id="trdark">
				  <TD nowrap width="25%" align="right">Tipo de Inter&eacute;s: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMICT" type="text" value="<%= msg.getE02LCMICT().trim()%>" size="1" maxlength="1" readonly="readonly">                  </TD>
				  <TD nowrap width="25%" align="right">Tasa de Inter&eacute;s: </TD>
				  <TD nowrap width="27%"><INPUT name="E02LCMIRT" type="text" value="<%= msg.getE02LCMIRT().trim()%>" size="9" maxlength="9" readonly="readonly">                  </TD>
				</TR>
				<TR id="trclear">
				  <TD nowrap width="25%" align="right">Tabla y Tipo de Tasa Flotante: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMFTB" type="text" value="<%= msg.getE02LCMFTB().trim()%>" size="2" maxlength="2" readonly="readonly">
                      <SELECT name="E02LCMFTY" disabled="disabled">
                        <OPTION value=" "> </OPTION>
                        <OPTION value="FP">Tasa Primaria: </OPTION>
                        <OPTION value="FS" <% if(msg.getE02LCMOCI().equals("FS")) out.print("selected");%>>Tasa Secundaria: </OPTION>
                    </SELECT></TD>
				  <TD nowrap width="25%" align="right">Per&iacute;odo Base Calc.Intereses: </TD>
				  <TD nowrap width="27%"><INPUT name="E02LCMBAS" type="text" onKeyPress="enterInteger(event)" value="<%= msg.getE02LCMBAS().trim()%>" size="3" maxlength="3" readonly="readonly"></TD>
	    </TR>
		
		<TR id="trdark">
					<TD nowrap width="25%" align="right">Ciclo de Pago de Intereses: </TD>
					<TD nowrap width="25%" align="left">
                       <INPUT type="text" name="E02LCMIPC" size="3" maxlength="3" value="<%= msg.getE02LCMIPC().trim()%>" onKeyPress="enterInteger(event)"> 
                    </TD>
					<TD nowrap width="25%" align="right">Fecha Prox.Pago Intereses: </TD>
					<TD nowrap width="25%">
						<eibsinput:date name="msg" fn_month="E02LCMNPM" fn_day="E02LCMNPD" fn_year="E02LCMNPY" required="false"/>
                    </TD>	
		</TR>
				
	    <TR id="trclear">
					<TD nowrap width="25%" align="right">Condonar Intereses en Cancelacion: </TD>
					<TD nowrap width="25%">
					   <INPUT type="radio" name="E02LCMWIF" value="Y" <% if(msg.getE02LCMWIF().equals("Y")) out.print("checked");%>>Si
                	   <INPUT type="radio" name="E02LCMWIF" value="N" <% if(msg.getE02LCMWIF().equals("N")) out.print("checked");%>>No  
					</TD>
				    <TD nowrap width="25%" align="right">Cuenta de Repago de Intereses: </TD>
					<TD nowrap width="25%">
				       <INPUT type="text" name="E02LCMIPA" size="17" maxlength="12" value="<%= msg.getE02LCMIPA().trim()%>">
					  <A href="javascript: GetAccByClient('E02LCMIPA','','RT','','')" >
					  <IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A>
					</TD>
	    </TR></TBODY>
	    </TABLE>
	    </TD>
	    </TR>
	    </TABLE>
	    
			    <%}%>
  
  <% if( !msg.getE02LCMOPT().equals("N") ) {%>
  <H4>Aumento/ Disminuci&oacute;n del Cr&eacute;dito</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark0">
                <TD nowrap width="16%"align="right">Incremento / Decremento: </TD>
                <TD nowrap width="20%" align="left"><SELECT name="E02LCMIDF">
                  <OPTION value=""> </OPTION>
                  <OPTION value="I" <% if(msg.getE02LCMIDF().equals("I")) out.print("selected");%>>Incremento</OPTION>
                  <OPTION value="D" <% if(msg.getE02LCMIDF().equals("D")) out.print("selected");%>>Decremento</OPTION>
                </SELECT></TD>
                <TD nowrap width="16%"align="right">Monto: </TD>
                <TD nowrap width="16%"><INPUT name="E02LCMIDA" type="text" onKeyPress="enterDecimal(event)" value="<%= msg.getE02LCMIDA().trim()%>" size="17" maxlength="16"></TD>
                <TD nowrap width="15%"align="right">Saldo Actual: </TD>
                <TD nowrap width="15%"><INPUT name="E02LCMMEB" type="text"  value="<%= msg.getE02LCMMEB().trim()%>" size="17" maxlength="16" readonly></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  <% } %>
  <BR>
  
  <DIV align="center"> 
  <h4 style="text-align:center"><input type="checkbox" name="H02FLGWK2" value="A" <% if(msg.getH02FLGWK2().equals("A")){ out.print("checked");} %>>
      Aceptar con Advertencias</h4>
	<INPUT type="hidden" id="FLAG" name="H02FLGWK1" value="">
	<INPUT id="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="enviarSubmit();"> &nbsp; &nbsp; &nbsp;
	<INPUT id="btnFinalizarID" class="EIBSBTN" type="button" name="Submit0" value="Finalizar" onclick="finalizarSubmit();"> &nbsp; &nbsp; &nbsp;
	</DIV>  
</FORM>
 
<!--<H5>  <%
String s = msg.toString();
for(int i = 0; i < s.length(); i++)
{
	if(s.charAt(i) == ':')	out.print("<BR>");
	else if (s.charAt(i) == '<') out.print("{");
		else if (s.charAt(i) == '>') out.print("}");
	else 					out.print(s.charAt(i));

}%></H5>-->
</BODY>
</HTML>
