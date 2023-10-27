<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import= "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Consulta de Cartas de Credito</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">


<jsp:useBean id="error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />
<jsp:useBean id="lcBasic" class="datapro.eibs.beans.ELC045001Message"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

   builtNewMenu(lc_i_opt);

</SCRIPT>

<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0"); 
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 } 
%>
</head>

<body bgcolor="#FFFFFF">

<%@ page import = "datapro.eibs.master.Util" %>
<SCRIPT> initMenu(); </SCRIPT>

<H3 align="center">Consulta de Cartas de Cr&eacute;dito<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_inq_basic.jsp,ELC0450"></h3>
<hr size="4">
<div style="color:red;font-size:13;font-weight:bold;text-align:right;">
<label><%= lcBasic.getE01PENDAP().toUpperCase() %></label>
</div>
<form method="post">
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="">
  <table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="20%" align="right"><b>Banco :</b></td>
      <td width="30%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= lcBasic.getE01LCMBNK() %>" size="2" maxlength="2" readonly></td>
      <td height="30%" align="right"><b>Numero de Carta de Credito  :</b></td>
      <td width="20%"><input type="text" name="E02ACC" size="12" maxlength="12" value="<%= userPO.getIdentifier() %>" readonly></td>
    </tr>

    <tr id="trclear">
      <td align="right"><b>Producto :</b></td>
      <td><b>
        <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getHeader1() %>">
      </b></td>
      <td align="right"><b>Descripcion del Producto :</b></td>
      <td><b>
        <input type="text" name="E02NA122" size="45" maxlength="45" readonly value="<%= lcBasic.getE01DSCPRO() %>">
      </b></td>
    </tr>
    <tr id="trdark">
      <td align="right"><b>Oficina :</b></td>
      <td><b>
        <input name="E01LCMBRN" type="text" id="E01LCMBRN" value="<%= lcBasic.getE01LCMBRN() %>" size="4" maxlength="4" readonly>
      </b></td>
      <td align="right"><b>Oficial :</b></td>
      <td><b>
        <input type="text" name="E01DSCOFC" size="40" maxlength="35" readonly value="<%= userPO.getOfficer() %>">
      </b></td>
    </tr>
    <tr id="trclear">
      <td align="right"><b>Cliente : </b></td>
      <td><input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= userPO.getHeader2() %>"></td>
      <td align="right"><b>Nombre del Cliente:</b></td>
      <td><input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= userPO.getHeader3() %>"></td>
    </tr>
  </table>
  
  <h4>Informaci&oacute;n B&aacute;sica</h4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap width="29%">
              <div align="right">Monto Original :</div></td>
            <td nowrap width="18%">
              <eibsinput:text name="lcBasic" property="E01LCMOAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
			</td>
            <td nowrap width="27%">
              <div align="right">Fecha de Emisi&oacute;n :</div></td>
            <td nowrap width="26%">
				<eibsinput:date name="lcBasic" fn_month="E01LCMIDM" fn_day="E01LCMIDD" fn_year="E01LCMIDY" required="false" readonly="true"/>
             </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%">
              <div align="right">Monto Utilizado :</div></td>
            <td nowrap width="18%">
              <eibsinput:text name="lcBasic" property="E01LCMNGA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="27%">
              <div align="right">Fecha de Expiraci&oacute;n :</div></td>
            <td nowrap width="26%">
				<eibsinput:date name="lcBasic" fn_month="E01LCMEXM" fn_day="E01LCMEXD" fn_year="E01LCMEXY" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="23">
              <div align="right">Saldo :</div></td>
            <td nowrap width="18%" height="23">
              <eibsinput:text name="lcBasic" property="E01LCMAMN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="27%" height="23">
              <div align="right">Moneda/Tasa de Cambio M/E :</div></td>
            <td nowrap width="26%" height="23">
              <input name="E01LCMCCY" type="text" id="E01LCMCCY" value="<%= lcBasic.getE01LCMCCY() %>" size="3" maxlength="3" readonly>
              <input type="text" name="E01LCMOFX" readonly size="13" maxlength="11" value="<%= lcBasic.getE01LCMOFX() %>"></td>
          </tr>
          <tr id="trclear">
            <td nowrap height="19"><div align="right">Tipo de Carta de Cr&eacute;dito :</div></td>
            <td nowrap height="19"><input type="text" name="E01LCMTYP" readonly size="16" maxlength="16" value="
