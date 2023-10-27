<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput" %>
<%@ page import = "datapro.eibs.master.Util" %>
<%@ page import="com.datapro.constants.EibsFields"%>
<html>
<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Page Designer V3.5.2 for Windows">
<META http-equiv="Content-Style-Type" content="text/css">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<title>Solicitud de convenio</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>

<script type="text/javascript">

  function getBranch(val){
	alert(val);
	CenterWindow(page,530,530,1);		
 	parent.results.window.location.href="<%=request.getContextPath()%>/pages/s/MISC_search_wait.jsp?URL='<%=request.getContextPath()%>/servlet/com.datapro.eibs.security.servlet.JSBranchProfile?SCREEN=2@BRNBNK=" + val + "'";   
  }

  function mostrar(tipo){
	 //hidden all
  	getElement("bank1").style.visibility="hidden";	 
  	getElement("officer1").style.visibility="hidden";
  	getElement("customer_number1").style.visibility="hidden";
   	getElement("pln_number1").style.visibility="hidden";
   	getElement("cod_conv1").style.visibility="hidden";
  	
  	//show specific
  	getElement(tipo).style.visibility="visible";
  }
  
    function validar(){ 
      	 	 
	 if ((trim(document.forms[0].dddesde.value)!="" || trim(document.forms[0].ddhasta.value)!=""
	  || trim(document.forms[0].mmdesde.value)!="" || trim(document.forms[0].mmhasta.value)!=""
	  || trim(document.forms[0].aadesde.value)!="" || trim(document.forms[0].aahasta.value)!="")
	     ){
	     //al menos uno es distinto de blanco, tengo que obligar a que todos sean distintos de blanco
		 if ((trim(document.forms[0].dddesde.value)!="" & trim(document.forms[0].ddhasta.value)!=""
		  & trim(document.forms[0].mmdesde.value)!="" & trim(document.forms[0].mmhasta.value)!=""
		  & trim(document.forms[0].aadesde.value)!="" & trim(document.forms[0].aahasta.value)!="")
		     ){
			return true;
		}else{
		 	alert('Debe llenar todos los campos fechas para efectuar la busqueda');
		 	return false;			
		}	     
	 }
	 
	 return true;
  }
  

</script>

  
</head>
<body>

<%
	if (!error.getERRNUM().equals("0")) {
		out.println("<script type=\"text/javascript\">");
		error.setERRNUM("0");
		out.println("showErrors()");
		out.println("</script>");
	}
%>

<h3 align="center">Busqueda Planillas de Convenio<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="covenant_search.jsp, ECO0160"></h3>
<hr size="4">
<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.client.JSECO0160" onsubmit="return validar();">
<input type="hidden" name="SCREEN" value="200">
<table id="TBHELPN" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
		<td align="center" width="100%" colspan="2" >
		<table id="TBHELPN">
			<tr>
				<td align="left" width="10%">&nbsp;</td>
				<td align="left" width="50%" nowrap >&nbsp;&nbsp;&nbsp;&nbsp;<input checked="checked"
					type="radio" name="Type" value="B" onclick="javascript:mostrar('bank1')">Banco/Sucursal </td>
				<td align="left" width="10%">&nbsp;</td>
				<td width="30%" rowspan="5">
					<div id="bank1"  style="visibility='visible'">
						<input type="text" name="bank" size="4" maxlength="3" value="">
						<input type="text" name="branch" size="5" maxlength="4" value="">
					<a href="javascript:GetBranch('branch','')"> <img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"></a>					
					</div>
					<div id="officer1" style="visibility='hidden'">
						<input type="text" name="officer" size="5" maxlength="4" value=""> 
						<a	href="javascript:GetCodeCNOFC('officer','15')"> 
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0">
						</a> 
					</div>
					<div id="customer_number1" style="visibility='hidden'">
						<input type="text" name="customer_number" size="10" maxlength="9">
						<a href="javascript: GetCustomerDescId('customer_number', '', '')">
							<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" border="0"> 
						</a> 
					</div>
					<div id="pln_number1" style="visibility='hidden'">
						<input type="text" name="pln_number" size="13" maxlength="12" onkeypress="enterInteger(event);"> 
					</div>
					<div id="cod_conv1" style="visibility='hidden'"> 
						<input type="text" name="cod_conv" size="5" maxlength="4" value="">
			            <a href="javascript:GetCodeDescDeal('cod_conv','')">
			            	<img src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" >
			            </a> 
		            </div>
				</td>				
			</tr>
			<tr>
				<td align="left" >&nbsp;</td>
				<td align="left" nowrap>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Type" value="O" onclick="javascript:mostrar('officer1')">Código de Oficial
				</td>
				<td align="left" >&nbsp;</td>				
			</tr>
			<tr>
				<td align="left" width="10%">&nbsp;</td>
				<td align="left"  nowrap>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Type" value="E" onclick="javascript:mostrar('customer_number1');">Numero del Empleador
				</td>
				<td align="left" width="10%">&nbsp;</td>
				</tr>
		
			<tr>
				<td align="left" width="10%">&nbsp;</td>
				<td align="left" nowrap>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Type" value="P" onclick="javascript:mostrar('pln_number1');">Numero de Planilla
				</td>
				<td align="left" width="10%">&nbsp;</td>
				</tr>
	
			<tr>
				<td align="left" width="10%">&nbsp;</td>
				<td align="left"  nowrap>
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="Type" value="C" onclick="mostrar('cod_conv1');">Codigo  Convenio
				</td>
				<td align="left" width="10%">&nbsp;</td>
			</tr>	
		</table>
		</td>
	</tr>
	
	<tr><td height="40" colspan="2">&nbsp;</td></tr>
	
	<tr>
		<td align="center" width="100%" colspan="2" >
			<table id="TBHELPN" border="0">
				<tr>
					<td align="right" nowrap >Emitidas Desde :		
					<eibsinput:date fn_year="aadesde" fn_month="mmdesde" fn_day="dddesde" />
 					&nbsp; Hasta : &nbsp;			
					<eibsinput:date fn_year="aahasta" fn_month="mmhasta" fn_day="ddhasta" />
					</td>	
				</tr>
				<tr >
					<td align="left" nowrap >Estado Planilla: &nbsp;&nbsp;		
						<select name="estado_pln" >
		                    <option value=" "></option>
		                    <option value="E" <%="E".equals(request.getAttribute("estado_pln1"))?"selected":"" %> >Emitida</option>
		                    <option value="R" <%="R".equals(request.getAttribute("estado_pln1"))?"selected":"" %> >Pago Recibido</option>                   
		                    <option value="C" <%="C".equals(request.getAttribute("estado_pln1"))?"selected":"" %> >Proceso Cuadre</option>                   
		                    <option value="P" <%="P".equals(request.getAttribute("estado_pln1"))?"selected":"" %> >Aplicada Parcial</option>                   
		                    <option value="T" <%="T".equals(request.getAttribute("estado_pln1"))?"selected":"" %> >Aplicada Total</option>                   
		                  </select>				
					</td>	
					<td align="left" nowrap > &nbsp;</td>				
					<td align="left" nowrap  >&nbsp;</td>					
				</tr>			
			</table>		
		</td>
	</tr>
	
	<tr><td height="40" colspan="2">&nbsp;</td></tr>	
	<tr align="center" >
		<td nowrap colspan="2" align="center">
		<div id="DIVSUBMIT" align="center"><input id="EIBSBTN" type="submit"
			name="Submit" value="Enviar"></div>
		</td>
	</tr>
</table>

</form>
</body>
</html>
