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

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.ECA001001Message"  scope="session" />
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
	if (op == 4) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	if (document.forms[0].E01ITRDRA.value != 0) {
		var x = [ 'E01ITRDBN', 'E01ITRDCY', 'E01ITRDGL'];
    	cleanFields(x);
	}
	if (document.forms[0].E01ITRCRA.value != 0) {
		var x = [ 'E01ITRCBN', 'E01ITRCCY', 'E01ITRCGL'];
    	cleanFields(x);
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
 de Transacciones por Proveedor
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="vendor_transactions_detail.jsp, ECA0010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0010" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
  <% int row = 0; %>  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Proveedor : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:cnofc name="msgRcd" property="E01ITRVND" value="<%=msgRcd.getE01ITRVND()%>" required="true" flag="BT" fn_code="E01ITRVND" fn_description="D01VND" readonly="<%=readMntB%>" />
            	<INPUT type="text" name="D01VND" size="47" readonly value="<%= msgRcd.getD01VND().trim()%>">
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap align="left" width="35%">
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Transacción Externa : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01ITRNOE" maxlength="10" size="12" <%=readMnt%> value="<%= msgRcd.getE01ITRNOE().trim()%>">
            	<%=mandatory %>
			</td>
            <td nowrap width="15%" align="right">Descripción : </td>
			<td nowrap align="left" width="35%">
            	<INPUT type="text" name="E01ITRDSC" maxlength="45" size="50" value="<%= msgRcd.getE01ITRDSC().trim()%>" <%=read%>>
            	<%=mandatory %>
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Transacción IBS Débito : </td>
			<td  nowrap width=40% align="left">
              <input type="text" name="E01ITRDIC" size="5" maxlength="4" value="<%= msgRcd.getE01ITRDIC().trim()%>" <%=read%>>
              <a href="javascript:GetCodeDescCNOFC('E01ITRDIC','D01DIC','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"> 
              <input type="text" name="D01DIC" size="47" maxlength="45" value="<%= msgRcd.getD01DIC().trim()%>" readonly>
			</td>
            <td nowrap width=10% align="right">Transacción IBS Crédito : </td>
            <td  nowrap width=40% align="left">
              <input type="text" name="E01ITRCIC" size="5" maxlength="4" value="<%= msgRcd.getE01ITRCIC().trim()%>" <%=read%>>
              <a href="javascript:GetCodeDescCNOFC('E01ITRCIC','D01CIC','20')"><img src="<%=request.getContextPath()%>/images/1b.gif" title="ayuda" align="bottom" border="0" ></a> 
              <img src="<%=request.getContextPath()%>/images/Check.gif" title="campo obligatorio" align="bottom" border="0"> 
              <input type="text" name="D01CIC" size="47" maxlength="45" value="<%= msgRcd.getD01CIC().trim()%>" readonly>
       		</td>
	     </tr>   
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
	      <td nowrap width=10% align="right">Cuenta Débito (BCO/MND/CUENTA) : </td>
	      <td  nowrap width=40% align="left"> 
	          <input type="text" name="E01ITRDBN" size="3" maxlength="2" value="<%= msgRcd.getE01ITRDBN().trim()%>" onkeypress="enterInteger(event)" <%=read%>>
	          <input type="text" name="E01ITRDCY" size="4" maxlength="3" value="<%= msgRcd.getE01ITRDCY().trim()%>"
	                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01ITRDBN.value,'','','','')" <%=read%>>
	          <input type="text" name="E01ITRDGL" size="18" maxlength="16" value="<%= msgRcd.getE01ITRDGL().trim()%>" onkeypress="enterInteger(event)"
	                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01ITRDBN.value,document.forms[0].E01ITRDCY.value,'','','')" <%=read%>>
	          <input type="text" name="E01ITRDRA" size="13" maxlength="12"  value="<%= msgRcd.getE01ITRDRA().trim()%>" onkeypress="enterInteger(event)"
	                class="context-menu-help" onmousedown="init(openingWireHelp,this.name,document.forms[0].E01ITRDBN.value,'','','','RT')" <%=read%> >
	          <%=mandatory %>      
	      </td>
	      <td nowrap width=10% align="right">Cuenta Crédito (BCO/MND/CUENTA) : </td> 
	      <td  nowrap width=40% align="left"> 
	          <input type="text" name="E01ITRCBN" size="3" maxlength="2" value="<%= msgRcd.getE01ITRCBN().trim()%>" onkeypress="enterInteger(event)" <%=read%>>
	          <input type="text" name="E01ITRCCY" size="4" maxlength="3" value="<%= msgRcd.getE01ITRCCY().trim()%>"
	                class="context-menu-help" onmousedown="init(currencyHelp,this.name,document.forms[0].E01ITRCBN.value,'','','','')" <%=read%>>
	          <input type="text" name="E01ITRCGL" size="18" maxlength="16" value="<%= msgRcd.getE01ITRCGL().trim()%>" onkeypress="enterInteger(event)"
	                 class="context-menu-help" onmousedown="init(ledgerHelp,this.name,document.forms[0].E01ITRCBN.value,document.forms[0].E01ITRCCY.value,'','','')" <%=read%>>
	          <input type="text" name="E01ITRCRA" size="13" maxlength="12"  value="<%= msgRcd.getE01ITRCRA().trim()%>" onkeypress="enterInteger(event)"
	                class="context-menu-help" onmousedown="init(openingWireHelp,this.name,document.forms[0].E01ITRCBN.value,'','','','RT')" <%=read%> >
	          <%=mandatory %>      
	      </td>
	    </tr>
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Transacción para Extracto DB : </td>
			<td  nowrap width=40% align="left">
				<INPUT type="text" name="E01ITREXD" maxlength="5" size="6" <%=read%> value="<%= msgRcd.getE01ITREXD().trim()%>" onkeypress="enterInteger(event)" <%=read%>>
      		</td>
            <td nowrap width=10% align="right">Transacción para Extracto CR : </td>
            <td  nowrap width=40% align="left">
            	<INPUT type="text" name="E01ITREXC" maxlength="5" size="6" <%=read%> value="<%= msgRcd.getE01ITREXC().trim()%>" onkeypress="enterInteger(event)" <%=read%>>
       		</td>
	    </tr>   
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
            <td nowrap width=10% align="right">Estado : </td>
            <td  nowrap width=40% align="left">
            	<select name="E01ITREST" <%=disabled%>>
          		<option value="A" <% if (msgRcd.getE01ITREST().equals("A")) out.print("selected"); %> >ACTIVA</option>
               	<option value="I" <% if (msgRcd.getE01ITREST().equals("I")) out.print("selected"); %>>INACTIVA</option>
           		</select><%=mandatory %>
       		</td>
			<td nowrap width=10% align="right">Enviar a Monitor Byte :</td>
			<td  nowrap width=40% align="left">
				<select name="E01ITRMON" <%=disabled%>>
          		<option value="Y" <% if (msgRcd.getE01ITRMON().equals("Y")) out.print("selected"); %> >SI</option> 
               	<option value="N" <% if (!msgRcd.getE01ITRMON().equals("Y")) out.print("selected"); %>>NO</option>
           		</select>
          </td>
	    </tr>	
	    <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Código de Comisión Cliente:</td>
			<td  nowrap width=40% align="left">
          		<input type="text" name="E01ITRCOM" size="5" maxlength="4" value="<%=msgRcd.getE01ITRCOM().trim()%>" <%=read%>>
				<a href="javascript:GetCommission('E01ITRCOM','D01ITRCOM', ' ')" >
				<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            	<INPUT type="text" name="D01ITRCOM" size="47" readonly value="<%= msgRcd.getD01ITRCOM().trim()%>">
			</td>
			<td nowrap width=10% align="right">Código de Comisión <BR> Cobrar al Proveedor:</td>
			<td nowrap width=40% align="left">
          		<input type="text" name="E01ITRCM1" size="5" maxlength="4" value="<%=msgRcd.getE01ITRCM1().trim()%>" <%=read%>>
				      <a href="javascript:GetCommission('E01ITRCM1','D01ITRCM1', ' ')" >
				      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            	<INPUT type="text" name="D01ITRCM1" size="47" readonly value="<%= msgRcd.getD01ITRCM1().trim()%>">
			</td>
	    </tr>	   
	    <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Código de Comisión <BR>Pagar al Proveedor:</td>
			<td nowrap width=40% align="left">
          		<input type="text" name="E01ITRCM2" size="5" maxlength="4" value="<%=msgRcd.getE01ITRCM2().trim()%>" <%=read%>>
				      <a href="javascript:GetCommission('E01ITRCM2','D01ITRCM2', ' ')" >
				      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            	<INPUT type="text" name="D01ITRCM2" size="47" readonly value="<%= msgRcd.getD01ITRCM2().trim()%>">
			</td>
			<td nowrap width=10% align="right">Código de Comisión <BR> Cobrar al Corresponsal:</td>
			<td nowrap width=40% align="left">
          		<input type="text" name="E01ITRCM3" size="5" maxlength="4" value="<%=msgRcd.getE01ITRCM3().trim()%>" <%=read%>>
				      <a href="javascript:GetCommission('E01ITRCM3','D01ITRCM3', ' ')" >
				      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            	<INPUT type="text" name="D01ITRCM3" size="47" readonly value="<%= msgRcd.getD01ITRCM3().trim()%>">
			</td>
	    </tr>	   
	    <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Código de Comisión <BR> pagar al Corresponsal:</td>
			<td nowrap width=40% align="left">
          		<input type="text" name="E01ITRCM4" size="5" maxlength="4" value="<%=msgRcd.getE01ITRCM4().trim()%>" <%=read%>>
				      <a href="javascript:GetCommission('E01ITRCM4','D01ITRCM4', ' ')" >
				      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            	<INPUT type="text" name="D01ITRCM4" size="47" readonly value="<%= msgRcd.getD01ITRCM4().trim()%>">
			</td>
			<td nowrap width=10% align="right"></td>
			<td nowrap width=40% align="left"></td>
	    </tr>	   

	   </table> 
      </td>  
    </tr>
  </table>
  
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(5);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Delete" value="Borrar" onClick="goAction(4);" <%= disabled %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(1);" 
			<% } else { %>
				onClick="goAction(6);" 
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
            	<%= msgRcd.getE01ITRCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01ITRMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01ITRCDM()),Integer.parseInt(msgRcd.getE01ITRCDD()),Integer.parseInt(msgRcd.getE01ITRCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01ITRRDM()),Integer.parseInt(msgRcd.getE01ITRRDD()),Integer.parseInt(msgRcd.getE01ITRRDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01ITRCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01ITRMTM()%>
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