<%
if (lcBasic.getE01LCMTYP().equals("I")) out.print("EXPORTACION");
else if (lcBasic.getE01LCMTYP().equals("O")) out.print("IMPORTACION");
else if (lcBasic.getE01LCMTYP().equals("S")) out.print("STANDBY EMITIDA");
else if (lcBasic.getE01LCMTYP().equals("R")) out.print("STANDBY RECIBICDA");
else out.print("");%>">            </td>
            <TD align="right" nowrap> Clausula de Aproximaci&oacute;n:</TD>
            <TD align="left" nowrap><INPUT type="radio" name="E01LCMABC" value="Y" <% if(lcBasic.getE01LCMABC().equals("Y")) out.print("checked");%> disabled readonly>
              Si
              <INPUT type="radio" name="E01LCMABC" value="N" <% if(lcBasic.getE01LCMABC().equals("N")) out.print("checked");%> disabled readonly>
              No
              &nbsp; &nbsp; Porcentaje:
              <INPUT type="text" name="E01LCMABP" readonly size="2" maxlength="2"
				value="<%if(lcBasic.getE01LCMABP().trim().length() == 1 && !lcBasic.getE01LCMABP().trim().equals("0")) out.print("0");%><%= lcBasic.getE01LCMABP().trim()%>" onkeypress="enterInteger(event)">
                  <INPUT type="text" name="E01LCMAPM" readonly size="2" maxlength="2"
				value="<%if(lcBasic.getE01LCMAPM().trim().length() == 1 && !lcBasic.getE01LCMAPM().trim().equals("0")) out.print("0");%><%= lcBasic.getE01LCMAPM().trim()%>" onkeypress="enterInteger(event)"></TD>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Otras Garant&iacute;as :</div></td>
            <td nowrap width="18%" height="19">
              <eibsinput:text name="lcBasic" property="E01LCMOCA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Tenor :</div></td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMTNR" readonly size="15" maxlength="15" value="<%= lcBasic.getE01DSCTNR() %>"></td>
          </tr>
          <tr id="trclear">
            <td nowrap width="25%" height="19">
              <div align="right">Confirmada :</div></td>
            <td nowrap width="25%" height="19">
             <%String value = lcBasic.getE01LCMCNF().equals("Y")? "SI":"NO";%>            
              <input type="text" name="E01LCMCNF" readonly size="3" maxlength="2" value="<%=value%>">
            </td>
            <td nowrap width="25%" height="19">
              <div align="right">Agregar Confirmacion :</div> </td>
            <td nowrap width="25%" height="19">
                  <% 
                	String test = lcBasic.getE01LCMCNO().trim();
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
              <input type="text" name="E01LCMCNO" readonly size="28" value="<%= confirm %>"> 
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Embarques Parciales :</div></td>
            <td nowrap width="18%" height="19">
            <%String val = lcBasic.getE01LCMPSH().equals("Y")? "SI":"NO";%>  
              <input type="text" name="E01LCMPSH" readonly size="3" maxlength="2" value ="<%=val%>">  
                      
            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Transbordo :</div></td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMTSH" readonly size="3" maxlength="1" value="
<%
if (lcBasic.getE01LCMTSH().equals("Y")) out.print("SI");
else if (lcBasic.getE01LCMTSH().equals("N")) out.print("NO");
else out.print("");%>">            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Transferible :</div></td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMTRN" readonly size="3" maxlength="1" value="
<%
if (lcBasic.getE01LCMTRN().equals("Y")) out.print("SI");
else if (lcBasic.getE01LCMTRN().equals("N")) out.print("NO");
else out.print("");%>">            </td>
            <TD width="25%" align="right" nowrap>Garantía Documentos de Embarque: </TD>
            <TD nowrap width="27%"> 
                    <INPUT type="radio" name="E01LCMGDE" value="Y" <% if(lcBasic.getE01LCMGDE().equals("Y")) out.print("checked");%> disabled readonly>Si
                	<INPUT type="radio" name="E01LCMGDE" value="N" <% if(!lcBasic.getE01LCMGDE().equals("Y")) out.print("checked");%> disabled readonly>No
            </TD>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Comisiones y Gastos :</div>            </td>
            <td nowrap width="18%" height="19">
              <eibsinput:text name="lcBasic" property="E01LCMCOM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <td nowrap width="27%" height="19">
              <p align="right">Retenci&oacute;n de Pago :</p>            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMHPF" readonly size="3" maxlength="1" value="<%
