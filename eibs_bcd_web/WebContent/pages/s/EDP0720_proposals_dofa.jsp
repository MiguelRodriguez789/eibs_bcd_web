<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>
Otros Comentarios
</TITLE>

<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msgL0724" class="datapro.eibs.beans.EDP072401Message"  scope="session" />
<jsp:useBean id="bComments" class="datapro.eibs.beans.JBCreditProposalComm"  scope="session" />

<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </SCRIPT>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

</HEAD>


<script type="text/javascript">
function init()
{
 // texto comentarios 
 if (document.forms[0].E01DPAM21 != null) {
	document.forms[0].E01DPAM21.value = '<%=bComments.getNumeroEmpleados().trim().replaceAll("\\r\\n", "' + newChar + '").replaceAll("¶ ", "' + newChar + '")%>';
 }
 if (document.forms[0].E01DPAM22 != null) {
	document.forms[0].E01DPAM22.value = '<%=bComments.getPrestamosVigentes().trim().replaceAll("\\r\\n", "' + newChar + '").replaceAll("¶ ", "' + newChar + '")%>';
 }
 if (document.forms[0].E01DPAM23 != null) {
	document.forms[0].E01DPAM23.value = '<%=bComments.getInstruccionesLegalesCredito().trim().replaceAll("\\r\\n", "' + newChar + '").replaceAll("¶ ", "' + newChar + '")%>';
 }
 if (document.forms[0].E01DPAM24 != null) {
	document.forms[0].E01DPAM24.value = '<%=msgL0724.getE01DPAM24().trim().replaceAll("\\r\\n", "' + newChar + '").replaceAll("¶ ", "' + newChar + '")%>';
 }
 if (document.forms[0].E01DPAM25 != null) {
	document.forms[0].E01DPAM25.value = '<%=msgL0724.getE01DPAM25().trim().replaceAll("\\r\\n", "' + newChar + '").replaceAll("¶ ", "' + newChar + '")%>';
 }
 if (document.forms[0].E01DPAM26 != null) {
	document.forms[0].E01DPAM26.value = '<%=bComments.getComAreaRiesgoCredito().trim().replaceAll("\\r\\n", "' + newChar + '").replaceAll("¶ ", "' + newChar + '")%>';
 }
 if (document.forms[0].E01DPAM27 != null) {
	document.forms[0].E01DPAM27.value = '<%=msgL0724.getE01DPAM27().trim().replaceAll("\\r\\n", "' + newChar + '").replaceAll("¶ ", "' + newChar + '")%>';
 }
}

function limitText(limitField, limitNum) {

	if (limitField.value.length > limitNum + 1) {
			alert('Límite de texto excedido');
	}	
	if (limitField.value.length > limitNum) {
		limitField.value = limitField.value.substring(0, limitNum);
	}
}


function goConfirm() {

	  if (confirm("Esta seguro que desea crear/modificar este registro?")) 
     {
		document.forms[0].SCREEN.value="810";
		document.forms[0].submit();

       }  
}

function closeit() {
	close();
}

</script>
<body onload=javascript:init() onunload="closeit()">


<h3 align="center">
	<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		Otros Comentarios
	<% } else {;%>
		Análisis Financiero - Aspectos Cuantitativos
	<% }%>
		<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="proposals_dofa.jsp, EDP0720"></h3>
<hr size="4">
<FORM Method="post" Action="<%=request.getContextPath()%>/servlet/datapro.eibs.creditproposal.JSEDP0720">
<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="810">
<INPUT TYPE=HIDDEN NAME="ROW" VALUE="">
<INPUT TYPE=HIDDEN NAME="opt" VALUE="<%= msgL0724.getE01DPATIP().trim()%>">

<table class="tableinfo">    
 <TR > 
  <TD NOWRAP >
   <TABLE id="headTable" width="100%" cellpading=0 cellspacing=0>
    <tr id="trdark"> 
      <td align="right"  >
         <b>Cliente :</b>
      </td>
      <td nowrap > 
         <input type="text" name="Header1" size="12" readonly value="<%= userPO.getCusNum()%>">
      </td>
      <td align="right"  >
         <b>Nombre :</b>
      </td>
      <td nowrap colspan=3> 
         <input type="text" name="NAMECUM" size="45" readonly value="<%=userPO.getHeader3()%>">
      </td>         
    </tr> 
    <tr id="trdark"> 
      <td align="right"  >
         <b>Num. Propuesta:</b>
      </td>
      <td nowrap > 
         <input type="text" name="Identifier" size="15" readonly value="<%=userPO.getIdentifier()%>">
      </td>
      <td nowrap > 
      </td>
    </tr>  

  </table> 
 </td>        
 </tr>  
