<html>
<head>
<title>Codigos de Referencia</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css"
	rel="stylesheet">
<SCRIPT type="text/javascript">
function finish(){
 self.window.location.href = "<%=request.getContextPath()%>/pages/background.jsp";
}
</SCRIPT>
	
	
</head>
<jsp:useBean id="refCodes" class="datapro.eibs.beans.ESD003002Message" scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos"	scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<body>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
   
%>

<H3 align="center">C&oacute;digos de Referencia del Sistema - Motivos de Expedición Cheques de Gerencia<img src="<%=request.getContextPath()%>/images/e_ibs.gif"
	align="left" name="EIBS_GIF"
	title="cnof_origin_check_details.jsp, ESD0030"></H3>
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

		</table>
		</td>
	</tr>



</table>
<h4>Informacion Para Impresión</h4>
<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
		<table cellspacing="0" cellpadding="2" width="100%" border="0">

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="20%"> 
					<div align="right">Descripcion del Formato :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" disabled name="E02CNO1" value="Y" checked>
	                Sí 
	                <input type="radio" disabled name="E02CNO1" value="N" >
	                No
	              </div>
	            </td>
    	        <td nowrap width="20%"> 
					<div align="right">Fecha del Cheque :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" disabled name="E02CNO2" value="Y" checked>
	                Sí 
	                <input type="radio" disabled name="E02CNO2" value="N" >
	                No
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="20%"> 
					<div align="right">Numero del Cheque :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" disabled name="E02CNO3" value="Y" checked>
	                Sí 
	                <input type="radio" disabled name="E02CNO3" value="N" >
	                No
	              </div>
	            </td>
    	        <td nowrap width="20%"> 
					<div align="right">Valor de la Comision :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" disabled name="E02CNO4" value="Y" checked>
	                Sí 
	                <input type="radio" disabled name="E02CNO4" value="N" >
	                No
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="20%"> 
					<div align="right">Tipo/Id/Nombre Cliente :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOPAF" value="Y" <%if (refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOPAF" value="N" <%if (!refCodes.getE02CNOPAF().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
    	        <td nowrap width="20%"> 
					<div align="right">Monto I.V.A :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOIVA" value="Y" <%if (refCodes.getE02CNOIVA().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOIVA" value="N" <%if (!refCodes.getE02CNOIVA().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="20%"> 
					<div align="right">Monto G.M.F :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOF01" value="Y" <%if (refCodes.getE02CNOF01().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOF01" value="N" <%if (!refCodes.getE02CNOF01().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
    	        <td nowrap width="20%"> 
					<div align="right">Total Debitado :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNODCB" value="Y" <%if (refCodes.getE02CNODCB().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNODCB" value="N" <%if (!refCodes.getE02CNODCB().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="20%"> 
					<div align="right">Numero de Producto :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOTCF" value="Y" <%if (refCodes.getE02CNOTCF().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOTCF" value="N" <%if (!refCodes.getE02CNOTCF().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
    	        <td nowrap width="20%"> 
					<div align="right"> </div>
	            </td>
    	        <td nowrap width="30%"> 
					<div align="right"> </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="20%"> 
					<div align="right">Referencia 1 :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOF06" value="Y" <%if (refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOF06" value="N" <%if (!refCodes.getE02CNOF06().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
    	        <td nowrap width="20%"> 
					<div align="right">Referencia 2 :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOF07" value="Y" <%if (refCodes.getE02CNOF07().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOF07" value="N" <%if (!refCodes.getE02CNOF07().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="20%"> 
					<div align="right">Referencia 3 :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOF03" value="Y" <%if (refCodes.getE02CNOF03().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOF03" value="N" <%if (!refCodes.getE02CNOF03().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
    	        <td nowrap width="20%"> 
					<div align="right">Referencia 4 :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOF04" value="Y" <%if (refCodes.getE02CNOF04().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOF04" value="N" <%if (!refCodes.getE02CNOF04().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
	          </tr>

          	<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
    	        <td nowrap width="20%"> 
					<div align="right">Referencia 5 :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOF05" value="Y" <%if (refCodes.getE02CNOF05().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOF05" value="N" <%if (!refCodes.getE02CNOF05().equals("Y")) out.print("checked"); %>>
	                No
	              </div>
	            </td>
    	        <td nowrap width="20%"> 
					<div align="right">Referencia 6 :</div>
	            </td>
    	        <td nowrap width="30%"> 
	              <div align="left"> 
	                <input type="radio" name="E02CNOADI" value="Y" <%if (refCodes.getE02CNOADI().equals("Y")) out.print("checked"); %>>
	                Sí 
	                <input type="radio" name="E02CNOADI" value="N" <%if (!refCodes.getE02CNOADI().equals("Y")) out.print("checked"); %>>
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
