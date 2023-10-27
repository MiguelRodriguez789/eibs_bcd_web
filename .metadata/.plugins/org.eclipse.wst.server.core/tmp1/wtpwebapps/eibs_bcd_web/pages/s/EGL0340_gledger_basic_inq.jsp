<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<title>Contabilidad</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="gLedger" class="datapro.eibs.beans.EGL034001Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
 	if ( !error.getERRNUM().equals("0")  ) {
    	error.setERRNUM("0");
     	out.println("<SCRIPT Language=\"Javascript\">");
     	out.println("       showErrors()");
     	out.println("</SCRIPT>");
 	}
%>
<H3 align="center"> Consulta Maestro de Contabilidad
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="gledger_basic_inq.jsp, EGL0340"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEGL0340">
<input TYPE=HIDDEN NAME="SCREEN" value="3"> 
<input TYPE=HIDDEN NAME="E01GLMACD" value="<%= gLedger.getE01GLMACD().trim()%>">
 <% int row = 0;%>
<H4>Datos B&aacute;sicos</H4>
<table class="tableinfo">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Numero de Cuenta Contable :</div>
				</td>
				<td nowrap width="30%">
					<eibsinput:text property="E01GLMBNK" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BANK %>" readonly="true" />
					<eibsinput:text property="E01GLMCCY" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true" />
					<eibsinput:text property="E01GLMGLN" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
				</td>
				<td nowrap width="20%" align="right">Estado Cuenta :</td>
                  <td nowrap width="30%">
                    <INPUT type="radio" name="E01GLMFR1" value="1" <% if (gLedger.getE01GLMFR1().equals("1") || gLedger.getE01GLMFR1().equals("")) out.print("checked");%> disabled>Activo
                    <INPUT type="radio" name="E01GLMFR1" value="2" <% if (gLedger.getE01GLMFR1().equals("2")) out.print("checked");%> disabled>Inactivo
                    <INPUT type="radio" name="E01GLMFR1" value="3" <% if (gLedger.getE01GLMFR1().equals("3")) out.print("checked");%> disabled>Cerrado
               </td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
				<div align="right">Descripción de la Cuenta :</div>
				</td>
				<td nowrap width="30%">
					<eibsinput:text property="E01GLMDSC" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
				<td nowrap width="20%"></td>
				<td nowrap width="30%"></td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
				<div align="right">Tipo de Producto :</div>
				</td>
				<td nowrap width="30%">
                	 <eibsinput:text property="E01GLMATY" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
				<td nowrap width="20%">
				<div align="right">Clase de la Cuenta :</div>
				</td>
				<td nowrap width="30%">
                	 <eibsinput:text property="E01GLMCLS" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" size="3" maxlength="2" readonly="true"/>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Requiere Centro de Costo :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" disabled name="E01GLMCCN" value="Y" <%if(gLedger.getE01GLMCCN().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" disabled name="E01GLMCCN" value="N" <%if(!gLedger.getE01GLMCCN().equals("Y")) out.print("checked");%>> No
				</td>
				<td nowrap width="20%">
					<div align="right">Cuenta Reconciliable :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" disabled name="E01GLMRCL" value="Y" <%if(gLedger.getE01GLMRCL().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" disabled name="E01GLMRCL" value="N" <%if(!gLedger.getE01GLMRCL().equals("Y")) out.print("checked");%>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Estado de Cuenta Diario :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" disabled name="E01GLMDST" value="1" <%if(gLedger.getE01GLMDST().equals("1")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" disabled name="E01GLMDST" value="N" <%if(!gLedger.getE01GLMDST().equals("1")) out.print("checked");%>> No
				</td>
				<td nowrap width="20%">
					<div align="right">Nivel de Libro Diario :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" disabled name="E01GLMRMA" value="D" <%if(gLedger.getE01GLMRMA().equals("D")) out.print("checked");%>> Detalle 
					<INPUT type="radio" disabled name="E01GLMRMA" value="T" <%if(!gLedger.getE01GLMRMA().equals("D")) out.print("checked");%>> Total
				</td>
			</tr>
						<%if(currUser.getE01INT().equals("04")){%>
				<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
					<td nowrap width="20%">
						<div align="right">Codigo Agrupador SAT :</div>
					</td>
					<td nowrap width="30%">
						<input type="text" name="E01GLMFRD" size="4" maxlength="3" value="<%=gLedger.getE01GLMFRD()%>" onkeypress="enterInteger(event)"> <b>.</b>
						<input type="text" name="E01GLMFRE" size="3" maxlength="2" value="<%=gLedger.getE01GLMFRE()%>" onkeypress="enterInteger(event)">
					</td>
					<td nowrap width="20%">
						<div align="right">Nivel del SAT :</div>
					</td>
					<td nowrap width="30%">
						<input type="text" name="E01GLMFRF" size="2" maxlength="1" value="<%= gLedger.getE01GLMFRF()%>" onkeypress="enterInteger(event)">
					</td>
				</tr>
			<% } %>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Cuenta I.B.F :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" disabled name="E01GLMIBF" value="IB" <%if(gLedger.getE01GLMRMA().equals("IB")) out.print("checked");%>> Sí 
					<INPUT type="radio" disabled name="E01GLMIBF" value="" 	<%if(!gLedger.getE01GLMRMA().equals("IB")) out.print("checked");%>> No
				</td>
				<td nowrap width="20%">
					<div align="right">Cuenta de Tesorería :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" disabled name="E01GLMMEF" value="Y" <%if(gLedger.getE01GLMMEF().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" disabled name="E01GLMMEF" value="N" <%if(!gLedger.getE01GLMMEF().equals("Y")) out.print("checked");%>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Reconciliación/Clientes :</div>
				</td>
				<td nowrap width="30%">
					<SELECT name="E01GLMCPF" disabled>
						<OPTION value=" " <%if (!(gLedger.getE01GLMCPF().equals("1") ||gLedger.getE01GLMCPF().equals("2")||gLedger.getE01GLMCPF().equals("3")||gLedger.getE01GLMCPF().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="1" <%if (gLedger.getE01GLMCPF().equals("1")) out.print("selected"); %>>Reconciliación Bancaria</OPTION>
						<OPTION value="2" <%if (gLedger.getE01GLMCPF().equals("2")) out.print("selected"); %>>Requiere Numero Cliente</OPTION>
						<OPTION value="3" <%if (gLedger.getE01GLMCPF().equals("3")) out.print("selected"); %>>Las Dos Anteriores</OPTION>
 						<OPTION value="N" <%if (gLedger.getE01GLMCPF().equals("N")) out.print("selected"); %>>Ninguna de las Dos</OPTION>
					</SELECT>
				</td>
				<td nowrap width="20%">
					<div align="right">Control de Previsiones :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" disabled name="E01GLMPRV" value="Y" <%if(gLedger.getE01GLMPRV().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" disabled name="E01GLMPRV" value="N" <%if(!gLedger.getE01GLMPRV().equals("Y")) out.print("checked");%>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Cuenta Reajuste :</div>
				</td>
				<td nowrap width="30%">
					<SELECT name="E01GLMREV" disabled>
						<OPTION value="N" <%if (!(gLedger.getE01GLMREV().equals("1") ||gLedger.getE01GLMREV().equals("2")||gLedger.getE01GLMREV().equals("3") ||gLedger.getE01GLMREV().equals("4")||gLedger.getE01GLMREV().equals("5")||gLedger.getE01GLMREV().equals("N"))) out.print("selected"); %>></OPTION>
						<OPTION value="1" <%if (gLedger.getE01GLMREV().equals("1")) out.print("selected"); %>>Mant./Valor Nicaragua</OPTION>
						<%if(currUser.getE01INT().equals("05")){%>
						<OPTION value="2" <%if (gLedger.getE01GLMREV().equals("2")) out.print("selected"); %>>Reajuste IVR</OPTION>
						<% } else { %>
						<OPTION value="2" <%if (gLedger.getE01GLMREV().equals("2")) out.print("selected"); %>>Reajuste UF/Chile</OPTION>
						<% }%>
						<OPTION value="3" <%if (gLedger.getE01GLMREV().equals("3")) out.print("selected"); %>>Reajuste IPV/Chile</OPTION>
						<OPTION value="4" <%if (gLedger.getE01GLMREV().equals("4")) out.print("selected"); %>>Reajuste USD/Chile</OPTION>
						<OPTION value="5" <%if (gLedger.getE01GLMREV().equals("5")) out.print("selected"); %>>Valor Ajuste/PERU</OPTION>
						<OPTION value="N" <%if (gLedger.getE01GLMREV().equals("N")) out.print("selected"); %>>No Aplica</OPTION>
					</SELECT>
				</td>
				<td nowrap width="20%">
					<div align="right">Sensibilidad de Tasas :</div>
				</td>
				<td nowrap width="30%" >
					<input type="text" name="E01GLMFR6" size="6" maxlength="6" value="<%= gLedger.getE01GLMFR6().trim()%>">
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Cuenta Contrapartida :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMXOF" size="17" maxlength="16" value="<%= gLedger.getE01GLMXOF()%>" readonly> 
				</td>
				<td nowrap width="20%">
					<div align="right">Nivel de Contabilización :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMACL" size="2" maxlength="1" value="<%= gLedger.getE01GLMACL().trim()%>" readonly>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">

				<td nowrap width="20%">
					<div align="right">Numero Cuenta Presupuesto :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMBUN" size="17" maxlength="16" value="<%= gLedger.getE01GLMBUN()%>" readonly> 
				</td>
				<td nowrap width="20%">
					<div align="right">Grupo Presupuesto Promedio :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMFL1" size="2" maxlength="1" value="<%= gLedger.getE01GLMFL1().trim()%>" readonly>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Cuenta Equivalente :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMHOA" size="21" maxlength="20" value="<%= gLedger.getE01GLMHOA()%>" readonly>
				</td>
				<td nowrap width="20%">
					<div align="right">Requiere Origen y Destino :</div>
				</td>
				<td nowrap width="30%">
					<INPUT type="radio" disabled name="E01GLMFL2" value="Y" <%if(gLedger.getE01GLMFL2().equals("Y")) out.print("checked");%>> S&iacute; 
					<INPUT type="radio" disabled name="E01GLMFL2" value="N" <%if(!gLedger.getE01GLMFL2().equals("Y")) out.print("checked");%>> No
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="20%">
					<div align="right">Descripción Equivalente :</div>
				</td>
				<td nowrap width="30%">
					<eibsinput:text property="E01GLMHDS" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION %>" readonly="true"/>
				</td>
				<td nowrap width="20%">
					<div align="right">Códigos de Usuario :</div>
				</td>
				<td nowrap width="30%">
					<input type="text" name="E01GLMCIC" size="4" maxlength="4" value="<%= gLedger.getE01GLMCIC().trim()%>" readonly>
					<input type="text" name="E01GLMFR2" size="5" maxlength="5" value="<%= gLedger.getE01GLMFR2().trim()%>" readonly> 
					<input type="text" name="E01GLMFR3" size="5" maxlength="5" value="<%= gLedger.getE01GLMFR3().trim()%>" readonly> 
					<input type="text" name="E01GLMFR4" size="5" maxlength="5" value="<%= gLedger.getE01GLMFR4().trim()%>" readonly> 
					<input type="text" name="E01GLMFR5" size="5" maxlength="5" value="<%= gLedger.getE01GLMFR5().trim()%>" readonly>
				</td>
			</tr>
			<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>" style="display: <%= !gLedger.getE01GLMFR5().equals("") ? "" : "none"%>">
				<td nowrap width="20%">
					<div align="right">Codigo Entidad Titularizada :</div>
				</td>
				<td nowrap width="30%">
					<eibsinput:text property="E01GLMFR9" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_BROKER%>" readonly="true"/>
				</td>
  			   <td nowrap width="20%">
					<div align="right"><% if (!currUser.getE01INT().equals("04")) { out.print("Codigo MISPYG :"); } %></div>
				</td>
				<td nowrap width="30%">
					<% if (!currUser.getE01INT().equals("04")) { %>
						<eibsinput:text property="E01GLMFR4" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CNOFC%>" readonly="true"/>
					<% } %>
				</td>
			</tr>
          <tr id="TITULAR1" class="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>" style="display: <%= !gLedger.getE01GLMFR5().equals("") ? "" : "none"%>" >
			<td nowrap width="20%">
				<div align="right">Numero de Cuenta Externa :</div>
			</td>
			<td nowrap width="30%">
				<input type="text" name="E01GLMTIA" size="21" maxlength="20" value="<%= gLedger.getE01GLMTIA()%>" readonly>
			</td>
 			   <td nowrap width="20%">
              <div align="right">Descripcion Cuenta :</div>
			</td>
			<td nowrap width="30%">
				<eibsinput:text property="E01GLMTIS" name="gLedger" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_DESCRIPTION%>" readonly="true"/>
			</td>
         </tr>
		</table>
		</td>
	</tr>
</table>

</form>
</body>
</html>