</table>
<TABLE  class="tableinfo"> 
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Número de Empleados
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Indicadores Financieros
			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Solvencia y Liquidez
			</TD>
		</TR>
		<% };%>
		
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM21" rows="10" cols="80" 
		onKeyDown="limitText(this.form.E01DPAM21,850);" onKeyUp="limitText(this.form.E01DPAM21,850);" onchange="limitText(this.value, 850);" 
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		><%= msgL0724.getE01DPAM21().trim()%>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Préstamos Vigentes
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Endeudamiento
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM22" rows="10" cols="80" 
		onKeyDown="limitText(this.form.E01DPAM22,1000);" onKeyUp="limitText(this.form.E01DPAM22,1000);" onchange="limitText(this.value, 1000);"  
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		><%= msgL0724.getE01DPAM22().trim()%>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Instrucciones Legales de Crédito
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Rentabilidad y Cobertura
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM23" rows="10" cols="80" 
		onKeyDown="limitText(this.form.E01DPAM23,2000);" onKeyUp="limitText(this.form.E01DPAM23,2000);" onchange="limitText(this.value, 2000);" 
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		><%= msgL0724.getE01DPAM23().trim()%>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Referencias Bancarias</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Análisis de Flujo de Caja Proyectado
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM24" rows="10" cols="80" 
		onKeyDown="limitText(this.form.E01DPAM24,512);" onKeyUp="limitText(this.form.E01DPAM24,512);" onchange="limitText(this.value, 512);" 
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		><%= msgL0724.getE01DPAM24().trim()%>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Seguros
			</TD>
		</TR>
		<% } else {;%>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Analisis de la Capacidad de Pago
			</TD>
		</TR>
		<% };%>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM25" rows="10" cols="80" 
		onKeyDown="limitText(this.form.E01DPAM25,512);" onKeyUp="limitText(this.form.E01DPAM25,512);" onchange="limitText(this.value, 512);"  
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		><%= msgL0724.getE01DPAM25().trim()%>
		</TEXTAREA>

			</TD>
		</TR>
		<% if(msgL0724.getE01DPATIP().trim().equals("1")){; %>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b>Comentarios y Recomendaciones del Analista de Crédito
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM26" rows="10" cols="80" 
		onKeyDown="limitText(this.form.E01DPAM26,1000);" onKeyUp="limitText(this.form.E01DPAM26,1000);" onchange="limitText(this.value, 1000);" 
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		><%= msgL0724.getE01DPAM26().trim()%>
		</TEXTAREA>

			</TD>
		</TR>
		<TR id=trclear> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
			<b></b> Comentarios de Revisión
			</TD>
		</TR>
		<TR id=trdark> 
			<TD ALIGN=LEFT colspan="3" NOWRAP width="10%"><b></b>
			</TD>
			<TD ALIGN="left" NOWRAP width="60%">
		<TEXTAREA name="E01DPAM27" rows="10" cols="80" 
		onKeyDown="limitText(this.form.E01DPAM27,512);" onKeyUp="limitText(this.form.E01DPAM27,512);" onchange="limitText(this.value, 1000);"  
		<% if(userPO.getHeader16().equals("5")){out.print("readonly");}%>
		><%= msgL0724.getE01DPAM27().trim()%>
		</TEXTAREA>
			</TD>
		</TR>
		<% } else {;%>
			<INPUT TYPE=HIDDEN NAME="E01DPAM26" VALUE="">
			<INPUT TYPE=HIDDEN NAME="E01DPAM27" VALUE="">
		<% };%>

	</TABLE>
  
	<div align="center"> 		
		<% if(!userPO.getHeader16().equals("5")){%> 		
       <input class="EIBSBTN" type="button" name="Submit" value="Enviar" onclick="goConfirm()"> 
	    <% }; %> 
	<INPUT class="EIBSBTN" type="button" name="Cancel" value="Cancelar" onclick="window.close();">
	</div>

</FORM>

</BODY>
</HTML>
