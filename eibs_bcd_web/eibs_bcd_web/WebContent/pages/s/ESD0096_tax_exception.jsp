<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<%@ page import="java.io.*,java.net.*,datapro.eibs.beans.*,datapro.eibs.master.*,java.math.*"%>

<html>
<head>
<title>Excepcion de Impuestos</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/jquery/plugins/contextMenu/css/jquery.contextMenu.css" rel="stylesheet" type="text/css" />

<jsp:useBean id="Taxes" class="datapro.eibs.beans.ESD009602Message" scope="session" /> 
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>
<SCRIPT type="text/javascript">

<%
 	boolean isApprovalInquiry = userPO.getPurpose().equals("APPROVAL");
 	boolean isInquiry = userPO.getPurpose().equals("INQUIRY");
 	boolean isReadOnly = isApprovalInquiry || isInquiry;
 	boolean isReadOnlyMnt = false;
 	String read = "";
	String readMnt = "";
 	String disabled = "";
 	String disabledMnt = "";
 	String mandatory = "<img src=\"" + request.getContextPath() + "/images/Check.gif\" alt=\"campo obligatorio\" align=\"bottom\" border=\"0\" >";
 	
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) 
		{ read = " readonly ";
		  disabled = " disabled";
		}
		
	if (!(userPO.getPurpose().equals("NEW"))) 
		{ readMnt = " readonly ";
		  disabledMnt = " disabled";
		  isReadOnlyMnt = true;
		}
		
%>

function goAction(op) {
	document.forms[0].SCREEN.value = op;
	if (op == 8) {
		if (!confirm("Desea borrar este registro?")) {
			return;
		}
	}
	submitForm();
}

function combo(t){		
  document.getElementById("mosA").style.display = "block";
  document.getElementById("mosB").style.display = "none";
  if(t == "B"){
  	document.getElementById("mosA").style.display = "none";
  	document.getElementById("mosB").style.display = "block";
  }
}	

</SCRIPT>  

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
    out.println("<SCRIPT> initMenu(); </SCRIPT>");
    
%>

<H3 align="center">Exenciones de Impuestos<img
	src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left"
	name="EIBS_GIF" title="tax_exception.jsp, ESD0096"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.taxes.JSESD0096" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E02CUSCUN" VALUE="<%= Taxes.getE02CUSCUN().trim()%>">


 <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" class="tbhead" bgcolor="#FFFFFF" bordercolor="#FFFFFF" align="center">
            <tr id="trdark"> 
               <td nowrap width="10%" align="right"><b>Cliente :</b></td>
               <td nowrap width="30%" align="left">
                     <input type="text" name="E02CUSCUN" size="9" maxlength="9" readonly value="<%= Taxes.getE02CUSCUN().trim()%>">
               </td>
               <td nowrap width="10%" align="left"></td>
               <td nowrap width="10%" align="left"></td>
               <td nowrap width="10%" align="right"><b>Nombre :</b></td>
               <td nowrap width="30%" align="left">
                     <font face="Arial">
                        <font size="2">
                           <input type="text" name="E02CUSNA1" size="45" maxlength="45" readonly value="<%= Taxes.getE02CUSNA1().trim()%>">
                        </font>
                     </font>
               </td>
            </tr>
            <tr id="trclear"> 
               <td nowrap width="15%" align="right"><b>Tipo Legal :</b>
               </td>
               <td nowrap width="25%" align="left">
                     <input type="text" name="D02CUSLGT" size="45" maxlength="45" readonly value="<%= Taxes.getD02CUSLGT().trim()%>">
               </td>
               <td nowrap width="10%" align="right"></td>
               <td nowrap width="10%" align="left">
               </td>
               <td nowrap width="15%" align="right"><b>Estado : </b></td>
               <td nowrap width="25%" align="left">
               	<b><input type="text" name="D02CUSSTS" size="45" maxlength="45" readonly value="<%= Taxes.getD02CUSSTS().trim()%>"></b>
               </td>
            </tr>
            <tr id="trdark"> 
               <td nowrap width="15%" align="right"><b>ID :</b></td>
               <td nowrap width="25%" align="left">
           	         <b><%=Taxes.getE02CUSPID().trim()%> - <%=Taxes.getE02CUSTID().trim()%> - <%= Taxes.getE02CUSIDN().trim()%></b> 
               </td>
               <td nowrap width="10%" align="right"></td>
               <td nowrap width="10%" align="left">
               </td>
               <td nowrap width="15%" align="right"></td>
               <td nowrap width="25%" align="left">
               </td>
            </tr>
        </table>
	</td>
  </tr>
