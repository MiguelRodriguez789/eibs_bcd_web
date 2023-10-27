<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Consulta de Saldos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="rtBalances" class="datapro.eibs.beans.EDD009001Message"  scope="session" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"  scope="session" />

<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
 

<SCRIPT type="text/javascript">

<%
if ( userPO.getOption().equals("RT") ) {
%>
	builtNewMenu(rt_i_opt);
<%   
}
else if ( userPO.getOption().equals("SV") ) {
%>
	builtNewMenu(sv_i_opt);
<%   
}
else if ( userPO.getOption().equals("CP") ) {
%>
	builtNewMenu(cpar_i_opt);
<%   
}
%>  

</SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     out.println("<SCRIPT Language=\"Javascript\">");
     error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
   out.println("<SCRIPT> initMenu(); </SCRIPT>");
%> 
<H3 align="center">Consulta de Saldos<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="rt_inq_balances, EDD0000"> 
  </H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.products.JSEXEDD0000" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" value="31">
  
  <table border="0" cellspacing="0" cellpadding="0" width="100%">
  	<tr>
  		<td align="right" valign="top" width="85%" style="color:red;font-size:12;"><b><%=rtBalances.getE01PENDAP()%></b></td>
  		<td width="5%"></td>
  	</tr>
  </table> 
<table class="tableinfo" border="0">
	<tr>
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0"
			class="tbhead">
			<tr id="trdark">
				<td nowrap width="14%">
				<div align="right"><b>Cliente :</b></div>
				</td>
				<td nowrap width="9%">
				<div align="left"><input type="text" name="E02CUN2" size="10"
					maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>"></div>
				</td>
				<td nowrap width="12%">
				<div align="right"><b>Nombre :</b></div>
				</td>
				<td nowrap>
				<div align="left"><input type="text" name="E02NA12" size="48"
					maxlength="45" readonly value="<%= userPO.getCusName().trim()%>"></div>
				</td>
				<td nowrap>
				<div align="right"><b>Producto : </b></div>
				</td>
				<td nowrap><b> 
					<input type="text" name="E02TYPE" size="4" maxlength="4" readonly value="<%= userPO.getType().trim()%>">
					<input type="text" name="E02PRO2" size="4" maxlength="4" readonly value="<%= userPO.getProdCode().trim()%>">
			    </b></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="14%">
				<div align="right"><b>Cuenta :</b></div>
				</td>
				<td nowrap width="9%">
				<div align="left"><input type="text" name="E02ACC" size="13" maxlength="12" value="<%= userPO.getAccNum().trim()%>" readonly>
				</div>
				</td>
				<td nowrap width="12%">
				<div align="right">Oficial :</div>
				</td>
				<td nowrap width="33%">
				<div align="left"><b> <input type="text" name="E02NA122" size="48"
					maxlength="45" readonly value="<%= userPO.getOfficer().trim()%>"> </b>
				</div>
				</td>
				<td nowrap width="11%">
				<div align="right"><b>Moneda : </b></div>
				</td>
				<td nowrap width="21%">
				<div align="left"><b> <input type="text" name="E01DEACCY" size="4"
					maxlength="3" value="<%= userPO.getCurrency().trim()%>" readonly> </b>
				</div>
				</td>
			</tr>
			<%if(currUser.getE01INT().equals("03")){%>
			<TR id="trdark">
				<TD nowrap width="14%" align="right" colspan="3"><B>Cuenta SUDEBAN:</B></TD>
				<TD nowrap width="33%">
	<!--			<INPUT type="text" name="E01FMTBCC_A" size="5" value="%=rtBalances.getE01FMTBCC().trim().substring(0,4) %>"
						readonly maxlength="4"> 
					<INPUT type="text" name="E01FMTBCC_B" size="5" value="%=rtBalances.getE01FMTBCC().trim().substring(4,8) %>"
						readonly maxlength="4"> 
					<INPUT type="text" name="E01FMTBCC_C" size="3" value="%=rtBalances.getE01FMTBCC().trim().substring(8,10) %>"
						readonly maxlength="2"> 
					<INPUT type="text" name="E01FMTBCC_A0" size="11" value="%=rtBalances.getE01FMTBCC().trim().substring(10,20) %>"
						readonly maxlength="10">
	-->
				</TD>
				<TD nowrap width="11%"></TD>
				<TD nowrap width="21%"></TD>
			</TR>
			<% } %>
		</table>
		</td>
	</tr>
