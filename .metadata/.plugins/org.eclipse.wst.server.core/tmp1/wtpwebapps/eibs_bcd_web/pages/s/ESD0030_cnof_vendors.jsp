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

<H3 align="center">C&oacute;digos de Referencia del Sistema - PROVEEDORES DE INTERFACES<img src="<%=request.getContextPath()%>/images/e_ibs.gif"
	align="left" name="EIBS_GIF"
	title="cnof_vendors.jsp, ESD0030"></H3>
<hr size="4">
<form method="post"	action="<%=request.getContextPath()%>/servlet/datapro.eibs.params.JSESD0030">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="600">
<INPUT TYPE=HIDDEN NAME="E02CNOBNK" value="<%= currUser.getE01UBK()%>">
<INPUT TYPE=HIDDEN NAME="E02CNOCCY" value="<%= currUser.getE01BCU()%>">

<%int row = 0; %>

<table class="tableinfo">
	<tr bordercolor="#FFFFFF">
		<td nowrap>
			<table  width="100%" border="0">
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
	            	<td nowrap width="25%"> 
                   		<div align="right">Código de Cliente :</div>
    	        	</td>
    	        	<td nowrap> 
                   		<div align="left"> 
                      		<input type="text" name="E02CNOPHN" size="10" maxlength="9" value="<%=refCodes.getE02CNOPHN().trim()%>">
                      		<a href="javascript:GetCustomer('E02CNOPHN')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0" ></a>
						</div>
    	        	</td>
	          	</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
	            	<td nowrap width="25%"> 
                   		<div align="right">Cuenta Contable :</div>
    	        	</td>
    	        	<td nowrap> 
                   		<div align="left"> 
                      		<input type="text" name="E02CNOSCG" size="17" maxlength="16" value="<%=refCodes.getE02CNOSCG().trim()%>">
                      		<a href="javascript:GetLedger('E02CNOSCG',document.forms[0].E02CNOBNK.value,document.forms[0].E02CNOCCY.value,'')">
					  		<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
                   		</div>
    	        	</td>
	          	</tr>
          		<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>"> 
            		<td nowrap width="16%" height="19"> 
              			<div align="right">Gestor de Red :</div>
            		</td>
            		<td nowrap height="19"> 
              			<div align="left"> 
                			<input type="radio" name="E02CNOF03" value="Y" <%if (refCodes.getE02CNOF03().equals("Y")) out.print("checked"); %>>S&iacute; 
                			<input type="radio" name="E02CNOF03" value="N" <%if (refCodes.getE02CNOF03().equals("N")) out.print("checked"); %>>No
               			</div>
            		</td>
          		</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
	            	<td nowrap width="25%"> 
                   		<div align="right">Requiere Validacion :</div>
    	        	</td>
            		<td nowrap height="19"> 
              			<div align="left"> 
                			<input type="radio" name="E02CNOF04" value="Y" <%if (refCodes.getE02CNOF04().equals("Y")) out.print("checked"); %>>S&iacute; 
							<input type="radio" name="E02CNOF04" value="N" <%if (refCodes.getE02CNOF04().equals("N")) out.print("checked"); %>>No
						</div>
            		</td>
	          	</tr>
				<tr id="<%=(row % 2 == 1) ? "trdark" : "trclear"%><%row++;%>"> 
	            	<td nowrap width="25%"> 
                   		<div align="right">Codigo Entidad para ATM :</div>
    	        	</td>
            		<td nowrap height="19"> 
              			<div align="left"> 
                      		<input type="text" name="E02CNOCCN" size="9" maxlength="7" value="<%=refCodes.getE02CNOCCN().trim()%>">
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
