<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
<SCRIPT Language="javascript">
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>
	
	
</head>
<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" class="datapro.eibs.beans.UserPos"	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<body>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script language="Javascript1.1"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
builtHPopUp();
function showPopUp(opth,field,bank,ccy,field1,field2,opcod) {
   init(opth,field,bank,ccy,field1,field2,opcod);
   showPopupHelp();
   }
</SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
   
%>

<H3 align="center">C&oacute;digos de Referencia del Sistema - Entidades Embargantes<img src="<%=request.getContextPath()%>/images/e_ibs.gif"
	align="left" name="EIBS_GIF"
	title="cnof_courts_type_details.jsp, ESD0030"></H3>
<hr size="4">
<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600"> <INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">

<%int row = 0; %>

<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%">
					<div align="right">Clasificaci&oacute;n :</div>
				</td>
				<td nowrap>
					<div align="left"><input type="text" name="E02CNOCFL" size="3" maxlength="2" value="<%= refCodes.getE02CNOCFL().trim()%>"></div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">C&oacute;digo :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNORCD" size="6" maxlength="4" value="<%= refCodes.getE02CNORCD().trim()%>">
					<input type="text" name="E02CNODSC" size="36" maxlength="35" value="<%= refCodes.getE02CNODSC().trim()%>">
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="19">
					<div align="right">Tipo de Entidad Embargante :</div>
				</td>

				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNOCPC" size="6" maxlength="4" value="<%= refCodes.getE02CNOCPC().trim()%>" readonly>
					<input type="text" name="E02CNALB1" size="36" maxlength="35" value="<%= refCodes.getE02CNALB1().trim()%>" readonly>
            		<a href="javascript:GetCodeDescCNOFC('E02CNOCPC','E02CNALB1','GG')" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
				</div>
				</td>
			
				
				<!--
				<td nowrap height="19">
				<div align="left">
					<SELECT name="E02CNOF03">
						<OPTION value=""  <%if(refCodes.getE02CNOF03().trim().equals("")){%> Selected <%}%>> </OPTION>
						<OPTION value="A" <%if(refCodes.getE02CNOF03().trim().equals("A")){%> Selected <%}%>>Juzgado Civil Circuito</OPTION>
						<OPTION value="B" <%if(refCodes.getE02CNOF03().trim().equals("B")){%> Selected <%}%>>Juzgado Civil Municipal</OPTION>
						<OPTION value="C" <%if(refCodes.getE02CNOF03().trim().equals("C")){%> Selected <%}%>>Juzgado Familia</OPTION>
						<OPTION value="D" <%if(refCodes.getE02CNOF03().trim().equals("D")){%> Selected <%}%>>Juzgado Laboral</OPTION>
						<OPTION value="E" <%if(refCodes.getE02CNOF03().trim().equals("E")){%> Selected <%}%>>Juzgado Penal</OPTION>
						<OPTION value="F" <%if(refCodes.getE02CNOF03().trim().equals("F")){%> Selected <%}%>>Juzgado Ejecucion Penas</OPTION>
						<OPTION value="G" <%if(refCodes.getE02CNOF03().trim().equals("G")){%> Selected <%}%>>Juzgado de Menores</OPTION>
						<OPTION value="H" <%if(refCodes.getE02CNOF03().trim().equals("H")){%> Selected <%}%>>Juzgado Administrativo</OPTION>
						<OPTION value="I" <%if(refCodes.getE02CNOF03().trim().equals("I")){%> Selected <%}%>>Juzgado Promiscuo</OPTION>
						<OPTION value="J" <%if(refCodes.getE02CNOF03().trim().equals("J")){%> Selected <%}%>>Otros Juzgados</OPTION>
						<OPTION value="K" <%if(refCodes.getE02CNOF03().trim().equals("K")){%> Selected <%}%>>Otro Rama Judicial</OPTION>
						<OPTION value="L" <%if(refCodes.getE02CNOF03().trim().equals("L")){%> Selected <%}%>>Ente Tributario</OPTION>
						<OPTION value="M" <%if(refCodes.getE02CNOF03().trim().equals("M")){%> Selected <%}%>>Contraloria</OPTION>
						<OPTION value="N" <%if(refCodes.getE02CNOF03().trim().equals("N")){%> Selected <%}%>>Alcaldia</OPTION>
						<OPTION value="O" <%if(refCodes.getE02CNOF03().trim().equals("O")){%> Selected <%}%>>Gobernacion</OPTION>
						<OPTION value="P" <%if(refCodes.getE02CNOF03().trim().equals("P")){%> Selected <%}%>>ICBF</OPTION>
						<OPTION value="Q" <%if(refCodes.getE02CNOF03().trim().equals("Q")){%> Selected <%}%>>Sena</OPTION>
						<OPTION value="R" <%if(refCodes.getE02CNOF03().trim().equals("R")){%> Selected <%}%>>ISS</OPTION>
						<OPTION value="S" <%if(refCodes.getE02CNOF03().trim().equals("S")){%> Selected <%}%>>Otro Ente Coactivo</OPTION>
						<OPTION value="T" <%if(refCodes.getE02CNOF03().trim().equals("T")){%> Selected <%}%>>Superintendencia Sociedades</OPTION>
						<OPTION value="U" <%if(refCodes.getE02CNOF03().trim().equals("U")){%> Selected <%}%>>Superintendencia Financiera</OPTION>
						<OPTION value="V" <%if(refCodes.getE02CNOF03().trim().equals("V")){%> Selected <%}%>>Otra Superintendencia</OPTION>
						<OPTION value="W" <%if(refCodes.getE02CNOF03().trim().equals("W")){%> Selected <%}%>>Otro No Especificado</OPTION>
					</SELECT>
				</div>
				</td>
			-->
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="19">
					<div align="right">Oficina de Impresion Cheque Gerencia :</div>
				</td>
				<td nowrap height="19">
				<div align="left">
	              <input type="text" name="E02CNOFRP" id="E02CNOFRP" size="5" maxlength="4" value="<%= refCodes.getE02CNOFRP().trim()%>" readonly>
	              <a href="javascript:GetBranch('E02CNOFRP','')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0"  ></a>
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">Departamento de Ubicación :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNOUS1" size="6" maxlength="4" value="<%= refCodes.getE02CNOUS1().trim()%>" readonly>
					<input type="text" name="E02DSCUS1" size="36" maxlength="35" value="<%= refCodes.getE02DSCUS1().trim()%>" readonly>
            		<a href="javascript:GetCodeDescCNOFC('E02CNOUS1','E02DSCUS1','27')" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">Ciudad de Ubicación :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNOUS2" size="6" maxlength="4" value="<%= refCodes.getE02CNOUS2().trim()%>" readonly>
					<input type="text" name="E02DSCUS2" size="36" maxlength="35" value="<%= refCodes.getE02DSCUS2().trim()%>" readonly>
            		<a href="javascript:Get2FilterCodes('E02CNOUS2','E02DSCUS2','84', '',document.forms[0]['E02CNOUS1'].value)" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Dirección :</div>
	            </td>
	            <td nowrap height="19"> 
	              <div align="left"> 
					<input type="text" name="E02CNOEML" size="61" maxlength="60" value="<%= refCodes.getE02CNOEML().trim()%>">
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Tipo de Cuenta :</div>
	            </td>
	            <td nowrap height="19"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOADI" value="C" <%if (refCodes.getE02CNOADI().equals("C")) out.print("checked"); %>>
	                Corriente 
	                <input type="radio" name="E02CNOADI" value="A" <%if (refCodes.getE02CNOADI().equals("A")) out.print("checked"); %>>
	                Ahorros
	                <input type="radio" name="E02CNOADI" value="J" <%if (refCodes.getE02CNOADI().equals("J")) out.print("checked"); %>>
	                Judicial
	                <input type="radio" name="E02CNOADI" value="O" <%if (refCodes.getE02CNOADI().equals("O")) out.print("checked"); %>>
	                Otro 
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">Número de Cuenta :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNORUT" size="27" maxlength="25" value="<%= refCodes.getE02CNORUT().trim()%>">
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">Banco :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNOUS3" size="6" maxlength="4" value="<%= refCodes.getE02CNOUS3().trim()%>" readonly>
					<input type="text" name="E02DSCUS3" size="36" maxlength="35" value="<%= refCodes.getE02DSCUS3().trim()%>">
            		<a href="javascript:GetCodeDescCNOFC('E02CNOUS3','E02DSCUS3','92')" >
              		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" style="cursor:hand" ></a>
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Gasto por Traslado :</div>
	            </td>
	            <td nowrap height="19"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNODCC" value="Y" <%if (refCodes.getE02CNODCC().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNODCC" value="N" <%if (refCodes.getE02CNODCC().equals("N")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">Oficina Origen Banco Agrario :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNOMID" size="7" maxlength="6" value="<%= refCodes.getE02CNOMID().trim()%>" >
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>">
				<td nowrap width="30%" height="23">
					<div align="right">Oficina Destino Banco Agrario :</div>
				</td>
				<td nowrap height="23">
				<div align="left">
					<input type="text" name="E02CNOMIC" size="7" maxlength="6" value="<%= refCodes.getE02CNOMIC().trim()%>" >
				</div>
				</td>
			</tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="30%" height="19"> 
					<div align="right">Aplica Estatuto Tributario :</div>
	            </td>
	            <td nowrap height="19"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOCPF" value="Y" <%if (refCodes.getE02CNOCPF().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOCPF" value="N" <%if (refCodes.getE02CNOCPF().equals("N")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>

		</table>
		</td>
	</tr>
</table>

   <h4>&nbsp;</h4>  
      <div align="center">
         <%if(!userPO.getPurpose().equals("INQUIRY")) {%>
            <input id="EIBSBTN" type=submit name="Submit" value="Enviar">
         <%}%>
         <input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="finish();">
   </div>  
	    
</form>
</body>
</html>
