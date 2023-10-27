<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<%@ page import = "datapro.eibs.master.*,datapro.eibs.beans.*" %>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id= "msgRcd" class= "datapro.eibs.beans.ECA001704Message"  scope="session" />
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

<% if(userPO.getPurpose().equals("MAINTENANCE")) {%>
	builtNewMenu(eca_m_opt);
 <% } %>

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
	name="EIBS_GIF" title="corresponsales_saldo.jsp, ECA0017"></h3>
<hr size="4">

<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0017" >

  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="17">

<%int row = 0; %>
 
<h4>Informaci&oacute;n Basica</h4>
	<table  class="tableinfo" width="100%">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=10% align="right">Banco : </td>
						<td nowrap width=40% align="left">
							<input type="text" name="E04CORBNK" size="3" maxlength="2" value="<%= msgRcd.getE04CORBNK() %>" readonly>
						</td>
						<td nowrap width=10% align="right">Cliente : </td>
						<td nowrap width=40% align="left">
							<input type="text" name="E04CORCUN" size="10" maxlength="9" value="<%=msgRcd.getE04CORCUN()%>" readonly>
                    		<input type="text" name="D04CORCUN" size="62" maxlength="60" value="<%= msgRcd.getD04CORCUN().trim()%>" readonly>
						</td>
					</tr>
      				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=10% align="right">Linea de Credito: </td>
						<td nowrap width=40% align="left">
							<input type="text" name="E04CORLNE" size="5" maxlength="4" value="<%=msgRcd.getE04CORLNE()%>" readonly>
						</td>
						<td nowrap width=10% align="right">Disponible </td>
						<td nowrap width=40% align="left">
							<input type="text" name="E04CORDIS" size="15" maxlength="12" value="<%=msgRcd.getE04CORDIS()%>" readonly/> 
						</td>
					</tr>
   				</table> 
      		</td>  
    	</tr>
	</table>

<br>

<h4>Transferencia entre Lineas de Credito</h4>
	<table  class="tableinfo" width="100%">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=10% align="right">De la Linea : </td>
						<td nowrap width=20% align="left">
							<input type="text" name="E04CODLN1" size="4" maxlength="5" value="<%=msgRcd.getE04CODLN1()%>" >
								<a href="javascript:GetLneCorr('E04CODLN1',document.forms[0].E04CORCUN.value,'E04CODDI1','','E04CODVC1')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Corresponsales" align="bottom" border="0" ></a>
						</td>
						<td nowrap width=10% align="right">Cupo : </td>
						<td nowrap width=20% align="left">
							<input type="text" name="E04CODVC1" size="15" maxlength="15" value="<%=msgRcd.getE04CODVC1()%>" readonly>
						</td>
						<td nowrap width=10% align="right">Disponible : </td>
						<td nowrap width=30% align="left">
							<input type="text" name="E04CODDI1" size="15" maxlength="15" value="<%=msgRcd.getE04CODDI1()%>" readonly>
						</td>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=10% align="right">A la Linea : </td>
						<td nowrap width=20% align="left">
							<input type="text" name="E04CODLN2" size="4" maxlength="5" value="<%=msgRcd.getE04CODLN2()%>">
								<a href="javascript:GetLneCorr('E04CODLN2',document.forms[0].E04CORCUN.value,'E04CODDI2','','E04CODVC2')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Corresponsales" align="bottom" border="0" ></a>
						</td>
						<td nowrap width=10% align="right">Cupo : </td>
						<td nowrap width=20% align="left">
							<input type="text" name="E04CODVC2" size="15" maxlength="15" value="<%=msgRcd.getE04CODVC2()%>" readonly>
						</td>
						<td nowrap width=10% align="right">Disponible : </td>
						<td nowrap width=30% align="left">
							<input type="text" name="E04CODDI2" size="15" maxlength="15" value="<%=msgRcd.getE04CODDI2()%>" readonly>
						</td>
					</tr>
					<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=20% align="right">Valor a Transferir : </td>
						<td nowrap width=80% align="left">
							<input type="text" name="E04CODTRA" size="15" maxlength="15" value="<%=msgRcd.getE04CODTRA()%>" />
						</td>
					</tr>
   				</table> 
      		</td>  
    	</tr>
	</table>

  	
<br>

<h4>Ajuste de Saldo en Linea de Credito</h4>
<table  class="tableinfo" width="100%">
    	<tr bordercolor="#FFFFFF"> 
      		<td nowrap> 
        		<table cellspacing="0" cellpadding="2" width="100%" border="0">
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=10% align="right">Linea : </td>
						<td nowrap width=20% align="left">
							<input type="text" name="E04CODLN3" size="4" maxlength="5" value="<%=msgRcd.getE04CODLN3()%>" >
								<a href="javascript:GetLneCorr('E04CODLN3',document.forms[0].E04CORCUN.value,'E04CODDI3','','E04CODVC3')">
                				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Corresponsales" align="bottom" border="0" ></a>
						</td>
						<td nowrap width=10% align="right">Cupo : </td>
						<td nowrap width=20% align="left">
							<input type="text" name="E04CODVC3" size="15" maxlength="15" value="<%=msgRcd.getE04CODVC3()%>" readonly>
						</td>
						<td nowrap width=10% align="right">Disponible : </td>
						<td nowrap width=30% align="left">
							<input type="text" name="E04CODDI3" size="15" maxlength="15" value="<%=msgRcd.getE04CODDI3()%>" readonly>
						</td>
					</tr>
          			<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
						<td nowrap width=20% align="right">Valor a Ajustar : </td>
						<td nowrap width=80% align="left">
							<input type="text" name="E04CODTR2" size="15" maxlength="15" value="<%=msgRcd.getE04CODTR2()%>" />
						</td>
						<td nowrap width=20% align="right">Operación D/C : </td>
						<td nowrap width=80% align="left">
							<input type="text" name="E04CODDCC" size="1" maxlength="1" value="<%=msgRcd.getE04CODDCC()%>" />
						</td>
					</tr>
   				</table> 
      		</td>  
    	</tr>
	</table>


	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(17);">
     	  </div>	
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(15);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	
 
 
</form>
</body>

	<SCRIPT type="text/javascript">
	</SCRIPT>

</html>
