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

<jsp:useBean id="msgRcd" class="datapro.eibs.beans.ECA001002Message"  scope="session" />
<jsp:useBean id= "error" class= "datapro.eibs.beans.ELEERRMessage"  scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>
<jsp:useBean id= "currUser" class= "datapro.eibs.beans.ESS0030DSMessage"  scope="session" />

<body>
 
<script src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>


<script>
<%
	String read = "";
 	String disabled = "";
 	String disablem = "";
 	boolean readOnly = false;
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"Campo Obligatorio\" align=\"bottom\" border=\"0\" >";
 	if (!(userPO.getPurpose().equals("NEW"))) 
		{ read = " readonly ";
		  disabled = " disabled"; 
		  mandatory = "";
		  readOnly = true;
	}	
 	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ disablem = " disabled"; 
	}	

 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isInquiry;
 	String readMnt = (userPO.getPurpose().equals("NEW")?"":" readonly");
 	boolean readMntB = (userPO.getPurpose().equals("NEW")?false:true);
%>


function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 14) {
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
 de Códigos IBS de Error para Transacion NO Exitosa a Cobrar Comisión<br>
 Para Proveedor <%=userPO.getSource()%>  Transaccion Externa <%=userPO.getIdentifier()%>
<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="vendor_transactions_err_detail.jsp, ECA0010"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.interfaces.JSECA0010" >
  <INPUT TYPE=HIDDEN id="E01ITRVND" NAME="E01ITRVND" VALUE="<%=userPO.getSource()%>">
  <INPUT TYPE=HIDDEN id="E01ITRNOE" NAME="E01ITRNOE" VALUE="<%=userPO.getIdentifier()%>">
  <INPUT TYPE=HIDDEN id="E02TREVND" NAME="E02TREVND" VALUE="<%=userPO.getSource()%>">
  <INPUT TYPE=HIDDEN id="E02TRENOE" NAME="E02TRENOE" VALUE="<%=userPO.getIdentifier()%>">
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="15">
  
  <% int row = 0; %>  
  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Error : </td>
            <td nowrap align="left" width="35%">
            	<eibsinput:text name="msgRcd" property="E02TREIBS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_INTEGER %>" size="5" maxlength="4" required="true" readonly="<%=isReadOnly %>" />
            	<INPUT type="text" name="E02TREDSC" size="47" readonly value="<%= msgRcd.getE02TREDSC().trim()%>">
			</td>
			<td nowrap width=10% align="right">Origen :</td>
			<td  nowrap width=40% align="left">
				<select name="E02TREEIN" <%=disabled%>>
          		<option value="I" <% if (msgRcd.getE02TREEIN().equals("I")) out.print("selected"); %> >INTERNO</option> 
               	<option value="E" <% if (!msgRcd.getE02TREEIN().equals("I")) out.print("selected"); %>>EXTERNO</option>
           		</select>
          </td>
          </tr>
          <tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>"> 
            <td nowrap width="15%" align="right">Para Tipos de Cuenta IBS : </td>
            <td nowrap align="left" width="35%">
            	<INPUT type="CHECKBOX" name="E02TREAT1" <%= disablem %> 
				value="Y" <% if (msgRcd.getE02TREAT1().equals("DDA")) out.print(" checked"); %>>Cheques
				<INPUT type="CHECKBOX" name="E02TREAT2" <%= disablem %> 
				value="Y" <% if (msgRcd.getE02TREAT2().equals("SAV")) out.print(" checked"); %>>Ahorros
				<INPUT type="CHECKBOX" name="E02TREAT3" <%= disablem %> 
				value="Y" <% if (msgRcd.getE02TREAT3().equals("LNS")) out.print(" checked"); %>>Préstamos<BR>
				<INPUT type="CHECKBOX" name="E02TREAT4" <%= disablem %> 
				value="Y" <% if (msgRcd.getE02TREAT4().equals("CCR")) out.print(" checked"); %>>Tarjeta CR
				<INPUT type="CHECKBOX" name="E02TREAT5" <%= disablem %> 
				value="Y" <% if (msgRcd.getE02TREAT5().equals("GLN")) out.print(" checked"); %>>Cuenta Contable
			</td>
			<td nowrap width=10% align="right">Estado :</td>
			<td  nowrap width=40% align="left">
				<select name="E02TRESTS" <%=disablem%>>
          		<option value="Y" <% if (msgRcd.getE02TRESTS().equals("Y")) out.print("selected"); %> >ACTIVO</option> 
               	<option value="N" <% if (!msgRcd.getE02TRESTS().equals("Y")) out.print("selected"); %>>INACTIVO</option>
           		</select>
          </td>
	    </tr>
<%--
   	<tr id="<%=(row % 2 == 1) ? "trclear" : "trdark"%><%row++;%>">
			<td nowrap width=10% align="right">Código de Comisión :</td>
			<td nowrap width=40% align="left">
          		<input type="text" name="E02TRECOM" size="5" maxlength="4" value="<%=msgRcd.getE02TRECOM().trim()%>" <%=read%>>
				      <a href="javascript:GetCommission('E02TRECOM','D02TRECOM', ' ')" >
				      <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a>
            	<INPUT type="text" name="D02TRECOM" size="47" readonly value="<%= msgRcd.getD02TRECOM().trim()%>">
			</td>
			<td nowrap width=10% align="right"></td>
			<td  nowrap width=40% align="left">
			</td>
	    </tr>	   
 --%>	    	   
	   </table> 
      </td>  
    </tr>
  </table>
  
    <table width="100%">		
  	<tr>
  		<td width="33%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Submit" value="Enviar" onClick="goAction(15);" <%= disablem %>>
     	  </div>	
  		</td>
  		<td width="33%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Delete" value="Borrar" onClick="goAction(14);" <%= disablem %>>
     	  </div>	
  		</td>
  		<td width="34%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type="button" name="Exit" value="Salir" 
			<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
			    onClick="goAction(11);" 
			<% } else { %>
				onClick="goAction(16);" 
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
            	<%= msgRcd.getE02TRECUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= msgRcd.getE02TREMUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE02TRECMM()),Integer.parseInt(msgRcd.getE02TRECDD()),Integer.parseInt(msgRcd.getE02TRECYY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(msgRcd.getE02TREMMM()),Integer.parseInt(msgRcd.getE02TREMDD()),Integer.parseInt(msgRcd.getE02TREMYY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= msgRcd.getE02TRECTM()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= msgRcd.getE02TREMTM()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  </form>
</body>

	<SCRIPT>
		
	</SCRIPT>


</html>