</table>
<br>
<table class=tbenter>
  <tr > 
     <td nowrap width="5%"> 
		<h4>Saldos</h4>
     </td>
     <td nowrap width="40%"> 
     <% if (!rtBalances.getE01ACMACD().trim().equals("04")) {%>
      <% if (!rtBalances.getE01DSCUP1().equals("") || !rtBalances.getE01DSCUP2().equals("")) {%>
     	<b>CUPOS: </b> 
     	<b>CONTRATADO:<font color="#ff6600"><%= rtBalances.getE01DSCUP1().trim()%></font> - OCASIONAL:<font color="#ff6600"><%= rtBalances.getE01DSCUP2().trim()%> </font></b>
     	<%} %>
     <%} %>	
     </td>
     <td nowrap align=right width="20%"> 
   		<b>ESTADO :</b>
     </td>
     <td nowrap width="30%"> 
   		<b><font color="#ff6600"><%= rtBalances.getE01DSCAST().trim()%></font></b>
     </td>
   </tr>
</table>

<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Saldo en Libros :</div>
				</td>
				<td nowrap width="22%">
	         	  <eibsinput:text name="rtBalances" property="E01ACMMGB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
				</td>
				<td nowrap width="23%">
				<div align="right">Promedio Contable :</div>
				</td>
				<td nowrap width="26%">
	         	  <eibsinput:text name="rtBalances" property="E01ACMGAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>    
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Saldo Diferido :</div>
				</td>
				<td nowrap width="22%">				
					<eibsinput:text name="rtBalances" property="E01UNCBAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 
				</td>
				<td nowrap width="23%">
				<div align="right">Promedio Neto :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="rtBalances" property="E01ACMNAV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/> 				
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%" height="23">
				<div align="right">Saldo Neto :</div>
				</td>
				<td nowrap width="22%" height="23">
					<eibsinput:text name="rtBalances" property="E01ACMMNB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				
				</td>
				<td nowrap width="23%" height="23">
				<div align="right">Saldo Inicio Día :</div>
				</td>
				<td nowrap width="26%" height="23">				
					<eibsinput:text name="rtBalances" property="E01ACMGBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%" height="19">
				<div align="right">Saldo Retenido :</div>
				</td>
				<td nowrap width="22%" height="19">
					<eibsinput:text name="rtBalances" property="E01ACMHAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				
				</td>
				<td nowrap width="23%" height="19">
				<div align="right">Saldo Inicio de Ciclo :</div>
				</td>
				<td nowrap width="26%" height="19">
					<eibsinput:text name="rtBalances" property="E01ACMLSB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				
				</td>
			</tr>
			  <% if (!rtBalances.getE01ACMACD().trim().equals("04")) {%>
				<tr id="trclear">
				  <td nowrap width="29%" height="19">
				    <div align="right"><B>Saldo Efectivo :</B></div>
				  </td>
				  <td nowrap width="22%">
					<eibsinput:text name="rtBalances" property="E01SALEFE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				
				  </td>
				  <td nowrap width="23%" height="19">
				
				  </td>
				  <td nowrap width="26%" height="19">
									
				</tr>
				<tr id="trdark">
				<td nowrap width="29%" height="19">
				  <div align="right"><B>Saldo Disponible :</B></div>
				</td>
				<td nowrap width="22%" height="19">
					<eibsinput:text name="rtBalances" property="E01AVALBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				
				</td>
				<td nowrap width="23%" height="19">
				<div align="right"><B>GMF Proyectado :</B></div>
				</td>
				<td nowrap width="26%" height="19">
				<eibsinput:text name="rtBalances" property="E01CUSFAX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>	
			    </td>  
			</tr>
				<%}else{ %>
				<%} %>
				
			<% if (rtBalances.getE01ACMACD().trim().equals("04")) {%>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Saldo en Libreta :</div>
				</td>
				<td nowrap width="22%">
					<eibsinput:text name="rtBalances" property="E01ACMPBB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="23%">
				<div align="right">Saldo Inicio Año :</div>
				</td>
				<td nowrap width="26%">
				<eibsinput:text name="rtBalances" property="E01ACMLYB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%" height="19">
				  <div align="right"><B>Saldo Disponible :</B></div>
				</td>
				<td nowrap width="22%" height="19">
					<eibsinput:text name="rtBalances" property="E01AVALBL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>				
				</td>
				<td nowrap width="23%" height="19">
				<div align="right"><B>GMF Proyectado :</B></div>
				</td>
				<td nowrap width="26%" height="19">
				<eibsinput:text name="rtBalances" property="E01CUSFAX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>	
			    </td>  
			</tr>
			<%} %>
			<% if (!rtBalances.getE01ACMACD().trim().equals("04")) {%>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Disponible Línea Crédito :</div>
				</td>
				<td nowrap width="22%">
					<eibsinput:text name="rtBalances" property="E01LNESAL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="23%">
				<div align="right"><% if (!rtBalances.getE01ACMACD().trim().equals("04")) out.print("Utilizado Linea Credito :"); else out.print("Saldo en Libreta :");%>
				</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="rtBalances" property="E01ACMPBB" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Disponible Cupo Contratado :</div>
				</td>
				<td nowrap width="22%">
					<eibsinput:text name="rtBalances" property="E01LNCDAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="23%">
				<div align="right">Utilizado Cupo Contratado :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="rtBalances" property="E01LNCUAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Disponible Cupo Ocasional :</div>
				</td>
				<td nowrap width="22%">
					<eibsinput:text name="rtBalances" property="E01LNODAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="23%">
				<div align="right">Utilizado Cupo Ocasional :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="rtBalances" property="E01LNOUAM" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Prestamo Cupo Contratado :</div>
				</td>
				<td nowrap width="22%">
					<eibsinput:text name="rtBalances" property="E01LNCACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="23%">
				<div align="right">Prestamo Cupo Ocasional :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="rtBalances" property="E01LNOACC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_ACCOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%">
				
				</td>
				<td nowrap width="22%">
									
				</td>
				<td nowrap width="23%">
				
				</td>
				<td nowrap width="26%">
					
				</td>
			</tr>
			<%} %>
			
			<% if (rtBalances.getE01ACMACD().trim().equals("06")) {%>
				<tr id="trclear">
				<td nowrap width="27%">
				<div align="right">Saldo en Cuotas :</div>
				</td>
		    	<td nowrap width="23%"><input type="text" size="7" maxlength="7" name="E02ACACAC" readonly value="<%=rtBalances.getE01ACACAC().trim()%>">
				</td>
				<td nowrap width="24%">
				<div align="right">Cuotas Pendientes :</div>
				</td>
		    	<td nowrap width="23%"><input type="text" size="7" maxlength="7" name="E01ACACPE" readonly value="<%=rtBalances.getE01ACACPE().trim()%>">
				</td>
			</tr>
			<% }%>	
			<%  if (currUser.getE01INT().trim().equals("11")) {%>
			<tr id="trclear">
				<td nowrap width="29%">
		        	<div align="right">M&iacute;nimo/Libros :</div>
				</td>
				<td nowrap width="22%">
					<eibsinput:text name="rtBalances" property="E01ACMMGR" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="23%">
				  <div align="right">M&iacute;nimo Neto :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="rtBalances" property="E01ACMMNE" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Ultimo C/S :</div>
				</td>
				<td nowrap width="22%">
					<eibsinput:text name="rtBalances" property="E01ACMLSH" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="23%">
				<div align="right">Ultimo Dep&oacute;sito :</div>
				</td>
				<td nowrap width="26%">
					<eibsinput:text name="rtBalances" property="E01ACMLDA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<% }%>

						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
		</td>
	</tr>
</table>

<jsp:include page="ESD0840_reevaluation_inquiry.jsp" flush="true">
	<jsp:param name="flag" value="<%=rtBalances.getH01FLGWK3()%>" />
</jsp:include>


<H4>Diferidos</H4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="30%">
				<div align="right">Diferido 1 D&iacute;a :</div>
				</td>
				<td nowrap width="21%">
					<eibsinput:text name="rtBalances" property="E01ACMUL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="25%">
				<div align="right">Diferido 3 D&iacute;as :</div>
				</td>
				<td nowrap width="24%">
					<eibsinput:text name="rtBalances" property="E01ACMUL3" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%">
				<div align="right">Diferido 2 D&iacute;as :</div>
				</td>
				<td nowrap width="21%">
					<eibsinput:text name="rtBalances" property="E01ACMUL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="25%">
				<div align="right">Diferido + 3 D&iacute;as :</div>
				</td>
				<td nowrap width="24%">
					<eibsinput:text name="rtBalances" property="E01ACMFL1" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%">
				<div align="right">Diferido Indefinido :</div>
				</td>
				<td nowrap width="21%">
					<eibsinput:text name="rtBalances" property="E01ACMFL2" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="25%">
				<div align="right"></div>
				</td>
				<td nowrap width="24%">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<%  if (!rtBalances.getE01ACMACD().trim().equals("04")) {%>
<H4>Intereses por Sobregiro</H4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="30%">
				<div align="right">Inter&eacute;s por Cobrar :</div>
				</td>
				<td nowrap width="18%">
					<eibsinput:text name="rtBalances" property="E01ACMOIA" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="28%">
				<div align="right">Pago Acumulado (Anual) :</div>
				</td>
				<td nowrap width="24%">
					<eibsinput:text name="rtBalances" property="E01ACMOIY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="30%">
				<div align="right">N&uacute;mero de Veces (Total) :</div>
				</td>
				<td nowrap width="18%">
				<input type="text" name="E01ACMTOD" size="5"
					maxlength="5" value="<%= rtBalances.getE01ACMTOD().trim()%>"
					readonly>
				</td>
				<td nowrap width="28%">
				<div align="right">N&uacute;mero de Veces (Anual) :</div>
				</td>
				<td nowrap width="24%"><font face="Arial" size="2"> <input
					type="text" name="E01ACMDOA" size="5" maxlength="5"
					value="<%= rtBalances.getE01ACMDOA().trim()%>" readonly> </font></td>
			</tr>
			<tr id="trdark">
				<td nowrap width="30%" height="23">
				<div align="right">Total de D&iacute;as (Anual) :</div>
				</td>
				<td nowrap width="18%" height="23">
				<input type="text"
					name="E01ACMTOY" size="5" maxlength="5"
					value="<%= rtBalances.getE01ACMTOY().trim()%>" readonly>
				</td>
				<td nowrap width="28%" height="23">
				<div align="right">Total de D&iacute;as (Ciclo) :</div>
				</td>
				<td nowrap width="24%" height="23">
				<input type="text"
					name="E01ACMCDO" size="5" maxlength="5"
					value="<%= rtBalances.getE01ACMCDO().trim()%>" readonly>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<% } %>

<%  if (rtBalances.getH01FLGWK3().trim().equals("R")) {%>
<H4>Intereses y Reajustes por Pagar</H4>
<%} else  {%>
<H4>Intereses por Pagar</H4>
<% } %>

<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="23%">
				<div align="right">Intereses Pagados Total :</div>
				</td>
				<td nowrap width="23%">
					<eibsinput:text name="rtBalances" property="E01ACMIPL" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="22%">
				<div align="right">Intereses Pagados Anual :</div>
				</td>
				<td nowrap width="32%">
					<eibsinput:text name="rtBalances" property="E01ACMIPY" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="23%">
				<div align="right">Intereses Por Pagar :</div>
				</td>
				<td nowrap width="23%">
					<eibsinput:text name="rtBalances" property="E01ACMIAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="22%">
				<div align="right"></div>
				</td>
				<td nowrap width="32%">&nbsp;</td>
			</tr>
    <% if (rtBalances.getH01FLGWK3().trim().equals("R")) {%>
			<tr id="trdark">
				<td nowrap width="23%">
				<div align="right">Reajuste Acumulado :</div>
				</td>
				<td nowrap width="23%">
					<eibsinput:text name="rtBalances" property="E01GLRRAC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="22%">
				<div align="right">Reajuste Pagado :</div>
				</td>
				<td nowrap width="32%">
					<eibsinput:text name="rtBalances" property="E01GLRRAP" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="23%">
				<div align="right">Reajuste Por Pagar :</div>
				</td>
				<td nowrap width="23%">
					<eibsinput:text name="rtBalances" property="E01GLRMRV" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_AMOUNT %>" readonly="true"/>
				</td>
				<td nowrap width="22%">
				<div align="right"></div>
				</td>
				<td nowrap width="32%">&nbsp;</td>
			</tr>
     <% } %>
		</table>
		</td>
	</tr>
</table>
<h4>Fechas</h4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Ultima Transacci&oacute;n :</div>
				</td>
				<td nowrap width="16%">
		   		  <eibsinput:date name="rtBalances" fn_year="E01LSTRDY" fn_month="E01LSTRDM" fn_day="E01LSTRDD" readonly="true"/>
				</td>
				<td nowrap width="27%">
				<div align="right">Ultimo Dep&oacute;sito :</div>
				</td>
				<td nowrap width="28%">
		   		  <eibsinput:date name="rtBalances" fn_year="E01LSTDDY" fn_month="E01LSTDDM" fn_day="E01LSTDDD" readonly="true"/>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Ultimo C&aacute;lculo de Interes :</div>
				</td>
				<td nowrap width="16%">
		   		  <eibsinput:date name="rtBalances" fn_year="E01LSTCLY" fn_month="E01LSTCLM" fn_day="E01LSTCLD" readonly="true"/>
				</td>
				<td nowrap width="27%">
				<div align="right">Ultimo Cargo por Servicio :</div>
				</td>
				<td nowrap width="28%">
		   		  <eibsinput:date name="rtBalances" fn_year="E01LSCODY" fn_month="E01LSCODM" fn_day="E01LSCODD" readonly="true"/>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Ultimo Sobregiro :</div>
				</td>
				<td nowrap width="16%">
			   		  <eibsinput:date name="rtBalances" fn_year="E01LSTODY" fn_month="E01LSTODM" fn_day="E01LSTODD" readonly="true"/>
				</td>
				<td nowrap width="27%">
				<div align="right">Ultimo Estado de Cuentas:</div>
				</td>
				<td nowrap width="28%">
			   		  <eibsinput:date name="rtBalances" fn_year="E01LSSTMY" fn_month="E01LSSTMM" fn_day="E01LSSTMD" readonly="true"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<h4>Totales por Transacci&oacute;n</h4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="29%" height="33">
				<div align="right">Total D&eacute;bitos :</div>
				</td>
				<td nowrap width="16%" height="33">
				<input
					type="text" maxlength="5" size="5" name="E01ACMNDR"
					value="<%= rtBalances.getE01ACMNDR().trim()%>" readonly> 
				</td>
				<td nowrap width="27%" height="33">
				<div align="right">Total Cr&eacute;ditos :</div>
				</td>
				<td nowrap width="28%" height="33">
				<input type="text" maxlength="5"
					size="5" name="E01ACMNCR"
					value="<%= rtBalances.getE01ACMNCR().trim()%>" readonly>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="29%">
				<div align="right">Cheques Depositados :</div>
				</td>
				<td nowrap width="16%">
				<input type="text" maxlength="5" size="5"
					name="E01ACMIDC" value="<%= rtBalances.getE01ACMIDC().trim()%>"
					readonly>
				</td>
				<td nowrap width="27%">
				<div align="right">Cheques Emitidos :</div>
				</td>
				<td nowrap width="28%">
				<input type="text" name="E01ACMNCK"
					maxlength="5" size="5"
					value="<%= rtBalances.getE01ACMNCK().trim()%>" readonly>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="29%">
				<div align="right">Total Depositado :</div>
				</td>
				<td nowrap width="16%">
				<input type="text" name="E01ACMNDP"
					maxlength="5" size="5"
					value="<%= rtBalances.getE01ACMNDP().trim()%>" readonly>
				</td>
				<td nowrap width="27%">
				<div align="right">Uso L&iacute;nea de Cr&eacute;dito :</div>
				</td>
				<td nowrap width="28%"><input type="text" name="E01ACMCLY" size="5"
					maxlength="5" value="<%= rtBalances.getE01ACMCLY().trim()%>"
					readonly></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<h4>Devoluciones</h4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="43%">
				<div align="right">Devoluciones por Fondos :</div>
				</td>
				<td nowrap width="24%">
				<input type="text" maxlength="5" size="5"
					name="E01ACMTNS" value="<%= rtBalances.getE01ACMTNS().trim()%>"
					readonly>
				</td>
				<td nowrap width="33%">
				<div align="right"></div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="43%">&nbsp;</td>
				<td nowrap width="24%">
				<div align="center">Forma</div>
				</td>
				<td nowrap width="33%">
				<div align="center">Fondos</div>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="43%">
				<div align="right">Ciclo :</div>
				</td>
				<td nowrap width="24%">
				<div align="center"><input type="text" maxlength="5" size="5"
					name="E01ACMNRY" value="<%= rtBalances.getE01ACMNRY().trim()%>"
					readonly></div>
				</td>
				<td nowrap width="33%">
				<div align="center">
				<input type="text" maxlength="5" size="5"
					name="E01ACMNRL" value="<%= rtBalances.getE01ACMNRL().trim()%>"
					readonly>
				</div>
				</td>
			</tr>
			<tr id="trclear">
				<td nowrap width="43%">
				<div align="right">Anual :</div>
				</td>
				<td nowrap width="24%">
				<div align="center">
				<input type="text" maxlength="5" size="5"
					name="E01ACMDV3" value="<%= rtBalances.getE01ACMDV3().trim()%>"
					readonly>
				</div>
				</td>
				<td nowrap width="33%">
				<div align="center">
				<input type="text" maxlength="5" size="5"
					name="E01ACMDV1" value="<%= rtBalances.getE01ACMDV1().trim()%>"
					readonly>
				</div>
				</td>
			</tr>
			<tr id="trdark">
				<td nowrap width="43%">
				<div align="right">Total :</div>
				</td>
				<td nowrap width="24%">
				<div align="center"><input type="text" maxlength="5" size="5"
					name="E01ACMDV4" value="<%= rtBalances.getE01ACMDV4().trim()%>"
					readonly></div>
				</td>
				<td nowrap width="33%">
				<div align="center"><input type="text" maxlength="5" size="5"
					name="E01ACMDV2" value="<%= rtBalances.getE01ACMDV2().trim()%>"
					readonly></div>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<h4>Otros</h4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width="23%">
				<div align="right">N&uacute;mero de L&iacute;nea de Cr&eacute;dito :</div>
				</td>
				<td nowrap width="23%">
				<input type="text" maxlength="2" size="2"
					name="E01ACMCMC" value="<%= rtBalances.getE01ACMCMC().trim()%>"
					readonly>
				</td>
				<td nowrap width="22%">
				</td>
				<td nowrap width="32%">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<p align="left">&nbsp;</p>
</form>
</body>
</html>
