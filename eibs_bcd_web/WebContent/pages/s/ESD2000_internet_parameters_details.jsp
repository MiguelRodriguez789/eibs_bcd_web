<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Internet Banking Parameteres</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="prevDetails" class="datapro.eibs.beans.ESD200001Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    
%>


<H3 align="center">Parámetros de Banca por Internet
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="internet_parameters_details.jsp, ESD2000"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/com.datapro.eibs.internet.JSESD2000" >
<INPUT TYPE=HIDDEN id="SCREEN" NAME="SCREEN" VALUE="600">
<INPUT TYPE=HIDDEN id="E01INTCCY"  NAME="E01INTCCY" VALUE="<%= currUser.getE01BCU().trim() %>">

  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Banco :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
 				<%if (userPO.getPurpose().equals("MAINTENANCE")){%>
              	<eibsinput:text property="E01INTBNK" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" readonly="true" />
              	<% } else { %>
              	<eibsinput:text property="E01INTBNK" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK%>" />
                <% } %>
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Descripción :</b></div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
              	<eibsinput:text property="E01INTDSC" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" />
             </div>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>  
  <table  class="tableinfo">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Número de Días Expiración Contraseña.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<eibsinput:text property="E01INTEXP" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" maxlength="3" size="5" />
            	</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Número de Caracteres Requeridos en Contraseña.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<eibsinput:text property="E01INTPSL" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" maxlength="2" size="5" />
            	</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Número de Caracteres Repetidos Permitidos.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<eibsinput:text property="E01INTRPC" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" maxlength="2" size="5" />
           		</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Número de Letras Permitidas.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<eibsinput:text property="E01INTLET" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" maxlength="2" size="5" />
           		</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Número de Intentos Fallidos Permitidos.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<eibsinput:text property="E01INTETM" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" maxlength="2" size="5" />
           		</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Número de Días para Inactividad.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<eibsinput:text property="E01INTDPI" name="prevDetails"  eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER%>" maxlength="3" size="5" />
           		</div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Agencia/Lote por Omisión.</b></div></td>
            <td nowrap width="50%"><div align="left">
            	<input type="text" id="E01INTDBR" name="E01INTDBR" maxlength="3" size="5" value="<%= prevDetails.getE01INTDBR().trim()%>" >/<input type="text" name="E01INTBTH" maxlength="4" size="5" value="<%= prevDetails.getE01INTBTH().trim()%>" >
           	</div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Cuenta Puente para ACH.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<input type="text" id="E01INTDGA" name="E01INTDGA" maxlength="16" size="20" value="<%= prevDetails.getE01INTDGA().trim()%>" >
               	 	<a href="javascript:GetLedger('E01INTDGA',document.forms[0].E01INTBNK.value,document.forms[0].getElementById('E01INTCCY').value,'','')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Cuenta Puente para Emisión Cheques Gerencia.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<input type="text" id="E01INTDGO" name="E01INTDGO" maxlength="16" size="20" value="<%= prevDetails.getE01INTDGO().trim()%>" >
                	<a href="javascript:GetLedger('E01INTDGO',document.forms[0].E01INTBNK.value,document.forms[0].getElementById('E01INTCCY').value,'','')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Cuenta Puente Pago Electricidad Union Fenosa.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<input type="text" id="E01INTDGC" name="E01INTDGC" maxlength="16" size="20" value="<%= prevDetails.getE01INTDGC().trim()%>" >
                	<a href="javascript:GetLedger('E01INTDGC',document.forms[0].E01INTBNK.value,document.forms[0].getElementById('E01INTCCY').value,'','')">
                	<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Cuenta Puente Pago Cable y Wireless.</b></div></td>
            <td nowrap width="50%">
            	<div align="left"><input type="text" id="E01INTDGL" name="E01INTDGL" maxlength="16" size="20" value="<%= prevDetails.getE01INTDGL().trim()%>" >
                <a href="javascript:GetLedger('E01INTDGL',document.forms[0].E01INTBNK.value,document.forms[0].getElementById('E01INTCCY').value, '')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Cuenta Puente Pago de Servicio IDAAN.</b></div></td>
            <td nowrap width="50%">
            	<div align="left"><input type="text" id="E01INTSGL" name="E01INTSGL" maxlength="16" size="20" value="<%= prevDetails.getE01INTSGL().trim()%>" >
				<a href="javascript:GetLedger('E01INTSGL',document.forms[0].E01INTBNK.value,document.forms[0].getElementById('E01INTCCY').value,'','')">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></div>
			</td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Cuenta Puente Pago Electricidad ENSA :</b></div></td>
            <td nowrap width="50%">
            	<div align="left"><input type="text" id="E01INTOGL" name="E01INTOGL" maxlength="16" size="20" value="<%= prevDetails.getE01INTOGL().trim()%>" >
                <a href="javascript:GetLedger('E01INTOGL',document.forms[0].E01INTBNK.value,document.forms[0].getElementById('E01INTCCY').value,'','')">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="bottom" border="0" ></a></div>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Centro de Costo por Omisión.</b></div></td>
            <td nowrap width="50%"><div align="left">
               <input type="text" id="E01INTCCN" name="E01INTCCN" maxlength="6" size="8" value="<%= prevDetails.getE01INTCCN().trim()%>" >
               <a href="javascript:GetCostCenter('E01INTCCN',document.forms[0].E01INTBNK.value)">
               <img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a></div>
             </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Tabla de Cargos Transferencias/Cartas de Crédito.</b></div></td>
            <td nowrap width="50%">
            	<div align="left">
            		<input type="text" id="E01INTPRF" name="E01INTPRF" maxlength="2" size="5" value="<%= prevDetails.getE01INTPRF().trim()%>" >
                    <a href="javascript:GetCNTRLPRF('E01INTPRF','')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"></a>
                    <input type="text" id="E01INTLCF" name="E01INTLCF" maxlength="2" size="5" value="<%= prevDetails.getE01INTLCF().trim()%>" >
                    <a href="javascript:GetTariffLC('E01INTLCF','','');">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a> 
                </div>
             </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Tipo de Usuario.</b></div></td>
            <td nowrap width="50%"><div align="left"><SELECT id="E01INTCPR" NAME="E01INTCPR">
             <OPTION VALUE="0" <%if (prevDetails.getE01INTCPR().equals("0")) {out.print("selected"); }%>>NO PERMITE CAMBIOS</OPTION>
             <OPTION VALUE="1" <%if (prevDetails.getE01INTCPR().equals("1")) {out.print("selected"); }%>>PUEDE CAMBIAR USUARIOS</OPTION>
             <OPTION VALUE="2" <%if (prevDetails.getE01INTCPR().equals("2")) {out.print("selected"); }%>>SOLO SI ESTATUS ES PENDIENTE DE ACTIVACION</OPTION>
             </SELECT></div></TD>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Monto Máximo Permitido por Transacción.</b></div></td>
            <td nowrap width="50%"><div align="left">
            	<eibsinput:text property="E01INTMXA" name="prevDetails" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"></eibsinput:text>
           	</div></td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Monto Máximo Acumulado Permitido.</b></div></td>
            <td nowrap width="50%"><div align="left">
            	<eibsinput:text property="E01INTAMX" name="prevDetails" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT %>"></eibsinput:text>
       		</div></td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Tipo de Acumulación.</b></div></td>
            <td nowrap width="50%"><div align="left"><SELECT id="E01INTMXT" NAME="E01INTMXT">
             <OPTION VALUE="1" <%if (prevDetails.getE01INTMXT().equals("1")) {out.print("selected"); }%>>DIARIO</OPTION>
             <OPTION VALUE="2" <%if (prevDetails.getE01INTMXT().equals("2")) {out.print("selected"); }%>>SEMANAL </OPTION>
             </SELECT></div></TD>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="50%"><div align="right"><b>Comisión por Transacciones sobre Limite.</b></div></td>
            <td nowrap width="50%"><div align="left"><input type="text" id="E01INTSVG" name="E01INTSVG" maxlength="13" size="15" value="<%= prevDetails.getE01INTSVG().trim()%>" ></div></td>
          </tr>
          
          <tr id="trdark"> 
            <td nowrap width="50%"><div align="right"><b>Numero de Transacciones sin Cargo.</b></div></td>
            <td nowrap width="50%">
            <div align="left">
            	<eibsinput:text property="E01INTNFA" name="prevDetails" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_INTEGER %>" maxlength="3" size="5"></eibsinput:text>
			</div>
			</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <br>
  <br>
  <div align="center"><input id="EIBSBTN" type=submit name="Submit" value="Enviar"></div>
</form>
</body>
</html>
