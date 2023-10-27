<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@page import = "datapro.eibs.master.Util" %>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<html>
<head>
<title>Convenios - Motor de Pagos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset="utf-8">
<META http-equiv="Content-Style-Type" content="text/css">
<link Href="<%=request.getContextPath()%>/pages/style.css"rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/themes/smoothness/jquery-ui.css"/> 

<jsp:useBean id="msgRcd" class= "datapro.eibs.beans.ECSM00205Message"  scope="session"  />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id= "userPO" class= "datapro.eibs.beans.UserPos"  scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"></SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"></SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/jquery.jsp"> </script>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"></script>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=msgRcd"> </script>

<SCRIPT type="text/javascript">

<% if(userPO.getPurpose().equals("MAINTENANCE")) {%>
	builtNewMenu(csm_m_opt);
 <% } %>


<%int row = 0; %>

<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	String help = "<img src=\"" + request.getContextPath() + "/images/1b.gif\" title=\"Ayuda\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = (userPO.getPurpose().equals("INQUIRY") || userPO.getPurpose().equals("APPROVAL"));
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
 	String disabledMnt = (userPO.getPurpose().equals("NEW")?"":" disabled");
 	if (isInquiry) {
 	  help = "";
 	}
%>

	
function goAction(op) {
	document.forms[0].SCREEN.value = op;
	submitForm();
}
</SCRIPT>


</head>
<body>
	<%
		if (!error.getERRNUM().equals("0")) {
			error.setERRNUM("0");
			out.println("<SCRIPT Language=\"Javascript\">");
			out.println("       showErrors()");
			out.println("</SCRIPT>");

  out.println("<SCRIPT> initMenu(); </SCRIPT>");				
		
		}
	%>
	<div align="center">
		<h3>
			Convenios - Referencias - Codigo de Barras<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="reciprocity_cash_management.jsp,ECSM002">
		</h3>
	</div>
	<hr size="4">
	<form method="post"
		action="<%=request.getContextPath()%>/servlet/datapro.eibs.cashmg.JSECSM002">
		<h4>Información Básica</h4>
		<input type="hidden" name="SCREEN" value="20">

		<table class="tableinfo">
			<tr>
				<td nowrap>
					<table cellpadding=2 cellspacing=0 width="100%" border="0">
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%">
								<DIV align="right">Convenio:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CRENUM" size="12" maxlength="12" value="<%=userPO.getAccNum().trim()%>" readonly>
							</TD>
							<TD nowrap width="15%" align="right">
								<DIV >Cliente:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CREBNK" size="3" maxlength="2" value="<%=userPO.getBank().trim()%>" readonly> / 
								<INPUT type="text" name="E05CRECUN" size="10" maxlength="9" value="<%=userPO.getCusNum().trim()%>" readonly>
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%">
								<DIV align="right">Canal:</DIV>
							</TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CRECNL" size="3" maxlength="2" value="<%=userPO.getHeader3().trim()%>"  readonly>
							</TD>
							<TD nowrap width="15%" align="right">Tipo : </TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CRETIP" size="2" maxlength="1" value="<%=msgRcd.getE05CRETIP().trim()%>"  readonly>
			              	   <input type="text" readonly name="E05CRETIP" size="20" maxlength="20" 
			              	   	  value="<% if (msgRcd.getE05CRETIP().equals("B")) out.print("Codigo de Barras");
								  else if (msgRcd.getE05CRETIP().equals("R")) out.print("Referencia");
								  else if (msgRcd.getE05CRETIP().equals("P")) out.print("PIN");
							      else out.print("");%>">
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Secuencia : </TD>
							<TD nowrap width="35%">
								<INPUT type="text" readonly name="E05CRESEQ" size="5" maxlength="5" value="<%=msgRcd.getE05CRESEQ().trim()%>">
       	        			</TD>
							<TD nowrap width="15%" align="right">Nombre Variable : </TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CRENOM" size="65" maxlength="60" value="<%=msgRcd.getE05CRENOM().trim()%>">
       	        			</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Tipo Campo : </TD>
							<TD nowrap width="35%">
								<select name="E05CRETIC">
									<option value=" " <%if (msgRcd.getE05CRETIC().equals(" ")) { out.print("selected");}%>> </option>
									<option value="I" <%if (msgRcd.getE05CRETIC().equals("I")) { out.print("selected");}%>>Entrada</option>
									<option value="O" <%if (msgRcd.getE05CRETIC().equals("O")) { out.print("selected");}%>>Salida</option>
									<option value="B" <%if (msgRcd.getE05CRETIC().equals("B")) { out.print("selected");}%>>Ambos</option>
									<option value="N" <%if (msgRcd.getE05CRETIC().equals("N")) { out.print("selected");}%>>N/A</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Obligatoria : </TD>
							<TD nowrap width="35%">
								<select name="E05CREOBL">
									<option value=" " <%if (msgRcd.getE05CREOBL().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE05CREOBL().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE05CREOBL().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Impresion : </TD>
							<TD nowrap width="35%">
								<select name="E05CREIMP">
									<option value=" " <%if (msgRcd.getE05CREIMP().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE05CREIMP().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE05CREIMP().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Llave : </TD>
							<TD nowrap width="35%">
								<select name="E05CREKEY">
									<option value=" " <%if (msgRcd.getE05CREKEY().equals(" ")) { out.print("selected");}%>> </option>
									<option value="Y" <%if (msgRcd.getE05CREKEY().equals("Y")) { out.print("selected");}%>>Si</option>
									<option value="N" <%if (msgRcd.getE05CREKEY().equals("N")) { out.print("selected");}%>>No</option>
								</select>
							</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Posicion Inicial : </TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CREPOI" size="5" maxlength="5" value="<%=msgRcd.getE05CREPOI().trim()%>">
							</TD>
							<TD nowrap width="15%" align="right">Posicion Final : </TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CREPOF" size="5" maxlength="5" value="<%=msgRcd.getE05CREPOF().trim()%>">
       	        			</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Tipo Variable : </TD>
							<TD nowrap width="35%">
								<select name="E05CRETIV">
									<option value=" " <%if (msgRcd.getE05CRETIV().equals(" ")) { out.print("selected");}%>> </option>
									<option value="A" <%if (msgRcd.getE05CRETIV().equals("A")) { out.print("selected");}%>>Alfanumerica</option>
									<option value="N" <%if (msgRcd.getE05CRETIV().equals("N")) { out.print("selected");}%>>Numerica</option>
								</select>
							</TD>
							<TD nowrap width="15%" align="right">Longitud de la Variable : </TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CRELON" size="5" maxlength="5" value="<%=msgRcd.getE05CRELON().trim()%>">
       	        			</TD>
						</tr>
          				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
							<TD nowrap width="15%" align="right">Decimales : </TD>
							<TD nowrap width="35%">
								<INPUT type="text" name="E05CREDEC" size="5" maxlength="5" value="<%=msgRcd.getE05CREDEC().trim()%>">
							</TD>	
							<TD nowrap width="15%" align="right"></TD>
							<TD nowrap width="35%"></TD>
						</tr>
					</table>
				</td>
			</tr>
		</table>

	<table width="100%">		
        <tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
  		<td width="50%">
  		<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(20);">
     	  </div>	
     	  <%} %>
  		</td>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" onClick="goAction(16);">
     	  </div>	
  		</td>
  	</tr>	
  </table>	

		
	</form>
	
</body>
</html>
