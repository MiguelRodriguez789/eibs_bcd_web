<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 


<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001501Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>

<SCRIPT type="text/javascript">

function goAction(op) {
	if (op == 11){
		op = 6;
		document.forms[0].MOD.value = "INQUIRY";
	}
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
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<% 
 if ( !error.getERRNUM().equals("0")  ) { 
     out.println("<SCRIPT Language=\"Javascript\">");
	 error.setERRNUM("0");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
 
 	String read = " ";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("INQUIRY")) {
		read = " readonly "; 
	}
%>

<h3 align="center">Mantenimiento Limites por canal<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="limits_by_channels_acc.jsp, ECA0015"></h3>
<hr size="4">


<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0015" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="MOD" VALUE="">
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="16%" > 
              <div align="right"><b>Cliente :</b></div>
            </td>
            <td nowrap width="20%" > 
              <div align="left"> 
                <input type="text" name="E01ILBCUM" size="10" maxlength="9" readonly value="<%= userPO.getCusNum().trim()%>">
              </div>
            </td>
            <td nowrap width="16%" > 
              <div align="right"><b>Nombre :</b> </div>
            </td>
            <td nowrap colspan="3" > 
              <div align="left"> 
                <input type="text" name="D01ILBCUN" size="65" maxlength="50" readonly value="<%= userPO.getCusName().trim()%>">
              </div>
            </td>
          </tr>

          	<tr id="trclear">
				<td nowrap width=13% align="right">Banco : </td>
				<td nowrap width=20% align="left">
					<input type="text" name="E01ILBBNK" size="3" maxlength="2" value="<%= userPO.getBank().trim() %>" readonly>
				</td>
            	<td nowrap width=13% align="right">Moneda : </td>
            	<td nowrap width=20% align="left">
            		<input type="text" name="E01ILBCCY" size="5" maxlength="4" value="<%= userPO.getCurrency().trim() %>" readonly>
       			</td>
				<td nowrap width=14% align="right">Cuenta: </td>
				<td nowrap width=20% align="left"><input type="text" name="E01ILBACC" size="15" maxlength="12" value="<%= userPO.getAccNum().trim() %>" readonly>
				</td>
	  		</tr>

   		</table> 
      </td>  
    </tr>
  </table>

 <h4>Condiciones</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="trdark">
           	<td nowrap width=10% align="right">Canal : </td>
            	<td nowrap width=40% align="left">
            		<input type="text" name="E01ILBCNL" size="5" maxlength="4" value="<%= msgRcd.getE01ILBCNL() %>"<%= read %>><%=mandatory %>
            		<a href="javascript:GetChannelDef('E01ILBCNL','D01ILBCNL',' ');">
            		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            		<input type="text" name="D01ILBCNL" size="62" maxlength="60"  value="<%=msgRcd.getD01ILBCNL()%>" readonly>
       			</td>
				<td nowrap width=10% align="right">Proveedor : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01ILBVND" size="6" maxlength="4" value="<%=msgRcd.getE01ILBVND()%>" <%= read %>>
				    <a href="javascript:GetCodeDescCNOFC('E01ILBVND','D01ILBVND','BT')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
                    <input type="text" name="D01ILBVND" size="47" maxlength="45" value="<%= msgRcd.getD01ILBVND().trim()%>" readonly>
				</td>
	  		</tr>

	  		<tr id="trclear">
				<td nowrap width=10% align="right">Transaccion : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E01ILBTRN" size="12" maxlength="10" value="<%=msgRcd.getE01ILBTRN()%>" <%= read %>>
				    <a href="javascript:GetCodeDescCNOFC('E01ILBTRN','D01ILBTRN','20')"> 
				    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            		<input type="text" name="D01ILBTRN" size="47" maxlength="46"  value="<%=msgRcd.getD01ILBTRN()%>" readonly>
				</td>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>


 <h4>Informaci&oacute;n Transaccional</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width=10% align="right">Numero por dia : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01ILBTRD" size="7" maxlength="5" value="<%=msgRcd.getE01ILBTRD()%>" <%= read %>>
				</td>
            	<td nowrap width=10% align="right">Monto por dia : </td>
            	<td  nowrap width=40% align="left">
					<input type="text" name="E01ILBAMD" size="17" maxlength="15" value="<%=msgRcd.getE01ILBAMD()%>" <%= read %>>
       			</td>
	  		</tr>
	  		<tr id="trclear">
				<td nowrap width=10% align="right">Numero por mes : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01ILBTRM" size="7" maxlength="5" value="<%=msgRcd.getE01ILBTRM()%>" <%= read %>>
				</td>
            	<td nowrap width=10% align="right">Monto por mes : </td>
            	<td  nowrap width=40% align="left">
					<input type="text" name="E01ILBAMM" size="17" maxlength="15" value="<%=msgRcd.getE01ILBAMM()%>" <%= read %>>
       			</td>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>
  
  <h4>Transacciones Exentas de Comisi&oacute;n</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
			<tr id="trdark">
				<td nowrap width=10% align="right">Numero de Transacciones Exentas : </td>
				<td  nowrap width=40% align="left">
					<input type="text" name="E01ILBTEX" size="7" maxlength="5" value="<%=msgRcd.getE01ILBTEX()%>" <%= read %>>
            	<td nowrap width=10% align="right">Tipo de Producto : </td>
            	<td  nowrap width=40% align="left">
					<input type="text" name="E01ILBTYP" size="5" maxlength="4" value="<%= userPO.getType().trim() %>" readonly>
				</td>
	  		</tr>
	  </table> 
      </td>  
    </tr>
  </table>  	
  
  	
   	
<br>
	
	<table width="100%">		
  	<tr>
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(10);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(6);" 
			<% } else { %>
				onClick="goAction(11);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
