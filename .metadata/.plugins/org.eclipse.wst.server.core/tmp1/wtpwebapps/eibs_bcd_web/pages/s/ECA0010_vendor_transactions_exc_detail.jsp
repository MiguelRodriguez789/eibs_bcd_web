<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Interfaces y Canales</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.ECA001003Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
 
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script type="text/javascript">
<%
	String read = "";
 	String disabled = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
%>


function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 24) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	submitForm();
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

<H3 align="center">
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
Mantenimiento
<% } else {%>
Consulta
<% } %>
 de Transacciones Exentas
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="vendor_transactions_exc_detail.jsp, ECA0010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="25">
  
  <% int row = 0; %>  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Proveedor : </td>
            <td nowrap align="left" width="35%">
           	    <INPUT type="text" name="E03EXCVND" maxlength="4" size="5" value="<%= userPO.getHeader2()%>" readonly>
 			</td>
            <td nowrap width="15%" align="right">Transacción Externa :</td>
			<td nowrap align="left" width="35%">
           	    <INPUT type="text" name="E03EXCNOE" maxlength="10" size="11" value="<%= userPO.getHeader3()%>"" readonly>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Banco </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E03EXCBNK" maxlength="2" size="2" value="<%= msgRcd.getE03EXCBNK().trim()%>" readonly>
			</td>
            <td nowrap width="15%" align="right">Tipo Producto: </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="E03EXCATY" maxlength="4" size="5" value="<%= msgRcd.getE03EXCATY().trim()%>" <%=read%>>
            	<a href="javascript:GetProductRates('E03EXCATY','RT')">
            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="help" align="middle" border="0" ></a> 
            	<%=mandatory %>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Tabla Cargos : </td>
			<td  nowrap width=40% align="left">
			    <input type="text" name="E03EXCTBL" size="5" maxlength="4" value="<%= msgRcd.getE03EXCTBL().trim() %>">
				<a href="javascript:GetRetCod('E03EXCTBL',document.forms[0].E03EXCATY.value)">
				<img src="<%=request.getContextPath()%>/images/1b.gif" title=". . ." align="bottom" border="0"></a>
			</td>
            <td nowrap width=10% align="right">Cantidad Transacciones exentas : </td>
            <td  nowrap width=40% align="left">
              <input type="text" name="E03EXCQTY" size="8" maxlength="5" value="<%= msgRcd.getE03EXCQTY().trim()%>" <%=read%>>
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
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(25);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Delete" value="Borrar" onClick="goAction(24);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(21);" 
			<% } else { %>
				onClick="goAction(26);" 
			<% } %>>
     	  </div>	
  		</td>
  	</tr>	
  </table>	
  
  <h4>Información de Auditoria</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Usuario Creador : </td>
            <td nowrap align="left" width="35%">
            	<%= msgRcd.getE03EXCCMU()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE03EXCLMU()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE03EXCCMM()),Integer.parseInt(msgRcd.getE03EXCCDD()),Integer.parseInt(msgRcd.getE03EXCCYY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE03EXCLMM()),Integer.parseInt(msgRcd.getE03EXCLDD()),Integer.parseInt(msgRcd.getE03EXCLYY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE03EXCCTT()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE03EXCLTT()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  </form>
</body>

	<SCRIPT type="text/javascript">
		
	</SCRIPT>


</html>
