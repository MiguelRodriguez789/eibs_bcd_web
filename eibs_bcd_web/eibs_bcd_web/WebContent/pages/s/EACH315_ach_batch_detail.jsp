<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html> 
<head>
<title>ACH Batch Header</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

</head>

<jsp:useBean id="EACH315Record" class="datapro.eibs.beans.EACH31501Message"  scope="session" />
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

function showOfac(fieldValue){
	page = "<%=request.getContextPath()%>/servlet/datapro.eibs.helps.JSEWD0092?shrAcc=" + fieldValue + "&shrCategory=ALL" + "&FromRecord=0&shrAction=INQ";
	CenterWindow(page,600,500,2);
 }

</SCRIPT>  
 

<% 
    if ( !error.getERRNUM().equals("0")  ) {
        out.println("<SCRIPT Language=\"Javascript\">");
        error.setERRNUM("0");
        out.println("       showErrors()");
        out.println("</SCRIPT>");
    }
	boolean display=false;
    String read = "";
	if (!(userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE"))) read = " readonly ";
%>


<H3 align="center">Transacción <%= EACH315Record.getE01ACUNUM().trim()%> para el Lote ACH Nro. <%= userPO.getIdentifier().trim() %>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="ach_batch_detail.jsp, EACH315"></H3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.ach.JSEACH315" >
  <INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="5">
  <INPUT TYPE=HIDDEN NAME="E01ACUBTH" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="BATCH" VALUE="<%= userPO.getIdentifier().trim()%>">
  <INPUT TYPE=HIDDEN NAME="E01ACUNUM" VALUE="<%= EACH315Record.getE01ACUNUM().trim()%>">
  <INPUT TYPE=HIDDEN NAME="TYPE" VALUE="O">
  <INPUT TYPE=HIDDEN NAME="OPEDSC" VALUE="">
  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
        <tr id="trdark"> 
            <td nowrap width="15%" align="right">Originador : </td>
            <td nowrap width="35%" align="left"> 
                <INPUT type="text" name="E01ACUOCD" value="<%= EACH315Record.getE01ACUOCD().trim()%>" size="11" readonly>
                <INPUT type="text" name="E01OCDDSC" size="40" value="<%= EACH315Record.getE01OCDDSC().trim()%>" readonly>
			</td>
			<td nowrap width="15%" align="right">Clase de Entrada : </td>
            <td nowrap width="35%" align="left"> 
                <INPUT type="text" name="E01ACUECD" size="4"  value="<%= EACH315Record.getE01ACUECD().trim()%>" readonly> 
				<INPUT type="text" name="E01ECDDSC" size="40" value="<%= EACH315Record.getE01ECDDSC().trim()%>" readonly>
			</td>
		</tr>
		<tr id="trdark">	
            <TD nowrap width="15%" align="right">Fecha Efectiva : </TD>
            <TD nowrap width="35%" align="left">
				<%if (read== "") { %>
		 		<eibsinput:date name="EACH315Record" fn_month="E01ACUVDM" fn_day="E01ACUVDD" fn_year="E01ACUVDY" />
		 		<%} else {%>
		 		<eibsinput:date name="EACH315Record" fn_month="E01ACUVDM" fn_day="E01ACUVDD" fn_year="E01ACUVDY" readonly="TRUE"/>
            	<%}%>
            </TD>
			<td nowrap width="15%" align="right"></td>
            <td nowrap width="35%" align="left"> 
			</td>
		</tr>
        </table>
      </td>
    </tr>
  </table>

  <h4>Información Básica</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        	<tr id="trdark"> 
            <TD nowrap width="15%" align="right">Transacción ACH : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUCDE" size="3"  maxlength="2" value="<%= EACH315Record.getE01ACUCDE().trim()%>" <%= read %>>
				<INPUT type="text" name="E01CDEDSC" value="<%= EACH315Record.getE01CDEDSC().trim()%>" size="35" readonly>
				<A href="javascript:GetAchTransaction('E01ACUCDE','E01CDEDSC')"> 
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" align="bottom" border="0">
				</A>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom">
			</TD>
			<TD nowrap width="15%" align="right">Entidad Externa : </TD>
			<TD nowrap align="left" width="35%">
				<INPUT type="text" name="E01ACUROU" size="11" maxlength="10" value="<%= EACH315Record.getE01ACUROU().trim()%>" <%= read %>>
				<A href="javascript:GetAchOperator('E01ACUROU','TYPE','OPEDSC','D')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0" align="top">
				</A>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom">
			</TD>
			</TR>
			<TR id="trclear">
				<TD nowrap width="15%" align="right">Monto : </TD>
				<TD nowrap width="35%" align="left">
					<INPUT type="text" name="E01ACUAMT" size="16" maxlength="15" value="<%= EACH315Record.getE01ACUAMT().trim()%>" onkeypress="enterDecimal()" <%= read %>> 	
				 	<INPUT type="text" name="E01ACUCCY" size="4" maxlength="3" value="<%= EACH315Record.getE01ACUCCY().trim()%>" readonly> 	
					<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom">
				</TD>
				
				<TD nowrap width="15%" align="right">Referencia : </TD>
				<TD nowrap width="35%" align="left">
					<INPUT type="text" name="E01ACUIDN" size="16" maxlength="15" value="<%= EACH315Record.getE01ACUIDN().trim()%>" <%= read %>> 
				</TD>
			</TR>
          <tr id="trdark"> 
            <td nowrap width="15%" align="right"> Adenda : </td>
			<td nowrap width="35%" align="left" colspan="3">
				<INPUT type="text" name="E01ACUADD" size="40" maxlength="80" value="<%= EACH315Record.getE01ACUADD().trim()%>" <%= read %>> 
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>

  <h4>Participantes</h4>  
  <table  class="tableinfo" width="100%">
    <tr bordercolor="#FFFFFF"> 
      <td nowrap> 
        <table cellspacing="0" cellpadding="2" width="100%" border="0">
        <%int row=1;%>
      	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap colspan="2" align="center"> 
                <b>Originador</b>&nbsp;
            </td>
            <td nowrap colspan="2" align="center">  
                <b>Beneficiario</b>&nbsp;
            </td>
		</tr>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            	<td nowrap width="15%" align="right"> </td>
            	<td nowrap align="left" width="35%" valign="bottom"> Banco / Oficina / Cuenta </td>
            	<TD nowrap width="15%" align="right"></TD>
				<TD nowrap width="35%" align="left"></TD>
			</tr>
        	<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
        		<td nowrap width="15%" align="right">Cuenta Interna : </td>
				<td nowrap align="left" width="35%">
					<input type="text" name="E01ACUBNK" size="3" maxlength="2" onKeypress="enterInteger(event)" value="<%= EACH315Record.getE01ACUBNK().trim()%>" <%= read %>>/
					<input type="text" name="E01ACUBRN" size="5" maxlength="4" onKeypress="enterInteger(event)" value="<%= EACH315Record.getE01ACUBRN().trim()%>" <%= read %>>
						<a href="javascript:GetBranch('E01ACUBRN',document.forms[0].E01ACUBNK.value)">
						<img src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0"  ></a>/
						<INPUT type="text" name="E01ACUACC" size="17"  maxlength="16" value="<%= EACH315Record.getE01ACUACC().trim()%>" <%= read %>>
						<A href="javascript:GetAccountInfo('E01ACUACC','','RT','', '', '', '', '', '')">
							<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Cuenta de Detalle" align="bottom" border="0">
						</A>	
						<A href="javascript:GetLedger('E01ACUACC',document.forms[0].E01ACUBNK.value,'','')">
							<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Cuenta Contable" border="0" align="top">
						</A>
						<a href="javascript:GetAccount('E01ACUACC','','97','')">
							<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Remanente" border="0" align="top">
						</A>
						<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom">
						
						<%-- 			
						<input type="text" name="E01ACUCCN" size="10" maxlength="8" value="<%= EACH315Record.getE01ACUCCN().trim()%>" <%= read %>>
						<a href="javascript:GetCostCenter('E01ACUCCN','')"><img src="${pageContext.request.contextPath}/images/1b.gif" alt="help" align="middle" border="0" ></a>
						--%>
				</td>
			<TD nowrap width="15%" align="right">Cuenta Externa : </TD>
			<TD nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUDAC" size="21" maxlength="20" value="<%= EACH315Record.getE01ACUDAC().trim()%>" <%= read %>> 
				<SELECT name="E01ACUACT">
					<OPTION <%= EACH315Record.getE01ACUACT().trim().equals("C")?"Selected":"" %> value="C">Corriente</OPTION>
					<OPTION <%= EACH315Record.getE01ACUACT().trim().equals("S")?"Selected":"" %> value="S">Ahorros</OPTION>
					<OPTION <%= EACH315Record.getE01ACUACT().trim().equals("L")?"Selected":"" %> value="L">Prestamos</OPTION>
					<OPTION <%= EACH315Record.getE01ACUACT().trim().equals("R")?"Selected":"" %> value="R">Tarjetas Crédito</OPTION>
				</SELECT> 
				<A href="javascript:GetExternalAccountACH('E01ACUNME', 'E01ACUADR', 'E01ACUCSZ', 'E01ACUEMA', 'E01ACUROU', 'E01ACUDAC', 'E01ACUACT','0')">
					<IMG src="<%=request.getContextPath()%>/images/1b.gif" alt="Ayuda" border="0" align="top">
				</A>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom">
			</TD>
			</tr>
		  <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
				<td nowrap width="15%" align="right">Nombre Cuenta: </td>
				<td nowrap align="left" width="35%">
					<INPUT type="text" name="E01CUNDSC" value="<%= EACH315Record.getE01CUNDSC().trim()%>" size="38" readonly>
				</td>
            <td nowrap width="15%" align="right">Nombre : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUNME" size="46" maxlength="45" value="<%= EACH315Record.getE01ACUNME().trim()%>" <%= read %>> 
				<% if (EACH315Record.getH01FLGWK3().trim().equals("3")) { %>
					<IMG border="0" src="<%=request.getContextPath()%>/images/warning_16.jpg" ALT="OFAC Match List" onClick="showOfac('<%= EACH315Record.getE01ACUNUM()%>')">
				<% } %>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom">
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"><%if(currUser.getE01INT().equals("07")){%> Nombre Originador Real<% }%></td>
			<td nowrap width="35%" align="left">
			   <%if(currUser.getE01INT().equals("07")){%>
			    <INPUT type="text" name="E01ACUORN" size="20" maxlength="16" value="<%= EACH315Record.getE01ACUORN().trim()%>" <%= read %>>
			   <% }%>
			</td>
            <td nowrap width="15%" align="right">Dirección :  </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUADR" size="46" maxlength="45" value="<%= EACH315Record.getE01ACUADR().trim()%>" <%= read %>> 
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom">
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"><%if(currUser.getE01INT().equals("07")){%> Identificacion<% }%></td>
			<td nowrap width="35%" align="left">
			   <%if(currUser.getE01INT().equals("07")){%>
			    <INPUT type="text" name="E01ACUORI" size="25" maxlength="20" value="<%= EACH315Record.getE01ACUORI().trim()%>" <%= read %>>
			   <% }%>
			</td>			
            <td nowrap width="15%" align="right">Identificacion : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUCSZ" size="46" maxlength="45" value="<%= EACH315Record.getE01ACUCSZ().trim()%>" <%= read %>>
				<IMG src="<%=request.getContextPath()%>/images/Check.gif" alt="Campo Obligatorio" align="bottom">
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"><%if(currUser.getE01INT().equals("07")){%> Pais<% }%></td>
			<td nowrap width="35%" align="left">
			   <%if(currUser.getE01INT().equals("07")){%>
			    <INPUT type="text" name="E01ACUORC" size="6" maxlength="4" value="<%= EACH315Record.getE01ACUORC().trim()%>" <%= read %>>
                    <a href="javascript:Get2FilterCodes('E01ACUORC','','03',' ','')">
					<img src="<%=request.getContextPath()%>/images/1b.gif" alt="ayuda" align="bottom" border="0">
					</a>
			   <% }%>
			
			</td>
            <td nowrap width="15%" align="right">Correo Eléctronico : </td>
			<td nowrap width="35%" align="left">
				<INPUT type="text" name="E01ACUEMA" size="61" maxlength="60" value="<%= EACH315Record.getE01ACUEMA().trim()%>" <%= read %>> 
			</td>
          </tr>
          <tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
            <td nowrap width="15%" align="right"><%if(currUser.getE01INT().equals("05")){%> Cobrar GMF de Cliente/Debitos para Ctas Ctes y Aho<% }%></td>
			<td nowrap width="35%" align="left">
			   <%if(currUser.getE01INT().equals("05")){%>
			    <input type="radio" name="E01ACUGMF" value="Y" <%if (EACH315Record.getE01ACUGMF().equals("Y")) out.print("checked"); %>>
                Si 
                <input type="radio" name="E01ACUGMF" value="N" <%if (EACH315Record.getE01ACUGMF().equals("N")) out.print("checked"); %>>
                No
			   <% }%>
			
			</td>
            <td nowrap width="15%" align="right"></td>
			<td nowrap width="35%" align="left">
			</td>
          </tr>
        </table> 
      </td>  
    </tr>
  </table>
  <p>
  <table width="100%" style="background-color: white;">		
<% 
 if (userPO.getPurpose().equals("NEW") || userPO.getPurpose().equals("MAINTENANCE")){
	if (EACH315Record.getH01FLGWK2().trim().equals("W") || EACH315Record.getH01FLGWK2().trim().equals("A") ){%>
	<tr>
		<td width="100%" align="center" colspan="3">
			<input type="checkbox" name="H01FLGWK2" value="A" <% if (EACH315Record.getH01FLGWK2().trim().equals("A")) out.print(" checked"); %>>
			Aceptar con Advertencias
		</td>
	</tr>
	<% } %>
  	<tr>
  		<td width="33%" align="center">
  			<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction(5);">
     	 </td>
  		<td width="33%" align="center"> 
     		<input id="EIBSBTN" type=button name="Delete" value="Borrar" onClick="goAction(4);"
			<% if (userPO.getPurpose().equals("NEW")) out.print(" disabled"); %>>
  		</td>
  		<td width="34%" align="center">
     		<input id="EIBSBTN" type=button name="Submit" value="Salir" onClick="goAction(1);">
  		</td>
  	</tr>	
<% } else { %>
  	<tr>
  		<td width="100%" align="center">
     		<input id="EIBSBTN" type=submit name="Submit" value="Salir" onClick="goAction(1);">
  		</td>
  	</tr>	

<% } %>
  </table>	

  </form>
</body>
</html>
