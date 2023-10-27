<%@taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@page import="com.datapro.eibs.constants.HelpTypes"%>
<%@page import="com.datapro.constants.EibsFields"%>
<%@page import = "datapro.eibs.master.Util" %>

<html>
<head>
<title> Cupo Rotativo Basic Information for Desmbolso</title>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-1">
<link Href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="RecData" class="datapro.eibs.beans.EPV015405Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session" />
<jsp:useBean id="currUser" class="datapro.eibs.beans.ESS0030DSMessage" scope="session" />

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </script>

<script type="text/javascript">

function goAction(op) {
	getElement("SCREEN").value = op;
	document.forms[0].submit();
}
 
function mathOperation(){
	var ans = document.forms[0].E05NEWAMT;
	if (document.forms[0].E05INCDEC.value == 'I' )
		ans.value= formatCCY(String(calculate('ADD')));
	else 
		ans.value= formatCCY(String(calculate('SUBTRACT')));
}
 
function calculate(action){
	var num1 = document.forms[0].E05CUPBAL.value ;
	var num2 = document.forms[0].E05IODAMT.value ;
	var result;
	switch(action){
		case 'ADD':
			result= parseFloat(num1.replace(/,/g, "")) + parseFloat(num2.replace(/,/g, ""));
			break;
		case 'SUBTRACT':
			result=parseFloat(num1.replace(/,/g, "")) - parseFloat(num2.replace(/,/g, ""));
			break;
		}
		return result;
}
 
</script>
</head>
					
<body >
<%
	if (!error.getERRNUM().equals("0")) {
		error.setERRNUM("0");
		out.println("<SCRIPT Language=\"Javascript\">");
		out.println("       showErrors()");
		out.println("</SCRIPT>");
	}
%>

<%	
	boolean readOnly=false;
	if (request.getParameter("readOnly") != null ){
		if (request.getParameter("readOnly").toLowerCase().equals("true")){
			readOnly=true;
		} else {
			readOnly=false;
		}
	}	
 %>


<h3 align="center"> Aumento/Disminucion - L&iacute;nea Cr&eacute;dito:  <%=RecData.getE05DSCPRO()%>
	<img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="crotat_incre_info.jsp, EPV0154">
</h3>
<hr size="4">
<form method="post" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0154DADC" >
	<INPUT TYPE=HIDDEN NAME="SCREEN" VALUE="225">

	<%int row = 0; %>
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellspacing="0" cellpadding="2" width="100%" border="0" class="tbhead">
					<tr id="trdark">
						<td nowrap width="15%" ><div align="right"><b>Cliente :</b></div></td>
						<td nowrap width="10%" > 
							<div align="left">
								<eibsinput:text property="E05DEACUN" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CUSTOMER %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%" ><div align="right"><b>Nombre :</b> </div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E05CUSNA1" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_NAME %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Tipo : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E05DEATYP" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
					<tr id="trdark">
						<td nowrap width="15%"><div align="right"><b>Cuenta :</b></div></td>
						<td nowrap width="10%"> 
							<div align="left"> 
								<eibsinput:text property="E05DEAACC" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_ACCOUNT%>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Moneda : </b></div></td>
						<td nowrap width="35%"> 
							<div align="left">
								<eibsinput:text property="E05DEACCY" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_CURRENCY %>" readonly="true"/>
							</div>
						</td>
						<td nowrap width="10%"><div align="right"><b>Producto : </b></div></td>
						<td nowrap width="20%"> 
							<div align="left">
								<eibsinput:text property="E05DEAPRO" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_PRODUCT %>" readonly="true"/>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<h4>Datos B&aacute;sicos de la Operaci&oacute;n </h4>
	<%row++;%>    
	<table class="tableinfo" >
		<tr > 
			<td nowrap> 
				<table cellpadding=2 cellspacing=0 width="100%" border="0">
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="40%"><div align="right">Monto de la L&iacute;nea :</div></td>
						<td nowrap width="60%"> 
							<eibsinput:text property="E05CUPAMT" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="40%"><div align="right">Monto Utilizado :</div></td>
						<td nowrap width="60%"> 
							<eibsinput:text property="E05CUPUSE" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="40%"><div align="right">Saldo Disponible :</div></td>
						<td nowrap width="60%"> 
							<eibsinput:text property="E05CUPBAL" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="40%"> 
							<% if(readOnly) { %>
							<div align="right">            
								<input type="hidden" name="E05INCDEC" value="<%= RecData.getE05INCDEC()%>">
								<input type="radio" name="ACTION" value="I" disabled <%if(RecData.getE05INCDEC().equals("I")) out.print("checked");%> >
								Incremento
								<input type="radio" name="ACTION" value="D" disabled <%if(RecData.getE05INCDEC().equals("D")) out.print("checked");%> >
								Decremento
							</div>
							<%}else{%>
							<div align="right">            
								<input type="hidden" name="E05INCDEC" value="<%= RecData.getE05INCDEC()%>">
								<input type="radio" name="ACTION" value="I" onClick="document.forms[0].E05INCDEC.value='I' ; mathOperation();" <%if(RecData.getE05INCDEC().equals("I")) out.print("checked");%> >
								Incremento
								<input type="radio" name="ACTION" value="D" onClick="document.forms[0].E05INCDEC.value='D' ; mathOperation();" <%if(RecData.getE05INCDEC().equals("D")) out.print("checked");%> >
								Decremento
							</div>
							<%}%>
						</td>
						<td nowrap width="60%"> 
							<eibsinput:text property="E05IODAMT" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="<%=readOnly%>" onchange="mathOperation();" />
						</td>
					</tr>
					<tr id="<%= (row % 2 == 1) ? "trdark" : "trclear" %><%row++;%>">
						<td nowrap width="40%"><div align="right">Nuevo Monto :</div></td>
						<td nowrap width="60%"> 
							<eibsinput:text property="E05NEWAMT" name="RecData" eibsType="<%=EibsFields.EIBS_FIELD_TYPE_AMOUNT%>" readonly="true" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<p></p>	
	<% if(!userPO.getHeader1().equals("APPROVAL")){%>
	<div align="center" style="width:95%"> 
		<input id="EIBSBTN" type=submit name="Submit" value="Enviar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input id="EIBSBTN" type=button name="Cancel" value="Cancelar" onclick="javascript:goAction(125);">
	</div>  
	<%}%> 
 </form>
</body>
</HTML>
