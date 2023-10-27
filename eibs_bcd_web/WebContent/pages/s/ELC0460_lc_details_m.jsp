<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.constants.EibsFields"%>
<HTML>
<HEAD>
<TITLE>Consulta de Historial de Carta de Credito</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<jsp:useBean id="msg046002" class="datapro.eibs.beans.ELC046002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<SCRIPT type="text/javascript">
  <% if(request.getParameter("OPTMENU") != null) { %>
   		builtNewMenu(<%= request.getParameter("OPTMENU")%>);
   <%} else {
   		if (msg046002.getE02LCMTYP().equals("R") || msg046002.getE02LCMTYP().equals("S")) {%>
		builtNewMenu(sb_his_inq);
	  <% } else { %>
		builtNewMenu(lc_his_inq);
	  <% }
	  }%>
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
<%@ page import = "datapro.eibs.master.Util" %>
<H3 align="center">Consulta de Historial de Cartas de Crédito<IMG src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="lc_details_m.jsp,ELC0460"></H3> 

<HR size="4">
<FORM method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSELC0460" >

  <INPUT NAME="SCREEN" TYPE=HIDDEN VALUE="5004" readonly="readonly">
  <INPUT NAME="MSG" TYPE=HIDDEN VALUE="ELC050002" readonly="readonly">
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="18%" align="right"><b>Tipo de Operacion :</b></td>
      <td width="18%"><input name="E01LCMBNK" type="text" id="E02LCMBNK" value="<%= userPO.getHeader1() %>" size="30" maxlength="30" readonly></td>
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
<table class="tableinfo" cellspacing="0" cellpadding="2" width="100%" border="0" >
    <tr id="trdark">
      <td width="20%" align="right"><b>Banco :</b></td>
      <td width="30%"><input name="E01LCMBNK" type="text" id="E01LCMBNK" value="<%= msg046002.getE02LCMBNK() %>" size="2" maxlength="2" readonly></td>
      <td height="30%" align="right"><b>Numero de Carta de Credito  :</b></td>
      <td width="20%"><input type="text" name="E02ACC" size="16"
			maxlength="12" value="<%= msg046002.getE02LCMACC() %>" readonly></td>
    </tr>

    <tr id="trclear">
      <td align="right"><b>Producto :</b></td>
      <td><b>
        <input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= msg046002.getE02LCMPRO() %>">
      </b></td>
      <td align="right"><b>Descripcion del Producto :</b></td>
      <td><b>
        <input type="text" name="E02NA122" size="35" maxlength="30" readonly value="<%= "".equals(msg046002.getE02DSCPRO().trim())?userPO.getHeader22():msg046002.getE02DSCPRO().trim() %>">
      </b></td>
    </tr>
    <tr id="trdark">
      <td align="right"><b>Moneda :</b></td>
      <td><b>
        <input name="E01LCMCCY" type="text" id="E01LCMCCY" value="<%= msg046002.getE02LCMCCY() %>" size="3" maxlength="3" readonly>
      </b></td>
      <td align="right"><b>Oficial :</b></td>
      <td><b>
        <input type="text" name="E01DSCOFC" size="40" maxlength="35" readonly value="<%= userPO.getOfficer() %>">
      </b></td>
    </tr>
    <tr id="trclear">
      <td align="right"><b>Cliente : </b></td>
      <td><input type="text" name="E02CUN2" size="9" maxlength="9" readonly value="<%= msg046002.getE02LCMCUN() %>"></td>
      <td align="right"><b>Nombre :</b></td>
      <td><input type="text" name="E02NA12" size="45" maxlength="45" readonly value="<%= msg046002.getE02CUSNA1() %>"></td>
    </tr>
  </table>
   <H4>Tipo de Operaci&oacute;n</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark">
                <TD nowrap width="16%" align="right"><B>Enmienda :</B> </TD>
                <TD nowrap width="20%" align="left"><% if (msg046002.getE02LCMAMF().equals("Y")) out.print("YES"); else out.print("NO");%>
                    <INPUT name="E01LCMLAN" type="HIDDEN"
							value="<%= msg046002.getE02LCMLAN().trim()%>" readonly="readonly">
                </TD>
                <TD nowrap width="16%" align="right"><B>Ultima Enmienda : </B> </TD>
                <TD nowrap width="16%" align="left"><B>
                  <INPUT type="text" name="E01LCMLAN" size="4"
							maxlength="4" value="<%= msg046002.getE02LCMLAN().trim()%>" readonly>
                  </B>
                    <INPUT name="E01LCMLAN" type="HIDDEN" value="<%= msg046002.getE02LCMLAN().trim()%>" readonly="readonly"></TD>
                <TD nowrap width="16%" align="right"><B>Fecha Ultima Enmienda : </B></TD>
                <TD nowrap width="16%" align="left"><B>
					<eibsinput:date name="msg046002" fn_month="E02LCMLAM" fn_day="E02LCMLAD" fn_year="E02LCMLAY" readonly="true"/>
				</TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
  
