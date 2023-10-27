<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page import = "datapro.eibs.master.Util" %> 
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "data" class= "datapro.eibs.beans.ERM020001Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 9) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
		}
	submitForm();
}

 
</SCRIPT>

</head>

<body>

<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }

 	String read = " ";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
	}

%>

<h3 align="center">Pago de Remanentes - GMF Asumido por la Instituci&oacute;n<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="remanentes_maint.jsp, ERM0200"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSERM0200" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01BNK" size="3" maxlength="2" value="<%= userPO.getBank() %>" readonly>
				</td>
				<td nowrap width=10% align="right">Moneda : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01CCY" size="3" maxlength="4" value="<%=userPO.getCurrency().trim()%>" readonly>
               </td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Origen :</td>
				<td nowrap width=40% align="left">
					<select name="E01COR" id="E01COR" >
                		<option value=" " <% if (!(data.getE01COR().equals("RM")|| data.getE01COR().equals("RV") || data.getE01COR().equals("RP") || data.getE01COR().equals("PD") || data.getE01COR().equals("LS") || data.getE01COR().equals("MS") || data.getE01COR().equals("PN") || data.getE01COR().equals("DP"))) out.print("selected"); %>> </option>
                		<option value="RM" <% if (data.getE01COR().equals("RM")) out.print("selected"); %>>prd</option>
                		<option value="RV" <% if (data.getE01COR().equals("RV")) out.print("selected"); %>>Rechazos Varios</option>                   
                		<option value="RP" <% if (data.getE01COR().equals("RP")) out.print("selected"); %>>Rechazo Planilla</option>                   
                		<option value="PD" <% if (data.getE01COR().equals("PD")) out.print("selected"); %>>Primas Devueltas</option> 
                		<option value="LS" <% if (data.getE01COR().equals("LS")) out.print("selected"); %>>Liquidacion Seguros</option>  
                		<option value="MS" <% if (data.getE01COR().equals("MS")) out.print("selected"); %>>Miscelaneos</option>                                     
                		<option value="PN" <% if (data.getE01COR().equals("PN")) out.print("selected"); %>>Prestamos Negociados</option> 
                		<option value="DP" <% if (data.getE01COR().equals("DP")) out.print("selected"); %>>Depositos a Plazo</option>                                    
              		</select>
				</td>
				<td nowrap width=10% align="right">C&oacute;digo de Impuesto :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01GI0" size="4" maxlength="4" value="<%=data.getE01GI0()%>" />
                    <a href="javascript:GetTaxCode('E01GI0','E01GI0D','document.forms[0].E01BNK.value')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					<input type="text" name="E01GI0D" size="40" maxlength="40" value="<%=data.getE01GI0D()%>" readonly/>
				</td>
			</tr>
		</table> 
      </td>  
    </tr>
  </table>
 
<br>
  
<h4>Aplicaci&oacute;n de Impuesto por Via de Pago</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Efectivo: </td>
				<td nowrap width=40% align="left">
					<select name="E01CN1" id="E01CN1" >
                		<option value=" " <% if (!(data.getE01CN1().equals("Y")|| data.getE01CN1().equals("N"))) out.print("selected"); %>> </option>
                		<option value="Y" <% if (data.getE01CN1().equals("Y")) out.print("selected"); %>>SI</option>
                		<option value="N" <% if (data.getE01CN1().equals("N")) out.print("selected"); %>>NO</option>                   
                	</select>
				</td>
				<td nowrap width=10% align="right">C&oacute;digo de Impuesto por Pago en Efectivo:</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01GI1" size="4" maxlength="4" value="<%=data.getE01GI1()%>" />
                    <a href="javascript:GetTaxCode('E01GI1','E01GI1D','document.forms[0].E01BNK.value')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					<input type="text" name="E01GI1D" size="40" maxlength="40" value="<%=data.getE01GI1D()%>" readonly/>
				</td>
			</tr>
    	  	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cheque de Gerencia: </td>
				<td nowrap width=40% align="left">
					<select name="E01CN2" id="E01CN2" >
                		<option value=" " <% if (!(data.getE01CN2().equals("Y")|| data.getE01CN2().equals("N"))) out.print("selected"); %>> </option>
                		<option value="Y" <% if (data.getE01CN2().equals("Y")) out.print("selected"); %>>SI</option>
                		<option value="N" <% if (data.getE01CN2().equals("N")) out.print("selected"); %>>NO</option>                   
                	</select>
				</td>
				<td nowrap width=10% align="right">C&oacute;digo de Impuesto por Pago en Cheque de Gerencia:</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01GI2" size="4" maxlength="4" value="<%=data.getE01GI2()%>" />
                    <a href="javascript:GetTaxCode('E01GI2','E01GI2D','document.forms[0].E01BNK.value')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					<input type="text" name="E01GI2D" size="40" maxlength="40" value="<%=data.getE01GI2D()%>" readonly/>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Transferencias: </td>
				<td nowrap width=40% align="left">
					<select name="E01CN3" id="E01CN3" >
                		<option value=" " <% if (!(data.getE01CN3().equals("Y")|| data.getE01CN3().equals("N"))) out.print("selected"); %>> </option>
                		<option value="Y" <% if (data.getE01CN3().equals("Y")) out.print("selected"); %>>SI</option>
                		<option value="N" <% if (data.getE01CN3().equals("N")) out.print("selected"); %>>NO</option>                   
                	</select>
				</td>
				<td nowrap width=10% align="right">C&oacute;digo de Impuesto por Pago en Transferencias :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01GI3" size="4" maxlength="4" value="<%=data.getE01GI3()%>" />
                    <a href="javascript:GetTaxCode('E01GI3','E01GI3D','document.forms[0].E01BNK.value')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					<input type="text" name="E01GI3D" size="40" maxlength="40" value="<%=data.getE01GI3D()%>" readonly/>
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Cuenta Contable: </td>
				<td nowrap width=40% align="left">
					<select name="E01CN4" id="E01CN4" >
                		<option value=" " <% if (!(data.getE01CN4().equals("Y") || data.getE01CN4().equals("N"))) out.print("selected"); %>> </option>
                		<option value="Y" <% if (data.getE01CN4().equals("Y")) out.print("selected"); %>>SI</option>
                		<option value="N" <% if (data.getE01CN4().equals("N")) out.print("selected"); %>>NO</option>                   
                	</select>
				</td>
				<td nowrap width=10% align="right">C&oacute;digo de Impuesto por Pago en Cuenta Contable:</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01GI4" size="4" maxlength="4" value="<%=data.getE01GI4()%>" />
                    <a href="javascript:GetTaxCode('E01GI4','E01GI4D','document.forms[0].E01BNK.value')">
                    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
					<input type="text" name="E01GI4D" size="40" maxlength="40" value="<%=data.getE01GI4D()%>" readonly/>
				</td>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>

<br>

	
	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(15);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(2);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
