<%@ page import="datapro.eibs.master.Util" %>
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import="com.datapro.constants.EibsFields" %>
<%@ page import="com.datapro.eibs.constants.HelpTypes" %>

<html>
<head>
<title>Homologación de Transacciones</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
</head>

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.ECA001201Message"  scope="session" />
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
%>  

<H3 align="center">
<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
Mantenimiento
<% } else {%>
Consulta
<% } %>
 de Homologación de Transacciones - Codigos de Operación
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="std_transactions_detail.jsp, ECA0012"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0012" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  
  <% int row = 0; %>  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Transacción IBS : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:cnofc name="msgRcd" property="E01ITSIBS" value="<%=msgRcd.getE01ITSIBS()%>" required="true" flag="20" fn_code="E01ITSIBS" fn_description="E01ITSDSC" readonly="<%=readMntB%>" />
            	<INPUT type="text" name="E01ITSDSC" size="47" readonly value="<%= msgRcd.getE01ITSDSC().trim()%>">
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap align="left" width="35%">
			</td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Código de Aplicación : </td>
			<td  nowrap width=40% align="left">
              <input type="text" name="E01ITSACD" size="3" maxlength="2" value="<%= msgRcd.getE01ITSACD().trim()%>" <%=read%>>
              <a href="javascript:GetApplicationCode('E01ITSACD')">
              <img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0"></a>
			</td>
            <td nowrap width=10% align="right">Evento : </td>
            <td  nowrap width=40% align="left">
              <select name="E01ITSAPC" <%=disabled%>>
              	<option value=" " <% if (msgRcd.getE01ITSAPC().equals(" ")) out.print("selected"); %>>Todos</option>
          		<option value="P" <% if (msgRcd.getE01ITSAPC().equals("P")) out.print("selected"); %>>Principal</option> 
               	<option value="I" <% if (msgRcd.getE01ITSAPC().equals("I")) out.print("selected");%>>Intereses</option>
               	<option value="L" <% if (msgRcd.getE01ITSAPC().equals("L")) out.print("selected"); %>>Mora</option> 
               	<option value="1" <% if (msgRcd.getE01ITSAPC().equals("1")) out.print("selected");%>>Impuestos</option>
               	<option value="2" <% if (msgRcd.getE01ITSAPC().equals("2")) out.print("selected"); %>>Comisiones</option> 
               	<option value="3" <% if (msgRcd.getE01ITSAPC().equals("3")) out.print("selected");%>>Deducciones</option>
               	<option value="4" <% if (msgRcd.getE01ITSAPC().equals("4")) out.print("selected"); %>>IVA</option> 
               	<option value="5" <% if (msgRcd.getE01ITSAPC().equals("5")) out.print("selected");%>>Cobranzas</option>
               	<option value="9" <% if (msgRcd.getE01ITSAPC().equals("9")) out.print("selected"); %>>GMF</option> 
               	<option value="*" <% if (msgRcd.getE01ITSAPC().equals("*")) out.print("selected");%>>PRI/INT Refinanceado</option>
               	<option value="A" <% if (msgRcd.getE01ITSAPC().equals("A")) out.print("selected"); %>>Pago Revaluación UF</option> 
               	<option value="C" <% if (msgRcd.getE01ITSAPC().equals("C")) out.print("selected");%>>Reversión Revaluación UF</option>
               	<option value="R" <% if (msgRcd.getE01ITSAPC().equals("R")) out.print("selected"); %>>INC/DEC Revaluación</option> 
               	<option value="X" <% if (msgRcd.getE01ITSAPC().equals("X")) out.print("selected");%>>Abono a Principal</option>
               	<option value="Y" <% if (msgRcd.getE01ITSAPC().equals("Y")) out.print("selected"); %> >Abono a Revaluación UF</option> 
               	<option value="Q" <% if (msgRcd.getE01ITSAPC().equals("Q")) out.print("selected");%>>Reverso Abono Revaluación UF</option>
               	<option value="Z" <% if (msgRcd.getE01ITSAPC().equals("Z")) out.print("selected"); %>>Interes Prepagado</option> 
               	<option value="B" <% if (msgRcd.getE01ITSAPC().equals("B")) out.print("selected");%>>Pago Reajuste Mora</option>
               	<option value="D" <% if (msgRcd.getE01ITSAPC().equals("D")) out.print("selected"); %>>Reverso Pago Reajuste Mora</option> 
               	<option value="S" <% if (msgRcd.getE01ITSAPC().equals("S")) out.print("selected");%>>INC/DEC Reajuste Mora</option>
           		</select>
       		</td>
	     </tr>   
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Transacción para Extracto DB : </td>
			<td  nowrap width=40% align="left">
				<INPUT type="text" name="E01ITSEXD" maxlength="5" size="6" <%=read%> value="<%= msgRcd.getE01ITSEXD().trim()%>" onkeypress="enterInteger(event)" <%=read%>>
      	</td>
            <td nowrap width=10% align="right">Transacción para Extracto CR : </td>
            <td  nowrap width=40% align="left">
            	<INPUT type="text" name="E01ITSEXC" maxlength="5" size="6" <%=read%> value="<%= msgRcd.getE01ITSEXC().trim()%>" onkeypress="enterInteger(event)" <%=read%>>
       		</td>
	    </tr>   
        <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right"></td>
			<td  nowrap width=40% align="left">
			</td>
            <td nowrap width=10% align="right">Estado : </td>
            <td  nowrap width=40% align="left">
            	<select name="E01ITSEST" <%=disabled%>>
          		<option value="A" <% if (msgRcd.getE01ITSEST().equals("A")) out.print("selected"); %> >ACTIVA</option>
               	<option value="I" <% if (msgRcd.getE01ITSEST().equals("I")) out.print("selected"); %>>INACTIVA</option>
           		</select><%=mandatory %>
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
            	<%= msgRcd.getE01ITSCUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE01ITSMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01ITSCDM()),Integer.parseInt(msgRcd.getE01ITSCDD()),Integer.parseInt(msgRcd.getE01ITSCDY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE01ITSRDM()),Integer.parseInt(msgRcd.getE01ITSRDD()),Integer.parseInt(msgRcd.getE01ITSRDY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE01ITSCTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE01ITSMTM()%>
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
