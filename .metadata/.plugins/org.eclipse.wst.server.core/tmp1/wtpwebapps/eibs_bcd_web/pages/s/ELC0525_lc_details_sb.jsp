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

<jsp:useBean id="msg040002" class="datapro.eibs.beans.ELC040002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">

	builtNewMenu(lc_apr_standby);
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
<H3 align="center"><%= (userPO.getPurpose().equals("NEW") ? "Apertura" : "Mantenimiento") %> de Carta de Credito Stand By 
<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF"
title="ELC0525_lc_details_sb.jsp"></H3> 

<HR size="4">
<FORM>
<TABLE cellspacing="0" cellpadding="2" width="100%" border="0" class="tableinfo" id="trclear">
					<TR id="trdark">
						<TD nowrap width="16%" align="right"><B>Banco : </B></TD>
						<TD nowrap width="20%">
						<INPUT type="text" name="E02LCMBNK" size="4" maxlength="2" value="<%=msg040002.getE02LCMBNK().trim()%>" readonly></TD>
						<TD nowrap width="16%" align="right"><B>Número de Carta de Credito : </B></TD>
						<TD nowrap width="16%">
						<DIV align="left"><B> <%if (msg040002.getE02LCMACC().trim().equals("999999999999"))
				{%> <INPUT type="text" size="12" maxlength="12" value="Nuevo"
							readonly> <INPUT type="hidden" name="E02LCMACC"
							value="<%=msg040002.getE02LCMACC().trim()%>" readonly> <%}
				else
				{%> <INPUT type="text" name="E02LCMACC" size="13" maxlength="12"
							value="<%=(msg040002.getE02LCMACC().trim().equals("0") ? userPO.getIdentifier() : msg040002.getE02LCMACC().trim() )%>" readonly> <%}%> </B></DIV>
						</TD>
					</TR>
					<TR>
						<TD nowrap width="16%" align="right"><B>Nuestra Referencia : </B>
						</TD>
						<TD nowrap width="20%" align="left"><INPUT type="text" name="E02LCMORF" size="20"
							maxlength="16" value="<%=msg040002.getE02LCMORF().trim()%>" readonly> 
						</TD>
						<TD nowrap width="16%" align="right"><B>Producto : </B></TD>
						<TD nowrap width="16%" align="left"><B> <INPUT type="text" name="E02LCMPRO" size="4"
							maxlength="4" value="<%=msg040002.getE02LCMPRO().trim()%>" readonly>
						</B></TD>

					</TR>
					<TR id="trdark">
						<TD width="16%" align="right" nowrap><B>Referencia del Otro Banco : </B></TD>
						<TD nowrap width="16%"><B> <INPUT type="text" name="E02LCMTRF"
							size="20" maxlength="16" value="<%=msg040002.getE02LCMTRF().trim()%>" readonly>
						</B></TD>

						<TD nowrap width="16%" align="right"><B>Descripcion del Producto : </B></TD>
						<TD nowrap width="16%" align="left"><B><INPUT type="text" name="E02DSCPRO"
							size="40" maxlength="35" value="<%=userPO.getHeader2().trim()%>"
							readonly> </B></TD>

					</TR>
				</TABLE>

