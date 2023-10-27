<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>

<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">

<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet"> 
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001703Message"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
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

  out.println("<SCRIPT> initMenu(); </SCRIPT>");
  
 	String read = " ";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
	if (userPO.getPurpose().equals("MAINTENANCE")) {
		read = " readonly "; 
	}


%>



<h3 align="center">Corresponsales<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" 
	name="EIBS_GIF" title="corresponsales_inq_header.jsp, ECA0017"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0017" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="11">

<%int row = 0; %>
 
 <h4>Informaci&oacute;n Basica</h4>
  
 	<table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Banco : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CORBNK" size="3" maxlength="2" value="<%= msgRcd.getE03CORBNK() %>" readonly />
				</td>
				<td nowrap width=10% align="right">Cliente : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CORCUN" size="10" maxlength="9" value="<%=msgRcd.getE03CORCUN()%>" readonly />
                    <input type="text" name="D03CORCUN" size="62" maxlength="60" value="<%= msgRcd.getD03CORCUN().trim()%>" readonly />
				</td>
			</tr>
      	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Tipo : </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CORTIP" size="2" maxlength="1" value="<%=msgRcd.getE03CORTIP()%>" readonly />
                    <input type="text" name="D03CORTIP" size="62" maxlength="60" value="<%= msgRcd.getD03CORTIP().trim()%>" readonly />
				</td>
				<td nowrap width=10% align="right">Cuenta Detalle: </td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CORACC" size="15" maxlength="12" value="<%=msgRcd.getE03CORACC()%>" readonly />
				</td>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width=10% align="right">Linea de Credito :</td>
				<td nowrap width=40% align="left">
					<input type="text" name="E03CORLNE" size="4" maxlength="4" value="<%=msgRcd.getE03CORLNE()%>" readonly />
				</td>
				<TD nowrap width="15%" align="right">Dias Maximos Utilizacion : </TD>
				<TD nowrap width="35%">
					<input type="text" name="E03CORDMX" size="5" maxlength="5" value="<%=msgRcd.getE03CORDMX()%>" readonly /> 
				</TD>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">% Maximo Utilizacion :</TD>
				<TD nowrap width="35%">
					<input type="text" name="E03CORPMX" size="9" maxlength="9" value="<%=msgRcd.getE03CORPMX()%>" readonly /> 
				</TD>
				<TD nowrap width="15%" align="right">Banco/Moneda/Cuenta Contable<br> Pago Comision</TD>
				<TD nowrap width="35%">
					<input type="text" name="E03CORCBK" size="2" maxlength="2" value="<%=msgRcd.getE03CORCBK()%>" readonly /> / 
			    	<input type="text" name="E03CORCCY" size="4" maxlength="4" value="<%=msgRcd.getE03CORCCY()%>"  readonly /> 
                	<eibsinput:text name="msgRcd" property="E03CORCLN" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_GLEDGER %>" readonly="true" />
 				</TD>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">Lote :</TD>
				<TD nowrap width="35%">
					<input type="text" name="E03CORBTH" size="6" maxlength="5" value="<%=msgRcd.getE03CORBTH()%>" readonly /> 
				</TD>
				<TD nowrap width="15%" align="right">Estado :</TD>
				<TD nowrap width="35%">                  
					<input type="text" name="E03CORSTS" size="2" maxlength="1" value="<%=msgRcd.getE03CORSTS()%>" readonly />
                    <input type="text" name="D03CORSTS" size="62" maxlength="60" value="<%= msgRcd.getD03CORSTS().trim()%>" readonly />
				</TD>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">Valor de Uso :</TD>
				<TD nowrap width="35%">
					<input type="text" name="E03CORVRA" size="15" maxlength="15" value="<%=msgRcd.getE03CORVRA()%>" readonly /> 
				</TD>
				<TD nowrap width="15%" align="right">Fecha de Uso :</TD>
				<TD nowrap width="35%">                  
					<eibsinput:date name="msgRcd" fn_year="E03CORBYY" fn_month="E03CORBMM" fn_day="E03CORBDD" readonly="true" />
				</TD>
			</tr>
			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<TD nowrap width="15%" align="right">Calificacion :</TD>
				<TD nowrap width="35%">
					<input type="text" name="E03CORCAL" size="1" maxlength="1" value="<%=msgRcd.getE03CORCAL()%>" readonly /> 
				</TD>
				<TD nowrap width="15%" align="right">Fecha de Bloqueo :</TD>
				<TD nowrap width="35%">                  
					<eibsinput:date name="msgRcd" fn_year="E03COROYY" fn_month="E03COROMM" fn_day="E03CORODD" readonly="true" />
				</TD>
			</tr>
   		</table> 
      </td>  
    </tr>
  </table>
<br>
	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(11);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