if (lcBasic.getE01LCMHPF().equals("Y")) out.print("SI");
else if (lcBasic.getE01LCMHPF().equals("N")) out.print("NO");
else out.print("");%>">
			</td>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Nuestra Referencia :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMORF" readonly size="18" maxlength="16" value="<%= lcBasic.getE01LCMORF() %>"></td>
            <td nowrap width="27%" height="19">
              <div align="right">Referencia Otro Banco :</div>            </td>
            <td nowrap width="26%" height="19">
              <input type="text" name="E01LCMTRF" readonly size="18" maxlength="16" value="<%= lcBasic.getE01LCMTRF() %>"></td>
          </tr>
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Banco / Sucursal :</div>            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMBNK" readonly size="2" maxlength="2" value="<%= lcBasic.getE01LCMBNK() %>">
              <input type="text" name="E01LCMBRN" readonly size="2" maxlength="2" value="<%= lcBasic.getE01LCMBRN() %>"></td>
            <td nowrap width="27%" height="19">
              <div align="right">Cuenta Contable :</div>            </td>
            <td nowrap width="26%" height="19">
              <eibsinput:text name="lcBasic" property="E01LCMGLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true"/>
            </td>              
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Tipo de Cuenta :</div> </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMATY" readonly size="4" maxlength="4" value="<%= lcBasic.getE01LCMATY() %>"></td>
            <td nowrap width="25%" height="19">
              <div align="right">Incoterms :</div></td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMITR" readonly size="6" maxlength="4" value="<%= lcBasic.getE01LCMITR() %>">
            </td>
            
            
          </tr>
          
          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Intereses (Mda.Base):</div>            
            </td>
            <td nowrap width="18%" height="19">
              <eibsinput:text name="lcBasic" property="E01LCMINT" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
            </td>
            <TD align="right" nowrap>Flete:</TD>
				  <TD align="left" nowrap>
				  <SELECT name="E01LCMFRC" disabled="disabled">
                  		<OPTION value=" "></OPTION>
            	       	<OPTION value="P" <% if(lcBasic.getE01LCMFRC().equals("P")) out.print("selected");%>>Pagado</OPTION>
                   		<OPTION value="C" <% if(lcBasic.getE01LCMFRC().equals("C")) out.print("selected");%>>Al Cobro</OPTION>
                  </SELECT>
            </TD>
          </tr>
          <tr id="trclear">
            <td nowrap width="29%" height="19">
              <div align="right">Enmiendas:</div>            
            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMLAN" readonly size="2" maxlength="2" value="<%= lcBasic.getE01LCMLAN() %>">
            </td>
            <td nowrap width="27%" height="19">
              <div align="right">Fecha Ultima Enmienda:</div>            
            </td>
            <td nowrap width="26%" height="19">
				<eibsinput:date name="lcBasic" fn_month="E01LCMLAM" fn_day="E01LCMLAD" fn_year="E01LCMLAY" required="false" readonly="true"/>
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap width="29%" height="19">
              <div align="right">Agente / Representante:</div>            
            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMBRK" readonly size="3" maxlength="3"   value="<%= lcBasic.getE01LCMBRK() %>">
              <input type="text" name="E01DSCBRK" readonly size="35" maxlength="35" value="<%= lcBasic.getE01DSCBRK() %>">
            </td>
            <td nowrap width="29%" height="19">
              <div align="right">Lugar de Expiración:</div>            
            </td>
            <td nowrap width="18%" height="19">
              <input type="text" name="E01LCMPLE" readonly size="29" maxlength="29" value="<%= lcBasic.getE01LCMPLE() %>">
            </td>
          </tr>
          
          <tr id="trclear">
          	<TD align="right" nowrap>Plazo Financiamiento Banco: </TD>
			<TD align="left" nowrap>
				<INPUT type="text" name="E01LCMNRD" size="5" maxlength="3" value="<%= lcBasic.getE01LCMNRD().trim()%>" readonly>
  				  <SELECT name="E01LCMTC1" disabled="disabled">
                	<OPTION value="  " <% if ((!lcBasic.getE01LCMTC1().equals("BL")) && (!lcBasic.getE01LCMTC1().equals("NE"))) out.println("selected"); %>></OPTION>
               		<OPTION value="BL" <% if (lcBasic.getE01LCMTC1().equals("BL")) out.println("selected"); %>>Después de Fecha de Embarque</OPTION>
               		<OPTION value="NE" <% if (lcBasic.getE01LCMTC1().equals("NE")) out.println("selected"); %>>Despues de Fecha  Negociación</OPTION>
		         </SELECT></TD>
		     
		     <TD align="right" nowrap>Plazo Financiamiento Proveedor: </TD>
				  <TD align="left" nowrap>
				  <INPUT type="text" name="E01LCMRDY" size="5" maxlength="3" value="<%= lcBasic.getE01LCMRDY().trim()%>" readonly>
				  				  <SELECT name="E01LCMTC2" disabled="disabled">
				  				  <OPTION value="  " <% if ((!lcBasic.getE01LCMTC2().equals("BL")) && (!lcBasic.getE01LCMTC2().equals("NE"))) out.println("selected"); %>></OPTION>
			                		<OPTION value="BL" <% if (lcBasic.getE01LCMTC2().equals("BL")) out.println("selected"); %>>Después de Fecha de Embarque</OPTION>
		                			<OPTION value="NE" <% if (lcBasic.getE01LCMTC2().equals("NE")) out.println("selected"); %>>Despues de Fecha  Negociación</OPTION>
			       </SELECT>
				</TD>
          </tr>
          <TR id="trdark">
                  <TD align="right" nowrap>País de Expiración: </TD>
				  <TD align="left" nowrap>
					<INPUT type="text" name="E01LCMECC" size="4" maxlength="3" value="<%= lcBasic.getE01LCMECC().trim()%>" readonly>
          		  </TD>
				  <TD align="right" nowrap>Tipo de Transporte: </TD>
				  <TD align="left" nowrap>
				  <SELECT name="E01LCMTTR" disabled="disabled">
  				    <OPTION value="A" <% if ((!lcBasic.getE01LCMTTR().equals("T")&& (!lcBasic.getE01LCMTTR().equals("M")))) out.println("selected"); %>>Aereo</OPTION>
               		<OPTION value="T" <% if (lcBasic.getE01LCMTTR().equals("T")) out.println("selected"); %>>Terrestre</OPTION>
               		<OPTION value="M" <% if (lcBasic.getE01LCMTTR().equals("M")) out.println("selected"); %>>Marítimo</OPTION>
			       </SELECT>
				</TD>
				</TR>
				
				<TR id="trclear">
				  <TD width="25%" align="right" nowrap>Seguro: </TD>
				  <TD nowrap width="25%">
                	<INPUT type="radio" disabled="disabled" name="E01LCMIFL" value="Y" <% if(lcBasic.getE01LCMIFL().equals("Y")) out.print("checked");%>>Si
                	<INPUT type="radio" disabled="disabled" name="E01LCMIFL" value="N" <% if(lcBasic.getE01LCMIFL().equals("N")) out.print("checked");%>>No
                  </TD>
                  <TD width="25%" align="right" nowrap>Desde </TD>
				  <TD nowrap width="25%">
                      <SELECT name="E01LCMIFR" disabled="disabled">
                        <OPTION value=" "> </OPTION>
                        <OPTION value="A" <% if(lcBasic.getE01LCMIFR().equals("A")) out.print("selected");%>>Lugar de Recepción</OPTION>
                        <OPTION value="B" <% if(lcBasic.getE01LCMIFR().equals("B")) out.print("selected");%>>Puerto/Aeropuerto de Salida</OPTION>
                    </SELECT>
                  </TD>
               </tr>
               
               <tr id="trdark">
               <TD width="25%" align="right" nowrap>Hasta: </TD>
				  <TD nowrap width="27%">
				    <SELECT name="E01LCMITO" disabled="disabled">
                        <OPTION value=" "> </OPTION>
                        <OPTION value="A" <% if(lcBasic.getE01LCMITO().equals("A")) out.print("selected");%>>Puerto/Aeropuerto de Destino</OPTION>
                        <OPTION value="B" <% if(lcBasic.getE01LCMITO().equals("B")) out.print("selected");%>>Lugar de Entrega</OPTION>
                    </SELECT>
                </TD>
                <TD align="right" nowrap>  Notificar a: </TD>
				  <TD align="left" nowrap>
					  <INPUT type="text" name="E01LCMNOT" size="50" maxlength="40" value="<%= lcBasic.getE01LCMNOT().trim()%>" readonly>
				  </TD>
               </tr>
               
               <tr id="trclear">
               	<TD width="25%" align="right" nowrap>Nro. de Días en Aduana: </TD>
				  <TD nowrap width="25%">
				    <INPUT type="text" name="E01LCMCDY" size="3" maxlength="2" value="<%= lcBasic.getE01LCMCDY().trim()%>" readonly>
                    </TD>
                 <TD width="25%" align="right" nowrap>Porcentaje Adicional</TD>
				  <TD nowrap width="25%">
                    <INPUT type="text" name="E01LCMAIP" size="3" maxlength="2" value="<%= lcBasic.getE01LCMAIP().trim()%>" readonly>
                  </TD>
               </tr>
		    
        </table>
      </td>
    </tr>
  </table>
  
  <br>
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>
				<TR id="trdark"> 
					<TD nowrap width="25%" align="right">Monto Garantía Efectivo: </TD>
					<TD nowrap width="25%"> 
						<INPUT name="E02LCMCAM" type="text" readonly value="<%= lcBasic.getE01LCMCAM().trim()%>" size="17" maxlength="16">
					</TD>
					<TD nowrap width="25%" align="right">Cuenta Garantía Efectivo: </TD>
					<TD nowrap width="27%">
						<INPUT name="E01LCMCCA" type="text" readonly value="<%= lcBasic.getE01LCMCCA().trim()%>" size="17" maxlength="16">
					</TD>
				</TR>
				<TR id="trclear">
					<TD align="right" nowrap>Linea de Cr&eacute;dito del Cliente: </TD>
					<TD align="left" nowrap>
						<INPUT type="text" name="E01LCMLNR" size="10" maxlength="9" value="<%= lcBasic.getE01LCMLNR().trim()%>" readonly>
                		<INPUT type="text" name="E01LCMCMN" size="4" maxlength="4" value="<%= lcBasic.getE01LCMCMN().trim()%>" readonly>
					</TD>
		            <TD nowrap width="25%" align="right">Centro de Costo: </TD>
            		<TD nowrap width="27%"> 
						<INPUT type="text" name="E01LCMCCN" size="9" maxlength="8" value="<%= lcBasic.getE01LCMCCN().trim()%>" readonly> 
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
						<INPUT type="text" name="E01LCMTAR" size="2" maxlength="2" value="<%= lcBasic.getE01LCMTAR().trim()%>" readonly>
            		<TD nowrap align="right">Nuestros Cargos por Cuenta de: </TD>
            		<TD nowrap>
              			<input type="text" name="E01LCMAOB" readonly size="15" maxlength="13" value="
							<%
								if (lcBasic.getE01LCMAOB().equals("A")) out.print("APLICANTE");
								else if (lcBasic.getE01LCMAOB().equals("B")) out.print("BENEFICIARIO");
								else out.print("");%>">
                	</TD>
			 	</TR>   
          		<TR id="trclear">
            		<TD nowrap align="right">Cuenta Débito Comisiones: </TD>
            		<TD nowrap>
            			<INPUT type="text" name="E01LCMSCA" size="17" maxlength="12" value="<%= lcBasic.getE01LCMSCA().trim()%>" readonly>
					</TD> 
			  		<TD align="right" nowrap>Cargos O/B por Cuenta de: </TD>
					<TD align="left" nowrap>
						<SELECT name="E01LCMOBC" disabled>
                    		<OPTION value=" "></OPTION>
                    		<OPTION value="A" <% if(lcBasic.getE01LCMOBC().equals("A")) out.print("selected");%>>Aplicante</OPTION>
                    		<OPTION value="B" <% if(lcBasic.getE01LCMOBC().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
                  		</SELECT>
                  	</TD>
				</TR>        
				<TR id="trdark">
            		<TD nowrap width="25%" align="right">Ciclo de Pago de Comisiones: </TD>
            		<TD nowrap width="27%">
            			<INPUT type="text" name="E01LCMCCD" size="3" maxlength="3" value="<%= lcBasic.getE01LCMCCD().trim()%>" readonly>
            			<INPUT type="hidden" name="E01LCMCCC" value="<%= lcBasic.getE01LCMCCC().trim()%>">
						<SELECT name="CE01LCMCCC" disabled>
							<OPTION value="D" <% if(lcBasic.getE01LCMCCC().equals("D")) out.print("selected");%>>Dias</OPTION>
							<OPTION value="M" <% if(lcBasic.getE01LCMCCC().equals("M")) out.print("selected");%>>Meses</OPTION>
							<OPTION value="Y" <% if(lcBasic.getE01LCMCCC().equals("Y")) out.print("selected");%>>Anos</OPTION>
						</SELECT>
					</TD>
            		<TD nowrap width="25%" align="right">Fecha de Próximo Pago de Comisiones: </TD>
            		<TD nowrap width="25%"> 
					<eibsinput:date name="lcBasic" fn_month="E01LCMSCM" fn_day="E01LCMSCD" fn_year="E01LCMSCY" readonly="true"/>
            		</TD>
				</TR>
          		<TR id="trclear"> 
            		<TD nowrap width="25%" align="right">Com. Apertura Día de Emisión: </TD>
            		<TD nowrap width="25%">
                		<INPUT type="radio" name="E01LCMOCI" value="Y" <% if(lcBasic.getE01LCMOCI().equals("Y")) out.print("checked");%> disabled>Si
                		<INPUT type="radio" name="E01LCMOCI" value="N" <% if(lcBasic.getE01LCMOCI().equals("N")) out.print("checked");%> disabled>No
                	</TD>
            		<TD nowrap width="25%" align="right">Com. Enmienda Día de Enmienda: </TD>
            		<TD nowrap width="27%">
                		<INPUT type="radio" name="E01LCMACI" value="Y" <% if(lcBasic.getE01LCMACI().equals("Y")) out.print("checked");%> disabled>Si
                		<INPUT type="radio" name="E01LCMACI" value="N" <% if(lcBasic.getE01LCMACI().equals("N")) out.print("checked");%> disabled>No
  			        </TD>
				</TR>
           </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TABLE>

  <%if(lcBasic.getH01FLGWK3().equals("Y")){%>
  <H4>Intereses</H4>
  <TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>
		  <TR id="trdark">
			  <TD nowrap width="25%" height="19"> 
				 <div align="right">Tipo de Inter&eacute;s: </div>
			  </TD>
			  <TD nowrap width="25%" height="19">
			     <INPUT type="text" name="E01LCMICT" readonly size="1" maxlength="1" value="<%= lcBasic.getE01LCMICT().trim()%>">
			  </TD>
			  <TD nowrap width="25%" height="19"> 
			     <div align="right">Tasa de Inter&eacute;s: </div>
			  </TD>
			  <TD nowrap width="27%" height="19">
			     <INPUT type="text" name="E01LCMIRT" readonly size="9" maxlength="9" value="<%= lcBasic.getE01LCMIRT().trim()%>">
			  </TD>
		  </TR>
		  <TR id="trclear">
			  <TD nowrap width="25%" height="19"> 
			    <div align="right">Tabla / Tipo de Tasa Flotante: </div>
			  </TD>
			  <TD nowrap width="25%" height="19">
			     <INPUT type="text" readonly name="E01LCMFTB" size="2" maxlength="2" value="<%= lcBasic.getE01LCMFTB().trim()%>">
			     <INPUT type="text" readonly name="E01LCMFTY" size="20" 
				  value="<% if (lcBasic.getE01LCMFTY().equals("FP")) out.print("Tasa Primaria");
							else if (lcBasic.getE01LCMFTY().equals("FS")) out.print("Tasa Secundaria");
							else out.print("");%>">
			  </TD>
			  <TD nowrap width="25%" height="19"> 
			    <div align="right" >Per&iacute;odo Base Calc.Intereses: </div> 
			  </TD>
			  <TD nowrap width="27%" height="19">
			     <INPUT type="text" name="E01LCMBAS" readonly size="3" maxlength="3" value="<%= lcBasic.getE01LCMBAS().trim()%>" onkeypress="enterInteger(event)"> 
			  </TD>
		 </TR>
		    <TR id="trdark">
					<TD nowrap width="25%" align="right">Ciclo de Pago de Intereses: </TD>
					<TD nowrap width="25%" align="left">
                       <INPUT type="text" name="E01LCMIPC" size="3" maxlength="3" value="<%= lcBasic.getE01LCMIPC().trim()%>" onkeypress="enterInteger(event)" readonly="readonly"> 
                    </TD>
					<TD nowrap width="25%" align="right">Fecha Prox.Pago Intereses: </TD>
					<TD nowrap width="25%">
						<eibsinput:date name="lcBasic" fn_month="E01LCMNPM" fn_day="E01LCMNPD" fn_year="E01LCMNPY" readonly="true"/>
                    </TD>	
		    </TR>
		 <TR id="trclear">
					<TD nowrap width="25%" align="right">Condonar Intereses en Cancelacion: </TD>
					<TD nowrap width="25%">
					   <INPUT type="radio" name="E01LCMWIF" value="Y" <% if(lcBasic.getE01LCMWIF().equals("Y")) out.print("checked");%> disabled>Si
                	   <INPUT type="radio" name="E01LCMWIF" value="N" <% if(lcBasic.getE01LCMWIF().equals("N")) out.print("checked");%> disabled>No  
					</TD>
				    <TD nowrap width="25%" align="right">Cuenta de Repago de Intereses: </TD>
					<TD nowrap width="25%">
				       <INPUT type="text" name="E01LCMIPA" size="17" maxlength="12" value="<%= lcBasic.getE01LCMIPA().trim()%>">
					</TD>
		  </TR>
           </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TABLE>
  <%}%>

  <H4>Participantes</H4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark">
            <td nowrap colspan="2">
              <div align="left"><b>Aplicante / Ordenante</b></div>
            </td>
            <td nowrap width="8%">&nbsp; </td>
            <td nowrap colspan="2"><b>Beneficiario</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <div align="left">
                <input type="text" name="E01LCMAP1" readonly size="62" maxlength="60" value="<%= userPO.getHeader10() %>">
              </div>
            </td>
            <td nowrap width="8%">&nbsp; </td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMBN1" readonly size="62" maxlength="60" value="<%= lcBasic.getE01LCMBN1() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAP2" readonly size="62" maxlength="60" value="<%= userPO.getHeader11() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMBN2" readonly size="62" maxlength="60" value="<%= lcBasic.getE01LCMBN2() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAP3" readonly size="62" maxlength="60" value="<%= userPO.getHeader12() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMBN3" readonly size="62" maxlength="60" value="<%= lcBasic.getE01LCMBN3() %>">
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <input type="text" name="E01LCMAP4" readonly size="62" maxlength="60" value="<%= userPO.getHeader13() %>">
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <input type="text" name="E01LCMBN4" readonly size="62" maxlength="60" value="<%= lcBasic.getE01LCMBN4() %>">
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="26%" colspan="2">
              <div align="left">Cliente / Cuenta No. :
              <input type="text" name="E01LCMAPA" readonly size="14" maxlength="12" value="<%= userPO.getHeader14() %>">
			  </div>              
            </td>
            <td nowrap width="8%">
              <div align="left"> </div>
            </td>
            <td nowrap width="36%" colspan="2">
              <div align="left">Cliente / Cuenta No. :
              <input type="text" name="E01LCMBAC" readonly size="14" maxlength="12" value="<%= lcBasic.getE01LCMBAC() %>">
			</div>              
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2"><b>Banco Corresponsal / Confirmador</b></td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2"><b>Banco Corresponsal / Línea</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMAB1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMCB1" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMAB2" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMCB2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMAB3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMCB3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMAB4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMCB4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="26%" colspan="2">
              <div align="left">Cuenta No. :
              <input type="text" name="E01LCMABA" readonly size="14" maxlength="12" value="<%= lcBasic.getE01LCMABA() %>">
			  </div>              
            </td>
            <td nowrap width="8%">&nbsp;</td>            
            <td nowrap width="36%" colspan="2" >Cliente / Linea de Credito :
              <input type="text" name="E01LCMCOR" readonly size="11" maxlength="9" value="<%= lcBasic.getE01LCMCOR() %>">
              <input type="text" name="E01LCMCMG" readonly size="4"  maxlength="4" value="<%= lcBasic.getE01LCMCMG() %>">              
            </td>
          </tr>

          <tr id="trdark">
            <td nowrap colspan="2"><b>Banco Reembolsador</b></td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2"><b>Banco Avisador / Avisar a Traves de</b></td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMRB1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMCA1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMRB2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMCA2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMRB3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMCA3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMRB4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
            <td nowrap width="8%">&nbsp;</td>
            <td nowrap colspan="2">
              <eibsinput:text name="lcBasic" property="E01LCMCA4" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
            </td>
          </tr>
          <tr id="trclear">
            <td nowrap width="26%" colspan="2">
              <div align="left">Cliente / Cuenta No. :
              <input type="text" name="E01LCMRBA" readonly size="14" maxlength="12" value="<%= lcBasic.getE01LCMRBA() %>">
			  </div>              
            </td>
            <td nowrap width="8%" colspan="3">&nbsp;</td>            
          </tr>
        </table>
      </td>
    </tr>
  </table>

			  
  <H4>Informaci&oacute;n Adicional</H4>
  <table class="tableinfo">
    <tr>
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="0">

        
            <TR id="trdark">
              <TD nowrap align="right" width="25%">Reglas a Aplicar:</TD>
              <td nowrap >&nbsp;</td>
              <TD nowrap >
	              <input type="text" readonly size="35" value="<%= lcBasic.getE01DSCAPR() %>">
                  <input type="text" readonly size="35" value="<%= lcBasic.getE01LCMST3() %>">
			  </TD>
            </TR>

            <TR id="trclear">
              <TD nowrap align="right" >Lugar de&nbsp;Recepci&oacute;n:</TD>
              <td nowrap >&nbsp;</td>              
              <TD nowrap >
	              <input type="text" readonly size="65" value="<%= lcBasic.getE01LCMPLR() %>">
			  </TD>
            </TR>

            <TR id="trdark">
              <TD nowrap align="right" >Puerto/Aeropuerto de Salida:</TD>
              <td nowrap >&nbsp;</td>              
              <TD nowrap >
	              <input type="text" readonly size="65" value="<%= lcBasic.getE01LCMPOL() %>">
			  </TD>
            </TR>


            <TR id="trclear">
              <TD nowrap align="right" >Puerto/Aeropuerto de Destino:</TD>
              <td nowrap >&nbsp;</td>              
              <TD nowrap >
	              <input type="text" readonly size="65" value="<%= lcBasic.getE01LCMPOD() %>">
			  </TD>
            </TR>

            <TR id="trdark">
              <TD nowrap align="right" >Lugar de Entrega:</TD>
              <td nowrap >&nbsp;</td>              
              <TD nowrap >
	              <input type="text" readonly size="65" value="<%= lcBasic.getE01LCMPLD() %>">
			  </TD>
            </TR>

          <tr id="trclear">
            <td nowrap colspan="3">
              <div align="center"><b>Mercanc&iacute;a</b> </div>
            </td>
          </tr>
          <tr id="trdark">
            <td nowrap colspan="3">
              <div align="center">
                <textarea readonly name="E01LCMME" rows=5 cols=40><%=lcBasic.getE01LCMME1()  + lcBasic.getE01LCMME2()  + lcBasic.getE01LCMME3()  %></textarea>
              </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <H4>Documentos Requeridos</H4>
  <table class="tableinfo">
    <tr >
      <td nowrap>
        <table cellspacing="0" cellpadding="2" width="100%" border="1" bordercolor="#000000">
          <tr bordercolor="#FFFFFF">
            <td nowrap>
              <table cellspacing="0" cellpadding="2" width="100%" border="0">
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="center">C&oacute;digo </div>
                  </td>
                  <td nowrap width="81%">
                    <div align="center">Descripci&oacute;n </div>
                  </td>
                  <td nowrap width="5%">
                    <div align="center">Original</div>
                  </td>
                  <td nowrap width="6%">
                    <div align="center">Copia </div>
                  </td>
                </tr>
                <% if(!lcBasic.getE01LCMDD1() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD1() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS1() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD01().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD01().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD2() .equals("")){%>
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD2() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS2() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD02().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD02().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD3() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD3() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS3() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD03().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD03().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD4() .equals("")){%>
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD4() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS4() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD04().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD04().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD5() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD5() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS5() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD05().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD05().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD6() .equals("")){%>
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD6() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS6() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD06().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD06().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD7() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD7() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS7() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD07().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD07().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD8() .equals("")){%>
                <tr id="trdark">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD8() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS8() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD08().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD08().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%> <% if(!lcBasic.getE01LCMDD9() .equals("")){%>
                <tr id="trclear">
                  <td nowrap width="8%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDD9() %></td>
                  <td nowrap width="81%">
                    <div align="left"></div>
                    <%= lcBasic.getE01LCMDS9() %></td>
                  <td nowrap width="5%">
                    <div align="center"></div>
                    <%= lcBasic.getE01LCMD09().charAt(0)%></td>
                  <td nowrap width="6%">
                    <div align="center"></div>
                    <% try { out.print(lcBasic.getE01LCMD09().charAt(1)); } catch (Exception e) { out.print("0"); }%></td>
                </tr>
                <%}%>
              </table>
            </td>
          </tr>
        </table>

      </td>
    </tr>
  </table>
</form>
</body>
</html>
