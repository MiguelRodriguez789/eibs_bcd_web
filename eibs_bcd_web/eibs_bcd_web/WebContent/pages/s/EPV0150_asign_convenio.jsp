<%@ taglib uri="/WEB-INF/datapro-eibs-input.tld" prefix="eibsinput"%>
<%@ page import="datapro.eibs.master.Util,datapro.eibs.beans.ECO004001Message"%>
<%@page import="com.datapro.constants.EibsFields"%>

<html>
<head>
<title>Asignar Convenios</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%=request.getContextPath()%>/pages/style.css" rel="stylesheet">

<jsp:useBean id="msg" class="datapro.eibs.beans.ECO004001Message"  scope="session" />
<jsp:useBean id="error" class="datapro.eibs.beans.ELEERRMessage" scope="session" />
<jsp:useBean id="userPO" beanName="<%=datapro.eibs.master.USession.getPOSName(request)%>" type="datapro.eibs.beans.UserPos" scope="session"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/eIBS.jsp"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/pages/s/javascripts/optMenu.jsp"> </SCRIPT>

<script type="text/javascript">
var oForm = top.opener.document.forms[0];
var convenioInptNme ;
var convenioInptDsc ;
var convenioInptFl1 ;

function goAction(op) {
	getElement("SCREEN").value = op;
	
	var fieldName = convenioInptNme; 
	var fieldDesc = convenioInptDsc; 
	var fieldAux1 = convenioInptFl1; 
	
	if (oForm[fieldName]) {
		oForm[fieldName].value = getElement("E01CCNCOD").value;	
	}
	
	if (oForm[fieldDesc]) {
		oForm[fieldDesc].value = getElement("E01CCNDSC").value;	
	}	
	
	if (oForm[fieldAux1]) {
		oForm[fieldAux1].value = getElement("E01CCNFL1").value;	
	}	

	if (oForm[fieldName]) {
		triggerOnchangeOpener(fieldName);
	}

	document.forms[0].submit();	
//	cerrarVentana();	
}

function cerrarVentana(){
//	window.open('','_parent','');
	window.close(); 
}

</SCRIPT>  

</head>

<body>
<% 
 if ( !error.getERRNUM().equals("0")  ) {
     error.setERRNUM("0");
     out.println("<SCRIPT Language=\"Javascript\">");
     out.println("       showErrors()");
     out.println("</SCRIPT>");
 }
%>

<h3 align="center"><img src="<%=request.getContextPath()%>/images/e_ibs.gif" align="left" name="EIBS_GIF" title="asign_convenio.jsp,EPV0150"></h3>
<hr size="4">
<p>&nbsp;</p>
<p>&nbsp;</p>

<form method="POST" action="<%=request.getContextPath()%>/servlet/datapro.eibs.salesplatform.JSEPV0150">
<input type="hidden" id="SCREEN" name="SCREEN" value="701"> 
<input type="hidden" id="CusNum" name="CusNum" value="<%= userPO.getCusNum()%>"> 
 
<table id="TBHELPN" width="100%" border="0" cellspacing="0"
	cellpadding="0" style="margin-left: center; margin-right: center;">
	<tr>
  		<td align=CENTER width="48%"> 
    		<div align="right">Convenio :</div>
    	</td>
    	<td align=CENTER width="52%"> 
    		<div align="left">
     			<input type="text" name="E01CCNCOD" size="5" maxlength="4" value="<%= msg.getE01CCNCOD().trim()%>" onchange="goAction('701');">
          		<a href="javascript:GetCodeDescDeal('E01CCNCOD','E01CCNDSC','E01CCNFL1')"><img id="HELP" src="<%=request.getContextPath()%>/images/1b.gif" title="Ayuda" align="bottom" border="0" ></a> 
          		<input type="hidden" name="E01CCNDSC" value="">
          		<input type="hidden" name="E01CCNFL1" value="">
      		</div>
    	</td>
    </tr>
  	<tr> 
    	<td align=center nowrap colspan="2"> 
    		<input id="EIBSBTN" type=button name="Submit" value="Enviar" onClick="goAction('701');">
    	</td>
	</tr>
</table>

</form>
</body>
<script type="text/javascript">
clickElementID("HELP");

(function setCustomer(){
	if(!parseFloat(getElement('CusNum').value) > 0){
		if(isValidObject(oForm["E01DEACUN"])){
			getElement('CusNum').value = oForm["E01DEACUN"].value;
		} else if(isValidObject(oForm["E01ACMCUN"])){
			getElement('CusNum').value = oForm["E01ACMCUN"].value;
			convenioInptNme = "E01ACMCNV";

		} else if(isValidObject(oForm["E01PACCUN"])){
			getElement('CusNum').value = oForm["E01PACCUN"].value;
			convenioInptNme = "E01PACCNV";
		}		
	}
})();


(function findConvenioInputNames(){
<%-- Assign Convenio Input values so, for goAction function to find correct fields in opener.--%>
	if(isValidObject(oForm["E01DEACUN"])){
		convenioInptNme = "E01DEACNV";
		convenioInptDsc = "E01DSCCNV";
		convenioInptFl1 = "E01CNVFL1";
	} else if(isValidObject(oForm["E01ACMCUN"])){
		convenioInptNme = "E01ACMCNV";
	} else if(isValidObject(oForm["E01PACCUN"])){
		convenioInptNme = "E01PACCNV";
	}		
})();

</script>

</html>