<H4>Información de la Carta de Crédito</H4> 
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY><TR id="trdark"> 
            <TD nowrap width="25%" align="right">Fecha de Emisión: </TD>
            <TD nowrap width="25%"> 
				<eibsinput:date name="msg040002" fn_month="E02LCMIDM" fn_day="E02LCMIDD" fn_year="E02LCMIDY" readonly="true"/>
            </TD>
            <TD nowrap width="25%" align="right">Fecha de Expiración: </TD>
            <TD nowrap width="27%"> 
				<eibsinput:date name="msg040002" fn_month="E02LCMEXM" fn_day="E02LCMEXD" fn_year="E02LCMEXY" readonly="true"/>
           </TD>
          </TR>   
           <TR id="trclear"> 
            <TD nowrap width="25%" align="right">Fecha de Aviso/Confirmación: </TD><TD nowrap width="25%"> 
				<eibsinput:date name="msg040002" fn_month="E02LCMCNM" fn_day="E02LCMCND" fn_year="E02LCMCNY" readonly="true"/>
            </TD>
            
			<TD nowrap width="25%" align="right">Oficina: </TD>
            <TD nowrap width="25%">
              <INPUT type="text" name="E02LCMBRN" size="5" maxlength="4" value="<%= msg040002.getE02LCMBRN().trim()%>" readonly>
            </TD>
          </TR>         
           <TR id="trdark"> 
           <!-- <TD nowrap width="25%" align="right">Clausula de Aproximación:</TD>
            <TD nowrap width="25%"> 
                	<INPUT type="radio" name="E02LCMABC" value="Y" <% if(msg040002.getE02LCMABC().equals("Y")) out.print("checked");%>>Si
                	<INPUT type="radio" name="E02LCMABC" value="N" <% if(msg040002.getE02LCMABC().equals("N")) out.print("checked");%>>No
    	        &nbsp; &nbsp; &nbsp; Porcentaje: <INPUT type="text" name="E02LCMABP" size="3" maxlength="3" value="<%= msg040002.getE02LCMABP().trim()%>" onkeypress="enterInteger(event)"></TD>-->
            <TD nowrap width="25%" align="right">Monto del Crédito: </TD>
            <TD nowrap width="27%">
              <INPUT type="text" name="E02LCMCCY" size="4" maxlength="3" value="<%= msg040002.getE02LCMCCY().trim()%>" readonly>
              <INPUT type="text" name="E02LCMOAM" size="17" maxlength="16" value="<%= msg040002.getE02LCMOAM().trim()%>" 
			  <%= ( userPO.getPurpose().equals("N") ? "onKeyPress=\"enterDecimal(event)\"" : "disabled=\"disabled\"" ) %> > 
              <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0">
            </TD>
            <TD nowrap align="right">Boleta de Garantia : </TD>
            <TD nowrap>
            	<INPUT type="radio" name="E02BOLETA" disabled value="Y" <% if(msg040002.getE02BOLETA().equals("Y")) out.print("checked");%>> Si
            	<INPUT type="radio" name="E02BOLETA" disabled value="N" <% if(msg040002.getE02BOLETA().equals("N")) out.print("checked");%>> No 
            </TD>
          </TR>           
          <TR id="trclear">
            <TD nowrap width="25%" align="right">Confirmada: </TD>
            <TD nowrap width="25%" align="left">
              <INPUT name="E02LCMCNF" type="radio" disabled value="Y" readonly="readonly" <% if(msg040002.getE02LCMCNF().equals("Y")) out.print("checked");%>>
              Si
              <INPUT name="E02LCMCNF" type="radio" disabled value="N" readonly="readonly" <% if(msg040002.getE02LCMCNF().equals("N")) out.print("checked");%>>
              No </TD> 
            <TD nowrap width="25%" align="right">Agregar Confirmación: </TD>
            <TD nowrap width="25%" align="left">
                <% 
                	String test = msg040002.getE02LCMCNO().trim();
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
          </TR>   
          <TR id="trdark">
            <TD nowrap align="right">Tenor: </TD>
            <TD nowrap><SELECT name="E02LCMTNR" disabled="disabled">
                <OPTION value="S" <% if(msg040002.getE02LCMTNR().equals("S")) out.print("selected");%>>Pago</OPTION>
                <OPTION value="A" <% if(msg040002.getE02LCMTNR().equals("A")) out.print("selected");%>>Aceptaci&oacute;n</OPTION>
                <OPTION value="M" <% if(msg040002.getE02LCMTNR().equals("M")) out.print("selected");%>>Pago Mixto</OPTION>
                <OPTION value="D" <% if(msg040002.getE02LCMTNR().equals("D")) out.print("selected");%>>Pago Diferido</OPTION>
                <OPTION value="N" <% if(msg040002.getE02LCMTNR().equals("N")) out.print("selected");%>>Negociaci&oacute;n</OPTION>
              </SELECT>
                <IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"></TD> 
            <TD nowrap width="25%" align="right">Reglas a Aplicar: </TD><TD nowrap width="27%">
            	<SELECT name="E02LCMAPR" disabled>
                	<OPTION value="9">NONE</OPTION>
                	<OPTION value="7" <% if(msg040002.getE02LCMAPR().equals("1")) out.print("selected");%>>IIC URCG</OPTION>
                	<OPTION value="8" <% if(msg040002.getE02LCMAPR().equals("2")) out.print("selected");%>>IIC URDG</OPTION>
                	<OPTION value="6" <% if(msg040002.getE02LCMAPR().equals("3")) out.print("selected");%>>Other</OPTION>
              	</SELECT>  
  			<IMG src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" border="0"><INPUT name="E02LCMST3" type="text" value="<%= msg040002.getE02LCMST3().trim()%>"
						size="40" maxlength="35" readonly="readonly"></TD>
          </TR>   
			<TR id="trclear">
				  <TD nowrap width="25%" align="right">Lugar de Expiración: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMPLE" type="text" value="<%= msg040002.getE02LCMPLE().trim()%>" size="31" maxlength="29" readonly="readonly"></TD>
				  <TD align="right" nowrap>Renovación Automática: </TD>
				  <TD align="left" nowrap>
				    <INPUT name="E02LCMEVF" type="radio" disabled value="Y" readonly="readonly" <% if(!msg040002.getE02LCMEVF().equals("N")) out.print("checked");%>>
				    Si
				    <INPUT name="E02LCMEVF" type="radio" disabled value="N" readonly="readonly" <% if( msg040002.getE02LCMEVF().equals("N")) out.print("checked");%>>
				    No 
				  </TD>
			</TR>
			<TR id="trdark">
				  <TD align="right" nowrap>Días Límite Aviso No Renovación: </TD>
				  <TD align="left" nowrap><INPUT name="E02LCMNRD" type="text" onkeypress="enterInteger(event)" value="<%= msg040002.getE02LCMNRD().trim()%>" size="3" maxlength="3" readonly="readonly"></TD>
				  <TD align="right" nowrap>Período de Prórroga / Renovación: </TD>
				  <TD align="left" nowrap><INPUT name="E02LCMRDY" type="text" onkeypress="enterInteger(event)" value="<%= msg040002.getE02LCMRDY().trim()%>" size="3" maxlength="3" readonly="readonly">
				<SELECT name="E02LCMFL1" disabled>
                    <OPTION value="D" <% if(msg040002.getE02LCMFL1().equals("D")) out.print("selected");%>>Dias</OPTION>
                    <OPTION value="M" <% if(msg040002.getE02LCMFL1().equals("M")) out.print("selected");%>>Meses</OPTION>
                    <OPTION value="Y" <% if(msg040002.getE02LCMFL1().equals("Y")) out.print("selected");%>>Anos</OPTION>
                  </SELECT></TD>
			</TR>
			<TR id="trclear">
				  <TD align="right" nowrap>Generar Swift: </TD>
				  <TD align="left" nowrap>
				    <INPUT name="E02LCMSWF" type="radio" disabled value="Y" readonly="readonly" <% if(msg040002.getE02LCMSWF().equals("Y")) out.print("checked");%>>
				    Si
				    <INPUT name="E02LCMSWF" type="radio" disabled value="N" readonly="readonly" <% if( !msg040002.getE02LCMSWF().equals("Y")) out.print("checked");%>>
				    No </TD>
				  <TD align="right" nowrap>Tipo de Mensaje Swift: </TD>
				  <TD align="left" nowrap><SELECT name="E02LCMSMT" disabled>
                      <OPTION value="760" <% if(msg040002.getE02LCMSMT().equals("760")) out.print("selected");%>>MT-760</OPTION>
                      <OPTION value="700" <% if(msg040002.getE02LCMSMT().equals("700")) out.print("selected");%>>MT-700</OPTION>
                  </SELECT></TD>
			</TR>
	    </TBODY></TABLE>
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
						<INPUT name="E02LCMCAM" type="text" readonly value="<%= msg040002.getE02LCMCAM().trim()%>" size="17" maxlength="16">
					</TD>
					<TD nowrap width="25%" align="right">Cuenta Garantía Efectivo: </TD>
					<TD nowrap width="27%">
						<INPUT name="E02LCMCCA" type="text" readonly value="<%= msg040002.getE02LCMCCA().trim()%>" size="17" maxlength="16">
					</TD>
				</TR>
				<TR id="trclear">
					<TD align="right" nowrap>Linea de Cr&eacute;dito del Cliente: </TD>
					<TD align="left" nowrap>
						<INPUT type="text" name="E02LCMLNR" size="10" maxlength="9" value="<%= msg040002.getE02LCMLNR().trim()%>" readonly>
                		<INPUT type="text" name="E02LCMCMN" size="4" maxlength="4" value="<%= msg040002.getE02LCMCMN().trim()%>" readonly>
					</TD>
		            <TD nowrap width="25%" align="right">Centro de Costo: </TD>
            		<TD nowrap width="27%"> 
						<INPUT type="text" name="E02LCMCCN" size="9" maxlength="8" value="<%= msg040002.getE02LCMCCN().trim()%>" readonly> 
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
						<INPUT type="text" name="E02LCMTAR" size="2" maxlength="2" value="<%= msg040002.getE02LCMTAR().trim()%>" readonly>
            		<TD nowrap align="right">Nuestros Cargos por Cuenta de: </TD>
            		<TD nowrap>
              			<input type="text" name="E02LCMAOB" readonly size="15" maxlength="13" value="
							<%
								if (msg040002.getE02LCMAOB().equals("A")) out.print("APLICANTE");
								else if (msg040002.getE02LCMAOB().equals("B")) out.print("BENEFICIARIO");
								else out.print("");%>">
                	</TD>
			 	</TR>   
          		<TR id="trclear">
            		<TD nowrap align="right">Cuenta Débito Comisiones: </TD>
            		<TD nowrap>
            			<INPUT type="text" name="E02LCMSCA" size="17" maxlength="12" value="<%= msg040002.getE02LCMSCA().trim()%>" readonly>
					</TD> 
			  		<TD align="right" nowrap>Cargos O/B por Cuenta de: </TD>
					<TD align="left" nowrap>
						<SELECT name="E02LCMOBC" disabled>
                    		<OPTION value=" "></OPTION>
                    		<OPTION value="A" <% if(msg040002.getE02LCMOBC().equals("A")) out.print("selected");%>>Aplicante</OPTION>
                    		<OPTION value="B" <% if(msg040002.getE02LCMOBC().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
                  		</SELECT>
                  	</TD>
				</TR>        
				<TR id="trdark">
            		<TD nowrap width="25%" align="right">Ciclo de Pago de Comisiones: </TD>
            		<TD nowrap width="27%">
            			<INPUT type="text" name="E02LCMCCD" size="3" maxlength="3" value="<%= msg040002.getE02LCMCCD().trim()%>" readonly>
            			<INPUT type="hidden" name="E02LCMCCC" value="<%= msg040002.getE02LCMCCC().trim()%>">
						<SELECT name="CE02LCMCCC" disabled>
							<OPTION value="D" <% if(msg040002.getE02LCMCCC().equals("D")) out.print("selected");%>>Dias</OPTION>
							<OPTION value="M" <% if(msg040002.getE02LCMCCC().equals("M")) out.print("selected");%>>Meses</OPTION>
							<OPTION value="Y" <% if(msg040002.getE02LCMCCC().equals("Y")) out.print("selected");%>>Anos</OPTION>
						</SELECT>
					</TD>
            		<TD nowrap width="25%" align="right">Fecha de Próximo Pago de Comisiones: </TD>
            		<TD nowrap width="25%"> 
						<eibsinput:date name="msg040002" fn_month="E02LCMSDM" fn_day="E02LCMSDD" fn_year="E02LCMSDY" readonly="true"/>
            		</TD>
				</TR>
          		<TR id="trclear"> 
            		<TD nowrap width="25%" align="right">Com. Apertura Día de Emisión: </TD>
            		<TD nowrap width="25%">
                		<INPUT type="radio" name="E02LCMOCI" value="Y" <% if(msg040002.getE02LCMOCI().equals("Y")) out.print("checked");%> disabled>Si
                		<INPUT type="radio" name="E02LCMOCI" value="N" <% if(msg040002.getE02LCMOCI().equals("N")) out.print("checked");%> disabled>No
                	</TD>
            		<TD nowrap width="25%" align="right">Com. Enmienda Día de Enmienda: </TD>
            		<TD nowrap width="27%">
                		<INPUT type="radio" name="E02LCMACI" value="Y" <% if(msg040002.getE02LCMACI().equals("Y")) out.print("checked");%> disabled>Si
                		<INPUT type="radio" name="E02LCMACI" value="N" <% if(msg040002.getE02LCMACI().equals("N")) out.print("checked");%> disabled>No
  			        </TD>
				</TR>
           </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TABLE>

  <H4>Intereses</H4>
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>
			<TR id="trdark">
				  <TD nowrap width="25%" align="right">Tipo de Inter&eacute;s: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMICT" type="text" value="<%= msg040002.getE02LCMICT().trim()%>" size="1" maxlength="1" readonly="readonly"></TD>
				  <TD nowrap width="25%" align="right">Tasa de Inter&eacute;s:</TD>
				  <TD nowrap width="27%"><INPUT name="E02LCMIRT" type="text" value="<%= msg040002.getE02LCMIRT().trim()%>" size="9" maxlength="9" readonly="readonly"></TD>
			</TR>
			<TR id="trclear">
				  <TD nowrap width="25%" align="right">Tabla / Tipo de Tasa Flotante: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMFTB" type="text" value="<%= msg040002.getE02LCMFTB().trim()%>" size="2" maxlength="2" readonly="readonly">
                      <SELECT name="E02LCMFTY" disabled="disabled">
                        <OPTION value=" "> </OPTION>
                        <OPTION value="FP">Tasa Primaria</OPTION>
                        <OPTION value="FS" <% if(msg040002.getE02LCMFTY().equals("FS")) out.print("selected");%>>Tasa Secundaria</OPTION>
                    </SELECT></TD>
				  <TD nowrap width="25%" align="right">Per&iacute;odo Base Calc.Intereses: </TD>
				  <TD nowrap width="27%"><INPUT name="E02LCMBAS" type="text" onkeypress="enterInteger(event)" value="<%= msg040002.getE02LCMBAS().trim()%>" size="3" maxlength="3" readonly="readonly"></TD>
		    </TR>
		
		    <TR id="trdark">
					<TD nowrap width="25%" align="right">Ciclo de Pago de Intereses: </TD>
					<TD nowrap width="25%" align="left">
                       <INPUT type="text" name="E02LCMIPC" size="3" maxlength="3" value="<%= msg040002.getE02LCMIPC().trim()%>" onkeypress="enterInteger(event)" readonly="readonly"> 
                    </TD>
					<TD nowrap width="25%" align="right">Fecha Prox.Pago Intereses: </TD>
					<TD nowrap width="25%">
						<eibsinput:date name="msg040002" fn_month="E02LCMNPM" fn_day="E02LCMNPD" fn_year="E02LCMNPY" readonly="true"/>
                    </TD>	
		    </TR>
				
	        <TR id="trclear">
					<TD nowrap width="25%" align="right">Condonar Intereses en Cancelación: </TD>
					<TD nowrap width="25%">
					   <INPUT type="radio" name="E02LCMWIF" disabled value="Y" readonly="readonly" <% if(msg040002.getE02LCMWIF().equals("Y")) out.print("checked");%>>Si
                	   <INPUT type="radio" name="E02LCMWIF" disabled value="N" readonly="readonly" <% if(msg040002.getE02LCMWIF().equals("N")) out.print("checked");%>>No  
					</TD>
				    <TD nowrap width="25%" align="right">Cuenta de Repago de Intereses: </TD>
					<TD nowrap width="25%">
				       <INPUT type="text" name="E02LCMIPA" size="17" maxlength="12" value="<%= msg040002.getE02LCMIPA().trim()%>" readonly="readonly">
					</TD>
		     
			</TR>
           </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TABLE>

  <H4>Aumento / Disminuci&oacute;n del Cr&eacute;dito</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark">
                <TD nowrap width="16%"align="right">Incremento / Decremento: </TD>
                <TD nowrap width="20%" align="left"><SELECT name="E02LCMIDF" disabled>
                  <OPTION value=""> </OPTION>
                  <OPTION value="I" <% if(msg040002.getE02LCMIDF().equals("I")) out.print("selected");%>>Incremento</OPTION>
                  <OPTION value="D" <% if(msg040002.getE02LCMIDF().equals("D")) out.print("selected");%>>Decremento</OPTION>
                </SELECT></TD>
                <TD nowrap width="16%"align="right">Monto: </TD>
                <TD nowrap width="16%"><INPUT name="E02LCMIDA" type="text" value="<%= msg040002.getE02LCMIDA().trim()%>" size="17" maxlength="16" readonly></TD>
                <TD nowrap width="15%"align="right">Saldo Actual: </TD>
                <TD nowrap width="15%"><INPUT name="E02LCMMEB" type="text"  value="<%= msg040002.getE02LCMMEB().trim()%>" size="17" maxlength="16" readonly></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  </FORM>
</BODY>
</HTML>