</table>  

  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
		<tr id="trdark"> 
            <td nowrap width="10%" align="right">Tipo de Impuesto :</td>
            <td nowrap width="40%" align="left"> 
				<select name="E02TXETYP" id="E02TXETYP" <%= disabledMnt %> onchange="combo(this.value);" >
			           <option value=" " <% if (!(Taxes.getE02TXETYP().equals("I") || Taxes.getE02TXETYP().equals("G") || 
			             Taxes.getE02TXETYP().equals("C") || Taxes.getE02TXETYP().equals("R") || Taxes.getE02TXETYP().equals("E") || 
			             Taxes.getE02TXETYP().equals("T") || Taxes.getE02TXETYP().equals("B"))) out.print("selected"); %>>
 						<option value="I" <%if (Taxes.getE02TXETYP().equals("I")) out.print("selected"); %>>IVA</option>
						<option value="G" <%if (Taxes.getE02TXETYP().equals("G")) out.print("selected"); %>>GMF</option>
						<option value="C" <%if (Taxes.getE02TXETYP().equals("C")) out.print("selected"); %>>Retención ICA</option>
						<option value="R" <%if (Taxes.getE02TXETYP().equals("R")) out.print("selected"); %>>Retención Renta</option>
						<option value="E" <%if (Taxes.getE02TXETYP().equals("E")) out.print("selected"); %>>Retención IVA</option>
						<option value="T" <%if (Taxes.getE02TXETYP().equals("T")) out.print("selected"); %>>Timbre</option>
						<option value="B" <%if (Taxes.getE02TXETYP().equals("B")) out.print("selected"); %>>Timbre Por Cargos</option>
					</select>
					<%=mandatory%>
			</td>
            <td nowrap width="10%" align="right"></td>
			<td nowrap width="40%" align="left">
			</td>
		</tr>
		<tr id="trclear"> 	
            <td nowrap width="10%" align="right">Tipo de Producto : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:cnofc property="E02TXEATY" name="Taxes" flag="04" fn_code="E02TXEATY" readonly="<%=isReadOnlyMnt%>" />
				<% if (!isReadOnlyMnt) {%>
				<a href="javascript:GetApplicationCode('E02TXEATY')">
              	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Código de Aplicación" align="bottom" border="0">
				</a>
				<%}%>
              	(Blanco = Todos)
			</td>
			<td nowrap width="10%" align="right">Cuenta / Contracto : </td>
			<td nowrap width="40%" align="left">
               	<input type="text" name="E02TXEACC" size="15" maxlength="12" value="<%= Taxes.getE02TXEACC().trim()%>" onKeypress="enterInteger(event)" <%=readMnt%>>
               	<% if (!isReadOnlyMnt) {%>
                <a href="javascript:GetAccountCustomer('E02TXEACC','','','',document.forms[0].E02CUSCUN.value)">
                <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="middle" border="0"  ></a>
                <%} %>
                (0 = Todas)	
			</td>
		</tr>
		
		<tr id="trdark"> 
            <td nowrap width="10%" align="right">Evento :</td>
            <td nowrap width="40%" align="left" > 
 	              <INPUT type="text"  name="E02TXETTP" maxlength="3" size="5" value="<%= Taxes.getE02TXETTP().trim()%>" <%=readMnt %>/>
 	              <%=mandatory %>
 	              <INPUT type="text" name="D02TXETTP" size="47" readonly value="<%= Taxes.getD02TXETTP().trim()%>" />
 	              <div id="mosA" style="display: none;">
 	              	<% if (!isReadOnlyMnt) {%>
            	    <a href="javascript:GetTaxCode('E02TXETTP','D02TXETTP','')">
            	    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Evento" align="bottom" border="0" /></a>
            	    <%} %>
            	  </div>  
            	  <div id="mosB" style="display: none;">
            	  	<% if (!isReadOnlyMnt) {%>
            	    <a href="javascript:GetCommDef('E02TXETTP','D02TXETTP')">
            	    <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda Evento" align="bottom" border="0" /></a>
            	    <%} %>
            	  </div>  
			</td>
            <td nowrap width="10%" align="right">Concepto : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="Taxes" property="E02TXEDSC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_NARRATIVE %>" required="false" readonly="<%=isReadOnly %>" modified="F02TXEDSC"/>
			</td>
		</tr>
		
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Tarifa :</td>
            <td nowrap width="40%" align="left">
            	<eibsinput:text name="Taxes" property="E02TXEPRC" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/> 
                <select name="D02TAXEXP"   >
                		<option <%= Taxes.getD02TAXEXP().trim().equals(" ")?"selected":"disabled" %> value=" "></option>    
						<option <%= Taxes.getD02TAXEXP().trim().equals("P")?"selected":"disabled" %> value="P">PORCENTAJE / TASA</option>
						<option <%= Taxes.getD02TAXEXP().trim().equals("A")?"selected":"disabled" %> value="A">MONTO</option>
						<option <%= Taxes.getD02TAXEXP().trim().equals("U")?"selected":"disabled" %> value="U">UVT</option>
					</select>
			</td>
			
            <td nowrap width="10%" align="right">Base : </td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="Taxes" property="E02TXEBAS" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_RATE %>" required="false" readonly="<%=isReadOnly %>"/>
                <select name="D02TAXTBS"   >
                        <option <%= Taxes.getD02TAXTBS().trim().equals(" ")?"selected":"disabled" %> value=" "></option>                
                        <option <%= Taxes.getD02TAXTBS().trim().equals("A")?"selected":"disabled" %> value="A">MONTO</option>
						<option <%= Taxes.getD02TAXTBS().trim().equals("R")?"selected":"disabled" %> value="R">PORCENTAJE / TASA</option>
						<option <%= Taxes.getD02TAXTBS().trim().equals("U")?"selected":"disabled" %> value="U">UVT</option>
						<option <%= Taxes.getD02TAXTBS().trim().equals("D")?"selected":"disabled" %> value="D">DOCUMENTO</option>
					</select>

			</td>
		</tr>	
		<tr id="trdark"> 
            <td nowrap width="10%" align="right">Norma :</td>
            <td nowrap width="40%" align="left"> 
				<eibsinput:cnofc name="Taxes" property="E02TXETYE" value="<%=Taxes.getE02TXETYE()%>" required="true" flag="NI" fn_code="E02TXETYE" fn_description="D02TXETYE" readonly="<%=isReadOnly%>" />
				<input TYPE="text" NAME="D02TXETYE" value="<%=Taxes.getD02TXETYE()%>" readonly> 
			</td>
            <td nowrap width="10%" align="right">Valor Fijo :</td>
			<td nowrap width="40%" align="left">
				<eibsinput:text name="Taxes" property="E02TXEFIX" eibsType="<%= EibsFields.EIBS_FIELD_TYPE_DECIMAL %>" required="false" readonly="<%=isReadOnly %>"/>
			</td>
		</tr>
		<tr id="trclear"> 
            <td nowrap width="10%" align="right">Fecha Inicial :</td>
            <td nowrap width="40%" align="left">
            	<eibsinput:date name="Taxes" fn_year="E02TXECUY" fn_month="E02TXECUM" fn_day="E02TXECUD" required="true" readonly="<%=isReadOnly %>" modified="F01TXECUY"/> 
			</td>
            <td nowrap width="10%" align="right">Fecha Final :</td>
			<td nowrap width="40%" align="left">
				<eibsinput:date name="Taxes" fn_year="E02TXEMUY" fn_month="E02TXEMUM" fn_day="E02TXEMUD" required="true" readonly="<%=isReadOnly %>" modified="F01TXEMUY"/>
			</td>
		</tr>
       </table>
      </td>
    </tr>
  </table>

   <br> 

	<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolor="#FFFFFF">
    	<tr bgcolor="#FFFFFF"> 
      		<td width="33%" align="center"><input type="checkbox" name="H01FLGWK2" value="1" >Aceptar con Avisos</td>
    	</tr>
  	</table>    
    <table width="100%">		
  	<tr>
  	<% if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))  { %>
  		<td width="50%">
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(4);" >
     	  </div>	
  		</td>
  		<td width="50%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(2);">
  		</td>
	<% } %>
  	<% if (userPO.getPurpose().equals("DELETE")) { %>
  		<td width="50%"> 
  		  <div align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(8);" >
     	  </div>	
  		</td>
  		<td width="50%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(2);">
  		</td>
	<% } %>
  	<% if (!userPO.getPurpose().equals("DELETE") && !userPO.getPurpose().equals("NEW") && !userPO.getPurpose().equals("MAINTENANCE")) { %>
 		<td width="100%" align="center"> 
     		<input id="EIBSBTN" type=submit name="Exit" value="Salir"  onClick="goAction(2);"> 
  		</td>
	<% } %>
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
            	<%= Taxes.getE02TXECUS()%>
			</td>
            <td nowrap width="15%" align="right">Usuario último Cambio : </td>
            <td nowrap width="35%" align="left">
            	<%= Taxes.getE02TXELUS()%>
            </td>
          </tr>
          <tr id="trclear"> 
            <td nowrap width="15%" align="right">Fecha de Proceso - Creación : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(Taxes.getE02TXECRM()),Integer.parseInt(Taxes.getE02TXECRD()),Integer.parseInt(Taxes.getE02TXECRY()))%>
            </td>
            <td nowrap width="15%" align="right">Fecha de Proceso - Cambio : </td>
			<td nowrap width="35%" align="left">
                <%= datapro.eibs.master.Util.formatCustomDate(currUser.getE01DTF(),Integer.parseInt(Taxes.getE02TXELTM()),Integer.parseInt(Taxes.getE02TXELTD()),Integer.parseInt(Taxes.getE02TXELTY()))%>
            </td>
          </tr>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right">Fecha / Hora - Creación : </td>
			<td nowrap width="35%" align="left">
				<%= Taxes.getE02TXECTS()%>
            </td>
            <td nowrap width="15%" align="right">Fecha / Hora - Cambio : </td>
			<td nowrap width="35%" align="left"> 
            	<%= Taxes.getE02TXELTS()%>
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  </form>
</body>

<SCRIPT "Javascript">

  combo('<%=Taxes.getE02TXETYP()%>');
  
</SCRIPT>
<% if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) {%>
<script src="<%=request.getContextPath()%>/jquery/readOnlyPage.jsp"> </script>
<% } %>
<script src="<%=request.getContextPath()%>/jquery/markChangedFields.jsp?MSGOBJ=Taxes"> </script>
</html>