<H4>Información de la Carta de Crédito</H4>
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY><TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
              Fecha de Emisión: </TD>
            <TD nowrap width="25%"> 
				<eibsinput:date name="msg046002" fn_month="E02LCMIDM" fn_day="E02LCMIDD" fn_year="E02LCMIDY" readonly="true"/>
			</TD>
            <TD width="25%" align="right" nowrap> 
              Fecha de Expiración: </TD>
            <TD nowrap width="27%"> 
				<eibsinput:date name="msg046002" fn_month="E02LCMEXM" fn_day="E02LCMEXD" fn_year="E02LCMEXY" readonly="true"/>
			</TD>
          </TR>   
           <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Ultima Fecha de Embarque: </TD>
            <TD nowrap width="25%"> 
				<eibsinput:date name="msg046002" fn_month="E02LCMSDM" fn_day="E02LCMSDD" fn_year="E02LCMSDY" readonly="true"/>
			    			</TD>
            <TD width="25%" align="right" nowrap> 
              Fecha de Aviso/Confirmación: </TD>
            <TD nowrap width="27%"> 
				<eibsinput:date name="msg046002" fn_month="E02LCMCNM" fn_day="E02LCMCND" fn_year="E02LCMCNY" readonly="true"/>
             </TD>
          </TR>                        
           <TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
             Oficina: </TD>
            <TD nowrap width="25%">
            	<INPUT type="text" name="E02LCMBRN" size="5" maxlength="4" value="<%= msg046002.getE02LCMBRN().trim() %>" readonly>
            </TD>
            <TD width="25%" align="right" nowrap> 
              Moneda / Tipo de Cambio M/E: </TD>
            <TD nowrap width="27%"> 
              <INPUT type="text" name="E02LCMFCY" value="<%= msg046002.getE02LCMFCY().trim()%>" size="4" maxlength="3" readonly>
              <INPUT type="text" name="E02LCMOFX" size="12" maxlength="11" value="<%= msg046002.getE02LCMOFX().trim()%>" disabled="disabled">
            </TD>
          </TR>                        
           <TR id="trclear"> 
            <TD width="25%" align="right" nowrap>
            Monto del Crédito: 
             </TD>
            <TD nowrap width="25%"> 
            <INPUT name="E02LCMOAM" type="text" onKeyPress="enterDecimal(event)" value="<%= msg046002.getE02LCMOAM().trim()%>" size="17" maxlength="16" readonly="readonly">
			</TD>
            <TD width="25%" align="right" nowrap> 
            Garantía Documentos de Embarque: 
               </TD>
            <TD nowrap width="27%"> 
                    <INPUT disabled type="radio" name="E02LCMGDE" value="Y" <% if(msg046002.getE02LCMGDE().equals("Y")) out.print("checked");%>>Si
                	<INPUT disabled type="radio" name="E02LCMGDE" value="N" <% if(!msg046002.getE02LCMGDE().equals("Y")) out.print("checked");%>>No
              </TD>
          </TR>         
           <TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
              Clausula de Aproximación: </TD>
            <TD width="25%" align="left" nowrap> 
                	<INPUT name="E02LCMABC" type="radio" disabled value="Y" readonly="readonly" <% if(msg046002.getE02LCMABC().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMABC" type="radio" disabled value="N" readonly="readonly" <% if(msg046002.getE02LCMABC().equals("N")) out.print("checked");%>>No
    	        &nbsp; &nbsp; &nbsp; Porcentaje: <INPUT name="E02LCMABP" type="text" onkeypress="enterInteger(event)"
				value="<%if(msg046002.getE02LCMABP().trim().length() == 1 && !msg046002.getE02LCMABP().trim().equals("0")) out.print("0");%><%= msg046002.getE02LCMABP().trim()%>" size="2" maxlength="2" readonly="readonly">
    	        <INPUT name="E02LCMAPM" type="text" onkeypress="enterInteger(event)"
				value="<%if(msg046002.getE02LCMAPM().trim().length() == 1 && !msg046002.getE02LCMAPM().trim().equals("0")) out.print("0");%><%= msg046002.getE02LCMAPM().trim()%>" size="2" maxlength="2" readonly="readonly"></TD>
            <TD width="25%" align="right" nowrap> 
              Incoterms: </TD>
            <TD nowrap width="27%"> 
              <INPUT name="E02LCMITR" type="text" value="<%= msg046002.getE02LCMITR().trim()%>" size="4" maxlength="4" readonly="readonly">
               			</TD>
          </TR>           
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Tenor: </TD>
            <TD nowrap width="25%"> 
				<SELECT name="E02LCMTNR" disabled>
                	<OPTION value=" "></OPTION>
                	<OPTION value="S" <% if(msg046002.getE02LCMTNR().equals("S")) out.print("selected");%>>Pago</OPTION>
                	<OPTION value="A" <% if(msg046002.getE02LCMTNR().equals("A")) out.print("selected");%>>Aceptación</OPTION>
                	<OPTION value="M" <% if(msg046002.getE02LCMTNR().equals("M")) out.print("selected");%>>Pago Mixto</OPTION>
                	<OPTION value="D" <% if(msg046002.getE02LCMTNR().equals("D")) out.print("selected");%>>Pago Diferido</OPTION>
                	<OPTION value="N" <% if(msg046002.getE02LCMTNR().equals("N")) out.print("selected");%>>Negociación</OPTION>
              	</SELECT></TD>
            <TD width="25%" align="right" nowrap> 
              Confirmada: </TD>
            <TD nowrap width="27%"> 
                	<INPUT name="E02LCMCNF" type="radio" disabled value="Y" readonly="readonly" <% if(msg046002.getE02LCMCNF().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMCNF" type="radio" disabled value="N" readonly="readonly" <% if(msg046002.getE02LCMCNF().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>   
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
              Agregar Confirmacion: </TD>
            <TD nowrap width="25%"> 
                	<INPUT name="E02LCMCNO" type="radio" disabled value="Y" readonly="readonly" <% if(msg046002.getE02LCMCNO().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMCNO" type="radio" disabled value="N" readonly="readonly" <% if(msg046002.getE02LCMCNO().equals("N")) out.print("checked");%>>
                	No</TD>
            <TD width="25%" align="right" nowrap> 
              Transferible: </TD>
            <TD nowrap width="27%"> 
                	<INPUT name="E02LCMTRN" type="radio" disabled value="Y" readonly="readonly" <% if(msg046002.getE02LCMTRN().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMTRN" type="radio" disabled value="N" readonly="readonly" <% if(msg046002.getE02LCMTRN().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>       
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Embarques Parciales: </TD>
            <TD nowrap width="25%"> 
                	<INPUT name="E02LCMPSH" type="radio" disabled value="Y" readonly="readonly" <% if(msg046002.getE02LCMPSH().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMPSH" type="radio" disabled value="N" readonly="readonly" <% if(msg046002.getE02LCMPSH().equals("N")) out.print("checked");%>>
                	No</TD>
            <TD width="25%" align="right" nowrap>
            	Transbordo: </TD>
            <TD nowrap width="27%">
                	<INPUT name="E02LCMTSH" type="radio" disabled value="Y" readonly="readonly" <% if(msg046002.getE02LCMTSH().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMTSH" type="radio" disabled value="N" readonly="readonly" <% if(msg046002.getE02LCMTSH().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>  
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap> 
              Agente: </TD>
            <TD nowrap width="25%"> 
            <INPUT name="E02LCMBRK" type="text" disabled value="<%= msg046002.getE02LCMBRK().trim()%>" size="3" maxlength="3" readonly="readonly"></TD>
             <% if (userPO.getID().equals("18") ) { %>		
              		<TD width="25%" align="right" nowrap>Notario: </TD>
              		<TD nowrap width="27%"><INPUT type="text" name="E02LCMUC5" size="6" maxlength="3" value="<%= msg046002.getE02LCMUC5().trim()%>"></TD>
			  <% } else {%>
				  	<TD width="25%" align="right" nowrap></TD>
				  	<TD width="25%" align="right" nowrap></TD>
			  <% } %>

        
            <!-- 
            <TD width="25%" align="right" nowrap> 
              % Garantía Efectivo: </TD>
            <TD nowrap width="27%"> 
  			<INPUT name="E02LCMCPE" type="text" disabled onKeyPress="enterDecimal(event)" value="<%= msg046002.getE02LCMCPE().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
             -->
            
          </TR>   
          <TR id="trclear">
            <TD align="right" nowrap>Número Referencia ALADI:  </TD>
            <TD nowrap><INPUT readonly type="text" name="E02LCMSRF" size="17" maxlength="16" value="<%= msg046002.getE02LCMSRF().trim()%>"></TD> 
            <TD width="25%" align="right" nowrap>Nro.Solicitud de Carta de Credito: </TD>
            <TD nowrap width="27%"> 
            	<INPUT readonly type="text" name="E02LCMRF1" size="18" maxlength="16" value="<%= msg046002.getE02LCMRF1().trim()%>">
            </TD>
          </TR>        
          <TR id="trdark">
				<TD width="25%" align="right" nowrap>Referencia del Cliente: </TD>
				<TD nowrap width="27%">
					<INPUT readonly type="text" name="E02LCMRF2" size="18" maxlength="16" value="<%= msg046002.getE02LCMRF2().trim()%>">
				</TD>
			  <TD width="25%" align="right" nowrap></TD>
			  <TD width="25%" align="right" nowrap>
			  </TD>
			 </TR>
			 <TR id="trclear">
					<TD width="25%" align="right" nowrap>Reglas a Aplicar: </TD>
					<TD nowrap width="27%" colspan="3"><SELECT name="E02LCMAPR" disabled>
						<OPTION value=""></OPTION>
						<OPTION value="1" <% if(msg046002.getE02LCMAPR().equals("1") || msg046002.getE02LCMAPR().equals("")) out.print("selected");%>>UCP Latest Version</OPTION>
						<OPTION value="2" <% if(msg046002.getE02LCMAPR().equals("2")) out.print("selected");%>>EUCP Latest Version</OPTION>
						<OPTION value="3" <% if(msg046002.getE02LCMAPR().equals("3")) out.print("selected");%>>UCPURR Latest Version</OPTION>
						<OPTION value="4" <% if(msg046002.getE02LCMAPR().equals("4")) out.print("selected");%>>EUCPURR Latest Version</OPTION>
						<OPTION value="5" <% if(msg046002.getE02LCMAPR().equals("5")) out.print("selected");%>>ISP Latest Version</OPTION>
						<OPTION value="6" <% if(msg046002.getE02LCMAPR().equals("6")) out.print("selected");%>>Other</OPTION>
					</SELECT>
					<INPUT readonly type="text" name="E02LCMST3" size="60" maxlength="80" value="<%= msg046002.getE02LCMST3().trim()%>"></TD>
				</TR>
          <TR id="trdark">
			  <TD width="25%" align="right" nowrap>Lugar de Expiraci&oacute;n: </TD>
				<TD nowrap width="27%" colspan="3"> 
				<INPUT readonly type="text" name="E02LCMPLE" size="90" maxlength="80" value="<%= msg046002.getE02LCMPLE().trim()%>">
           </TD>
			 </TR>

				<TR id="trclear">
			  <TD width="25%" align="right" nowrap>Lugar de&nbsp;Recepci&oacute;n Mercancia: </TD>
				<TD nowrap width="27%" colspan="3">
            <INPUT readonly type="text" name="E02LCMPLR" size="90" maxlength="80" value="<%= msg046002.getE02LCMPLR().trim()%>">           </TD>
			 </TR>
				<TR id="trdark">
				  <TD width="25%" align="right" nowrap>Puerto/Aeropuerto de Salida: </TD>
					<TD nowrap width="27%" colspan="3">
            <INPUT readonly type="text" name="E02LCMPOL" size="90" maxlength="80" value="<%= msg046002.getE02LCMPOL().trim()%>"></TD>
				</TR>
				<TR id="trclear">
				<TD width="25%" align="right" nowrap>Puerto/Aeropuerto de Destino: </TD>
					<TD nowrap width="27%" colspan="3"><INPUT readonly type="text" name="E02LCMPOD" size="90" maxlength="80" value="<%= msg046002.getE02LCMPOD().trim()%>"></TD>
				</TR>
			<TR id="trdark">
				<TD width="25%" align="right" nowrap>Lugar de Entrega Mercancia: </TD><TD nowrap width="27%" colspan="3">
				<INPUT readonly type="text" name="E02LCMPLD" size="90" maxlength="80" value="<%= msg046002.getE02LCMPLD().trim()%>"></TD>
			</TR>
			<TR id="trclear">
				<TD align="right" nowrap>  Notificar a: </TD>
				  <TD align="left" nowrap>
					  <INPUT readonly type="text" name="E02LCMNOT" size="50" maxlength="40" value="<%= msg046002.getE02LCMNOT().trim()%>">
				  </TD>
				  <TD align="right" nowrap>Flete:</TD>
				  <TD align="left" nowrap>
				  <SELECT name="E02LCMFRC" disabled>
                  		<OPTION value=" "></OPTION>
            	       	<OPTION value="P" <% if(msg046002.getE02LCMFRC().equals("P")) out.print("selected");%>>Pagado</OPTION>
                   		<OPTION value="C" <% if(msg046002.getE02LCMFRC().equals("C")) out.print("selected");%>>Al Cobro</OPTION>
                  </SELECT>
                  </TD>
			</TR>
				<TR id="trdark">
				  <TD align="right" nowrap>Credito Disponible Con: </TD>
				  <TD align="left" nowrap><INPUT readonly type="text" name="E02LCMAWI" size="26" maxlength="25" value="<%= msg046002.getE02LCMAWI().trim()%>">
				  </TD>
				  <TD align="right" nowrap>Banco Girado: </TD>
				  <TD align="left" nowrap><INPUT readonly type="text" name="E02LCMDWI" size="26" maxlength="25" value="<%= msg046002.getE02LCMDWI().trim()%>">
			     </TD>
		     </TR>
		     <TR id="trclear">
                  <TD align="right" nowrap>Nro. Días Plazo: </TD>
				  <TD align="left" nowrap><INPUT readonly type="text" name="E02LCMTRM" size="5" maxlength="3" value="<%= msg046002.getE02LCMTRM().trim()%>" ></TD>

				  <TD align="right" nowrap>T&eacute;rmino: </TD>
				  <TD align="left" nowrap>
				  <SELECT name="E02LCMTRC" disabled>
				                	<OPTION value="  " <% if ((!msg046002.getE02LCMTRC().equals("BL")) && (!msg046002.getE02LCMTRC().equals("NE"))) out.println("selected"); %>></OPTION>
			                		<OPTION value="BL" <% if (msg046002.getE02LCMTRC().equals("BL")) out.println("selected"); %>>Después de Fecha de Embarque</OPTION>
		                			<OPTION value="NE" <% if (msg046002.getE02LCMTRC().equals("NE")) out.println("selected"); %>>Despues de Fecha  Negociación</OPTION>
			      </SELECT>
				</TD>
		     	</TR>
		     	<TR id="trdark">
                  <TD align="right" nowrap>País de Expiración: </TD>
				  <TD align="left" nowrap>
					<INPUT readonly type="text" name="E02LCMECC" size="4" maxlength="3" value="<%= msg046002.getE02LCMECC().trim()%>">
          		  </TD>
				  <TD align="right" nowrap>Tipo de Transporte: </TD>
				  <TD align="left" nowrap>
				  <SELECT name="E02LCMTTR" disabled>
				  				  <OPTION value="A" <% if ((!msg046002.getE02LCMTTR().equals("T")&& (!msg046002.getE02LCMTTR().equals("M")))) out.println("selected"); %>>Aereo</OPTION>
			                		<OPTION value="T" <% if (msg046002.getE02LCMTTR().equals("T")) out.println("selected"); %>>Terrestre</OPTION>
		                			<OPTION value="M" <% if (msg046002.getE02LCMTTR().equals("M")) out.println("selected"); %>>Marítimo</OPTION>
			       </SELECT>
				</TD>
		     	</TR>
			 <TR id="trclear">
                  <TD align="right" nowrap>Plazo Financiamiento Banco: </TD>
				  <TD align="left" nowrap>
				  <INPUT readonly type="text" name="E02LCMNRD" size="5" maxlength="3" value="<%= msg046002.getE02LCMNRD().trim()%>" >
				  				  <SELECT name="E02LCMTC1" disabled>
				                	<OPTION value="  " <% if ((!msg046002.getE02LCMTC1().equals("BL"))) out.println("selected"); %>></OPTION>
			                		<OPTION value="BL" <% if (msg046002.getE02LCMTC1().equals("BL")) out.println("selected"); %>>Después de Fecha de Embarque</OPTION>
		          </SELECT></TD>

				  <TD align="right" nowrap>Plazo Financiamiento Proveedor: </TD>
				  <TD align="left" nowrap>
				  <INPUT readonly type="text" name="E02LCMRDY" size="5" maxlength="3" value="<%= msg046002.getE02LCMRDY().trim()%>" >
				  				  <SELECT name="E02LCMTC2" disabled>
				  				  <OPTION value="  " <% if ((!msg046002.getE02LCMTC2().equals("BL")) && (!msg046002.getE02LCMTC2().equals("NE"))) out.println("selected"); %>></OPTION>
			                		<OPTION value="BL" <% if (msg046002.getE02LCMTC2().equals("BL")) out.println("selected"); %>>Después de Fecha de Embarque</OPTION>
		                			<OPTION value="NE" <% if (msg046002.getE02LCMTC2().equals("NE")) out.println("selected"); %>>Despues de Fecha  Negociación</OPTION>
			       </SELECT>
				</TD>
		     	</TR>
		     	<TR id="trdark">
				  <TD width="25%" align="right" nowrap>Generar Swift: </TD>
				  <TD nowrap width="25%"><INPUT disabled type="radio" name="E02LCMSWF" value="Y" <% if(msg046002.getE02LCMSWF().equals("Y")) out.print("checked");%>>
				    Si
				    <INPUT disabled type="radio" name="E02LCMSWF" value="N" <% if( !msg046002.getE02LCMSWF().equals("Y")) out.print("checked");%>>
				    No </TD>
				  <TD align="right" nowrap>Tipo de Mensaje Swift: </TD>
				  <TD align="left" nowrap><SELECT disabled name="E02LCMSMT">
				  	  <% if (msg046002.getE02LCMTYP().equals("O")) { %>	
                      <OPTION value="700" <% if(msg046002.getE02LCMSMT().equals("700")) out.print("selected");%>>MT700</OPTION>
                      <OPTION value="705" <% if(msg046002.getE02LCMSMT().equals("705")) out.print("selected");%>>MT705</OPTION>
                      <% } else { %>
                      <OPTION value="710" <% if(msg046002.getE02LCMSMT().equals("710")) out.print("selected");%>>MT710</OPTION>
                      <OPTION value="730" <% if(msg046002.getE02LCMSMT().equals("730")) out.print("selected");%>>MT730</OPTION>
                      <% } %>
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
  <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
              Monto Garantía Efectivo: </TD>
            <TD nowrap width="25%"> 
				<INPUT name="E02LCMCAM" type="text" disabled onKeyPress="enterDecimal(event)" value="<%= msg046002.getE02LCMCAM().trim()%>" size="17" maxlength="16" readonly="readonly">            </TD>
            <TD width="25%" align="right" nowrap> 
              Cuenta Garantía Efectivo: </TD><TD nowrap width="27%">
					<TABLE  id="trdark">
						<TBODY>
							<TR id="trdark">
								<TD rowspan="2"><INPUT name="E02LCMCCA" type="text" disabled value="<%= msg046002.getE02LCMCCA().trim()%>" size="17" maxlength="16" readonly="readonly"></TD>
								<!--<TD>Cuenta<BR>Contable</TD>
								<TD rowspan="2"><A href="javascript:GetLedger('E02LCMCCA',document.forms[0].E02LCMBNK.value,'','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A></TD>
								<TD>Cuenta<BR>Cliente</TD>
								<TD rowspan="2"><A href="javascript: GetAccByClient('E02LCMCCA','','RT','','')"><IMG src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"></A></TD>-->
						</TR></TBODY>
					</TABLE>
					</TD>
          </TR>
          <TR id="trclear"> 
            <TD width="25%" align="right" nowrap> 
            Línea de Crédito del Cliente: 
             </TD>
            <TD nowrap width="25%"> 
				<INPUT name="E02LCMLNR" type="text" onkeypress="enterInteger(event)" value="<%= msg046002.getE02LCMLNR().trim()%>" size="10" maxlength="9" readonly="readonly">
             	<INPUT name="E02LCMCMN" type="text" onkeypress="enterInteger(event)" value="<%= msg046002.getE02LCMCMN().trim()%>" size="4" maxlength="4" readonly="readonly">
            </TD>
            <TD width="25%" align="right" nowrap> 
              Centro de Costo:</TD>
            <TD nowrap width="27%"> 
              <INPUT name="E02LCMCCN" type="text" disabled value="<%= msg046002.getE02LCMCCN().trim()%>" size="9" maxlength="8" readonly="readonly"> 
				</TD>
          </TR>  
          
				<TR id="trdark"> 
            <TD nowrap width="25%" align="right">Tarifa del Cliente: </TD>
            <TD nowrap width="25%"> 
				<INPUT name="E02LCMTAR" type="text" value="<%= msg046002.getE02LCMTAR().trim()%>" size="2" maxlength="2" readonly="readonly"></TD>
            <TD align="right" nowrap>Nuestros Cargos por Cuenta de: </TD>
            <TD nowrap><SELECT name="E02LCMAOB" disabled>
                <OPTION value=" "></OPTION>
                <OPTION value="A" <% if(msg046002.getE02LCMAOB().equals("A")) out.print("selected");%>>Aplicante</OPTION>
                <OPTION value="B" <% if(msg046002.getE02LCMAOB().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
              </SELECT></TD>
			 </TR>   
          <TR id="trclear">
            <TD width="25%" align="right" nowrap>Cuenta Debito Comisiones: </TD>
			<TD width="25%">
				<INPUT type="text" name="E02LCMSCA" size="17" maxlength="12" value="<%= msg046002.getE02LCMSCA().trim()%>" readonly>
			</TD>
             <TD width="25%" align="right" nowrap>Cargos O/B por Cuenta de: </TD>
            <TD nowrap width="25%">
            <SELECT name="E02LCMOBC" disabled>
                      <OPTION value=" "></OPTION>
                      <OPTION value="A" <% if(msg046002.getE02LCMOBC().equals("A")) out.print("selected");%>>Aplicante</OPTION>
                      <OPTION value="B" <% if(msg046002.getE02LCMOBC().equals("B")) out.print("selected");%>>Beneficiario</OPTION>
            </SELECT>                  
            </TD>
          </TR>      
          <TR id="trdark"> 
            <TD width="25%" align="right" nowrap>Com.Apertura Día Emisión: </TD>
            <TD nowrap width="25%">
                	<INPUT name="E02LCMOCI" type="radio" disabled value="Y" readonly="readonly" <% if(msg046002.getE02LCMOCI().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMOCI" type="radio" disabled value="N" readonly="readonly" <% if(msg046002.getE02LCMOCI().equals("N")) out.print("checked");%>>
                	No</TD>
            <TD width="25%" align="right" nowrap> 
              Com.Enmienda Día Enmienda: </TD>
            <TD nowrap width="27%">
                	<INPUT name="E02LCMACI" type="radio" disabled value="Y" readonly="readonly" <% if(msg046002.getE02LCMACI().equals("Y")) out.print("checked");%>>Si
                	<INPUT name="E02LCMACI" type="radio" disabled value="N" readonly="readonly" <% if(msg046002.getE02LCMACI().equals("N")) out.print("checked");%>>
                	No</TD>
          </TR>
  </TBODY></TABLE></TD></TR></TABLE>
  
    <H4>Datos del Seguro</H4>
<TABLE class="tableinfo">
    <TR > 
      <TD nowrap> 
        <TABLE cellpadding="2" cellspacing="0" width="100%" border="0">
           <TBODY>            
				<TR id="trclear">
				  <TD width="25%" align="right" nowrap>Seguro: </TD>
				  <TD nowrap width="25%">
                	<INPUT disabled type="radio" name="E02LCMIFL" value="Y" <% if(msg046002.getE02LCMIFL().equals("Y")) out.print("checked");%>>Si
                	<INPUT disabled type="radio" name="E02LCMIFL" value="N" <% if(msg046002.getE02LCMIFL().equals("N")) out.print("checked");%>>
                	No
                  </TD>
				  <TD width="25%" align="right" nowrap> </TD>
				  <TD nowrap width="27%">

				  </TD>
				</TR>
				<TR id="trdark">
				  <TD width="25%" align="right" nowrap>Desde </TD>
				  <TD nowrap width="25%">
                      <SELECT name="E02LCMIFR" disabled>
                        <OPTION value=" "> </OPTION>
                        <OPTION value="A" <% if(msg046002.getE02LCMIFR().equals("A")) out.print("selected");%>>Lugar de Recepción</OPTION>
                        <OPTION value="B" <% if(msg046002.getE02LCMIFR().equals("B")) out.print("selected");%>>Puerto/Aeropuerto de Salida</OPTION>
                    </SELECT>
                  </TD>
				  <TD width="25%" align="right" nowrap>Hasta: </TD>
				  <TD nowrap width="27%">
				    <SELECT name="E02LCMITO" disabled>
                        <OPTION value=" "> </OPTION>
                        <OPTION value="A" <% if(msg046002.getE02LCMITO().equals("A")) out.print("selected");%>>Puerto/Aeropuerto de Destino</OPTION>
                        <OPTION value="B" <% if(msg046002.getE02LCMITO().equals("B")) out.print("selected");%>>Lugar de Entrega</OPTION>
                    </SELECT>
                    </TD>
				</TR>
				<TR id="trdark">
				  <TD width="25%" align="right" nowrap>Porcentaje Adicional</TD>
				  <TD nowrap width="25%">
                    <INPUT type="text" name="E01LCMAIP" size="3" maxlength="2" value="<%= msg046002.getE02LCMAIP().trim()%>" disabled>
                  </TD>
				  <TD width="25%" align="right" nowrap>Nro. de Días en Aduana: </TD>
				  <TD nowrap width="27%">
				    <INPUT type="text" name="E02LCMCDY" size="3" maxlength="2" value="<%= msg046002.getE02LCMCDY().trim()%>" disabled>
                    </TD>
				</TR>
		</TBODY></TABLE>
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
				  <TD width="25%" align="right" nowrap>Tipo de Interés: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMICT" type="text" disabled="disabled" value="<%= msg046002.getE02LCMICT().trim()%>" size="1" maxlength="1" readonly="readonly"></TD>
				  <TD width="25%" align="right" nowrap>Tasa de Inter&eacute;s:</TD>
				  <TD nowrap width="27%"><INPUT name="E02LCMIRT" type="text" disabled value="<%= msg046002.getE02LCMIRT().trim()%>" size="9" maxlength="9" readonly="readonly">                  </TD>
			 </TR>
			 <TR id="trclear">
				  <TD width="25%" align="right" nowrap>Tabla y Tipo de Tasa Flotante: </TD>
				  <TD nowrap width="25%"><INPUT name="E02LCMFTB" type="text" disabled value="<%= msg046002.getE02LCMFTB().trim()%>" size="2" maxlength="2" readonly="readonly">
                      <SELECT name="E02LCMFTY" disabled="disabled">
                        <OPTION value=" "> </OPTION>
                        <OPTION value="FP">Tasa Primaria: </OPTION>
                        <OPTION value="FS" <% if(msg046002.getE02LCMOCI().equals("FS")) out.print("selected");%>>Tasa Secundaria: </OPTION>
                    </SELECT></TD>
				  <TD width="25%" align="right" nowrap>Período Base Calc.Intereses: </TD>
				  <TD nowrap width="27%"><INPUT name="E02LCMBAS" type="text" disabled onkeypress="enterInteger(event)" value="<%= msg046002.getE02LCMBAS().trim()%>" size="3" maxlength="3" readonly="readonly">                  </TD>
			 </TR>
		</TBODY></TABLE>
      </TD>
    </TR>
  </TABLE>
  <%}%>
  <H4>Tipo de Operaci&oacute;n</H4>
  <TABLE class="tableinfo">
    <TBODY>
      <TR>
        <TD nowrap><TABLE cellspacing="0" cellpadding="2" width="100%" border="0"
				class="tbhead">
            <TBODY>
              <TR id="trdark00">
                <TD nowrap align="right" width="12%">Tipo Operación : </TD>
                <TD nowrap align="left" width="13%"><SELECT disabled name="E02LCMIDF">
                  <OPTION value=""> </OPTION>
                  <OPTION value="I" <% if(msg046002.getE02LCMIDF().equals("I")) out.print("selected");%>>Incremento</OPTION>
                  <OPTION value="D" <% if(msg046002.getE02LCMIDF().equals("D")) out.print("selected");%>>Decremento</OPTION>
                </SELECT></TD>
                <TD nowrap align="right" width="8%">Monto: </TD>
                <TD nowrap width="15%"><INPUT readonly name="E02LCMIDA" type="text" onKeyPress="enterDecimal(event)" value="<%= msg046002.getE02LCMIDA().trim()%>" size="17" maxlength="16"></TD>
                <TD nowrap align="right" width="14%">Saldo Actual: </TD>
                <TD nowrap width="15%"><INPUT readonly name="E02LCMMEB" type="text"  value="<%= msg046002.getE02LCMMEB().trim()%>" size="17" maxlength="16" readonly></TD>
              </TR>
            </TBODY>
        </TABLE></TD>
      </TR>
    </TBODY>
  </TABLE>
</FORM>
</BODY>
</HTML>
