<%@ page import = "datapro.eibs.master.Util" %>
<html>
<head>
<title>Treasury</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="beanRecord" class="datapro.eibs.beans.ETR000501Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />
 
<body>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript">

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	document.forms[0].submit();
}

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	String read = "";
 	String disabled = "";
 	String ptitle ="Nuevo Banco";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {
	      read = " readonly ";
		  disabled = " disabled";	
    }
    if(	!userPO.getPurpose().equals("NEW")){
    	  ptitle ="Mantenimiento de Banco";
    }
    if(	!userPO.getPurpose().equals("NEW") && !userPO.getPurpose().equals("MAINTENANCE")){
    	  ptitle ="Consulta de Banco";
    }
    
%>


<H3 align="center"><%= ptitle %><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" ALT="trs_parameters.jsp, ETR0005"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.treasury.JSETR0005" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="10%" align="right">Código : </td>
            <td nowrap width="15%" align="left"> 
                <INPUT type="text" name="E01TRSBNK" size="4"  maxlength="2" <%= read %> value="<%= beanRecord.getE01TRSBNK().trim()%>"
				<% if (!(userPO.getPurpose().equals("NEW"))) out.print(" readonly"); %>
				>
				<B><IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom"></B>
			</td>
            <td nowrap width="10%" align="right">Nombre :</td>
			<td nowrap width="40%" align="left">
				<INPUT type="text" name="E01TRSNME" size="45" readonly value="<%= beanRecord.getE01TRSNME().trim()%>">
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Parámetros Financieros</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Línea de Crédito TRS : </td>
            <td nowrap align="left" width="35%">
				<input type="radio" name="E01TRSFIN" value="Y" <%if (beanRecord.getE01TRSFIN().equals("Y")) out.print("checked"); %>>
                Sí 
                <input type="radio" name="E01TRSFIN" value="N" <%if (!beanRecord.getE01TRSFIN().equals("Y")) out.print("checked"); %>>
                No 
            </td>
            <td nowrap width="15%" align="right">FX Días para ingresar Tasa de NDF : </td>
            <td nowrap width="35%" align="left">
            	<input type="text" name="E01TRSNDS" size="4" maxlength="2" value="<%= beanRecord.getE01TRSNDS().trim()%>" onkeypress="enterInteger()"> 
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">FX Límites Diarios : </td>
            <td nowrap align="left" width="35%">
				<input type="radio" name="E01TRSSET" value="Y" <%if (beanRecord.getE01TRSSET().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E01TRSSET" value="N" <%if (!beanRecord.getE01TRSSET().equals("Y")) out.print("checked"); %>>
                No 
            </td>
            <td nowrap width="15%" align="right"> </td>
            <td nowrap width="35%" align="left"> 
				 
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">FX Rango de Tolerancia : </td>
			<td nowrap width="35%" align="left">
				<input type="radio" name="E01TRSTOR" value="Y" <%if (beanRecord.getE01TRSTOR().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E01TRSTOR" value="N" <%if (!beanRecord.getE01TRSTOR().equals("Y")) out.print("checked"); %>>
                No
            </td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Solicitar Producto en Dealer Slip : </td>
			<td nowrap width="35%" align="left">
		 		<input type="radio" name="E01TRSPRF" value="Y" <%if (beanRecord.getE01TRSPRF().equals("Y")) out.print("checked"); %>>
                S&iacute; 
                <input type="radio" name="E01TRSPRF" value="N" <%if (!beanRecord.getE01TRSPRF().equals("Y")) out.print("checked"); %>>
                No
            </td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
			<% } %>>
     	  </div>	
  		</td>

  	</tr>	
  </table>	

 <br><h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right"></td>
            <td nowrap align="left" width="35%">
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= beanRecord.getE01TRSLMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= beanRecord.getE01TRSLMT()%>
			</td> 
          </tr>
        </table> 
      </td>  
    </tr>
  </table>    

</form>
</body>
</html>
